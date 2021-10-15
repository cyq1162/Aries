using Aries.Core.Helper;
using CYQ.Data.Tool;
using CYQ.Data.Xml;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Xml.Linq;
using Gemini.Workflow;
using Gemini.Workflow.Enums;
using Gemini.Workflow.Entity;

namespace Workflow.Controllers
{
    public class DesignerController : Aries.Core.Controller
    {

        #region 设计器

        public void SaveWorkflow()
        {
            if (Query<string>("fn") == "save")
            {
                string jsonStr = Query<string>("json");
                int op;
                if (int.TryParse(Query<string>("saveOp"), out op) && !string.IsNullOrEmpty(jsonStr))
                {
                    DeployType dte = (DeployType)op;
                    string returnMsg;
                    bool result = WF.Deploy.Save(jsonStr, dte, out returnMsg);
                    jsonResult = JsonHelper.OutResult(result, result ? "保存成功!" : "保存失败:" + returnMsg);

                }
                else
                {
                    jsonResult = JsonHelper.OutResult(false, "参数错误！");
                }

            }
        }
        /// <summary>
        /// 获取流程设计器初始化信息
        /// </summary>
        public void GetDesignerConfig()
        {
            //WF.Run.
            Guid wid = Query<Guid>("wid");
            Guid wiid = Query<Guid>("wiid");
            bool isDesignMode = Query<string>("dm") != "0";
            if (wid == Guid.Empty && wiid != Guid.Empty)
            {
                var info = WF.Context.GetOnView(wiid);
                if (info != null)
                {
                    wid = info.WorkflowID;
                }
            }
            JsonHelper js = new JsonHelper();
            if (isDesignMode && wiid == Guid.Empty)
            {
                js.Add("template", WF.Desiger.GetTemplate());
            }
            //XmlToJson 流程图查看
            if (wid != Guid.Empty)
            {
                js.Add("workflow", WF.Desiger.Get(wid));
            }

            //DesignerJson 已经走过的节点数据
            string mapData = string.Empty;

            if (!isDesignMode)//View状态
            {
                if (wiid != Guid.Empty)
                {

                    mapData = WF.Desiger.GetHistory(wiid);
                    if (String.IsNullOrEmpty(mapData))
                    {
                        mapData = WF.Desiger.GetHistory(wid);
                    }
                }
            }
            else if (wid != Guid.Empty)
            {
                mapData = WF.Desiger.GetHistory(wid);
            }
            if (!string.IsNullOrEmpty(mapData))
            {
                js.Add("mapData", mapData);

            }

            jsonResult = js.ToString();
        }

        #endregion
    }
}
