<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="DepartmentList.aspx.cs" Inherits="Web.UI.Web.SysAdmin.DepartmentList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <table id="tg" class="cont-box-tab"></table>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
      <script type="text/javascript">
          TY.ajaxOption.url = TY.handler.sys;
          TY.TreeGrid.create('System_Department', null, 'tg', 'ID', 'DepartmentName', 'ParentID');
    </script>
</asp:Content>
