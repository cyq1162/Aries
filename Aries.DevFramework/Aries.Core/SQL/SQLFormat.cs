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
            {"notnull","is not Null"},
            {"and","AND"},{"or","OR"}
        };
        public static string Format(string searchList)
        {
            string sql = string.Empty;
            List<SearchPara> sos = JsonHelper.ToList<SearchPara>(searchList);
            if (sos != null && sos.Count > 0)
            {
                sql = BuildSQL(sos);
            }
            return sql;
        }
        private static string BuildSQL(List<SearchPara> sos)
        {
            StringBuilder sql = new StringBuilder();
            string key1 = " {0} {1}", key2 = " {0} {1} {2} {3}";
            if (sos.Count > 1)//条件加括号。
            {
                key1 = " {0} ({1})";
                key2 = " {0} ({1} {2} {3})";
            }
            for (int i = 0; i < sos.Count; i++)
            {
                SearchPara obj = sos[i];
                if (i == 0) { obj.OrAnd = ""; }
                else
                {
                    obj.OrAnd = (obj.OrAnd == "or" ? "or" : "and");
                }
                switch (obj.Pattern.ToLower())
                {
                    case "in":
                        obj.Value = "(" + obj.Value.Trim(')', '(') + ")";
                        break;
                    case "between":
                    case "greater":
                    case "greaterequal":
                    case "less":
                    case "lessEqual":
                    case "likeor":
                        break;
                    case "isnull":
                    case "notnull":
                        obj.Value = "";
                        break;
                    case "like":
                        obj.Value = "'%" + obj.Value + "%'";
                        break;
                    default:
                        obj.Value = "'" + obj.Value + "'";
                        break;
                }
                if (obj.Pattern.ToLower() == "likeor")
                {
                    sql.AppendFormat(key1, obj.OrAnd, obj.Value);
                }
                else
                {
                    sql.AppendFormat(key2, obj.OrAnd, obj.Name, GetOperate(obj.Pattern), obj.Value);
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
                switch (key)
                {
                    case ">":
                    case ">=":
                    case "<":
                    case "<=":
                    case "<>":
                        return key;
                }
                return "=";
            }
        }
        #endregion
    }
    internal class SearchPara
    {
        public string Name
        {
            get;
            set;
        }
        public string Value
        {
            get;
            set;
        }

        public string Pattern
        {
            get;
            set;
        }
        public string OrAnd
        {
            get;
            set;
        }
    }
}
