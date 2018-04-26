using Aries.Core.Auth;
using Aries.Core.Extend;
using Aries.Core.Helper;
using CYQ.Data;
using CYQ.Data.Cache;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading;
using System.Web;

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
        static bool isFirstLoad = true;
        bool isAjax = false;
        public void Init(HttpApplication context)
        {
            if (!isFirstLoad)
            {
                isFirstLoad = false;
                CrossDb.PreLoadAllDBSchemeToCache();


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
        void context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication app = (HttpApplication)sender;
            context = app.Context;
            if (context.Request.Url.LocalPath == "/")//设置默认首页
            {
                string defaultUrl = WebHelper.GetDefaultUrl();
                if (!string.IsNullOrEmpty(defaultUrl))
                {
                    context.RewritePath(defaultUrl, false);
                }
            }
            else
            {
                //VS2013（以上）IISExpress 默认会检测文件存在，导致后续事件无法触发，因此需要做点小事情做兼容）
                //正常IIS部署，是不需要以前兼容性代码的，（该代码将路径重写到一个已存在的文件，同时在目录下新建了一个ajax.html文件）
                //简单的地说：以上这段代码，和根目录下的ajax.html文件，是为了兼容VS IISExpress的bug存在的（微软造的孽）。
                if (WebHelper.IsAriesSuffix())
                {
                    string localPath = context.Request.Url.LocalPath;
                    string uriPath = Path.GetFileNameWithoutExtension(localPath).ToLower();
                    isAjax = uriPath == "ajax";
                    if (isAjax)
                    {
                        int i = localPath.LastIndexOf('/');
                        context.RewritePath(localPath.Substring(i), false);//只有重定向到一个存在的文件，兼容微软造的孽
                    }
                }
            }
        }

        void context_AcquireRequestState(object sender, EventArgs e)
        {
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
                HttpCookie cookie = context.Request.Cookies["sys_ui"];
                if (cookie == null)
                {
                    cookie = new HttpCookie("sys_ui", "/" + AppConfig.GetApp("UI").Trim('/'));
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
        }

        private void SetNoCacheAndSafeKey()
        {
            context.Response.Expires = 0;
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddYears(-1);
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
            cookie.Value = EncrpytHelper.Encrypt("aries:" + DateTime.Now.ToString("HHmmss"));
            cookie.Expires = DateTime.Now.AddHours(23);
            context.Response.Cookies.Add(cookie);
        }
        private bool IsExistsSafeKey()
        {
            HttpCookie cookie = context.Request.Cookies["aries_safekey"];
            if (cookie != null)
            {
                string value = EncrpytHelper.Decrypt(cookie.Value);
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
            if (WebHelper.IsUseUISite)
            {
                //如果项目需要部署成子应用程序，则开启，否则不需要开启（可注释掉下面一行代码）
                context.Response.Filter = new HttpResponseFilter(context.Response.Filter);
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
            }
            else if (!IsExistsSafeKey() && WebHelper.IsCheckToken())// 仅检测需要登陆的页面
            {
                string path = context.Request.UrlReferrer.PathAndQuery;
                if (path == "/") { path = "/index.html"; }
                WriteError(path);//"Page timeout,please reflesh page!"
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
