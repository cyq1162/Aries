﻿using System;
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
using CYQ.Data.Tool;

namespace Aries.Core.Sql
{
    /// <summary>
    /// 操作SQL外置文件类
    /// </summary>
    public static partial class SqlCode
    {
        /// <summary>
        /// SQL文件存档路径
        /// </summary>
        public static string path = AppConfig.WebRootPath + "App_Data/SqlCode/";
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
                    _FileList = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
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
        public static string Get(string key)
        {
            if (!string.IsNullOrEmpty(key))
            {
                string file = key.Replace(".sql", "") + ".sql";
                string[] files = Directory.GetFiles(SqlCode.path, file, SearchOption.AllDirectories);
                if (files != null && files.Length > 0)
                {
                    return IOHelper.ReadAllText(files[0]);
                }

                if (FileList != null && FileList.ContainsKey(key))
                {
                    string path = FileList[key];
                    return IOHelper.ReadAllText(path);
                }
            }
            return string.Empty;
        }
        /// <summary>
        /// 根据名称保存原始的SQL（或视图）语句
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static bool Save(string key, string code, out string msg)
        {
            msg = string.Empty;
            if (!string.IsNullOrEmpty(key) && !string.IsNullOrEmpty(code))
            {
                string savePath = string.Empty;
                string file = key.Replace(".sql", "") + ".sql";
                string[] files = Directory.GetFiles(SqlCode.path, file, SearchOption.AllDirectories);
                if (files != null && files.Length > 0)
                {
                    savePath = files[0];
                }

                else if (FileList != null && FileList.ContainsKey(key))
                {
                    savePath = FileList[key];
                }
                if (!string.IsNullOrEmpty(savePath))
                {
                    try
                    {
                        IOHelper.Write(savePath, code);
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
                    if (text.Contains(":\\") || text.StartsWith("/"))
                    {
                        folder = text;
                        string[] lines = IOHelper.ReadAllLines(text);
                        StringBuilder sb = new StringBuilder();
                        foreach (string line in lines)
                        {
                            if (line.StartsWith("//") || line.StartsWith("--") || line.StartsWith("#"))
                            {
                                continue;
                            }
                            sb.AppendLine(line);
                        }
                        text = sb.ToString();
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
                    text = FormatPara(text.Replace("\r\n", " ").Trim());//去掉空格
                    if (key[0] == 'V' && text[0] != '(' && !string.IsNullOrEmpty(folder))//补充语法
                    {
                        text = "(" + text + ") ";
                        folder = folder.Replace("/", "\\");//统一格式。
                        //如果文件夹名包含数据库名，则补充数据库前缀。
                        foreach (var item in DBTool.DataBases)
                        {
                            if (folder.IndexOf("\\" + item.Value.DataBaseName + "\\", StringComparison.OrdinalIgnoreCase) > -1)
                            {
                                key = item.Value.DataBaseName + "." + key;//补充数据库前缀。
                                break;
                            }
                        }
                        text = text + key;
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
                sql = Regex.Replace(sql, "@SuperAdminRoleID", (UserAuth.IsSuperAdmin ? UserAuth.SuperAdminRoleID : Guid.Empty.ToString()), RegexOptions.IgnoreCase);
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

        public static bool Create(string key, string folderPath, out string msg)
        {
            msg = "";
            if (!string.IsNullOrEmpty(key))
            {
                string folder = path + folderPath;
                if (Directory.Exists(folder))
                {
                    try
                    {
                        if (key.EndsWith(".sql"))
                        {
                            File.WriteAllText(folder + key, "//sql for aries", Encoding.Default);
                        }
                        else if (!key.Contains("."))
                        {
                            Directory.CreateDirectory(folder + key);
                        }
                        _FileList = null;//清空缓存。
                        return true;

                    }
                    catch (Exception err)
                    {
                        msg = err.Message;
                        return false;
                    }
                }
            }
            return true;
        }

        public static bool Delete(string key, out string msg)
        {
            msg = string.Empty;
            if (!string.IsNullOrEmpty(key))
            {
                string[] files = Directory.GetFileSystemEntries(path, key, SearchOption.AllDirectories);
                if (files != null && files.Length > 0)
                {
                    string filePath = files[0];
                    try
                    {
                        if (String.IsNullOrEmpty(Path.GetExtension(filePath)))//文件夹
                        {
                            files = Directory.GetFiles(filePath);
                            if (files != null && files.Length > 0)
                            {
                                msg = LangConst.HasFiles;
                                return false;
                            }
                            Directory.Delete(filePath);

                        }
                        else
                        {
                            File.Delete(filePath);
                        }
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
    }
    public static partial class SqlCode
    {
        //文件变更
        private static FileSystemWatcher fyw = new FileSystemWatcher(path, "*.sql");
        static SqlCode()
        {
            if (!fyw.EnableRaisingEvents)
            {
                fyw.EnableRaisingEvents = true;
                fyw.IncludeSubdirectories = true;
                fyw.Changed += fyw_Changed;
            }
        }
        static void fyw_Changed(object sender, FileSystemEventArgs e)
        {
            SqlCode.FileList = null;
        }
    }
}
