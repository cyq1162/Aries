using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using CYQ.Data;
using CYQ.Data.Cache;

namespace Aries.Core.Config
{
    /// <summary>
    /// 将Excel导入的过程的扩展移到外部，允许业务扩展。
    /// </summary>
    internal static class ExcelConfigFactory
    {
        static IExcelConfig config = null;
        internal static IExcelConfig GetExcelConfigExtend()
        {
            if (config != null)
            {
                return config;
            }
            string dllName = AppConfig.GetApp("Aries.Logic", "Aries.Logic");
            Assembly assembly = Assembly.Load(dllName);
            if (assembly != null)
            {
                object o = assembly.CreateInstance(dllName + ".ExcelConfigExtend");
                if (o != null && o is IExcelConfig)
                {
                    config = o as IExcelConfig;
                    if (config.IsUse)
                    {
                        return config;
                    }
                }
            }

            config = ExcelConfigExtend.Instance;
            return config;

        }
    }
}
