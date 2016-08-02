using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
namespace Aries.Core
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
                    if (!string.IsNullOrEmpty(filter))
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
                        MDataColumn mdc = DBTool.GetColumns(CrossDb.GetEnum(filter));
                        foreach (var item in mdc)
                        {
                            newDic.Add(item.ColumnName, item.ColumnName);
                        }
                    }
                    break;

            }
            dt = MDataTable.CreateFrom(newDic);
            if (dt != null)
            {
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
