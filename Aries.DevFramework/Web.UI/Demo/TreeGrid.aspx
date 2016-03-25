<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="TreeGrid.aspx.cs" Inherits="Web.UI.Demo.TreeGrid" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            var head_json = TY.Ajax('GetHeader', 'PB_Company');
            var cols = formatTGheader(head_json);
            $("#grid").treegrid({
                iconCls: 'icon-edit',
                toolbar: "#ToolBar",
                striped: true,
                nowwrap: false,
                border: true,
                fit: true,
                idField: 'CompanyID',
                treeField: 'CompanyName',
                parentField: 'TopComID',
                _parentField: 'TopComID',
                _searchSub: false,
                loadMsg: "",
                url: '/Ajax/TreegridHandler.ashx',
                fitColumns: true,
                singleSelect: true,
                columns: [cols],
                onBeforeExpand: function (row) {
                    $(this).treegrid("options")._searchSub = true;
                },
                onBeforeLoad: function (row, param) {
                    //param.method = "GetSubItem";
                    if ($(this).treegrid("options")._searchSub) { // load top level rows
                        param.ObjName = "PB_Company";
                        param.method = "GetSubItem";
                        param.parentField = "TopComID";
                    } else {
                        param.ObjName = "PB_Company";
                        param.method = "GetList";
                        param.parentField = "TopComID";
                        param.id = "0";
                    }
                },
                onLoadSuccess: function (row, data) {
                    $(this).treegrid("options")._searchSub = false;
                    regKeyDown($(this));
                    //$(".datagrid-btable").addClass("cont-box-tab");
                    //$(".datagrid-htable").addClass("cont-box-tab");
                },
                onClickRow: function (row) {
                    //mCurrentRow = row;
                },                
                //loadFilter: pagerFilter,
                pagination: true
                , onContextMenu: function (e, row) {
                    e.preventDefault();
                    var idField = $(this).treegrid("options").idField;
                    $(this).treegrid('select', row[idField]);
                    if (!cmenu) {
                        createRowMenu(row, $(this));
                    }
                    cmenu.menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });

                },
                onSelect: function (row) {
                    var that = $(this);
                    var idField = that.treegrid("options").idField;
                    if (editRow) {
                        var edites = that.treegrid("getEditors", editRow[idField]);
                        if (_validChange(edites)) {
                            var data = [];
                            for (var i = 0; i < edites.length; i++) {
                                var field = edites[i];
                                if (!field.hiden) {
                                    var item = { name: field.field, value: field.target.val() };
                                    data.push(item);
                                }
                            }
                            var jsonString = JSON.stringify(data);
                            TY.Ajax(operator, 'PB_Company', data, false, null, '/Ajax/TreegridHandler.ashx', function (d) {
                                if (d.success) {
                                    that.treegrid("endEdit", editRow[idField]);
                                } else {
                                    that.treegrid("cancelEdit", editRow[idField]);
                                }
                                TY.Window.showMsg(d.msg);
                            });
                        } else {
                            that.treegrid("cancelEdit", editRow[idField]);
                        }
                        editRow = null;
                    }
                },
                onHeaderContextMenu: function (e, field) {
                    e.preventDefault();
                    if (!hmenu) {
                        createColumnMenu();
                    }
                    hmenu.menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });

                }
            });
            var pagination = $("#grid").datagrid('getPager');
            $(pagination).pagination({
                total:500,
                beforePageText: '第', //页数文本框前显示的汉字  
                afterPageText: '页    共 {pages} 页',
                displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
            });

            function pagerFilter(data) {
                if ($.isArray(data)) { // is array
                    data = {
                       // total: data.length,
                        rows: data
                    }
                }
                var dg = $(this);
                var state = dg.data('treegrid');
                var opts = dg.treegrid('options');
               // var pager = dg.treegrid('getPager');
                //pager.pagination({
                //    beforePageText: '第', //页数文本框前显示的汉字  
                //    afterPageText: '页    共 {pages} 页',
                //    displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
                //    onSelectPage: function (pageNum, pageSize) {
                //        opts.pageNumber = pageNum;
                //        opts.pageSize = pageSize;
                //        pager.pagination('refresh', {
                //            pageNumber: pageNum,
                //            pageSize: pageSize
                //        });
                //        dg.treegrid('loadData', data);
                //    }
                //});
                if (!data.topRows) {
                    data.topRows = [];
                    data.childRows = [];
                    for (var i = 0; i < data.rows.length; i++) {
                        var row = data.rows[i];
                        if (row._parentId > 300) {
                            data.childRows.push(row)
                        } else {
                            delete row._parentId;
                            data.topRows.push(row)
                        }
                    }
                    //data.total = (data.topRows.length);
                }
                var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
                var end = start + parseInt(opts.pageSize);
                data.rows = $.extend(true, [], data.topRows.slice(start, end).concat(data.childRows));
                return data;
            }



            var cmenu, hmenu, editRow = 0, operator = 'Update', orignal_row;
            //创建行内右键菜单
            function createRowMenu(row, tg) {
                cmenu = $('<div/>').appendTo('body');
                cmenu.menu({
                    onClick: function (item) {
                        //var node = $('#tg').treegrid('getSelected');
                    }
                });
                var node = undefined, tgOptions = tg.treegrid("options");
                cmenu.menu('appendItem', {
                    text: "添加", name: 'add', onclick: function () {
                        node = tg.treegrid('getSelected');
                        var objRow = function () {
                            var cols = $("#grid").treegrid("options").columns[0];//因为获取列返回的是跟二维数组
                            var _item = {};
                            for (var i = 0; i < cols.length; i++) {
                                _item[cols[i].field] = '';
                            }
                            _item[tgOptions.idField] = 0;
                            _item[tgOptions.parentField] = node[tgOptions.idField];
                            return _item;
                        }();
                        tg.treegrid('append', {
                            parent: node[tgOptions.idField],
                            data: [objRow]
                        });
                        tg.treegrid('beginEdit', 0);
                        tg.treegrid('select', 0);
                        editRow = tg.treegrid('getSelected');
                        operator = 'Add';
                    }
                });
                cmenu.menu('appendItem', {
                    text: "编辑", name: 'edit', onclick: function () {
                        node = editRow = tg.treegrid('getSelected');
                        tg.treegrid('beginEdit', node[tgOptions.idField]);
                        var _row = tg.treegrid("getEditors", node[tgOptions.idField]);
                        orignal_row = {};
                        for (var i = 0; i < _row.length; i++) {
                            var field = _row[i].field;
                            var value = _row[i].target.val();
                            orignal_row[field] = value;
                        }
                    }
                });
                cmenu.menu('appendItem', {
                    text: "移除", name: 'remove', onclick: function () {
                        node = $('#grid').treegrid('getSelected');
                        tg.treegrid('remove', node[tgOptions.idField]);
                    }
                });
                cmenu.menu('appendItem', {
                    text: "展开", name: 'expand', onclick: function () {
                        node = $('#grid').treegrid('getSelected');
                        tg.treegrid('expand', node[tgOptions.idField]);
                    }
                });
                cmenu.menu('appendItem', {
                    text: "折叠", name: 'collapse', onclick: function () {
                        node = $('#grid').treegrid('getSelected');
                        tg.treegrid('collapse', node[tgOptions.idField]);
                    }
                });
            }
            //创建表头的右键菜单
            function createColumnMenu(row) {
                hmenu = $('<div/>').appendTo('body');
                hmenu.menu({
                    onClick: function (item) {
                        var tbName = 'PB_Company';
                        TY.Window.open(TY.handler.gridconfig + "?tbName=" + tbName, "", false);
                    }
                });
                hmenu.menu('appendItem', {
                    text: "配置表头",
                    name: "配置表头"
                });
            }
            //验证数组是否有更改过
            function _validChange(currentRow) {
                var flag = false;
                if (operator == 'Update') {
                    each: for (var i = 0; i < currentRow.length; i++) {
                        if (orignal_row[currentRow[i].field] != currentRow[i].target.val()) {
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
            function regKeyDown(tg) {
                document.onkeydown = function (e) {
                    var ev = document.all ? window.event : e;
                    if (ev.keyCode == 27) {
                        tg.treegrid("remove",0); //因为新增的行ID默认为0
                        return false;
                    }
                }
            }
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="grid" class="cont-box-tab"></table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
