using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data;
using CYQ.Data.SQL;
using CYQ.Data.Table;
using CYQ.Data.Tool;

namespace Web.Core
{
    /// <summary>
    /// 表格头配置专用类（By CYQ）操作：Config_Grid 表
    /// </summary>
    public static class GridConfig
    {
        public enum SelectType
        {
            /// <summary>
            /// 所有
            /// </summary>
            All,
            /// <summary>
            /// 非隐藏字段
            /// </summary>
            Show,
            /// <summary>
            /// 导出字段
            /// </summary>
            Export,
            /// <summary>
            /// 导入字段
            /// </summary>
            Import,
            /// <summary>
            /// 导入唯一
            /// </summary>
            ImportUnique
        }
        public const string field = @"select distinct s1.name,s4.value from syscolumns s1 left join  sys.extended_properties  s4 on s4.major_id=s1.id and s4.minor_id=s1.colid where s4.value is not null and len(s1.name)>0";

        private static Dictionary<string, string> _FieldTitle = new Dictionary<string, string>();
        /// <summary>
        /// 获取默认的翻译配置
        /// </summary>
        public static Dictionary<string, string> FieldTitle
        {
            get
            {
                if (_FieldTitle.Count == 0)
                {
                    MDataTable dt;
                    using (MProc proc = new MProc(field))
                    {
                        dt = proc.ExeMDataTable();
                    }
                    foreach (MDataRow row in dt.Rows)
                    {
                        string name = row.Get<string>(0);
                        string value = row.Get<string>(1);
                        if (value.Length > 1 && !_FieldTitle.ContainsKey(name))
                        {
                            _FieldTitle.Add(name, value.Split(new char[] { ' ', ',', '(' })[0]);
                        }
                    }
                }
                return _FieldTitle;
            }
        }
        public static Dictionary<string, string> GetTitleField(string tableName)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            MDataColumn mdc = DBTool.GetColumns(CrossDb.GetEnum(tableName));
            if (mdc.Count > 0)
            {
                foreach (MCellStruct item in mdc)
                {
                    string des = Convert.ToString(item.Description);
                    if (!string.IsNullOrEmpty(des))
                    {
                        des = des.Split(new char[] { ' ', ',', '(' })[0];
                        if (!dic.ContainsKey(des))
                        {
                            dic.Add(des, item.ColumnName);
                        }
                    }
                }
            }
            return dic;
        }
        public static string[] GetSelectColumns(string objName, SelectType st)
        {

            return GetList(objName, st).GetColumnItems<string>("Field").ToArray();
        }

        /// <summary>
        /// 读取列表
        /// </summary>
        public static MDataTable GetList(string objName, SelectType st)
        {
            string where = "";
            switch (st)
            {
                case SelectType.Show:
                    where = " and (Hidden=0 or Formatter='#')";
                    break;
                case SelectType.Export:
                    where = " and Export=1";
                    break;
                case SelectType.Import:
                    where = " and Import=1";
                    break;
                case SelectType.ImportUnique:
                    where = " and ImportUnique=1";
                    break;
            }
            // return KeyValueConfig.ConfigTable.FindAll(
            using (MAction action = new MAction(TableNames.Config_Grid))
            {
                return action.Select(string.Format("ObjName='{0}' {1} order by OrderNum", objName, where));
            }
        }
        private static void FillTable(string objName, MDataTable dt)
        {
            string formatObjName = objName.Contains(" ") ? objName.Substring(objName.LastIndexOf(' ')).Trim() : objName;
            Dictionary<string, string> fieldTitleDic = GridConfig.FieldTitle;
            MDataColumn mdc = DBTool.GetColumns(CrossDb.GetEnum(objName));
            MCellStruct cell = null;
            for (int i = 0; i < mdc.Count; i++)
            {
                cell = mdc[i];
                MDataRow row = dt.NewRow();
                row["ObjName"].Value = formatObjName;
                row["Field"].Value = cell.ColumnName;
                row["Title"].Value = fieldTitleDic.ContainsKey(cell.ColumnName) ? fieldTitleDic[cell.ColumnName] : cell.ColumnName;
                row["Hidden"].Value = false;
                row["OrderNum"].Value = (i + 1) * 10;
                row["Width"].Value = i == 0 ? 1 : 100;//第一个主键列<10，则由图标个数*36 自动控制。
                row["Sortable"].Value = false;
                row["Import"].Value = i > 0 && !cell.IsCanNull;
                row["Export"].Value = true;
                row["Frozen"].Value = i == 0;
                row["Align"].Value = "center";
                row["DataType"].Value = DataType.GetType(cell.SqlType).Name.ToLower() + "," + cell.MaxSize + "," + cell.Scale + "," + (cell.IsCanNull ? 0 : 1);
                switch (DataType.GetGroup(cell.SqlType))
                {
                    //case 1:
                    //    row["DataType"].Value = "int";
                    //    break;
                    case 2:
                        //row["DataType"].Value = "datetime";
                        row["Formatter"].Value = "dateFormatter";
                        break;
                    case 3:
                        //row["DataType"].Value = "bool";
                        row["Formatter"].Value = "boolFormatter";
                        break;
                    default:
                        //row["DataType"].Value = "string";
                        if (cell.MaxSize > 50)
                        {
                            row["Formatter"].Value = "stringFormatter";
                        }
                        break;
                }
                dt.Rows.Add(row);
            }
        }
        /// <summary>
        /// 创建数据结构行
        /// </summary>
        public static MDataTable Create(string objName, MDataTable schema)
        {
            string formatObjName = objName.Contains(" ") ? objName.Substring(objName.LastIndexOf(' ')).Trim() : objName;
            FillTable(objName, schema);
            if (schema.AcceptChanges(AcceptOp.Insert))
            {
                return GetList(formatObjName, SelectType.All);
            }
            return schema;
        }
        public static MDataTable Check(string objName, MDataTable dt)
        {
#if DEBUG
            MDataTable newDt = dt.GetSchema(false);
            FillTable(objName, newDt);//重新获取。

            MDataTable addTable = dt.GetSchema(false);
            bool needUpdate = false;
            foreach (MDataRow row in newDt.Rows)
            {
                MDataRow mr = dt.FindRow(string.Format("Field='{0}'", row.Get<string>("Field")));
                if (mr == null)//找不到，则添加行
                {
                    row.Set("Hidden", true);
                    addTable.Rows.Add(row);
                }
                else if (mr["Field"].ToString() == mr["Title"].ToString()) // 找到，则试图设置中文名称。
                {
                    mr.Set("Title", row.Get<string>("Title"));
                    needUpdate = true;
                }
            }

            if (addTable.Rows.Count > 0)
            {
                addTable.AcceptChanges(AcceptOp.Auto, null, "TableName", "Field");
            }
            if (needUpdate)
            {
                dt.AcceptChanges(AcceptOp.Update);
            }
#endif
            return dt;
        }
        /// <summary>
        /// 为列头描述字段设置中文，并返回需要格式化的字段名(同时设置字段类型为NVarChar)和配置项（导出时调用到）。
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static Dictionary<string, string> SetHeaderDescription(MDataTable dt)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            MDataTable config = GetList(dt.TableName, SelectType.All);
            dt.DynamicData = config;//附加表头信息，Excel导出时（拿数据导出多级表头）
            MDataRow row;
            string formatter;
            foreach (MCellStruct item in dt.Columns)
            {
                row = config.FindRow("Field='" + item.ColumnName + "'");
                if (row != null)
                {
                    item.Description = row.Get<string>("Title");
                    formatter = row.Get<string>("Formatter");
                    if (formatter == "boolFormatter")
                    {
                        formatter = "#是否";//对bool型特殊处理。
                    }
                    if (!string.IsNullOrEmpty(formatter) && formatter.Length > 2 && formatter[0] == '#') // 需要格式化的项
                    {
                        item.SqlType = System.Data.SqlDbType.NVarChar;//重置数据类型(int数据将格式成文本）
                        dic.Add(item.ColumnName, formatter.Substring(1));
                    }
                }
            }
            return dic;
        }

        /// <summary>
        /// 还原中文列头为字段名，并返回需要格式化的字段名(同时设置字段类型为NVarChar)和配置项（导入时调用到）
        /// </summary>
        /// <param name="dt"></param>
        public static Dictionary<string, string> SetHeaderField(MDataTable dt, string objName)
        {
            Dictionary<string, string> formatDic = new Dictionary<string, string>();
            Dictionary<string, string> dic = GetTitleField(dt.TableName);
            MDataTable config = GetList(objName, SelectType.All);
            MDataRow row;
            foreach (MCellStruct item in dt.Columns)
            {
                item.TableName = dt.TableName;
                row = config.FindRow("Title='" + item.ColumnName + "'");
                if (row != null)
                {
                    item.Description = item.ColumnName;
                    item.ColumnName = row.Get<string>("Field");
                    string formatter = row.Get<string>("Formatter");
                    if (formatter == "boolFormatter")
                    {
                        formatter = "#是否";//对bool型特殊处理。
                    }
                    if (!string.IsNullOrEmpty(formatter) && formatter.Length > 2 && formatter[0] == '#') // 需要格式化的项
                    {
                        //item.SqlType = System.Data.SqlDbType.NVarChar;//重置数据类型(int数据将格式成文本）
                        formatDic.Add(item.ColumnName, formatter.Substring(1).Split(new string[] { "=>" }, StringSplitOptions.None)[0]);
                    }
                }
                else
                {

                    if (dic.ContainsKey(item.ColumnName))
                    {
                        item.Description = item.ColumnName;
                        item.ColumnName = dic[item.ColumnName];
                    }
                }
            }
            dic = null;
            return formatDic;
        }

        /// <summary>
        /// 获取某对应项对应的数据库脚本。
        /// </summary>
        /// <param name="objName">对象名称</param>
        /// <returns></returns>
        internal static string GetScript(string objName)
        {
            StringBuilder sb = new StringBuilder();
            MDataTable dt = GetList(objName, SelectType.All);
            if (dt != null)
            {
                dt.Columns.RemoveAt(0);//移除主键
                sb.Append("Delete from [Config_Grid] where [TableName]='" + objName + "'\r\nGo\r\n");
                //创建SQL脚本。
                foreach (var row in dt.Rows)
                {
                    row.TableName = "Config_Grid";
                    sb.AppendLine(SQLCode.GetSQLScript(row, "TableName", "Field"));

                }
            }
            return sb.ToString();
        }
    }
}
