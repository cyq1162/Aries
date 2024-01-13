using CYQ.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using System;
using System.Threading.Tasks;
using Aries.Core;
using Microsoft.Extensions.DependencyInjection;

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
                // 遍历 HttpContext.Features
                //foreach (var feature in context.Features)
                //{
                //    // 输出特性类型和实例信息
                //    Console.WriteLine($"Feature type: {feature.Key}, instance: {feature.Value}");
                //}

                if (!context.Request.Host.HasValue)
                {
                    context.Response.StatusCode = 400;
                    await context.Response.WriteAsync("400 Invalid hostname.");
                    return;
                }
                if (context.Request.Path.Value.IndexOf("/App_Data/", StringComparison.OrdinalIgnoreCase) > -1)//兼容受保护的目录
                {
                    context.Response.StatusCode = 403;
                    await context.Response.WriteAsync("403 Forbidden");
                    return;
                }

                if ((context.Request.Method == "POST" || context.Request.Method == "PUT") && context.Request.ContentLength.HasValue && context.Request.ContentLength.Value > 0)
                {
                    // 使用处：对应Rpc.Gateway.cs 代码：Proxy 方法 149行上下。
                    //Controller.cs GetJson 方法 1098行上下
                    context.Request.EnableBuffering();
                }
                System.Web.HttpApplication.GetInstance("Aries").ExecuteEventHandler();
                if (System.Web.HttpContext.Current.Response.HasStarted)  // || Body是只写流  (context.Response.Body != null && context.Response.Body.CanRead
                {
                    if (context.Response.StatusCode == 204 || context.Response.StatusCode.ToString().StartsWith("30"))
                    {
                        await context.Response.Body.FlushAsync();
                    }
                    else
                    {
                        await context.Response.WriteAsync("");
                    }
                }
                //处理信息
                else
                {
                    await next(context);
                }

            }
            catch (Exception ex)
            {
                CYQ.Data.Log.WriteLogToTxt(ex, LogType.Taurus);
            }
        }
    }
    public static class AriesExtensions
    {
        public static void AddAries(this IServiceCollection services)
        {
            services.AddHttpContext();
        }


        public static IApplicationBuilder UseAries(this IApplicationBuilder builder)
        {
            builder.UseHttpContext();
            //执行一次，用于注册事件
            UrlRewrite url = new UrlRewrite();
            url.Init(System.Web.HttpApplication.GetInstance("Aries"));
            return builder.UseMiddleware<AriesMiddleware>();
        }
    }
}
