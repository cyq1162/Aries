using System;
using Web.Core;

namespace Web.UI
{
    public partial class Index : PageBase//System.Web.UI.Page//
    {
        protected string MenuData { get; set; }
        
        protected string UserName { get; set; }

        protected string FullName { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            MenuData = p.UserMenu.ToJson();
            UserName = UserAuth.UserName;
            FullName = UserAuth.FullName;
        }
    }
}