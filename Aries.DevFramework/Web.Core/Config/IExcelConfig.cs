using System;
using CYQ.Data.Table;

namespace Web.Core
{

    public interface IExcelConfig : IDisposable
    {
        ExcelResult BeforeUpdate(MDataRow actionRow, MDataRow sourceRow);
        ExcelResult BeforeInsert(MDataRow actionRow, MDataRow sourceRow, out string errMsg);
        void AfterInsert(MDataRow actionRow, MDataRow sourceRow, bool isEnd);
        void OnInsertError(string errMsg, MDataTable dt);

    }
    /// <summary>
    /// BeForeImport的结果参数
    /// </summary>
    public enum ExcelResult
    {
        /// <summary>
        /// 正常继续执行后面代码
        /// </summary>
        Default,
        /// <summary>
        /// 忽略此行（不执行后续代码）。
        /// </summary>
        Ignore,
        /// <summary>
        /// 中止执行，事务回滚
        /// </summary>
        Error
    }
    internal class ExcelConfigExtend : IExcelConfig
    {
        private static ExcelConfigExtend config = new ExcelConfigExtend();
        internal static IExcelConfig Instance
        {
            get
            {
                return config;
            }
        }


        public ExcelResult BeforeUpdate(MDataRow actionRow, MDataRow sourceRow)
        {
            return ExcelResult.Default;
        }

        public ExcelResult BeforeInsert(MDataRow actionRow, MDataRow sourceRow, out string errMsg)
        {
            errMsg = string.Empty;
            return ExcelResult.Default;
        }

        public void AfterInsert(MDataRow actionRow, MDataRow sourceRow, bool isEnd)
        {
            
        }

        public void OnInsertError(string errMsg, MDataTable dt)
        {
           
        }

        public void Dispose()
        {
           
        }
    }

}
