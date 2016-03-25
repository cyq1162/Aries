<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoRowEdit.aspx.cs" Inherits="Web.UI.Demo.DemoRowEdit" MasterPageFile="~/Web.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <script type="text/javascript">
        function custom(f) {
            return function (v, r, i) {
                return r[f];
            }
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="body">
    <table id="dg_edit" class="cont-box-tab"></table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="script">
    <script type="text/javascript">
        var dg = TY.DataGrid.create("System_Users", "System_Users", "dg_edit", false, true, null, { update: 'Update', insert: 'Add', url: '', customFill: { DeptName: '测试' } });
    </script>
</asp:Content>