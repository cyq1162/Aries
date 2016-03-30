using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Core;

namespace Web.UI.Ajax
{
    /// <summary>
    /// 本类保持空即可，提供最基础的增删改查方法（TY.Core.js发起的请求都指向此处理程序）。
    /// (注)本Handler由框架提供，非框架组人员不得修改。
    /// 如需要重写，把原有页面指向到其它Handler去处理。
    /// </summary>
    public class AjaxHandler : AjaxBase
    {
        protected override void BeforeInvoke(TableNames t, MethodEnum m)
        {
            switch (m)
            {
                case MethodEnum.Add:
                case MethodEnum.Delete:
                case MethodEnum.Update:
                    //清缓存
                    switch (t)
                    {
                        case TableNames.Sys_Action:
                           SysMenu.ActionTable = null;
                            break;
                        case TableNames.Sys_Menu:
                            SysMenu.MenuTable = null;
                            break;
                    }
                    break;
            }
        }
    }

}