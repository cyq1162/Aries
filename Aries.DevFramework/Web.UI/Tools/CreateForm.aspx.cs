using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CYQ.Data.Table;
using CYQ.Data.Tool;

namespace Web.UI.Tool
{
    public partial class CreateForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string tableNames = "V_SYS_UserList";//this.txtDispName.Text;
            //if (string.IsNullOrEmpty(tableNames))
            //{
            //    ScriptHelper.Alert(this.Page, "请输入表名/视图名");
            //}
            //string[] temp = tableNames.Trim(',').Split(',');
            //StringBuilder stColumnName = new StringBuilder();
            //StringBuilder stDescription = new StringBuilder();

            //foreach (string tableName in temp)
            //{
            //    MDataColumn mdc = DBTool.GetColumns(tableName, null);
            //    if (mdc == null)
            //    {
            //        continue;
            //    }

            //    foreach (var item in mdc)
            //    {
            //        stColumnName.Append(item.ColumnName + ";");
            //        stDescription.Append(item.Description + ";");
            //    }
            //}
            //Response.Redirect("GridConfigList.aspx?tbName=V_SYS_UserList");
        }

        protected void btnText_Click(object sender, EventArgs e)
        {
           
        }
    }
}