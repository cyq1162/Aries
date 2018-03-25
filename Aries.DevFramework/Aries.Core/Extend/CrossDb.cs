using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using CYQ.Data;
using System.Configuration;
using CYQ.Data.Tool;
using System.Text.RegularExpressions;
using CYQ.Data.Cache;
using System.IO;
using Aries.Core.Sql;
using System.Threading;
using Aries.Core.DB;
using CYQ.Data.Table;

namespace Aries.Core.Extend
{
    /// <summary>
    /// 跨库处理
    /// </summary>
    public static partial class CrossDb
    {
        #region 预处理所有表结构缓存
        private static bool isFirstLoad = false;
        private static readonly object obj = new object();
        private static FileSystemWatcher fyw = new FileSystemWatcher(SqlCode.path, "*.sql");
        internal static void PreLoadAllDBSchemeToCache()
        {
            if (!isFirstLoad)
            {
                isFirstLoad = true;
                lock (obj)
                {
                    if (isFirstLoad)
                    {
                        //DealUpdateSql();
                        //处理单表
                        foreach (ConnectionStringSettings item in ConfigurationManager.ConnectionStrings)
                        {
                            string name = item.Name.ToLower();
                            if (!string.IsNullOrEmpty(name) && name.EndsWith("conn"))
                            {
                                try
                                {
                                    CacheManage.PreLoadDBSchemaToCache(name, true);
                                }
                                catch
                                {

                                }
                               
                            }
                        }
                        ThreadBreak.AddGlobalThread(new ParameterizedThreadStart(LoadViewSchema));
                        //处理视图文件
                        fyw.EnableRaisingEvents = true;
                        fyw.Changed += fyw_Changed;
                    }
                }
            }
        }

        static void fyw_Changed(object sender, FileSystemEventArgs e)
        {
            SqlCode.FileList = null;
        }
        static void LoadViewSchema(object para)
        {
            try
            {
                Dictionary<string, string> fileList = SqlCode.FileList;
                if (fileList != null && fileList.Count > 0)
                {
                    foreach (KeyValuePair<string, string> item in fileList)
                    {
                        if (item.Key.StartsWith("V_"))//视图文件
                        {
                            string sql = "";
                            if (item.Value.Contains(":\\"))//存档的是文件路径
                            {
                                sql = SqlCode.GetCode(item.Key);
                            }
                            else
                            {
                                sql = item.Value;
                            }
                            if (sql.IndexOf('@') == -1)//仅处理无参数的。
                            {
                                DBTool.GetColumns(sql, GetConn(sql));
                            }
                        }
                    }

                }
            }
            catch
            {

            }
        }
        #endregion

        public static object GetEnum(string objName)
        {
            if (objName == null || DbTables.Count < 2)
            {
                return objName;
            }
            int index = objName.LastIndexOf(')');
            if (index == -1)//单表。
            {
                if (objName.IndexOf('.') > -1) { return objName; }
                string dbName = GetDBName(objName);
                if (dbName != "")
                {
                    return dbName + "." + objName;
                }
            }
            else // 自定义视图语句
            {
                string tName = GetTableNameFromObjName(objName);
                if (tName != "")
                {
                    string dbName = GetDBName(tName);
                    if (dbName != "")
                    {
                        return objName.Substring(0, index + 1) + " " + dbName + "." + objName.Substring(index + 1).Trim();
                    }
                }
            }
            return objName;
        }

        private static Dictionary<string, string> _ConnDic = new Dictionary<string, string>();
        private static Dictionary<string, DalType> _DbTypeDic = new Dictionary<string, DalType>();
        private static Dictionary<string, Dictionary<string, string>> _DbTablesDic = new Dictionary<string, Dictionary<string, string>>();
        private static object lockObj = new object();
        private static string badConn = string.Empty;
        /// <summary>
        /// 所有数据库的表
        /// </summary>
        public static Dictionary<string, Dictionary<string, string>> DbTables
        {
            get
            {
                if (_DbTablesDic.Count == 0)
                {
                    lock (lockObj)
                    {
                        if (_DbTablesDic.Count == 0)
                        {
                            foreach (ConnectionStringSettings item in ConfigurationManager.ConnectionStrings)
                            {
                                string name = item.Name.ToLower();
                                if (!string.IsNullOrEmpty(name) && name.EndsWith("conn") && !badConn.Contains("," + name))
                                {
                                    if (DBTool.TestConn(name))
                                    {
                                        string dbName = string.Empty;
                                        Dictionary<string, string> dic = DBTool.GetTables(name, out dbName);
                                        if (dic != null && dic.Count > 0 && !_DbTablesDic.ContainsKey(dbName))
                                        {
                                            _DbTablesDic.Add(dbName, dic);
                                            _DbTypeDic.Add(dbName, DBTool.GetDalType(name));
                                            _ConnDic.Add(dbName, name);
                                        }
                                    }
                                    else
                                    {
                                        badConn = "," + name;
                                    }
                                }
                            }
                        }
                    }
                }
                return _DbTablesDic;
            }
        }

        /// <summary>
        /// 获得数据库名称
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <returns></returns>
        public static string GetDBName(string tableName)
        {
            foreach (KeyValuePair<string, Dictionary<string, string>> item in DbTables)
            {
                if (item.Value.ContainsKey(tableName))
                {
                    return item.Key;
                }
            }
            //找不到时，可能是视图，根据数据库类型匹配第一个可能的数据库
            foreach (KeyValuePair<string,DalType> item in _DbTypeDic)
            {
                switch (item.Value)
                {
                    case DalType.Txt:
                    case DalType.Xml:
                        continue;
                    default:
                        return item.Key;
                }
            }
            return "";
        }
        /// <summary>
        /// 获得数据库链接
        /// </summary>
        /// <param name="sqlOrTableName">表名或sql</param>
        /// <returns></returns>
        public static string GetConn(string sqlOrTableName)
        {
            string tableName = GetTableNameFromObjName(sqlOrTableName);
            string dbName = GetDBName(tableName);
            if (!string.IsNullOrEmpty(dbName) && _ConnDic.ContainsKey(dbName))
            {
                return _ConnDic[dbName];
            }
            return AppConfig.DB.DefaultConn;
        }
        /// <summary>
        /// 获得数据库类型
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <returns></returns>
        public static DalType GetDalType(string tableName)
        {
            string dbName = GetDBName(tableName);
            if (!string.IsNullOrEmpty(dbName) && _DbTypeDic.ContainsKey(dbName))
            {
                return _DbTypeDic[dbName];
            }
            return DBTool.GetDalType(AppConfig.DB.DefaultConn);
        }
        internal static string GetDescription(string tableName)
        {
            foreach (KeyValuePair<string, Dictionary<string, string>> item in DbTables)
            {
                if (item.Value.ContainsKey(tableName))
                {
                    return item.Value[tableName];
                }
            }
            return "";
        }
        private static string GetTableNameFromObjName(string objName)
        {
            int index = objName.LastIndexOf(')');
            if (index > -1)
            {
                string vName = objName.Substring(index + 1).Trim(' ');// v_xxx
                if (vName.IndexOf('.') == -1) // xxx.v_xxx 的不处理
                {
                    return GetTableNameFromSql(objName);
                }
                return objName;
            }
            return GetTableNameFromSql(objName);

        }
        private static string GetTableNameFromSql(string sql)
        {
            //获取原始表名
            string[] items = sql.Replace("\r\n"," ").Split(' ');
            if (items.Length == 1) { return sql; }//单表名
            if (items.Length > 3) // 总是包含空格的select * from xxx
            {
                bool startFrom = false;
                foreach (string item in items)
                {
                    if (!string.IsNullOrEmpty(item))
                    {
                        if (item.ToLower() == "from")
                        {
                            startFrom = true;
                        }
                        else if (startFrom)
                        {
                            if (item[0] == '(' || item.IndexOf('.') > -1) { startFrom = false; }
                            else
                            {
                                return item;
                            }
                        }
                    }
                }
                return "";
            }
            return sql;
        }
    }

    public static partial class CrossDb
    {
 
    }
}
