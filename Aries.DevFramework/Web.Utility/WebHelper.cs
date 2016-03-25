using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.IO;
using System.Web.UI;
using System.Net;
using System.Data;

namespace Web.Utility
{
    /// <summary>
    /// pjy
    /// 2013-03-17
    /// Web层的帮助类
    /// </summary>
    public static class WebHelper
    {
        public static void ResponceImage(FileStream fs)
        {
            using (System.Drawing.Image img = System.Drawing.Image.FromStream(fs))
            {
                using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
                {
                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                    HttpContext.Current.Response.ClearContent();
                    HttpContext.Current.Response.BinaryWrite(ms.ToArray());
                    HttpContext.Current.Response.ContentType = "image/jpeg";//指定输出格式为图形
                }
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
        /// <summary>
        /// 参数数组，如果有一个为空或者null则返回true，都不为空则返回false
        /// </summary>
        /// <param name="strArr"></param>
        /// <returns></returns>
        public static bool IsEmpty(params string[] strArr)
        {
            foreach (string s in strArr)
            {
                if (string.IsNullOrWhiteSpace(s))
                    return true;
            }
            return false;
        }

        #region 下载文件
        public static void SendImage(FileStream fs)
        {
            using (System.Drawing.Image img = System.Drawing.Image.FromStream(fs))
            {
                using (System.IO.MemoryStream ms = new System.IO.MemoryStream())
                {
                    img.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                    HttpContext.Current.Response.ClearContent();
                    HttpContext.Current.Response.BinaryWrite(ms.ToArray());
                    HttpContext.Current.Response.ContentType = "image/jpeg";//指定输出格式为图形
                }
            }
        }
        public static void SendFile(string fileName, string saveText)
        {
            byte[] bs2 = System.Text.Encoding.GetEncoding("GB2312").GetBytes(saveText);
            MemoryStream ms2 = new MemoryStream(bs2, 0, bs2.Length, true, true);
            SendFile(fileName, ms2, System.Text.Encoding.UTF8);
        }
        /// <summary>
        /// pjy 
        /// 2013-05-07 
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

        #region 模拟提交
        /// <summary>
        /// 模拟httppost请求
        /// </summary>
        /// <param name="url"></param>
        /// <param name="postDataStr"></param>
        /// <param name="cookie"></param>
        ///  <param name="requestCoding">默认为gb2312</param>
        ///   <param name="getCoding">默认为gb2312</param>
        /// <returns></returns>
        public static string HttpPost(string url, string postDataStr, CookieContainer cookie, Encoding requestCoding = null, Encoding getCoding = null)
        {
            if (requestCoding == null)
                requestCoding = Encoding.GetEncoding("gb2312");
            if (getCoding == null)
                getCoding = Encoding.UTF8;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            if (requestCoding == Encoding.UTF8)
                request.ContentType = "application/x-www-form-urlencoded;";
            else
                request.ContentType = "application/x-www-form-urlencoded;charset=gb2312";
            //request.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; .NET CLR 1.1.4322)";
            byte[] bs = requestCoding.GetBytes(postDataStr);
            request.ContentLength = bs.Length;
            request.CookieContainer = cookie;
            using (Stream myRequestStream = request.GetRequestStream())
            {
                //using (StreamWriter myStreamWriter = new StreamWriter(myRequestStream, Encoding.GetEncoding("gb2312")))
                //{
                //myStreamWriter.Write(postDataStr);

                myRequestStream.Write(bs, 0, bs.Length);

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                if (cookie != null)
                {
                    response.Cookies = cookie.GetCookies(response.ResponseUri);
                }
                using (Stream myResponseStream = response.GetResponseStream())
                {
                    using (StreamReader myStreamReader = new StreamReader(myResponseStream, getCoding))
                    {
                        string retString = myStreamReader.ReadToEnd();
                        return retString;
                    }
                }
                // }
            }
        }

        /// <summary>
        /// 模拟get请求
        /// </summary>
        /// <param name="url"></param>
        /// <param name="postDataStr"></param>
        /// <returns></returns>
        public static string HttpGet(string url, string postDataStr, Encoding getEncoding = null)
        {
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url + (postDataStr == "" ? "" : "?") + postDataStr);
            request.Method = "GET";
            if (getEncoding == null)
                getEncoding = Encoding.GetEncoding("gb2312");
            request.ContentType = "text/html;charset=UTF-8";

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            using (Stream myResponseStream = response.GetResponseStream())
            {
                using (StreamReader myStreamReader = new StreamReader(myResponseStream, getEncoding))
                {
                    string retString = myStreamReader.ReadToEnd();
                    return retString;
                }
            }
        }

        #endregion

    }
}
