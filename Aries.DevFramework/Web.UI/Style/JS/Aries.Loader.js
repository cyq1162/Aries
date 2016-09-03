/// <reference path="/Style/JS/AriesJS/Aries.Utility.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Upload.js" />
/// <reference path="/Style/JS/AriesJS/Aries.DataGrid.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Form.js" />
/// <reference path="/Style/JS/AriesJS/Aries.EasyUIExtend.js" />
/// <reference path="/Style/JS/AriesJS/Aries.DataGrid.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Common.js" />
/// <reference path="json2.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Config.js" />
/// <reference path="jquery-1.7.1.min.js" />
function getCookie(name) {
    var c = document.cookie;
    var start = c.indexOf(name);
    if (start > -1) {
        start = start + name.length + 1;
        var end = c.indexOf(';', start);
        if (end > start) {
            return c.substr(start, end - start);
        }
        return c.substr(start, c.length - start);
    }
    return "";
}
var ui = getCookie('sys_ui');
document.write('<link id="lk_theme" href="'+ui+'/Style/JS/EasyUI-1.3.4/themes/default/easyui.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + ui + '/Style/CSS/main.css" rel="stylesheet" />');
document.write('<link href="' + ui + '/Style/JS/EasyUI-1.3.4/themes/icon.css" rel="stylesheet" type="text/css" />');

document.write('<script src="' + ui + '/Style/JS/jquery-1.7.1.min.js"></script>');
document.write('<script src="' + ui + '/Style/JS/json2.js" ></script>');
document.write('<script src="' + ui + '/Style/JS/EasyUI-1.3.4/jquery.easyui.min.js"></script>');
document.write('<script src="' + ui + '/Style/JS/EasyUI-1.3.4/locale/easyui-lang-zh_CN.js"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.EasyUIExtend.js"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Utility.js"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Upload.js"></script> ');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Common.js"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.DataGrid.js"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Form.js?r=1"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Config.js"></script>');
document.write('<script src="' + ui + '/Style/JS/AriesJS/Aries.Themes.js"></script>');



