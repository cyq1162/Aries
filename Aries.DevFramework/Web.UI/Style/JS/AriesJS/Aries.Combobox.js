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
        op.para = $input.attr("para");
        op.tree = $input.attr("tree") == "true";
        //op.defaultIndex = $input.attr("defaultindex");
        if ($input.attr("onlytext") == "true") {
            op.onlyText = true;
            op.valueField = "text";
        }
        if (!op.multiple) {
            var selFun = eval($input.attr("onchange"));
            if (typeof (eval(selFun)) == "function") {
                op.onSelect = eval(selFun);
            }
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
            op.data = $Core.Utility.cloneArray(items, true);
            if (!op.tree && op.defaultItem) {
                op.data.unshift({ text: "请选择", value: "" });
            }
            bindCombo($input, op);
        }
    }
    //绑定
    function bindObjName($input) {
        var comboxData = $Core.Global.comboxData;
        if (comboxData) {
            var op = _getOption($input);
            //这里不处理子集下拉框，在后面递归一次性处理
            if (op.parent) { return; }
            if (comboxData[op.key]) {
                op.data = $Core.Utility.cloneArray(comboxData[op.key], true);//克隆，避免后续追加的请选择影响原有数据。
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

    function loadComboboxData(item_data, onLoadedEvent) {
        if (item_data.length > 0) {
            var _post_data = { sys_json: JSON.stringify(item_data) };
            var result = Array();
            //此处变更为异步。
            $Core.Utility.Ajax.post("GetCombobox", null, _post_data, function (result) {
                if (result) {
                    var comboxData = $Core.Global.comboxData;
                    for (var objName in result) {
                        if (comboxData[objName]) {

                            var resultData = result[objName];
                            var boxData = comboxData[objName];
                            for (var i = 0; i < resultData.length; i++) {
                                if (!boxData.contains(resultData[i].value, "value")) {
                                    comboxData[objName].push(resultData[i]);
                                }
                            }
                        }
                        else {
                            comboxData[objName] = result[objName];
                        }
                    }
                }
                onLoadedEvent && onLoadedEvent();
            });

        }
    }
    //级联的绑定
    function reBind(pid, $input, parentOp) {
        var op = _getOption($input);
        if (!pid && pid != "0") {
            _reBind(op, $input, parentOp, []);//绑定空数组。
            return;
        }
        var ds = $Core.Global.comboxData;
        var data = ds[op.key];
        data && (data = data.get("parent", pid));
        if (data && data.length > 0) {
            _reBind(op, $input, parentOp, data);
        }
        else {
            //远程读取
            var json = [{ ObjName: op.key, Parent: pid, Para: op.para }];
            loadComboboxData(json, function () {
                return function () {
                    var d = $Core.Global.comboxData[op.key] || [];
                    d && (d = d.get("parent", pid) || []);
                    _reBind(op, $input, parentOp, d);
                }
            }(op, $input, parentOp, pid));
        }
    }
    //多级联下拉处理---------------------------------
    function _reBind(op, $input, parentOp, data) {
        //如果父级为多选逻辑处理
        var isAddDefaultItem = true;
        if (parentOp.multiple) {
            var orignalData = [];
            if ($input.hasClass("combo-f")) {
                orignalData = setCombo($input, "getData");
            }
            if (orignalData.length > 0) {
                data = orignalData.concat(data);
                isAddDefaultItem = false;
            }
        }
        op.data = data;
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
        var checkData = [];
        $("[objname]").each(function () {
            var objName = $(this).attr("objname");
            var parent = $(this).attr("parent");
            var para = $(this).attr("para") || $Core.Combobox.paras[objName] || "";
            if (objName && objName.length != 0 && parent == undefined) {
                var checkKey = objName.toString().toLowerCase() + "_" + para.toString().toLowerCase();
                if (!checkData.contains(checkKey)) {
                    checkData.push(checkKey);
                    var item = { ObjName: objName, Parent: "", Para: para };
                    item_data.push(item);
                }
            }
        });
        checkData = null;
        if (item_data.length > 0) {
            loadComboboxData(item_data, function () {
                $("[objname]").each(function () {
                    if (!$(this).attr("parent")) {
                        bindObjName($(this));
                    }
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
        var html = '<iframe scrolling="yes" frameborder="0"  src="' + href + '" style="width:100%;height:98%;"></iframe>'
        var opts = {
            toolbar: [{
                text: '保存',
                iconCls: 'icon-ok',
                handler: function () {
                    var options = $Core.Global.returnValue;
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
        $Core.Global.inputDialog = $input
        $Core.Global.returnValue = undefined;//清空值。
        $Core.Utility.Window.dialog("选择数据", html, opts);

    };
    onAfterBind = function (type) { $Core.Combobox.isLoadCompleted = true; };//定义绑定的事件。
    //设置Easyui下拉框的值
    function setValueToCombobox() {
        var data = $Core.Combobox.values;
        if (data) {
            var reg_date = /^\d{4}(-|\/)\d{2}(-|\/)\d{2}\s?.*$/;
            for (var k in data) {
                var value = data[k];
                if (value != undefined && !reg_date.test(value)) {
                    $("[comboname='" + k + "']").each(function () {
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

                        if ($(this).attr("parent") && !$(this).attr("defaultValue")) {
                            var opData = setCombo($(this), "getData");// 级联和设值（不知道谁先执行的，所以检测是否绑定了数据）
                            if (opData.length <= 1) {
                                $(this).attr("defaultValue", value);
                            }
                        }
                    });
                }
            }
        }
    };
    function setValues(data) {
        $Core.Combobox.values = $.extend($Core.Combobox.values, data);
    }
    function setParas(data) {
        $Core.Combobox.paras = $.extend($Core.Combobox.paras, data);;
    }
    function bindCombo($box, op) {
        if (op.tree) {
            op.data = $Core.Utility.getTree(op.data);
            $box.combotree(op);
        }
        else {
            $box.combobox(op);
        }
        var value = $box.attr("defaultValue");//重新赋值。
        if (value && op.data.contains(value, "value")) {
            $box.removeAttr("defaultValue");
            setTimeout(function () {
                setCombo($box, "select", value);
            }, 100);
        }
        else if (!op.tree && op.data.length > 0) { setCombo($box, "select", op.data[0][op.valueField]); }
    }
    function setCombo($box, key, value, isTree) {
        var tree = isTree || $box.attr("tree");
        if (tree) {
            switch (key) {
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
        setCombo: setCombo,
        setParas: setParas,
        setValues: setValues,
        onAfterExecute: onAfterBind,
        loadComboboxData: loadComboboxData,
        values: {},
        paras: {}
    };
})(jQuery, AR);