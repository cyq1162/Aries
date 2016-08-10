using Aries.Core.Auth;
using Aries.Core.Extend;
using Aries.Core.Helper;
using CYQ.Data;
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
        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
            context.Error += context_Error;
        }

        void context_Error(object sender, EventArgs e)
        {
            if (IsEndWithPage(HttpContext.Current.Request.Url))
            {
                Log.WriteLogToTxt(HttpContext.Current.Error);
            }
        }

        HttpContext context;
        void context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication app = (HttpApplication)sender;
            context = app.Context;
            AuthCheck();
            ReplaceOutput();
            InvokeClass();
        }

        #region 授权检测
        /// <summary>
        /// 默认仅对Web目录和首页index.html进行登陆权限检测。
        /// </summary>
        private void AuthCheck()
        {
            Uri uri = context.Request.Url;
            if (uri.LocalPath.EndsWith("/logout.html"))
            {
                UserAuth.Logout();
            }
            else if (uri.LocalPath.EndsWith("/login.html") && WebHelper.IsUseUISite)
            {
                HttpCookie cookie = context.Request.Cookies["sys_ui"];
                if (cookie == null)
                {
                    cookie = new HttpCookie("sys_ui", "/" + AppConfig.GetApp("UI").Trim('/'));
                    //cookie.Expires = DateTime.Now.AddSeconds(20);
                    context.Response.Cookies.Add(cookie);
                }
            }
            else
            {
                SetNoCache();
                if (IsCheckToken(uri))
                {
                    UserAuth.IsExistsToken(true);//检测登陆状态。
                    new Permission(UserAuth.UserName, true);//初始化权限检测。
                }

            }
        }
        private bool IsCheckToken(Uri uri)
        {
            string[] items = AppConfig.GetApp("CheckTokenPath", "/web/,/index.html").Split(',');//可以扩展多个
            string localPath = uri.LocalPath.ToLower();
            foreach (string item in items)
            {
                if (localPath.Contains(item))
                {
                    return true;
                }
            }
            return false;
        }
        private void SetNoCache()
        {
            if (!context.Request.Url.LocalPath.EndsWith("/ajax.html") && IsEndWithPage(context.Request.Url))
            {
                context.Response.Expires = 0;
                context.Response.Buffer = true;
                context.Response.ExpiresAbsolute = DateTime.Now.AddYears(-1);
                context.Response.CacheControl = "no-cache";
            }
        }
        #endregion

        #region 替换输出，仅对子目录部署时有效
        void ReplaceOutput()
        {
            if (WebHelper.IsUseUISite)
            {
                if (context.Request.Url.LocalPath.IndexOf('.') == -1 || IsEndWithPage(context.Request.Url, false))
                {
                    //如果项目需要部署成子应用程序，则开启，否则不需要开启（可注释掉下面一行代码）
                    context.Response.Filter = new HttpResponseFilter(context.Response.Filter);
                }
            }
        }
        #endregion

        #region 逻辑反射调用Controlls的方法
        private void InvokeClass()
        {
            string localPath = context.Request.Url.LocalPath;
            Type t = null;
            bool needInvoke = false;
            if (localPath.EndsWith("/ajax.html")) // 反射Url启动
            {
                #region 处理Ajax请求
                //从Url来源页找
                if (context.Request.UrlReferrer == null)
                {
                    WriteError("Illegal request!");
                }
                //AjaxController是由页面的后两个路径决定了。
                string[] items = context.Request.UrlReferrer.LocalPath.Split('/');
                string className = Path.GetFileNameWithoutExtension(items[items.Length - 1].ToLower());
                //从来源页获取className 可能是/aaa/bbb.shtml 先找aaa.bbb看看有木有，如果没有再找bbb
                if (items.Length > 1)
                {
                    t = InvokeLogic.GetType(items[items.Length - 2].ToLower() + "." + className, 0);
                }
                else
                {
                    t = InvokeLogic.GetDefaultType(0);
                }
                needInvoke = true;
                #endregion
            }
            else if (localPath.IndexOf(".") == -1) // 处理Mvc请求
            {
                needInvoke = true;
                string[] items = localPath.Trim('/').Split('/');
                string className = items[0];
                if (RouteConfig.RouteMode == 2)
                {
                    className = items.Length > 1 ? items[1] : "";
                }
                t = InvokeLogic.GetType(className, 1);
            }
            if (needInvoke)
            {
                if (t == null)
                {
                    WriteError("Can't find the controller!");
                }
                try
                {
                    object o = Activator.CreateInstance(t);//实例化
                    t.GetMethod("ProcessRequest").Invoke(o, new object[] { context });
                }
                catch (ThreadAbortException e)
                {
                }
                catch (Exception err)
                {
                    WriteError(err.Message);
                }
            }
        }
        private void WriteError(string tip)
        {
            context.Response.Write(tip);
            context.Response.End();
        }
        #endregion

        #region 共用类
        private bool IsEndWithPage(Uri uri, bool ashx = true)
        {
            string localPath = uri.LocalPath.ToLower();
            return localPath.EndsWith(".html") || localPath.EndsWith(".aspx") || (ashx && localPath.EndsWith(".ashx"));
        }
        #endregion

    }
}
