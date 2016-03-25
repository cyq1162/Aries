using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;

namespace Web.Core
{
    /// <summary>
    /// 键值对配置专用类（By CYQ）操作：PB_Config 表
    /// </summary>
    public static partial class KeyValueConfig
    {
        private static MDataTable _ConfigTable;
        /// <summary>
        /// 配置表（全局缓存）
        /// </summary>
        public static MDataTable ConfigTable
        {
            get
            {
                if (_ConfigTable == null)
                {
                    using (MAction action = new MAction("PB_Config"))
                    {
                        action.SetSelectColumns("LTRIM(RTRIM(ConfigKey)) AS ConfigKey", "ConfigName", "ConfigValue", "TopComID");//刘盼：ConfigKey是翻译索引字段，需去掉空格
                        _ConfigTable = action.Select("order by ConfigKey ASC,OrderNo ASC,CFID ASC");
                    }
                }
                return _ConfigTable;
            }
            set
            {
                _ConfigTable = value;
            }
        }

        internal static void SetTableDescription(string objName, string description)
        {
            if (!string.IsNullOrEmpty(description))
            {
                using (MAction action = new MAction(TableNames.PB_Config))
                {
                    if (!action.Exists("ConfigKey='表名描述' and ConfigName='" + objName + "'"))
                    {
                        action.Set(PB_Config.ConfigKey, "表名描述");
                        action.Set(PB_Config.ConfigName, objName);
                        action.Set(PB_Config.ConfigValue, description);
                        action.Set(PB_Config.Flag, "sys");
                        if (action.Insert())
                        {
                            ConfigTable = null;//清缓存。
                        }
                    }
                }
            }
        }

        /*
        /// <summary>
        /// 保存成Js文件,输出到前端缓存
        /// 格式 var config={"CloverColor":{"1":"0xFF0000",""},Gis:"","安全指标":""}
        /// </summary>
        public static void SaveJavaScript()
        {
            _ConfigTable = null;//清空缓存。
            MDataTable dt = ConfigTable.FindAll("Flag<>'sys'");
            string json = GetJson(dt);
            try
            {
                string path = System.Web.HttpContext.Current.Server.MapPath("~/Style/JS/TY.KeyValueConfig.js");
                File.WriteAllText(path, "var config=" + json, Encoding.UTF8);
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }

        }
         */
        /// <summary>
        /// 获取JavaScript Json
        /// </summary>
        public static string GetJson()
        {
            MDataTable dt = ConfigTable.FindAll("Flag<>'sys'");
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

                        if (configKey == "文件服务器信息")
                        {

                        }
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
            JsonHelper json = new JsonHelper(false, false);

            foreach (MDataRow row in groupList)
            {
                json.Add("text", row.Get<string>("ConfigName"));
                json.Add("value", row.Get<string>("ConfigValue"));
                string parent = row.Get<string>("TopComID", "");
                if (parent != "")
                {
                    json.Add("parent", parent);
                }
                json.AddBr();
            }
            return json.ToString(true);
        }

        internal static Dictionary<string, string> tableDic = DBTool.GetTables(AppConfig.DB.DefaultConn);
        /// <summary>
        /// 获取表的描述。
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public static string GetTableDescription(string objName, string tableName)
        {

            string descriptoin = GetVallue("表名描述", objName);
            if (string.IsNullOrEmpty(descriptoin))
            {
                MDataRow row = ExcelConfig.GetInfo(objName);
                if (row != null)
                {
                    descriptoin = row.Get<string>(PB_ExcelInfo.CnName);
                }
                if (string.IsNullOrEmpty(descriptoin))
                {
                    descriptoin = GetVallue("表名描述", tableName);
                    if (tableDic.ContainsKey(tableName))
                    {
                        descriptoin = tableDic[tableName];
                    }
                }
            }
            if (string.IsNullOrEmpty(descriptoin))
            {
                return objName;
            }
            return descriptoin;
        }

        /// <summary>
        /// 根据配置Key和Value获取对应的名称。
        /// </summary>
        public static string GetName(string configKey, string configValue)
        {
            MDataRow row = ConfigTable.FindRow("ConfigKey='" + configKey + "' and ConfigValue='" + configValue + "'");
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
            MDataRow row = ConfigTable.FindRow("ConfigKey='" + configKey + "' and ConfigName='" + configName + "'");
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
                        foreach (var row in dt.Rows)
                        {
                            if (row[i].IsNullOrEmpty)
                            {
                                row[i].Value = defaultValue;
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
                            objNameSql.Append(SQLCode.GetCode(item.Split('=')[0].Trim()) + ";");
                        }
                        else
                        {
                            configKeys += "'" + item.Split('=')[0].Trim() + "',";
                        }
                    }

                    MDataTable configItems = null;//存档pb_config的项
                    Dictionary<string, MDataTable> objNameItems = new Dictionary<string, MDataTable>();//存档自定义对项集合的项 
                    if (configKeys.Length > 1)
                    {
                        configKeys = configKeys.TrimEnd(',') + ")";
                        configItems = ConfigTable.FindAll("ConfigKey in " + configKeys);
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
                    string errorKey = "错误信息";
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
                                #region #PB_Config的项翻译
                                if (isValueToName && kvItem.Value == "是否")//处理1，0，true,false不同情况
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
                                        row.Set(errorKey, row.Get<string>(errorKey) + string.Format("[{0}]找不到对应项。", cell.Struct.Description));
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
                                        row.Set(errorKey, row.Get<string>(errorKey) + string.Format("[{0}]找不到对应项。", cell.Struct.Description));
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
            Dictionary<string, string> SqlDic = new Dictionary<string, string>();
            foreach (MDataRow row in dt.Rows)
            {
                string formatter = row.Get<string>(PB_GridConfig.Formatter);
                if (formatter == "boolFormatter")
                {
                    formatter = "#是否";//对bool型特殊处理。
                }
                if (!string.IsNullOrEmpty(formatter) && formatter[0] == '#')
                {

                    if (formatter.StartsWith("#C_"))//数据库
                    {
                        if (!SqlDic.ContainsKey(formatter))
                        {
                            SqlDic.Add(formatter, SQLCode.GetCode(formatter.Substring(1).Split('=')[0].Trim()) + ";");
                        }
                    }
                    else
                    {
                        MDataTable config = ConfigTable.FindAll(string.Format("ConfigKey='{0}'", formatter.TrimStart('#')));
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
            GetFormatterValFromSql(SqlDic, dic);
            return dic;
        }

        /// <summary>
        /// 刘盼
        /// 构造包含级联的数据字典
        /// </summary>
        /// <param name="formatParas"></param>
        /// <returns></returns>
        public static void GetFormatterValFromSql(Dictionary<string, string> itemSql, Dictionary<string, string[]> AllDataText)
        {
            Dictionary<string, MDataTable> objNameItems = new Dictionary<string, MDataTable>();

            if (itemSql.Values.Count > 0)
            {
                StringBuilder objSql = new StringBuilder();
                foreach (var sql in itemSql.Values)
                {
                    objSql.Append(sql);
                }
                List<MDataTable> objNameTables = null;
                using (MProc proc = new MProc(objSql.ToString()))
                {
                    objNameTables = proc.ExeMDataTableList();
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
                AllDataText.Add(item.Key, item.Value.GetColumnItems<string>("text").ToArray());
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
                            if (!AllDataText.ContainsKey(row["text"].Value.ToString()))
                            {
                                if (AllDataText.ContainsKey(item.Key))
                                {
                                    AllDataText.Remove(item.Key);
                                }
                                AllDataText.Add(row["text"].Value.ToString(), table.GetColumnItems<string>("text").ToArray());
                                break;

                            }
                        }
                    }
                }
            }
        }
    }
}
