using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Net;
using System.Data;
using CYQ.Data;

namespace Aries.Core.Helper
{
    internal static class WebHelper
    {
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
        public static T Query<T>(string key)
        {
            return Query<T>(key, default(T), false);
        }
        public static T Query<T>(string key, T defaultValue, bool filter)
        {
            if (HttpContext.Current.Request[key] == null) { return defaultValue; }
            object result;
            if (typeof(T).Name == "Int32")
            {
                int _result = 0;
                if (!int.TryParse(HttpContext.Current.Request[key], out _result))
                {
                    return defaultValue;
                }
                result = _result;
            }
            else
            {
                if (filter)
                {
                    result = FilterValue(HttpContext.Current.Request[key]);
                }
                else
                {
                    string reKey = "[#{@!}#]";
                    string text = HttpContext.Current.Request[key].Trim().Replace("+", reKey);//
                    result = HttpContext.Current.Server.UrlDecode(text).Replace(reKey, "+");
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
