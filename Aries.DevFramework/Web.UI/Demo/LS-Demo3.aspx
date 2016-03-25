<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="LS-Demo3.aspx.cs" Inherits="Web.UI.Demo.LS_Demo3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div style="height:400px;">
<table id="dg">

    </table>
    </div>
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        //actionKeys = 'config,add'
        var dg = TY.DataGrid.create("TestUser", "TestUser", "dg", null, null, null);
        dg.setButtons([
                    { btn: 'edit', url: 'DemoEdit.aspx', winTitle: "编辑信息", title: '纳尼？What is the matter' },
                    { btn: 'del' },
                    { btn: 'map', click: 'clickB' },
                    { btn: 'detail', url: '', winTitle: "详细信息", lv2action: 'd' }
                    //{ btn: '查看', url: '', winTitle: "详细信息", title: 'hellow' },
                    //{ btn: '文件', url: '', winTitle: "文件信息", title: 'hellow-文件' }
        ]);
        ////css不设定 默认 btn-sm
        //dg.setToolbar([
        //    { index: 1, btn: { title: "自定义按钮A", click: "clickA", css: "btn-lg" } },
        //    { index: 4, btn: { title: "自定义按钮B", click: "clickA", css: "btn-sm" } }
        //]);
        function clickA() {
            alert('AAA');
        }
        function clickB(value, row, index) {
            alert(row.FullName);
        }
        //TY.TreeGrid.create("PB_Inspect", "PB_Inspect", "tg", "XJID", "Name", "FXJID", null);
        
    </script>
</asp:Content>
