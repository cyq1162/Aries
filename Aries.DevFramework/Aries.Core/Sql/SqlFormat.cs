﻿using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data.Tool;
using Aries.Core.Helper;
using System.Web;
using CYQ.Data.Json;
namespace Aries.Core.Sql
{
    /// <summary>
    /// 搜索条件格式化。(从Json格式化成sql语句）
    /// </summary>
    public static class SqlFormat
    {
        public static List<SearchPara> SearchParaList
        {
            get
            {
                string search =WebHelper.Query<string>("sys_search");
                if (string.IsNullOrEmpty(search))
                {
                    return null;
                }
                return JsonHelper.ToList<SearchPara>(HttpContext.Current.Server.HtmlDecode(search));
            }
        }
        #region Build SQL Contents
        private static Dictionary<string, string> sqlDic = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            {"custom","custom"},
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
        //internal static string Format(string searchList)
        //{
        //    string sql = string.Empty;
        //    if (JsonHelper.IsJson(searchList))
        //    {
        //        List<SearchPara> sos = JsonHelper.ToList<SearchPara>(searchList);
        //        if (sos != null && sos.Count > 0)
        //        {
        //            sql = BuildSQL(sos);
        //        }
        //        return sql;
        //    }
        //    return searchList;
        //}
        public static string BuildSQL(List<SearchPara> sos)
        {
            if (sos == null || sos.Count == 0)
            {
                return "";
            }
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
                string pattern = GetOperate(obj.Pattern).ToLower();
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
                    case "custom":
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
                if (pattern == "custom")//自定义sql
                {
                    sql.AppendFormat(key1, obj.OrAnd, obj.Value);
                }
                else if (pattern == "likeor")
                {
                    string[] items = obj.Value.Split(',');
                    StringBuilder sb = new StringBuilder();
                    for (int j = 0; j < items.Length; j++)
                    {
                        sb.Append(obj.Name + " like '%" + items[j] + "%'");
                        if (j < items.Length - 1)
                        {
                            sb.Append(" or ");
                        }
                    }
                    sql.AppendFormat(key1, obj.OrAnd, sb.ToString());
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
            if (string.IsNullOrEmpty(key)) { return "="; }
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
    public class SearchPara
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
