using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;

namespace Web.UI.Demo
{
    public partial class LS_Demo3 : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected override bool IsBreakCheckMenuUrl
        {
            get
            {
                return true;
            }
        }
    }
}