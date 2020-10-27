/// <reference path="/Style/JS/Aries.Loader.js" />
+function ($, $Core) {
    $Core.Lang || ($Core.Lang = {});
    $Core.Private || ($Core.Private = {});
    //私有方法，系统内部使用
    $Core.Private.Grid = {
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
                    this.onExecute = function (dg, $btnQuery) {
                        if (!$Core.Global.Variable.isQueryClicking) {
                            $Core.Global.Variable.isQueryClicking = true;

                            if (!$btnQuery) { $btnQuery = this.$target; }
                            dg.Search.reloadGrid(dg, $btnQuery, this.onBeforeExecute, this.onAfterExecute);
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
                    this.onExecute = function (dg, $btnReset) {
                        if (!$btnReset) { $btnReset = this.$target; }
                        var $form = $($btnReset.parents("form")[0]);
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
                                $Core.Combobox.setAttr($(this), "clear");//取消原有的选择值
                                if ($(this).attr("date") == undefined) {
                                    var data = $Core.Combobox.setAttr($(this), "getData");
                                    if (data && data.length > 0 && data[0].value == "") {
                                        $Core.Combobox.setAttr($(this), "select", "");//重新置为请选择的空值，会引发查询。
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
                    $Core.Common.Html.createSearchArea(dg);
                    that.onAfterExecute();
                }
            };
            // 注册查询和重置按钮事件（由框架自动调用）
            that.regEvent = function (dg) {
                //注册查询事件
                var $btnQuery = this.BtnQuery.$target;
                if ($btnQuery) {
                    $btnQuery.click(function () {
                        dg.Search.BtnQuery.onExecute(dg, $btnQuery);
                    });
                    var $form = $($btnQuery.parents("form")[0]);
                    //input，追加回车事件。
                    $form.submit(function (e) { return false; });// 禁掉自动提交。（当表单只有一个输入框时，有些浏览器会自动触发回车即submit事件）"
                    $form.find("input:[type='text']").each(function () {
                        $(this).keyup(function (e) {
                            var ev = document.all ? window.event : e;
                            if (ev.keyCode == 13) // Enter
                            {
                                $(this).blur();//先触发光标离开事件（让easyui的值写回hidde域）
                                dg.Search.BtnQuery.onExecute(dg, $btnQuery);
                                $(this).focus();//将光标还原。
                            }
                        });

                    });
                }
                //重置按钮事件

                var $btnReset = this.BtnReset.$target;
                $btnReset && $btnReset.click(function () {
                    dg.Search.BtnReset.onExecute(dg, $btnReset);
                });
            };
            //重新加载表格
            that.reloadGrid = function (dg, $btnQuery, onBeforeEvent, onAfterEvent) {
                var searchJson = [];
                var $form;
                if (!$btnQuery && dg.Search && dg.Search.BtnQuery) {
                    $btnQuery = dg.Search.BtnQuery.$target;
                }
                if ($btnQuery) {
                    $form = $btnQuery.parents("form");
                    if ($form) {
                        //处理可能多个form嵌套的问题（取第1个，转为JQ对象）
                        searchJson = this.getFormJson($($form[0]));
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
                var isdeleted = AR.Global.Variable.isdeleted;
                if (isdeleted && dg.Internal.headerData.contains(isdeleted, "field") && !searchJson.contains(isdeleted, "name")) {
                    searchJson.push({ "name": isdeleted, "value": 0 });
                }
                if (onBeforeEvent && onBeforeEvent(searchJson) == false) {
                    return;
                }
                if (!$form || $form.form("validate")) {
                    dg.isEditor && (dg.PKColumn.Editor.editIndex = undefined);
                    var jsonString = JSON.stringify(searchJson);
                    dg.isSearch = true;
                    if (dg.isTreeGrid) {
                        dg.datagrid("options").onBeforeLoad = function (row, param) {
                            eval("sys_search = '" + jsonString + "'");
                            param.sys_search = sys_search;
                            param.sys_mid = $Core.Utility.getSysmid();
                        }
                        dg.datagrid('reload');
                    }
                    else {
                        var str = jsonString.replace(/\'/g, "!#");
                        eval("sys_search = '" + str + "'");
                        var data = { sys_search: sys_search.replace(/!#/g, "'"), sys_mid: $Core.Utility.getSysmid() };
                        if (dg.datagrid('getRows')) {
                            dg.datagrid('clearSelections');
                        }
                        dg.datagrid("load", data);
                    }
                    onAfterEvent && onAfterEvent(searchJson);
                }
            };
            //构建查询条件json格式,search事件调用，返回的Json数组
            that.getFormJson = function ($form) {
                if (!$form) {
                    $form = this.$target.children('form');
                }
                var json = [], reg_date = /<=\s('[^']+')/;

                var $inputs = $form.find("input[type!=button][type!='reset']");
                if ($inputs[0]) {
                    var operator = "like", $box, value, isDate = false;
                    var comboxOperator = {};
                    cto: for (var i = 0; i < $inputs.length; i++) {
                        $box = $($inputs[i]);
                        var name = $box.attr("name");
                        if (name && comboxOperator[name]) {
                            operator = comboxOperator[name];
                        }
                        if ($box.attr("operator")) {
                            operator = $box.attr("operator")
                        }
                        else if (operator == "like" && ($box.attr("configkey") || $box.attr("objname"))) {
                            operator = "=";
                        }

                        isDate = $box.attr("date") != undefined || isDate;
                        if (!name) {
                            name = $box.attr("comboname");
                            if (name) {
                                comboxOperator[name] = operator;
                            }
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
                        else if (operator == "likeor")//把 a,b,c 分解成 (like a or like b or like c) 
                        {
                            //树型下拉选择时，会用到
                            var firstOne = json.get("name", name);
                            if (firstOne) // 已存在
                            {
                                firstOne.value = firstOne.value + "," + value;
                                continue cto;
                            }
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
            };
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
            };
            that.BtnAdd = function () {
                function Obj() {
                    $Core.BtnBase.call(this);
                    //重新设定打开窗体的标题
                    this.winTitle = null;
                    //重新设定打开窗体的链接
                    this.winUrl = null;
                    //重新设定打开窗体的参数
                    this.opts = null;
                    /*
                        参数：para {}，包含的属性：addIndex, addRow, selectRow，
                    */
                    this.onBeforeExecute = function (para) { };
                    this.onExecute = function (dg, value, index, isSameLevel) {
                        var para = {};
                        var isTreeGrid = dg.isTreeGrid;
                        if (!this.winUrl && (dg.isEditor || isTreeGrid)) {
                            if ($Core.Private.Grid.Event.cancelEditing(dg)) {
                                //dg.PKColumn.Editor.action = "Add";
                                var appendRow = {};
                                if (dg.defaultInsertData) {
                                    appendRow = $.extend(appendRow, dg.defaultInsertData);
                                }
                                var addIndex;
                                if (isTreeGrid) {
                                    if (appendRow[dg.options.idField])//外部设置了值,tree是以主键id为索引
                                    {
                                        addIndex = appendRow[dg.options.idField];
                                    }
                                    else {
                                        addIndex = $Core.Utility.guid();
                                        appendRow[dg.options.idField] = addIndex;
                                    }
                                }
                                else {
                                    addIndex = dg.datagrid('getRows').length;
                                }
                                if (isTreeGrid) {
                                    appendRow = {
                                        parent: undefined,
                                        data: [appendRow]
                                    }
                                    var selectRow = dg.datagrid("find", index);
                                    if (selectRow) {
                                        appendRow.parent = isSameLevel == "true" ? selectRow[dg.options.parentField] : selectRow[dg.options.idField];
                                        appendRow.data[0][dg.options.parentField] = appendRow.parent;
                                    }
                                }
                                para.addIndex = addIndex;
                                para.addRow = appendRow;
                                para.selectRow = selectRow;
                                if (this.onBeforeExecute(para) == false) { return; };
                                dg.datagrid("appendRow", para.addRow);
                                $Core.Private.Grid.Event.exeBeginEditing(addIndex, para.addRow, dg, "Add");
                                //dg.PKColumn.Editor.editIndex = addIndex;//指定操作的索引
                                //dg.datagrid("refreshRow", addIndex);//变更按钮状态
                                //dg.datagrid('selectRow', addIndex);//光标定位到行
                                //dg.datagrid('beginEdit', addIndex);//开启编辑
                                this.onAfterExecute(para);
                            }
                        }
                        else {
                            $Core.Global.DG.operating = dg;
                            var href = location.href;
                            var splitIndex = href.indexOf('List') == -1 ? href.lastIndexOf('.') : href.lastIndexOf('List');
                            var viewLink = this.winUrl || href.substring(href.lastIndexOf('/') + 1, splitIndex) + 'Edit.html';
                            para.url = viewLink;
                            para.winTitle = this.winTitle;
                            para.opts = this.opts;
                            if (this.onBeforeExecute(para) == false) { return; };
                            $Core.Window.open(para.url, para.winTitle, false, para.opts);

                        }
                    };
                }
                return new Obj();
            }();
            that.BtnDelBatch = function () {
                function Obj() {
                    $Core.BtnBase.call(this);
                    this.onBeforeExecute = function (ids) { };
                    this.onAfterExecute = function (ids, responseText) { };
                    this.onExecute = function (dg, value, onBeforeEvent, onAfterEvent) {
                        var ids = new Array();
                        if (value) {
                            ids.push(value);//"'" + id + "'"
                        }
                        else {
                            var selRows = dg.getCheckIDs();
                            if (selRows.length == 0) {
                                $Core.Window.showMsg($Core.Lang.selectDelData);
                                return false;
                            }

                            ids = selRows;
                        }
                        if (onBeforeEvent) {
                            if (onBeforeEvent(ids) == false) { return false; }
                        }
                        else if (dg.ToolBar.BtnDelBatch.onBeforeExecute(ids) == false) {
                            return false;
                        }

                        $Core.Window.confirm($Core.Lang.isDel, null, function () {
                            var isIgnoreDeleteField = 1;
                            var isdeleted = AR.Global.Variable.isdeleted
                            if (isdeleted && dg.Internal.headerData.contains(isdeleted, "field")) {
                                isIgnoreDeleteField = 0;
                                var valueHasNoDeletedFlag = false;
                                var delArray = value ? dg.getSelectIDs(isdeleted) : dg.getCheckIDs(isdeleted);//遍历选中的
                                if (delArray) {
                                    for (var i = 0; i < delArray.length; i++) {
                                        if (!delArray[i]) {
                                            valueHasNoDeletedFlag = true;
                                            break;
                                        }
                                    }
                                }
                                if (!valueHasNoDeletedFlag) {
                                    isIgnoreDeleteField = 1;
                                }
                            }
                            $Core.Ajax.post("Delete", dg.tableName, { "id": ids.join(','), "foreignKeys": dg.foreignKeys, "idField": dg.options.idField, "parentField": dg.options.parentField, "isIgnoreDeleteField": isIgnoreDeleteField }, function (result) {
                                if (onAfterEvent) {
                                    if (onAfterEvent(ids, result) == false) { return false; }
                                }
                                else if (dg.ToolBar.BtnDelBatch.onAfterExecute(ids, result) == false) {
                                    return;
                                }
                                if (result.success != undefined && result.success) {
                                    $Core.Window.showMsg($Core.Lang.delSuccess);
                                    if (dg.options.pagination || !dg.isTreeGrid) {
                                        dg.reload();
                                    }
                                    else {//不分页，时，只移除当前节点，避免树型节点太大。
                                        var rows = dg.getCheckIDs(dg.options.idField);
                                        for (var i = rows.length - 1; i >= 0; i--) {
                                            dg.datagrid("deleteRow", rows[i]);
                                        }
                                        rows = null;
                                    }
                                    dg.datagrid("clearChecked");//清掉缓存的数据。
                                } else {
                                    $Core.Window.showMsg($Core.Lang.delError + $Core.Lang.errorInfo + result.msg);
                                }
                            });
                        });
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
                    this.onAfterExecute = function (data) { },
                    this.onExecute = function (dg) {
                        var opts = {};
                        var url = $Core.Utility.stringFormat($Core.Global.route + '?sys_method=Import&sys_objName={0}&sys_tableName={1}&sys_mid={2}', dg.objName, dg.tableName, $Core.Global.Variable.mid);
                        opts.action = url;
                        opts.onSubmit = function (dg) {
                            return function (file, ext) {
                                if (ext == "xls" || ext == "xlsx" || ext == "zip" || ext == "rar") {
                                    $.messager.progress({
                                        title: $Core.Lang.msg,
                                        msg: $Core.Lang.importTip
                                    });
                                }
                                else {
                                    $Core.Window.showMsg($Core.Lang.uploadExtendName + ext);
                                    return false;
                                }
                                var param = {};
                                if (dg.ToolBar.BtnImport.onBeforeExecute(param) == false) {
                                    return false;
                                }
                                this.setData(param);
                            }
                        }(dg);
                        opts.onComplete = function (dg) {
                            return function (file, data) {
                                //file 是文件名,data 是返回的东西
                                $.messager.progress('close');
                                if (typeof (data) == "string") {
                                    data = JSON.parse(data);
                                }
                                if (data.success) {
                                    $Core.Window.showMsg(data.msg);
                                    dg.reload();
                                }
                                else {
                                    data.msg = data.msg.replace(/&/g, '&amp').replace(/\"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace("\"", "'");
                                    var tip = "<div>" + $Core.Lang.importError + "<a title=\"" + data.msg + "\" onclick=\"javascript:alert(this.title)\"><font color='red'>" + $Core.Lang.errorInfo + "</font></a></div>";
                                    $Core.Window.showMsg(tip, null, null, 8000);//"导入失败！"
                                    if (data.sys_down != undefined) {
                                        $Core.Utility.download('Down', { 'sys_down': data.sys_down });
                                    }

                                }
                                dg.ToolBar.BtnImport.onAfterExecute(data);
                            }
                        }(dg);

                        new $Core.Upload(this.$target[0], opts);
                    }
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
                        // var targetForm = $("#" + dg.ToolArea.id).find(".grid-toolbar").siblings("div").find('form');
                        var checked_ids = dg.getCheckIDs();
                        var jsonString = "";
                        if (checked_ids.length > 0) {
                            jsonString = checked_ids.join(',');
                        }
                        else {
                            var searchJson = dg.Search.getFormJson();
                            if (dg.options.defaultWhere && dg.options.defaultWhere.length > 0) {
                                searchJson = searchJson.concat(dg.options.defaultWhere);
                            }
                            jsonString = JSON.stringify(searchJson);
                        }
                        //window.open(ajaxOptions.href + '?objName=' + objName + '&sys_search='+jsonString, '_self');      
                        var iframeName = "framePost";
                        var url = $Core.Ajax.Settings.url + "?sys_objName=" + dg.objName + "&sys_tableName=" + objName + "&sys_method=Export";
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
                        form_export = $("<form>").attr("action", $Core.Global.route).attr("target", iframeName).attr("id", "form_template");
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

            that.onExecute = function (dg) {
                if (that.onBeforeExecute() != false) {
                    $Core.Common.Html.createToolBar(dg);
                    that.onAfterExecute();
                }
            };
            ///注册工具栏按钮事件（由框架自动调用）
            that.regEvent = function (dg) {
                var toolbar = dg.ToolBar.$target;
                if (!toolbar || !toolbar[0]) {
                    //throw new ReferenceError("工具条的id无效,页面未找到该id值的HTML标签");
                    return;
                }

                toolbar.delegate("[flag = 'btn_add']", "click", function () {
                    dg.ToolBar.BtnAdd.onExecute(dg);
                });

                toolbar.delegate("[flag = 'btn_del']", "click", function () {
                    dg.ToolBar.BtnDelBatch.onExecute(dg);
                });
                //导出

                toolbar.delegate("[flag = 'btn_export']", "click", function () {
                    dg.ToolBar.BtnExport.onExecute(dg);
                });
                //导出模板
                toolbar.delegate("[flag = 'btn_export_template']", "click", function () {
                    dg.ToolBar.BtnExportTemplate.onExecute(dg);
                });

                //导入按钮事件,执行注册上传组件
                var $btnImport = toolbar.find("[flag = 'btn_import']");
                if ($btnImport[0]) {
                    dg.ToolBar.BtnImport.onExecute(dg);
                }
            };
        },
        ContextMenu: {
            Header: function () {
                this.isHidden = false;
                //右键菜单点击的列名
                this.field = "";
                this.Items = [{ "text": $Core.Lang.config, "onclick": "AR.Common.Event.onConfigClick", "lv2action": "config" }];
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
            Row: function (isTreeGrid) {
                this.isHidden = isTreeGrid;
                if (isTreeGrid) {

                    this.Items = [{ "text": $Core.Lang.addSameLevel, "onclick": "AR.Common.Event.onAdd,true", "lv2action": "add" },
                        { "text": $Core.Lang.addChild, "onclick": "AR.Common.Event.onAdd,false", "lv2action": "add" },
                        { "text": $Core.Lang.edit, "onclick": "AR.Common.Event.onEdit", "lv2action": "edit" },
                        { "text": $Core.Lang.del, "onclick": "AR.Common.Event.onDel", "lv2action": "del" }
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
            initMenu: function (dg, e, index, row) {
                e.preventDefault();
                if (row) {
                    var selectValue = dg.isTreeGrid ? row[dg.options.idField] : index;
                    dg.datagrid('select', selectValue);
                    if (!dg.rowMenu) {
                        dg.rowMenu = $('<div/>').appendTo('body');
                        this.regEvent(dg.RowMenu.Items, dg, dg.rowMenu);
                    }
                    if (dg.rowMenu.hasMenu) {
                        dg.rowMenu.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    }
                }
                else {

                    if (!dg.headMenu) {
                        dg.headMenu = $('<div/>').appendTo('body');
                        this.regEvent(dg.HeaderMenu.Items, dg, dg.headMenu);
                    }
                    if (dg.headMenu.hasMenu) {
                        dg.headMenu.menu('show', {
                            left: e.pageX,
                            top: e.pageY
                        });
                    }
                    dg.HeaderMenu.field = index;//右键的字段名。
                }
            },
            regEvent: function (items, dg, $menu) {
                var actionKeys = $Core.Global.Variable.actionKeys;
                if (!actionKeys) { return; }
                $menu.menu({});
                $menu.hasMenu = false;
                for (var i = 0; i < items.length; i++) {
                    var menu = items[i];
                    if (actionKeys.indexOf(',' + menu.lv2action + ',') != -1) {
                        $menu.hasMenu = true;
                        if (typeof (menu.onclick) == "string") {
                            menu.onclick = function (el, gridid, items) {
                                try {
                                    var _fntt = eval(items[0]);
                                } catch (e) { }
                                var para = items.length > 1 ? items[1] : undefined;//isSameLevel
                                return function () {
                                    var dg = $Core.Global.DG.Items[gridid];
                                    var row = dg.datagrid("getSelected");
                                    if (row) {
                                        _fntt(el, gridid, row[dg.Internal.primarykey], row[dg.options.idField], para);
                                    } else {
                                        _fntt(el, gridid, para);
                                    }
                                };
                            }(this, dg.id, menu.onclick.split(','));
                        }
                        $menu.menu('appendItem', menu);
                    }
                }

            }

        },
        PKColumn: function (dg) {
            var that = this;
            $Core.BtnBase.call(that);
            //存档每行的主键列信息，只能在数据呈现之后获取,如onLoadSuccess事件
            that.Items = new $Core.Dictionary();
            that._btnArray = new Array();
            /**
            *如果设置clickName url&winTitle则无效
            *@param{string} key 即指向AR.Global.DG.PKTemplate的属性值
            *@param{string} title 鼠标划过显示的文字
            *@param{string} clickName 事件名
            *@param{string} url 打开页面的URL
            *@param{string} winTitle 打开窗口的标题
            *@param{string} lv2action 二级权限名称
            *@param{json} opts window窗体的参数可以指定宽高等属性
            */
            that.add = function (key, title, clickName, url, winTitle, lv2action, opts) {
                var btn = $Core.Global.DG.PKTemplate[key];
                if (btn == undefined) {
                    btn = '<span  title="' + key + '" >' + key + '</span>';
                }
                btn = $(btn)[0];
                //设置添加按钮的连接
                if (key == 'edit') {
                    dg.ToolBar.BtnAdd.winUrl = url;
                    dg.ToolBar.BtnAdd.winTitle = (winTitle || "").replace($Core.Lang.edit, $Core.Lang.add);
                    dg.ToolBar.BtnAdd.opts = opts;
                }
                url && btn.setAttribute("url", url);
                winTitle && btn.setAttribute("winTitle", winTitle);
                title && btn.setAttribute("title", title);
                clickName && clickName != "null" && btn.setAttribute("click", clickName) && btn.setAttribute("hasClick", "1");
                btn.key = key;
                btn.opts = opts
                btn.lv2action = lv2action || key;
                //var actionKeys = $Core.Global.Variable.actionKeys;//改异步后，这里不能进行权限过滤,内部做权限过滤
                //if ((actionKeys && actionKeys.indexOf(lv2action) != -1) || !lv2action) {
                this._btnArray.push(btn);
                // }
            };

            //打开业务页面
            that.open = function (el, gridid, pkValue, index, opts) {
                var dg = $Core.Global.DG.operating = $Core.Global.DG.Items[gridid]; //赋值当前对象到page属性方便调用
                var $aTarget = $(el);
                var op = $aTarget.attr("op");
                var splitIndex = location.href.indexOf('List') == -1 ? location.href.indexOf('.') : location.href.indexOf('List');
                var url = $aTarget.attr("url") || dg.ToolBar.BtnAdd.winUrl || location.href.substring(location.href.lastIndexOf('/') + 1, splitIndex) + 'Edit.html';
                var winTitle = $aTarget.attr("winTitle");
                var _fn = $aTarget.attr("click");
                try {
                    _fn = eval(_fn);
                } catch (e) {
                    _fn = undefined;
                }
                if (_fn && typeof (_fn) == "function") {
                    dg.datagrid('selectRecord', pkValue);
                    var row = dg.getSelected();
                    _fn(pkValue, row, index, el);
                } else {
                    url = url.indexOf("?") == -1 ? url + "?id=" + pkValue : url + "&id=" + pkValue;
                    var _match = url.match(/\{([\S\s]*?)\}/g);//匹配自定义标签,如：{name}
                    if (_match) // add by cyq 2016-08-17
                    {
                        var _row = dg.getSelected();//获取行数据
                        for (var i = 0; i < _match.length; i++) {
                            var _matchValue = _match[i];
                            var _key = _matchValue.substring(1, _matchValue.length - 1);
                            var _value = _row[_key];
                            if (_value) {
                                url = url.replace(_matchValue, _value);
                            }
                        }
                    }
                    $Core.Window.open(url, (winTitle || " "), op == 1, opts);
                }

            };
            //行内编辑工具栏（编辑、删除、保存、取消）
            that.Editor = function () {
                var Obj = new Object();
                this.editIndex = null;
                this.editField = null;
                //动作：Add、Update
                this.action = null;

                /*属性标识保存数据是否实时更新*/
                Obj.isSaveToBehind = true;
                Obj.BtnEdit = (function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.hidden = false;
                        this.onBeforeExecute = function (value, index) { };
                        this.onAfterExecute = function (value, index) { };
                        this.onExecute = function (dg, value, index) {
                            //检测是否存在编辑状态的数据，默认会触发点击事件进行保存
                            //if (dg.PKColumn.Editor.editIndex != null && dg.PKColumn.Editor.editIndex != undefined) {
                            //    dg.PKColumn.Editor.BtnSave.onExecute(dg);
                            //}
                            //把行设置为编辑状态,操作符设置为更新状态,设置为新增状态在添加按钮事件时触发
                            if (dg.PKColumn.Editor.action == "Add" && dg.datagrid("getEditors", index).length > 0) {
                                return;
                            }
                            if (this.onBeforeExecute(value, index) == false) {
                                return;
                            }
                            $Core.Private.Grid.Event.exeClick(index, null, dg, true);//双击事件需要编辑权限。
                            //if ($Core.Private.Grid.Event.exeEndEditing(dg)) {
                            //    $Core.Private.Grid.Event.exeBeginEditing(index, null, dg);
                            //}
                            this.onAfterExecute(value, index);
                        };

                    }
                    return new Obj();
                })();
                Obj.BtnDel = (function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.hidden = false;
                        this.onBeforeExecute = function (value, index) { };
                        this.onAfterExecute = function (value, index, responseText) { };
                        this.onExecute = function (dg, value, index) {
                            if ($Core.Private.Grid.Event.exeEndEditing(dg) && value) {
                                dg.ToolBar.BtnDelBatch.onExecute(dg, value, this.onBeforeExecute, this.onAfterExecute);
                                //if (this.onBeforeExecute(value, index) == false) {
                                //    return;
                                //}

                                //$Core.Window.confirm($Core.Lang.isDel, null, function () {
                                //    $Core.Ajax.post("Delete", dg.tableName, { id: value, "foreignKeys": dg.foreignKeys, "idField": dg.options.idField, "parentField": dg.options.parentField }, function (result) {
                                //        if (result.success) {
                                //            dg.datagrid('deleteRow', index);
                                //        }
                                //        $Core.Window.showMsg(result.msg);
                                //        dg.PKColumn.Editor.BtnDel.onAfterExecute(value, index, result);//回调中不能用this
                                //    });

                                //});
                            }
                        };

                    }
                    return new Obj();
                })();
                Obj.BtnSave = (function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.hidden = false;
                        //参数：主键值，行索引，Post的json数据
                        this.onBeforeExecute = function (value, index, postData) { };
                        this.onAfterExecute = function (value, index, postData, responseText) { };
                        this.onExecute = function (dg, value, index) {
                            if (index == undefined) {
                                index = dg.PKColumn.Editor.editIndex;
                            }
                            //如果编辑状态则保存数据操作，如果新增状态，则插入数据的操作
                            if (index != dg.PKColumn.Editor.editIndex || index == null) {
                                return false;
                            }
                            if (this.onBeforeExecute(value, index) == false) {
                                return false;
                            }
                            var isAdd = dg.PKColumn.Editor.action == "Add";
                            AR.Private.Grid.Event.exeSave(dg, index, function (index) {
                                return function (isSuccess) {
                                    dg.PKColumn.Editor.editIndex = null;
                                    //如果编辑状态则取消操作，删除状态则删除行
                                    if (!isSuccess) {
                                        if (isAdd) {
                                            dg.datagrid('deleteRow', index);
                                        } else {
                                            //_editSave中已经endEdit过一次，再cacleEdit无法触发pkFormatter变更图标,reflreshRow能再触发事件
                                            dg.datagrid('refreshRow', index);
                                        }
                                    }
                                    else { dg.datagrid('refreshRow', index); }
                                }
                            }(index));
                        };

                    }
                    return new Obj();
                })();
                Obj.BtnCancel = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.hidden = false;
                        this.onBeforeExecute = function (value, index) { };
                        this.onAfterExecute = function (value, index) { };
                        this.onExecute = function (dg, value, index) {
                            if (this.onBeforeExecute(value, index) == false) {
                                return;
                            }
                            if (!index) { index = dg.PKColumn.Editor.editIndex; }
                            dg.PKColumn.Editor.editIndex = null;//下面的会变更状态。
                            if (dg.datagrid("getEditors", index).length > 0) {
                                //如果编辑状态则取消操作，删除状态则删除行
                                if (dg.PKColumn.Editor.action == "Add") {
                                    dg.datagrid('deleteRow', index);
                                } else {
                                    dg.datagrid('cancelEdit', index);
                                }
                            }
                            else { dg.datagrid('refreshRow', index); }
                            this.onAfterExecute(value, index)
                        };

                    }
                    return new Obj();
                }();
                return Obj;

            }();
            //参数：value, row, index, btnArray
            that.onBeforeExecute = function () { };
            //参数：value, row, index, $div
            that.onAfterExecute = function () { };
            //注册键盘按下事件
            that.regEvent = function (dg) {
                document.onkeydown = function (e) {
                    var ev = document.all ? window.event : e;
                    //console.log(ev.keyCode);
                    if (ev.keyCode == 27) //Esc
                    {
                        dg.PKColumn.Editor.BtnCancel.onExecute(dg);
                        return false;
                    }
                    else if (ev.keyCode == 13) // Enter
                    {
                        dg.PKColumn.Editor.BtnSave.onExecute(dg);
                        return false;
                    }
                    else if (ev.keyCode == 38) // Up
                    {
                        that.onPressUpKey(dg); return false;
                    }
                    else if (ev.keyCode == 40) // Down
                    {
                        that.onPressDownKey(dg); return false;
                    }

                }
            };
            that.onPressUpKey = function (dg) {
                var editIndex = dg.PKColumn.Editor.editIndex;
                if (editIndex == undefined || editIndex == null) { return false; }
                var index = -1;
                if (dg.isTreeGrid) {
                    var data;
                    //先找父节点
                    var parentid = dg.datagrid("find", editIndex)[dg.options.parentField];
                    if (parentid != undefined && parentid != "" && parentid != null) {
                        var row = dg.datagrid("find", parentid);
                        data = row && row.children;
                    }
                    if (!data) {
                        data = dg.datagrid("getData");
                    }
                    if (data && data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i][dg.options.idField] == editIndex) {
                                if (i > 0) {
                                    index = data[i - 1][dg.options.idField];
                                }
                                break;
                            }
                        }
                    }

                }
                else {
                    var index = dg.PKColumn.Editor.editIndex - 1;
                }
                if (index > -1) {
                    dg.PKColumn.Editor.BtnEdit.onExecute(dg, null, index);
                }
            };
            that.onPressDownKey = function (dg) {
                var index = dg.PKColumn.Editor.editIndex + 1;


                var editIndex = dg.PKColumn.Editor.editIndex;
                if (editIndex == undefined || editIndex == null) { return false; }
                var index = -1;
                if (dg.isTreeGrid) {
                    var data;
                    //先找父节点
                    var parentid = dg.datagrid("find", editIndex)[dg.options.parentField];
                    if (parentid) {
                        var row = dg.datagrid("find", parentid);
                        data = row && row.children;
                    }
                    if (!data) {
                        data = dg.datagrid("getData");
                    }
                    if (data && data.length > 0) {
                        for (var i = 0; i < data.length; i++) {
                            if (data[i][dg.options.idField] == editIndex) {
                                if (i < data.length - 1) {
                                    index = data[i + 1][dg.options.idField];
                                }
                                break;
                            }
                        }
                    }

                }
                else {
                    var rows = dg.datagrid("getRows");
                    if (rows && editIndex + 1 < rows.length) {
                        index = editIndex + 1;
                    }

                }

                if (index > -1) {
                    dg.PKColumn.Editor.BtnEdit.onExecute(dg, null, index);
                }
            };
        },
        Event: {
            exeClick: function (clickIndex, row, dg, isDbClick) {

                var that = this;
                var editIndex = dg.PKColumn.Editor.editIndex;
                // console.log("isDbClick:" + isDbClick + " clickIndex:" + clickIndex + " editIndex:" + editIndex);
                if (editIndex == undefined || editIndex == null || editIndex == clickIndex) {
                    isDbClick && that.exeBeginEditing(clickIndex, row, dg);
                    return false;
                }
                var editIndex = dg.PKColumn.Editor.editIndex;
                if (dg.datagrid('validateRow', editIndex)) {
                    that.exeSave(dg, editIndex, function (isSuccess) {
                        //  console.log("exeSave:" + isSuccess + " isDbClick:" + isDbClick + " clickIndex:" + clickIndex + ", editIndex:" + dg.PKColumn.Editor.editIndex);
                        if (isSuccess) {
                            dg.PKColumn.Editor.editIndex = null;
                            dg.datagrid('refreshRow', editIndex);

                        }
                        that.exeEndEditing(dg);
                        isDbClick && that.exeBeginEditing(clickIndex, row, dg);
                    });
                }
                else if (this.exeEndEditing(dg)) {
                    isDbClick && that.exeBeginEditing(clickIndex, row, dg);
                }
            },
            //操作删除之前的动作。
            cancelEditing: function (dg) {
                if (dg.PKColumn.Editor.editIndex != null) {
                    var index = dg.PKColumn.Editor.editIndex;
                    dg.PKColumn.Editor.editIndex = null;
                    if (dg.PKColumn.Editor.action == "Add") {
                        dg.datagrid('deleteRow', index);
                    }
                    else { dg.datagrid('cancelEdit', index); }
                }
                return true;
            },
            //作用就是把已经打开的编辑状态给关闭。
            exeEndEditing: function (dg) {
                if (dg.PKColumn.Editor.editIndex == null) { return true; }
                var index = dg.PKColumn.Editor.editIndex;
                if (dg.datagrid('validateRow', index)) {
                    dg.PKColumn.Editor.editIndex = null;
                    dg.datagrid('endEdit', index);
                    dg.datagrid('refreshRow', index);
                    //dg.datagrid("rejectChanges");
                    return true;
                } else {
                    //dg.datagrid('cancelEdit', index);
                    return false;
                }
            },
            exeBeginEditing: function (index, row, dg, action) {
                dg.PKColumn.Editor.editIndex = index;
                dg.datagrid('refreshRow', index);
                dg.PKColumn.Editor.action = action || 'Update';
                dg.datagrid('selectRow', index);
                dg.datagrid('beginEdit', index);

                var isAdd = dg.PKColumn.Editor.action == "Add";
                for (var i = 0; i < dg.Internal.jointPrimary.length; i++) {
                    var primary = dg.datagrid("getEditor", { index: index, field: dg.Internal.jointPrimary[i] });
                    primary && primary.target.attr('disabled', 'disabled');
                }
                if (!row) {
                    row = dg.getSelected();
                }

                //绑定下拉框数据
                var rowEditors = dg.datagrid("getEditors", dg.PKColumn.Editor.editIndex);
                var items = [];
                for (var i = 0, len = rowEditors.length; i < len; i++) {
                    var editor = rowEditors[i];
                    var $input = editor.target;
                    var field = editor.field;
                    var col = dg.Internal.headerData.get("field", field);
                    if (!isAdd && !col.edit) {
                        $input.attr('disabled', 'disabled');
                        continue;
                    }
                    if (col.rules && typeof col.rules == "object") {
                        // //处理弹窗绑定 dialogforadd ,dialogforedit
                        if (isAdd && col.rules["nameforadd"]) {
                            var lowerName=col.rules["nameforadd"].toLowerCase();
                            $input.attr("name", lowerName);
                            editor.field = lowerName;
                            $Core.Combobox.bind($input);
                        }
                        else if (col.rules["nameforedit"]) {
                            var lowerName=col.rules["nameforedit"].toLowerCase();
                            $input.attr("name",lowerName);
                            editor.field = lowerName;
                            $Core.Combobox.bind($input);
                        }
                    }

                    $input.attr("field", field);
                    $input.focus(function () {
                        dg.PKColumn.Editor.editField = $(this).attr("field");

                    });
                    if (editor.field == dg.PKColumn.Editor.editField && $input) {
                        try {
                            $input.focus();
                        }
                        catch (e) {
                            console.log(e);
                        }
                    }
                    if (editor.type == 'combobox') {
                        var options = $Core.Combobox.setAttr($input, "options");
                        if (options) {
                            var attrs = options.attrs;
                            //alert(JSON.stringify(attrs));
                            for (var key in attrs) {
                                switch (key.toLowerCase()) {
                                    case "multipleforadd":
                                        if (isAdd) {
                                            $input.attr("multiple", attrs[key]);
                                        }
                                        break;
                                    case "multipleforedit":
                                        $input.attr("multiple", attrs[key]);
                                        break;
                                    case "configkeyeforadd":
                                        if (isAdd) {
                                            $input.attr("configkey", attrs[key]);
                                        }
                                        break;
                                    case "configkeyforedit":
                                        $input.attr("configkey", attrs[key]);
                                        break;
                                    case "objnameforadd":
                                        if (isAdd) {
                                            $input.attr("objname", attrs[key]);
                                        }
                                        break;
                                    case "objnameforedit":
                                        $input.attr("objname", attrs[key]);
                                        break;
                                    default:
                                        $input.attr(key, attrs[key]);
                                        break;
                                }
                                if (key.toLowerCase() == "multipleforedit") {
                                    $input.attr("multiple", attrs[key]);
                                } else {
                                    $input.attr(key, attrs[key]);
                                }
                            }
                            //判断是否必填：

                            if (col && col.datatype) {
                                var values = col.datatype.split(',');
                                if (values.length >= 4 && values[3] == "1") {
                                    $input.attr("defaultItem", false);
                                }
                            }
                            $input.attr("width", $input.parent().width());
                            $input.attr("isEditor", true);
                            $input.attr("gridid", dg.id);

                            items.push($input);
                        }
                    }
                    else if (editor.type == 'validatebox') {
                        var col = dg.Internal.headerData.get("field", field);
                        if (col) {
                            var vType = "";
                            if (col.rules && typeof col.rules == "object") {
                                if (col.rules["validtype"]) {
                                    vType = col.rules["validtype"];
                                }
                                // //处理弹窗绑定 dialogforadd ,dialogforedit
                                if (isAdd && col.rules["dialogforadd"]) {
                                    $input.attr("dialog", col.rules["dialogforadd"]);
                                    $Core.Combobox.bind($input);
                                }
                                else if (col.rules["dialogforedit"]) {
                                    $input.attr("dialog", col.rules["dialogforedit"]);
                                    $Core.Combobox.bind($input);
                                }
                            }
                            if (col.importunique) {
                                vType = "exists['" + field + "','" + row[dg.Internal.primarykey] + "'" + (vType ? ",'" + vType + "'" : "") + "]";
                            }
                            if (vType) {
                                $input.validatebox({
                                    validType: vType
                                });
                            }

                        }
                        if (row[col.field] && typeof row[col.field] == "object") {
                            $input.val(JSON.stringify(row[col.field]));
                        }
                    }
                }
                if (items.length > 0) {
                    for (var i = 0; i < items.length; i++) {
                        $Core.Combobox.bind(items[i]);
                    }
                    for (var i = 0; i < items.length; i++) {
                        $Core.Combobox.setValue(items[i], row[items[i].attr("field")]);
                    }
                }

                dg.options.onEditing && dg.options.onEditing(index, row);


            },

            exeSave: function (dg, index, callBack) {
                var that = this;
                var editResult = false;
                var editors = dg.datagrid("getEditors", index);
                if (editors.length > 0 && dg.datagrid('validateRow', index)) {
                    var isTreeTrid = dg.isTreeGrid;
                    var row = null;
                    if (isTreeTrid) {
                        row = $.extend(true, {}, dg.datagrid("find", index));
                    }
                    else {
                        //data只存档1级的数据，不适合treegrid
                        row = $.extend(true, {}, $.data(dg.$target[0], "datagrid").data.rows[index]);
                    }
                    //结束之前要取值。
                    var editValues = {};
                    //追加不存在的字段
                    //遍历编辑器，再取一遍值。【支持更多行内的配置项】
                    for (var i in editors) {
                        var editor = editors[i];
                        if (editor.type) {
                            if (editor.type == "combobox" || editor.target.attr("dialog")) {
                                editValues[editor.field] = $Core.Combobox.getValue(editor.field);
                            }
                            else {
                                editValues[editor.field] = editor.target.val();
                            }
                        }
                    }
                    if (row) {
                        var isAdd = dg.PKColumn.Editor.action == "Add";
                        try {
                            dg.datagrid("endEdit", index); //结束编辑行，如果TreeGrid改变idField，会有异步。
                        } catch (e) { }
                        var changes = dg.datagrid("getChanges");//_type 结束编辑后，才有Changes的数据。
                        var _change_data =  changes[changes.length - 1]; //获取行数据
                        if (_change_data) {
                            if (dg.PKColumn.Editor.isSaveToBehind == false) {
                                dg.datagrid("acceptChanges");
                            }
                            else {
                                var post_data = {};
                                if (isAdd && dg.defaultInsertData) {
                                    post_data = $.extend(true, _change_data, row);
                                } else {
                                    post_data = that.getChangeJson(_change_data, row, dg);
                                }
                                //追加不存在的字段
                                //遍历编辑器，再取一遍值。【支持更多行内的配置项】
                                var isNeedReload = false;
                                for (var key in editValues) {
                                    if (post_data[key] == undefined && row[key]==undefined) {
                                        post_data[key] = editValues[key];
                                        isNeedReload = true;
                                    }
                                }
                                if (!$.isEmptyObject(post_data)) //{ dg.datagrid('cancelEdit', index); }
                                    //else
                                {
                                    for (var i = 0; i < dg.Internal.jointPrimary.length; i++) {
                                        var primary = dg.Internal.jointPrimary[i];
                                        row[primary] && (post_data[primary] = row[primary]);//附加主键的id值传入后台 
                                    }
                                    var value = dg.getPrimaryID(row);
                                    if (dg.PKColumn.Editor.BtnSave.onBeforeExecute(value, index, post_data) != false) {
                                        editResult = true;
                                        $Core.Ajax.post(dg.PKColumn.Editor.action, dg.tableName, post_data, function (result) {
                                            if (result) {
                                                if (result.success) {
                                                    if (isAdd) {
                                                        _change_data[dg.Internal.primarykey] = result.msg;//这里才是将id写回去的地方。
                                                        result.msg = $Core.Lang.addSuccess;
                                                    }
                                                    if (isTreeTrid && index != _change_data[dg.options.idField]) {
                                                        //树型节点，修改了idField，则刷新。
                                                        dg.reload();
                                                    }
                                                    dg.datagrid("acceptChanges");
                                                    dg.PKColumn.Editor.BtnSave.onAfterExecute(value, index, post_data, result);
                                                }
                                                else {
                                                    dg.datagrid('cancelEdit', index);
                                                }
                                                dg.PKColumn.Editor.action = undefined;
                                                callBack && callBack(result.success);//异步的回调处理
                                                $Core.Window.showMsg(result.msg);
                                                if (isNeedReload)
                                                {
                                                    dg.reload();
                                                }
                                            }
                                        });
                                    }
                                }
                            }
                        }

                    }
                }
                if (!editResult) {
                    dg.PKColumn.Editor.action = undefined;
                    callBack && callBack(false);//非异步的处理
                }
            },

            //用于检测值是否被修改了，如果修改了，只提取出修改过的值。
            getChangeJson: function (newJson, oldJson, dg) {
                var changeJson = {};
                var count = 0;
                if (oldJson && oldJson[dg.Internal.primarykey] == newJson[dg.Internal.primarykey]) {
                    for (var item in newJson) {
                        if (newJson[item] == undefined) { continue; }
                        if ((oldJson[item] == undefined && newJson[item].toString() != "") ||
                            oldJson[item] != undefined && oldJson[item].toString() != newJson[item].toString()) {
                            changeJson[item] = newJson[item];
                            count++;
                        }
                    }
                }
                return changeJson;
            }
        }
    }

}(jQuery, AR);

+function ($, $Core) {
    var method = "GetInitConfig";
    if (parent.AR && parent.AR.Config.data) {
        $Core.Config.data = parent.AR.Config.data;
    }
    else {
        method += ",GetKeyValueConfig";
    }
    /**
   *该文件依赖与AR.Core.Utility.js文件
   */
    $Core.Ajax.post(method, null, null, function (result) {
        if (result) {
            if (result.GetKeyValueConfig) {
                $Core.Global.Variable = result.GetInitConfig;
                $Core.Config.data = result.GetKeyValueConfig;
            }
            else {
                $Core.Global.Variable = result;
            }
            if ($Core.Global.Variable.mid == "" && $Core.Global.Variable.actionKeys == "" && parent.AR) {
                $Core.Global.Variable = parent.AR.Global.Variable;
            }
            $Core.Global.Variable.isLoadCompleted = true;
        }
    });
    //==================================Internal Function Region======================================================
    /** new AR.DataGrid(...);
        *objName：视图名，表名，或者sql文件指定的路径
        *tbName:指定的操作主表名称
        *id 默认值 dg      
        *isTreeGrid 默认false(datagrid)，可设值为true(treegrid) 
        */
    $Core.DataGrid = function (objName, tbName, id, isTreeGrid) {
        //内部变量
        this.Internal = {
            //第一个主键
            primarykey: null,
            //数组：联合主键
            jointPrimary: [],
            //数组：请求头数据
            headerData: new Array(),
            //DataGrid是否已加载完成
            isLoadCompleted: false
        };
        this.id = id || 'dg';
        this.isTreeGrid = isTreeGrid || isTreeGrid == "treegrid";
        //主表名
        this.tableName = tbName || objName;
        //对象（视图）名称
        this.objName = objName;
        //删除时指定的关联外键,如："TableA.ColumnNameA,TableB.ColumnNameB"
        this.foreignKeys = "";
        //是否显示复选框
        this.isShowCheckBox = true;
        //是否启用行内编辑
        this.isEditor = false;
        this.options = $.extend(true, {}, $Core.Global.DG.DefaultConfig);//事先设置是为了有提示。
        //Json：需要追求的请求数据(GetHeader也会追加）。
        this.options.queryParams = {};
        //数组：可通过addWhere方法操作。
        this.options.defaultWhere = [];
        /*可以事先构建，产生插时行时的默认值*/
        this.defaultInsertData = {};
        //对defaultWhere的操作
        this.addWhere = function (name, value, operator, isOr) {
            if (name && (value != undefined || operator != undefined)) {
                if (!operator) { operator = "="; }
                if (!this.options.defaultWhere) {
                    this.options.defaultWhere = [];
                }
                isOr = (isOr == true ? "or" : "and");
                this.removeWhere(name);//若有则移除。
                this.options.defaultWhere.push({ name: name, value: value, pattern: operator, OrAnd: isOr });
            }
            return this;
        };
        this.removeWhere = function (name) {
            if (name && this.options.defaultWhere && this.options.defaultWhere.length > 0) {
                this.options.defaultWhere.remove(name, "name");
            }
            return this;
        };
        //增加排序条件，如："xx1 desc,xx2 asc"
        this.orderBy = function (orderBy) {
            this.options.sortName = orderBy;
        };
        this.$target = null;
        //easyui 的原生 datagrid 操作。
        this.datagrid = function (v1, v2) {
            if (this.isTreeGrid) {
                switch (v1) {
                    case "getRows":
                        v1 = "getData";
                        break;
                    case "getRowIndex":
                        return v2[this.options.idField];
                    case "deleteRow":
                        return this.$target.treegrid("remove", v2);//先删
                    case "appendRow":
                        v1 = "append";
                        break;
                    case "reload":
                        this.$target.treegrid("unselectAll");
                        this.$target.treegrid("uncheckAll");
                        break;
                }
                return v2 != undefined ? this.$target.treegrid(v1, v2) : this.$target.treegrid(v1);
            }
            else {
                switch (v1) {
                    case "deleteRow":
                        this.$target.datagrid(v1, v2);
                        return this.$target.treegrid("acceptChanges");
                    case "reload":
                        this.$target.datagrid("unselectAll");
                        this.$target.datagrid("uncheckAll");
                        this.$target.datagrid("clearChecked"); //清掉缓存的数据。
                        break;
                    case "select":
                        v1 = "selectRow";
                        break;
                }
                return v2 != undefined ? this.$target.datagrid(v1, v2) : this.$target.datagrid(v1);
            }
        };
        //数组：获取列表的选中项
        this.getChecked = function () {
            if (this.$target == null) {
                return [];
            }
            return this.datagrid("getChecked");
        };
        this._GetIDs = function (type, key) {
            if (this.$target == null) {
                return [];
            }
            var rows = this.datagrid(type);
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(this.getPrimaryID(rows[i], key));
            }
            return ids;
        };
        //string ：获得主键的id
        this.getPrimaryID = function (row, key) {
            var id = "";
            if (!key && this.Internal.jointPrimary.length > 1) {
                for (var j = 0; j < this.Internal.jointPrimary.length; j++) {
                    if (j > 0) {
                        id += ";";
                    }
                    id += row[this.Internal.jointPrimary[j]];
                }
            }
            else {
                id = row[key || this.Internal.primarykey];
            }
            return id;
        };
        //数组：获取列表的选中项，返回ids
        this.getCheckIDs = function (key) {
            return this._GetIDs("getChecked", key);
        };
        //数组：获取列表的选中项，返回ids
        this.getSelectIDs = function (key) {
            return this._GetIDs("getSelections", key);
        };
        //数组：返回当前选中的行
        this.getSelected = function () {
            if (this.$target == null) {
                return [];
            }
            return this.datagrid("getSelected");
        };
        //数组：返回当前绑定的数据行
        this.getData = function () {
            if (this.$target == null) {
                return [];
            }
            return this.datagrid("getData");
        };
        //重新加载绑定项
        this.reload = function () {
            if (this.$target == null) {
                return;
            }
            this.Search.reloadGrid(this);
            //$Core.Common._Internal.reloadGrid(this);
        };
        //主键列对象，可对按钮进行操作
        this.PKColumn = new $Core.Private.Grid.PKColumn(this);
        //搜索区
        this.Search = new $Core.Private.Grid.Search();
        //工具栏区
        this.ToolBar = new $Core.Private.Grid.ToolBar();
        //系统默认的表格列的各种格式化函数
        this.Formatter = $Core.Common.Formatter;
        //右键菜单：列头
        this.HeaderMenu = new $Core.Private.Grid.ContextMenu.Header();
        //右键菜单：行数据
        this.RowMenu = new $Core.Private.Grid.ContextMenu.Row(this.isTreeGrid);
        //工具区（包含搜索区和按钮区）
        this.ToolArea = {
            id: this.id + "_ToolArea",
            $target: null,
            Search: this.Search,
            ToolBar: this.ToolBar,
            isHidden: false
        };
    };
    //绑定（根据初始条件：请求列头=》请求数据=》呈现表格）
    $Core.DataGrid.prototype.bind = function () {
        $Core.Global.DG.Items.set(this.id, this);
        $Core.Global.DG.operating = this;
        var dg = this;
        //如果是编辑模式 绑定行点击事件
        if (this.isEditor || this.isTreeGrid) {
            var that = this;
            //双击行事件
            var dbClick = this.options.onDblClickRow;
            this.options.onDblClickRow = function (index, row) {
                clearTimeout($Core.Global.Variable.onClicktTimeOut);
                if (dbClick && dbClick(index, row) == false) {//对于外界的调用，保持参数不变。
                    return;
                }
                if (row == undefined) // TreeGrid，内部调用，修正参数
                {
                    row = index;//默认第1个是row
                    index = row[that.options.idField];
                }
                if ($Core.Global.Variable.actionKeys.indexOf(",edit,") > -1 && dg.isEditor) {
                    $Core.Private.Grid.Event.exeClick(index, row, that, true);//双击事件需要编辑权限。
                }
            }
            //单击行事件
            var click = this.options.onClickRow;
            this.options.onClickRow = function (index, row) {
                clearTimeout($Core.Global.Variable.onClicktTimeOut);
                //执行延时
                $Core.Global.Variable.onClicktTimeOut = setTimeout(function () {
                    if (click && click(index, row) == false) {
                        return;
                    }
                    if (row == undefined) // TreeGrid
                    {
                        row = index;//默认第1个是row
                        index = row[that.options.idField];
                    }
                    $Core.Private.Grid.Event.exeClick(index, row, that, false);
                }, 200);//延时时长设置    
            }
            //单击列事件
            var onClickCell = this.options.onClickCell;
            //tree的参数是：field,row
            this.options.onClickCell = function (rowIndexOrField, fieldOrRow, value) {
                if (onClickCell && onClickCell(rowIndexOrField, fieldOrRow, value) == false) {
                    return;
                }
                dg.PKColumn.Editor.editField = dg.isTreeGrid ? rowIndexOrField : fieldOrRow;
                //console.log(field);

            }
        }

        $Core.Ajax.post("GetHeader", dg.objName + "," + dg.tableName, dg.options.queryParams,
            function (dg) {
                return function (result) {
                    //拿到了Header，但GetKeyValuet Init，Combobox事件还没。
                    dg.Internal.headerData = result;
                    //加载Combobox数据。
                    _LoadComboxData(dg, result);
                    //创建表单，需要Header
                    if (!dg.ToolArea.isHidden) {
                        dg.ToolArea.$target = $('<div>').attr("id", dg.ToolArea.id); //创建并设置工具栏的id  
                        $("body").append(dg.ToolArea.$target); //加到页面中  
                        if (!dg.Search.isHidden) {
                            dg.Search.onExecute(dg);
                            dg.Search.regEvent(dg);
                            $Core.Combobox.onInit();//绑定下拉。
                            $.parser.parse('#' + dg.ToolArea.id); //解析成easyui
                        }
                        var customToolBar = dg.ToolBar.$target;
                        //追加工具条(必须存在grid-toolbar样式，不然会影响到分页栏的显示)
                        dg.ToolBar.$target = $('<div class="grid-toolbar" id="' + dg.id + '_ToolbarArea">');
                        if (dg.ToolBar.isHidden) {
                            dg.ToolBar.$target.attr("style", "height:0px;padding:0 0;border-bottom:0px");
                        }
                        else if (customToolBar) { customToolBar.show(); dg.ToolBar.$target.append(customToolBar); }
                        dg.ToolArea.$target.append(dg.ToolBar.$target);
                    }
                }
            }(dg)
        );
    };
    function _LoadComboxData(dg, headerData) {
        if (headerData == null || headerData.length == 0) {
            return null;
        }
        //combobox的查询条件
        var _postArray = new Array();
        each: for (var i = 0, len = headerData.length; i < len; i++) {
            var row = headerData[i];
            if (row.rules && typeof row.rules == "object" && row.rules["objname"]) {
                var objItem = {};
                objItem['ObjName'] = row.rules["objname"];
                if (!_postArray.contains(row.rules["objname"], "ObjName")) {
                    _postArray.push(objItem);
                }
            }
            if (row.formatter == undefined || row.formatter == "" || row.formatter.indexOf('#') == -1 || !/^#C_+/.test(row.formatter)) {
                continue each;
            }
            objName = row.formatter.split('#')[1];
            var obj_item = {};
            if (objName.indexOf('=>') != -1) {
                objName = objName.split('=>')[0];
            }
            obj_item['ObjName'] = objName;
            //if ($Core.Combobox.paras[objName] != undefined) {
            //    obj_item['Para'] = $Core.Combobox.paras[objName];
            //}
            if (!_postArray.contains(objName, "ObjName")) {
                _postArray.push(obj_item);
            }
        }
        //请求下拉框数据,子页面的下拉列表数据绑定
        if (_postArray.length > 0) {
            $Core.Combobox.request(_postArray, function (dg) {
                return function () {
                    dg._interval = setInterval(function () { bindGrid(dg); }, 5);
                }
            }(dg));
        }
        else {
            dg._interval = setInterval(function () { bindGrid(dg); }, 5);
        }
    }

    function bindGrid(dg) {
        if (!$Core.Global.Variable.isLoadCompleted) {
            return;
        }
        clearInterval(dg._interval);
        if (!dg.ToolArea.isHidden && !dg.ToolBar.isHidden) {
            //创建工具按钮，需要GetInit完成，有权限验证。
            dg.ToolBar.onExecute(dg);
            dg.ToolBar.regEvent(dg);
        }
        //格式化列头（有Editor时，需要先有Combobox数据。）
        var objColumns = $Core.Common.Formatter.formatHeader(dg);//处理主键列和Formatter列设置
        if (!objColumns) {
            return false;
        }
        var cfg = $.extend(true, {
            toolbar: "#" + dg.ToolArea.id,
            loadMsg: $Core.Lang.loadMsg,
            frozenColumns: objColumns.frozen,
            columns: objColumns.cols,
            queryParams: {},
            //表头右键
            onHeaderContextMenu: function (e, field) {
                $Core.Private.Grid.ContextMenu.initMenu(dg, e, field);
            },
            //datagrid api
            onRowContextMenu: function (e, index, row) {
                $Core.Private.Grid.ContextMenu.initMenu(dg, e, index, row);
            },
            //treegrid api
            onContextMenu: function (e, row) {
                $Core.Private.Grid.ContextMenu.initMenu(dg, e, null, row);
            }
        }, $Core.Global.DG.DefaultConfig);
        if (dg.isTreeGrid) {
            cfg.pagination = false;//设置默认不分页
        }

        var opts = dg.options;
        if (dg.Internal.jointPrimary.length <= 1) {
            opts.idField = dg.Internal.primarykey;//和getChecked有关系的主键
        }

        //遍历列头字段
        var hd = dg.Internal.headerData;
        if (hd && hd.length > 0) {
            var field = "";
            var showColumnCount = 0;
            for (var i = 0, len = hd.length; i < len; i++) {
                field = hd[i].field;
                if (!hd[i].hidden) { showColumnCount++; }
                if (!opts.sortName && (field.endWith("date") || field.endWith("time"))) {
                    //检测是否带排序，若无，智能检测带time, date字母的时间为默认排序
                    opts.sortName = field;
                    opts.sortOrder = "desc";
                }
                if (dg.isTreeGrid) {
                    if (!opts.treeField && (field.endWith("name"))) {
                        //检测是否带指定treeField，若无，智能检测
                        opts.treeField = field;
                    }
                    if (!opts.parentField && field.startWith("parent")) {
                        //检测是否指定parentField，若无，智能检测带
                        opts.parentField = field;
                    }
                }
            }
            if (!opts.sortName) { opts.sortName = hd[0].field; opts.sortOrder = "desc"; }
            if (!opts.idField) { opts.idField = hd[0].field; }
            if (!opts.fitColumns && showColumnCount > 10) { opts.fitColumns = false }
        }

        dg._onBeforeLoad = opts.onBeforeLoad;
        opts.onBeforeLoad = function (param) {
            param || (param = {});
            var mid = $Core.Utility.getSysmid();
            if (mid) { param.sys_mid = mid; };
            if (dg._onBeforeLoad) { return dg._onBeforeLoad(param) };
        };
        dg._onLoadSuccess = opts.onLoadSuccess;
        opts.onLoadSuccess = function (dg) {
            return function (data) {
                dg.Internal.isLoadCompleted = true;
                if (dg.isTreeGrid || dg.isEditor) {
                    dg.PKColumn.regEvent(dg);
                }
                dg._onLoadSuccess && dg._onLoadSuccess(data);
            }
        }(dg);

        opts = opts || {};
        var searchJson = [];
        var options = $.extend(cfg, opts);
        if (dg.Search && dg.Search.$target) {
            //alert('1');
            // var tForm = dg.Search.$target.children('form');
            searchJson = dg.Search.getFormJson();// $Core.Common._Internal.buildSearchJson(tForm);
        }
        if (opts.defaultWhere && opts.defaultWhere.length > 0) {
            searchJson = searchJson.concat(opts.defaultWhere);
        }
        var isdeleted = AR.Global.Variable.isdeleted;
        if (isdeleted && hd.contains(isdeleted, "field") && !searchJson.contains(isdeleted, "name")) {
            searchJson.push({ "name": isdeleted, "value": 0 });
        }
        if (searchJson.length > 0) {

            options.queryParams['sys_search'] = JSON.stringify(searchJson);
        }


        //请求URL地址设置
        options.url = $Core.Global.route + "?sys_method=GetList&sys_objName=" + dg.objName + "&sys_tableName=" + dg.tableName;
        if (dg.isTreeGrid) {
            dg.$target = $("#" + dg.id).treegrid(options);
        }
        else {
            dg.$target = $("#" + dg.id).datagrid(options);
        }
        if (options.pagination) {
            var pager = {
                beforePageText: $Core.Lang.beforePageText, //页数文本框前显示的汉字  
                afterPageText: $Core.Lang.afterPageText,
                displayMsg: $Core.Lang.displayMsg
            };
            var pagination = dg.datagrid('getPager');
            $(pagination).pagination(pager);
        }
        $(".datagrid-cell-group").css({ fontWeight: 'bold' }); //设置合并列的加粗样式

    }


}(jQuery, AR);



