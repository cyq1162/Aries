using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;
using System.Web.Security;
using System.Configuration;
using Web.Utility;


namespace Web.UI
{
    public partial class Login : System.Web.UI.Page
    {
        protected string loginID = null;
        protected string Ischeck = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            string outMsg = string.Empty;
            if (HttpContext.Current.Request.HttpMethod == "GET")
            {
                string lid = Request["uid"];
                string pwd = Request["pwd"];
                if (!string.IsNullOrEmpty(lid) && !string.IsNullOrEmpty(pwd))
                {
                    UserAuth.Login(lid, pwd, out outMsg);
                }
            }
            else
            {

                if (!UserAuth.Login(Request["txtName"], Request["txtPwd"], out outMsg))
                {
                    lbTip.Text = outMsg;
                }
            }
        }
    }
}