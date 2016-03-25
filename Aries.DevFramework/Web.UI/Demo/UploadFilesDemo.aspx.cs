using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;

namespace Web.UI.Demo
{
    public partial class UploadFilesDemo : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UploadFileV21.RelaPath = "";
            if (!IsPostBack)
            {
                UploadFileV1.DisplayMode = UserControl.DisplayMode.ViewOnly;
                UploadFileV21.DisplayMode = UserControl.DisplayMode.UpAndDownOnly;
                UploadFileV2.DisplayMode = UserControl.DisplayMode.Default;
            }
        }
    }
}