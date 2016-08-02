using System;
using System.Collections.Generic;
using System.Text;
using Aries.Core;
using CYQ.Data;
using CYQ.Data.Aop;
using CYQ.Data.Table;

namespace Aries.Logic
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
                }

                if (!string.IsNullOrWhiteSpace(sb.ToString()))
                {
                    using (EditLog log=new EditLog())
                    {
                        log.TableName = aopInfo.TableName;
                        log.KeyID =Convert.ToString(aopInfo.Row.PrimaryCell.Value);
                        log.Content = sb.ToString();
                        log.UserID = UserAuth.UserID;
                        log.EditTime = DateTime.Now;
                        log.Insert(InsertOp.None);
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

    internal class EditLog : CYQ.Data.Orm.SimpleOrmBase
    {
        public EditLog()
        {
            base.SetInit(this);
        }
        public int ID { get; set; }
        public string TableName { get; set; }
        public string KeyID { get; set; }
        public string Content { get; set; }
        public string UserID { get; set; }
        public DateTime EditTime { get; set; }
    }
}
