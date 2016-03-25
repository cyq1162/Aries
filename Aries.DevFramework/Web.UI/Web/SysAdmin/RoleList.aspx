<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="RoleList.aspx.cs" Inherits="Web.UI.Web.SysAdmin.RoleList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(function () {
            dg = TY.DataGrid.create('V_SYS_RoleList', 'System_Role', 'grid', true, true, { fitColumns: true });
            dg.setButtons([
              { btn: 'edit', url: 'RoleEdit.aspx', winTitle: "编辑信息" },
              { btn: 'detail', url: 'RoleAction.aspx', winTitle: "权限分配" },
              { btn: 'del' }
            ]);

        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="grid"></table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">

</asp:Content>
