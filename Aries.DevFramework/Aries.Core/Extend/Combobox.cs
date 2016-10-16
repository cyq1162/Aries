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
                        
                        string[] items = filter.Split(',');

                        if (items.Length == 1 && items[0].EndsWith("Conn"))
                        {
                            if (CrossDb.DbTables.ContainsKey(filter))
                            {
                                foreach (var item in CrossDb.DbTables[filter])
                                {
                                    newDic.Add(item.Key, item.Key);
                                }
                            }
                        }
                        else
                        {
                            foreach (string item in items)
                            {
                                newDic.Add(item, item);
                            }
                        }
                    }
                    else
                    {
                        foreach (var tableDic in CrossDb.DbTables)
                        {
                            foreach (var item in tableDic.Value)
                            {
                                newDic.Add(item.Key, item.Key);
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
                            MDataColumn mdc = DBTool.GetColumns(CrossDb.GetEnum(item));
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
