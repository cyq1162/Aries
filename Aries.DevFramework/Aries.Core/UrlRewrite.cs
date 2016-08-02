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
            string url = HttpContext.Current.Request.Url.LocalPath;
            if (url.EndsWith(".aspx") || url.EndsWith(".html") || url.EndsWith(".ashx"))
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
            FilterOutput();
            InvokeClass();
        }

        #region 授权检测

        private void AuthCheck()
        {
            Uri uri=context.Request.Url;
            if(uri.LocalPath.EndsWith("/logout.html"))
            {
                UserAuth.Logout();
            }
            else 
            {
                SetNoCache();
                if (IsContainUrl(uri))
                {
                    UserAuth.IsExistsToken(true);//检测登陆状态。
                    new Permission(UserAuth.UserName, true);//初始化权限检测。
                }
                
            }
        }
        private bool IsContainUrl(Uri uri)
        {
            string[] items = new[] { "/web/","/index.html" };//可以扩展多个
            string localPath=uri.LocalPath.ToLower();
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
            if (context.Request.Url.LocalPath.EndsWith(".html") && !context.Request.Url.LocalPath.EndsWith("/ajax.html"))
            {
                context.Response.Expires = 0;
                context.Response.Buffer = true;
                context.Response.ExpiresAbsolute = DateTime.Now.AddYears(-1);
                context.Response.CacheControl = "no-cache";
            }
        }
        #endregion

        #region 过滤输出
        void FilterOutput()
        {
            string ui = AppConfig.GetApp("UI", "").ToLower();
            string url = context.Request.Url.LocalPath.ToLower();
            if (ui!="" && url.StartsWith(ui) && (url.EndsWith(".aspx") || url.EndsWith(".html")))
            {
                //如果项目需要部署成子应用程序，则开启，否则不需要开启（可注释掉下面一行代码）
                context.Response.Filter = new HttpResponseFilter(context.Response.Filter);
            }
        }
        #endregion

        #region 逻辑反射
        private void InvokeClass()
        {
            if (context.Request.Url.LocalPath.EndsWith("/ajax.html")) // 反射Url启动
            {
                string className = CommonHelper.Query<string>("sys_classname");
                if (string.IsNullOrEmpty(className))//看是否存在
                {
                    //从Url来源页找
                    if (context.Request.UrlReferrer == null)
                    {
                        WriteError("非法请求!");
                    }
                    Type t = null;
                    string[] items = context.Request.UrlReferrer.LocalPath.Split('/');
                    className = Path.GetFileNameWithoutExtension(items[items.Length - 1].ToLower());
                    //从来源页获取className 可能是/aaa/bbb.shtml 先找aaa.bbb看看有木有，如果没有再找bbb
                    if (items.Length > 1)
                    {
                        t = InvokeLogic.GetType(items[items.Length - 2].ToLower() + "." + className);
                    }
                    if (t == null)
                    {
                        WriteError("找不到对应的请求逻辑!");
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
        }
        private void WriteError(string tip)
        {
            context.Response.Write(tip);
            context.Response.End();
        }
        #endregion

    }
}
