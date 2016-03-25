using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
namespace Web.Core
{
    /// <summary>
    /// 下拉框集合
    /// </summary>
    internal class Combobox
    {
        /// <summary>
        /// 读取数据库所有表
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static MDataTable Get(string key)
        {
            MDataTable dt = null;
            switch (key)
            {
                case "C_SYS_AllTable":
                    Dictionary<string, string> dic = DBTool.GetTables(AppConfig.DB.DefaultConn);
                    SortedDictionary<string, string> newDic = new SortedDictionary<string, string>();
                    foreach (var item in dic)
                    {
                        newDic.Add(item.Key, item.Key);
                    }
                    dt = MDataTable.CreateFrom(newDic);
                    break;
            }
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
