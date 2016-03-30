using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CYQ.Data;
using CYQ.Data.Table;

namespace Web.UI.UserControl
{
    public partial class UploadFileV2 : System.Web.UI.UserControl
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string GetWhereIn(string key, string where)
        {
            string[] items = where.Split(',');
            where = string.Empty;
            foreach (var item in items)
            {
                where += "'" + item.Trim('\'') + "',";
            }
            where = string.Format("[{0}] in ({1})", key, where.TrimEnd(','));//避免删除不了GUID为主键的数据
            return where;
        }
        public string GetFileType()
        {
            bool isOk = true;
            string where = "ConfigKey='文件类型'";

            if (!string.IsNullOrEmpty(GroupType))
            {

                where += string.Format(" AND {0}", GetWhereIn("Flag", GroupType));
            }
            else if (!string.IsNullOrEmpty(ConfigVal))
            {
                where = string.Format(" AND {0}", GetWhereIn("ConfigValue", ConfigVal));
            }
            else
            {
                isOk = false;
            }
            MDataTable tb = null;
            if (isOk)
            {
                using (MAction action = new MAction("Config_KeyValue"))
                {
                    action.SetAopOff();
                    tb = action.Select(where);
                }
            }
            StringBuilder sb = new StringBuilder("<option value=\"\">全部</option>");
            if (tb != null && tb.Rows.Count > 0)
            {
                foreach (MDataRow row in tb.Rows)
                {
                    sb.AppendFormat("<option value=\"{1}\">{0}</option>", row["ConfigName"].ToString(), row["ConfigValue"].ToString());
                }
            }
            return sb.ToString();
        }
        /// <summary>
        /// 上传文件类型组,根据Config_KeyValue的configKey=‘文件类型’和Flag字段过滤，
        /// ConfigKey已写死，我们需要传入的是Flag标记分组
        /// </summary>
        public string GroupType
        {
            get;
            set;
        }
        private DisplayMode _DisplayMode = DisplayMode.Default;
        /// <summary>
        /// 1: 上传查看删除模式；2: 查看模式 ；3：仅上传下载模式
        /// </summary>
        public DisplayMode DisplayMode
        {
            get
            {
                return _DisplayMode;
            }
            set
            {
                _DisplayMode = value;
            }

        }
        /// <summary>
        /// 文件夹路劲；如：站点文件/专业/工期/分公司/逻辑站点ID_站点名称/文件类型
        /// </summary>
        public string RelaPath
        {
            get;
            set;
        }
        private ViewMode _ViewMode = ViewMode.Default;
        /// <summary>
        /// 默认标准模式
        //1.简洁模式
        //2.普通模式
        //3.标准模式
        /// </summary>
        public ViewMode ViewMode
        {
            get { return _ViewMode; }
            set { _ViewMode = value; }
        }
        /// <summary>
        /// 根据Config_KeyValue的configKey=‘文件类型’和ConfigValue字段过滤，
        /// ConfigKey已写死，我们需要传入的是ConfigValue标记分组
        /// </summary>
        public string ConfigVal
        {
            get;
            set;
        }
    }
}