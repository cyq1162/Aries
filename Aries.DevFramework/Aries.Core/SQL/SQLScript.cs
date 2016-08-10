using Aries.Core.Config;
using Aries.Core.DB;
using Aries.Core.Extend;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Text;

namespace Aries.Core.Sql
{
    public static class SqlScript
    {
        /// <summary>
        /// 获取某对应项对应的数据库脚本。
        /// </summary>
        /// <param name="objName">对象名称</param>
        /// <returns></returns>
        internal static string GetGridConfigScript(string objName)
        {
            StringBuilder sb = new StringBuilder();
            MDataTable dt =GridConfig.GetList(objName, GridConfig.SelectType.All);
            if (dt != null)
            {
                dt.Columns.RemoveAt(0);//移除主键
                sb.Append("Delete from Config_Grid where ObjName='" + objName + "'\r\nGo\r\n");
                //创建SQL脚本。
                foreach (var row in dt.Rows)
                {
                    row.TableName = "Config_Grid";
                    sb.AppendLine(GetSQLScript(row, "ObjName", "Field"));

                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获取某对应项对应的数据库脚本。
        /// </summary>
        /// <param name="objName">对象名称</param>
        /// <returns></returns>
        internal static string GetExcelConfigScript(string id)
        {
            StringBuilder sb = new StringBuilder();
            MDataRow row =ExcelConfig.GetExcelRow(id);
            if (row != null)
            {
                row.TableName = TableNames.Config_Excel.ToString();

                sb.AppendLine(GetSQLScript(row, "ExcelID"));
                sb.Append("\r\nGo\r\nDelete from Config_ExcelInfo where ExcelInfoID='" + id + "'\r\nGo\r\n");
                MDataTable dt = ExcelConfig.GetExcelInfo(id);
                if (dt != null)
                {
                    foreach (var item in dt.Rows)
                    {
                        row.TableName = dt.TableName;
                        sb.AppendLine(GetSQLScript(item, "ExcelID"));
                    }
                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 获取SQl脚本
        /// </summary>
        /// <param name="row"></param>
        /// <param name="keys"></param>
        /// <returns></returns>
        public static string GetSQLScript(MDataRow row, params string[] keys)
        {
            DalType dalType = CrossDb.GetDalType(row.TableName);
            string tableName = DBTool.Keyword(row.TableName, dalType);
            string where = string.Empty;
            StringBuilder sb = new StringBuilder();
            //sb.AppendFormat("if not EXISTS (select 1 from {0} where ", tableName);
            //foreach (string key in keys)
            //{
            //    if (where != string.Empty)
            //    {
            //        where += " and ";
            //    }
            //    where +=DBTool.Keyword(key,dalType)+"='" + row[key].ToString() + "'";
            //}
            //sb.Append(where);
            //sb.AppendLine(")\r\nbegin");//Insert

            sb.AppendFormat("insert into {0}(", tableName);//Insert
            string columns = string.Empty;
            foreach (var ct in row.Columns)
            {
                columns += DBTool.Keyword(ct.ColumnName,dalType) + ",";
            }
            sb.Append(columns.TrimEnd(',') + ") \r\n values(");
            columns = string.Empty;
            foreach (var ct in row.Columns)
            {
                if (row[ct.ColumnName].IsNull)
                {
                    columns += "null,";
                }
                else
                {
                    columns += "'" + row[ct.ColumnName].ToString() + "',";
                }
            }
            sb.Append(columns.TrimEnd(',') + ")\r\n");
            //sb.AppendLine("end");
            //sb.AppendLine("else");
            //sb.AppendLine("begin");//Update
            //sb.AppendFormat("update {0} set ", tableName);//Insert 
            //columns = string.Empty;
            //List<string> items = new List<string>();
            //items.AddRange(keys);
            //foreach (var ct in row.Columns)
            //{
            //    if (items.Contains(ct.ColumnName))
            //    {
            //        continue;
            //    }
            //    if (row[ct.ColumnName].IsNull)
            //    {
            //        columns += DBTool.Keyword(ct.ColumnName,dalType)+ "=null,";
            //    }
            //    else
            //    {
            //        columns += DBTool.Keyword(ct.ColumnName,dalType) + "='" + row[ct.ColumnName].ToString() + "',";
            //    }
            //}
            //sb.AppendFormat(columns.TrimEnd(',') + " where {0}\r\n", where);
            //sb.AppendLine("end \r\n");
            return sb.ToString();
        }
    }
}
