using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using CYQ.Data;
//using CYQ.Entity.GDGIS;

namespace Web.Core
{
    /// <summary>
    /// 跨库处理
    /// </summary>
    public static class CrossDb
    {
        public static object GetEnum(string objName)
        {
            if (objName != null && objName.IndexOf(')') == -1 && objName.IndexOf('.') == -1)//只处理单表。
            {
                if (KeyValueConfig.tableDic.ContainsKey(objName))
                {
                    return objName;
                }
                //检测是否需要跨库
                List<Type> ts = GetEnumTypes();
                if (ts != null)
                {
                    foreach (Type t in ts)
                    {
                        if (Enum.IsDefined(t, objName))
                        {
                            return Enum.Parse(t, objName);
                        }
                    }
                }
            }
            return objName;
        }
        private static List<Type> _EnumTypes;
        private static List<Type> GetEnumTypes()
        {
            if (_EnumTypes == null)
            {
                Assembly ass = GetAssembly();
                if (ass != null)
                {
                    _EnumTypes = new List<Type>();
                    Type[] ts = ass.GetExportedTypes();
                    foreach (Type t in ts)
                    {
                        if (t.IsEnum && t.FullName.EndsWith("Enum"))
                        {
                            _EnumTypes.Add(t);
                        }
                    }
                }

            }
            return _EnumTypes;
        }
        private static Assembly _Assembly;
        private static Assembly GetAssembly()
        {
            if (_Assembly == null)
            {
                try
                {
                    _Assembly = Assembly.Load("WEb.Entity");
                }
                catch (Exception err)
                {
                    Log.WriteLogToTxt(err);
                }
            }
            return _Assembly;
        }
    }
}
