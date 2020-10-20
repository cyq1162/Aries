/// <reference path="/Style/JS/Aries.Loader.js" />
//AR.Combobox 定义
(function ($, $Core) {
    $Core.Lang || ($Core.Lang = {});
    var defaultItem = { text: $Core.Lang.select, value: "" };
    var comboOption = {
        valueField: 'value',
        textField: 'text',
        data: undefined,
        width: 150,
        editable: true,
        multiple: false
    }
    //获取下拉框的所有参数
    function _getOption($input) {
        var op = $.extend(true, {}, comboOption);//克隆一份。
        $input.attr("width") && (op.width = $input.attr("width"));
        $input.attr("multiple") == "multiple" && (op.multiple = true);
        $input.attr("editable") == "false" && (op.editable = false);
        //自定义属性
        op.key = $input.attr("configkey") || $input.attr("objname");
        op.defaultItem = $input.attr("defaultitem") != "false";
        op.parent = $input.attr("parent");
        op.para = $input.attr("para");
        op.tree = $input.attr("tree") == "true";
        //op.defaultIndex = $input.attr("defaultindex");
        if ($input.attr("onlytext") == "true") {
            op.onlyText = true;
            op.valueField = "text";
        }

        op.cascade = $input.attr("cascade") != "false";//是否能引发级联
        //行内编辑使用
        op.isEditor = $input.attr("isEditor");
        op.gridid = $input.attr("gridid");
        return op;
    }
    function bindConfigKey($input) {
        if (!$Core.Global.Variable.isLoadCompleted) {
            setTimeout(function () { bindConfigKey($input) }, 5);
            return;
        }
        var op = _getOption($input);
        var key = op.key;
        if (key && $Core.Config.data[key]) {
            var items = $Core.Config.data[key];//获取数据
            op.data = $Core.Utility.cloneArray(items, true);
            if (!op.tree && op.defaultItem && (op.data.length == 0 || op.data[0][op.textField] != defaultItem.text)) {
                op.data.unshift(defaultItem);
            }
            regEvent($input, op);
            parseToCombo($input, op);
        }
    }
    //绑定
    function bindObjName($input) {
        var comboxData = $Core.Combobox.data;
        if (comboxData) {
            var op = _getOption($input);
            //这里不处理子集下拉框，在后面递归一次性处理
            if (op.parent) { return; }
            if (comboxData[op.key]) {
                op.data = $Core.Utility.cloneArray(comboxData[op.key], true);//克隆，避免后续追加的请选择影响原有数据。
            }
            if (!op.tree && op.defaultItem && op.data && (op.data.length == 0 || op.data[0][op.textField] != defaultItem.text)) {
                op.data.unshift(defaultItem);
            }
            _cascadeBindCombo($input, op);
        }
    }
    //获取子级控制列表
    function getChildInputs($input) {
        var $childInputs = [];
        var op = _getOption($input);
        if (op.isEditor && op.gridid) {
            //如果是行内编辑的下拉
            var dg = $Core.Global.DG.Items[op.gridid];
            if (dg) {
                var rowEditors = dg.datagrid("getEditors", dg.PKColumn.Editor.editIndex);
                for (var i = 0, len = rowEditors.length; i < len; i++) {
                    if (rowEditors[i].target.attr("parent") == op.key) {
                        $childInputs.push(rowEditors[i].target);
                    }
                }
            }
        }
        else {
            var $items = $("[parent='" + op.key + "']");
            $items.each(function () {
                $childInputs.push($(this));
            });
        }
        return $childInputs;
    }
    //级联绑定共用函数部分
    function _cascadeBindCombo($input, op) {
        //判断是否级联模式（存在下级节点）
        var childInputs = getChildInputs($input);

        regEvent($input, op, childInputs);

        if (!op.tree && $input.hasClass("combobox-f")) {
            resetEvent($input, op);
            setAttr($input, "loadData", op.data);
            var value = $input.attr("defaultValue");//重新赋值(处理上级设置了默认值，之后二次赋值的情况）。
            if (value != undefined) {
                $input.removeAttr("defaultValue");
                setAttr($input, "select", value);
            }
        }
        else {
            parseToCombo($input, op);
        }
    }
    function regEvent($input, op, childInputs) {
        op.onSelect = function ($box, op, childs) {
            return function (record, checked) {
                var event = eval($box.attr("onchange"));
                if (typeof (eval(event)) == "function") {
                    if (record.id != undefined) { record.value = record.id; }
                    if (op.multiple) {
                        record.values = setAttr($box, "getValues");
                        record.texts = setAttr($box, "getText");
                    }
                    eval(event).call(this, record, checked == undefined ? true : checked);
                }
                if (op.multiple) {
                    filterEmptyItem($box);
                }
                if (op.cascade && childs && childs.length > 0) {
                    var pid = record[op.valueField];
                    $.each(childs, function (index, $child) {
                        reBindChild($child, pid, op);
                    });
                    resetChildBox($box);
                }
            }
        }($input, op, childInputs);
        if (op.multiple) {
            if (op.tree) {
                op.onCheck = op.onSelect;
                op.onSelect = undefined;//取消选择事件。
            }
            else {
                op.onUnselect = function ($box, op, childs) {
                    return function (record, checked) {
                        var event = eval($box.attr("onchange"));
                        if (typeof (eval(event)) == "function") {
                            if (record.id != undefined) { record.value = record.id; }
                            if (op.multiple) {
                                record.values = setAttr($box, "getValues");
                                record.texts = setAttr($box, "getText");
                            }
                            eval(event).call(this, record, false);
                        }
                        if (op.cascade && childs && childs.length > 0) {
                            var pid = record[op.valueField];
                            $.each(childs, function (index, $input) {
                                var orignalData = $.data($input[0], "combobox").data;
                                var selectedValues = setAttr($input, "getValues");
                                var sign = false;//标记开始删除
                                lv1: for (var i = (orignalData.length - 1) ; i > 0; i--) {
                                    if (orignalData[i].parent == pid) {
                                        //判断值是否在集合内，并删除。
                                        selectedValues.remove(orignalData[i].value);
                                        setAttr($input, "unselect", orignalData[i].value);
                                        orignalData.splice(i, 1);
                                        sign = true;
                                        continue;
                                    }
                                    if (sign) { //如果已删除完成直接结束循环；
                                        break lv1;
                                    };
                                }
                                setAttr($input, "clear");//清空已选中的值
                                setAttr($input, "loadData", orignalData);//重新加载数据
                                //重新填充值
                                if (selectedValues.length == 0) {
                                    setAttr($input, "select", "");
                                }
                                else {
                                    for (var i = 0; i < selectedValues.length; i++) {
                                        var v = selectedValues[i];
                                        setAttr($input, "select", v);
                                    }
                                }
                            });
                        }
                        if (setAttr($input, "getValues").length == 0) {
                            setAttr($input, "select", "");
                        }
                    }
                }($input, op, childInputs);
            }
        }
    }
    function resetEvent($input, op) {
        var opt = setAttr($input, "options");
        if (opt) {
            op.onSelect && (opt.onSelect = op.onSelect);
            op.onUnselect && (opt.onUnselect = op.onUnselect);
        }
    }
    //级联的绑定
    function reBindChild($input, pid, parentOp) {
        var op = _getOption($input);
        if (!pid && pid != "0") {
            _reBindChild($input, op, [], parentOp);//绑定空数组。
            return;
        }
        var ds = $Core.Combobox.data;
        var data = ds[op.key];
        data && (data = data.select("parent", pid));
        if (data && data.length > 0) {
            _reBindChild($input, op, data, parentOp);
        }
        else {
            //远程读取
            var json = [{ ObjName: op.key, Parent: pid, Para: op.para }];
            request(json, function () {
                return function () {
                    var data = $Core.Combobox.data[op.key] || [];
                    data && (data = data.select("parent", pid) || []);
                    _reBindChild($input, op, data, parentOp);
                }
            }($input, op, parentOp, pid));
        }
    }
    //多级联下拉处理---------------------------------
    function _reBindChild($input, op, data, parentOp) {
        //如果父级为多选逻辑处理
        var isAddDefaultItem = true;
        if (parentOp.multiple) {
            var orignalData = [];
            if ($input.hasClass("combo-f")) {
                orignalData = setAttr($input, "getData");
            }
            if (orignalData.length > 0) {
                data = orignalData.concat(data);//合并新增数据
                isAddDefaultItem = false;
            }
        }
        //else {
        //    //增加此属性，用于在_cascadeBindCombo绑定时采用重新绑定，而不是追加数据。
        //    op.parentIsSingle = true;
        //}
        op.data = data;
        if (isAddDefaultItem && !op.tree && op.defaultItem && (op.data.length == 0 || op.data[0][op.textField] != defaultItem.text)) {
            op.data.unshift(defaultItem);//添加请选择
        }
        op.onLoadSuccess = function () {
            setAttr($input, "textbox").removeClass("validatebox-invalid");
        };
        _cascadeBindCombo($input, op);
    }
    //将下级重置为请选择(递归触发事件)
    function resetChildBox($input) {
        var childInputs = getChildInputs($input);
        if (childInputs.length == 0) { return; }
        $.each(childInputs, function (index, $box) {
            setAttr($box, "clear");
            if ($box.attr('onlytext') == 'true') {
                setAttr($box, "select", defaultItem.text);
            }
            else {
                setAttr($box, "select", "");
            }
            return resetChildBox($box);
        })
    }

    //多选的选中值过滤
    function filterEmptyItem($target) {
        var arrayValue = setAttr($target, "getValues");
        if (arrayValue && arrayValue.length > 1 && hasEmpty(arrayValue)) {
            setAttr($target, "setValues", removeEmpty(arrayValue));
        }
    }
    //检查空值
    function hasEmpty(array) {
        if (array.length > 1) {
            for (var i = 0; i < array.length; i++) {
                if (array[i] == "") {
                    return true;
                }
            }
        }
        return false;
    }
    //过滤空值
    function removeEmpty(array) {
        for (var i = array.length - 1; i >= 0; i--) {
            if (array[i] == "") {
                array.splice(i, 1);
                break;
            }
        }
        return array;
    }
    /*
      objNames    ： 对象名数组
      onAfter :  回调函数
   */

    function request(objNames, onAfter) {

        if (!objNames && objNames.length == 0) {
            onAfter && onAfter({});
            return;
        }
        //检测当前页面是否已经有过相同的请求
        var objNameArray = $Core.Combobox.requestObjNames;
        if (objNameArray.length == 0) {
            for (var i = 0; i < objNames.length; i++) {
                objNameArray.push(objNames[i]);
            }
        }
        else {
            var removeItems = [];
            for (var i = 0; i < objNames.length; i++) {
                var newObj = objNames[i];
                if ($Core.Combobox.paras && $Core.Combobox.paras[newObj.ObjName])
                {
                    newObj.Para = $Core.Combobox.paras[newObj.ObjName];
                    //delete $Core.Combobox.paras[newObj.ObjName];
                }
                var oldObj = objNameArray.get("ObjName", newObj.ObjName);
                if (oldObj) {
                    if (((!oldObj.Parent && !newObj.Parent) || oldObj.Parent == newObj.Parent)
                        && ((!oldObj.Para && !newObj.Para) || oldObj.Para == newObj.Para)) {
                        removeItems.push(newObj);
                        objNames.splice(i, 1);
                        i--;
                    }
                }
                else {
                    objNameArray.push(newObj);
                }
            }
            if (objNames.length == 0) {
                for (var i = 0; i < removeItems.length; i++) {
                    if (!$Core.Combobox.data[removeItems[i].ObjName]) {
                        setTimeout(function () {
                            request(removeItems, onAfter);
                        }, 100);
                        return;//循环等待上一个请求完成。
                    }
                }
                onAfter && onAfter();
                return;
            }
        }
        var postData = { sys_json: JSON.stringify(objNames) };
        var result = Array();
        //此处变更为异步。
        $Core.Ajax.post("GetCombobox", null, postData, function (result) {
            if (result) {
                var comboxData = $Core.Combobox.data;
                for (var objName in result) {
                    if (comboxData[objName]) {
                        var resultData = result[objName];
                        var boxData = comboxData[objName];
                        for (var i = 0; i < resultData.length; i++) {
                            if (resultData[i].value != undefined) {
                                if (!boxData.contains(resultData[i].value, "value")) {
                                    comboxData[objName].push(resultData[i]);
                                }
                            }
                            else {
                                if (!boxData.contains(resultData[i].text, "text")) {
                                    comboxData[objName].push(resultData[i]);
                                }
                            }

                        }
                    }
                    else {
                        comboxData[objName] = result[objName];
                    }
                }
            }
            onAfter && onAfter(result);
        });

    }
    //初始化配置Key的下拉框数据。
    initConfigKeyCombobox = function () {
        if (!$Core.Global.Variable.isLoadCompleted) {
            setTimeout(function () { initConfigKeyCombobox() }, 5);
            return;
        }
        $("[configkey]").each(function () {
            if (!$(this).attr("comboname")) {
                bindConfigKey($(this));
            }
        });
        $Core.Combobox.onAfterExecute("configkey");
    }

    initObjNameCombobox = function () {
        //提交请求获取数据
        var objNames = [];
        var checkData = [];
        $("[objname]").each(function () {
            var objName = $(this).attr("objname");
            var parent = $(this).attr("parent");
            var para = $(this).attr("para") || "";
            if (objName && objName.length != 0 && parent == undefined) {
                var checkKey = objName.toString().toLowerCase() + "_" + para.toString().toLowerCase();
                if (!checkData.contains(checkKey)) {
                    checkData.push(checkKey);
                    var item = { ObjName: objName, Parent: "", Para: para };
                    objNames.push(item);
                }
            }
        });
        checkData = null;
        if (objNames.length > 0) {
            request(objNames, function () {
                $("[objname]").each(function () {
                    if (!$(this).attr("parent")) {
                        bindObjName($(this));
                    }
                });
                $Core.Combobox.onAfterExecute("objname");
            });
        }
    };
    initDialogCombobox = function () {
        $("[dialog]").each(function () {
            bindDialog($(this));
        });
    }
    function bindDialog($input) {
        $input.on("click", function () {
            showDialog($input);
        });
    }
    function showDialog($input) {
        if (!$input || !$input.attr("dialog")) { alert("dialog setting error!"); return; }
        var href = ($Core.Global.Variable.ui || "") + "/Web/SysAdmin/DialogView.html?objName=" + $input.attr("dialog");
        var html = '<iframe scrolling="yes" frameborder="0"  src="' + href + '" style="width:100%;height:98%;"></iframe>'
        var opts = {
            toolbar: [{
                text: $Core.Lang.ok,
                iconCls: 'icon-ok',
                handler: function () {
                    var options = $Core.Dialog;
                    if (!options || options.option.data.length == 0) {
                        alert($Core.Lang.selectFirst);
                        return;
                    }
                    if ($Core.Dialog.onAfterExecute($input, true) != false) {
                        //先处理valueFor和textFor
                        var vID = $input.attr("valueFor");
                        var tID = $input.attr("textFor");
                        if (vID) {
                            var $vInput = $.el(vID);
                            $vInput && $vInput.val(options.value);
                        }
                        if (tID) {
                            $tInput && $tInput.val(options.text);
                        }

                        if ($input.attr("multiple")) {
                            options.option.onUnselect = function (record) {
                                if (setAttr($(this), "getValues").length == 0) {
                                    if (!$input.attr("for")) {
                                        showDialog($input);//对多选生效
                                    }
                                }
                            };
                        }
                        else {
                            options.option.onSelect = function (record) {
                                if (!$input.attr("for")) {
                                    showDialog($input);//对单选生效
                                }
                            };
                        }
                        //按钮点击，结果绑定到指到的文本框。
                        var id = $input.attr("for");
                        var $targetInput;
                        if (id) {
                            $targetInput = $.el(id);
                        }
                        if (!$targetInput) $targetInput = $input;
                        if ($targetInput.attr("width")) {
                            options.option.width = $targetInput.attr("width");
                        }
                        else if ($targetInput.css("width")) {
                            options.option.width = $targetInput.css("width");
                        }
                        setAttr($targetInput, options.option);//生成下拉框架
                        var value = $input.attr("onlytext") ? options.text : options.value;
                        setComboValue($targetInput, value);
                        var $childInput = $targetInput.next().children(':first');
                        if (!$childInput.data("events")["dblclick"]) {
                            $childInput.dblclick(function () {
                                showDialog($input);//绑定双击事件
                            });
                        }
                    }
                    $("#_div_dialog").dialog("destroy");
                }
            }, {
                text: $Core.Lang.cancel,
                iconCls: 'icon-no',
                handler: function () {
                    if ($Core.Dialog.onAfterExecute($input, false) != false) {
                        $("#_div_dialog").dialog("destroy");
                    }
                }
            }],
            closable: false
        };
        if ($input.attr("options")) {
            opts = $.extend(opts, eval('(' + $input.attr("options") + ')'));
        }
        $Core.Dialog.options = opts;
        $Core.Dialog.$target = $input;
        $Core.Dialog.clearReturnValue();//清空值。
        $Core.Window.dialog($Core.Lang.selectData, html, opts);

    };




    function setParas(data) {
        $Core.Combobox.paras = data;
    }
    /**
         * 基础节点数据 =》 Combox Tree 的格式数据。
         *将普通数组转成树形数组，根据数组内对象的id跟parent属性过滤
         *@nodes {array} nodes
         *@return {array} 树形数组
        */
    //获取下拉树形递归,nodes参数是一个对象数组，根据对象的id跟parent属性过滤
    function getTree(nodes) {
        return function (pid) {
            pid || (pid = ''); //undefined,null,都转''处理
            var cn = new Array();
            var isfirstOpen = false;
            for (var i = 0; i < nodes.length; i++) {
                var n = nodes[i];
                if (n.value == undefined) { continue; }
                n.parent || (n.parent = '')
                if (n.parent == pid) {
                    n.id = n.value;
                    n.children = arguments.callee(n.id);
                    if (n.children.length > 0) {
                        if (!isfirstOpen) {
                            isfirstOpen = true;
                        }
                        else {
                            n.state = 'closed';//第一个保持打开
                        }
                    }
                    cn.push(n);
                }
            }
            return cn;
        }(undefined);
    }
    function parseToCombo($box, op) {
        if (op.tree) {
            op.data = getTree(op.data);
            $box.combotree(op);
        }
        else {
            $box.combobox(op);
        }

        var value = $box.attr("defaultValue");//重新赋值。
        if (value && op.data.contains(value, "value")) {
            $box.removeAttr("defaultValue");
            setAttr($box, "select", value);//-------下面延时再重设一次值、怕网络太慢保险起见-------
            setTimeout(function () {
                var hasSetValue = $box.attr("hasSetValues", 1);
                if (hasSetValue) {
                    $box.removeAttr("hasSetValues");
                }
                else {
                    setAttr($box, "select", value);
                }
            }, 5);
        }
        else if (!op.tree && op.data && op.data.length > 0) { setAttr($box, "select", op.data[0][op.valueField]); }
    }
    function setComboValue($box, value) {

        setAttr($box, "clear");
        if (value == undefined) { return; }
        var tree = $box.attr("tree") || $box.attr("class") == "tree";
        if (!tree && value.toString().indexOf(',') > -1 && value.toString().split(',').length > 1) {
            value = value.split(',');

            for (var i = 0; i < value.length; i++) {
                setAttr($box, "select", value[i]);//用select 需要触发级联，但是事件会触发多次。
            }
            // setAttr($box, "setValues", value.toString().split(','));
        }
        else {
            setAttr($box, "select", value.toString());
        }

        // var hasDefaultValue = $box.attr("defaultValue") != undefined;
        if ($box.attr("parent") != undefined && $box.attr("defaultValue") == undefined) {
            // alert(1);
            // if (!hasDefaultValue) {

            var opData = setAttr($box, "getData");// 级联和设值（不知道谁先执行的，所以检测是否绑定了数据，如果还未绑定，先把值设置为默认值）
            if (opData.length <= 1) {
                $box.attr("defaultValue", value);

            }
            // }
        }
        $box.attr("hasSetValues", 1);
    }
    function setAttr($box, key, value, isTree) {
        var tree = isTree || $box.attr("tree") || $box.attr("class") == "tree";
        var multiple = $box.attr("multiple");
        if (tree) {
            if (key == "select" && value) {
                if (multiple && typeof value == "string" && value.indexOf(',') > -1) {
                    key = "setValues";
                    value = value.split(',');
                }
                else {
                    key = "setValue";
                }
            }
            switch (key) {
                case "getData":
                    return undefined;
            }
            try {
                if (value == undefined) {
                    return $box.combotree(key);
                }
                else {
                    return $box.combotree(key, value);
                }
            } catch (e) {
                return undefined;
            }
        }
        else {

            try {
                if (value == undefined) {

                    return $box.combobox(key);

                }
                else {
                    if (key == "select" && value=="true" || value=="false")
                    {
                        var data = $box.combobox("getData")
                        if (!data.contains(value, "value")) {
                            value = value == "true" ? "1" : "0";
                        }
                    }
                    return $box.combobox(key, value);
                }
            } catch (e) {
                return undefined;
            }
        }
    }

    function bind($input) {
        if ($input.attr("configkey") || $input.attr("configKey")) {
            bindConfigKey($input);
        }
        else if ($input.attr("objname") || $input.attr("objName")) {
            bindObjName($input);
        }
        else if ($input.attr("dialog")) {
            bindDialog($input);
        }
    }
    //获取下拉某个项的值或文本，type为0，取value，type为1,取text
    function _getObjKeyOrValue(objName, v, type) {
        var obj = $Core.Combobox.data[objName];
        if (obj == undefined) { return undefined; }
        var value = v;
        if ($.type(obj) == "object") {
            obj = [obj];
        }
        var value = "value", text = "text";
        if (type == 1) { value = "text", text = "value"; }
        if (v.toString().indexOf(',') != -1) {
            var array = v.split(','), result = [];
            for (var i = 0; i < obj.length; i++) {
                if (array.contains(obj[i][text])) {
                    result.push(obj[i][value]);
                }
            }
            if (result.length > 0) {
                value = result.join(',');
            }
        } else {
            for (var i = 0; i < obj.length; i++) {
                if (obj[i][text] == v) {
                    value = obj[i][value];
                    break;
                }
            }
        }
        return value;
    }
    function _getInput(idOrNameOrJq) {
        if (!idOrNameOrJq) { return undefined; }
        var $input = idOrNameOrJq;
        if (typeof idOrNameOrJq == "string") {
            $input = $("#" + idOrNameOrJq);
            if (!$input || !$input[0]) {
                $input = $("input[comboname='" + idOrNameOrJq + "']") || $("input[name='" + idOrNameOrJq + "']");
            }
        }
        else if ($input[0] == undefined) {
            $input = $($input);
        }
        return $input;
    }
    /*下拉框操作*/
    $Core.Combobox = {
        onInit: function () {
            initConfigKeyCombobox();//初始化configKey配置的项
            initObjNameCombobox();//初始化objName配置的项
            initDialogCombobox();//初始化dialog配置的项
            if (parent.AR) {
                this.data = parent.AR.Combobox.data;
                this.requestObjNames = parent.AR.Combobox.requestObjNames;
            }
        },
        //获取全局请求的objNames(内部缓存使用)
        requestObjNames: [],
        //存档objname下拉数的数据{objnameA:[],objnameB:[]...}。
        data: {},
        /*
       重载一：获取下拉翻译的文本：参数为objName,value
       重载二：获取下拉值当前文本，仅传一个参数时为：id or name or $input，第二参数忽略
       */
        getText: function (objName, value) {
            if (!objName) { return ""; }
            if (value != undefined) {
                var result = _getObjKeyOrValue(objName, value, 1);
                if (result == undefined) {
                    result = $Core.Config.getText(objName, value);
                }
                return result;
            }
            var $input = _getInput(objName);
            var v = this.getValue($input);
            objName = $input.attr("objName") || $input.attr("configKey");
            if (objName && v != undefined) {
                return this.getText(objName, v);
            }
            else if (!objName && $input) {
                if ($input.attr("comboname") == undefined) {
                    return $input.val()
                }
                else {
                    return setAttr($input, "getText");
                }
            }
            return "";
        },
        /*
        重载一：获取下拉翻译值：参数为objName,text
        重载二：获取下拉值当前值，仅传一个参数时为：id or name or $input，第二参数忽略
        */
        getValue: function (objName, text) {
            if (!objName) { return ""; }
            if (text != undefined) {
                var result = _getObjKeyOrValue(objName, text, 0);
                if (result == undefined) {
                    result = $Core.Config.getValue(objName, text);
                }
                return result;
            }
            var $input = _getInput(objName);
            if ($input) {
                if ($input.attr("comboname") == undefined) {
                    return $input.val()
                }
                else {
                    return setAttr($input, "getValues").join(',');
                }
            }
            return "";
        },
        // 为下拉框设置属性事件等属性：参数：$box, key, value, isTree
        setAttr: setAttr,
        //setParas({ "C_SYS_Table": tableNames, "C_SYS_Column": tableNames }) 为下拉参数数据增加过滤条件
        setParas: setParas,

        //为下拉框设置值：{name1:value1,name2:value2}
        setValues: function (data) {
            if (data && JSON.stringify(data) != "{}") {
                var reg_date = /^\d{4}(-|\/)\d{2}(-|\/)\d{2}\s?.*$/;
                for (var k in data) {
                    var value = data[k];
                    if (k == "toString") { break; }
                    if (value != undefined && !reg_date.test(value)) {
                        var $input = $("[comboname='" + k + "']");
                        if ($input.length > 0) {
                            $input.each(function () {
                                setComboValue($(this), value);
                            });
                        }
                        else {
                            $input = $("[name='" + k + "']");
                            $input.attr("defaultValue", value);
                        }
                    }
                }
            }
        },
        //下拉绑定后触发的事件：AR.Combobox.onAfterExecute = function (type) {type为：configkey,objname 二者之一}
        onAfterExecute: function (type) { },//定义绑定的事件。,
        /*
        objNames    ： 对象名数组:[{ObjName:xxx,Para:xxx},{ObjName:xxx2,Para:xxx2}...]
        onAfter :  回调函数
         */
        request: request,
        //外部通用方法，绑定一个下拉框(参数：$input)
        bind: bind,
        //为单独的下拉值赋值：参数：$input,value
        setValue: setComboValue
    };
})(jQuery, AR);