<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ActionList.aspx.cs" Inherits="Web.UI.Web.SysAdmin.ActionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="grid"></table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        var dg = TY.DataGrid.create("System_Action", "System_Action", "grid", true, true, {fitColumns:true});
        dg.setButtons([
            { btn: 'edit', url: 'ActionEdit.aspx', winTitle: "编辑信息", lv2action: 'edit' },
            { btn: 'del', lv2action: 'del' }
        ]);
    </script>
</asp:Content>
