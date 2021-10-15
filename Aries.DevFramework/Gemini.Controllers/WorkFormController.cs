using CYQ.Data.Tool;
using Gemini.Workflow;
using Gemini.Workflow.Models;
using Gemini.Workflow.Interface;
using Gemini.Workflow.Entity;
using Gemini.Workflow.Enums;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CYQ.Data;
using CYQ.Data.Orm;
namespace Gemini.Controllers
{
    public partial class WorkFormController : Aries.Core.Controller
    {
        WorkflowContext _WFContext;
        public WorkflowContext WFContext
        {
            get
            {
                if (_WFContext == null)
                {
                    _WFContext = WF.Context.Current;
                }
                return _WFContext;
            }
        }
        /// <summary>
        /// 获得当前工作流程的上下文0
        /// </summary>
        public void GetWorkflowContext()
        {

            WorkflowContext context = WFContext;
            if (context != null)
            {
                if (context.FormAction == FormAction.Todo)
                {
                    if (context.TaskInstance.TaskState == TaskState.Complete || !context.TaskInstance.IsValid)
                    {
                        jsonResult = JsonHelper.OutResult(false, "任务已结束！");
                        return;
                    }
                    if (context.Instance.InstanceState == InstanceState.Complete || context.Instance.InstanceState == InstanceState.Invalid)
                    {
                        jsonResult = JsonHelper.OutResult(false, "流程已结束！");
                        return;
                    }
                }

                JsonHelper js = new JsonHelper(false, false);

                js.Add("name", context.DefinitionInfo.WorkflowName);
                js.Add("title", context.Instance.InstanceTitle);
                js.Add("instanceID", context.InstanceID.ToString());
                js.Add("formID", context.Instance.FormID);
                js.Add("startTime", context.Instance.StartTime.ToString("yyyy-MM-dd HH:mm:ss"));
                if (context.Instance.FinishTime.HasValue)
                {
                    js.Add("finishTime", context.Instance.FinishTime.Value.ToString("yyyy-MM-dd HH:mm:ss"));
                }
                if (!string.IsNullOrEmpty(context.DefinitionInfo.App.FormPath))
                {
                    js.Add("formPath", context.DefinitionInfo.App.FormPath);
                }
                js.Add("sheetID", context.Instance.SheetID);
                js.Add("workflowID", context.WorkflowID);
                js.Add("taskID", context.TaskID);
                if (WFContext.TaskInstance != null)
                {
                    js.Add("taskState", context.TaskInstance.TaskState);
                }
                js.Add("instanceState", context.Instance.InstanceState);
                js.Add("formAction", (int)context.FormAction);
                js.Add("urgency", context.Instance.Urgency);
                js.Add("importance", context.Instance.Importance);
                js.Add("appID", context.AppID);
                if (context.Activity != null)
                {
                    js.Add("activityID", context.Activity.ActivityID);
                    js.Add("activityName", context.Activity.ActivityName);
                    js.Add("activityType", context.Activity.ActivityType.ToString());
                    js.Add("splitType", context.Activity.SplitType.ToString());
                    js.Add("joinType", context.Activity.JoinType.ToString());
                    js.Add("respondType", context.Activity.RespondType.ToString());
                    js.Add("isEditForm", context.Activity.IsEditForm);
                    js.Add("isShowOpinion", context.DefinitionInfo.IsShowOpinion && context.Activity.IsShowOpinion);
                    js.Add("isOpinionRequire", context.Activity.IsOpinionRequire);

                    //按钮权限

                    js.Add("enableCirculate", context.DefinitionInfo.IsEnableCirculate && (context.Activity.CirculateType == CirculateType.Manual || context.Activity.CirculateType == CirculateType.Both));
                    js.Add("enableTransmit", context.DefinitionInfo.IsEnableTransmit && context.Activity.IsEnableTransmit);
                    js.Add("enableReject", context.DefinitionInfo.IsEnableReject && context.Activity.RejectType != RejectType.None);
                    if (context.FormAction == FormAction.View && context.Instance.InstanceState == InstanceState.Running && context.Instance.CreatorID == context.User.UserID)
                    {
                        js.Add("enableWithdraw", context.DefinitionInfo.IsEnableWithdraw && WF.Run.IsCanWithdraw(context.ActivityInstance));
                    }
                    js.Add("enableInvalid", context.DefinitionInfo.IsEnableInvalid && context.Instance.CreatorID == context.User.UserID && context.Instance.InstanceState == InstanceState.Running);
                }
                js.Add("orgID", context.User.OrgID);
                js.Add("orgName", context.User.OrgName);
                js.Add("orgFullName", context.User.OrgFullName);
                js.Add("userID", context.User.UserID);
                js.Add("userName", context.User.UserName);
                js.Add("fullName", context.User.FullName);
                jsonResult = JsonHelper.OutResult(true, js.ToString());
            }
        }
        /// <summary>
        /// 保存工单事件
        /// </summary>
        public void SaveWorkflow()
        {
            string InstanceTitle = Query<string>("Title");
            string formID = Query<string>("FormID");
            int urgency = Query<int>("Urgency", 0);
            int importance = Query<int>("Importance", 0);
            bool result = false;
            if (WFContext.FormAction == FormAction.NoInstance)
            {
                //创建单号
                //WFContext.Instance.SheetID = WF.Context.GetSheetID(WFContext.AppID);
                //设置标题等
                WFContext.Instance.FormID = formID;
                WFContext.Instance.Urgency = urgency;
                WFContext.Instance.Importance = importance;
                WFContext.Instance.InstanceTitle = InstanceTitle;
                WFContext.Instance.InstanceState = InstanceState.Draft;

                result = WF.Run.Execute(new Choice() { Command = Command.Save, Context = WFContext });


            }
            else
            {
                //修改标题
                if (WFContext.Activity.ActivityType == ActivityType.Start)
                {
                    WFContext.Instance.InstanceTitle = InstanceTitle;
                    WFContext.Instance.Urgency = urgency;
                    WFContext.Instance.Importance = importance;
                    result = WFContext.Instance.Update(null, "InstanceTitle,Urgency,Importance");
                }

            }

            if (WFContext.FormAction == FormAction.NoInstance)
            {
                jsonResult = JsonHelper.OutResult(result, result ? "已成功保存到草稿箱" : "保存失败");
            }
            else
            {
                jsonResult = JsonHelper.OutResult(result, result ? "保存成功" : "保存失败");
            }
        }

        #region 下一步获取选择的处理人
        /// <summary>
        /// 获取下一个步骤的相关内容
        /// </summary>
        public void GetNextActorHtml()
        {
            JsonHelper js = new JsonHelper(false, false);
            GetNextListRadioActivityHtml(js);
            if (Query<bool>("isReject"))
            {
                GetRejectListRadioActivity(js);
            }
            jsonResult = js.ToString();
        }
        /// <summary>
        /// 显示 单选/多选 下一步
        /// </summary>
        /// <param name="nextActivitySetid"></param>
        private void GetNextListRadioActivityHtml(JsonHelper js)
        {

            if (WFContext.FormAction == FormAction.View || WFContext.TaskID.ToString() == Guid.Empty.ToString()) return;
            if (WFContext.FormAction == FormAction.Todo && WFContext.Instance.InstanceState != InstanceState.Complete)
            {
                var nextTransitionList = WFContext.Activity.TransitionList;

                StringBuilder activityHtml = new StringBuilder();
                StringBuilder actorHtml = new StringBuilder();

                bool isEndActivityOnNext = false;

                if (nextTransitionList.Count() > 0)
                {

                    foreach (Transition item in nextTransitionList)
                    {

                        Activity a = item.ToActivity;

                        //自动步骤不在手动提交供选当中，由于当前步骤是手动发出，那么如果下一步都是由手动进入的步骤来承接
                        //如果当前发出为自动，那么下一步都是自动进入的步骤来承接
                        if (a == null)
                        {
                            continue;
                        }
                        if (nextTransitionList.Count == 1)
                        {
                            //是否仅是一个结束步骤,如果是则默认选中

                            switch (a.ActivityType)
                            {
                                case ActivityType.Join:
                                case ActivityType.Split:
                                case ActivityType.End:
                                    isEndActivityOnNext = a.ActivityType == ActivityType.End;
                                    isEndActivityOnNext = isEndActivityOnNext || (a.TransitionList.Count == 1 && a.TransitionList[0].ToActivity.ActivityType == ActivityType.End);
                                    break;
                            }

                        }
                        activityHtml.Append(WF.Actor.GetActivityHtml(a, WFContext.Activity));
                        if (!isEndActivityOnNext)
                        {
                            actorHtml.Append(WF.Actor.GetActorHtml(a, WFContext));
                        }
                    }
                }
                else
                {
                    activityHtml.Append("<ul>");
                    activityHtml.Append("<li  style='color;red;'>无步骤可选择,请尝试刷新缓存！</li>");
                    activityHtml.Append("</ul>");
                }

                js.Add("isEndActivityOnNext", isEndActivityOnNext);
                js.Add("activityHtml", activityHtml.ToString());
                js.Add("actorHtml", actorHtml.ToString());
            }
        }

        /// <summary>
        /// 显示历史性退回步骤列表
        /// </summary>
        /// <param name="nextActivitySetid"></param>
        private void GetRejectListRadioActivity(JsonHelper js)
        {
            Activity ai = WFContext.Activity;
            if (ai.RejectType == RejectType.None || WFContext.FormAction == FormAction.View || WFContext.TaskID == Guid.Empty || WFContext.TaskInstance.TaskSeq.Length <= 2) return;

            //查找可回退的步骤名和步骤ID 根据TaskSeq序列规则找出包含在当前TaskSeq的历史轨迹 可能会存在多个同一活动定义存在相同的用户
            IList<TaskInstance> listHistoryTask = WF.Table.TaskInstance.GetHistoryListByTaskID(WFContext.TaskInstance.TaskID, WFContext.InstanceID);
            //筛选出历史轨迹中的活动定义
            IList<Guid> rejectActivityIDs = listHistoryTask.Select(t => t.ActivityID).Distinct().ToList<Guid>();
            //必须在活动定义之前的历史
            IList<Guid> listPreActivityID = WF.History.GetBeforeActivtiyIDs(ai);

            rejectActivityIDs = rejectActivityIDs.Where(a => listPreActivityID.Contains(a)).ToList<Guid>();
            //排掉自己
            rejectActivityIDs = rejectActivityIDs.Where(a => a != ai.ActivityID).ToList<Guid>();

            //开始步骤的id
            Guid startActivityID = WFContext.DefinitionInfo.StartActivity.ActivityID;


            //进一步缩小筛选
            if (ai.RejectType == RejectType.OnlyPreActivity || ai.RejectType == RejectType.OnlyStartOrPreActivity)
            {
                //仅上一步、仅上一步或提单
                IList<Guid> preActivityIDlist = ai.PreTransitionList.Select(a => a.FromActivityID).ToList<Guid>();
                if (ai.RejectType == RejectType.OnlyPreActivity)
                {
                    rejectActivityIDs = rejectActivityIDs.Where(a => preActivityIDlist.Contains(a)).ToList<Guid>();
                }
                else if (ai.RejectType == RejectType.OnlyStartOrPreActivity)
                {
                    rejectActivityIDs = rejectActivityIDs.Where(a => preActivityIDlist.Contains(a) || a == startActivityID).ToList<Guid>();

                }

            }
            else if (ai.RejectType == RejectType.OnlyStart)
            {
                //仅提单
                rejectActivityIDs = rejectActivityIDs.Where(a => a == startActivityID).ToList<Guid>();
            }

            StringBuilder activityHtml = new StringBuilder();
            StringBuilder actorHtml = new StringBuilder();
            if (rejectActivityIDs.Count() > 0)
            {
                //指定退回的步骤名
                IList<string> activityNames = new List<string>();
                if (!string.IsNullOrEmpty(WFContext.Activity.RejectActivity))
                {
                    activityNames = WFContext.Activity.RejectActivity.Split(',').ToList<string>();
                }
                foreach (Guid id in rejectActivityIDs)
                {
                    Activity a = WFContext.DefinitionInfo.ActivityList.FirstOrDefault(t => t.ActivityID == id);
                    if (activityNames.Count > 0 && !activityNames.Contains(a.ActivityName))
                    {
                        continue;
                    }
                    switch (a.ActivityType)
                    {
                        case ActivityType.Start:
                        case ActivityType.Normal:
                        case ActivityType.LoopSelf://只能退回常规节点。
                            break;
                        default:
                            continue;
                    }
                    activityHtml.Append(WF.Actor.GetActivityHtml(a, WFContext.Activity));
                    actorHtml.Append(WF.Actor.GetActorHtml(a, WFContext));

                    //activityHtml.Append(string.Format(" <li  activityid=\"{0}\" activitycode=\"{4}\"  activityname=\"{1}\"><input activityid=\"{0}\" activitycode=\"{4}\"  activityname=\"{1}\" activitytype=\"{2}\" flag=\"activity\" name=\"activityradio\" type=\"radio\"  IsUserRadio=\"{3}\"   />{1}</li>", 
                    //    activity.ActivityID, activity.ActivityName, activity.ActivityType.ToString(), activity.RespondType== RespondType.One?"true":"false", string.IsNullOrWhiteSpace(activity.ActivityCode) ? activity.ActivityName : activity.ActivityCode));
                    //listUserTask = listHistoryTask.Where(ts => ts.ActivityID == theActivityID).ToList<TaskInstance>();


                    //actorHtml.AppendFormat("<div class='rejectActivityUserAreaTitle'  activityid=\"{1}\" activityname=\"{0}\">【{0}】处理人，已选(<span  activityid=\"{1}\" class='selectedCount'>0</span>)</div>", activity.ActivityName, activity.ActivityID);
                    //actorHtml.Append(string.Format("<ul activityid=\"{0}\" style=\"display:none\" flag=\"activityactor\" activityname=\"{1}\">", activity.ActivityID, activity.ActivityName));
                    //if (listUserTask.Count > 0)
                    //{

                    //    IList<string> users = listUserTask.Select(a => a.UserID).Distinct().ToList<string>();
                    //    IList<UserInfo> listUser = WF.User.GetByUserIDs(string.Join<string>(",", users));

                    //    actorHtml.Append(WF.Actor.GetActorHtml(listUser, activity));

                    //}
                    //else
                    //{
                    //    actorHtml.Append("<li style='color;red;'>无处理人，请与管理员联系！</li>");
                    //}

                }
            }
            else
            {
                activityHtml.Append("<ul>");
                activityHtml.Append("<li  style='color;red;'>无步骤可选择,请尝试刷新缓存！</li>");
                activityHtml.Append("</ul>");
            }
            activityHtml.Append(" </ul>");
            js.Add("rejectActivityHtml", activityHtml.ToString());
            js.Add("rejectActorHtml", actorHtml.ToString());
        }

        #endregion

        #region 发送流程
        //提交
        public void SendWorkflow()
        {
            if (WFContext.FormAction == FormAction.NoInstance)
            {
                jsonResult = JsonHelper.OutResult(false, "请先保存，再提交！");
                return;
            }
            TaskInstance t = WF.Table.TaskInstance.Get(WFContext.TaskID);
            if ((t == null || t.TaskState == TaskState.Complete) && WFContext.FormAction != FormAction.NoInstance)
            {
                jsonResult = JsonHelper.OutResult(false, "待办任务已失效，请刷新页面！");
                return;
            }
            string hidActivityJson = Query<string>("hidActivityJson");
            string hidUserJson = Query<string>("hidUserJson");
            string hidOpinion = Query<string>("hidOpinion");
            if (hidActivityJson == string.Empty)
            {
                jsonResult = JsonHelper.OutResult(false, "请选择下一步骤！");
                return;

            }
            List<ActorItem> actorItems = JsonHelper.ToList<ActorItem>(hidUserJson);

            //选择的步骤列表
            List<ActorItem> activityItems = JsonHelper.ToList<ActorItem>(hidActivityJson);

            if (actorItems != null && actorItems.Count > 0)
            {
                activityItems.AddRange(actorItems);//合并两个参数。
            }

            IList<ChoiceActivity> listChoiceActivity = WF.Run.GetChoiceActivityList(WFContext.WorkflowID, activityItems);

            //意见
            WFContext.Opinion = hidOpinion;
            //Execute
            //Execute
            bool result = WF.Run.Execute(new Choice() { Command = Command.ToNext, ChoiceActivityList = listChoiceActivity, Context = WFContext });

            jsonResult = JsonHelper.OutResult(result, result ? "提交成功" : "提交失败：" + WFContext.ErrMsg);
        }

        //退回
        public void RejectWorkflow()
        {

            string hidActivityJson = Query<string>("hidActivityJson");
            string hidUserJson = Query<string>("hidUserJson");
            string hidOpinion = Query<string>("hidOpinion");
            if (hidActivityJson == string.Empty)
            {
                jsonResult = JsonHelper.OutResult(false, "请选择退回步骤！");
                return;
            }
            if (hidUserJson == string.Empty || hidUserJson == "[]")
            {
                jsonResult = JsonHelper.OutResult(false, "您没有选择退回接收人！");
                return;
            }


            #region 构造节点选择
            List<ActorItem> actorItems = JsonHelper.ToList<ActorItem>(hidUserJson);

            //选择的步骤列表
            List<ActorItem> activityItems = JsonHelper.ToList<ActorItem>(hidActivityJson);

            if (actorItems != null && actorItems.Count > 0)
            {
                activityItems.AddRange(actorItems);//合并两个参数。
            }

            IList<ChoiceActivity> listChoiceActivity = WF.Run.GetChoiceActivityList(WFContext.WorkflowID, activityItems);
            #endregion
            WFContext.Opinion = hidOpinion;
            bool result = WF.Run.Execute(new Choice() { Command = Command.Reject, ChoiceActivityList = listChoiceActivity, Context = WFContext });

            //}
            jsonResult = JsonHelper.OutResult(result, result ? "退回成功" : "退回失败：" + WFContext.ErrMsg);
        }

        //作废
        public void InvalidWorkflow()
        {

            WFContext.Opinion = Query<string>("opinion");
            bool result = WF.Run.Execute(new Choice() { Command = Command.Invalid, Context = WFContext });
            jsonResult = JsonHelper.OutResult(result, result ? "工单已作废" : "工单作废失败：" + WFContext.ErrMsg);
        }

        //撤回
        public void WithdrawWorkflow()
        {

            WFContext.Opinion = Query<string>("opinion");
            bool result = WF.Run.Execute(new Choice() { Command = Command.Withdraw, Context = WFContext });
            jsonResult = JsonHelper.OutResult(result, result ? "工单已撤回" : "工单撤回失败：" + WFContext.ErrMsg);
        }

        //转交
        public void TransmitWorkflow()
        {

            CirculateOrTransmit(Command.Transmit);

        }

        public void CirculateWorkflow()
        {
            CirculateOrTransmit(Command.Circulate);
        }
        //提交传阅
        public void CirculateOrTransmit(Command command)
        {
            string text = command == Command.Circulate ? "传阅" : "转交";
            string usersStr = Query<string>("hidCommonUsers");
            string opinion = Query<string>("hidOpinion");

            if (string.IsNullOrWhiteSpace(usersStr))
            {
                jsonResult = JsonHelper.OutResult(false, "请选择要" + text + "的用户");
                return;
            }

            WFContext.TaskInstance.Opinion = opinion;
            IList<UserInfo> listUser = WF.User.GetByUserNames(usersStr);
            Choice choice = new Choice() { Command = command, TransmitUserList = listUser, Context = WFContext };//WFContext, taskInstance, opinion, listUser, returnMsg
            bool isSuccess = WF.Run.Execute(choice);
            if (isSuccess)
            {
                jsonResult = JsonHelper.OutResult(true, text + "成功");
                return;
            }
            else
                jsonResult = JsonHelper.OutResult(false, text + "失败:" + WFContext.ErrMsg);

        }

        //设置为已阅
        public void SetCirculated()
        {
            bool success = WF.Run.Execute(new Choice() { Command = Command.Circulated });
            if (success)
            {
                jsonResult = JsonHelper.OutResult(true, "审阅成功");
            }
            else
            {
                jsonResult = JsonHelper.OutResult(false, "审阅失败");
            }
        }
        #endregion
    }
    /// <summary>
    /// 提供额外的调用接口
    /// </summary>
    public partial class WorkFormController
    {
        public string GetActorHtml()
        {
            string userNames = Query<string>("userNames");
            string activityID = Query<string>("activityID");
            if (!string.IsNullOrEmpty(userNames) && !string.IsNullOrEmpty(activityID))
            {
                return JsonHelper.OutResult(true, WF.Actor.GetActorHtml(userNames, WF.Table.Activity.Get(activityID)));
            }
            return JsonHelper.OutResult(false, "");
        }
    }
}
