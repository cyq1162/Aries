using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using Aries.Core;
using CYQ.Data;
using CYQ.Data.Table;
using Aries.Core.Config;
using CYQ.Data.Aop;

namespace Aries.Logic
{
    /// <summary>
    /// Excel 配置的扩展函数
    /// </summary>
    public class ExcelConfigExtend : IExcelConfig
    {
        private MAction _MAction;
        /// <summary>
        /// 获取新的MAction对象(因为在子事务中，所以需要设置事务级别，怕开发人员不懂事务机制，所以提供这个方法）
        /// </summary>
        /// <param name="tableName">表名</param>
        /// <returns></returns>
        internal MAction GetMAction(string tableName)
        {
            if (_MAction == null)
            {
                _MAction = new MAction(tableName);
                _MAction.SetAopState(AopOp.CloseAll);
                _MAction.BeginTransation();
                _MAction.SetTransLevel(IsolationLevel.ReadUncommitted);
            }
            return _MAction;
        }
        /// <summary>
        /// 新增加数据前事件（根据业务处理值）
        /// </summary>
        /// <param name="actionRow">需要被设置值的行</param>
        /// <param name="sourceRow">原始Excel被格式化后数据行</param>
        /// <param name="errMsg">返回的错误信息</param>
        public ExcelResult BeforeInsert(MDataRow actionRow, MDataRow sourceRow, out string errMsg)
        {
            errMsg = string.Empty;
            //switch (actionRow.TableName)
            //{
            //    case "Broadband_NewHouseProject":
            //        if (sourceRow.TableName == "V_KD_GetNHouseNZoneExpandList" || sourceRow.TableName == "V_KD_GetNHouseNCoverExpandList")
            //        {
            //            errMsg = "该数据表不允许插入数据！";
            //            return false;
            //        }
            //        break;
            //}
            return ExcelResult.Default;
        }

        /// <summary>
        /// （新增加数据前事件）根据业务处理值
        /// </summary>
        /// <param name="actionRow">需要被设置值的行</param>
        /// <param name="sourceRow">原始Excel被格式化后数据行</param>
        /// <param name="isEnd">是否结束（即完成）</param>
        public void AfterInsert(MDataRow actionRow, MDataRow sourceRow, bool isEnd)
        {

        }

        /// <summary>
        /// 插入错误时发生的
        /// </summary>
        /// <param name="errMsg">出错信息</param>
        /// <param name="dt">原始的表数据</param>
        public void OnInsertError(string errMsg, MDataTable dt)
        {

        }
        public void Dispose()
        {
            if (_MAction != null)
            {
                _MAction.EndTransation();
                _MAction.Dispose();
                _MAction = null;
            }
        }
      
        public ExcelResult BeforeUpdate(MDataRow actionRow, MDataRow sourceRow)
        {
            return ExcelResult.Default;
        }


    }
}
