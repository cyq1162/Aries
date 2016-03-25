<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DemoTreeGrid.aspx.cs" Inherits="Web.UI.Demo.DemoTreeGrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="/Style/CSS/ty-main.css" rel='stylesheet' />
       <link href="/Style/JS/EasyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
       <link href="/Style/JS/EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
       <script src="/Style/JS/jquery-1.7.1.min.js"></script>
       <script src="/Style/JS/json2.js" ></script>
       <script src="/Style/JS/EasyUI/jquery.easyui.min.js"></script>
       <script src="/Style/JS/EasyUI/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Style/JS/AjaxUpload.js"></script>

    <script src="../Style/JS/plugin2.0/ty.easyui.extend.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Utility.js"></script>    
    <script src="../Style/JS/plugin2.0/TY.Core.Common.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.DataGrid.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.TreeGrid.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.Form.js"></script>
    <script src="../Style/JS/TY.Common.js"></script>
    
    
</head>
<body>
    <div style="height:400px;">
        <table id="tg"></table>
    </div>
</body>
     <script type="text/javascript">
         actionKeys = 'config,add,del,import,export';

         var tg = new TY.TreeGrid("tg", "PB_Inspect", "PB_Inspect", 'XJID', 'Name', 'FXJID',null,false);
         tg.options = {
             pageList: [2],
             fullpathField: 'FullParentPath'
         }
         tg.bind();
    </script>
</html>