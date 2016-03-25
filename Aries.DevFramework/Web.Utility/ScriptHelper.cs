using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace Web.Utility
{
    /// <summary>
    /// 脚本弹出提示
    /// </summary>
    public static class ScriptHelper
    {
        /// <summary>
        /// 在客户端页面中显示提示信息，相当于 JavaScript 中的 window.alert 方法
        /// </summary>
        /// <param name="page">显示提示信息的页面对象</param>
        /// <param name="msg">提示信息的文本</param>
        public static void Alert(Page page, string msg)
        {
            RegisterScript(page, JS_Alert(msg));
        }
        public static void Confirm(Page page, string msg, string isTrueDo, string isFalseDo)
        {
            RegisterScript(page, JS_Confirm(msg, isTrueDo, isFalseDo));
        }
        /// <summary>
        /// 在客户端页面中提示信息后关闭页面，相当于执行 alert(info);window.close();
        /// </summary>
        /// <param name="page">提示信息并且关闭的页面对象</param>
        /// <param name="info">提示信息的文本</param>
        /// <param name="refreshParentWindow">是否刷新 page 页面的打开者（window.opener）</param>
        public static void AlertAndClose(Page page, string info, bool refreshParentWindow)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(JS_Alert(info)).Append(JS_Close(refreshParentWindow));
            WriteScript(page, builder.ToString());
        }

        /// <summary>
        /// 在客户端页面中提示信息后关闭对话框
        /// </summary>
        /// <param name="page">提示信息并且关闭的页面对象</param>
        /// <param name="info">提示信息的文本</param>
        /// <param name="returnValue">对话框的返回值</param>
        public static void AlertAndCloseDialog(Page page, string info, string returnValue)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(JS_Alert(info)).Append(JS_CloseDialog(returnValue));
            WriteScript(page, builder.ToString());
        }

        public static void AlertAndCloseDialogOld(Page page, string info, string returnValue)
        {
            StringBuilder builder = new StringBuilder();
            builder.Append(JS_Alert(info)).Append(JS_CloseDialogOld(returnValue));
            WriteScript(page, builder.ToString());
        }

        /// <summary>
        /// 关闭客户端的页面，相当于 JavaScript 中的 window.close 方法。<br />
        /// 注意：某些浏览器（如Firefox）中 window.close 方法只能关闭 window.open 方法打开的窗口
        /// </summary>
        /// <param name="page">需要关闭的页面对象</param>
        /// <param name="refreshParentWindow">是否刷新 page 页面的打开者（window.opener）</param>
        public static void Close(Page page, bool refreshParentWindow)
        {
            RegisterScript(page, JS_Close(refreshParentWindow));
        }

        /// <summary>
        /// 关闭客户端的模式窗口（window.showModalDialog），并且返回指定的值
        /// </summary>
        /// <param name="page">需要关闭的页面对象</param>
        /// <param name="returnValue">对话框的返回值</param>
        public static void CloseDialog(Page page, string returnValue)
        {
            RegisterScript(page, JS_CloseDialog(returnValue));
        }

        /// <summary>
        /// 关闭客户端的模式窗口（window.showModalDialog），并且返回指定的值
        /// </summary>
        /// <param name="page">需要关闭的页面对象</param>
        /// <param name="returnValue">对话框的返回值</param>
        public static void CloseDialogOld(Page page, string returnValue)
        {
            RegisterScript(page, JS_CloseDialogOld(returnValue));
        }

        /// <summary>
        /// 转义 JavaScript 字符串，单引号或双引号、反斜杆、换行符等。
        /// </summary>
        /// <param name="str">需要转义的字符串</param>
        /// <param name="escapeDoubleQuote">是否转义双引号</param>
        /// <returns>转义的字符串</returns>
        public static string EscapeString(string str, bool escapeDoubleQuote)
        {
            string pattern = string.Format(@"('|\\{0}|(?:\r?\n))", escapeDoubleQuote ? "|\"" : string.Empty);
            str = Regex.Replace(str, pattern, @"\$1");
            return str;
        }

        private static string FormatJsString(string s)
        {
            if (!string.IsNullOrEmpty(s))
            {
                s = s.Replace(@"\", @"\\").Replace("'", @"\'").Replace("\r", "").Replace("\n", @"\n");
            }
            return s;
        }

        /// <summary>
        /// 在客户端页面中重定向页面，相当于 JavaScript 中设置 top.location.href 属性
        /// </summary>
        /// <param name="page">需要重定向的页面对象</param>
        /// <param name="urlPage">重定向的 URL</param>
        public static void Goto(Page page, string urlPage)
        {
            RegisterScript(page, JS_Goto(urlPage));
        }

        public static void Redirect(Page page, string urlPage)
        {
            RegisterScript(page, JSRedirect(urlPage));
        }

        public static void TopRedirect(Page page, string urlPage)
        {
            RegisterScript(page, JSTopRedirect(urlPage));
        }

        private static string JS_Alert(string msg)
        {
            return string.Format("alert('{0}');", FormatJsString(msg));
        }
        private static string JS_Confirm(string msg, string isTrueDo, string isFalseDo)
        {
            return "if(confirm('" + FormatJsString(msg) + "')){" + isTrueDo + "} else {" + isFalseDo + "}";
        }
        private static string JS_Close(bool refreshParentWindow)
        {
            string str = string.Empty;
            if (refreshParentWindow)
            {
                str = "try{window.opener.location.href+='';window.opener=null;}catch(e){}";
            }
            return (str + "window.close();");
        }

        private static string JS_CloseDialog(string returnValue)
        {
            //return string.Format("window.returnValue='{0}';window.close();", FormatJsString(returnValue));
            if (returnValue != "")
            {
                if (returnValue == "true")
                {
                    return "var dg = frameElement.lhgDG;var tvalue=dg.getArgs();if(tvalue=='1'){dg.curWin.location.reload();}else{dg.curDoc.forms['form1'].__EVENTTARGET.value = dg.getArgs();dg.curDoc.forms['form1'].__EVENTARGUMENT.value = '';dg.curDoc.forms['form1'].submit();}dg.cancel();";
                }
                else
                {
                    return "var dg = frameElement.lhgDG;dg.cancel();";
                }
            }
            else
            {
                return "var dg = frameElement.lhgDG;dg.cancel();";
            }


        }

        private static string JS_CloseDialogOld(string returnValue)
        {
            return string.Format("window.returnValue='{0}';window.close();", FormatJsString(returnValue));
        }

        private static string JS_Goto(string urlPage)
        {
            return string.Format("top.location.href='{0}';", FormatJsString(urlPage));
        }

        private static string JSRedirect(string urlPage)
        {
            return string.Format("location.href='{0}';", FormatJsString(urlPage));
        }

        private static string JSTopRedirect(string urlPage)
        {
            return string.Format("top.location.href='{0}';", FormatJsString(urlPage));
        }

        private static string JS_Open(string url)
        {
            return string.Format("window.open(encodeURI('{0}'));", FormatJsString(url));
        }

        /// <summary>
        /// 在客户端页面中打开新窗口，相当于 JavaScript 的 window.open 方法
        /// </summary>
        /// <param name="page">要打开新窗口的页面对象</param>
        /// <param name="url">新窗口的 URL</param>
        public static void Open(Page page, string url)
        {
            RegisterScript(page, JS_Open(url));
        }

        /// <summary>
        /// 注册脚本<br />
        /// 此方法将脚本注册到 ClientScript 中，如果此后调用了 Response.End()，则未能执行脚本
        /// </summary>
        /// <param name="page">注册脚本的页面对象</param>
        /// <param name="script">需要注册的脚本</param>
        public static void RegisterScript(Page page, string script)
        {
            string str = "(function(){" + script + "})();";

            page.ClientScript.RegisterStartupScript(page.GetType(), Guid.NewGuid().ToString("N"), str, true);
        }

        /// <summary>
        /// 写脚本<br />
        /// 此方法将脚本直接输出到页面的最前端，这可能导致页面不规范
        /// </summary>
        /// <param name="page">写脚本的页面对象</param>
        /// <param name="script">需要写的脚本</param>
        public static void WriteScript(Page page, string script)
        {
            string s = "<script type=\"text/javascript\">(function(){" + script + "})();</script>";
            page.Response.Write(s);
        }
    }
}
