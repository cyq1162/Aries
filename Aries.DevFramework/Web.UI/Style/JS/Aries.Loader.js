/// <reference path="/Style/JS/jquery-1.7.1.min.js" />
/// <reference path="/Style/JS/json2.js" />
/// <reference path="/Style/JS/EasyUI-1.3.4/jquery.easyui.min.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Global.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Upload.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Utility.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Common.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Combobox.js" />
/// <reference path="/Style/JS/AriesJS/Aries.DataGrid.js" />
/// <reference path="/Style/JS/AriesJS/Aries.Form.js" />

var sys_vs = "v5.4.1.3";//系统版本号

function sys_getCookie(name) {
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
var sys_ui = sys_getCookie('aries_ui');

function isLoginPath() {
    var path = location.pathname;
    if (path.indexOf("/login.") > -1 || path == "/" || (sys_ui && path.indexOf(sys_ui) > -1 && path.length <= sys_ui.length + 2)) {
        return true;
    }
    return false;
}
function isIndexPath() { return location.pathname.indexOf("/index.") > -1; }
function sys_getCss() {
    if (isLoginPath()) {
        return "login";
    }
    if (isIndexPath()) {
        return "index";
    }
    return "main";

}

var sys_theme = sys_getCookie('aries_theme') || 'default';
var easyui_theme = sys_getCookie('easyui_theme') || 'default';

var sys_lang = sys_getCookie('aries_language') || 'zh_CN';
var sys_css = sys_getCss();


//样式
document.write('<link href="' + sys_ui + '/Style/Theme/EasyUI/' + easyui_theme + '/easyui.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + sys_ui + '/Style/Theme/EasyUI/icon.css" rel="stylesheet" type="text/css" />');
document.write('<link href="' + sys_ui + '/Style/Theme/Aries/' + sys_theme + '/' + sys_css + '.css" rel="stylesheet" />');

//jq+easyui

document.write('<script src="' + sys_ui + '/Style/JS/jquery-1.7.1.min.js"></script>');

document.write('<script src="' + sys_ui + '/Style/JS/json2.js" ></script>');

document.write('<script src="' + sys_ui + '/Style/JS/EasyUI-1.3.4/jquery.easyui.min.js?"></script>');
document.write('<script src="' + sys_ui + '/Style/JS/EasyUI-1.3.4/locale/easyui-lang-' + sys_lang + '.js"></script>');
//Aries

document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/locale/Aries.Lang-' + sys_lang + '.js?v=' + sys_vs + '"></script>');
document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.Global.js?v=' + sys_vs + '"></script>');
document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.EasyUIExtend.js?v=' + sys_vs + '"></script>');
document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.Utility.js?v=' + sys_vs + '"></script>');
if (!isLoginPath()) {
    document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.Upload.js?v=' + sys_vs + '"></script> ');
    document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.Combobox.js?v=' + sys_vs + '"></script>');
    document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.Common.js?v=' + sys_vs + '"></script>');
    document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.DataGrid.js?v=' + sys_vs + '"></script>');
    document.write('<script src="' + sys_ui + '/Style/JS/AriesJS/Aries.Form.js?v=' + sys_vs + '"></script>');
}





