using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Net;
using System.Data;
using CYQ.Data;
using CYQ.Data.Tool;
using CYQ.Data.Cache;
using System.Threading;
using Aries.Core.Config;

namespace Aries.Core.Helper
{
    public static partial class WebHelper
    {

        #region 安全Key检测
        public static bool IsKeyInHtml(string objName)
        {
            string path = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.UrlReferrer.LocalPath);
            bool result = IsObjInHtml(objName, path);
            if (!result)
            {
                if (path.EndsWith("edit.html"))
                {
                    result = IsObjInHtml(objName, path.Replace("edit.html", "list.html"));
                }
                else if (path.EndsWith("Edit.html"))//Linux区分大小写。
                {
                    result = IsObjInHtml(objName, path.Replace("Edit.html", "List.html"));
                }
            }
            return result;
        }
        private static bool IsObjInHtml(string objName, string path)
        {
            if (string.IsNullOrEmpty(objName))
            {
                return false;
            }
            objName = objName.Trim('_', ' ');
            DistributedCache cache = DistributedCache.Local;
            string has = path.GetHashCode().ToString();
            string html = string.Empty;
            if (cache.Contains(has))
            {
                html = cache.Get<string>(has);
            }
            else if (File.Exists(path))
            {
                html = File.ReadAllText(path);
                cache.Set(has, html, 0, path);
            }
            if (!string.IsNullOrEmpty(html))
            {
                //检测文件中是否有对应的关键字：
                if (html.Contains(objName))
                {
                    return true;
                }
            }

            return false;
        }
        #endregion

        /// <summary>
        /// 默认首页设置
        /// </summary>
        /// <returns></returns>
        public static string GetDefaultUrl()
        {
            return AppConfig.GetApp("DefaultUrl", "");
        }
        /// <summary>
        /// 是否部署成子目录（虚拟目录）
        /// </summary>
        public static bool IsUseUISite
        {
            get
            {
                string ui = AppConfig.GetApp("UI", string.Empty).ToLower();
                if (ui != string.Empty)
                {
                    ui = ui.Trim('/');
                    string localPath = HttpContext.Current.Request.Url.LocalPath.Trim('/').ToLower();
                    return localPath == ui || localPath.StartsWith(ui + "/");
                }
                return false;
            }
        }
        public static string AriesSuffix
        {
            get
            {
                return AppConfig.GetApp("Aries.Suffix", ".html");
            }
        }
        /// <summary>
        /// 默认是否.html结尾
        /// </summary>
        /// <returns></returns>
        public static bool IsAriesSuffix()
        {
            if (HttpContext.Current == null)
            {
                return false;
            }
            return HttpContext.Current.Request.Url.LocalPath.EndsWith(AriesSuffix);
        }
        /// <summary>
        /// 以下包含的路径必须登陆后才能访问
        /// </summary>
        /// <param name="uri"></param>
        /// <returns></returns>
        public static bool IsCheckToken()
        {
            if (!IsNeedCheckToken(HttpContext.Current.Request.Url))
            {
                return IsNeedCheckToken(HttpContext.Current.Request.UrlReferrer);
            }
            return true;
        }
        private static bool IsNeedCheckToken(Uri uri)
        {
            if (uri != null)
            {
                string lowerPath = uri.LocalPath.ToLower();
                string[] items = AppConfig.GetApp("CheckTokenPath", "/web/,/index.html").ToLower().Split(',');//可以扩展多个
                foreach (string item in items)
                {
                    if (lowerPath.Contains(item))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        public static T Query<T>(string key)
        {
            return Query<T>(key, default(T), false);
        }
        public static T Query<T>(string key, T defaultValue, string fromUrlQuery)
        {
            if (!string.IsNullOrEmpty(fromUrlQuery))
            {
                int startIndex = Math.Max(fromUrlQuery.IndexOf("&" + key + "=", StringComparison.OrdinalIgnoreCase), fromUrlQuery.IndexOf("?" + key + "=", StringComparison.OrdinalIgnoreCase));
                if (startIndex > -1)
                {
                    string result = string.Empty;
                    int end = fromUrlQuery.IndexOf("&", startIndex + key.Length + 2);
                    if (end == -1)
                    {
                        result = fromUrlQuery.Substring(startIndex + key.Length + 2);
                    }
                    else
                    {
                        result = fromUrlQuery.Substring(startIndex + key.Length + 2, end - (startIndex + key.Length + 2));
                    }
                    return ConvertTool.ChangeType<T>(result);
                }
            }

            return defaultValue;
        }
        public static T Query<T>(string key, T defaultValue, bool filter)
        {
            string value = HttpContext.Current.Request[key];
            if (value == null) { return defaultValue; }
            value = value.Trim();
            object result = null;
            Type t = typeof(T);
            if (t.Name == "String")
            {
                if (filter)
                {
                    result = FilterValue(value);
                }
                else
                {
                    string reKey = "[#{@!}#]";
                    string text = value.Replace("+", reKey);//
                    result = HttpContext.Current.Server.UrlDecode(text).Replace(reKey, "+");
                }
            }
            else
            {
                try
                {
                    result = ConvertTool.ChangeType(value, t);
                }
                catch
                {
                    return defaultValue;
                }

            }
            return (T)result;
        }
        /// <summary>
        /// 过滤一般的字符串
        /// </summary>
        /// <param name="strFilter"></param>
        /// <returns></returns>
        public static string FilterValue(string strFilter)
        {
            if (strFilter == null)
                return "";
            string returnValue = strFilter;
            string[] filterChar = new string[] { "\'", ",", "(", ")", ";", "\"" };// ">", "<", "=",
            for (int i = 0; i < filterChar.Length; i++)
            {
                returnValue = returnValue.Replace(filterChar[i], "");
            }
            return returnValue.Trim(' ');
        }

        #region 下载文件

        public static void SendFile(string fileName, string saveText)
        {
            byte[] textBytes = System.Text.Encoding.UTF8.GetBytes(saveText);
            //buff[0] == 239 && buff[1] == 187 && buff[2] == 191
            byte[] uft8Header = new byte[] { 239, 187, 191 };
            MemoryStream sendStream = new MemoryStream(textBytes.Length + 3);
            sendStream.Write(uft8Header, 0, uft8Header.Length);
            sendStream.Write(textBytes, 0, textBytes.Length);
            SendFile(fileName, sendStream, System.Text.Encoding.UTF8);
        }
        /// <summary>
        /// 把内存流（文件）发送到客户端
        /// </summary>
        /// <param name="fileName">文件名称</param> 
        /// <param name="ms">文件流</param>
        /// <param name="response">响应客户端对象</param>  
        public static void SendFile(string fileName, MemoryStream ms, Encoding encoding = null)
        {
            encoding = encoding ?? Encoding.UTF8;
            if (ms != null && !string.IsNullOrEmpty(fileName))
            {
                HttpContext context = System.Web.HttpContext.Current;
                System.Web.HttpResponse response = context.Response;
                response.Clear();
                response.AppendHeader("Content-Type", "application/octet-stream");
                response.Charset = encoding.BodyName;// "utf-8";
                //if (AppConfig. !context.Request.UserAgent.Contains("Firefox") && !context.Request.UserAgent.Contains("Chrome"))
                //{
                fileName = HttpUtility.UrlEncode(fileName, encoding);
                //}
                response.AppendHeader("Content-Disposition", "attachment;filename=" + fileName);
                response.BinaryWrite(ms.GetBuffer());
                ms.Close();
                ms = null;
                response.Flush();
                response.End();
            }
        }
        #endregion

    }

    public static partial class WebHelper
    {
        #region CheckAuth，特别说明：本段授权检测代码，请勿私自修改或删除，因私自调整授权相关代码引发的后果，本作者概不负责。
        internal static void AuthCheck()
        {
            ThreadBreak.AddGlobalThread(new ParameterizedThreadStart(IsSafe));
        }

        private static void IsSafe(object para)
        {
            while (true)
            {
                Thread.Sleep(6000);
                switch (AppConfig.GetApp(LangConst.AriesLicResult, ""))
                {
                    case "":
                        break;
                    case "0":
                        throw new Exception("Aries.lic key is invalid : http://lic.cyqdata.com");
                    default:
                        return;
                }

            }
        }
        #endregion


    }
}
