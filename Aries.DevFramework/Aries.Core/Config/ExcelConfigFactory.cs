using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using CYQ.Data;
using CYQ.Data.Cache;

namespace Aries.Core.Config
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
            Assembly assembly = InvokeLogic.GetAssembly();
            if (assembly != null)
            {
                object o = assembly.CreateInstance(InvokeLogic.GetClassFullName("Sys.ExcelConfigExtend"));
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
    }
}
