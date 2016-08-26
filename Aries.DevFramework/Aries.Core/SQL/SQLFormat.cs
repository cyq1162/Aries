using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data.Tool;

namespace Aries.Core.Sql
{
    /// <summary>
    /// 搜索条件格式化。(从Json格式化成sql语句）
    /// </summary>
    internal static class SqlFormat
    {
        #region Build SQL Contents
        private static Dictionary<string, string> sqlDic = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            {"like","LIKE"},{"between","between"},
            {"equal","="},{"greater",">"},{"greaterequal",">="},
            {"less","<"},{"lessEqual","<="},
            {"in","IN"},{"datetimepoint",""},{"notequal","<>"},
            {"isnull","is Null"},
            {"and","AND"},{"or","OR"}
        };
        public static string Format(string searchList)
        {
            string sql = string.Empty;
            List<SearchItem> sos = JsonHelper.ToList<SearchItem>(searchList);
            if (sos != null && sos.Count > 0)
            {
                sql = BuildSQL(sos);
            }
            return sql;
        }
        private static string BuildSQL(List<SearchItem> sos)
        {
            StringBuilder sql = new StringBuilder(" 1=1 ");
            foreach (SearchItem obj in sos)
            {
                //处理简单查询
                if (string.IsNullOrEmpty(obj.ParamOrAnd))
                {

                    switch (obj.ParamPattern.ToLower())
                    {
                        case "in":
                        case "between":
                        case "greater":
                        case "greaterequal":
                        case "less":
                        case "lessEqual":
                        case "likeor":
                        case "isnull":
                            break;
                        case "like":
                            obj.ParamValue = "'%" + obj.ParamValue + "%'";
                            break;
                        default:
                            obj.ParamValue = "'" + obj.ParamValue + "'";
                            break;
                    }
                    if (obj.ParamPattern.ToLower() == "likeor")
                    {
                        sql.AppendFormat(" AND ({0}) ", obj.ParamValue);
                    }
                    else
                    {
                        sql.AppendFormat(" AND {0} {1} {2}", obj.ParamName, GetOperate(obj.ParamPattern), obj.ParamValue);
                    }

                }
                else
                {
                    if (obj.ParamPattern.ToLower() == "like")
                    {
                        sql.AppendFormat(" {3} {0} {1} '%{2}%' ", obj.ParamName, GetOperate(obj.ParamPattern), obj.ParamValue, obj.ParamOrAnd);
                    }
                    else if (obj.ParamPattern.ToLower() == "isnull")
                    {
                        sql.AppendFormat(" {3} {0} {1} {2} ", obj.ParamName, GetOperate(obj.ParamPattern), obj.ParamValue, obj.ParamOrAnd);
                    }
                    else
                    {
                        sql.AppendFormat(" {3} {0} {1} '{2}'", obj.ParamName, GetOperate(obj.ParamPattern), obj.ParamValue, obj.ParamOrAnd);
                    }
                }
            }
            return sql.ToString();
        }

        private static string GetOperate(string key)
        {
            if (sqlDic.ContainsKey(key))
            {
                return sqlDic[key];
            }
            else
            {
                return "=";
            }
        }
        #endregion
    }
    internal class SearchItem
    {
        public string ParamName
        {
            get;
            set;
        }
        public string ParamValue
        {
            get;
            set;
        }

        public string ParamPattern
        {
            get;
            set;
        }
        public string ParamOrAnd
        {
            get;
            set;
        }
        public string GroupName
        {
            get;
            set;
        }

    }
}
