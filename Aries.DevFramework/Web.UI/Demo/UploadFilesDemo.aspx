<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="UploadFilesDemo.aspx.cs" Inherits="Web.UI.Demo.UploadFilesDemo" %>

<%@ Register src="../UserControl/UploadFileV2.ascx" tagname="UploadFileV2" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Style/JS/plugin2.0/TY.Core.Upload.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <form id="form1" runat="server">
        <uc2:UploadFileV2 ID="UploadFileV21" runat="server" DisplayMode="Default" ViewMode="Default"  GroupType="KaiGongBaoGao,YinBiGongCheng" />
        <uc2:UploadFileV2 ID="UploadFileV1" runat="server" DisplayMode="Default" ViewMode="Default"  GroupType="KaiGongBaoGao,YinBiGongCheng" />
        <uc2:UploadFileV2 ID="UploadFileV2" runat="server" DisplayMode="Default" ViewMode="Default"  GroupType="KaiGongBaoGao,YinBiGongCheng" />
    </form>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        //上传模式,注意文件类型过滤的字符串，是分号而不是逗号分隔
        TY.FileUpload.items[0].init('11111111-0f19-810b-5edd-14d6de2cdced',
            {
                file_types_description: 'Word跟Excel文件过滤',
                file_types: "*.doc;*.docx;*.xls;*.xlsx"
            }
            ,{
                onLoadSuccess: function () {
                    console.log('load ok ...');
                },
                isShowToolbar: true//需要显示工具栏，自定义按钮事件时需要定义该属性
                ,height: 300 //设置DataGrid的高度
            }            
        );
        //浏览模式
        TY.FileUpload.items[1].init('22222222-0f19-810b-5edd-14d6de2cdced');
        //默认模式
        TY.FileUpload.items[2].init('33333333-0f19-810b-5edd-14d6de2cdced');
    </script>
</asp:Content>
