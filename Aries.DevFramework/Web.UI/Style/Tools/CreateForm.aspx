<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CreateForm.aspx.cs" Inherits="Web.UI.Tool.CreateForm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="cont-box">
        <div class="cont-box-tit">
            <h3>生成页面表单</h3>
            <a class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
            <div class="cont-box-form">
                <form>
                    <div>
                        表名/视图名：<input type="text" id="txtTableName" style="width:200px;" />
                        <label style="color: red;">说明：多个表名或视图名称请用“,”号隔开</label>
                    </div>
                    <div style="padding-left: 80px; padding-top: 5px;">
                        <input type="button" value="生成表单" id="btnCreateForm" />
                    </div>
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#btnCreateForm").click(function () {
                var tableName = $("#txtTableName").val();
                if (tableName == "") {
                    alert("请输入表名/视图名");
                    return false;
                }
                location.href = "CreateFormList.aspx?tbName=" + tableName;
                //window.location();

            });
        })


    </script>
</asp:Content>
