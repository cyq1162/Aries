<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Web.UI.Web.Sys.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="grid" class="cont-box-tab"></table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">

        var dg = new TY.DataGrid("V_SYS_UserList", "System_Users","grid");
        dg.options.url = TY.handler.sys;
        //dg.$target.DataGrid({ sortName: "CreateTime", sortOrder: "desc" });
        dg.PKColumn.add("edit", "编辑", null, "UserEdit.aspx", "编辑用户", "edit");
        dg.PKColumn.add("del", "删除", null, null, null, "del");
        dg.bind();

        //TY.ajaxOption.url = TY.handler.sys;
        //var ops = {
        //    sortName: "CreateTime", sortOrder: "desc"
        //}
        //var dg = TY.DataGrid.create("V_SYS_UserList", "System_Users", null, null, null, ops);//,null,null,null,true
        //dg.setButtons([
        //      { btn: 'edit', url: 'UserEdit.aspx', winTitle: "编辑信息", lv2action: 'edit' },
        //      { btn: 'del',lv2action:'del' }
        //]);
    </script>
</asp:Content>
