﻿using Aries.Core;
using Aries.Core.Auth;
using Aries.Core.Config;
using Aries.Core.DB;
using CYQ.Data;
using CYQ.Data.Json;
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
    public partial class DefaultController : Controller
    {
       
        //protected override void BeforeInvoke(string methodName)
        //{
        //    //CYQ.Data 已具备自动缓存功能，所以可以简化掉一些手工的缓存机制。
        //    //switch (functionName.ToLower())
        //    //{
        //    //    case "add":
        //    //    case "delete":
        //    //    case "update":
        //    //        //清缓存
        //    //        switch (ObjName)
        //    //        {
        //    //            case "Sys_Action":
        //    //                SysMenu.ActionTable = null;
        //    //                break;
        //    //            case "Sys_Menu":
        //    //                SysMenu.MenuTable = null;
        //    //                break;
        //    //        }
        //    //        break;
        //    //}
        //}
        public void Login()
        {
            string outMsg;
            bool result = UserAuth.Login(Query<string>("uid"), Query<string>("pwd"), out outMsg);
            jsonResult = JsonHelper.OutResult(result, outMsg);
        }
        public void ChangePassword()
        {
            bool result = UserAuth.ChangePassword(Query<string>("pwd"));
            jsonResult = JsonHelper.OutResult(result, result ? LangConst.UpdateSuccess : LangConst.UpdateError);
        }
        public void GetUserInfo()
        {
            MDataRow row = UserAuth.User;
            row.Columns.Remove("Password");//移除密码。
            row.Columns.Remove("UserInfoID");//移除重复的主建值。
            jsonResult = row.ToJson(true);//转小写（兼容oracle）
        }
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
            jsonResult = dt.ToJson(false, false, RowOp.None, true);
        }
       
    }
}
