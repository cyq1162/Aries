<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo-v2.aspx.cs" Inherits="Web.UI.Demo.demo_v2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/Style/CSS/ty-main.css" rel='stylesheet' />
    <link href="/Style/JS/EasyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="/Style/JS/EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="/Style/JS/jquery-1.7.1.min.js"></script>
    <script src="/Style/JS/json2.js"></script>
    <script src="/Style/JS/EasyUI/jquery.easyui.min.js"></script>
    <script src="/Style/JS/EasyUI/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Style/JS/AjaxUpload.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.EasyUIExtend.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Utility.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.Common.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.DataGrid.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.Form.js"></script>
    <script src="../Style/JS/TY.Common.js"></script>
    <script src="../Style/JS/EasyUI/plugins/datagrid-detailview.js"></script>

</head>
<body>
    <div style="height:700px;">
        <table id="dg1"></table>
    </div>
    <div style="height:400px;">
        <table id="dg2"></table>
    </div>
    
</body>
        <script type="text/javascript">
            actionKeys = 'config,add,del,import,export';
            var dg = new TY.DataGrid("System_Users", "System_Users","dg1");
            dg.isEditor = true;//是否启用行内编辑的属性
            //dg.options = {
            //    url:TY.handler.ajax,//设置请求的路径
            //    defaultWhere: [{ paramName: 'Sex', paramPatten: 'equal', paramValue: '0' }],
            //    queryParams: {
            //        name: 'easyui',
            //        subject: 'datagrid'
            //    }
            //}
            dg.PKColumn.Editor.isSaveToBehind = true; //是否保存实时数据
            dg.PKColumn.Editor.BtnSave.onBeforePost = function (post_data) { };
            dg.ToolBar.add("按钮1", "clickA", 1);
            dg.ToolBar.add("按钮2", "clickA", 2);
            dg.ToolBar.add("按钮3", "clickA", 3);
            dg.ToolBar.add("按钮4", "clickA", 4);
            dg.ToolBar.add("按钮5", "clickA", 5);
            dg.ToolBar.add("按钮6", "clickA", 6);
            dg.ToolBar.add("按钮7", "clickA", 17);
            dg.ToolBar.addHtml("<span>自定义的HTML</span>", 18);
            //dg.PKColumn.Editor.BtnEdit.hidden = true;
            //dg.PKColumn.add("edit", null, null, "clickA");
            //dg.PKColumn.add("del");
            //dg.PKColumn.add("edit", null, null, "clickA");
            //过滤行内编辑，显示的按钮规则
            dg.PKColumn.onFilter = function (value, row, index, array) {
                if (index % 2 == 0 && array.length>0) {
                    return [].concat(array[0]);
                }
                return array;
            }
            dg.bind();
            
            var dg2 = new TY.DataGrid("System_Users", "System_Users", "dg2");
            dg2.options = {
                title: '<a href="http://192.168.0.133:8022/index.html" target="_blank">http://192.168.0.133:8022/index.html  框架API地址</a>',
                // pagination: false,
                view: detailview,//使用此子控件 需要引入Style/JS/EasyUI/plugins/datagrid-detailview.js
                detailFormatter: function (index, row) {
                    return '<div style="padding:2px"><table class="ddv"></table></div>';
                },
                onExpandRow: function (index, row) {
                    var ddv = $(this).datagrid('getRowDetail', index).find('table.ddv');
                    row.userid;
                    var data = []//TY.Utility.Ajax.post(); 请求数据
                    ddv.datagrid({
                        data: [{ "orderid": "1002", "linenum": "2", "itemid": "EST-13", "quantity": "1", "unitprice": "18.50" }, { "orderid": "1003", "linenum": "1", "itemid": "EST-13", "quantity": "2", "unitprice": "18.50" }, { "orderid": "1010", "linenum": "1", "itemid": "EST-13", "quantity": "1", "unitprice": "18.50" }, { "orderid": "1015", "linenum": "2", "itemid": "EST-13", "quantity": "1", "unitprice": "18.50" }],
                        fitColumns: true,
                        singleSelect: true,
                        rownumbers: true,
                        loadMsg: '',
                        height: 'auto',
                        columns: [[
                        { field: 'orderid', title: 'Order ID', width: 200 },
                        { field: 'quantity', title: 'Quantity', width: 100, align: 'right' },
                        { field: 'unitprice', title: 'Unit Price', width: 100, align: 'right' }
                        ]],
                        onResize: function () {
                            $('#dg').datagrid('fixDetailRowHeight', index);
                        },
                        onLoadSuccess: function () {
                            setTimeout(function () {
                                $('#dg').datagrid('fixDetailRowHeight', index);
                            }, 0);
                        }
                    });
                    $(this).datagrid('fixDetailRowHeight', index);
                },
                queryParams: {
                    name: 'easyui',
                    subject: 'datagrid'
                }
            }
            dg2.ToolBar.add("按钮1", "clickA", 1);
            dg2.ToolBar.addHtml("<span>自定义的HTML</span>", 1);
            dg2.PKColumn.add("edit");
            dg2.PKColumn.add("del");
            dg2.bind();
            //取消框架按钮的事件需用undelagete注销，然后再注册自己定义的事件
            //$("#" + dg.Internal.toolbarID).undelegate("[flag = 'btn_add']","click");
            

            function clickA(aaa) {
                alert(2);
            }
                       
    </script>
</html>
