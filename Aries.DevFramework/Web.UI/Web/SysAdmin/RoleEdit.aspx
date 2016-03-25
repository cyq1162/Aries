<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="RoleEdit.aspx.cs" Inherits="Web.UI.Web.SysAdmin.RoleEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="cont-box">
        <div class="cont-box-tit">
            <h3>角色信息</h3>
            <a class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
            <div class="cont-box-form">
                <form>
                    <div class="line">
                        <div class="short">
                            <label><em>*</em>角色名：</label>
                            <input name="RoleName" id="RoleName" missingmessage="" required='true' class='easyui-validatebox' />
                        </div>
                        <div class="short">
                            <label>描述：</label>
                            <input name="Notes" id="Notes"  class='easyui-validatebox' />
                        </div>
                    </div>

                    <div class="btn">
                        <a>
                            <input class="submit" type="submit" name="保存" value="" /></a>
                        <a>
                            <input class="return" type="button" name="取消" value="" /></a>
                    </div>
                    <input type="hidden" name="RoleID" value="" />
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
