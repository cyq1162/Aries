using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace Web.Core
{
    /// <summary>
    /// 权限检测模块
    /// </summary>
    public class AuthModule : IHttpModule
    {
        public void Dispose()
        {
            
        }
        public void Init(HttpApplication context)
        {
            context.BeginRequest += new EventHandler(context_BeginRequest);
        }

        void context_BeginRequest(object sender, EventArgs e)
        {
            HttpApplication app = (HttpApplication)sender;
            AuthCheck(app.Context);
        }
        public void AuthCheck(HttpContext context)
        {
            if (context.Request.Url.LocalPath.Contains("/web/"))
            {
                UserAuth.IsExistsToken(true);//检测登陆状态。
                new Permission(UserAuth.LoginID, true);//初始化权限检测。
            }
        }
    }
}
