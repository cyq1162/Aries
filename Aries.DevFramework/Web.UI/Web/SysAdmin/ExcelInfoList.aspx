<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ExcelInfoList.aspx.cs" Inherits="Web.UI.Web.Sys.ExcelInfoList" %>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="grid" class="cont-box-tab"></table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        var dg;
        TY.Utility.Ajax.Settings.url = TY.handler.sys;
        var ops = {
            sortName: "CreateTime", sortOrder: "desc",
            onLoadSuccess: function ()
            {
                delete dg.self.datagrid("options").defaultWhere;
            }
        }
        var enName = Request.queryString('EnName');
        if (enName && enName.length > 1)
        {
            ops.defaultWhere = [{ paramName: 'EnName', paramPatten: 'equal', paramValue: enName }]//默认查询条件
        }
        dg = TY.DataGrid.create("PB_ExcelInfo",null,null,true,true,ops);
        dg.setButtons([
            { btn: 'edit', url: 'ExcelInfoEdit.aspx', winTitle: "编辑信息" },
            { btn: 'del' },
            { btn: 'detail', url: 'ExcelConfigList.aspx', winTitle: "字段映射" }
        ]);
    </script>
</asp:Content>