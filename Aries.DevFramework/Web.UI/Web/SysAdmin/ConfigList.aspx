<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ConfigList.aspx.cs" Inherits="Web.UI.Web.Sys.ConfigList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="grid" class="cont-box-tab"></table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        TY.ajaxOption.url = TY.handler.sys;
        var dg = TY.DataGrid.create("PB_Config");
        dg.setButtons([
            { btn: 'edit', url: 'ConfigEdit.aspx', winTitle: "编辑信息" },
            { btn: 'del' }
        ]);
        dg.setToolbar([
            { index: 8, btn: { title: "生成脚本", click: "gotoUrl()", css: "btn-lg", lv2action: 'createsql' } },
        ]);
        function gotoUrl() {
            location.href = ui + "/Tools/PBConfigScript.aspx";
        }
    </script>
</asp:Content>
