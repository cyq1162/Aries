//AR.Combobox 定义
(function ($, $Core) {
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
        op.tree = $input.attr("tree") == "true";
        //op.defaultIndex = $input.attr("defaultindex");
        if ($input.attr("onlytext") == "true") {
            op.onlyText = true;
            op.valueField = "text";
        }

        var selFun = eval($input.attr("onchange"));
        if (typeof (eval(selFun)) == "function") {
            op.onSelect = eval(selFun);
        }
        return op;
    }
    function bindConfigKey($input) {
        if (!$Core.Global.Variable.isLoadCompleted) {
            setTimeout(function () { bindConfigKey($input) }, 5);
            return;
        }
        var op = _getOption($input);
        var key = op.key;
        if (key && $Core.Global.Config[key]) {
            var items = $Core.Global.Config[key];//获取数据
            op.data = $Core.Utility.cloneArray(items,true);
            if (!op.tree && op.defaultItem) {
                op.data.unshift({ text: "请选择", value: "" });
            }
            bindCombo($input, op);
        }
    }
    //绑定
    function bindObjName($input) {
        var comboxData = $Core.Global.comboxData;
        if (comboxData && comboxData.length > 0) {
            var op = _getOption($input);
            //这里不处理子集下拉框，在后面递归一次性处理
            if (op.parent) { return; }
            //var $target = $input, data;//.addClass(".easyui-combobox")
            for (var i = 0; i < comboxData.length; i++) {
                if (comboxData[i][op.key]) {
                    op.data = $Core.Utility.cloneArray(comboxData[i][op.key], true);//克隆，避免后续追加的请选择影响原有数据。
                    break;
                }
            }
            if (!op.tree && op.defaultItem && (op.data.length == 0 || op.data[0][op.textField] != "请选择")) {
                op.data.unshift({ text: "请选择", value: "" });
            }
            _cascadeBindCombo($input, op);
        }
    }
    //级联绑定共用函数部分
    function _cascadeBindCombo($input, op) {
        //判断是否级联模式
        var $parent = $("[parent='" + op.key + "']");
        if ($parent && $parent.length > 0) {
            op.onSelect = function ($p, $box, op) {
                return function (record) {
                    var pid = record[op.valueField];
                    var selFun = eval($(this).attr("onchange"));
                    if (typeof (eval(selFun)) == "function") {
                        eval(selFun).call(this, record);
                    }
                    if (op.multiple) {
                        filterEmptyItem($(this));
                    }
                    $p.each(function () {
                        reBind(pid, $(this), op);
                    });
                    triggerSelect($box);

                }
            }($parent, $input, op);

            if (op.multiple) {
                op.onUnselect = function ($p, $box, op) {
                    return function (record) {
                        var unSelFun = eval($(this).attr("unchange"));
                        if (typeof (eval(unSelFun)) == "function") {
                            eval(unSelFun).call(this, record);
                        }
                        var pid = record[op.valueField];
                        $p.each(function () {
                            var orignalData = $.data(this, "combobox").data;
                            var selectedValues = setCombo($(this), "getValues");
                            var sign = false;//标记开始删除
                            lv1: for (var i = (orignalData.length - 1) ; i > 0; i--) {
                                if (orignalData[i].parent == pid) {
                                    //判断值是否在集合内，并删除。
                                    selectedValues.remove(orignalData[i].value);
                                    setCombo($(this), "unselect", orignalData[i].value);
                                    orignalData.splice(i, 1);
                                    sign = true;
                                    continue;
                                }
                                if (sign) { //如果已删除完成直接结束循环；
                                    break lv1;
                                };
                            }
                            setCombo($(this), "clear");//清空已选中的值
                            setCombo($(this), "loadData", orignalData);//重新加载数据
                            //重新填充值
                            if (selectedValues.length == 0) {
                                setCombo($(this), "select", "");
                            } else {
                                for (var i = 0; i < selectedValues.length; i++) {
                                    var v = selectedValues[i];
                                    setCombo($(this), "select", v);
                                }
                            }
                        });
                        if (setCombo($(this), "getValues").length == 0) {
                            setCombo($(this), "select", "");
                        }
                    }
                }($parent, $input, op);
            }
        }
        else if (op.multiple) {
            registerMultiEvent(op);
        }
        if (op.multiple && $input.hasClass("combobox-f")) {
            setCombo($input, "loadData", op.data);
        } else {
            bindCombo($input, op);
        }
    }

    function loadComboboxData(item_data, condition, onLoadedEvent) {
        var comboxData = $Core.Global.comboxData;
        //此判断是因为List跟Edit的请求方式不一样
        if (condition == undefined && comboxData.length > 0) {
            var _removeIndex = new Array();//需要移除的项
            for (var i = 0; i < comboxData.length; i++) {
                for (var k in comboxData[i]) {
                    if (k == undefined) continue;
                    for (var j = 0; j < item_data.length; j++) {
                        for (var kk in item_data[j]) {
                            if (kk && k == item_data[j][kk]) {
                                _removeIndex.push(j);
                            }
                        }
                    }
                }
            }
            if (_removeIndex.length > 0) {
                for (var i = _removeIndex.length; i > 0 ; i--) {
                    item_data.splice(_removeIndex[i], 1);
                }
            }
        }
        //结束请求，开始渲染
        if (item_data.length > 0) {
            var _post_data = { sys_json: JSON.stringify(item_data) };
            var result = Array();
            if (condition) {
                _post_data = $.extend({}, _post_data, condition);
            }
            //此处变更为异步。
            $Core.Utility.Ajax.post("GetCombobox", null, _post_data, null, null, function (result) {
                if (!(result instanceof Array)) {
                    result = [result];
                }

                for (var i = 0, len = result.length; i < len; i++) {
                    for (var k in result[i]) {
                        var flag = true;
                        for (var ii = 0; ii < comboxData.length; ii++) {
                            for (var kk in comboxData[ii]) {
                                if (kk == k) {
                                    comboxData[ii][kk] = result[i][k];
                                    flag = false;
                                }
                            }
                        }
                        if (flag == true) {
                            $Core.Global.comboxData = $Core.Global.comboxData.concat(result[i]);
                        }
                    }
                }

                if (comboxData && !(comboxData instanceof Array)) {
                    $Core.Global.comboxData = [comboxData];
                }
                onLoadedEvent && onLoadedEvent();
            });

        }
    }

    //多级联下拉处理---------------------------------
    function reBind(pid, $input, parentOp) {
        var ds = $Core.Global.comboxData;
        var op = _getOption($input);
        var boxData; var new_data = [];
        for (var i = 0; i < ds.length; i++) {
            if (ds[i][op.key]) {
                boxData = ds[i][op.key];
                for (var j = 0; j < boxData.length; j++) {
                    if (boxData[j].parent == pid) {
                        new_data.push(boxData[j]);
                    }
                }
                break;
            }
        }
        //如果父级为多选逻辑处理
        var isAddDefaultItem = true;
        if (parentOp.multiple) {
            var orignalData = [];
            if ($input.hasClass("combo-f")) {
                orignalData = setCombo($input, "getData");
            }
            if (orignalData.length > 0) {
                new_data = orignalData.concat(new_data);
                isAddDefaultItem = false;
            }
        }
        op.data = new_data;
        if (isAddDefaultItem && !op.tree && op.defaultItem && (op.data.length == 0 || op.data[0][op.textField] != "请选择")) {
            op.data.unshift({ text: "请选择", value: "" });
        }
        op.onLoadSuccess = function () {
            setCombo($input, "textbox").removeClass("validatebox-invalid");
        };
        _cascadeBindCombo($input, op);

    }
    //递归触发事件(将下级重置为请选择)
    function triggerSelect($input) {
        $("[parent='" + $input.attr('objname') + "']").each(function () {
            var $box = $(this);
            if ($box.attr('onlytext') == 'true') {
                setCombo($box, "select", "请选择");
            }
            else {
                setCombo($box, "select", "");
            }
            return triggerSelect($box);
        })
    }
    //侦测数据是否已经存在
    function detectArray(array, objKey, currentKey) {
        var flag = false;
        for (var i in array) {
            if (array[i][objKey] == currentKey) {
                flag = true;
                break;
            }
        }
        return flag;
    }
    //多选默认注册事件
    function registerMultiEvent(opts) {
        opts.onSelect = function (record) {
            var selFun = eval($(this).attr("onchange"));
            if (typeof (eval(selFun)) == "function") {
                eval(selFun).call(this, record);
            }
            filterEmptyItem($(this));
        }
        opts.onUnselect = function () {
            var unSelFun = eval($(this).attr("unchange"));
            if (typeof (eval(unSelFun)) == "function") {
                eval(unSelFun).call(this, record);
            }
            if (setCombo($(this), "getValues").length == 0) {
                setCombo($(this), "select", "");
            }
        }
    }
    //多选的选中值过滤
    function filterEmptyItem($target) {
        var arrayValue = setCombo($target, "getValues");
        if (arrayValue.length > 1 && hasEmpty(arrayValue)) {
            setCombo($target, "setValues", filterArray(arrayValue));
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
    function filterArray(array) {
        for (var i = array.length - 1; i >= 0; i--) {
            if (array[i] == "") {
                array.splice(i, 1);
                break;
            }
        }
        return array;
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
        setValueToCombobox();
    }

    initObjNameCombobox = function () {
        //提交请求获取数据
        var item_data = [];
        $("[objname]").each(function () {
            var objName = $(this).attr("objname");
            var parent = $(this).attr("parent");
            if (objName && objName.length != 0) {//收集所有对象
                if (!detectArray(item_data, 'objname', objName)) {
                    var item = { ObjName: objName, Parent: parent };
                    item_data.push(item);
                }
            }
        });
        if (item_data.length > 0) {
            loadComboboxData(item_data, null, function () {
                $("[objname]").each(function () {
                    bindObjName($(this));
                });
                $Core.Combobox.onAfterExecute("objname");
                setValueToCombobox();
            });
        }
    };
    initDialogCombobox = function () {
        $("[dialog]").each(function () {
            $(this).on("click", function () {
                _showInputDialog($(this));
            });

        });
    }
    function _showInputDialog($input) {
        if (!$input || !$input.attr("dialog")) { alert("dialog参数配置错误!"); return; }
        var href = ($Core.Global.Variable.ui || "") + "/Web/SysAdmin/DialogView.html?objName=" + $input.attr("dialog");
        if ($input.attr("multiple")) {
            href += "&multiple=" + $input.attr("multiple");
        }
        if ($input.attr("onlytext")) {
            href += "&onlytext=" + $input.attr("onlytext");
        }
        if ($input.attr("editable")) {
            href += "&editable=" + $input.attr("editable");
        }
        var html = '<iframe scrolling="yes" frameborder="0"  src="' + ($Core.Global.Variable.ui || '') + href + '" style="width:100%;height:98%;"></iframe>'
        var opts = {
            toolbar: [{
                text: '保存',
                iconCls: 'icon-ok',
                handler: function () {
                    var options = document.all.returnValue;
                    if (!options || options.option.data.length == 0) {
                        alert('请先选中数据');
                        return;
                    }
                    if ($Core.Combobox.onAfterExecute("dialog", $input, options) != false) {
                        if ($input.attr("multiple")) {
                            options.option.onUnselect = function (record) {
                                if (setCombo($(this), "getValues").length == 0) {
                                    _showInputDialog($(this));//对多选生效
                                }
                            };
                        }
                        else {
                            options.option.onSelect = function (record) {
                                _showInputDialog($(this));//对单选生效
                            };
                        }

                        setCombo($input, options.option);
                        if ($input.attr("multiple")) {
                            setCombo($input, "setValues", options.values);
                        }
                        else {
                            setCombo($input, "select", options.values);
                        }
                    }
                    $("#_div_dialog").dialog("close");
                }
            }, {
                text: '取消',
                iconCls: 'icon-no',
                handler: function () { $("#_div_dialog").dialog("close"); }
            }],
            closable: false
        };
        if ($input.attr("options")) {
            opts = $.extend(opts, eval('(' + $input.attr("options") + ')'));
        }
        document.all.returnValue = undefined;//清空值。
        $Core.Utility.Window.dialog("选择数据", html, opts);

    };
    onAfterBind = function (type) { $Core.Combobox.isLoadCompleted = true; };//定义绑定的事件。
    //设置Easyui下拉框的值
    function setValueToCombobox() {
        var data = $Core.Combobox.values;
        if ($.type(data) == 'object') {
            var reg_date = /^\d{4}(-|\/)\d{2}(-|\/)\d{2}\s?.*$/;
            $("[comboname]").each(function () {
                var value = data[$(this).attr("comboname")];
                if (value != undefined && !reg_date.test(value)) {
                    try {
                        setCombo($(this), "clear");
                        if (value.toString().indexOf(',') != -1 && value.toString().split(',').length > 1) {
                            value = value.split(',');
                            for (var i = 0; i < value.length; i++) {
                                setCombo($(this), "select", value[i]);
                            }
                            setCombo($(this), "setValues", value.toString().split(','));
                        } else {
                            setCombo($(this), "select", value.toString());
                        }
                    } catch (e) { }
                }
            });
        }
    };
    function setValues(data) {
        $Core.Combobox.values = data;
    }
    function bindCombo($box, op) {
        if (op.tree) {
            op.data = $Core.Utility.getTree(op.data);
            $box.combotree(op);
        }
        else {
            $box.combobox(op);
        }
        if (!op.tree && op.data.length > 0) { setCombo($box, "select", op.data[0][op.valueField]); }
    }
    function setCombo($box, key, value, isTree) {
        var tree = isTree || $box.attr("tree");
        if (tree) {
            switch (key)
            {
                case "select":
                    key = "setValue"; break;
            }
            return $box.combotree(key, value);
        }
        else {
            return $box.combobox(key, value);
        }
    }
    $Core.Combobox = {
        onInit: function () {
            initConfigKeyCombobox();//初始化configKey配置的项
            initObjNameCombobox();//初始化objName配置的项
            initDialogCombobox();//初始化dialog配置的项
        },
        setValues: setValues,
        onAfterExecute: onAfterBind,
        values: {}
    };
})(jQuery, AR);