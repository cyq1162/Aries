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
            {"like","like"},
            {"likeor","likeor"},
            {"between","between"},
            {"equal","="},
            {"greater",">"},
            {"greaterequal",">="},
            {"less","<"},
            {"lessEqual","<="},
            {"in","in"},
            {"notequal","<>"},
            {"isnull","is null"},
            {"notnull","is not null"},
            {"and","and"},
            {"or","or"}
        };
        public static string Format(string searchList)
        {
            string sql = string.Empty;
            if (JsonHelper.IsJson(searchList))
            {
                List<SearchPara> sos = JsonHelper.ToList<SearchPara>(searchList);
                if (sos != null && sos.Count > 0)
                {
                    sql = BuildSQL(sos);
                }
                return sql;
            }
            return searchList;
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
                if (!CheckSafe(obj))
                {
                    return "1=2";
                }
                if (i == 0) { obj.OrAnd = ""; }
                else
                {
                    obj.OrAnd = (obj.OrAnd == "or" ? "or" : "and");
                }
                string pattern = GetOperate(obj.Pattern);
                switch (pattern)
                {
                    case "in":
                        obj.Value = "(" + obj.Value.Trim(')', '(') + ")";
                        break;
                    case "between":
                    case ">":
                    case ">=":
                    case "<":
                    case "<=":
                    case "likeor":
                        break;
                    case "is null":
                    case "is not null":
                        obj.Value = "";
                        break;
                    case "like":
                        obj.Value = "'%" + obj.Value.Trim('\'') + "%'";
                        break;
                    case "=":
                    default:
                        obj.Value = "'" + obj.Value.Trim('\'') + "'";
                        break;
                }
                if (obj.Pattern.ToLower() == "likeor")//自定义sql
                {
                    sql.AppendFormat(key1, obj.OrAnd, obj.Value);
                }
                else
                {
                    sql.AppendFormat(key2, obj.OrAnd, obj.Name, pattern, obj.Value);
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
        private static bool CheckSafe(SearchPara para)
        {
            //名称不能包含空格
            if (string.IsNullOrEmpty(para.Name) || para.Name.Trim().IndexOfAny(new char[] { ' ' }) > -1)
            {
                return false;
            }
            if (!string.IsNullOrEmpty(para.Pattern) && para.Pattern.ToLower() == "likeor")
            {
                string value = Convert.ToString(para.Value).ToLower();
                if (string.IsNullOrEmpty(value) || value.Contains("--") || (value.Contains("select") && value.Contains("from")))//禁止子查询
                {
                    return false;
                }
            }
            else if (string.IsNullOrEmpty(para.Value) || para.Value.Trim().IndexOfAny(new char[] { ' ', '%' }) > -1)
            {
                return false;
            }
            return true;
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
