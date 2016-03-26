using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Web.Core;
using CYQ.Data;
using CYQ.Data.Aop;
using CYQ.Data.Table;
namespace Web.Logic.Sys
{
    /// <summary>
    /// AOP，日志使用（数据库自动用触发器生成日志）
    /// 本类，默认由框架组提供，在各项目中，允许根据业务修改。
    /// </summary>
    public class Aop : IAop
    {
        public AopResult Begin(AopEnum action, AopInfo aopInfo)
        {
            try
            {
                StringBuilder sb = new StringBuilder();

                switch (action)
                {
                    case AopEnum.Delete:
                        sb.AppendFormat("数据被删除,删除条件为：{0}", aopInfo.Where);
                        break;
                    case AopEnum.Update:
                        MDataRow oldRow = null;
                        using (MAction ma = new MAction(CrossDb.GetEnum(aopInfo.TableName)))
                        {
                            ma.SetAopOff();
                            ma.SetPara(aopInfo.CustomDbPara);
                            if (aopInfo.IsTransaction)
                            {
                                ma.BeginTransation();
                                ma.SetTransLevel(System.Data.IsolationLevel.ReadUncommitted);//读取事务中的数据。
                            }
                            if (ma.Fill(aopInfo.Where))
                            {
                                oldRow = ma.Data;
                            }
                        }
                        if (oldRow != null)
                        {
                            foreach (MDataCell item in aopInfo.Row)
                            {
                                if (item.State == 2 && item.Value != null && item.Value != oldRow[item.ColumnName].Value)
                                {
                                    MCellStruct cs = item.Struct;
                                    var title = string.IsNullOrWhiteSpace(cs.Description) ? item.ColumnName : cs.Description;
                                    var filed = item.ColumnName;
                                    var oldValue = oldRow[filed].Value;
                                    var newValue = item.Value;
                                    sb.AppendFormat("【{0}】由{1}改为{2}|", title, oldValue, newValue);
                                }
                            }
                        }
                        break;
                    case AopEnum.Insert:

                        foreach (MDataCell c in aopInfo.Row)
                        {
                            MCellStruct cs = c.Struct;
                            var title = cs.Description;
                            var value = c.Value;
                            sb.AppendFormat("【{0}】的值为：{1}", title, value);
                        }
                        break;
                }

                if (!string.IsNullOrWhiteSpace(sb.ToString()))
                {
                    MDataCell cell = aopInfo.Row.PrimaryCell;
                    using (MAction ma = new MAction("DataEditLog"))
                    {
                        ma.SetAopOff();
                        ma.Set("TbName", aopInfo.TableName);
                        ma.Set("KeyID", cell.Value);
                        ma.Set("Content", sb.ToString());
                        ma.Set("DoUserID", UserAuth.UserID);
                        ma.Set("CrtDate", DateTime.Now.ToString("yyyy-MM-dd hh:ss:mm"));
                        ma.Insert();
                    }
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt("AopError:" + err.Message);
            }
            return AopResult.Default;
        }

        public IAop Clone()
        {
            return new Aop();
        }

        public void End(AopEnum action, AopInfo aopInfo)
        {

        }
        public void OnError(string msg)
        {

        }

        public void OnLoad()
        {

        }
    }
}
