using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using CYQ.Data;
using CYQ.Data.Cache;

namespace Web.Core
{
    internal static class ExcelConfigFactory
    {
        internal static bool isUseInterObj = false;
        internal static IExcelConfig GetExcelConfigExtend()
        {
            if (isUseInterObj)
            {
                return ExcelConfigExtend.Instance;
            }
            IExcelConfig config = null;
            Assembly assembly = GetAssembly();
            if (assembly != null)
            {
                object o = assembly.CreateInstance("Web.Logic.Sys.ExcelConfigExtend");
                if (o != null && o is IExcelConfig)
                {
                    config = o as IExcelConfig;
                }
            }
            if (config == null)
            {
                isUseInterObj = true;
                return ExcelConfigExtend.Instance;
            }
            return config;

        }
        private static Assembly _Assembly;
        private static Assembly GetAssembly()
        {
            if (_Assembly == null)
            {
                try
                {
                    _Assembly = Assembly.Load("Web.Logic");
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
