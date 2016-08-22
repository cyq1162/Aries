(function ($,$Core) {

    $Core.TreeGrid = function (ID, objName, tableName, idField, treeField, parentField, rootID, isExpand) {
        this.Internal = {
            type:'treegrid',
            id: ID || 'tg',
            toolbarID: "div_toolbar_" + Math.floor(Math.random() * 10000),
            btn_query_id: "btn_query_" + Math.floor(Math.random() * 10000),
            btn_reset_id: "btn_reset_" + Math.floor(Math.random() * 10000),
            headerData: new Array()
        };
        this.$target = null;
        this.objName = objName;
        this.tableName = tableName || objName;
        this.idField = idField;
        this.treeField = treeField;
        this.parentField = parentField;
        this.rootID = rootID;
        this.isShowToolArea = true;
        this.options = {};
        this.ToolBar = new $Core.Common._Internal.ToolBar();
        this.Search = new $Core.Common._Internal.Search();
        this.isExpand = isExpand || false;
        //if (options.isShowToolArea) {
        //    this.toolbar = opts.isShowToolArea;
        //}
        //else { this.toolbar = true;}        
        if (typeof (opts) == "object") {
            this.opts = opts;
        }
        this.operator = null;
    }
    $Core.TreeGrid.prototype = {
        bind: function () {
            this.Internal.headerData = $Core.Utility.Ajax.post('GetHeader', this.objName, null, false);
            var that = this;
            var cols = $Core.Common.Formatter.formatTGheader(that.Internal.headerData);
            var _options = {
                iconCls: 'icon-edit',
                toolbar: "#" + that.Internal.toolbarID,
                striped: true,
                nowwrap: false,
                border: true,
                fit: true,
                tableName: that.tableName,
                idField: that.idField,
                treeField: that.treeField,
                parentField: that.parentField,
                _parentField: that.parentField,
                rootID: that.rootID,
                _searchSub: false,
                loadMsg: "",
                url: $Core.route.root
                    + $Core.Utility.stringFormat('?sys_ObjName={0}&sys_method={1}&parentField={2}&sys_mid={3}',
                    that.objName, (that._searchSub ? 'GetList' : 'GetList')
                    , that.parentField, AR.Global.Variable.mid),
                fitColumns: true,
                singleSelect: true,
                columns: [cols],
                onBeforeExpand: function (row) {
                    $(this).treegrid("options")._searchSub = true;
                },
                onBeforeLoad: function (row, param) {
                    param.page = null;
                    param.rows = null;
                },
                onLoadSuccess: function (row, data) {
                    $(this).treegrid("options")._searchSub = false;
                    regKeyDown($(this), that);
                    //$(".datagrid-btable").addClass("cont-box-tab");
                    //$(".datagrid-htable").addClass("cont-box-tab");
                },
                onClickRow: function (row) {
                    //mCurrentRow = row;
                },
                onLoadError: function () {
                    console.log('server error');
                },
                loadFilter: loadFilter(that),
                pagination: true
            , onContextMenu: function (e, row) {
                e.preventDefault();
                var idField = $(this).treegrid("options").idField;
                $(this).treegrid('select', row[idField]);
                if (!that.cmenu) {
                    createRowMenu(that);
                }
                that.cmenu.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });

            },
                onSelect: function (row) {
                    var idField = that.idField;
                    var tg = $(this);
                    if (that.editRow) {
                        var edites = tg.treegrid("getEditors", that.editRow[idField]);
                        if (_validChange(edites, that)) {
                            var data = [];
                            for (var i = 0; i < edites.length; i++) {
                                var field = edites[i];
                                if (field.hiden != true) {
                                    var item = { name: field.field, value: field.target.val() };
                                    data.push(item);
                                }
                            }
                            var hasParent = false;
                            var columnName = that.operator == 'Add' ? that.parentField : that.idField;
                            for (var i = 0; i < data.length; i++) {
                                hasParent = data[i].name == columnName;
                                if (hasParent) {
                                    break;
                                }
                            }

                            if (!hasParent) {
                                var item = { name: columnName, value: that.editRow[columnName] };
                                data.push(item);
                            }
                            var jsonString = JSON.stringify(data);
                            $Core.Utility.Ajax.post(that.operator, that.tableName, data, null, '/Ajax/Treegridroute.ashx', function (d) {
                                var msg = '操作成功！';
                                if (d.success) {
                                    tg.treegrid("endEdit", that.editRow[idField]);
                                    if (that.operator === 'Add') {
                                        var _row = {}; _row[idField] = d.msg;
                                        tg.treegrid('updateRow', {
                                            index: that.editRow[idField],
                                            row: _row
                                        });
                                    }
                                    that.operator = null;
                                    //tg.treegrid("reload");
                                } else {
                                    tg.treegrid("cancelEdit", that.editRow[idField]);
                                    msg = '操作失败！'
                                }
                                $Core.Utility.Window.showMsg(msg);
                                that.editRow = null;
                            });
                        } else {
                            tg.treegrid("cancelEdit", that.editRow[idField]);
                        }

                    }
                },
                onHeaderContextMenu: function (e, field) {
                    e.preventDefault();
                    if (!that.hmenu) {
                        createColumnMenu(that);
                    }
                    that.hmenu.menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });

                }
            }
            var merge_options = $.extend(_options, (this.options || {}));
            $Core.Common._Internal.createSearchForm(that);
            that.$target = $("#" + that.Internal.id).treegrid(merge_options);
            _registerToolbar(that);
            $Core.Common._Internal.registerEvent(that);
        }
    }
    function _setToolbar(btnArray) {
        if (!(btnArray instanceof Array)) {
            throw TypeError('参数必须是一个数组');
        }
        var hiddenCount = 0;
        for (var i = 0, len = btnArray.length; i < len; i++) {
            var lv2action = btnArray[i].lv2action && btnArray[i].lv2action.toLowerCase();
            if (!lv2action || actionKeys.indexOf(',' + lv2action) > -1) {
                var index = btnArray[i].index;
                var btn = btnArray[i].btn;
                var btnClass = btn.css || "btn-sm";
                var btnClick = btn.click;
                var title = btn.title;
                var item = StringFormat.execute('<a><input class=\"{0}\" type=\"button\" onClick=\"{1}()\"  value=\"{2}\"/></a>', btnClass, btnClick, title);
                //    orignalArray.splice(index, 0, item);
                var toolbarContainer = $("#" + this.toolbarID).find(".function-box"), count = toolbarContainer.children().length;
                if (count == 0) {
                    toolbarContainer.append(item);
                } else {
                    if (count < index) {
                        index = count;
                    }
                    toolbarContainer.children("a:eq(" + (index - 1) + ")").after(item);
                }
            }
        }
    }
    function loadFilter(that) {
        return function pagerFilter(data, parent) {
            if (parent) {
                return data;
            } else {
                if ($.isArray(data)) { // is array
                    data = {
                        total: data.length,
                        rows: data
                    }
                }
                var dg = $(this);
                var state = dg.data('treegrid');
                var opts = dg.treegrid('options');

                var pager = dg.treegrid('getPager');
                //如果不是查询则处理 ,that.isSearch 属性在查询按钮时赋值为true
                //if (that.isSearch != true) {
                data.rows = _getTreeData(data.rows || [], opts.idField || 'id', opts.treeField || 'text', opts.parentField || '_parentId', opts.rootID, that.isExpand);
                //}
                //_openFirstNode(data.rows);
                pager.pagination({
                    onSelectPage: function (pageNum, pageSize) {
                        opts.pageNumber = pageNum;
                        opts.pageSize = pageSize;
                        pager.pagination('refresh', {
                            pageNumber: pageNum,
                            pageSize: pageSize
                        });
                        dg.treegrid('loadData', data);
                    }
                });
                if (!data.topRows) {
                    data.topRows = [];
                    data.childRows = [];
                    for (var i = 0; i < data.rows.length; i++) {
                        var row = data.rows[i];
                        if (row._parentId && row._parentId != opts.rootID) {                            
                            data.childRows.push(row)
                        } else {
                            data.topRows.push(row);
                        };
                        delete row._parentId;
                    }
                    data.total = (data.topRows.length);
                }
                var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
                var end = start + parseInt(opts.pageSize);
                data.rows = $.extend(true, [], data.topRows.slice(start, end).concat(data.childRows));
                that.isSearch = null; //重置查询标识
                return data;
            }
        }

    }    
    
    function _getTreeData(nodes, idField, textField, parentField, rootID, IsExpand) {
        return function (parentid) {
            var cn = new Array();
            for (var i = 0; i < nodes.length; i++) {
                var n = {}, attrs = {};
                each: for (var j in nodes[i]) {
                    n[j] = nodes[i][j];
                }
                if (nodes[i][parentField] == "") nodes[i][parentField] = undefined;
                if (nodes[i][parentField] == parentid) {
                    n._parentId = nodes[i][parentField];
                    n.children = arguments.callee(nodes[i][idField]);
                    if (!n.children.length == 0 && IsExpand != true) {
                        n.state = 'closed';
                    }
                    cn.push(n);
                }
            }
            return cn;
        } (rootID);
    }
    //递归打开第一层所有节点
    function _openFirstNode(data) {
        if (data[0].children && data[0].children.length > 0) {
            data[0].state = 'open';
            arguments.callee(data[0].children);
        }
    }

    //var cmenu, hmenu;
    //创建行内右键菜单
    function createRowMenu(tg_obj) {
        tg_obj.cmenu = $('<div/>').appendTo('body');
        tg_obj.cmenu.menu({
            onClick: function (item) {
                //var node = $('#tg').treegrid('getSelected');
            }
        });
        var node = undefined, tg = $("#" + tg_obj.Internal.id), tgOptions = tg.treegrid("options");
        tg_obj.cmenu.menu('appendItem', {
            text: "添加", name: 'add', onclick: function () {
                node = tg.treegrid('getSelected');
                var _rowId = 0;
                var objRow = function () {
                    var cols = tg.treegrid("options").columns[0]; //因为获取列返回的是跟二维数组
                    var _item = {};
                    for (var i = 0; i < cols.length; i++) {
                        _item[cols[i].field] = '';
                    }
                    if (node.children && node.children.length > 0) {
                        _rowId = node.children[node.children.length - 1][tgOptions.idField] + 1;
                    } else {
                        _rowId = node[tgOptions.idField] + '01';
                    }
                    _item[tgOptions.idField] = _rowId;
                    _item[tgOptions.parentField] = node[tgOptions.idField];
                    if (tgOptions.fullpathField) {
                        _item[tgOptions.fullpathField] = node[tgOptions.fullpathField] ? (node[tgOptions.fullpathField] + '|' + node[tgOptions.idField]) : node[tgOptions.idField];
                    }
                    return _item;
                } ();
                tg.treegrid('append', {
                    parent: node[tgOptions.idField],
                    data: [objRow]
                });
                tg.treegrid('beginEdit', _rowId);
                tg.treegrid('select', _rowId);
                tg_obj.editRow = tg.treegrid('getSelected');
                tg_obj.operator = 'Add';
            }
        });
        tg_obj.cmenu.menu('appendItem', {
            text: "编辑", name: 'edit', onclick: function () {
                node = tg_obj.editRow = tg.treegrid('getSelected');
                tg.treegrid('beginEdit', node[tgOptions.idField]);
                var _row = tg.treegrid("getEditors", node[tgOptions.idField]);
                tg_obj.orignal_row = {};
                for (var i = 0; i < _row.length; i++) {
                    var field = _row[i].field;
                    var value = _row[i].target.val();
                    tg_obj.orignal_row[field] = value;
                }
                tg_obj.operator = 'Update';
            }
        });
        tg_obj.cmenu.menu('appendItem', {
            text: "移除", name: 'remove', onclick: function () {
                node = tg.treegrid('getSelected');
                var id = node[tgOptions.idField];
                $Core.Utility.Window.confirm('确认删除吗？', null, function () {
                    var obj = $Core.ajax('Delete', tg_obj.tableName, { id: StringFormat.execute("{0}", id) }, false);
                    if (obj.success) {
                        tg.treegrid('remove', id);
                        //tg.treegrid("reload");
                    }
                    $Core.Utility.Window.showMsg(obj.msg);
                });

            }
        });
        tg_obj.cmenu.menu('appendItem', {
            text: "展开", name: 'expand', onclick: function () {
                node = tg.treegrid('getSelected');
                tg.treegrid('expand', node[tgOptions.idField]);
            }
        });
        tg_obj.cmenu.menu('appendItem', {
            text: "折叠", name: 'collapse', onclick: function () {
                node = tg.treegrid('getSelected');
                tg.treegrid('collapse', node[tgOptions.idField]);
            }
        });
    }
    //创建表头的右键菜单
    function createColumnMenu(tg_object) {
        tg_object.hmenu = $('<div/>').appendTo('body');
        tg_object.hmenu.menu({
            onClick: function (item) {
                var url = $Core.Utility.stringFormat("{0}?viewName={1}", $Core.Global.Variable.ui + '/Web/SysAdmin/config.html', tg_object.objName);
                $Core.Utility.Window.open(url, "", false);
            }
        });
        tg_object.hmenu.menu('appendItem', {
            text: "配置表头",
            name: "配置表头"
        });
    }
    //验证数组是否有更改过
    function _validChange(currentRow, tg_obj) {
        var flag = false;
        if (tg_obj.operator == 'Update') {
            each: for (var i = 0; i < currentRow.length; i++) {
                if (tg_obj.orignal_row[currentRow[i].field] != currentRow[i].target.val()) {
                    flag = true;
                    break each;
                }
            }
        } else {
            flag = true;
        }
        return flag;
    }
    //注册键盘按下事件
    function regKeyDown(tg, tg_obj) {
        document.onkeydown = function (e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode == 27) {
                var node = tg_obj.$target.treegrid('getSelected')
                if (node) {
                    if (tg_obj.operator == 'Add') {
                        tg_obj.$target.treegrid("remove", node[tg_obj.idField]);
                    } else {
                        tg_obj.$target.treegrid("cancelEdit", node[tg_obj.idField]);
                    }
                    tg_obj.operator = null;
                    tg_obj.editRow = null;
                }
                return false;
            }
        }
    }
    //注册工具条按钮事件,此功能尚未完成 
    function _registerToolbar(that) {
        var toolbar = $("#" + that.Internal.toolbarID);
        var tg = $("#" + that.Internal.id);
        toolbar.delegate("[flag = 'btn_add']", "click", function () {
            var div_form = $('<div class="cont-box-form">');
            var div_container = $("<div>").append(
                $('<div class="cont-box-tit">')
            // .append($('<h3>新建节点</h3>'))
            //  .append($('<a class="arrows hover"></a>'))
                )
                .append(
                    $('<div class="cont-box-in">').append(div_form)
                );
            var $form = $("<form>");
            var colConstruct = that.Internal.headerData;
            for (var i = 0; i < colConstruct.length; i++) {
                var field = colConstruct[i].field;
                if (field == that.parentField) {
                    continue;
                }
                var hidden = colConstruct[i].hidden;
                var title = colConstruct[i].title;

                var type = colConstruct[i].datatype;
                //var isnull = colConstruct[i].title;
                var div_line = $('<div class="line">');
                //创建文本
                var div_title = $('<label>').html(title + "：");
                //创建输入标签
                var _input = $('<input>').attr("name", field);
                var div_item = $('<div class="short">').append(div_title).append(_input);
                div_line.append(div_item);
                $form.append(div_line);
            }
            div_form.append($form);
            div_container.append(div_form);
            //创建窗口
            var div_id = "tg_div_win";
            var div = $("<div>").attr("id", div_id);
            $("body").append(div);
            $('#' + div_id).dialog({
                width: 600,
                height: 400,
                content: div_container,
                modal: true,
                minimizable: false,
                maximizable: false,
                toolbar: [{
                    text: '保存',
                    iconCls: 'icon-save',
                    route: function () {
                        var postData = $form.find("[name]:input").serializeArray();
                        postData.push({ mid: mid });
                        result = $Core.ajax("Add", that.tableName, postData, false);
                        if (result && result.success) {
                            $Core.Utility.Window.showMsg("添加成功", "消息提示");
                            tg.treegrid("reload");
                            $('#' + div_id).dialog("close");
                        }
                    }
                }],
                onClose: function () {
                    $(this).window("destroy");
                }
            });
            //tg.treegrid("reload");
        });
    }
})(jQuery, AR);