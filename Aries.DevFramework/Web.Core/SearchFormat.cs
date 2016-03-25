using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data.Tool;

namespace Web.Core
{
    /// <summary>
    /// 搜索条件格式化。(从Json格式化成sql语句）
    /// </summary>
    public static class SearchFormat
    {
        #region Build SQL Contents
        static Dictionary<string, string> dic_operte = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase)
        {
            {"like","LIKE"},{"between","between"},
            {"equal","="},{"greater",">"},{"greaterequal",">="},
            {"less","<"},{"lessEqual","<="},
            {"in","IN"},{"datetimepoint",""},{"notequal","<>"},
            {"isnull","is Null"},
            {"and","AND"},{"or","OR"}
        };
        public static string Format(string searchList, string appendWhere)
        {
            List<SearchItem> sos = JsonHelper.ToList<SearchItem>(searchList);
            var sql = BuildSQL(sos, appendWhere);
            return sql;
        }
        private static string BuildSQL(List<SearchItem> sos, string appendWhere)
        {
            StringBuilder sql = new StringBuilder(" 1=1 ");
            foreach (SearchItem obj in sos)
            {
                //处理简单查询
                if (string.IsNullOrEmpty(obj.ParamOrAnd))
                {

                    switch (obj.ParamPatten.ToLower())
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
                    if (obj.ParamPatten.ToLower() == "likeor")
                    {
                        sql.AppendFormat(" AND ({0}) ", obj.ParamValue);
                    }
                    else
                    {
                        sql.AppendFormat(" AND {0} {1} {2}", obj.ParamName, GetOperate(obj.ParamPatten.ToLower()), obj.ParamValue);
                    }

                }
                else
                {
                    if (obj.ParamPatten.ToLower() == "like")
                    {
                        sql.AppendFormat(" {3} {0} {1} '%{2}%' ", obj.ParamName, GetOperate(obj.ParamPatten.ToLower()), obj.ParamValue, obj.ParamOrAnd);
                    }
                    else if (obj.ParamPatten.ToLower() == "isnull")
                    {
                        sql.AppendFormat(" {3} {0} {1} {2} ", obj.ParamName, GetOperate(obj.ParamPatten.ToLower()), obj.ParamValue, obj.ParamOrAnd);
                    }
                    else
                    {
                        sql.AppendFormat(" {3} {0} {1} '{2}'", obj.ParamName, GetOperate(obj.ParamPatten.ToLower()), obj.ParamValue, obj.ParamOrAnd);
                    }
                }
            }
            sql.Append(appendWhere);
            return sql.ToString();
        }

        private static string GetOperate(string key)
        {
            if (dic_operte.ContainsKey(key))
            {
                return dic_operte[key];
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

        public string ParamPatten
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
