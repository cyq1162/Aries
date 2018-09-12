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

namespace Aries.Core.Helper
{
    public static partial class WebHelper
    {

        #region 安全Key检测
        public static bool IsKeyInHtml(string objName)
        {
            string path = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.UrlReferrer.LocalPath).ToLower();
            bool result = IsObjInHtml(objName, path);
            if (!result && path.EndsWith("edit.html"))
            {
                result = IsObjInHtml(objName, path.Replace("edit.html", "list.html"));
            }
            return result;
        }
        private static bool IsObjInHtml(string objName, string path)
        {
            CacheManage cache = CacheManage.LocalInstance;
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
                if (html.Contains("\"" + objName + "\"") || html.Contains("'" + objName + "'"))
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
                    result = ChangeType(value, t);
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
        private static object ChangeType(object value, Type t)
        {
            if (t == null)
            {
                return null;
            }
            string strValue = Convert.ToString(value);
            if (t.IsGenericType && t.Name.StartsWith("Nullable"))
            {
                t = Nullable.GetUnderlyingType(t);
                if (strValue == "")
                {
                    return null;
                }
            }
            if (t.Name == "String")
            {
                return strValue;
            }
            if (strValue == "")
            {
                return Activator.CreateInstance(t);
            }
            else if (t.IsValueType)
            {
                if (t.Name == "Guid")
                {
                    return new Guid(strValue);
                }
                return Convert.ChangeType(strValue, t);
            }
            else
            {
                return Convert.ChangeType(value, t);
            }
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
}
