(function ($Core) {
    $Core.Lang || ($Core.Lang = {});
    if ($Core.Lang.langKey == undefined) {
        $Core.Lang.select = '请选择';
        $Core.Lang.config = '配置';
        $Core.Lang.add = '添加';
        $Core.Lang.addSameLevel = '添加同级';
        $Core.Lang.addChild = '添加子级';
        $Core.Lang.cancel = '取消';
        $Core.Lang.save = '保存';
        $Core.Lang.edit = '编辑';
        $Core.Lang.del = '删除';
        $Core.Lang.batchDel = '批量删除';
        $Core.Lang.opration = '操作';
        $Core.Lang.empty = '空';
        $Core.Lang.save = '保存';
        $Core.Lang.exportTemplate = '导出模板';
    }

})(AR);
//AR.Common 定义
(function ($, $Core) {
    //定义Common对象
    $Core.Common = {
        _Internal: {
            Editor: {
                onEdit: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnEdit.onExecute(dg, value, index);
                },
                onDel: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnDel.onExecute(dg, value, index);
                },
                onSave: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnSave.onExecute(dg, value, index);
                },
                onCancel: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnCancel.onExecute(dg, value, index);
                }
            },

            Search: function () {
                var that = this;
                $Core.BtnBase.call(that);
                that.$target = null;
                //存档所有Input的对象数组，在调用bind()方法后才能获取。
                that.Items = new $Core.Dictionary();
                that.BtnQuery = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        /**
                        *查询条件的json，可在查询之前修改执行
                        *@param{Array} search
                        */
                        this.onBeforeExecute = function (searchJsonArray) { };
                        this.onAfterExecute = function (searchJsonArray) { };
                        this.onExecute = function (dg, btn_query) {
                            if (!$Core.Global.Variable.isQueryClicking) {
                                $Core.Global.Variable.isQueryClicking = true;

                                if (!btn_query) { btn_query = this.$target; }
                                $Core.Common._Internal.reloadGrid(dg, btn_query, this.onBeforeExecute, this.onAfterExecute);

                                setTimeout(function (obj) {
                                    return function () {
                                        $Core.Global.Variable.isQueryClicking = false;//避免下拉框重置和加载引发多次查询
                                    }
                                }(this), 500);
                            }
                        }

                    }
                    return new Obj();
                }();
                that.BtnReset = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.onBeforeExecute = function ($form) { };
                        this.onExecute = function (dg, btn_reset) {
                            if (!btn_reset) { btn_reset = this.$target; }
                            var $form = btn_reset.parents("form");
                            if (this.onBeforeExecute($form) == false) {
                                return false;
                            }
                            else {

                                //input，要清
                                $form.find("input[type!=button][type!='reset']").each(function () {
                                    $(this).val("");
                                });
                                //下拉框的值有缓存，要清。
                                $form.find("[comboname]").each(function () {
                                    $Core.Combobox.setCombo($(this), "clear");//取消原有的选择值
                                    if ($(this).attr("date") == undefined) {
                                        var data = $(this).combobox("getData");
                                        if (data && data.length > 0 && data[0].value == "") {
                                            $Core.Combobox.setCombo($(this), "select", "");//重新置为请选择的空值，会引发查询。
                                        }
                                    }
                                });
                            }
                            dg.Search.BtnQuery.onExecute(dg, null);
                            this.onAfterExecute();
                        }
                    }
                    return new Obj();
                }();
                that.onExecute = function (dg) {
                    if (that.onBeforeExecute() != false) {
                        _createSearchAreaHtml(dg);
                        that.onAfterExecute();
                    }
                };
            },
            ToolBar: function () {
                var that = this;
                $Core.BtnBase.call(that);
                that.$target = null;
                that.isHidden = false;
                //存档所有按钮的对象数组，在调用bind()方法后才能获取。
                that.Items = new $Core.Dictionary();
                that._btnArray = new Array();
                /**
                *向工具条添加按钮
                *@param{string} text 按钮显示的文本
                *@param{string} fname 按钮注册的事件函数名称
                *@param{int} index 按钮的索引排序值从1开始,默认值最后
                *@param{string} css 样式名称，默认值'btn-sm'
                *@param{string} lv2action 二级权限控制，默认值0
                *@param{string} name 对象的名称，用于在Items[name]获取
                */
                that.add = function (text, fname, index, css, lv2action, name) {
                    var obj = new Object();
                    obj.index = index || this._btnArray.length + 1;
                    obj.lv2action = lv2action;
                    obj.name = name;
                    obj.btn = {
                        title: text,
                        click: fname,
                        css: css || 'btn-sm'
                    }
                    this._btnArray.push(obj);
                }
                /**
                *向工具条添加自定义的HTML元素
                *@param{string} htmlString 一个字符串标签
                *@param{string} index 按钮的索引排序值从1开始,默认值最后
                *@param{int} lv2action 二级权限控制，默认值0
                *@param{string} name 对象的名称，用于在Items[name]获取
                */
                that.addHtml = function (htmlString, index, lv2action, name) {
                    var obj = new Object();
                    obj.index = index || this._btnArray.length + 1;
                    obj.name = name;
                    obj.btn = {
                        html: htmlString,
                        lv2action: lv2action
                    }
                    this._btnArray.push(obj);
                }
                that.BtnAdd = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        //重新设定打开窗体的标题
                        this.winTitle = null;
                        //重新设定打开窗体的链接
                        this.winUrl = null;
                        //dg 是当前datagrid对象
                        this.onBeforeExecute = function (index, isSameLevel) { };
                        this.onExecute = function (dg, index, isSameLevel) {
                            if (this.onBeforeExecute(index, isSameLevel) == false) { return; };
                            var isTreeGrid = dg.isTreeGrid;
                            if (!this.winUrl && (dg.isEditor || isTreeGrid)) {
                                if (endEditing(dg)) {
                                    dg.PKColumn.Editor.operator = "Add";
                                    var _row = {};
                                    var _data = dg.defaultInsertData;
                                    if (_data && typeof (_data) === 'object') {
                                        _row = $.extend(_row, _data);
                                    }
                                    var addIndex;
                                    if (isTreeGrid) {
                                        if (_row[dg.options.idField])//外部设置了值
                                        {
                                            addIndex = _row[dg.options.idField];
                                        }
                                        else {
                                            addIndex = $Core.Utility.guid();
                                            _row[dg.options.idField] = addIndex;
                                        }
                                    }
                                    else {
                                        addIndex = dg.datagrid('getRows').length;
                                    }
                                    //if (dg.PKColumn.Editor.isInsertRow)
                                    //{
                                    //    var pkField = dg.Internal.primarykey;
                                    //    _row = $.extend(_row, _rows[_len - 1] || {});
                                    //    delete _row[dg.Internal.primarykey];
                                    //}
                                    if (isTreeGrid) {
                                        // _row = {};
                                        _row = {
                                            parent: undefined,
                                            data: [_row]
                                        }
                                        var node = dg.datagrid("find", index);
                                        if (node) {
                                            _row.parent = isSameLevel ? node[dg.options.parentField] : node[dg.options.idField];
                                            _row.data[0][dg.options.parentField] = _row.parent;
                                        }
                                    }
                                    dg.datagrid("appendRow", _row);
                                    dg.PKColumn.Editor.editIndex = addIndex;//指定操作的索引
                                    dg.datagrid("refreshRow", addIndex);//变更按钮状态
                                    dg.datagrid('selectRow', addIndex);//光标定位到行
                                    dg.datagrid('beginEdit', addIndex);//开启编辑
                                }
                            }
                            else {
                                $Core.Global.DG.operating = dg;
                                var href = location.href;
                                var splitIndex = href.indexOf('List') == -1 ? href.lastIndexOf('.') : href.lastIndexOf('List');
                                var viewLink = this.winUrl || href.substring(href.lastIndexOf('/') + 1, splitIndex) + 'Edit.html';
                                $Core.Utility.Window.open(viewLink, this.winTitle, false);

                            }
                            this.onAfterExecute(index, isSameLevel);
                        };
                    }
                    return new Obj();
                }();
                that.BtnDelBatch = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.onBeforeExecute = function (ids, index) { };
                        this.onBeforeExecute = function (ids, index, responseText) { };
                        this.onExecute = function (dg) {
                            $Core.Common.onDel(this, null, dg.id);//内部有前中后事件
                        }
                    }
                    return new Obj();
                }();
                that.BtnImport = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        //导入之前执行事件，设置参数如：param.p1 = abc;param.p2 = 123
                        this.onBeforeExecute = function (param) { },
                        //导入完成之后执行事件，data参数是后台返回的json对象
                        this.onAfterExecute = function (data) { }
                    }
                    return new Obj();
                }();
                that.BtnExport = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        /**
                        *@param{object} param 需要变更或者传递附加参数可对param进行修改
                        */
                        this.onBeforeExecute = function (param) { };
                        this.onExecute = function (dg) {
                            var ifrme = $("#div_ifrme_export"), form_export = $("#form_data");
                            ifrme && ifrme.remove(); form_export && form_export.remove();
                            var objName = dg.tableName;
                            var targetForm = $("#" + dg.ToolArea.id).find(".function-box").siblings("div").find('form');
                            var checked_ids = dg.getCheckIDs();
                            var jsonString = "";
                            if (checked_ids.length > 0) {
                                jsonString = checked_ids.join(',');
                            }
                            else {
                                var searchJson = $Core.Common._Internal.buildSearchJson(targetForm);
                                if (dg.options.defaultWhere && dg.options.defaultWhere.length > 0) {
                                    searchJson = searchJson.concat(dg.options.defaultWhere);
                                }
                                jsonString = JSON.stringify(searchJson);
                            }
                            //window.open(ajaxOptions.href + '?objName=' + objName + '&sys_search='+jsonString, '_self');      
                            var iframeName = "framePost";
                            var url = $Core.Utility.Ajax.Settings.url + "?sys_objName=" + dg.objName + "&sys_tableName=" + objName + "&sys_method=Export";
                            ifrme = $("<iframe>").attr("id", "div_ifrme_template").attr("name", iframeName).css({ display: 'none' });
                            form_export = $("<form>").attr("method", "post").attr("action", url).attr("target", iframeName).attr("id", "form_data");
                            var param = {
                                //sys_tableName: objName,
                                // sys_method: "Export",
                                //sys_objName: dg.objName,
                                sys_search: jsonString,
                                sys_mid: $Core.Global.Variable.mid
                            };
                            if (dg.options && dg.options["sortName"] != undefined)// //追加排序条件
                            {
                                param.sort = dg.options.sortName;
                                param.order = dg.options.sortOrder;
                            }
                            if (this.onBeforeExecute(param) == false) { return; };
                            for (var k in param) {
                                form_export.append($("<input>").attr("name", k).val(param[k]).attr("type", "hidden"));
                            }
                            //ifrme.append(form_export);//IE 8 有权限限制。
                            $("body").append(ifrme);
                            $("body").append(form_export);
                            form_export[0].submit();
                            form_export.remove();
                            this.onAfterExecute();
                        }
                    }
                    return new Obj();
                }();
                that.BtnExportTemplate = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        /**
                       *@param{object} param 需要变更或者传递附加参数可对param进行修改
                       */
                        this.onBeforeExecute = function (param) { };
                        this.onExecute = function (dg) {
                            var ifrme = $("#div_ifrme_template"), form_export = $("#form_template");
                            ifrme && ifrme.remove(); form_export && form_export.remove();
                            var objName = dg.tableName;
                            //window.open(ajaxOptions.href + '?objName=' + objName + '&sys_search='+jsonString, '_self');
                            var iframeName = "framePost";
                            ifrme = $("<iframe>").attr("id", "div_ifrme_template").attr("name", iframeName).css({ display: 'none' });
                            form_export = $("<form>").attr("action", $Core.Global.route.root).attr("target", iframeName).attr("id", "form_template");
                            var param = {
                                sys_objName: dg.objName,
                                sys_tableName: objName,
                                sys_method: "ExcelTemplate",
                                sys_mid: $Core.Global.Variable.mid
                            };
                            if (this.onBeforeExecute(param) == false) { return; };
                            for (var k in param) {
                                form_export.append($("<input>").attr("name", k).val(param[k]).attr("type", "hidden"));
                            }
                            //ifrme.append(form_export);//IE 8 有权限限制。
                            $("body").append(ifrme);
                            $("body").append(form_export);
                            form_export[0].submit();
                            form_export.remove();
                            this.onAfterExecute();
                        }
                    }
                    return new Obj();
                }();
                function endEditing(dg) {
                    if (dg.PKColumn.Editor.editIndex != null) {
                        var index = dg.PKColumn.Editor.editIndex;
                        dg.PKColumn.Editor.editIndex = null;
                        if (dg.PKColumn.Editor.operator == "Add") {
                            dg.datagrid('deleteRow', index);
                        }
                        else { dg.datagrid('cancelEdit', index); }
                    }
                    return true;
                }
                that.onExecute = function (dg) {
                    if (that.onBeforeExecute() != false) {
                        _createToolBarHtml(dg);
                        that.onAfterExecute();
                    }
                }
            },
            HeaderMenu: function () {
                this.isHidden = false;
                this.Items = [{ "text": $Core.Lang.config, "onclick": "AR.Common._Internal.onConfigClick", "lv2action": "config" }];
                /**
                *向工具条添加按钮
                *@param{string} text 按钮显示的文本
                *@param{string} fname 按钮注册的事件函数名称
                *@param{string} lv2action 二级权限控制，默认值0
                */
                this.add = function (text, fname, lv2action) {
                    this.Items.push({ "text": text, "onclick": fname, "lv2action": lv2action });
                }
            },
            RowMenu: function (isTreeGrid) {
                this.isHidden = isTreeGrid;
                if (isTreeGrid) {
                    this.Items = [{ "text": $Core.Lang.addSameLevel, "onclick": "AR.Common._Internal.onAdd,true", "lv2action": "add" },
                        { "text": $Core.Lang.addChild, "onclick": "AR.Common._Internal.onAdd", "lv2action": "add" },
                        { "text": $Core.Lang.edit, "onclick": "AR.Common._Internal.Editor.onEdit", "lv2action": "edit" },
                        { "text": $Core.Lang.del, "onclick": "AR.Common._Internal.Editor.onDel", "lv2action": "del" }
                    ];
                }
                else {
                    this.Items = [];
                }
                /**
                *向工具条添加按钮
                *@param{string} text 按钮显示的文本
                *@param{string} fname 按钮注册的事件函数名称
                *@param{string} lv2action 二级权限控制，默认值0
                */
                this.add = function (text, fname, lv2action) {
                    this.Items.push({ "text": text, "onclick": fname, "lv2action": lv2action });
                }
            },

            //构建查询条件json格式,search事件调用，返回的Json数组
            buildSearchJson: function (targetForm) {
                var json = [], reg_date = /<=\s('[^']+')/;

                var $inputs = targetForm.find("input[type!=button][type!='reset']");
                if ($inputs[0]) {
                    var operator = "like", $box, value, isDate = false;
                    cto: for (var i = 0; i < $inputs.length; i++) {
                        $box = $($inputs[i]);
                        if ($box.attr("operator")) {
                            operator = $box.attr("operator")
                        }
                        else if (operator == "like" && ($box.attr("configkey") || $box.attr("objname"))) {
                            operator = "=";
                        }
                        var name = $box.attr("name");
                        isDate = $box.attr("date") != undefined || isDate;
                        if (!name) {
                            continue cto;
                        }

                        value = $box.val() || $box.attr("defaultValue");//重新赋值，初始的默认值第一次设置后，是会被清掉的。;
                        if (value == '' || value == null || value == $Core.Lang.select) {
                            operator = "like";
                            isDate = false;
                            continue cto;
                        }
                        if (operator == "in") {
                            //找到上一个
                            var firstOne = json.get("name", name);
                            if (firstOne) // 已存在
                            {
                                firstOne.value = firstOne.value + ",'" + value + "'";
                                continue cto;
                            }
                            value = "'" + value + "'";
                        }
                        if (isDate) {
                            var isTime = $box.attr("date") == "datetime";
                            if (value.length > 10) {
                                value = "'" + value + "'";
                            }
                            else if (operator == ">=") {
                                value = "'" + value + (isTime ? " 00:00:00'" : "'");
                            }
                            else if (operator == "<=") {
                                value = value = "'" + value + (isTime ? " 23:59:59'" : "'");
                            }
                        }
                        var item = { name: name, value: value, pattern: operator };
                        json.push(item);

                    }
                }
                return json;
            },
            reloadGrid: function (dg, btn_query, onBeforeEvent, onAfterEvent) {
                var searchJson = [];
                var targetForm;
                if (!btn_query && dg.Search && dg.Search.BtnQuery) {
                    btn_query = dg.Search.BtnQuery.$target;
                }
                if (btn_query) {
                    targetForm = btn_query.parents("form");
                    if (targetForm) {
                        searchJson = $Core.Common._Internal.buildSearchJson(targetForm);
                    }

                }
                //装载默认where条件，过滤到表单已有的数据。
                if (dg.options.defaultWhere && dg.options.defaultWhere.length > 0) {
                    for (var i = 0; i < dg.options.defaultWhere.length; i++) {
                        var isHasData = false;
                        var name = dg.options.defaultWhere[i].name;
                        for (var j = 0; j < searchJson.length; j++) {
                            if (searchJson[j].name == name) {
                                isHasData = true;
                                break;
                            }
                        }
                        if (!isHasData) {
                            searchJson.push(dg.options.defaultWhere[i]);
                        }
                    }
                }

                if (onBeforeEvent && onBeforeEvent(searchJson) == false) {
                    return;
                }
                if (!targetForm || targetForm.form("validate")) {
                    dg.isEditor && (dg.PKColumn.Editor.editIndex = undefined);
                    var jsonString = JSON.stringify(searchJson);
                    dg.isSearch = true;
                    if (dg.isTreeGrid) {
                        dg.datagrid("options").onBeforeLoad = function (row, param) {
                            eval("sys_search = '" + jsonString + "'");
                            param.sys_search = sys_search;
                        }
                        dg.datagrid('reload');
                    }
                    else {
                        var str = jsonString.replace(/\'/g, "!#");
                        eval("sys_search = '" + str + "'");
                        var data = { sys_search: sys_search.replace(/!#/g, "'") };
                        if (dg.datagrid('getRows')) {
                            dg.datagrid('clearSelections');
                        }
                        dg.datagrid("load", data);
                    }
                    onAfterEvent && onAfterEvent(searchJson);
                }
            },
            //查询区域的下拉触发事件
            onQuery: function (dgid) {
                if ($(this).attr('isquery') == "false") {
                    return false;
                }
                if (document.readyState == 'complete') {
                    var dg = $Core.Global.DG.operating;//解决下拉自动事件引发2次查询的问题。
                    if (!dg || dg.Internal.isLoadCompleted) {
                        $(this).parents("form").find(".query").click();
                    }
                }
            },
            onAdd: function (el, dgid, value, index, isSameLevel) {
                var dg = getDgByKey(dgid);
                if (dg) {
                    dg.ToolBar.BtnAdd.onExecute(dg, index, isSameLevel);
                }

            },
            onConfigClick: function (el, dgid, value, index) {
                var dg = getDgByKey(dgid);
                if (dg) {
                    var url = $Core.Utility.stringFormat("{0}?objName={1}", $Core.Global.Variable.ui + '/Web/SysAdmin/ConfigGrid.html', dg.objName);
                    $Core.Global.DG.operating = dg;
                    $Core.Utility.Window.open(url, "", false);
                }
                else { alert("Can't find the object:" + dgid); }
            }
        },
        Formatter: {
            dateFormatter: function (value, row, index) {
                if (value == "") {
                    return "";
                }
                try {
                    var date = new Date(value.replace(/\-/g, '/'));
                    var y = date.getFullYear();
                    if (isNaN(y)) { return value; }
                    var m = date.getMonth() + 1;
                    var d = date.getDate();
                    value = y + '-' + m.toString().replace(/\b(\w)\b/g, '0$1') + '-' + d.toString().replace(/\b(\w)\b/g, '0$1');
                }
                catch (e) {

                }
                return value;
            },
            boolFormatter: function (value, row, index) {
                return "<input type='checkbox' " + (value ? "checked='checked'" : "") + " disabled='disabled' />";
            },
            stringFormatter: function (value, row, index) {
                if (value) {
                    var abValue = value;
                    if (value.length >= 30) {
                        abValue = value.substring(0, 30) + "...";
                    }
                    return '<div title="' + value + '" class="note">' + abValue + '</div>';
                }
                return value;
            },
            configFormatter: function (configKey) {
                return function configFormatter(value, row, index) {
                    var result = value;
                    if (value != undefined && value.toString() != "") {
                        if (configKey && $Core.Config.data[configKey]) {
                            result = $Core.Config.getText(configKey, value);
                        }
                    }
                    result = $Core.Common.Formatter.onAfterExecute(configKey, result, row, index);
                    if (result && result.toString().indexOf('<') == -1) {
                        result = $Core.Common.Formatter.stringFormatter(result);
                    }
                    return result;
                }
            },
            //本方法仅供重写，可以实现值变更后加链接等效果。
            onAfterExecute: function (key, value, row, index) {
                return value;
            },
            objFormatter: function (objName) {
                var that = this;
                return function objFormatter(value, row, index) {
                    var result = value;
                    if (value != undefined && value.toString() != "") {
                        if ($Core.Combobox.data) {
                            result = $Core.Combobox.getText(objName, value);
                        }
                    }
                    result = $Core.Common.Formatter.onAfterExecute(objName, result, row, index);
                    if (result && result.toString().indexOf('<') == -1) {
                        result = $Core.Common.Formatter.stringFormatter(result);
                    }
                    return result;
                }
            },
            pkFormatter: function (dg) {
                return function (value, row, index) {
                    //console.log("pkformatter");
                    var btnArray = $Core.Utility.cloneArray(dg.PKColumn._btnArray, false);
                    value = dg.getPrimaryID(row);// row[dg.Internal.primarykey];
                    var result = dg.PKColumn.onBeforeExecute(value, row, index, btnArray);
                    if (result) {
                        return result;
                    }
                    var obj = new $Core.Dictionary();
                    var $div = $('<div class="operation w$len"></div>');
                    var len = 0;
                    var actionKeys = $Core.Global.Variable.actionKeys;
                    if (dg.isEditor == true) {
                        var strTemplate = '<a class="{0}" title="{1}" dgid="' + dg.id + '" onClick="AR.Common._Internal.Editor.{2}(this,\'' + dg.id + '\',\'' + value + '\',' + index + ')"  v="{3}" i="{4}"></a>';
                        if (dg.PKColumn.Editor.editIndex == null) {
                            if (dg.PKColumn.Editor.BtnEdit.hidden != true && actionKeys.indexOf(",edit,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "bj", $Core.Lang.edit, "onEdit", value, index));
                                obj.set("edit", { "isCustom": false, $target: $btn });
                                $div.append($btn);

                            }
                            if (dg.PKColumn.Editor.BtnDel.hidden != true && actionKeys.indexOf(",del,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "sc", $Core.Lang.del, "onDel", value, index));
                                obj.set("del",{ "isCustom": false, $target: $btn });
                                $div.append($btn);
                            }
                        }
                        else {
                            //有编辑权限才能进来
                            if (dg.PKColumn.Editor.BtnCancel.hidden != true && actionKeys.indexOf(",edit,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "cx", $Core.Lang.cancel, "onCancel", value, index));
                                obj.set("cancel", { "isCustom": false, $target: $btn });
                                $div.append($btn);
                            }
                            if (dg.PKColumn.Editor.BtnSave.hidden != true && actionKeys.indexOf(",edit,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "bc", $Core.Lang.save, "onSave", value, index));
                                obj.set("save", { "isCustom": false, $target: $btn });
                                $div.append($btn);
                            }
                        }
                    }
                    //自定义按钮
                    for (var i = 0; i < btnArray.length; i++)
                    {
                        var btn = btnArray[i]; 
                        if (!btn.isHidden && actionKeys.indexOf("," + btn.lv2action + ",") > -1)
                        {
                           
                            if (!btn.hasAttribute("hasClick")) {
                                if (btn.className == 'sc') {
                                    btn.setAttribute("onclick", "AR.Common.onDel(this,'" + value + "','" + dg.id + "'," + index + ")");
                                }
                                else {
                                    btn.setAttribute("onclick", "AR.Common.onOpen(this,'" + value + "','" + dg.id + "'," + index + ")");
                                }
                            }
                            len++;
                            var $btn = $(btn.outerHTML);
                            obj.set(btn.key, { "isCustom": true, $target: $btn });
                            $div.append($btn);
                        }
                    }
                    dg.PKColumn.Items.set(index, obj);
                    var r2 = dg.PKColumn.onAfterExecute(value, row, index, $div);
                    if (r2 == undefined) { return $div.prop("outerHTML").replace('$len', len); }
                    return r2;
                }
            },
            formatEditor: function (row, dg) {
                if (!row.edit) { return; }
                var editor = function () {
                    try {
                        return eval(row.editor);
                    } catch (e) {
                        return undefined;
                    }
                }();
                if (editor) {
                    row.editor = editor.call(dg, row);
                    if (row.editor.type == 'combobox') {
                        row.formatter = function (v, r, i) {
                            var data = row.editor.options.data;
                            var tField = row.editor.options.textField;
                            var vField = row.editor.options.valueField;

                            for (var i = 0; i < data.length; i++) {
                                if (data[i][vField] == v) {
                                    return data[i][tField];
                                }
                            };
                        };
                    }
                } else {
                    var isRelaction = false;
                    var type = 'validatebox', settings = {};
                    if (row.formatter && row.formatter.indexOf('#') != -1) {
                        type = 'combobox';
                        var configKey, objName, data, parentObjName;
                        if ((typeof (row.formatter) == "string" && row.formatter.indexOf('#') != -1) && !/#C_/.test(row.formatter)) {
                            configKey = row.formatter.split('#')[1];
                        }
                        if ((typeof (row.formatter) == "string" && row.formatter.indexOf('#') != -1) && /#C_/.test(row.formatter)) {
                            objName = row.formatter.split('#')[1];
                            if (objName.indexOf('=>') != -1) {
                                var _obj_array = objName.split('=>');
                                objName = _obj_array[0];
                                parentObjName = _obj_array[1];
                                isRelaction = true;
                            }
                        }
                        if (configKey) {
                            data = $Core.Config.data[configKey] || [];
                        }
                        if (objName) {
                            if ($Core.Combobox.data[objName]) {
                                data = $Core.Combobox.data[objName];

                            }
                        }
                        var isMultiple = false;//先不支持行内编辑的多选
                        if (row.rules && typeof (row.rules) == "string" && (row.rules.indexOf("$1:{") > -1 || row.rules.indexOf("$2:{") > -1)) {
                            var sp = row.rules.split("{");
                            sp = eval("({" + sp[sp.length - 1] + ")");
                            isMultiple = sp.multiple && sp.multiple.toString() != "false";
                        }
                        settings.options = {
                            multiple: isMultiple,
                            valueField: 'value',
                            textField: 'text',
                            objName: objName,
                            parentObjName: parentObjName,
                            OriginalData: data,
                            data: data,
                            onSelect: function (record) {
                                var currentEditor = dg.datagrid("getEditor", { index: dg.PKColumn.Editor.editIndex, field: row.field });
                                var rowEditors = dg.datagrid("getEditors", dg.PKColumn.Editor.editIndex);
                                for (var i = 0, len = rowEditors.length; i < len; i++) {
                                    if (rowEditors[i].type == 'combobox') {
                                        var _parentObjName = rowEditors[i].target.combobox("options").parentObjName;
                                        var _objName = rowEditors[i].target.combobox("options").objName;
                                        var _selfObjName = currentEditor.target.combobox("options").objName;
                                        //找到级联的处理
                                        if (_parentObjName && _parentObjName == _selfObjName) {
                                            //重新加载数据
                                            var subArray = new Array();
                                            (function (key, parent_id) {
                                                var all_array_children;
                                                if ($Core.Combobox.data[key]) {
                                                    all_array_children = $Core.Combobox.data[key];
                                                }
                                                for (var k = 0; k < all_array_children.length; k++) {
                                                    if (all_array_children[k].parent == parent_id) {
                                                        subArray.push(all_array_children[k]);
                                                    }
                                                }
                                            })(_objName, record.value);
                                            rowEditors[i].target.combobox("clear");
                                            rowEditors[i].target.combobox("loadData", subArray);
                                        }
                                    }
                                }
                            }
                        }
                    } else {
                        var dataType = row.datatype.split(',')[0];
                        switch (dataType) {
                            case "int32":
                            case "int64":
                            case "int16":
                            case "byte":
                            case "double":
                            case "single":
                            case "decimal":
                                type = 'numberbox';
                                var prec = row.datatype.split(',')[2];
                                settings.options = {
                                    precision: prec,
                                    validType: 'number'
                                }
                                break;
                            case "date":
                            case "datetime":
                                settings.options = {
                                    validType: dataType + 'box'
                                }
                                type = dataType + 'box';
                                break;
                            case "bool":
                            case "boolean":
                                type = 'checkbox';
                                settings.options = {
                                    on: 1,
                                    off: 0
                                }
                                row.formatter = function (v, r) {
                                    if (v && v == 1) {
                                        return "<input type='checkbox' checked='checked' disabled='disabled' />";
                                    }
                                    return "<input type='checkbox' disabled='disabled' />";
                                }
                                break;
                        }
                    }
                    settings.type = type;
                    var valid = row.datatype.split(',')[3];
                    if (valid && valid == 1) {
                        settings.options || (settings.options = {});
                        settings.options.required = true;
                        if (!settings.options.validType) {
                            var len = row.datatype.split(',')[1];
                            if (len != 0) {
                                settings.options.validType = 'length[1,' + len + ']';
                            }
                        }
                    }
                    row.editor = settings;
                }
            },
            //对默认表头进行处理分组。
            formatHeader: function (dg) {
                var json_data = $Core.Utility.cloneArray(dg.Internal.headerData, true);
                var frozen = Array(), cols = Array();
                for (var i = 0; i < json_data.length; i++) {
                    var format, style, configKey, objName;
                    //格式化第一列为主键
                    if (i == 0 && (json_data[i].formatter == undefined || json_data[i].formatter == "#" || json_data[i].formatter == "")) {
                        frozen.push({ align: 'center', checkbox: dg.isShowCheckBox, hidden: !dg.isShowCheckBox, field: 'ckb', rowspan: 1, colspan: 1 });

                        //dg.Internal.primarykey = json_data[i].field;
                        if (!dg.PKColumn.isHidden && (dg.PKColumn._btnArray.length > 0 || dg.isEditor)) {
                            //检测操作列，权限过滤后还有没有可呈现的控件。
                            var actionKeys = $Core.Global.Variable.actionKeys;
                            var len = 0;
                            for (var k = 0; k < dg.PKColumn._btnArray.length; k++) {
                                if (actionKeys.indexOf("," + dg.PKColumn._btnArray[k].lv2action + ",") > -1) {
                                    len++;
                                }
                            }
                            if (dg.isEditor) {
                                actionKeys.indexOf(",edit,") > -1 && len++;
                                actionKeys.indexOf(",del,") > -1 && len++;
                            }
                            if (len > 0) {
                                var pkColumn = $Core.Utility.cloneObject(json_data[i]);
                                pkColumn.formatter = this.pkFormatter(dg);
                                pkColumn.colspan = 1;
                                pkColumn.rowspan = 1;
                                pkColumn.width = len * 32;
                                pkColumn.hidden = false;
                                var title = $Core.Config.getValue("SysConfig", "OperatorTitle");
                                if (!title) {
                                    title = $Core.Lang.opration;
                                }
                                pkColumn.title = title == $Core.Lang.empty ? '' : title;
                                pkColumn.field = 'auto_pk';
                                frozen.push(pkColumn);
                            }
                        }
                    }
                    if (json_data[i].datatype) {
                        //收集主键
                        var items = json_data[i].datatype.split(',');
                        if (items.length > 4 && items[4] == "1") {
                            dg.Internal.jointPrimary.push(json_data[i].field);
                        }
                    }
                    if (json_data[i].hidden) {
                        continue;
                    }
                    //是否编辑模式
                    if ((dg.isEditor && json_data[i].edit) || dg.isTreeGrid) {
                        this.formatEditor(json_data[i], dg);
                    }
                    if (json_data[i].formatter && typeof (json_data[i].formatter) != 'function') {
                        //格式化config表的数据结构
                        if (json_data[i].formatter && json_data[i].formatter.length > 2 && json_data[i].formatter.indexOf('#') != -1 && !/C_+/.test(json_data[i].formatter)) {
                            configKey = json_data[i].formatter.split('#')[1];
                            json_data[i].formatter = $Core.Common.Formatter.configFormatter;
                        }

                        if (json_data[i].formatter && json_data[i].formatter.length > 2 && json_data[i].formatter.indexOf('#') != -1 && /C_+/.test(json_data[i].formatter)) {
                            objName = json_data[i].formatter.split('#')[1];
                            if (objName.indexOf('=>') != -1) {
                                objName = objName.split('=>')[0];
                            }
                            json_data[i].formatter = $Core.Common.Formatter.objFormatter;
                        }
                    }
                    try {
                        format = $Core.Common.Formatter[json_data[i].formatter] || eval(json_data[i].formatter);
                        if (format == undefined) {
                            delete json_data[i].formatter;
                            delete json_data[i].styler;
                        }
                        style = eval(json_data[i].styler);
                        if (typeof (format) == "function") {
                            if (json_data[i].formatter == $Core.Common.Formatter.configFormatter) {
                                json_data[i].formatter = format(configKey);
                            } else if (json_data[i].formatter == $Core.Common.Formatter.objFormatter) {
                                json_data[i].formatter = format(objName);
                            } else {
                                if (i == 0) {
                                    json_data[i].formatter = format(dg);
                                } else {
                                    json_data[i].formatter = format;
                                }
                            }
                        }
                        if (typeof (style) == "function") {
                            json_data[i].styler = style;
                        }
                        //处理跨行跨列
                        var rowspan = parseInt(json_data[i].rowspan) || 1;
                        var colspan = parseInt(json_data[i].colspan) || 1;
                        json_data[i].rowspan = rowspan == 0 ? 1 : rowspan;
                        json_data[i].colspan = colspan == 0 ? 1 : colspan;
                    } catch (e) {
                        delete json_data[i].formatter;
                        delete json_data[i].styler;
                    }

                    json_data[i].sortable = eval(json_data[i].sortable);
                    json_data[i].hidden = eval(json_data[i].hidden);
                    if (i == 0 || json_data[i].frozen) {
                        frozen.push(json_data[i]);
                    }
                    else {
                        cols.push(json_data[i]);
                    }
                }//循环结束
                if (dg.Internal.jointPrimary.length == 0) { dg.Internal.jointPrimary.push(json_data[0].field); }
                dg.Internal.primarykey = dg.Internal.jointPrimary[0];
                frozen = getColumnGroup(frozen);
                cols = getColumnGroup(cols);
                var maxLen = frozen.length > cols.length ? frozen.length : cols.length;
                setColumnRowspan(frozen, maxLen);
                setColumnRowspan(cols, maxLen);
                return { frozen: frozen, cols: cols };
            }
        },

        onDel: function (el, value, thatID, index) {
            var dg = $Core.Global.DG.Items[thatID];
            dg.PKColumn._onDel(el, value, thatID, index);
        },
        /*onOpen与delRow归属于window对象，
            可在当前调用页面重写这两个方法，
            如果没有别的业务需求不建议重写
        */
        //打开业务页面
        onOpen: function (el, value, thatID, index) {
            var dg = $Core.Global.DG.operating = $Core.Global.DG.Items[thatID]; //赋值当前对象到page属性方便调用
            dg.PKColumn._onOpen(el, value, thatID, index);
        }

    }
    function setColumnRowspan(cols, maxLen) {
        for (var i = 0; i < cols.length; i++) {
            for (var k = 0; k < cols[i].length; k++) {
                if (cols[i][k].field && cols[i][k].rowspan == 1) {
                    cols[i][k].rowspan = maxLen - i;
                }
            }
        }
    }
    function getColumnGroup(cols) {
        var result = [];
        var index = 0, num = [0, 0, 0, 0, 0, 0, 0, 0];
        for (var i = 0; i < cols.length; i++) {
            var col = cols[i];
            if (col.field.indexOf('mg_') != -1)//
            {
                delete col.field;
                if (num[index] > 0)//内部嵌套
                {
                    index++;
                    num[index] = col.colspan || 1;
                    num[index - 1] = num[index - 1] - num[index];//父级数字要减掉子级的数量
                }
                else {
                    num[index] = col.colspan || 1;
                }
                result[index] || (result[index] = new Array());
                result[index].push(col);
            }
            else {
                var level = (num[index] > 0) ? index + 1 : index;
                if (num[index] > 0) {
                    num[index]--;
                    if (num[index] == 0)//列已经够了
                    {
                        if (index > 0)//如果是子级
                        {
                            index--;
                        }
                    }
                }
                result[level] || (result[level] = new Array());
                result[level].push(col);
            }

        }
        return result;
    }
    //创建搜索区
    function _createSearchAreaHtml(dg) {
        var dataArray = [];
        var hdata = dg.Internal.headerData;
        for (var i = 0, len = hdata.length; i < len; i++) {
            if (hdata[i].search) {
                dataArray.push(hdata[i]);
            }
        }
        if (dataArray.length > 0 || dg.Search.$target) {
            var $input = $('<div id="div_search">').addClass('box w684');
            if (!dg.Search.$target) {
                $Core.Utility.createInputHtml($input, dataArray, dg, true);
            }
            else {
                $input = dg.Search.$target;
                $input.show();
            }
            dg.Search.$target = $('<div id="' + dg.id + '_SearchArea" class="cont-list-form cont-box-form">');
            var form = $("<form>");
            dg.Search.$target.append(form);
            form.append($input);

            var divButtons = $('<div class="btn w72">');
            dg.Search.BtnQuery.$target = $('<input class="query" value="" type="button" />');
            dg.Search.BtnReset.$target = $('<input class="reset" type="button" value="" />');
            //需要指定按钮对象，如果样式不对将不触发事件
            if (!dg.Search.BtnQuery.isHidden) {
                divButtons.append($("<a>").append(dg.Search.BtnQuery.$target));
            }
            if (!dg.Search.BtnReset.isHidden) {
                divButtons.append($("<a>").append(dg.Search.BtnReset.$target));
            }
            form.append(divButtons);
        }
        dg.ToolArea.$target.append(dg.Search.$target);

    }
    //创建工具栏区
    function _createToolBarHtml(dg) {
        if (!dg.ToolBar || !dg.ToolBar.$target || dg.ToolBar.$target[0].innerHTML) { return; }
            var item; actionKeys = $Core.Global.Variable.actionKeys || "";
            if (actionKeys.indexOf(',add,') > -1 && !dg.ToolBar.BtnAdd.isHidden) {
                dg.ToolBar.BtnAdd.$target = $('<input class=\"add\" flag=\"btn_add\" type=\"button\" name=\"' + $Core.Lang.add + '\" value=\"\"/>');
                item = $("<a>").append(dg.ToolBar.BtnAdd.$target);
                dg.ToolBar.$target.append(item);
                dg.ToolBar.Items.set("add", dg.ToolBar.BtnAdd);
            }
            if (actionKeys.indexOf(',del,') > -1 && !dg.ToolBar.BtnDelBatch.isHidden && dg.isShowCheckBox) {
                dg.ToolBar.BtnDelBatch.$target = $('<input  class=\"batch_del\" flag=\"btn_del\" type=\"button\" name=\"' + $Core.Lang.batchDel + '\" value=\"\"/>').attr("dgID", dg.id);
                item = $("<a>").append(dg.ToolBar.BtnDelBatch.$target);
                dg.ToolBar.$target.append(item);
                dg.ToolBar.Items.set("del", dg.ToolBar.BtnDelBatch);
            }
            if (actionKeys.indexOf(',export,') > -1 && !dg.ToolBar.BtnExport.isHidden) {
                dg.ToolBar.BtnExport.$target = $('<input class=\"export\" flag=\"btn_export\" type=\"button\"  value=\"\"/>');
                item = $("<a>").append(dg.ToolBar.BtnExport.$target);
                dg.ToolBar.$target.append(item);
                dg.ToolBar.Items.set("export", dg.ToolBar.BtnExport);
            }
            if (actionKeys.indexOf(',import,') > -1) {
                if (!dg.ToolBar.BtnImport.isHidden) {
                    dg.ToolBar.BtnImport.$target = $('<input class=\"import\" flag=\"btn_import\" type=\"button\"  value=\"\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnImport.$target);
                    dg.ToolBar.$target.append(item);
                    dg.ToolBar.Items.set("import", dg.ToolBar.BtnImport);
                }
                if (!dg.ToolBar.BtnExportTemplate.isHidden) {
                    dg.ToolBar.BtnExportTemplate.$target = $('<input class=\"btn-sm\" flag=\"btn_export_template\" type=\"button\"  value=\"' + $Core.Lang.exportTemplate + '\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnExportTemplate.$target);
                    dg.ToolBar.$target.append(item);
                    dg.ToolBar.Items.set("exportTemplate", dg.ToolBar.BtnExportTemplate);
                }
            }
            //}
            //else {//处理样式问题（如果去掉或隐藏div_fn，或不设置class为function-box，都显示不出分页控件，只有后期改变其属性）
            //    div_fn.attr("style", "height:0px;padding:0 0;border-bottom:0px");
            //}
            //dg.ToolBar.$target = div_fn;
            //dg.ToolArea.$target.append(dg.ToolBar.$target);
            _createCustomButton(dg);
            //检测有没有工具栏，如果没有，自动隐藏
            if (dg.ToolBar.Items.length == 0) {
                dg.ToolBar.$target.hide();
                dg.ToolBar.$target.attr("style", "height:0px;padding:0 0;border-bottom:0px");
            }
    }
    //创建自定义工具条。
    function _createCustomButton(dg) {
        var btnArray = dg.ToolBar._btnArray;
        if (!(btnArray instanceof Array)) {
            throw TypeError('para must be Array!');
        }
        var hiddenCount = 0;
        var actionKeys = $Core.Global.Variable.actionKeys;
        for (var i = 0, len = btnArray.length; i < len; i++) {
            if (btnArray[i] == undefined) { continue; }
            var lv2action = btnArray[i].lv2action && btnArray[i].lv2action.toLowerCase();
            var name = btnArray[i].name;
            if (!lv2action || actionKeys.indexOf(',' + lv2action + ",") > -1) {
                var index = btnArray[i].index;
                var btn = btnArray[i].btn,
                    item = '';
                if (btn.html) {
                    item = btn.html;
                } else {
                    var btnClass = btn.css || "btn-sm";
                    var btnClick = btn.click;
                    var title = btn.title;
                    var classText = btnClass ? "class=\""+btnClass+"\"" : "";
                    var clickText = btnClick && btnClass!="null" ? "onclick=\"" + btnClick + "(this,'"+dg.id+"')\"" : "";
                    item = $Core.Utility.stringFormat('<a><input type=\"button\" {0} {1}  value=\"{2}\"/></a>', classText, clickText, title);
                }
                item = $(item);
                var toolbarContainer = dg.ToolBar.$target;//  $("#" + dg.ToolArea.id).find(".function-box"),
                count = toolbarContainer.children().length;
                if (count == 0) {
                    toolbarContainer.append(item);
                } else {
                    if (count < index) {
                        index = count;
                        toolbarContainer.children().eq(index - 1).after(item);
                    } else {
                        toolbarContainer.children().eq(index - 1).before(item);
                    }
                }
                //外部是_createToolbar.call(dg, dg.ToolBar._btnArray);调用方式，所以上下文被换成了datagrid
                if (name) {
                    dg.ToolBar.Items.set(name, { "isCustom": true, $target: item });
                }
            }
        }
    }
   
   
    function getDgByKey(key) {
        return $Core.Global.DG.Items[key];
    }

})(jQuery, AR);

