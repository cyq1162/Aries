using CYQ.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Threading.Tasks;
using Aries.Core;

namespace Microsoft.AspNetCore.Http
{
    /// <summary>
    /// 为支持Asp.net core 存在的文件
    /// </summary>
    public class AriesMiddleware
    {
        private readonly RequestDelegate next;

        public AriesMiddleware(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                if (context.Request.Path.Value.IndexOf("/App_Data/", StringComparison.OrdinalIgnoreCase) > -1)//兼容受保护的目录
                {
                    context.Response.StatusCode = 403;
                    await context.Response.WriteAsync("403 Forbidden");
                }
                else
                {
                    System.Web.HttpApplication.Instance.ExecuteEventHandler();
                    if (context.Response.StatusCode.ToString().StartsWith("30"))
                    {
                        // await context.Response.WriteAsync("");
                    }
                    else if (System.Web.HttpContext.Current.Response.HasStarted)  // || Body是只写流  (context.Response.Body != null && context.Response.Body.CanRead
                    {
                        await context.Response.WriteAsync("");
                    }
                    //处理信息
                    else
                    {
                        await next(context);
                    }
                }
            }
            catch (Exception ex)
            {
                Log.WriteLogToTxt(ex);
            }
        }
    }
    public static class AriesExtensions
    {
        /// <summary>
        /// Net Core 3.1 把IHostingEnvironment 拆分成了：IWebHostEnvironment和IHostEnvironment 
        /// 所以增加重载方法适应。
        /// </summary>
        /// <param name="builder"></param>
        /// <param name="env"></param>
        /// <returns></returns>
        public static IApplicationBuilder UseAries(this IApplicationBuilder builder, object env)
        {
            if (env is IHostingEnvironment)
            {
                return UseAries(builder, env as IHostingEnvironment);
            }
            throw new Exception("env must be IWebHostEnvironment or IHostingEnvironment or String");
        }
        public static IApplicationBuilder UseAries(this IApplicationBuilder builder, IHostingEnvironment env)
        {
            //Net6新建的项目，WebRootPath竟然是空。
            return UseAries(builder, env.WebRootPath ?? env.ContentRootPath.TrimEnd('/', '\\') + "/wwwroot");
        }
        public static IApplicationBuilder UseAries(this IApplicationBuilder builder, string webRootPath)
        {
            // builder.

            AppConfig.WebRootPath = webRootPath;//设置根目录地址，ASPNETCore的根目录和其它应用不一样。
            //执行一次，用于注册事件
            UrlRewrite url = new UrlRewrite();
            url.Init(System.Web.HttpApplication.Instance);
            return builder.UseMiddleware<AriesMiddleware>();
        }
    }
}
