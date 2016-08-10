using Aries.Core;
using Aries.Core.Auth;
using Aries.Core.DB;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Text;

namespace Aries.Controllers
{
    /// <summary>
    /// 默认请求地址
    /// </summary>
    public class DefaultController : Controller
    {
        protected override void BeforeInvoke()
        {
            switch (functionName.ToLower())
            {
                case "add":
                case "delete":
                case "update":
                    //清缓存
                    switch (ObjName)
                    {
                        case "Sys_Action":
                            SysMenu.ActionTable = null;
                            break;
                        case "Sys_Menu":
                            SysMenu.MenuTable = null;
                            break;
                    }
                    break;
            }
        }
        public void Login()
        {
            string outMsg;
            bool result = UserAuth.Login(Query<string>("uid"), Query<string>("pwd"), out outMsg);
            jsonResult = JsonHelper.OutResult(result, outMsg);
        }
        public void ChangePassword()
        {
            bool result = UserAuth.ChangePassword(Query<string>("pwd"));
            jsonResult = JsonHelper.OutResult(result, result ? "修改成功" : "修改失败");
        }
        //public void GetUserInfo()
        //{
        //    jsonResult = UserAuth.User.ToJson();
        //}
        /// <summary>
        /// 用户首页呈现的菜单数据
        /// </summary>
        public void GetUserMenu()
        {
            MDataTable dt = p.UserMenu;
            if (IsUseUISite)//格式化菜单数据。
            {
                string ui = AppConfig.GetApp("UI").Trim('/');
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    MDataRow row = dt.Rows[i];
                    string url = row.Get<string>(Sys_Menu.MenuUrl).TrimStart('/');
                    if (url != "#" && !url.ToLower().StartsWith(ui.ToLower() + "/"))
                    {
                        row.Set(Sys_Menu.MenuUrl, "/" + ui + "/" + url);
                    }
                }
            }
            jsonResult = dt.ToJson();
        }
    }
}
