/// <reference path="/Style/JS/Aries.Loader.js" />
//AR.Common 定义
(function ($, $Core) {
    $Core.Lang || ($Core.Lang = {});
    //定义Common对象
    $Core.Common = {
        Event: {
            //查询区域的下拉触发事件
            onQuery: function (record) {
                if ($(this).attr('isquery') == "false") {
                    return false;
                }
                if (document.readyState == 'complete') {
                    var dg = $Core.Global.DG.operating;//解决下拉自动事件引发2次查询的问题。
                    if (dg && dg.Internal.isLoadCompleted) {
                        setTimeout(function () {
                            dg.Search.BtnQuery.onExecute(dg);
                        }, 100);//tree的下拉触发事件时，还拿不到值，所以需要延时
                    }
                }
            },
            //添加一行
            onAdd: function (el, gridid, value, index, isSameLevel) {
                var dg = $Core.Global.DG.Items[gridid];
                if (dg) {
                    dg.ToolBar.BtnAdd.onExecute(dg, value, index, isSameLevel);
                }

            },
            //右键点击配置表头事件
            onConfigClick: function (el, gridid, value, index) {
                var dg = $Core.Global.DG.Items[gridid];
                if (dg) {
                    var url = $Core.Utility.stringFormat("{0}?objName={1}", $Core.Global.Variable.ui + '/Web/SysAdmin/ConfigGrid.html', dg.objName);
                    $Core.Global.DG.operating = dg;
                    $Core.Window.open(url, "", false);
                }
                else { alert("Can't find the object:" + gridid); }
            },
            onEdit: function (el, gridid, value, index) {
                var dg = $Core.Global.DG.Items[gridid];
                if (!dg.isTreeGrid && typeof (index) == "string") { index = parseInt(index); }
                dg.PKColumn.Editor.BtnEdit.onExecute(dg, value, index);
            },
            onDel: function (el, gridid, value, index) {
                var dg = $Core.Global.DG.Items[gridid];
                dg.PKColumn.Editor.BtnDel.onExecute(dg, value, index);
            },
            onSave: function (el, gridid, value, index) {
                var dg = $Core.Global.DG.Items[gridid];
                if (!dg.isTreeGrid && typeof (index) == "string") { index = parseInt(index); }
                dg.PKColumn.Editor.BtnSave.onExecute(dg, value, index);
            },
            onCancel: function (el, gridid, value, index) {
                var dg = $Core.Global.DG.Items[gridid];
                if (!dg.isTreeGrid && typeof (index) == "string") { index = parseInt(index); }
                dg.PKColumn.Editor.BtnCancel.onExecute(dg, value, index);
            },
            //打开业务页面
            onOpen: function (el, gridid, value, index, opts) {
                var dg = $Core.Global.DG.Items[gridid];
                dg.PKColumn.open(el, gridid, value, index, opts);
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
                    if (dg.isTreeGrid) {
                        index || (index = row[dg.options.idField]);
                        value || (value = index);
                    }
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
                        var strTemplate = '<a class="{0}" title="{1}" onclick="AR.Common.Event.{2}(this,\'' + dg.id + '\',\'' + value + '\',\'' + index + '\')"  v="{3}" i="{4}"></a>';
                        if (dg.PKColumn.Editor.editIndex == null) {
                            if (dg.PKColumn.Editor.BtnEdit.hidden != true && actionKeys.indexOf(",edit,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "edit", $Core.Lang.edit, "onEdit", value, index));
                                obj.set("edit", { "isCustom": false, $target: $btn });
                                $div.append($btn);

                            }
                            if (dg.PKColumn.Editor.BtnDel.hidden != true && actionKeys.indexOf(",del,") > -1) {
                                len++; 
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "del", $Core.Lang.del, "onDel", value, index));
                                obj.set("del", { "isCustom": false, $target: $btn });
                                $div.append($btn);
                            }
                        }
                        else {
                            //有编辑权限才能进来
                            if (dg.PKColumn.Editor.BtnCancel.hidden != true && actionKeys.indexOf(",edit,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "cancel", $Core.Lang.cancel, "onCancel", value, index));
                                obj.set("cancel", { "isCustom": false, $target: $btn });
                                $div.append($btn);
                            }
                            if (dg.PKColumn.Editor.BtnSave.hidden != true && actionKeys.indexOf(",edit,") > -1) {
                                len++;
                                var $btn = $($Core.Utility.stringFormat(strTemplate, "save", $Core.Lang.save, "onSave", value, index));
                                obj.set("save", { "isCustom": false, $target: $btn });
                                $div.append($btn);
                            }
                        }
                    }
                    //自定义按钮
                    for (var i = 0; i < btnArray.length; i++) {
                        var btn = btnArray[i];
                        if (!btn.isHidden && actionKeys.indexOf("," + btn.lv2action + ",") > -1) {

                            if (!btn.hasAttribute("hasClick")) {
                                if (btn.className == 'del') {
                                    btn.setAttribute("onclick", "AR.Common.Event.onDel(this,'" + dg.id + "','" + value + "'," + index + ")");
                                }
                                else {
                                    var opts = "";;
                                    if (btn.opts) {
                                        opts = JSON.stringify(btn.opts);
                                    }
                                    btn.setAttribute("onclick", "AR.Common.Event.onOpen(this,'" + dg.id + "','" + value + "'," + index + ",'" + opts + "')");
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
                    var type = 'validatebox', settings = {};

                    if ((row.formatter && row.formatter.indexOf('#') > -1) ||
                        (row.rules && (row.rules.indexOf('configkey') > -1 || row.rules.indexOf('objname') > -1))
                        ) {
                        type = 'combobox';
                        settings.options = $Core.Common.Privite.getOptions(row.formatter, row.rules);

                    }
                    else {
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
                                //var title = $Core.Config.getValue("SysConfig", "OperatorTitle");
                                //if (!title) {
                                //    title = $Core.Lang.opration;
                                //}
                                pkColumn.title = $Core.Lang.pkTitle;// title == $Core.Lang.empty ? '' : title;
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
                frozen = AR.Common.Privite.getColumnGroup(frozen);
                cols = AR.Common.Privite.getColumnGroup(cols);
                var maxLen = frozen.length > cols.length ? frozen.length : cols.length;
                AR.Common.Privite.setColumnRowspan(frozen, maxLen);
                AR.Common.Privite.setColumnRowspan(cols, maxLen);
                return { frozen: frozen, cols: cols };
            }
        },



        Html: {
            //创建搜索区
            createSearchArea: function (dg) {
                var dataArray = [];
                var hdata = dg.Internal.headerData;
                for (var i = 0, len = hdata.length; i < len; i++) {
                    if (hdata[i].search) {
                        dataArray.push(hdata[i]);
                    }
                }
                if (dataArray.length > 0 || dg.Search.$target) {
                    var $input = $('<div id="div_search" class="page-form">');
                    if (!dg.Search.$target) {
                        $Core.Common.Html.createInput($input, dataArray, dg, true);
                    }
                    else {
                        $input = dg.Search.$target;
                        $input.show();
                    }
                    dg.Search.$target = $('<div id="' + dg.id + '_SearchArea" class="grid-search">');
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

            },
            //创建工具栏区
            createToolBar: function (dg) {
                if (!dg.ToolBar || !dg.ToolBar.$target || dg.ToolBar.$target[0].innerHTML) { return; }
                var item; actionKeys = $Core.Global.Variable.actionKeys || "";
                if (actionKeys.indexOf(',add,') > -1 && !dg.ToolBar.BtnAdd.isHidden) {
                    dg.ToolBar.BtnAdd.$target = $('<input class=\"add\" flag=\"btn_add\" type=\"button\" name=\"' + $Core.Lang.add + '\" value=\"\"/>');
                    item = $("<a>").append(dg.ToolBar.BtnAdd.$target);
                    dg.ToolBar.$target.append(item);
                    dg.ToolBar.Items.set("add", dg.ToolBar.BtnAdd);
                }
                if (actionKeys.indexOf(',del,') > -1 && !dg.ToolBar.BtnDelBatch.isHidden && dg.isShowCheckBox) {
                    dg.ToolBar.BtnDelBatch.$target = $('<input  class=\"batch_del\" flag=\"btn_del\" type=\"button\" name=\"' + $Core.Lang.batchDel + '\" value=\"\"/>');
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
                        dg.ToolBar.BtnExportTemplate.$target = $('<input class=\"btn-lg\" flag=\"btn_export_template\" type=\"button\"  value=\"' + $Core.Lang.exportTemplate + '\"/>');
                        item = $("<a>").append(dg.ToolBar.BtnExportTemplate.$target);
                        dg.ToolBar.$target.append(item);
                        dg.ToolBar.Items.set("exportTemplate", dg.ToolBar.BtnExportTemplate);
                    }
                }
                //}
                //else {//处理样式问题（如果去掉或隐藏div_fn，或不设置class为grid-toolbar，都显示不出分页控件，只有后期改变其属性）
                //    div_fn.attr("style", "height:0px;padding:0 0;border-bottom:0px");
                //}
                //dg.ToolBar.$target = div_fn;
                //dg.ToolArea.$target.append(dg.ToolBar.$target);
                $Core.Common.Html.createCustomButton(dg);
                //检测有没有工具栏，如果没有，自动隐藏
                if (dg.ToolBar.Items.length == 0) {
                    dg.isShowCheckBox = false;
                    dg.ToolBar.$target.hide();
                    dg.ToolBar.$target.attr("style", "height:0px;padding:0 0;border-bottom:0px");
                }
            },
            //创建自定义工具条。
            createCustomButton: function (dg) {
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
                            var btnClass = btn.css || "btn-lg";
                            var btnClick = btn.click;
                            var title = btn.title;
                            var classText = btnClass ? "class=\"" + btnClass + "\"" : "";
                            var clickText = btnClick && btnClass != "null" ? "onclick=\"" + btnClick + "(this,'" + dg.id + "')\"" : "";
                            item = $Core.Utility.stringFormat('<a><input type=\"button\" {0} {1}  value=\"{2}\"/></a>', classText, clickText, title);
                        }
                        item = $(item);
                        var toolbarContainer = dg.ToolBar.$target;//  $("#" + dg.ToolArea.id).find(".grid-toolbar"),
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
            },
            //生成表单下拉框。
            createInput: function ($container, dataArray, dg, fromSearch) {
                var $line, configKey, objName, cssName;
                for (var i = 0, len = dataArray.length; i < len; i++) {
                    if (i % 3 == 0) {
                        $line = $("<div class=\"line\">");
                        $container.append($line);
                    }
                    var $lineItem = $("<div class=\"short\">");
                    var $label = $("<label>").html(dataArray[i].title + "：");
                    $lineItem.append($label);
                    var $input = $("<input type=\"text\"/>");
                    var $input2;//日期时的第二个框
                    //如果是下拉框模式执行以下代码
                    var opt = $Core.Common.Privite.getOptions(dataArray[i].formatter, dataArray[i].rules).attrs;
                    if (opt.configKey || opt.objName || opt.configkey || opt.objname)//绑定下拉
                    {
                        $input.attr("name", dataArray[i].field);
                        AR.Common.Privite.setInputAttr($input, opt, $label);
                        if (!$input.attr("operator")) {
                            $input.attr("operator", "=");
                        }
                        if (fromSearch) {

                            $input.attr("onchange", "$Core.Common.Event.onQuery");//("+dg.id+")
                        }
                    }
                    else if (dataArray[i].datatype)//非绑定下拉
                    {
                        $input.attr("operator", "like");
                        var dtype = dataArray[i].datatype.split(',');
                        switch (dtype[0]) {
                            case "date":
                            case "datetime":
                                var type = dataArray[i].formatter == "dateFormatter" ? "date" : dtype[0];
                                var width = type == "date" ? 95 : 140;
                                cssName = "easyui-" + type + "box";
                                $input.attr("name", dataArray[i].field).addClass(cssName).attr("date", dtype[0]).width(150).attr("validType", type + "box");
                                if (fromSearch && dataArray[i].rules) {
                                    $input.width(width);
                                    $input.attr("operator", "<=");
                                    AR.Common.Privite.setInputAttr($input, opt, $label);
                                    if ($input.attr("clone") != "false") {
                                        $input2 = $input.clone(true);
                                        $input2.attr("operator", ">=");
                                        $lineItem.append($input2).append($("<span>").html("&nbsp;至&nbsp;"));
                                        //处理默认值
                                        var defalutValue = $input.val();
                                        if (defalutValue && defalutValue.indexOf(',') > -1) {
                                            var items = defalutValue.split(',');
                                            $input.val(items[1]);
                                            $input2.val(items[0]);
                                        }
                                    }
                                }

                                break;

                            case "int32":
                            case "int64":
                            case "int16":
                            case "byte":
                            case "double":
                            case "single":
                            case "decimal":

                                cssName = "easyui-numberbox";
                                if (dtype[2]) {
                                    switch (dtype[0]) {
                                        case "single": case "double": case "decimal":
                                            $input.attr("precision", dtype[2]); break;
                                    }
                                }
                                $input.attr("name", dataArray[i].field).addClass(cssName);
                                if (fromSearch && dataArray[i].rules) {
                                    $input.width(68);
                                    $input.attr("operator", "<=");
                                    AR.Common.Privite.setInputAttr($input, opt, $label);
                                    if ($input.attr("clone") != "false") {
                                        $input2 = $input.clone(true);
                                        $input2.attr("operator", ">=");
                                        $lineItem.append($input2).append($("<span>").html("&nbsp;-&nbsp;").css({ "display": "block", "float": "left" }));
                                        //处理默认值
                                        var defalutValue = $input.val();
                                        if (defalutValue && defalutValue.indexOf(',') > -1) {
                                            var items = defalutValue.split(',');
                                            $input.val(items[1]);
                                            $input2.val(items[0]);
                                        }
                                    }
                                }
                                break;
                            default:

                                if (dtype[0] == "boolean") {
                                    $input.attr("operator", "=");
                                    cssName = "";
                                }
                                else if (dtype[0] == "string") { cssName = ""; }
                                $input.attr("name", dataArray[i].field).addClass(cssName);
                                if (fromSearch && dataArray[i].rules) {
                                    AR.Common.Privite.setInputAttr($input, opt, $label);
                                }
                                break;
                        }
                        if (!fromSearch && dtype[1]) {
                            var size = parseInt(dtype[1]);
                            var scale = dtype[2];
                            if (scale && scale != 0) //带符点数
                            {
                                size = size + parseInt(scale) + 1; //重置长度,+1是加上.的占位符
                            }
                            $input.addClass("easyui-validatebox");
                            if (!$input.attr("validType")) {
                                $input.attr("validType", "length[1," + size + "]");
                            }
                            if ($input2) {
                                $input2.addClass("easyui-validatebox");
                                if (!$input2.attr("validType")) {
                                    $input2.attr("validType", "length[1," + size + "]");
                                }
                            }
                        }

                    }

                    if (dg && dg.Search) {
                        if ($input2) {
                            dg.Search.Items.set(dataArray[i].field, { $target: $input, $target2: $input2 });
                        }
                        else {
                            dg.Search.Items.set(dataArray[i].field, { $target: $input });
                        }
                    }
                    $lineItem.append($input);
                    $line.append($lineItem);;
                }
            }

        },
        Privite: {
            setColumnRowspan: function (cols, maxLen) {
                for (var i = 0; i < cols.length; i++) {
                    for (var k = 0; k < cols[i].length; k++) {
                        if (cols[i][k].field && cols[i][k].rowspan == 1) {
                            cols[i][k].rowspan = maxLen - i;
                        }
                    }
                }
            },
            getColumnGroup: function getColumnGroup(cols) {
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
            },
            setInputAttr: function ($input, opts, $label) {

                for (var name in opts) {
                    var value = opts[name];
                    switch (name) {
                        case "width":
                            $input.width(value);
                            break;
                        case "height":
                            $input.height(value);
                            break;
                        case "title":
                        case "label":
                            if ($label) { $label.html(value + "："); }
                            else { $input.attr(name, value); }
                            break;
                        case "pattern":
                            $input.attr("operator", value);//pattern在某些浏览器上是关键字，所以变更为opeator
                            break;
                            //case "multiple2"://用于控制行内编辑的多选
                        case "multiple":
                            $input.attr(name, value);//多选，没有指定操作符时(对于$:只对查询的多选、$1对于行内也多选时，不能用in，用默认的like)
                            if (!opts["pattern"]) {
                                $input.attr("operator", "likeor");//如果有行内编辑，应该将操作符设置为like
                            }
                            break;
                        case "defaultValue":
                            if (!(opts.configKey || opts.objName)) {
                                $input.val(value);
                                $input.removeAttr("defaultValue");
                            }
                            else { $input.attr(name, value); }
                            break;
                        default:
                            $input.attr(name, value);
                            break;
                    }
                }
            },

            getOptions: function (formatter, rules) {
                var options = {
                    valueField: 'value',
                    textField: 'text',
                    data: []
                }
                var attrs = {};
                if (rules) {
                    try {
                        var sp = rules.split("{")//支持$:{} 只对查询的多选 $1:{}
                        var rulesOpts = eval("({" + sp[sp.length - 1] + ")");
                        attrs = $.extend(attrs, rulesOpts);
                    } catch (e) { console.info($Core.Lang.configRulesError + " :" + rules); }
                }
                if (formatter) {
                    if (/#C_/.test(formatter)) {
                        attrs.objName = formatter.split('#')[1];
                        if (attrs.objName.indexOf('=>') != -1) {
                            var items = attrs.objName.split('=>');
                            attrs.objName = items[0];
                            attrs.parent = items[1];
                        }
                    }
                    else if (/#/.test(formatter)) {
                        attrs.configKey = formatter.split('#')[1];
                    }
                }
                options.attrs = attrs;
                attrs.multiple && (options.multiple = attrs.multiple);
                return options;
            }
        }
    }

})(jQuery, AR);

