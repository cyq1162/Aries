using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;
using CYQ.Data;

namespace Web.UI
{
    public partial class WebMaster : System.Web.UI.MasterPage
    {
        /// <summary>
        /// 当前页面的权限（字符串Keys集合）。
        /// </summary>
        public string actionKeys;
        public string menuID;
        /// <summary>
        /// UI前缀（当程序部署为子应用程序时使用）
        /// </summary>
        public string ui = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            // hidden.Visible = false;
            if (this.Page is PageBase)
            {
                PageBase pb = this.Page as PageBase;
                actionKeys = pb.p.GetFuncKeys();
                if (!string.IsNullOrEmpty(actionKeys))
                {
                    actionKeys = "," + actionKeys.ToLower();
                }
                menuID = pb.p.MenuID;
            }
            if (Request.Url.LocalPath.ToLower().StartsWith("/ui/"))
            {
                ui = AppConfig.GetApp("UI");
            }
        }
    }
}