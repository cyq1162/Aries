using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
namespace Aries.Core.Extend
{
    /// <summary>
    /// 下拉框集合
    /// </summary>
    internal class Combobox
    {
        /// <summary>
        /// 读取数据库所有表
        /// </summary>
        /// <param name="key">关键字</param>
        /// <param name="filter">过滤条件值</param>
        /// <returns></returns>
        public static MDataTable Get(string key, string filter)
        {
            MDataTable dt = null;
            SortedDictionary<string, string> newDic = new SortedDictionary<string, string>();
            switch (key)
            {
                case "C_SYS_Table":
                    if (!string.IsNullOrEmpty(filter)) // 有过滤条件
                    {
                        string[] items = filter.Split(',');//指定数据库链接条件
                        foreach (string item in items)
                        {
                            if (item.EndsWith("Conn"))//当成链接处理
                            {
                                string dbHash = DBInfo.GetHashKey(item);
                                if (DBTool.DataBases.ContainsKey(dbHash))
                                {
                                    foreach (var table in DBTool.DataBases[dbHash].Tables)
                                    {
                                        newDic.Add(table.Value.Name, table.Value.Name);
                                    }
                                }
                            }
                            else//当成普通表名处理
                            {
                                newDic.Add(item, item);
                            }
                        }
                    }
                    else
                    {
                        foreach (var db in DBTool.DataBases)
                        {
                            foreach (var table in db.Value.Tables)
                            {
                                newDic.Add(table.Value.Name, table.Value.Name);
                            }
                        }
                    }
                    break;
                case "C_SYS_Column":
                    if (!string.IsNullOrEmpty(filter))
                    {
                        dt = new MDataTable(key);
                        dt.Columns.Add("value");
                        dt.Columns.Add("text");
                        dt.Columns.Add("parent");
                        string[] items = filter.Split(',');
                        foreach (string item in items)
                        {
                            MDataColumn mdc = DBTool.GetColumns(item);
                            foreach (MCellStruct ms in mdc)
                            {
                                dt.NewRow(true).Set(0, ms.ColumnName).Set(1, ms.ColumnName).Set(2, item);
                            }
                        }

                    }

                    break;

            }
            if (dt == null)
            {
                dt = MDataTable.CreateFrom(newDic);
                dt.Columns[0].ColumnName = "value";
                dt.Columns[1].ColumnName = "text";
                if (dt.Columns.Count > 2)
                {
                    dt.Columns[2].ColumnName = "parent";
                }
            }
            return dt;
        }
    }
}
