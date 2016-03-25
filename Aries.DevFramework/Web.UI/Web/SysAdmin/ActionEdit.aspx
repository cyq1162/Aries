<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ActionEdit.aspx.cs" Inherits="Web.UI.Web.SysAdmin.ActionEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="cont-box-tit">
            <h3>测试信息</h3>
            <a class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
            <div class="cont-box-form">
                <form>

                    <div class="line">
                        <div class="short">
                            <label><em>*</em>权限名称：</label>
                            <input name="ActionName" id="ActionName" missingmessage="" required='true' class='easyui-validatebox' />
                        </div>
                        <div class="short">
                            <label><em>*</em>引用名称：</label>
                            <input name="ActionRefName" id="ActionRefName" missingmessage="" required='true' class='easyui-validatebox' />
                        </div>
                    </div>
                    <div class="btn">
                        <a>
                            <input id="btn_submit" class="submit" type="button" name="保存" value="" /></a>
                        <a>
                            <input class="return" type="button" name="取消" value="" /></a>
                    </div>
                    <input type="hidden" name="ActionID" value="" />
                </form>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
