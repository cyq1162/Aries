using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gemini.Workflow;
using CYQ.Data.Json;
namespace Gemini.Controllers
{
    public class WorkflowFormController : Aries.Core.Controller
    {
        public void SaveDemo()
        {
            using (WorkflowForm wf = new WorkflowForm())
            {
                if (!string.IsNullOrEmpty(GetID))
                {
                    if (wf.Update(GetID, true))
                    {
                        jsonResult = JsonHelper.OutResult(true, "更新成功");
                    }
                    else
                    {
                        jsonResult = JsonHelper.OutResult(true, "更新失败：" + wf.BaseInfo.DebugInfo);
                    }
                }
                else
                {
                    if (wf.Insert(true, CYQ.Data.InsertOp.ID))
                    {
                        jsonResult = JsonHelper.OutResult(true, wf.ID.ToString());
                    }
                    else
                    {
                        jsonResult = JsonHelper.OutResult(true, "添加失败：" + wf.BaseInfo.DebugInfo);
                    }
                }
            }
            //Gemini.Workflow.Helper.UserHelper...
        }
    }
    public class WorkflowForm : CYQ.Data.Orm.OrmBase
    {
        public WorkflowForm()
        {
            base.SetInit(this, "WorkflowForm", "DemoConn");
        }
        public int ID { get; set; }
        public string Title { get; set; }
        public decimal Amount { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        public string ClientSelect { get; set; }
        public string Content { get; set; }
        public string Remark { get; set; }

    }

}
