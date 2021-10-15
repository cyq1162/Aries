using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gemini.Workflow;
using Gemini.Workflow.Interface;
using Gemini.Workflow.Entity;
using Gemini.Workflow.Enums;
using Gemini.Workflow.Models;
namespace Gemini.Controllers.Demo
{
    public class ISubWorkflowDemo : ISubWorkflow
    {
        string appID = "DB";
        public string Start(Choice parentChoice)
        {
            //Gemini.Workflow
            //后端提供的API代码，以WF开头
            //启动新的流程
            WorkflowContext startContext = WF.Context.GetOnNoInstance(appID);//启动HX定义的流程
            //指定新的流程的父流程ID（及所在的节点实例ID）
            startContext.Instance.MainInstanceID = parentChoice.Context.InstanceID.ToString();
            startContext.Instance.MainActivityInstanceID = parentChoice.Current.ActivityInstance.ActivityInstanceID.ToString();//

            startContext.Instance.InstanceTitle = "哥要启动一个新的工单了，快去待办看看吧！";
            Choice choice = new Choice() { Command = Command.Start, Context = startContext };
            choice.Current.UserList.Add(WF.User.Current);//发送给当前用户好了。

            if (WF.Run.Execute(choice))
            {

                //启动后，返回新的工作流实例ID。
                return startContext.Instance.InstanceID.ToString();
            }
            return "";
        }



        public bool Invalid(ActivityInstance parentActivityInstance)
        {
            //回收子流程
            WorkflowContext context = WF.Context.GetOnNoInstance(appID);
            context.Opinion = "父流程回收，子流程要作废了！";
            Choice choice = new Choice() { Command = Command.Invalid, Context = context };
            if (WF.Run.Execute(choice))
            {
                return true;
            }
            return false;
        }
    }
}
