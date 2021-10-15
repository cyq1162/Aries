﻿using Aries.Core.Auth;
using Aries.Core.Config;
using Aries.Core.Extend;
using Aries.Core.Helper;
using Aries.Core.Sql;
using CYQ.Data;
using CYQ.Data.Cache;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Web;
using System.Web.Configuration;

namespace Aries.Core
{
    /// <summary>
    /// 权限检测模块
    /// </summary>
    public class UrlRewrite : IHttpModule
    {
        public void Dispose()
        {

        }
        static bool isFirstLoad = true, isFirstAuthCheck = true;
        bool isStaticFile = false, isAjax = false;
        bool IsStaticFile()
        {
            isStaticFile = false;
            string contentType = "";
            switch (context.Request.CurrentExecutionFilePathExtension)
            {
                case ".js":
                    contentType = "text/javascript";
                    break;
                case ".css":
                    contentType = "text/css";
                    break;
                case ".gif":
                    contentType = "image/gif";
                    break;
                case ".jpg":
                    contentType = "image/jpg";
                    break;
                case ".jpeg":
                    contentType = "image/jpeg";
                    break;
                case ".bmp":
                    contentType = "image/bmp";
                    break;
                case ".png":
                    contentType = "image/png";
                    break;
            }
            if (!string.IsNullOrEmpty(contentType))
            {
                isStaticFile = true;
                string etag = Assembly.GetExecutingAssembly().GetName().Version.ToString() + 6;
                if (context.Request.Headers["If-None-Match"] == etag)
                {
                    context.Response.StatusCode = 304;
                }
                else
                {
                    context.Response.ContentType = contentType;
                    //context.Response.Cache.SetCacheability(HttpCacheability.Public);//对所有用户都同样进行缓存。
                    //context.Response.Cache.SetExpires(DateTime.Now.AddDays(1));
                    //context.Response.AppendHeader("Cache-Control", "public");
                    //context.Response.AppendHeader("Date", DateTime.Now.ToString());
                    //context.Response.AppendHeader("Expires", DateTime.Now.AddDays(1).ToString());
                    context.Response.AppendHeader("ETag", etag);
                    context.Response.AppendHeader("Last-Modified", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                    //if (!AppConfig.IsAspNetCore)
                    //{
                    context.Response.WriteFile(context.Server.MapPath(context.Request.Url.LocalPath));
                    // }
                }
                context.Response.End();
                return true;
            }

            return false;
        }
        public void Init(HttpApplication context)
        {
            if (isFirstLoad)
            {
#if DEBUG
                AppConfig.Cache.IsAutoCache = false;
#endif
                string lic = AppConfig.GetApp(LangConst.AriesLic);
                if (string.IsNullOrEmpty(lic) || !lic.EndsWith("=2"))
                {
                    throw new Exception("Aries Authorization Fail : http://lic.cyqdata.com");
                }
                isFirstLoad = false;
            }

            context.BeginRequest += new EventHandler(context_BeginRequest);
            //支持Session （VS2013 以上的 IISExpress 浏览器默认会检测文件存在，因此需要做点小事情做兼容）
            context.PostMapRequestHandler += new EventHandler(context_PostMapRequestHandler);
            context.AcquireRequestState += new EventHandler(context_AcquireRequestState);

            context.Error += context_Error;

        }

        void context_PostMapRequestHandler(object sender, EventArgs e)
        {
            if (isAjax)
            {
                context.Handler = SessionHandler.Instance;//注册Session
            }
        }
        HttpContext context;
        static int integralFlag = -1;//集成模式
        void context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication app = (HttpApplication)sender;
            context = app.Context;
            if (IsStaticFile())
            {
                return;
            }
            if (context.Request.Url.LocalPath == "/")//设置默认首页
            {
                string defaultUrl = WebHelper.GetDefaultUrl();
                if (!string.IsNullOrEmpty(defaultUrl))
                {
                    context.RewritePath(defaultUrl);
                }
            }
            else if(!AppConfig.IsAspNetCore)
            {
                string uriPath = Path.GetFileNameWithoutExtension(context.Request.Url.LocalPath).ToLower();
                isAjax = uriPath == "ajax";

                //VS2013（以上）IISExpress 默认会检测文件存在，导致后续事件无法触发，因此需要做点小事情做兼容）
                //正常IIS部署，是不需要以前兼容性代码的，（该代码将路径重写到一个已存在的文件，同时在目录下新建了一个ajax.html文件）
                //简单的地说：以上这段代码，和根目录下的ajax.html文件，是为了兼容VS IISExpress的bug存在的（微软造的孽）。
                //#if DEBUG
                if (integralFlag == -1)
                {
                    integralFlag = 1;
                    object ab = ConfigurationManager.GetSection("system.web/httpModules");
                    if (ab != null)
                    {
                        foreach (HttpModuleAction item in ((HttpModulesSection)ab).Modules)
                        {
                            if (item.Name == "Aries.Core") { integralFlag = 0; break; }
                        }
                    }
                }
                //VS2012 或以下，可以注释掉以下这段代码。
                //string iisName=context.Request.ServerVariables["SERVER_SOFTWARE"];
                //if (!string.IsNullOrEmpty(iisName) && iisName.StartsWith("Microsoft-IIS/1"))
                //{
                //VS2015和VS 2017 Microsoft-IIS/10.0
                if (integralFlag == 1 && WebHelper.IsAriesSuffix())
                {

                    if (isAjax)
                    {
                        string localPath = context.Request.Url.PathAndQuery;
                        int i = localPath.LastIndexOf('/');
                        context.RewritePath(localPath.Substring(i));//只有重定向到一个存在的文件，兼容微软造的孽
                    }
                }
                // }
                //#endif
            }
        }

        void context_AcquireRequestState(object sender, EventArgs e)
        {

            if (isStaticFile)
            {
                return;
            }
            if (WebHelper.IsAriesSuffix())
            {
                string localPath = context.Request.Url.LocalPath;
                string uriPath = Path.GetFileNameWithoutExtension(localPath).ToLower();
                switch (uriPath)
                {
                    case "logout":
                        UserAuth.Logout();
                        break;
                    case "login":
                        LoginView();
                        ReplaceOutput();
                        break;
                    case "ajax":
                        InvokeClass();
                        break;
                    default://普通页面
                        AuthCheck(uriPath == "index");
                        ReplaceOutput();
                        break;
                }
            }
        }
        void context_Error(object sender, EventArgs e)
        {
            if (WebHelper.IsAriesSuffix())
            {
                Log.WriteLogToTxt(HttpContext.Current.Error);
            }
        }

        #region LoginView 页处理
        private void LoginView()
        {
            SetSafeKey();
            if (WebHelper.IsUseUISite)
            {
                HttpCookie cookie = context.Request.Cookies["aries_ui"];
                if (cookie == null)
                {
                    cookie = new HttpCookie("aries_ui", "/" + AppConfig.GetApp("UI").Trim('/'));
                    cookie.Domain = AppConfig.XHtml.Domain;
                    context.Response.Cookies.Add(cookie);
                }
            }
            //context.Response.Write(" ");//避免服务器不输出Cookie。,会引发：ERR_CONTENT_DECODING_FAILED异常。
            //cannot decode raw data (NSURLErrorDomain:-1015) 
        }
        #endregion

        #region AuthCheck 授权检测
        /// <summary>
        /// 默认仅对Web目录和首页index.html进行登陆权限检测。
        /// </summary>
        private void AuthCheck(bool isIndex)
        {
            SetNoCacheAndSafeKey();//.html不缓存，才能实时检测权限问题。（否则客户端缓存了，后台修改权限，客户端很为难）
            if (WebHelper.IsCheckToken())
            {
                UserAuth.IsExistsToken(true);//检测登陆状态。
                UserAuth.RefleshToken(); //刷新时间
                if (!isIndex)
                {
                    new Permission(UserAuth.UserName, true);//是否有访问该页面的权限。（100-500ms）【第一次500ms左右】，【第二次数据已缓存，100ms左右】（再优化就是缓存用户与菜单，可以减少到接近0，但无法保证实时性）
                }
            }
            if (isFirstAuthCheck)
            {
                isFirstAuthCheck = false;
                WebHelper.AuthCheck();
            }
        }

        private void SetNoCacheAndSafeKey()
        {
            //context.Response.Expires = 0;
            //context.Response.Buffer = true;
            //context.Response.ExpiresAbsolute = DateTime.Now.AddYears(-1);
            context.Response.CacheControl = "no-cache";
            SetSafeKey();
        }
        private void SetSafeKey()
        {
            HttpCookie cookie = context.Request.Cookies["aries_safekey"];
            if (cookie == null)
            {
                cookie = new HttpCookie("aries_safekey");
            }
            cookie.HttpOnly = true;
            cookie.Domain = AppConfig.XHtml.Domain;
            cookie.Value = EncryptHelper.Encrypt("aries:" + DateTime.Now.ToString("HHmmss"));
            cookie.Expires = DateTime.Now.AddHours(23);
            context.Response.Cookies.Add(cookie);
        }
        private bool IsExistsSafeKey()
        {
            HttpCookie cookie = context.Request.Cookies["aries_safekey"];
            if (cookie != null)
            {
                string value = EncryptHelper.Decrypt(cookie.Value);
                if (value.StartsWith("aries:"))
                {
                    return true;
                }
            }
            return false;
        }
        #endregion

        #region ReplaceOutput 替换输出，仅对子目录部署时有效
        void ReplaceOutput()
        {
            //如果项目需要部署成子应用程序，则开启，否则不需要开启（可注释掉下面一行代码）
            //要处理自定义语言标签
            if (WebHelper.IsAriesSuffix())
            {
                if (AppConfig.IsAspNetCore)
                {
                    string path = AppConfig.WebRootPath + HttpContext.Current.Request.Url.LocalPath;
                    if (File.Exists(path))
                    {
                        byte[] data = File.ReadAllBytes(path);
                        if (data != null && data.Length > 0)
                        {
                            byte[] newData = ReplaceText.Replace(data, 0, data.Length);
                            context.Response.ContentType = "text/html";
                            context.Response.BinaryWrite(newData);
                        }

                    }
                }
                else
                {
                    context.Response.Filter = new HttpResponseFilter(context.Response.Filter);
                }
            }
        }
        #endregion

        #region InvokeClass 逻辑反射调用Controlls的方法
        private void InvokeClass()
        {
            Type t = null;
            #region 处理Ajax请求
            //从Url来源页找
            if (context.Request.UrlReferrer == null)
            {
                WriteError("Illegal request!");
                return;
            }
            else if (!IsExistsSafeKey() && WebHelper.IsCheckToken())// 仅检测需要登陆的页面
            {
                string path = context.Request.UrlReferrer.PathAndQuery;
                if (path == "/") { path = "/index.html"; }
                WriteError(path);//"Page timeout,please reflesh page!"
                return;
            }
            //AjaxController是由页面的后两个路径决定了。
            string[] items = context.Request.UrlReferrer.LocalPath.TrimStart('/').Split('/');
            string className = Path.GetFileNameWithoutExtension(items[items.Length - 1].ToLower());
            //从来源页获取className 可能是/aaa/bbb.shtml 先找aaa.bbb看看有木有，如果没有再找bbb
            if (items.Length > 1)
            {
                t = InvokeLogic.GetType(items[items.Length - 2].ToLower() + "." + className);
            }
            if (t == null)
            {
                t = InvokeLogic.GetDefaultType();
                if (t == null)
                {
                    WriteError("You need to create a controller for coding !");
                    return;
                }
            }
            #endregion

            try
            {
                object o = Activator.CreateInstance(t);//实例化
                t.GetMethod("ProcessRequest").Invoke(o, new object[] { context });
            }
            catch (ThreadAbortException e)
            {
                //ASP.NET 的机制就是通过异常退出线程（不要觉的奇怪）
            }
            catch (Exception err)
            {
                WriteError(err.Message);
            }

        }
        private void WriteError(string tip)
        {
            context.Response.Write(JsonHelper.OutResult(false, tip));
            context.Response.End();
        }
        #endregion
    }
}
