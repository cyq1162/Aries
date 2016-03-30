using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;
using CYQ.Data;
using CYQ.Data.Table;
namespace Web.UI.Web.SysAdmin
{
    public partial class RoleAction : PageBase
    {
        protected string RoleName;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (MAction action = new MAction(TableNames.Sys_Role))
                {
                    if(action.Fill(Query<string>("id")))
                    {
                        RoleName = action.Get<string>("RoleName");
                    }
                }
            }

        }
    }
}