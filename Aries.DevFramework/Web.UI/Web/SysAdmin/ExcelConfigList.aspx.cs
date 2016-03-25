using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.Core;
using CYQ.Data.Table;
using CYQ.Data.Tool;


namespace Web.UI.Web.Sys
{
    public partial class ExcelConfigList : PageBase
    {
        public string objName = string.Empty;
        public string tableNamesJson = string.Empty;
        public string columnJson = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            MDataRow row=ExcelConfig.GetInfoByID(Query<string>("ID"));
            objName = row.Get<string>("EnName");
            string[] TableNames = row.Get<string>("TableNames").Split(',');
            Dictionary<string, string> dic = new Dictionary<string, string>();
            JsonHelper js = new JsonHelper();
            foreach (string name in TableNames)
            {
                MDataColumn mdc = DBTool.GetColumns(name);
                js.Add(name, GetJson(mdc), true);
                dic.Add(name, name);
            }
            columnJson = js.ToString(false);
            tableNamesJson = MDataTable.CreateFrom(dic).ToJson(false, false);

        }
        string GetJson(MDataColumn mdc)
        {
            JsonHelper js = new JsonHelper();
            foreach (var cell in mdc)
            {
                js.Add("Key", cell.ColumnName);
                js.Add("Value", cell.ColumnName);
                js.AddBr();
            }
            return js.ToString(true);
        }
    }

}