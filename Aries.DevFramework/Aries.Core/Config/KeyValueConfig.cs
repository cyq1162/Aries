using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using Aries.Core.DB;
using Aries.Core.Sql;
using Aries.Core.Extend;

namespace Aries.Core.Config
{
    /// <summary>
    /// 键值对配置专用类（By CYQ）操作：Config_KeyValue 表
    /// </summary>
    public static partial class KeyValueConfig
    {
        // private static MDataTable _KeyValueTable;
        /// <summary>
        /// 配置表（全局缓存）
        /// </summary>
        public static MDataTable KeyValueTable
        {
            get
            {
                //if (_KeyValueTable == null)
                //{
                MDataTable config;
                using (MAction action = new MAction(U_AriesEnum.Config_KeyValue))
                {
                    //MDataTable dt = action.Select("order by orderno asc");//"ConfigKey='账号状态'"
                    //dt.Rows.Sort("order by ConfigKey DESC");
                    // MDataTable dt2=dt.Select("
                    config = action.Select("order by ConfigKey ASC,OrderNo ASC");
                }
                MDataRow row = config.FindRow("ConfigKey='ExtendConfig'");
                if (row != null)
                {
                    string tableName = row.Get<string>("ConfigName");
                    string select = row.Get<string>("ConfigValue");
                    string where = row.Get<string>("Notes");
                    if (!string.IsNullOrEmpty(tableName))
                    {
                        MDataTable config2;
                        using (MAction action = new MAction(CrossDb.GetEnum(tableName)))
                        {
                            if (!string.IsNullOrEmpty(select))
                            {
                                action.SetSelectColumns(select.Split(','));
                            }
                            config2 = action.Select(where);
                        }
                        config.Merge(config2);
                    }
                }
               

                return config;
                //}
                //return _KeyValueTable;
            }
            //set
            //{
            //    _KeyValueTable = value;
            //}
        }

        internal static void SetTableDescription(string objName, string description)
        {
            if (!string.IsNullOrEmpty(description))
            {
                using (MAction action = new MAction(U_AriesEnum.Config_KeyValue))
                {
                    if (!action.Exists("ConfigKey='" + LangConst.TableDescription + "' and ConfigName='" + objName + "'"))
                    {
                        action.Set(Config_KeyValue.ConfigKey, LangConst.TableDescription);
                        action.Set(Config_KeyValue.ConfigName, objName);
                        action.Set(Config_KeyValue.ConfigValue, description);
                        action.Set(Config_KeyValue.Flag, "sys");
                        if (action.Insert())
                        {
                            // KeyValueTable = null;//清缓存。
                        }
                    }
                }
            }
        }

        /// <summary>
        /// 获取JavaScript Json
        /// </summary>
        public static string GetJson()
        {
            MDataTable dt = KeyValueTable.FindAll("Flag<>'sys'");
            return GetJson(dt);
        }
        private static string GetJson(MDataTable configTable)
        {
            JsonHelper json = new JsonHelper(false, false);
            string configKey = string.Empty;
            bool isKeyChanged = false;
            List<MDataRow> groupList = new List<MDataRow>();
            int count = configTable.Rows.Count;
            for (int i = 0; i < count; i++)
            {
                MDataRow row = configTable.Rows[i];
                if (configKey != string.Empty && configKey != row.Get<string>("ConfigKey", string.Empty).Trim())
                {
                    isKeyChanged = true;
                }
                if (isKeyChanged)
                {
                    if (groupList.Count > 0)
                    {
                        json.Add(configKey, GetInnerJson(groupList), true);
                        groupList.Clear();
                    }
                    isKeyChanged = false;
                }
                groupList.Add(row);
                configKey = row.Get<string>("configKey", string.Empty).Trim();
                if (i == count - 1 && groupList.Count > 0)//最的一条（最后一组处理）
                {
                    json.Add(configKey, GetInnerJson(groupList), true);
                }
            }
            json.AddBr();
            return json.ToString();
        }
        private static string GetInnerJson(List<MDataRow> groupList)
        {
            MDataTable group = groupList;
            if (AppConfig.DB.DefaultDalType == DalType.Txt)
            {
                group.Rows.Sort("OrderNo ASC");//文本需要再次排序（因为不支持查询的时候多重排序）
            }
            JsonHelper json = new JsonHelper(false, false);

            foreach (MDataRow row in group.Rows)
            {
                json.Add("text", row.Get<string>("ConfigName"));
                json.Add("value", row.Get<string>("ConfigValue"));
                json.AddBr();
            }
            return json.ToString(true);
        }

        //internal static Dictionary<string, string> tableDic = DBTool.GetTables(AppConfig.DB.DefaultConn);
        /// <summary>
        /// 获取表的描述。
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static string GetTableDescription(string objName, string tableName)
        {

            string description = GetVallue(LangConst.TableDescription, objName);
            if (string.IsNullOrEmpty(description))
            {
                MDataRow row = ExcelConfig.GetExcelRow(objName);
                if (row != null)
                {
                    description = row.Get<string>(Config_Excel.Description);
                }
                if (string.IsNullOrEmpty(description))
                {
                    description = GetVallue(LangConst.TableDescription, tableName);
                    if (string.IsNullOrEmpty(description))
                    {
                        description = CrossDb.GetDescription(tableName);
                    }
                }
            }
            if (string.IsNullOrEmpty(description))
            {
                return objName;
            }
            return description;
        }

        /// <summary>
        /// 根据配置Key和Value获取对应的名称。
        /// </summary>
        public static string GetName(string configKey, string configValue)
        {
            MDataRow row = KeyValueTable.FindRow("ConfigKey='" + configKey + "' and ConfigValue='" + configValue + "'");
            if (row != null)
            {
                return row.Get<string>("ConfigName");
            }
            return configValue;
        }
        /// <summary>
        /// 根据配置Key和Name获取对应的名称。
        /// </summary>
        public static string GetVallue(string configKey, string configName)
        {
            MDataRow row = KeyValueTable.FindRow("ConfigKey='" + configKey + "' and ConfigName='" + configName + "'");
            if (row != null)
            {
                return row.Get<string>("ConfigValue");
            }
            return configName;
        }
    }
    public static partial class KeyValueConfig
    {
        /// <summary>
        /// 翻译键名称=>值 或 键值=>名称。
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="formatParas">格式化的字段名和配置项</param>
        /// <param name="isValueToName">[true:值=>名称],[false:名称=>值]</param>
        public static bool FormatNameValue(MDataTable dt, Dictionary<string, string> formatParas, bool isValueToName)
        {
            bool result = true;
            if (dt.Rows.Count > 0)
            {
                #region 检测是否有默认值需要处理
                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    string defaultValue = Convert.ToString(dt.Columns[i].DefaultValue);
                    if (!string.IsNullOrEmpty(defaultValue))
                    {
                        int index = dt.Columns.GetIndex(defaultValue);
                        if (index == -1 && defaultValue.IndexOf('.') > -1)//处理字段指定
                        {
                            string[] items = defaultValue.Split('.');
                            index = dt.Columns.GetIndex(items[items.Length - 1]);
                        }
                        foreach (var row in dt.Rows)
                        {
                            if (row[i].IsNullOrEmpty)
                            {
                                if (index > -1)
                                {
                                    row[i].Value = row[index].Value;
                                }
                                else
                                {
                                    switch (defaultValue.ToLower())
                                    {
                                        case "now()":
                                            row[i].Value = DateTime.Now;
                                            break;
                                        case "newid()":
                                            row[i].Value = Guid.NewGuid();
                                            break;
                                        default:
                                            row[i].Value = defaultValue;
                                            break;
                                    }
                                }
                            }
                        }
                    }
                }
                #endregion

                if (formatParas.Count > 0)
                {
                    #region 收集翻译项
                    string configKeys = "(";
                    StringBuilder objNameSql = new StringBuilder();

                    foreach (string item in formatParas.Values)
                    {
                        if (item.StartsWith("C_"))
                        {
                            objNameSql.Append(SqlCode.GetCode(item.Split('=')[0].Trim()) + ";");
                        }
                        else
                        {
                            configKeys += "'" + item.Split('=')[0].Trim() + "',";
                        }
                    }

                    MDataTable configItems = null;//存档Config_KeyValue的项
                    Dictionary<string, MDataTable> objNameItems = new Dictionary<string, MDataTable>();//存档自定义对项集合的项 
                    if (configKeys.Length > 1)
                    {
                        configKeys = configKeys.TrimEnd(',') + ")";
                        configItems = KeyValueTable.FindAll("ConfigKey in " + configKeys);
                    }
                    if (objNameSql.Length > 1)
                    {
                        List<MDataTable> objNameTables = null;//存档自定义对项集合的项
                        using (MProc proc = new MProc(objNameSql.ToString()))
                        {
                            objNameTables = proc.ExeMDataTableList();
                        }
                        if (objNameTables.Count > 0)
                        {
                            int index = 0;
                            foreach (var item in formatParas)
                            {
                                if (item.Value.StartsWith("C_"))
                                {
                                    objNameItems.Add(item.Key, objNameTables[index]);
                                    index++;
                                }
                            }
                        }
                    }
                    #endregion

                    #region 开始遍历翻译
                    MDataRow keyValueRow = null;
                    int i = 0;
                    string errorKey = LangConst.ErrorInfo;
                    bool isAddError = dt.Columns.Contains(errorKey);
                    foreach (MDataRow row in dt.Rows)
                    {
                        i = 0;
                        foreach (KeyValuePair<string, string> kvItem in formatParas)
                        {
                            MDataCell cell = row[kvItem.Key];
                            if (cell == null)
                            {
                                continue;
                            }
                            string value = cell.ToString();//广东省=>300
                            if (!kvItem.Value.StartsWith("C_"))
                            {
                                #region #Config_KeyValue的项翻译
                                if (isValueToName && kvItem.Value == LangConst.IsYesNo)//处理1，0，true,false不同情况
                                {
                                    value = (value == "1" || value.ToLower() == "true") ? "1" : "0";
                                }
                                else if (cell.IsNullOrEmpty)//如果值为Null，也允许翻译成否。
                                {
                                    continue;
                                }
                                // string[] items = value.Split(',');

                                keyValueRow = configItems.FindRow(string.Format("ConfigKey='{0}' and {1}='{2}'", kvItem.Value, (isValueToName ? "ConfigValue" : "ConfigName"), value));
                                if (keyValueRow == null)
                                {
                                    string lowerValue = value.ToLower();
                                    if (lowerValue == "true" || lowerValue == "false")
                                    {
                                        value = (lowerValue == "true" ? "1" : "0");
                                        keyValueRow = configItems.FindRow(string.Format("ConfigKey='{0}' and {1}='{2}'", kvItem.Value, (isValueToName ? "ConfigValue" : "ConfigName"), value));
                                    }
                                    else if (lowerValue == "1" || lowerValue == "0")
                                    {
                                        value = (lowerValue == "1" ? "true" : "false");
                                        keyValueRow = configItems.FindRow(string.Format("ConfigKey='{0}' and {1}='{2}'", kvItem.Value, (isValueToName ? "ConfigValue" : "ConfigName"), value));
                                    }
                                }
                                if (keyValueRow != null)
                                {
                                    row.Set(kvItem.Key, keyValueRow.Get<string>(isValueToName ? "ConfigName" : "ConfigValue"));
                                }
                                else if (value.IndexOf(',') > -1) // 多重字段值（角色：1,3,5=》网优部门,经理、其它）
                                {
                                    string[] items = value.Split(',');
                                    value = string.Empty;
                                    foreach (string item in items)
                                    {
                                        if (string.IsNullOrEmpty(item))
                                        {
                                            continue;
                                        }
                                        keyValueRow = configItems.FindRow(string.Format("ConfigKey='{0}' and {1}='{2}'", kvItem.Value, (isValueToName ? "ConfigValue" : "ConfigName"), item));
                                        if (keyValueRow != null)
                                        {
                                            value += keyValueRow.Get<string>(isValueToName ? "ConfigName" : "ConfigValue") + ",";
                                        }
                                    }
                                    if (!string.IsNullOrEmpty(value))
                                    {
                                        row.Set(kvItem.Key, value.TrimEnd(','));
                                    }
                                }
                                else
                                {
                                    //查询是否直接已经是值了，如果是，忽略
                                    keyValueRow = configItems.FindRow(string.Format("ConfigKey='{0}' and {1}='{2}'", kvItem.Value, (isValueToName ? "ConfigName" : "ConfigValue"), value));
                                    if (keyValueRow == null && isAddError)
                                    {
                                        row.Set(errorKey, row.Get<string>(errorKey) + string.Format("[{0}]{1}。", cell.Struct.Description, LangConst.NoMatchItem));
                                    }
                                }
                                #endregion
                            }
                            else if (objNameItems.Count > 0 && objNameItems.ContainsKey(kvItem.Key))
                            {
                                if (cell.IsNullOrEmpty)
                                {
                                    continue;
                                }

                                #region 下拉的项翻译
                                keyValueRow = objNameItems[kvItem.Key].FindRow((isValueToName ? "value" : "text") + "='" + value + "'");

                                if (keyValueRow != null)
                                {
                                    row.Set(kvItem.Key, keyValueRow.Get<string>(isValueToName ? "text" : "value"));
                                }
                                else if (value.IndexOf(',') > -1) // 多重字段值（角色：1,3,5=》网优部门,经理、其它）
                                {
                                    string[] items = value.Split(',');
                                    value = string.Empty;
                                    foreach (string item in items)
                                    {
                                        if (string.IsNullOrEmpty(item))
                                        {
                                            continue;
                                        }
                                        keyValueRow = objNameItems[kvItem.Key].FindRow((isValueToName ? "value" : "text") + "='" + item + "'");
                                        if (keyValueRow != null)
                                        {

                                            value += keyValueRow.Get<string>(isValueToName ? "text" : "value") + ",";
                                        }
                                    }
                                    if (!string.IsNullOrEmpty(value))
                                    {
                                        row.Set(kvItem.Key, value.TrimEnd(','));
                                    }
                                }
                                else
                                {
                                    keyValueRow = objNameItems[kvItem.Key].FindRow((isValueToName ? "text" : "value") + "='" + value + "'");
                                    if (keyValueRow == null && isAddError)
                                    {
                                        row.Set(errorKey, row.Get<string>(errorKey) + string.Format("[{0}]{1}。", cell.Struct.Description, LangConst.NoMatchItem));
                                    }
                                }
                                #endregion

                                i++;
                            }
                        }

                    }
                    #endregion
                }



            }
            return result;
        }
        /// <summary>
        /// 本方法扩展供Excel导出的数据验证使用
        /// </summary>
        public static Dictionary<string, string[]> GetValidationData(MDataTable dt)
        {
            Dictionary<string, string[]> dic = new Dictionary<string, string[]>(dt.Rows.Count);
            Dictionary<string, string> sqlDic = new Dictionary<string, string>();
            foreach (MDataRow row in dt.Rows)
            {
                string formatter = row.Get<string>(Config_Grid.Formatter);
                if (formatter == "boolFormatter")
                {
                    formatter = "#" + LangConst.IsYesNo;//对bool型特殊处理。
                }
                if (!string.IsNullOrEmpty(formatter) && formatter[0] == '#')
                {

                    if (formatter.StartsWith("#C_"))//数据库
                    {
                        if (!sqlDic.ContainsKey(formatter))
                        {
                            sqlDic.Add(formatter, SqlCode.GetCode(formatter.Substring(1).Split('=')[0].Trim()) + ";");
                        }
                    }
                    else
                    {
                        MDataTable config = KeyValueTable.FindAll(string.Format("ConfigKey='{0}'", formatter.TrimStart('#')));
                        if (config != null && config.Rows.Count > 0)
                        {
                            if (!dic.ContainsKey(formatter))
                            {
                                dic.Add(formatter, config.GetColumnItems<string>("ConfigName").ToArray());
                            }
                        }
                    }
                }
            }
            SetFormatterValFromSql(sqlDic, dic);
            return dic;
        }

        /// <summary>
        /// 构造包含级联的数据字典
        /// </summary>
        /// <param name="formatParas"></param>
        /// <returns></returns>
        public static void SetFormatterValFromSql(Dictionary<string, string> itemSql, Dictionary<string, string[]> allDataText)
        {
            Dictionary<string, MDataTable> objNameItems = new Dictionary<string, MDataTable>();

            if (itemSql.Values.Count > 0)
            {
                StringBuilder objSql = new StringBuilder();
                foreach (string item in itemSql.Values)
                {
                    objSql.Append(item);
                }
                List<MDataTable> objNameTables = new List<MDataTable>();
                string sql = objSql.ToString().TrimEnd(';');
                using (MProc proc = new MProc(sql, CrossDb.GetConn(sql)))
                {
                    if (proc.DalType == DalType.MsSql)
                    {
                        objNameTables = proc.ExeMDataTableList();
                    }
                    else
                    {
                        string[] items = sql.Split(';');
                        foreach (string item in items)
                        {
                            proc.ResetProc(item);
                            objNameTables.Add(proc.ExeMDataTable());
                        }
                    }
                }
                if (objNameTables.Count > 0)
                {
                    int index = 0;
                    foreach (var item in itemSql)
                    {
                        if (item.Key.StartsWith("#C_"))
                        {
                            objNameItems.Add(item.Key, objNameTables[index]);
                            index++;
                        }
                    }
                }
            }
            List<string> ParKeys = new List<string>();

            foreach (var item in objNameItems.Keys)
            {
                string k = string.Empty;
                if (item.IndexOf('=') > -1)
                {
                    k = item.Split('=')[1];
                    k = k.Replace('>', '#');
                    if (!ParKeys.Contains(k))
                    {
                        ParKeys.Add(k);
                    }
                }

            }
            List<string> ParentKeys = new List<string>();//取父级key
            foreach (var item in objNameItems)
            {
                string preKey = item.Key.Split('=')[0];
                if (ParKeys.Contains(preKey))
                {
                    ParentKeys.Add(item.Key);
                }
                //有的表#C_PB_Company下存在多个子级联项,如区县，汇聚区、而excel不支持1对多的级联，则只做1对1级联，其他子级联项为下拉数据有效性
                allDataText.Add(item.Key, item.Value.GetColumnItems<string>("text").ToArray());
            }

            List<string> ParentIds = new List<string>();//所有父节点ID
            foreach (var pk in ParentKeys)
            {
                ParentIds = objNameItems[pk].GetColumnItems<string>("value");
                //
                foreach (var id in ParentIds)
                {
                    MDataTable table = null;
                    MDataRow row = null;
                    foreach (var item in objNameItems)
                    {
                        if (row == null)
                        {
                            row = item.Value.FindRow(string.Format("value={0}", id));
                        }
                        if (table == null)
                        {
                            if (item.Key.IndexOf("=") > -1)
                            {
                                string key = item.Key.Split('=')[1];
                                key = key.Replace('>', '#');
                                if (key.Equals(pk.Split('=')[0]))
                                {
                                    table = item.Value.FindAll(string.Format("parent={0}", id));
                                }
                            }
                        }
                        if (table != null && row != null)
                        {
                            if (!allDataText.ContainsKey(row["text"].Value.ToString()))
                            {
                                if (allDataText.ContainsKey(item.Key))
                                {
                                    allDataText.Remove(item.Key);
                                }
                                allDataText.Add(row["text"].Value.ToString(), table.GetColumnItems<string>("text").ToArray());
                                break;

                            }
                        }
                    }
                }
            }
        }
    }
}
