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
    internal static partial class WebHelper
    {

        #region 安全Key检测
        public static bool IsKeyInHtml(string objName)
        {
            CacheManage cache = CacheManage.LocalInstance;

            string path = HttpContext.Current.Server.MapPath(HttpContext.Current.Request.UrlReferrer.LocalPath);
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
            if(!IsNeedCheckToken(HttpContext.Current.Request.Url))
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
        internal static string ReplacePara(string sql, string key, string value)
        {
            if (!string.IsNullOrEmpty(sql) && !string.IsNullOrEmpty(key))
            {
                //格式化请求参数
                int index = sql.IndexOf(key);
                if (index > -1)
                {
                    if (string.IsNullOrEmpty(value) && sql.IndexOf('=', index - 5, 5) > -1)//处理成1=1，同时有=号
                    {
                        int end = index + key.Length + 1;//可能参数后面有'@parnet'
                        string temp = sql.Substring(0, index - 5);
                        int start = temp.LastIndexOf(' ');
                        sql = sql.Replace(sql.Substring(start + 1, end - start - 1), "1=1 ");
                    }
                    else
                    {
                        sql = sql.Replace(key, value);
                    }
                }
            }
            return sql;
        }
        #region 下载文件

        public static void SendFile(string fileName, string saveText)
        {
            byte[] bs2 = System.Text.Encoding.GetEncoding("GB2312").GetBytes(saveText);
            MemoryStream ms2 = new MemoryStream(bs2, 0, bs2.Length, true, true);
            SendFile(fileName, ms2, System.Text.Encoding.UTF8);
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
                System.Web.HttpResponse response = System.Web.HttpContext.Current.Response;
                response.Clear();
                response.AddHeader("Content-Type", "application/octet-stream");
                response.Charset = encoding.BodyName;// "utf-8";
                if (!HttpContext.Current.Request.UserAgent.Contains("Firefox") && !HttpContext.Current.Request.UserAgent.Contains("Chrome"))
                {
                    fileName = HttpUtility.UrlEncode(fileName, encoding);
                }
                response.AddHeader("Content-Disposition", "attachment;filename=" + fileName);
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
