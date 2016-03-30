using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;

namespace Web.Core
{
    /// <summary>
    /// 操作SQL外置文件类
    /// </summary>
    public partial class SQLCode
    {
        private static string path = AppDomain.CurrentDomain.BaseDirectory + "\\App_Data\\SQLCode\\";

        /// <summary>
        /// 获取所有的SQL文件字典
        /// </summary>
        public static Dictionary<string, string> FileList
        {
            get
            {
                Dictionary<string, string> _FileList = new Dictionary<string, string>();
                string[] files = Directory.GetFiles(path, "*.sql", SearchOption.AllDirectories);
                if (files != null && files.Length > 0)
                {
                    string key = string.Empty;
                    foreach (string item in files)
                    {
                        key = Path.GetFileNameWithoutExtension(item);
                        if (key.StartsWith("Sql"))
                        {
                            DealSql(item, _FileList);
                        }
                        else
                        {
                            if (_FileList.ContainsKey(key))
                            {
                                throw new Exception(key + " 已存在！:" + item);
                            }
                            _FileList.Add(key, item);
                        }
                    }
                }
                return _FileList;
            }
        }
        private static void DealSql(string path, Dictionary<string, string> fileList)
        {
            string[] sqlItems = File.ReadAllLines(path);
            if (sqlItems != null)
            {
                string text = string.Empty;
                string sqlKey = "", sqlValue = "";
                foreach (string sqlText in sqlItems)
                {
                    text = sqlText.Trim();
                    if (text.StartsWith("--") || text.StartsWith("#") || text.StartsWith("//"))
                    {
                        continue;
                    }
                    int index = text.IndexOf('=');
                    if (index > 0)
                    {
                        sqlKey = text.Substring(0, index).Trim();
                        sqlValue = text.Substring(index + 1).Trim();
                        if (fileList.ContainsKey(sqlKey))
                        {
                            throw new Exception(sqlKey + " 已存在！:" + path);
                        }
                        fileList.Add(sqlKey, sqlValue);
                    }
                }
            }
        }

        /// <summary>
        /// 根据名称获取原始的SQL（或视图）语句
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        internal static string GetSourceCode(string key)
        {
            if (!string.IsNullOrEmpty(key))
            {
                string[] files = Directory.GetFiles(path, key+".sql", SearchOption.AllDirectories);
                if (files != null && files.Length > 0)
                {
                    return FileExtend.ReadAllText(files[0]);
                }
            }
            return string.Empty;
        }
        /// <summary>
        /// 根据名称保存原始的SQL（或视图）语句
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        internal static bool SaveSourceCode(string key, string code, out string msg)
        {
            msg = string.Empty;
            if (!string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(code))
            {
                string[] files = Directory.GetFiles(path, key + ".sql", SearchOption.AllDirectories);
                if (files != null && files.Length > 0)
                {
                    try
                    {
                        File.WriteAllText(files[0], code, Encoding.Default);
                        return true;
                    }
                    catch (Exception err)
                    {
                        msg = err.Message;
                        Log.WriteLogToTxt(err);
                    }
                  
                }
            }
            return false;
        }
        /// <summary>
        /// 根据名称获取SQL（或视图）语句 （已经处理过注释，和参数替换的内容）
        /// </summary>
        /// <param name="key"></param>
        /// <param name="stringFormatValues">如果需要格式化大括号参数</param>
        /// <returns></returns>
        public static string GetCode(string key, params object[] stringFormatValues)
        {
            if (!string.IsNullOrEmpty(key))
            {
                Dictionary<string, string> fileList = FileList;
                if (fileList.ContainsKey(key))
                {
                    string text = fileList[key];
                   
                    if (text.Contains(":\\"))
                    {
                        text = FileExtend.ReadAllText(text);
                        int index = text.LastIndexOf("/*");
                        if (index > -1)//去掉注释
                        {
                            text = Regex.Replace(text, @"/\*[.\s\S]*?\*/", string.Empty, RegexOptions.IgnoreCase);
                        }
                    }
                    text = text.Trim();
                    if (stringFormatValues.Length > 0)
                    {
                        text = string.Format(text, stringFormatValues);
                    }
                    text = FormatPara(text.Trim());//去掉空格
                    if (key[0] == 'V' && text[0] != '(')//补充语法
                    {
                        text = "(" + text + ") " + key;
                    }

                    //参数化格式
                    return text;
                }
            }
            return key;
        }
        public static string FormatPara(string sql)
        {
            if (sql.IndexOf("@UserID") > -1)
            {
                sql = sql.Replace("@UserID", UserAuth.UserID.ToString());
            }
            if (sql.IndexOf("@UserName") > -1)
            {
                sql = sql.Replace("@UserName", UserAuth.UserName.ToString());
            }
            if (sql.IndexOf("@FullName") > -1)
            {
                sql = sql.Replace("@FullName", UserAuth.FullName);
            }

            string key = null;
            //自动配置其它属性
            if (sql.IndexOf('@') > -1)
            {
                string pattern = @"(@[\w^\u4e00-\u9fa5]+)";
                MatchCollection mt = Regex.Matches(sql, pattern);
                foreach (Match item in mt)
                {
                    if (!string.IsNullOrEmpty(item.Value) && item.Value.Length > 1)
                    {
                        key = item.Value.Substring(1);
                        string value = HttpContext.Current.Request[key];
                        if (!string.IsNullOrEmpty(value))
                        {
                            sql = sql.Replace(item.Value, value);
                        }
                    }
                }
            }
            return sql.Trim();//待写。
        }
    }
    public partial class SQLCode
    {
        /// <summary>
        /// 获取SQl脚本
        /// </summary>
        /// <param name="row"></param>
        /// <param name="keys"></param>
        /// <returns></returns>
        public static string GetSQLScript(MDataRow row, params string[] keys)
        {
            string where = string.Empty;
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("if not EXISTS (select 1 from [{0}] where ", row.TableName);
            foreach (string key in keys)
            {
                if (where != string.Empty)
                {
                    where += " and ";
                }
                where += "[" + key + "]='" + row[key].ToString() + "'";
            }
            sb.Append(where);
            sb.AppendLine(")\r\nbegin");//Insert

            sb.AppendFormat("insert into [{0}](", row.TableName);//Insert
            string columns = string.Empty;
            foreach (var ct in row.Columns)
            {
                columns += "[" + ct.ColumnName + "],";
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
            sb.AppendLine("end");
            sb.AppendLine("else");
            sb.AppendLine("begin");//Update
            sb.AppendFormat("update [{0}] set ", row.TableName);//Insert 
            columns = string.Empty;
            List<string> items = new List<string>();
            items.AddRange(keys);
            foreach (var ct in row.Columns)
            {
                if (items.Contains(ct.ColumnName))
                {
                    continue;
                }
                if (row[ct.ColumnName].IsNull)
                {
                    columns += "[" + ct.ColumnName + "]=null,";
                }
                else
                {
                    columns += "[" + ct.ColumnName + "]='" + row[ct.ColumnName].ToString() + "',";
                }
            }
            sb.AppendFormat(columns.TrimEnd(',') + " where {0}\r\n", where);
            sb.AppendLine("end \r\n");
            return sb.ToString();
        }
    }
}
