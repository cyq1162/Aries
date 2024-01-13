using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CYQ.Data;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;

namespace Web.UI_NetCore
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddAries();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseAries();
            //做为注册中心服务时，静态文件功能应该放后面。
            app.UseStaticFiles(new StaticFileOptions
            {
                //如果使用dotnet /home/regcenter/Taurus.View.dll 模式，根目录会在命令所在的环境，所以需要切换环境。
                FileProvider = new PhysicalFileProvider(AppConfig.WebRootPath)
            });
        }
    }
}
