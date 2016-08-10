//基类的定义
(function ($Core) {
    $Core.ExcuteEvent = ExcuteEvent;
    function ExcuteEvent() {
        this.onExcute = function () { }
        //此方法只有返回false时，才会停止执行onExcute跟onAfterExcuted事件
        this.onBeforeExcute = function () { }
        this.onAfterExcuted = function () { }
    }
    $Core.BtnBase = BtnBase;
    function BtnBase() {
        ExcuteEvent.call(this)
        this.$target = null;
    }
    /**
    *该文件依赖与AR.Core.Utility.js文件
    */
    $Core.Global.Variable = $Core.Utility.Ajax.post("GetInitConfig", null, null, false, $Core.route.root);
    $Core.Global.config = $Core.Utility.Ajax.post("GetKeyValueConfig", null, null, false, $Core.route.root);
})(AR);

(function ($, $Core) {
    //定义Common对象
    $Core.Common = {
        _Internal: {
            Editor: {
                onEdit: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnEdit.onExcute(dg, value, index);
                },
                onDel: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnDel.onExcute(dg, value, index);
                },
                onSave: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnSave.onExcute(dg, value, index);
                },
                onCancel: function (el, dgid, value, index) {
                    var dg = getDgByKey(dgid);
                    dg.PKColumn.Editor.BtnCancel.onExcute(dg, value, index);
                }
            },
            registerEvent: function (dg) {
                _query(dg);
                _reset(dg);
            },
            Search: function () {
                var that = this;
                $Core.BtnBase.call(that);
                that.$target = null;
                that.BtnQuery = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        /**
                        *查询条件的json，可在查询之前修改执行
                        *@param{Array} search
                        */
                        this.onBeforeExcute = function (search) { };
                        this.onExcute = function (dg, btn_query) {
                            var targetForm = btn_query.parents("form");
                            if (targetForm.form("validate")) {
                                var searchJson = $Core.Common._Internal.buildSearchJson(targetForm);
                                var jsonString = JSON.stringify(searchJson);
                                var target = dg.$target;
                                dg.isSearch = true;
                                if (dg.Internal.type == 'treegrid') {
                                    target.treegrid("options").onBeforeLoad = function (row, param) {
                                        param.rows = null;
                                        param.page = null;
                                        eval("sys_search = '" + jsonString + "'");
                                        param.sys_search = sys_search;
                                    }
                                    target.treegrid('reload');
                                }
                                if (dg.Internal.type == 'datagrid') {
                                    var opts = target.datagrid("options");
                                    if (opts.defaultWhere) {
                                        jsonString = JSON.stringify(searchJson.concat(opts.defaultWhere));
                                    }
                                    var str = jsonString.replace(/\'/g, "!#");
                                    eval("sys_search = '" + str + "'");
                                    var data = { sys_search: sys_search.replace(/!#/g, "'") };
                                    var flag = this.onBeforeExcute(data.sys_search);
                                    if (flag == false) { return false; };
                                    if (target.datagrid('getRows')) {
                                        target.datagrid('clearSelections');
                                    }
                                    dg.$target.datagrid("load", data);
                                    this.onAfterExcute();
                                }
                            }
                        }
                        this.onAfterExcute = function () { };
                    }
                    return new Obj();
                }();
                that.BtnReset = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        /**
                        *充值按钮，可重置条件后赋值
                        *@param{Array} sys_search
                        */
                        this.onBeforeExcute = function ($form) { };
                        this.onExcute = function (dg, btn_reset) {
                            btn_reset.parents("form")[0].reset();
                            if (this.onBeforeExcute(btn_reset.parents("form")[0]) == false) {
                                return false;
                            }
                            //清楚验证样式
                            $(".easyui-validatebox").removeClass("validatebox-text").removeClass("validatebox-invalid");
                            //在做一次标签的清楚，进行测底的清楚残留数据
                            $("[name]").val("");
                            var target = $("#" + dg.Internal.id);
                            setTimeout(function () {
                                $(".combo-value").val("");
                                $("[comboname]").each(function () {
                                    var $target = $(this);
                                    try {
                                        $target.combobox("clear");
                                        $target.combobox("setValue", "请选择");
                                    } catch (e) {

                                    }
                                    try {
                                        $target.combotree("clear");
                                        $target.combotree("setValue", "请选择");
                                    } catch (e) {

                                    }
                                });

                            }, 100);

                            if (dg.Internal.type == 'treegrid') {
                                target.treegrid("options").onBeforeLoad = function (row, param) {
                                    var opts = $("#" + dg.Internal.id).datagrid("options");
                                    var jsonString;
                                    if (opts.defaultWhere) {
                                        jsonString = JSON.stringify(opts.defaultWhere);
                                    }
                                    param.sys_search = jsonString;
                                    param.page = null;
                                    param.rows = null;
                                }
                                target.treegrid('reload');
                            }
                            if (dg.Internal.type == 'datagrid') {
                                if (target.datagrid('getRows')) {
                                    target.datagrid('clearSelections');
                                }
                                var opts = $("#" + dg.Internal.id).datagrid("options");
                                var jsonString;
                                if (opts.defaultWhere) {
                                    jsonString = JSON.stringify(opts.defaultWhere);
                                }
                                var data = { sys_search: jsonString };
                                target.datagrid('load', jsonString ? data : []);
                            }
                        }
                        this.onAfterExcute = function () { };
                    }
                    return new Obj();
                }();
                that.onExcute = function (searchItem, dg) {
                    that.onBeforeExcute();
                    _createHtml(searchItem, dg);
                    that.onAfterExcuted();
                };
            },
            ToolBar: function () {
                this.$target = null;
                this._btnArray = new Array();
                /**
                *向工具条添加按钮
                *@param{string} text 按钮显示的文本
                *@param{string} fname 按钮注册的事件函数名称
                *@param{int} index 按钮的索引排序值从1开始,默认值最后
                *@param{string} css 样式名称，默认值'btn-sm'
                *@param{string} lv2action 二级权限控制，默认值0
                */
                this.add = function (text, fname, index, css, lv2action) {
                    var obj = new Object();
                    obj.index = index || this._btnArray.length + 1;
                    obj.lv2action = lv2action;
                    obj.btn = {
                        title: text,
                        click: fname,
                        css: css || 'btn-sm'
                    }
                    this._btnArray.push(obj);
                }
                /**
                *向工具条添加自定义的HTML元素
                *@param{string} HTMLString 一个字符串标签
                *@param{string} index 按钮的索引排序值从1开始,默认值最后
                *@param{int} lv2action 二级权限控制，默认值0
                */
                this.addHtml = function (HTMLString, index, lv2action) {
                    var obj = new Object();
                    obj.index = index || this._btnArray.length + 1;
                    obj.btn = {
                        html: HTMLString,
                        lv2action: lv2action
                    }
                    this._btnArray.push(obj);
                }
                this.BtnAdd = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        //dg 是当前datagrid对象
                        this.onExcute = function (dg) {
                            var result = this.onBeforeExcute();
                            if (result == false) { return; };
                            if (dg.isEditor) {
                                if (endEditing(dg)) {
                                    dg.PKColumn.Editor.operator = dg.PKColumn.Editor.add || "Add";
                                    var _row = {}, _data = dg.PKColumn.Editor.fillData;
                                    var _rows = dg.$target.datagrid('getRows');
                                    var _len = _rows.length;
                                    if (dg.PKColumn.Editor.isFill) {
                                        var pkField = dg.Internal.primarykey;
                                        _row = $.extend(_row, _rows[_len - 1] || {});
                                        delete _row[dg.Internal.primarykey];
                                    }
                                    if (_data && typeof (_data) === 'object') {
                                        _row = $.extend(_row, _data);
                                    }
                                    dg.$target.datagrid("appendRow", _row);
                                    dg.PKColumn.Editor.editIndex = _len;
                                    dg.$target.datagrid('selectRow', dg.PKColumn.Editor.editIndex)
                                        .datagrid('beginEdit', dg.PKColumn.Editor.editIndex);
                                }
                            } else {
                                $Core.Global.DG.operating = dg;
                                var splitIndex = location.href.indexOf('List') == -1 ? location.href.lastIndexOf('.') : location.href.lastIndexOf('List');
                                var viewLink = dg.addLink || location.href.substring(location.href.lastIndexOf('/') + 1, splitIndex) + 'Edit.aspx';
                                $Core.Utility.Window.open(viewLink, dg.addTitle, false);
                                dg.ToolBar.BtnAdd.onAfterExcuted.call(this);
                            }
                            this.onAfterExcuted();
                        };
                    }
                    return new Obj();
                }();
                this.BtnDelBatch = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.onExcute = function (dg) {
                            var result = this.onBeforeExcute();
                            $Core.Common.onDel(null, null, dg.Internal.id);
                        }
                        this.onAfterExcuted();
                    }
                    return new Obj();
                }();
                this.BtnImport = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        //导入之前执行事件，设置参数如：param.p1 = abc;param.p2 = 123
                        this.onBeforeExcute = function (param) { },
                        //导入完成之后执行事件，data参数是后台返回的json对象
                        this.onAfterExcuted = function (data) { }
                    }
                    return new Obj();
                }();
                this.BtnExport = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        /**
                        *@param{object} param 需要变更或者传递附加参数可对param进行修改
                        */
                        this.onBeforeExcute = function (param) { };
                        this.onExcute = function (dg) {
                            var ifrme = $("#div_ifrme_export"), form_export = $("#form_data");
                            ifrme && ifrme.remove(); form_export && form_export.remove();
                            var objName = dg.tableName;
                            var targetForm = $(".function-box").siblings("div").find('form');
                            var checked_ids = dg.getChecked();
                            var jsonString = JSON.stringify($Core.Common._Internal.buildSearchJson(targetForm));
                            if (checked_ids.length > 0) {
                                var condition = [{ paramName: dg.Internal.primarykey, paramPatten: 'In', paramValue: "(" + checked_ids.join(',') + ")" }];
                                jsonString = JSON.stringify(condition);
                            }
                            //window.open(ajaxOptions.href + '?objName=' + objName + '&sys_search='+jsonString, '_self');      
                            var iframeName = "framePost";
                            ifrme = $("<iframe>").attr("id", "div_ifrme_template").attr("name", iframeName).css({ display: 'none' });
                            form_export = $("<form>").attr("action", $Core.Utility.Ajax.Settings.url).attr("target", iframeName).attr("id", "form_data");
                            var param = {
                                sys_tableName: objName,
                                sys_method: "Export",
                                sys_objName: dg.viewName,
                                sys_search: jsonString,
                                sys_mid: $Core.Global.Variable.mid
                            };
                            var result = this.onBeforeExcute(param);
                            if (result == false) { return };
                            for (var k in param) {
                                form_export.append($("<input>").attr("name", k).val(param[k]).attr("type", "hidden"));
                            }
                            //ifrme.append(form_export);//IE 8 有权限限制。
                            $("body").append(ifrme);
                            $("body").append(form_export);
                            form_export[0].submit();
                            form_export.remove();
                        }
                    }
                    return new Obj();
                }();
                this.BtnExportTemplate = function () {
                    function Obj() {
                        $Core.BtnBase.call(this);
                        this.onExcute = function (dg) {
                            var ifrme = $("#div_ifrme_template"), form_export = $("#form_template");
                            ifrme && ifrme.remove(); form_export && form_export.remove();
                            var objName = dg.tableName;
                            //window.open(ajaxOptions.href + '?objName=' + objName + '&sys_search='+jsonString, '_self');
                            var iframeName = "framePost";
                            ifrme = $("<iframe>").attr("id", "div_ifrme_template").attr("name", iframeName).css({ display: 'none' });
                            form_export = $("<form>").attr("action", $Core.route.root).attr("target", iframeName).attr("id", "form_template");
                            var param = {
                                sys_objName: dg.viewName,
                                sys_tableName: objName,
                                sys_method: "ExcelTemplate",
                                sys_mid: $Core.Global.Variable.mid
                            };
                            for (var k in param) {
                                form_export.append($("<input>").attr("name", k).val(param[k]).attr("type", "hidden"));
                            }
                            //ifrme.append(form_export);//IE 8 有权限限制。
                            $("body").append(ifrme);
                            $("body").append(form_export);
                            form_export[0].submit();
                            form_export.remove();
                        }
                    }
                    return new Obj();
                }();
                function endEditing(dg) {
                    if (dg.PKColumn.Editor.editIndex == null) { return true }
                    if (dg.$target.datagrid('validateRow', dg.PKColumn.Editor.editIndex)) {
                        dg.$target.datagrid('endEdit', dg.PKColumn.Editor.editIndex);
                        dg.$target.datagrid("rejectChanges");
                        dg.PKColumn.Editor.editIndex = null;
                        return true;
                    } else {
                        return false;
                    }
                }
            },
            createSearchForm: function (dg) {
                var searchItem = Array();
                var hdata = dg.Internal.headerData;
                if (hdata) {
                    for (var i = 0, len = hdata.length; i < len; i++) {
                        if (hdata[i].search) {
                            //判断类型，构建相应的easyui控件
                            if (hdata[i].viewname && hdata[i].viewname.indexOf('$2') != -1) {
                                searchItem.push(hdata[i]);
                                var cloneItem = $.extend({}, hdata[i]);
                                var title = hdata[i].viewname.split(',')[1];
                                cloneItem.title = title || "&nbsp;-&nbsp;"
                                searchItem.push(cloneItem);
                            } else {
                                searchItem.push(hdata[i]);
                            }
                        }
                    }                    
                    dg.Search.onExcute(searchItem, dg);
                }
            },
            //构建查询条件json格式,search事件调用
            buildSearchJson: function (targetForm) {
                var json = [], reg_date = /<=\s('[^']+')/;
                targetForm.find("[name]:input[type!=button][type!='reset']").each(function () {
                    if ($(this).val() == '' || $(this).val() == '请选择' || $(this).val() == null) {
                        return;
                    }
                    var op = 'Like';
                    //因为easyui渲染下拉框后把之前的input影藏
                    if ($(this).attr("type") == 'hidden' && !$("[comboname=" + $(this).attr("name") + "]").attr("multiple")) {
                        op = 'Equal';
                    }
                    var patten = $("[comboname=" + $(this).attr("name") + "]").attr("patten");
                    if (patten) {
                        op = patten;
                    }
                    //处理多选下拉框的查询语句标记
                    if ($("[comboname=" + $(this).attr("name") + "]").attr("multiple") === 'multiple') {
                        op = 'LikeOr';
                    }
                    var name = $(this).attr("name"), value = $(this).val();
                    var len = json.length;
                    var exist = false;
                    var item;
                    earch: for (var i = 0; i < len; i++) {
                        if (json[i].paramName == name) {
                            if ($("[comboname=" + name + "]").attr('date')) {
                                //json[i].paramValue = "'" + json[i].paramValue + " 00:00:00' AND '" + value + " 23:59:59'";
                                json[i].paramValue = json[i].paramValue.replace(reg_date, " <= '" + value + " 23:59:59'");
                                json[i].paramPatten = 'LikeOr';
                            } else {
                                //json[i].paramValue = "('" + json[i].paramValue + "'" + ',' + "'" + value + "')";
                                //json[i].paramPatten = 'In';
                                json[i].paramValue = json[i].paramValue + "," + value;
                                json[i].paramPatten = op === 'LikeOr' ? 'LikeOr' : 'In';
                            }
                            exist = true;
                            break earch;
                        }
                    }
                    //如果不存在重复的name值，新增项
                    if (!exist) {
                        if ($("[comboname=" + name + "]").attr('date')) {
                            op = "LikeOr";
                            value = name + ' >= \'' + value + ' 00:00:00\' AND ' + name + ' <= \'' + value + ' 23:59:59\''
                        }
                        item = { paramName: name, paramValue: value, paramPatten: op };
                    }
                    if (item) {
                        json.push(item);
                    }
                });
                (function () {
                    for (var i = 0; i < json.length; i++) {
                        if (!json[i].paramValue) { return; }
                        var array = json[i].paramValue.toString().split(',');
                        if (json[i].paramPatten === 'LikeOr') {
                            if (array.length > 1) {
                                var tempArray = new Array();
                                for (var j = 0; j < array.length; j++) {
                                    tempArray.push(json[i].paramName + " LIKE '%" + array[j] + "%'");
                                }
                                json[i].paramValue = tempArray.join(" OR ");
                                tempArray = [];
                            } else if (!reg_date.test(json[i].paramValue)) {
                                json[i].paramPatten = "Equal";
                                //json[i].paramPatten = "Like";
                            }
                        } else if (json[i].paramPatten !== 'LikeOr' && array.length > 1 && (json[i].paramPatten === 'Between' || json[i].paramPatten === 'In')) {
                            json[i].paramPatten = 'Between';
                            json[i].paramValue = array[0] + ' AND ' + array[1];
                        }
                    }
                })()
                return json;
            },
            //查询区域的下拉触发事件
            onQuery: function () {
                if ($(this).attr('isQuery') == "false") {
                    return false;
                }
                if (document.readyState == 'complete') {
                    $(this).parents("form").find(".query").click();
                }
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
                        if (configKey && $Core.Global.config[configKey]) {
                            result = getConfigName(configKey, value);
                        }
                    }
                    result = $Core.Common.Formatter.afterConfigFormatter(configKey, result, row, index);
                    if (result && result.toString().indexOf('<') == -1) {
                        result = $Core.Common.Formatter.stringFormatter(result);
                    }
                    return result;
                }
            },
            //本方法仅供重写，可以实现值变更后加链接等效果。
            afterConfigFormatter: function (configKey, value, row, index) {
                return value;
            },
            objFormatter: function (objName) {
                var that = this;
                return function objFormatter(value, row, index) {
                    var result = value;
                    if (value != undefined && value.toString() != "") {
                        var _obj = getObj(objName);
                        if ($Core.Global.m_combobox_json && _obj) {
                            result = getNameByValue(_obj, value);
                        }
                    }
                    if (result && result.toString().indexOf('<') == -1) {
                        result = $Core.Common.Formatter.stringFormatter(result);
                    }
                    return result;
                }
            },
            pkFormat: function (dg) {
                return function (value, row, index) {
                    var btnArray = dg.PKColumn._btnArray;
                    value = row[dg.Internal.primarykey];
                    var buttons = dg.PKColumn.onFilter(value, row, index, $.extend(true, [], btnArray));
                    if (dg.isEditor == true) {
                        var len = 0;
                        var strHtml = '<div class="operation w$len">';
                        var strTemplate = '<a class="{0}" title="{1}" dgid="' + dg.Internal.id + '" onClick="AR.Common._Internal.Editor.{2}(this,\'' + dg.Internal.id + '\',\'' + value + '\',' + index + ')"  v="{3}" i="{4}"></a>';
                        if (dg.PKColumn.Editor.BtnEdit.hidden != true) {
                            len += 1;
                            strHtml += $Core.Utility.stringFormat(strTemplate, "bj", "编辑", "onEdit", value, index);
                        }
                        if (dg.PKColumn.Editor.BtnDel.hidden != true) {
                            len += 1;
                            strHtml += $Core.Utility.stringFormat(strTemplate, "sc", "删除", "onDel", value, index);
                        }
                        if (dg.PKColumn.Editor.BtnCancel.hidden != true) {
                            len += 1;
                            strHtml += $Core.Utility.stringFormat(strTemplate, "cx", "撤销", "onCancel", value, index);
                        }
                        if (dg.PKColumn.Editor.BtnSave.hidden != true) {
                            len += 1;
                            strHtml += $Core.Utility.stringFormat(strTemplate, "bc", "保存", "onSave", value, index);
                        }
                        strHtml = strHtml.replace('$len', len + buttons.length);
                        for (var i = 0; i < buttons.length; i++) {
                            var btn = buttons[i];
                            btn.setAttribute("onClick", "AR.Common.onOpen(this,'" + value + "','" + dg.Internal.id + "'," + index + ")");
                            strHtml += btn.outerHTML;
                        }
                        strHtml += '</div>';
                        return strHtml;
                    } else {
                        return '<div class="operation w' + buttons.length + '">' +
                           (function () {
                               var result = "";
                               //传递副本页面修改，返回修改后的副本修改
                               for (var i = 0; i < buttons.length; i++) {
                                   var btn = buttons[i];
                                   if (btn.className != 'sc') {
                                       btn.setAttribute("onClick", "AR.Common.onOpen(this,'" + value + "','" + dg.Internal.id + "'," + index + ")");
                                   } else {
                                       btn.setAttribute("onClick", "AR.Common.onDel(this,'" + value + "','" + dg.Internal.id + "'," + index + ")");
                                   }
                                   result += btn.outerHTML;
                               }
                               return result;
                           })();
                        + '</div>';
                    }
                }
            },
            formatEditor: function (row, dg) {
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
                            data = $Core.Global.config[configKey] || [];
                        }
                        if (objName) {
                            each: for (var i = 0; i < $Core.Global.m_combobox_json.length; i++) {
                                if ($Core.Global.m_combobox_json[i][objName]) {
                                    data = $Core.Global.m_combobox_json[i][objName];
                                    break each;
                                }
                            }
                        }
                        var isMultiple = false;
                        if (row.viewname && row.viewname.indexOf('#') != -1) {
                            isMultiple = true;
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
                                var currentEditor = dg.$target.datagrid("getEditor", { index: dg.PKColumn.Editor.editIndex, field: row.field });
                                var rowEditors = dg.$target.datagrid("getEditors", dg.PKColumn.Editor.editIndex);
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
                                                f1: for (var j = 0; j < $Core.Global.m_combobox_json.length; j++) {
                                                    if ($Core.Global.m_combobox_json[j][key]) {
                                                        all_array_children = $Core.Global.m_combobox_json[j][key];
                                                        break f1;
                                                    }
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
                        if (row.datatype.indexOf('int') != -1 || row.datatype.indexOf('double') != -1 || row.datatype.indexOf('decimal') != -1) {
                            type = 'numberbox';
                            var prec = row.datatype.split(',')[2];
                            settings.options = {
                                precision: prec,
                                validType: 'number'
                            }
                        }
                        if (row.datatype.indexOf('boolean') != -1) {
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
                        }
                        if (row.datatype.indexOf('datetime') != -1) {
                            settings.options = {
                                validType: 'datebox'
                            }
                            type = 'datebox';
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
                if (json_data == null || json_data.length == 0) {
                    return null;
                }
                var frozen = Array(), cols = Array(), merge = Array(), isMerge = false, megerLen = 0, startIndex = 0;
                //combobox的查询条件
                var _post_combox_data = new Array();
                each: for (var i = 0, len = json_data.length; i < len; i++) {
                    if (json_data[i].formatter == undefined || json_data[i].formatter == "" || json_data[i].formatter.indexOf('#') == -1 || !/^#C_+/.test(json_data[i].formatter)) {
                        continue each;
                    }
                    objName = json_data[i].formatter.split('#')[1];
                    var obj_item = {};
                    if (objName.indexOf('=>') != -1) {
                        objName = objName.split('=>')[0];
                        obj_item['Parent'] = objName.split('=>')[1];
                    }
                    obj_item['objName'] = objName;
                    _post_combox_data.push(obj_item);
                }
                //请求下拉框数据,子页面的下拉列表数据绑定
                if (_post_combox_data.length > 0) {
                    var _post_data = { sys_json: JSON.stringify(_post_combox_data) };
                    if ($Core.combobox_params && $.type($Core.combobox_params) == "object") {
                        _post_data = $.extend({}, _post_data, $Core.combobox_params);
                    }
                    $Core.Global.m_combobox_json = $Core.Global.m_combobox_json.concat($Core.Utility.Ajax.post("GetCombobox", "objName", _post_data, false));
                }

                each: for (var i = 0; i < json_data.length; i++) {
                    var format, style, configKey, objName;
                    //格式化第一列为主键
                    if (i == 0 && (json_data[i].formatter == undefined || json_data[i].formatter == "#" || json_data[i].formatter == "")) {
                        frozen.push({ align: 'center', checkbox: dg.isShowCheckBox, hidden: !dg.isShowCheckBox, field: 'ckb' });
                        if (dg.PKColumn._btnArray.length > 0 || dg.isEditor) {
                            var pkColumn = $Core.Utility.cloneObjcet(json_data[i]);
                            pkColumn.formatter = this.pkFormat(dg);
                            if (dg.isEditor) {
                                var len = dg.PKColumn._btnArray.length;
                                pkColumn.width = len == 0 ? 4 * 24 : (4 + len) * 24;
                            } else { pkColumn.width = dg.PKColumn._btnArray.length * 24; }
                            delete pkColumn.rowspan;
                            delete pkColumn.colspna;
                            dg.Internal.primarykey = pkColumn.field;
                            dg.Internal.idField = pkColumn.field;
                            pkColumn.hidden = false;
                            var title = getConfigValue("SysConfig", "OperatorTitle");
                            if (!title) {
                                title = '操作';
                            }
                            pkColumn.title = title == "空" ? '' : title;
                            pkColumn.field = 'auto_pk';
                            frozen.push(pkColumn);
                        }
                    }

                    if (json_data[i].hidden && json_data[i].colspan < 2) {
                        continue each;
                    }
                    //是否编辑模式
                    if (dg.isEditor && json_data[i].edit) {
                        this.formatEditor(json_data[i], dg);
                        var row = json_data[i];
                        if (row && row.editor && row.editor.options && row.editor.type == "combobox") {
                            var isrelaciton = false;
                            if ((typeof (row.formatter) == "string" &&
                                row.formatter.indexOf('#') != -1) && /#C_/.test(row.formatter)) {
                                objName = row.formatter.split('#')[1];
                                if (objName.indexOf('=>') != -1) {
                                    isrelaciton = true;
                                }
                            }
                        }
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
                                    dg.Internal.primarykey = json_data[i].field;
                                    dg.Internal.idField = json_data[i].field;
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
                    if (i == 0 || json_data[i].frozen)// (i == 0)
                    {
                        delete json_data[i].rowspan;
                        delete json_data[i].colspna;
                        frozen.push(json_data[i]);
                    }
                    else {
                        if (json_data[i].field.indexOf('mg_') != -1) {
                            delete json_data[i].field;
                        }
                        var _index = (json_data[i].mergeindexed || 1) - 1;
                        var _array = cols[_index] || new Array();
                        _array.push(json_data[i]);
                        cols[_index] = _array;
                    }
                }
                for (var j = 0, len = cols.length; j < len; j++) {
                    if (cols[j]) {
                        for (var k = 0, len1 = cols[j].length; k < len1; k++) {
                            if (cols[j][k].field && cols[j][k].rowspan == 1) {
                                cols[j][k].rowspan = len;
                            }
                        }
                    }
                }
                return { frozen: frozen, cols: cols };
            },
            formatTGheader: function (header_json) {
                var cols = Array();
                if (header_json) {
                    //combobox的查询条件
                    var _post_combox_data = new Array();

                    each: for (var i = 0, len = header_json.length; i < len; i++) {
                        if (header_json[i].formatter == undefined || header_json[i].formatter == "" || header_json[i].formatter.indexOf('#') == -1 || !/^#C_+/.test(header_json[i].formatter)) {
                            continue each;
                        }
                        objName = header_json[i].formatter.split('#')[1];
                        var obj_item = {};
                        if (objName.indexOf('=>') != -1) {
                            objName = objName.split('=>')[0];
                            obj_item['Parent'] = objName.split('=>')[1];
                        }
                        obj_item['objName'] = objName;
                        _post_combox_data.push(obj_item);
                    }

                    //请求下拉框数据
                    if (_post_combox_data.length > 0) {
                        var _post_data = { sys_json: JSON.stringify(_post_combox_data) };
                        $Core.Global.m_combobox_json = $Core.Global.m_combobox_json || [];
                        if ($Core.combobox_params && $.type($Core.combobox_params) == "object") {
                            _post_data = $.extend({}, _post_data, $Core.combobox_params);
                        }
                        $Core.Global.m_combobox_json = $Core.Global.m_combobox_json.concat($Core.Utility.Ajax.post("GetCombobox", "objName", _post_data, false));
                    }

                    for (var i = 0; i < header_json.length; i++) {
                        if (header_json[i].hidden != true) {

                            var format, style, configKey, objName;
                            //格式化config表的数据结构
                            if (header_json[i].formatter && header_json[i].formatter.length > 2 && header_json[i].formatter.indexOf('#') != -1 && !/C_+/.test(header_json[i].formatter)) {
                                configKey = header_json[i].formatter.split('#')[1];
                                header_json[i].formatter = "configFormatter";
                            }

                            if (header_json[i].formatter && header_json[i].formatter.length > 2 && header_json[i].formatter.indexOf('#') != -1 && /C_+/.test(header_json[i].formatter)) {
                                objName = header_json[i].formatter.split('#')[1];
                                if (objName.indexOf('=>') != -1) {
                                    objName = objName.split('=>')[0];
                                }
                                header_json[i].formatter = "objFormatter";
                            }
                            try {
                                format = eval(header_json[i].formatter);
                                style = eval(header_json[i].styler);
                                if (typeof (format) == "function") {
                                    if (header_json[i].formatter == "configFormatter") {
                                        header_json[i].formatter = format(configKey);
                                    } else if (header_json[i].formatter == "objFormatter") {
                                        header_json[i].formatter = format(objName);
                                    } else {
                                        if (i == 0) {
                                            that._primarykey = header_json[i].field;
                                            that.idField = header_json[i].field;
                                            header_json[i].formatter = format(that);
                                        } else {
                                            header_json[i].formatter = format;
                                        }
                                    }
                                }

                                if (typeof (style) == "function") {
                                    header_json[i].styler = style;
                                }
                            } catch (e) {
                                delete header_json[i].formatter;
                                delete header_json[i].styler;
                            }
                            header_json[i].sortable = eval(header_json[i].sortable);
                            header_json[i].hidden = eval(header_json[i].hidden);

                            header_json[i].editor = (function (dt) {
                                var editor = 'text';
                                switch (dt) {
                                    case 'int32':
                                        editor = 'numberbox';
                                        break;
                                    case 'datetime':
                                        editor = 'datebox';
                                        break;
                                }
                                return editor;
                            })(header_json[i].datatype);
                            cols.push(header_json[i]);
                        }
                    }
                }
                return cols;
            }
        },

        onDel: function (el, value, thatID, index) {
            var dg = $Core.Global.DG.Items[thatID];
            dg.PKColumn.onDel(el, value, thatID, index);
        },
        /*onOpen与delRow归属于window对象，
            可在当前调用页面重写这两个方法，
            如果没有别的业务需求不建议重写
        */
        //打开业务页面
        onOpen: function (el, value, thatID, index) {
            var dg = $Core.Global.DG.operating = $Core.Global.DG.Items[thatID]; //赋值当前对象到page属性方便调用
            dg.PKColumn.onOpen(el, value, thatID, index);
        },

    }
    function _query(dg) {
        var btn_query = dg.Search.BtnQuery.$target;
        btn_query && btn_query.click(function () {
            dg.Search.BtnQuery.onExcute(dg, btn_query);
        });
    }
    //重置按钮事件
    function _reset(dg) {
        var btn_reset = dg.Search.BtnReset.$target;
        btn_reset && btn_reset.click(function () {
            dg.Search.BtnReset.onExcute(dg, btn_reset);
        });
    }
    function _createHtml(searchItem, dg) {
        var parentTarget, line, isCustom;
        //创建查询区域HTML
        dg.ToolBar.$target = $('<div>').attr("id", dg.Internal.toolbarID); //创建并设置工具栏的ID  
        if (dg.Search.$target) {
            isCustom = true;
            dg.Search.$target.show();
        } else {
            dg.Search.$target = $('<div id="div_search">');
        }
        if (searchItem.length > 0 || isCustom) {
            var divSearchArea = $('<div class="cont-list-form cont-box-form">').attr('sign', 'div_searchArea'),
             form = $("<form>");
            dg.Search.$target.addClass('box w684');
            var divButtons = $('<div class="btn w72">');
            dg.Search.BtnQuery.$target = $('<input class="query" value="" type="button" />').attr("id", dg.Internal.btn_query_id);
            dg.Search.BtnReset.$target = $('<input class="reset" type="reset" value="" />').attr("id", dg.Internal.btn_reset_id);
            //需要指定按钮对象，如果样式不对将不触发事件
            divButtons.append($("<a>").append(dg.Search.BtnQuery.$target));
            divButtons.append($("<a>").append(dg.Search.BtnReset.$target));
            form.append(dg.Search.$target);
            form.append(divButtons);
            divSearchArea.append(form);
            dg.ToolBar.$target.append(divSearchArea);
            //创建HTML结构
            dg.Search.Inputs = new Object();
            (function () {
                if (!isCustom) {
                    $Core.Utility.createHtml(dg.Search.$target, searchItem);
                }
            })();
        }
        //添加工具栏按钮
        (function () {
            if (dg.Internal.type == "datagrid") {
                var div_fn = $('<div class="function-box" id="div_fun">');
                var item; actionKeys = $Core.Global.Variable.actionKeys || "";
                if (actionKeys.indexOf(',add') > -1) {
                    dg.ToolBar.BtnAdd.$target = $('<input class=\"add\" flag=\"btn_add\" type=\"button\" name=\"添加\" value=\"\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnAdd.$target);
                    div_fn.append(item);
                }
                if (actionKeys.indexOf(',del') > -1) {
                    dg.ToolBar.BtnDelBatch.$target = $('<input  class=\"batch_del\" flag=\"btn_del\" type=\"button\" name=\"批量删除\" value=\"\"/>').attr("dgID", dg.Internal.id);
                    item = $("<a>").append(dg.ToolBar.BtnDelBatch.$target);
                    div_fn.append(item);
                }
                if (actionKeys.indexOf(',export') > -1) {
                    dg.ToolBar.BtnExport.$target = $('<input class=\"export\" flag=\"btn_export\" type=\"button\"  value=\"\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnExport.$target);
                    div_fn.append(item);
                }
                if (actionKeys.indexOf(',import') > -1) {
                    dg.ToolBar.BtnImport.$target = $('<input class=\"import\" flag=\"btn_import\" type=\"button\"  value=\"\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnImport.$target);
                    div_fn.append(item);
                    dg.ToolBar.BtnExportTemplate.$target = $('<input class=\"btn-sm\" flag=\"btn_export_template\" type=\"button\"  value=\"导出模板\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnExportTemplate.$target);
                    div_fn.append(item);
                }

                dg.ToolBar.$target.append(div_fn);
            }
            if (dg.Internal.type == "treegrid") {
                var div_fn = $('<div class="function-box" id="' + dg.Internal.toolbarID + '">');
                if (dg.Internal.toolbar != false) {
                    var item = $("<a>").append($('<input class=\"btn-lg\" flag=\"btn_add\" type=\"button\" value=\"添加根节点\"/>'));
                    div_fn.append(item);
                }
                dg.ToolBar.$target.append(div_fn);
            }
            $("body").append(dg.ToolBar.$target); //加到页面中       
        }());
    };
    function getObj(objName) {
        var obj = new Object();
        var m_combobox_json = $Core.Global.m_combobox_json;
        for (var i = 0; i < m_combobox_json.length; i++) {
            if (m_combobox_json[i][objName]) {
                obj = m_combobox_json[i][objName];
                break;
            }
        }
        return obj;
    };
    function getNameByValue(obj, v) {
        var value = v;
        if ($.type(obj) == "object") {
            obj = [obj];
        }
        if (v.toString().indexOf(',') != -1) {
            var array = v.split(','), result = [];
            for (var i = 0; i < obj.length; i++) {
                if ($Core.Utility.isInArray(array, obj[i]['value'])) {
                    result.push(obj[i]['text']);
                }
            }
            if (result.length > 0) {
                value = result.join(',');
            }
        } else {
            for (var i = 0; i < obj.length; i++) {
                if (obj[i]['value'] == v) {
                    value = obj[i]['text'];
                    break;
                }
            }
        }
        return value;
    };
    function getConfigName(configKey, value) {
        var items = $Core.Global.config[configKey];
        var itemValue = [];
        if (items != undefined && value != undefined && value != null && value.toString() != '') {
            var valueArray = value.toString().split(',');
            var isIn = false;
            for (var i = 0; i < items.length; i++) {
                isIn = $Core.Utility.isInArray(valueArray, items[i].value);
                if (!isIn) {
                    var iValue = items[i].value.toString();
                    if (iValue == "1" || iValue == "0") {
                        isIn = $Core.Utility.isInArray(valueArray, iValue == "1" ? true : false);
                    }
                    else if (iValue == "true" || iValue == "false") {
                        isIn = $Core.Utility.isInArray(valueArray, iValue == "true" ? 1 : 0);
                    }
                }
                if (isIn) {
                    itemValue.push(items[i].text);
                }

            }
            return itemValue.length == 0 ? value : itemValue.join(',');
        } else {
            return '';
        }
    };

    function getConfigValue(configKey, text) {
        var items = $Core.Global.config[configKey];
        var itemValue = [];
        if (items!=undefined && text != undefined && text != null && text.toString() != '') {
            var valueArray = text.toString().split(',');
            for (var i = 0; i < items.length; i++) {
                if ($Core.Utility.isInArray(valueArray, items[i].text)) {
                    itemValue.push(items[i].value);
                }
            }
            return itemValue.length == 0 ? text : itemValue.join(',');
        }
        else {
            return '';
        }
    };
    function getDgByKey(key) {
        return $Core.Global.DG.Items[key];
    }

    (function () {
        var comboboxOption = {
            valueField: 'value',
            textField: 'text',
            data: undefined,
            width: 150,
            multiple: false
        }
        //arrayName 可以是一个数组多个对象名或者配置键、或者单个对象名或者配置键
        function bindComboboxies(arrayName, condition) {
            if (arrayName instanceof Array) {
                for (var i = 0, len = arrayName.length; i < len; i++) {
                    bindComboboxByName(arrayName[i], condition);
                }
            } else {
                bindComboboxByName(arrayName, condition);
            }
        }

        function bindComboboxByName(targetName, condition) {
            var _config = $("[configKey='" + targetName + "']");
            var _obj = $("[objname='" + targetName + "']");
            if (_config[0]) {
                bindCombobox(_config);
            }
            if (_obj[0]) {
                var item_data = [];
                var objName = _obj.attr("ObjName");
                var parent = _obj.attr("Parent");
                if (objName && objName.length != 0) {
                    if (!detectArray(item_data, 'ObjName', objName)) {
                        var item = { ObjName: objName, Parent: parent };
                        item_data.push(item);
                    }
                }
                loadComboboxData(item_data, condition);
                bindObjNameCombobox(_obj);
            }
        }

        //初始化配置Key的下拉框数据。
        initConfigKeyCombobox = function () {
            $("[configKey]").each(function () {
                bindCombobox($(this));
            });
        }

        function bindCombobox(that) {
            var configKey = that.attr("configKey");
            var multiple = that.attr("multiple") == "multiple";
            if (configKey && $Core.Global.config[configKey]) {
                var items = $Core.Global.config[configKey];
                if (!jQuery.isArray(items)) {
                    items = [items];
                }
                var newItems = $Core.Utility.gettree(items);
                var showTree = false;//是否树形下拉显示
                earch: for (var i = 0; i < newItems.length; i++) {
                    if (newItems[i].children.length > 0) {
                        showTree = true;
                        break earch;
                    }
                }
                comboboxOption.multiple = multiple;
                comboboxOption.width = that.attr("width") || 150;
                comboboxOption.data = newItems;
                comboboxOption.editable = that.attr("editable") == "false" ? false : true;
                if (!multiple && that.attr("defaultItem") != 'false') {
                    comboboxOption.data.unshift({ text: "请选择", value: "" });
                }
                if (showTree) {
                    comboboxTree(that, $.extend(true, {}, comboboxOption));
                }
                else {
                    var selFun = eval(that.attr("onchange"));
                    var opts = $.extend(true, {}, comboboxOption);
                    if (typeof (eval(selFun)) == "function") {
                        opts.onSelect = eval(selFun);
                    }
                    combobox(that, opts);
                }
            }
        }

        function comboboxTree(that, comboboxOption) {
            if (comboboxOption.multiple) {
                comboboxOption.onSelect = function (node) {
                    that.combotree("setValue", "请选择");
                }
                comboboxOption.onCheck = function (node, checked) {
                    var arrayValues = that.combotree("getValues");
                    if (arrayValues.length == 0) {
                        that.combotree("setValue", "请选择");
                    }
                }
            }

            that.combotree(comboboxOption);
            that.combotree("setValue", "请选择");
        }
        function combobox(that, comboboxOption) {
            that.combobox(comboboxOption);
            if (that.combobox("options").data.length > 0 && !comboboxOption.multiple) {
                if (that.combobox("options").data.length > 2 || that.attr('selectedIndex')) {
                    var selectedIndex = parseInt(that.attr('selectedIndex'));
                    var unshowid = that.attr('unshowid') == 'true';
                    var field = unshowid ? 'text' : 'value';
                    try {
                        var value = that.attr("defaultItem") == 'false' ?
                            (selectedIndex ? that.combobox("options").data[selectedIndex - 1][field] : (that.val() || '请选择'))
                            : (selectedIndex ? that.combobox("options").data[selectedIndex][field] : (that.val() || ''));

                        if (unshowid && value == '') {
                            that.combobox("select", '请选择')
                        } else {
                            that.combobox("select", value);
                        }
                    }
                    catch (er) {
                        if (window.console) {

                        }
                    }
                }
                else {
                    that.combobox("select", that.combobox("options").data[1] ? that.combobox("options").data[1].value : that.combobox("options").data[0].value);
                }
            } else {
                that.combobox("select", "");
            }
        }


        initObjNameCombobox = function () {
            //提交请求获取数据
            var item_data = [];
            $("[ObjName]").each(function () {
                var objName = $(this).attr("ObjName");
                var parent = $(this).attr("Parent");
                if (objName && objName.length != 0) {
                    if (!detectArray(item_data, 'ObjName', objName)) {
                        var item = { ObjName: objName, Parent: parent };
                        item_data.push(item);
                    }
                }
            });
            loadComboboxData(item_data);
            $("[ObjName]").each(function () {
                bindObjNameCombobox($(this));
            });
        }

        function loadComboboxData(item_data, condition) {
            var m_combobox_json = $Core.Global.m_combobox_json;
            //此判断是因为List跟Edit的请求方式不一样
            if (condition == undefined && m_combobox_json.length > 0) {
                var _removeIndex = new Array();//需要移除的项
                for (var i = 0; i < m_combobox_json.length; i++) {
                    for (var k in m_combobox_json[i]) {
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
                result = $Core.Utility.Ajax.post("GetCombobox", null, _post_data, false);
                if (!(result instanceof Array)) {
                    result = [result];
                }
                ////m_combobox_json始终是一个数组
                //for (var i = 0, len = m_combobox_json.length; i < len; i++) {

                //}
                for (var i = 0, len = result.length; i < len; i++) {
                    for (var k in result[i]) {
                        var flag = true;
                        for (var ii = 0; ii < m_combobox_json.length; ii++) {
                            for (var kk in m_combobox_json[ii]) {
                                if (kk == k) {
                                    m_combobox_json[ii][kk] = result[i][k];
                                    flag = false;
                                }
                            }
                        }
                        if (flag == true) {
                            $Core.Global.m_combobox_json = $Core.Global.m_combobox_json.concat(result[i]);
                        }
                    }
                }
                //m_combobox_json = m_combobox_json.concat();

                if (m_combobox_json && !(m_combobox_json instanceof Array)) {
                    $Core.Global.m_combobox_json = [m_combobox_json];
                }
            }
        }
        //绑定
        function bindObjNameCombobox(that) {
            var m_combobox_json = $Core.Global.m_combobox_json;
            if (m_combobox_json && m_combobox_json.length > 0) {
                var $target = that.addClass(".easyui-combobox"), data;
                //这里不处理子集下拉框，在后面递归一次性处理
                if ($target.attr("Parent")) {
                    return;
                }
                current: for (var i = 0; i < m_combobox_json.length; i++) {
                    if (m_combobox_json[i][$target.attr("ObjName")]) {
                        data = m_combobox_json[i][$target.attr("ObjName")];
                        break current;
                    }
                }
                if (!(data instanceof Array)) {
                    data = [];
                }
                var valueField = $target.attr("valueField") || 'value';
                var textField = $target.attr("textField") || 'text';
                var multiple = $target.attr("multiple") == "multiple";
                if (data.length == 0 || (data[0][textField] != "请选择" && $target.attr("defaultItem") != 'false')) {
                    var defaultItem = {}; defaultItem[valueField] = ""; defaultItem[textField] = "请选择";
                    data.unshift(defaultItem);
                }
                //判断是否键值都显示同样的数据
                if ($target.attr("unshowid") == 'true') {
                    valueField = textField;
                }
                //初始化公用的选项
                var option = {
                    multiple: multiple,
                    valueField: valueField,
                    textField: textField,
                    width: $target.attr("width") || 150,
                    onLoadSuccess: function () {
                        //$target.combobox("textbox").removeClass("validatebox-invalid");              
                    }
                }
                option.editable = $target.attr("editable") == "false" ? false : true;;
                //判断是否多选,级联不处理多选            
                if (multiple) {
                    registerMultiEvent(option);
                }
                var selFun = eval($target.attr("onchange"));
                if (typeof (eval(selFun)) == "function") {
                    option.onSelect = eval(selFun);
                }
                option.data = data;
                //判断是否级联模式
                if ($("[parent='" + $target.attr('ObjName') + "']") && $("[parent='" + $target.attr('ObjName') + "']").length > 0) {
                    var option_extend = {
                        onSelect: function (record) {
                            var parent_id = record[valueField];

                            var selFun = eval($(this).attr("onchange"));
                            if (typeof (eval(selFun)) == "function") {
                                eval(selFun).call(this, record);
                            }
                            if (multiple) {
                                selectedFilter($(this));
                            }
                            $("[parent='" + $target.attr("ObjName") + "']").each(function () {
                                reBind(parent_id, $(this), option);
                            });
                            if ($("[parent='" + $target.attr('ObjName') + "']") && $("[parent='" + $target.attr('ObjName') + "']").length > 0) {
                                triggerSelect($target);
                            }
                        }
                    }
                    if (multiple) {
                        option_extend.onUnselect = function (record) {
                            var unSelFun = eval($(this).attr("unchange"));
                            if (typeof (eval(unSelFun)) == "function") {
                                eval(unSelFun).call(this, record);
                            }
                            var parent_id = record[valueField];
                            $("[parent='" + $target.attr("ObjName") + "']").each(function () {
                                var orignalData = $.data(this, "combobox").data;
                                var selectedValues = $(this).combobox("getValues");
                                var sign = false;//标记开始删除
                                lv1: for (var i = (orignalData.length - 1) ; i > 0; i--) {
                                    if (orignalData[i].parent == parent_id) {
                                        //判断值是否在集合内，并删除。
                                        selectedValues.remove(orignalData[i].value);
                                        $(this).combobox("unselect", orignalData[i].value);
                                        orignalData.splice(i, 1);
                                        sign = true;
                                        continue;
                                    }
                                    if (sign) { //如果已删除完成直接结束循环；
                                        break lv1;
                                    };
                                }
                                $(this).combobox("clear");//清空已选中的值
                                $(this).combobox("loadData", orignalData);//重新加载数据
                                //重新填充值
                                if (selectedValues.length == 0) {
                                    $(this).combobox("select", "");
                                } else {
                                    for (var i = 0; i < selectedValues.length; i++) {
                                        var v = selectedValues[i];
                                        $(this).combobox("select", v);
                                    }
                                }
                            });
                            if ($(this).combobox("getValues").length == 0) {
                                $(this).combobox("select", "");
                            }
                        }
                    }
                    option = $.extend(option, option_extend);
                }
                combobox($target, option);
                data = null;
            }
        }
        //多级联下拉处理---------------------------------
        function reBind(parent_id, $element, opts, parent) {
            var ds = $Core.Global.m_combobox_json;
            var item_data; var new_data = [],
                unshowid = $element.attr("unshowid") == 'true',
                multiple = $element.attr("multiple") == "multiple";
            leveal1: for (var i = 0; i < ds.length; i++) {
                //判断如果是不显value值的模式，则需通过获取text对比拿到value之后去拿到子级联的数据
                //if (unshowid) {
                //    if (!parent_id || parent_id == '请选择') {
                //        parent_id = undefined;
                //    } else {
                //        var parentArray = ds[i][$element.attr("Parent")];
                //        if (parentArray) {
                //            each: for (var j = 0; j < parentArray.length; j++) {
                //                if (parent_id && parent_id != '请选择' && parent_id == parentArray[j].text) {
                //                    parent_id = parentArray[j].value;
                //                    break each;
                //                }
                //            }
                //        }
                //    }
                //}
                if (ds[i][$element.attr("ObjName")]) {
                    item_data = ds[i][$element.attr("ObjName")];
                    if (!(item_data instanceof Array)) {
                        item_data = [item_data];
                    }
                    leveal2: for (var j = 0; j < item_data.length; j++) {
                        if (item_data[j].parent == parent_id) {
                            new_data.push(item_data[j]);
                            continue leveal2;
                        }
                    }
                    break leveal1;
                }
            }
            //-------------------        
            var valueField = $element.attr("valueField") || 'value';
            var textField = $element.attr("textField") || 'text';
            if (unshowid) {
                valueField = textField;
            }
            var defaultItem = {}; defaultItem[valueField] = ""; defaultItem[textField] = "请选择";
            //如果父级为多选逻辑处理
            if ($("[objname='" + $element.attr("parent") + "']").length > 0 && $("[objname='" + $element.attr("parent") + "']").attr("multiple") == "multiple") {

                var orignalData = [];
                if ($element.hasClass("combo-f")) {
                    orignalData = $element.combobox("getData");
                }
                if (orignalData.length > 0) {
                    new_data = orignalData.concat(new_data);
                } else {
                    new_data.unshift(defaultItem);
                }
            } else {
                new_data.unshift(defaultItem);
            }
            //初始化公用的选项
            var option = {
                multiple: multiple,
                valueField: valueField,
                textField: textField,
                data: new_data,
                width: $element.attr("width") || 150,
                onLoadSuccess: function () {
                    $element.combobox("textbox").removeClass("validatebox-invalid");
                }, onSelect: function (record) {
                    var selFun = eval($(this).attr("onchange"));
                    if (typeof (eval(selFun)) == "function") {
                        eval(selFun).call(this, record);
                    }
                }
            }
            if (multiple) {
                registerMultiEvent(option);
            }
            option.editable = $element.attr("editable") == "false" ? false : true;
            //判断是否级联模式
            if ($("[parent='" + $element.attr('ObjName') + "']") && $("[parent='" + $element.attr('ObjName') + "']").length > 0) {
                var option_extend = {
                    onSelect: function (record) {
                        //var $child = $("[parent='" + $(this).attr("ObjName") + "']");
                        var parent_id = record[valueField];
                        var selFun = eval($(this).attr("onchange"));
                        if (typeof (eval(selFun)) == "function") {
                            eval(selFun).call(this, record);
                        }
                        if (multiple) {
                            selectedFilter($(this));
                        }
                        //重新绑定子集下拉框
                        $("[parent='" + $element.attr("ObjName") + "']").each(function () {
                            reBind(parent_id, $(this), option);
                        });
                        if ($("[parent='" + $element.attr('ObjName') + "']") && $("[parent='" + $element.attr('ObjName') + "']").length > 0) {
                            triggerSelect($element);
                        }
                    }
                }
                if (multiple) {
                    option_extend.onUnselect = function (record) {
                        var unSelFun = eval($(this).attr("unchange"));
                        if (typeof (eval(unSelFun)) == "function") {
                            eval(unSelFun).call(this, record);
                        }
                        var parent_id = record[valueField];
                        $("[parent='" + $element.attr("ObjName") + "']").each(function () {
                            var orignalData = $(this).combobox("getData");
                            var selectedValues = $(this).combobox("getValues");
                            for (var i = (orignalData.length - 1) ; i > 0; i--) {
                                if (orignalData[i].parent == parent_id) {
                                    selectedValues.remove(orignalData[i].value);
                                    $(this).combobox("unselect", orignalData[i].value);
                                    orignalData.splice(i, 1);
                                }
                            }
                            $(this).combobox("clear");
                            $(this).combobox("loadData", orignalData);
                            if (selectedValues.length == 0) {
                                $(this).combobox("select", "");
                            } else {
                                for (var i = 0; i < selectedValues.length; i++) {
                                    var v = selectedValues[i];
                                    $(this).combobox("select", v);
                                }
                            }
                        });
                        if ($(this).combobox("getValues").length == 0) {
                            $(this).combobox("select", "");
                        }
                    }
                }
                option = $.extend(option, option_extend);
            }
            if (multiple && $element.hasClass("combobox-f")) {
                $element.combobox("loadData", new_data);
            } else {
                $element.combobox(option);
            }
            new_data = null;
        }
        //递归触发事件
        function triggerSelect($element) {
            $("[parent='" + $element.attr('ObjName') + "']").each(function () {
                var $child = $(this);
                if ($child.attr('unshowid') == 'true') {
                    $child.combobox("select", "请选择");
                }
                else {
                    $child.combobox("select", "");
                }
                return triggerSelect($child);
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
                selectedFilter($(this));
            }
            opts.onUnselect = function () {
                var unSelFun = eval($(this).attr("unchange"));
                if (typeof (eval(unSelFun)) == "function") {
                    eval(unSelFun).call(this, record);
                }
                if ($(this).combobox("getValues").length == 0) {
                    $(this).combobox("select", "");
                }
            }
        }
        //多选的选中值过滤
        function selectedFilter($target) {
            var arrayValue = $target.combobox("getValues");
            if (arrayValue.length > 1 && hasEmpty(arrayValue)) {
                $target.combobox("setValues", filterArray(arrayValue));
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
        function initConfigKeyCombobox() {
            $("[configKey]").each(function () {
                bindCombobox($(this));
            });
        }
        initObjNameCombobox = function () {
            //提交请求获取数据
            var item_data = [];
            $("[ObjName]").each(function () {
                var objName = $(this).attr("ObjName");
                var parent = $(this).attr("Parent");
                if (objName && objName.length != 0) {
                    if (!detectArray(item_data, 'ObjName', objName)) {
                        var item = { ObjName: objName, Parent: parent };
                        item_data.push(item);
                    }
                }
            });
            loadComboboxData(item_data);
            $("[ObjName]").each(function () {
                bindObjNameCombobox($(this));
            });
        };
        //设置Easyui下拉框的值
        function selectedCombobox(data) {
            if ($.type(data) == 'object') {
                var reg_date = /^\d{4}(-|\/)\d{2}(-|\/)\d{2}\s?.*$/;
                $("[comboname]").each(function () {
                    var value = data[$(this).attr("comboname")] || "";
                    if (value && !reg_date.test(value)) {
                        try {
                            $(this).combobox("clear");
                            if (value.toString().indexOf(',') != -1 && value.toString().split(',').length > 1) {
                                value = value.split(',');
                                for (var i = 0; i < value.length; i++) {
                                    $(this).combobox("select", value[i]);
                                }
                                $(this).combobox("setValues", value.toString().split(','));
                            } else {
                                $(this).combobox("select", value);
                            }
                        } catch (e) { }
                    }
                });
            }
        };
        $Core.Combobox = {
            onInit: function () {
                initConfigKeyCombobox();//初始化configKey配置的项
                initObjNameCombobox();//初始化objName配置的项
            },
            bindComboboxies: bindComboboxies,
            selectedCombobox: selectedCombobox
        };
    })();
})(jQuery, AR);

