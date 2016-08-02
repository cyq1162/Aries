using CYQ.Data;
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;

namespace Aries.Core
{
    /// <summary>
    /// 反射Logic类
    /// </summary>
    static class InvokeLogic
    {
        private static string _DllName;
        public static string DllName
        {
            get
            {
                if (string.IsNullOrEmpty(_DllName))
                {
                    _DllName = AppConfig.GetApp("Aries.Logic", "Aries.Logic");
                }
                return _DllName;
            }
        }
        private static Assembly _Assembly;
        public static Assembly GetAssembly()
        {
            if (_Assembly == null)
            {
                try
                {
                    _Assembly = Assembly.Load(DllName);
                }
                catch (Exception err)
                {
                    Log.WriteLogToTxt(err);
                }
            }
            return _Assembly;
        }
        public static string GetClassFullName(string className)
        {
            return DllName + "." + className;
        }

        private static Dictionary<string, Type> _ClassNameDic = new Dictionary<string, Type>(StringComparer.OrdinalIgnoreCase);
        private static Dictionary<string, Type> ClassNameDic
        {
            get
            {
                if (_ClassNameDic.Count == 0)
                {
                    Assembly ass = GetAssembly();
                    Type[] typeList = ass.GetExportedTypes();
                    foreach (Type type in typeList)
                    {
                        if (type.BaseType != null && type.BaseType.Name == "AjaxBase")
                        {
                            if (type.Name == "DefaultHandler")
                            {
                                _ClassNameDic.Add("DefaultHandler", type);
                            }
                            else
                            {
                                string[] names = type.FullName.ToLower().Split('.');
                                if (names.Length > 1)
                                {
                                    string className = names[names.Length - 1];
                                    if (className.EndsWith("handler"))
                                    {
                                        className = className.Substring(0, className.Length - 7);//不存Handler
                                    }
                                    _ClassNameDic.Add(names[names.Length - 2] + "." + className, type);
                                }
                            }
                        }
                    }
                }
                return _ClassNameDic;
            }
        }
        /// <summary>
        /// 通过XXX.className类名获得对应的逻辑类
        /// </summary>
        /// <param name="className"></param>
        /// <returns></returns>
        public static Type GetType(string className)
        {
            if (ClassNameDic.ContainsKey(className)) //1：完整匹配Ajax.ajaxdefaultlogic
            {
                return ClassNameDic[className];
            }
            else
            {
                string[] items = className.Split('.');
                className = items[items.Length - 1];
                //if (ClassNameDic.ContainsKey(className)) //2：完整匹配ajaxdefaultlogic
                //{
                //    return ClassNameDic[className];
                //}
                string OkKey = string.Empty;
                className = "." + className;
                string path = "." + items[0];
                foreach (string key in ClassNameDic.Keys) //2：完整匹配ajaxdefaultlogic
                {
                    if (key.EndsWith(className))
                    {
                        return ClassNameDic[key];
                    }
                    else if (key.EndsWith(path))//匹配 目录
                    {
                        OkKey = key;
                    }
                }
                if (!string.IsNullOrEmpty(OkKey))//3：匹配 目录
                {
                    return ClassNameDic[OkKey];
                }
            }
            if (ClassNameDic.ContainsKey("DefaultHandler"))
            {
                return ClassNameDic["DefaultHandler"];
            }
            return null;
        }
    }
}
