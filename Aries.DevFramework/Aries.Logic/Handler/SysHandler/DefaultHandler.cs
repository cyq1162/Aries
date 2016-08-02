using Aries.Core;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Text;

namespace Aries.Handler
{
    /// <summary>
    /// 默认请求地址
    /// </summary>
    public class DefaultHandler : AjaxBase
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
        public void GetUserMenu()
        {
            jsonResult = p.UserMenu.ToJson();
        }
    }
}
