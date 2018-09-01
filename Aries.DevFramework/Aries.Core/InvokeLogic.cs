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
        internal const string Controller = "Controller";
        internal const string Default = "Default";
        internal const string DefaultController = "DefaultController";
        internal const string AriesController = "Aries.Core.Controller";

        #region GetAssembly
        private static string _DllNames;
        /// <summary>
        /// Dll名称，多个则用，号分隔
        /// </summary>
        public static string DllNames
        {
            get
            {
                if (string.IsNullOrEmpty(_DllNames))
                {
                    _DllNames = AppConfig.GetApp("Aries.Controllers", "Aries.Controllers");
                }
                return _DllNames;
            }
        }
        private static List<Assembly> _Assemblys;
        public static List<Assembly> GetAssemblys()
        {
            if (_Assemblys == null)
            {
                string[] dllItems = DllNames.Split(',');
                _Assemblys = new List<Assembly>(dllItems.Length);
                foreach (string item in dllItems)
                {
                    _Assemblys.Add(Assembly.Load(item)); // 可直接抛异常。
                }
                //try
                //{
                //_Assemblys = 
                //}
                //catch (Exception err)
                //{
                //    Log.WriteLogToTxt(err);
                //}
            }
            return _Assemblys;
        }
        public static string GetClassFullName(string className)
        {
            return DllNames + "." + className;
        }
        #endregion

        #region GetControllers
        private static Dictionary<string, Type> _AriesControllers = new Dictionary<string, Type>(StringComparer.OrdinalIgnoreCase);
        private static readonly object objLock = new object();
        /// <summary>
        /// 获取控制器
        /// </summary>
        public static Dictionary<string, Type> GetControllers()
        {
            if (_AriesControllers.Count == 0)
            {
                lock (objLock)
                {
                    if (_AriesControllers.Count == 0)
                    {
                        List<Assembly> assList = GetAssemblys();
                        if (assList == null)
                        {
                            throw new Exception("Please make sure web.config'appSetting <add key=\"Aries.Controllers\" value=\"YourControllerProjectName\") is right!");
                        }
                        foreach (Assembly ass in assList)
                        {
                            Type[] typeList = ass.GetExportedTypes();
                            foreach (Type type in typeList)
                            {
                                if (type.BaseType != null && (type.BaseType.FullName == AriesController || (type.BaseType.BaseType != null && type.BaseType.BaseType.FullName == AriesController)))
                                {
                                    #region Aries
                                    if (type.Name == DefaultController)
                                    {
                                        _AriesControllers.Add(DefaultController, type);
                                    }
                                    else
                                    {
                                        string[] names = type.FullName.ToLower().Split('.'); //Aa.SystemController
                                        if (names.Length > 1)
                                        {
                                            string className = names[names.Length - 1];
                                            className = className.Replace(Controller.ToLower(), "");
                                            _AriesControllers.Add(names[names.Length - 2] + "." + className, type);
                                        }
                                    }
                                    #endregion
                                }
                            }
                        }
                    }
                }
            }
            return _AriesControllers;
        }
        /// <summary>
        /// 通过XXX.className类名获得对应的Controller类
        /// </summary>
        /// <param name="className"></param>
        /// <param name="typeFlag">0：Ajax控制器；1：View控制器</param>
        /// <returns></returns>
        public static Type GetType(string className)
        {
            Dictionary<string, Type> controllers = GetControllers();
            if (controllers.ContainsKey(className)) //1：完整匹配【名称空间.类名】
            {
                return controllers[className];
            }
            else
            {
                string[] items = className.Split('.');

                #region Ajax映射处理
                className = items[items.Length - 1];
                string okKey = string.Empty;
                className = "." + className;
                string path = "." + items[0];
                foreach (string key in controllers.Keys) //2：部分匹配【.类名】
                {
                    if (key.EndsWith(className))
                    {
                        return controllers[key];
                    }
                    else if (key.EndsWith(path))//匹配 目录
                    {
                        okKey = key;
                    }
                }
                if (!string.IsNullOrEmpty(okKey))//3：匹配 目录
                {
                    return controllers[okKey];
                }
                #endregion

            }
            if (controllers.ContainsKey(DefaultController))
            {
                return controllers[DefaultController];
            }
            return null;
        }
        public static Type GetDefaultType()
        {
            Dictionary<string, Type> controllers = GetControllers();
            if (controllers.ContainsKey(DefaultController))
            {
                return controllers[DefaultController];
            }
            return null;
        }

        #endregion

        #region GetMethods
        static Dictionary<string, Dictionary<string, MethodInfo>> typeMethods = new Dictionary<string, Dictionary<string, MethodInfo>>();
        static readonly object objlockMethod = new object();
        public static MethodInfo GetMethod(Type t, string methodName)
        {
            string key = t.FullName;
            Dictionary<string, MethodInfo> dic = null;
            if (!typeMethods.ContainsKey(key))
            {
                lock (objlockMethod)
                {
                    if (!typeMethods.ContainsKey(key))
                    {
                        MethodInfo[] items = t.GetMethods();
                        dic = new Dictionary<string, MethodInfo>(StringComparer.OrdinalIgnoreCase);
                        foreach (var item in items)
                        {
                            if (!dic.ContainsKey(item.Name))//对于重载的同名方法，只取第一个空方法。
                            {
                                dic.Add(item.Name, item);
                            }
                        }
                        typeMethods.Add(key, dic);
                    }
                }
            }
            dic = typeMethods[key];
            if (dic.ContainsKey(methodName))
            {
                return dic[methodName];
            }
            if (dic.ContainsKey(Default))
            {
                return dic[Default];
            }
            return null;
        }
        #endregion
    }
}
