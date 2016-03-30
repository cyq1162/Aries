<%@ Page Title="" Language="C#" MasterPageFile="~/Web.master"
    AutoEventWireup="true" Inherits="Web.UI.Login" CodeBehind="Login.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Aries.DevFramework</title>
    <link href="/Style/CSS/login-style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="login-head">
        <div class="login-logo">
            <img src="/Style/Images/login-logo.png" alt="" />
        </div>
        <div class="login-ad">
            <img src="/Style/Images/login-ad.png" alt="" />
        </div>
    </div>
    <div class="login-main">
        <div class="w1000">
            <div class="login-img">
                <img src="Style/Images/login-img.png" alt="" />
            </div>
            <div class="login-box">
                <h2 style="text-align: center;">Aries.DevFramework</h2>
                <div class="login-box-in">
                    <div class="login-box-a">
                    </div>
                    <div class="login-box-b">
                        <form method="post" id="formSubmit" runat="server" onsubmit="return loginFunc();">
                            <p>
                                <label>用户名</label><input type="text" id="txtName" name="txtName" value="<%=loginID %>" class="user a" />
                            </p>
                            <p>
                                <label>密 码</label><input type="password" id="txtPwd" name="txtPwd" class="password a" />
                            </p>
                            <div class="memory">
                                <asp:Label ID="lbTip" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="btn">
                                <input id="btnLogin" name="btnLogin" type="submit" value=""/>
                            </div>
                        </form>
                    </div>
                    <div class="login-box-c">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="login-foot">
        <span>Copyright◎2016-2026 CYQ.DevFramework All Rights Reserved.</span>
    </div>
    <script type="text/javascript">
        // keyUpFun(function () { $("#btnLogin").click(); });   //ty.baseExtend.method.j
        function loginFunc() {
            // $('#formSubmit').attr('action', location.href);
            var uName = $.trim($("#txtName").val());
            var uPwd = $.trim($("#txtPwd").val());
            //var uMemory = document.getElementById('memory').checked == true ? "Y" : "N";
            if (uName == "") {
                alert("请输入用户名");
                return false;
            }
            else if (uPwd == "") {
                alert("请输入密码");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
