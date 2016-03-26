<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="AreaList.aspx.cs" Inherits="Web.UI.Web.SysAdmin.AreaList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <table id="tg" class="cont-box-tab"></table>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
      <script type="text/javascript">
          TY.Utility.Ajax.Settings.url = TY.handler.sys;
          TY.TreeGrid.create('PB_Area', null, 'tg', 'ID', 'AreaName', 'ParentID');
    </script>
</asp:Content>

