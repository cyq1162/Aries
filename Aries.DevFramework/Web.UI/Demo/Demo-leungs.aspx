<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo-leungs.aspx.cs" Inherits="Web.UI.Demo.Demo_leungs" MasterPageFile="~/Web.Master" %>

<asp:Content ContentPlaceHolderID="head" runat="server"></asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="body" runat="server">
    
    <iframe src="Combobox.aspx" style="width:500px; height:600px;"></iframe>
    <form>

        <input name='NeedDomainType' id='NeedDomainType' configkey="需求专业类别" validtype="combobox" required="true" />
    </form>
    <div style="width:100px; height:40px; background-color:green;" id="div_layout"></div>
    <div id="div1"></div>
    <div id="div2"></div>
    <div id="div3"></div>
    <div id="div4"></div>
    <div id="div5"></div>
    <label id="lbl_1">TEST</label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        function Obj() {
            this.array = [1, 2];
        }
        $.each($("div[id]"), function (i) {
            //$.data(this, "k", "AAAAA" + (++i));
            $(this).data("k","BBBBB"+ ++i);
        });
    </script>

</asp:Content>