<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Web.UI.Demo.Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <select id="s1" style="width:100px; height:200px; float:left;" size="4">
        <option value="1">A</option>
        <option value="2">B</option>
        <option value="3">C</option>
        <option value="4">D</option>
    </select>
    <select id="s2" style="width:100px; height:200px; float:left;" size="4">
    </select>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">
        function callback(data) {
            alert(data.name);
        }
        //添加<script>标签的方法
        function addScriptTag(src) {
            var script = document.createElement('script');
            script.setAttribute("type", "text/javascript");
            script.src = src;
            document.body.appendChild(script);
        }

        window.onload = function () {
            addScriptTag("http://127.0.0.1/jsonptest.js?callback=callback");
        }
    </script>
</asp:Content>
