using System;
using System.IO;
using System.Text;
using System.Web;
using Web.Core;
using CYQ.Data;

namespace Web.UI
{
    public class Global : System.Web.HttpApplication
    {
        void Application_BeginRequest(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Url.LocalPath.EndsWith(".aspx"))
            {
                //如果项目需要部署成子应用程序，则开启，否则不需要开启（可注释掉下面一行代码）
                HttpContext.Current.Response.Filter = new HttpResponseFilter(HttpContext.Current.Response.Filter);
            }
        }
        void Application_Error(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Url.LocalPath.EndsWith(".aspx") || HttpContext.Current.Request.Url.LocalPath.EndsWith(".ashx"))
            {
                CYQ.Data.Log.WriteLogToTxt(HttpContext.Current.Error);
            }
        }

    }

}
