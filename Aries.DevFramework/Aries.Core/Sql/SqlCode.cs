using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;
using Aries.Core.Auth;
using Aries.Core.Extend;
using Aries.Core.Config;

namespace Aries.Core.Sql
{
    /// <summary>
    /// 操作SQL外置文件类
    /// </summary>
    public partial class SqlCode
    {
        /// <summary>
        /// SQL文件存档路径
        /// </summary>
        public static string path = AppConfig.WebRootPath + "\\App_Data\\SQLCode\\";
        private static Dictionary<string, string> _FileList = null;
        /// <summary>
        /// 获取所有的SQL文件字典
        /// </summary>
        public static Dictionary<string, string> FileList
        {
            get
            {
                if (_FileList == null)
                {
                    _FileList = new Dictionary<string, string>();
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
                                    throw new Exception(key + " " + LangConst.Exist + ":" + item);
                                }
                                _FileList.Add(key, item);
                            }
                        }
                    }
                }
                return _FileList;
            }
            set
            {
                if (_FileList != null)
                {
                    _FileList.Clear();
                    _FileList = null;
                }
            }
        }
        /// <summary>
        /// 处理单个Sql.sql里面的单行SQL语句
        /// </summary>
        /// <param name="path"></param>
        /// <param name="fileList"></param>
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
                            throw new Exception(sqlKey + " " + LangConst.Exist + ":" + path);
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
                if (FileList != null && FileList.ContainsKey(key))
                {
                    string path = FileList[key];
                    return FileExtend.ReadAllText(path);
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
                if (FileList != null && FileList.ContainsKey(key))
                {
                    string path = FileList[key];
                    try
                    {
                        File.WriteAllText(path, code, Encoding.Default);
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
                if (key[0] == '_') { key = key.Substring(1); }
                Dictionary<string, string> fileList = FileList;
                if (fileList.ContainsKey(key))
                {
                    string text = fileList[key];
                    string folder = null;
                    if (text.Contains(":\\"))
                    {
                        folder = text;
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
                    if (key[0] == 'V' && text[0] != '(' && !string.IsNullOrEmpty(folder))//补充语法
                    {
                        //如果文件夹名包含数据库名，则补充数据库前缀。
                        foreach (string name in CrossDb.DbTables.Keys)
                        {
                            if (folder.IndexOf("\\" + name + "\\", StringComparison.OrdinalIgnoreCase) > -1)
                            {
                                text = "(" + text + ") " + name + "." + key;//补充数据库前缀。
                                break;
                            }
                        }

                    }

                    //参数化格式
                    return text;
                }
            }
            return key;
        }
        public static string FormatPara(string sql)
        {
            if (HttpContext.Current == null) { return sql; }//子线程时不处理 
            if (sql.IndexOf("@UserID", StringComparison.OrdinalIgnoreCase) > -1)
            {
                sql = Regex.Replace(sql, "@UserID", UserAuth.UserID.ToString(), RegexOptions.IgnoreCase);
            }
            if (sql.IndexOf("@UserName", StringComparison.OrdinalIgnoreCase) > -1)
            {
                sql = Regex.Replace(sql, "@UserName", UserAuth.UserName, RegexOptions.IgnoreCase);
            }
            if (sql.IndexOf("@FullName", StringComparison.OrdinalIgnoreCase) > -1)
            {
                sql = Regex.Replace(sql, "@FullName", UserAuth.FullName, RegexOptions.IgnoreCase);
            }
            if (sql.IndexOf("@SuperAdminRoleID", StringComparison.OrdinalIgnoreCase) > -1)
            {
                sql = Regex.Replace(sql, "@SuperAdminRoleID", (UserAuth.IsSuperAdmin ? Guid.Empty.ToString() : UserAuth.SuperAdminRoleID), RegexOptions.IgnoreCase);
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
                        //先处理UserAuth，再处理Post的表单
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
}
