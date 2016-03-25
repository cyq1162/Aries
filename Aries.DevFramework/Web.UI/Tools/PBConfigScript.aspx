<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PBConfigScript.aspx.cs" Inherits="Web.UI.Tools.PBConfigScript" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="padding: 20px;">

            <span>键名称（多个以逗号分隔）：<asp:TextBox ID="txtKeys" runat="server" Width="577px"></asp:TextBox></span>
            <asp:Button ID="btnLoadConfig" runat="server" Text="生成SQL" OnClick="btnLoadConfig_Click" />
            <asp:Button ID="btnDownConfig" runat="server" Text="下载SQL脚本" OnClick="btnDownConfig_Click" />
            <asp:CheckBox ID="chbWithDelete" runat="server" Text="输出删除语句" Checked="true" />
        </div>
        <asp:TextBox ID="txtSQL" runat="server" Rows="50" TextMode="MultiLine" Width="90%"></asp:TextBox>
    </form>
</body>
</html>
