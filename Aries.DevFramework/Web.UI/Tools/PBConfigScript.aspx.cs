using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;
using CYQ.Data.Table;
using System.Text;
using Web.Utility;
namespace Web.UI.Tools
{
    public partial class PBConfigScript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnLoadConfig_Click(object sender, EventArgs e)
        {
            txtSQL.Text = CreateSQL();
        }

        protected void btnDownConfig_Click(object sender, EventArgs e)
        {
            string sql = txtSQL.Text;
            if (string.IsNullOrEmpty(sql))
            {
                sql = CreateSQL();
            }
            string keys = txtKeys.Text.Trim().Replace(',', '-');
            WebHelper.SendFile("sys_KeyValue配置_" + keys+".sql", sql);
        }
        private string CreateSQL()
        {
            StringBuilder sb = new StringBuilder();
            string[] keys = txtKeys.Text.Trim().Split(',');
            foreach (var key in keys)
            {
                if (chbWithDelete.Checked)
                {
                    sb.Append("\r\nGo\r\nDelete from [PB_Config] where [ConfigKey]='" + key + "'\r\nGo\r\n");
                }
                MDataTable dt = KeyValueConfig.ConfigTable.FindAll("ConfigKey='" + key + "'");
                if (dt != null)
                {
                    foreach (var row in dt.Rows)
                    {
                        row.TableName = TableNames.PB_Config.ToString();
                        sb.AppendLine(SQLCode.GetSQLScript(row, "ConfigName", "ConfigValue"));
                    }
                }
            }
            return sb.ToString();
        }
    }
}