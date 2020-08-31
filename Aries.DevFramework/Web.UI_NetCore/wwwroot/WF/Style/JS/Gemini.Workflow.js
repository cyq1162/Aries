/// <reference path="/Style/JS/Aries.Loader.js" />
/// <reference path="/WF/Style/JS/Gemini.Workflow.js" />
/// <reference path="/WF/Style/JS/workForm.js" />
/// <reference path="/WF/Style/JS/actorSelect.js" />


window.WF || (window.WF = {});
//基础定义
(function (WF, AR) {

    WF.Enum = {
        TaskState: { Unread: 0, Read: 1, Complete: 2 },
        InstanceState: { NoInstance: 0, Draft: 1, Running: 2, Complete: 3, Suspend: 4, ReturnDraft: 5, ReturnActivity: 6, Invalid: 99 },
        FormAction: { NoInstance: 0, Todo: 2, View: 3, Circulate: 4 },
        SplitType: { SplitOne: "SplitOne", SplitAll: "SplitAll", SplitAny: "SplitAny" },
        JoinType: { JoinOne: "JoinOne", JoinAll: "JoinAll", JoinAny: "JoinAny" },
        ResponseType: { One: "One", All: "All", Any: "Any" },
        ActivityType: {
            Start: "Start", End: "End", Normal: "Normal", Split: "Split", Join: "Join", LoopSelf: "LoopSelf", InnerSubWorkflow: "InnerSubWorkflow", OuterSubWorkflow: "OuterSubWorkflow"
        }
    };
    WF.Event = {
        onGetActor: null, onShowSubmitDialog: null, onShowCirculateDialog: null, onShowTransmitDialog: null, onShowRejectDialog: null, onCirculated: null, onWithdraw: null,
        onInvalid: null, onSave: null, onSubmit: null, onSaveWorkflow: null, onViewFlowMap: null, onDivToggle: null
    };
    WF.Dialog = {};
    WF.Actor = {
        Private: {
            //下一节点是否结束结节。
            isEndActivityOnNext: false,
            $actorTarget: $("#ActorDiv"),
            $activityTarget: $("#ActivityDiv"),
            $rejectActorTarget: $("#RejectActorDiv"),
            $rejectActivityTarget: $("#RejectActivityDiv"),
            actorHtml: "", activityHtml: "", rejectActorHtml: "", rejectActivityHtml: "",
            //(系统调用)：重新加载面板Html isReject : 提交false、退回true
            loadHtml: function (isReject) {
                this.$actorTarget.html("");
                this.$activityTarget.html("");
                this.$rejectActorTarget.html("");
                this.$rejectActivityTarget.html("");
                if (isReject) {
                    this.$rejectActorTarget.html(this.rejectActorHtml);
                    this.$rejectActivityTarget.html(this.rejectActivityHtml);
                }
                else {
                    this.$actorTarget.html(this.actorHtml);
                    this.$activityTarget.html(this.activityHtml);
                }
            },
            //由setActivityUser方法设置而产生的值。
            activityUser: undefined,
            //由hideActivity设置要隐藏的节点
            hideActivityNameOrIDs: undefined,
            //(系统调用)：修改指定节点的处理人Html。
            setActorHtml: function (activityNameOrID, html) { },
            //(系统调用)：获取指定点节处理人的html
            getActorHtml: function (activityNameOrID, userNames, callBack) { },
            //(系统调用)：将节点名称转换成节点ID
            getActivityIDByName: function (activityName) { },
            //(系统调用)：移除节点
            removeActivity: function () { }
        },

        //隐藏的节点
        hideActivity: function (activityNameOrID) {
            this.Private.hideActivityNameOrIDs = activityNameOrID;
        },
        //修改指定节点的处理人。
        setActivityUser: function (activityNameOrID, userNames) {
            this.Private.activityUser || (this.Private.activityUser = {});
            this.Private.activityUser[activityNameOrID] = userNames;
        }

    };
    WF.Context = {
        formPath: "", name: "", title: "", instanceID: "", formID: "", sheetID: "", workflowID: "", appID: "", taskID: "",
        instanceStateName: "", urgency: "", importance: "", startTime: "", finishTime: "",
        activityID: "", activityName: "", activityType: "",
        orgID: "", orgName: "", orgFullName: "", userID: "", userName: "", fullName: "",
        isShowOpinion: false, isShowFlowMap: true, isEditForm: false, isOpinionRequire: false,
        enableInvalid: false, enableCirculate: false, enableTransmit: false, enableReject: false, enableWithdraw: false,
        taskState: 0, instanceState: 0, formAction: 0,
        splitType: "", joinType: "", respondType: "",
        onAfterExecute: null
    };
    WF.Context.onInit = function () {
        if ((parent == window || !parent.WF) && location.href.indexOf("/WorkForm.html") > -1) {
            WF.Context.title = AR.Utility.queryString("InstanceTitle");
            WF.Context.appID = AR.Utility.queryString("appID");
            WF.Context.formAction = AR.Utility.queryString("formAction") || "0";
            if (WF.Context.formAction != "0") {
                WF.Context.Wiid = AR.Utility.queryString("wiid");
                WF.Context.taskID = AR.Utility.queryString("taskID");
                WF.Context.formID = AR.Utility.queryString("formID");
            }
            WF.Context.urlQuery = "?formid={0}&wiid={1}&taskid={2}&appid={3}&formAction={4}";
            WF.Context.requestPara = {
                appID: WF.Context.appID, formAction: WF.Context.formAction, wiid: WF.Context.Wiid, taskID: WF.Context.taskID,
                formID: WF.Context.formID, InstanceTitle: WF.Context.title
            };
            AR.Ajax.get("GetWorkflowContext", null, WF.Context.requestPara, function (result) {
                if (!result.success) {
                    AR.Window.alert(result.msg, null, function () {
                        window.close();
                    });
                    return;
                }
                //WF = $.extend(true, WF, result);//获取流程上下文，这样写会让智能提示无效。
                for (var i in WF.Context) {
                    if (result.msg[i] != undefined) {
                        WF.Context[i] = result.msg[i];//为了智能提示，我转了两个小时，才想到这个办法。
                    }
                }
                WF.Context.instanceStateName = AR.Config.getText("WF_InstanceState", WF.Context.instanceState);
                if (WF.Context.onAfterExecute) { WF.Context.onAfterExecute(result); }
            });
        };
    };
    //事件Post的基本Json
    WF.Context.getJson = function () {
        var postParas = {};
        postParas.formAction = WF.Context.formAction;
        postParas.wiid = WF.Context.instanceID;
        postParas.formID = WF.Context.formID
        postParas.wid = WF.Context.workflowID;
        postParas.appID = WF.Context.appID;
        postParas.taskID = WF.Context.taskID;
        return postParas;
    };


}(window.WF, window.AR));

//事件、按钮定义
(function (WF, AR) {

    WF.Button = {
        Submit: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () {
                WF.Event.onShowSubmitDialog && WF.Event.onShowSubmitDialog();
            }
        },
        //保存
        Save: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () {
                WF.Event.onSave && WF.Event.onSave();
            },
        },
        //传阅
        Circulate: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () { WF.Event.onShowCirculateDialog && WF.Event.onShowCirculateDialog(); }
        },
        //已阅
        Circulated: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () { WF.Event.onCirculated && WF.Event.onCirculated(); }
        },
        //转交
        Transmit: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () { WF.Event.onShowTransmitDialog && WF.Event.onShowTransmitDialog(); }
        },
        //退回（上一步或历史某一步）
        Reject: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () { WF.Event.onShowRejectDialog && WF.Event.onShowRejectDialog(); }
        },
        //主动撤回（提单）
        Withdraw: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () { WF.Event.onWithdraw && WF.Event.onWithdraw(); }
        },

        //工单作废
        Invalid: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () { WF.Event.onInvalid && WF.Event.onInvalid(); }
        },
        //查看流程图
        ViewFlowMap: {
            onBeforeExecute: function () { },
            onAfterExecute: function () { },
            $target: undefined,
            onExecute: function () {
                WF.Event.onViewFlowMap && WF.Event.onViewFlowMap();
            }

        },
        regButton: function (id, btn) {
            btn.$target = $("#" + id);
            btn.$target.show();
            var that = btn;
            btn.$target.on("click", function () {
                if (that.onBeforeExecute() != false) {
                    if (that.onExecute() != false) {
                        that.onAfterExecute();
                    }
                }
            });
        },
        onInit: function () {

            if (WF.Context.instanceState == WF.Enum.InstanceState.Running) {
                if (WF.Context.enableInvalid && WF.Context.formAction != WF.Enum.FormAction.Circulate) {
                    this.regButton("BtnInvalid", this.Invalid);
                }
                if (WF.Context.formAction == WF.Enum.FormAction.View) {
                    if (WF.Context.enableWithdraw && WF.ActivityType != WF.Enum.ActivityType.Start) {
                        this.regButton("BtnWithdraw", this.Withdraw);
                    }
                }
            }
            if (WF.Context.formAction != WF.Enum.FormAction.View) {

                if (WF.Context.instanceState > 1) {
                    if (WF.Context.enableCirculate && WF.Context.activityType != WF.Enum.ActivityType.Start) {
                        this.regButton("BtnCirculate", this.Circulate);
                        if (WF.Context.taskState != WF.Enum.TaskState.Complete && WF.Context.formAction == WF.Enum.FormAction.Circulate) {
                            this.regButton("BtnCirculated", this.Circulated);
                        }
                    }
                    if (WF.Context.formAction == WF.Enum.FormAction.Todo) {

                        if (WF.Context.enableTransmit && WF.ActivityType != WF.Enum.ActivityType.Start) {
                            this.regButton("BtnTransmit", this.Transmit);
                        }
                        if (WF.Context.enableReject && WF.ActivityType != WF.Enum.ActivityType.Start) {
                            this.regButton("BtnReject", this.Reject);
                        }

                    }
                }
                if (WF.Context.formAction == WF.Enum.FormAction.Todo || WF.Context.instanceState == WF.Enum.FormAction.NoInstance) {
                    if (WF.Context.isEditForm || WF.Context.activityType == WF.Enum.ActivityType.Start) {
                        this.regButton("BtnSave", this.Save);
                    }
                    if (WF.Context.instanceState > WF.Enum.FormAction.NoInstance) {
                        this.regButton("BtnSubmit", this.Submit);
                        if (WF.Event.onGetActor) { WF.Event.onGetActor(); }

                    }
                }
            }
            if (WF.Context.isShowFlowMap) {
                this.regButton("BtnViewFlowMap", this.ViewFlowMap);
            }
        }
    };
}(window.WF, window.AR));


//初始化
(function (WF, AR) {
    WF.Init = {
        //加载用户表单页
        frameBox: function () {
            if (WF.Context.formPath) {
                var query = AR.Utility.stringFormat(WF.Context.urlQuery, WF.Context.formID, WF.Context.instanceID, WF.Context.taskID, WF.Context.appID, WF.Context.formAction);
                var $frame = $("#formFrame");
                $frame.attr("src", WF.Context.formPath + query.replace("?formid=", "?id="));
                $frame.attr("onload", "parent.WF && parent.WF.Init.iframeHeight();");
            }
            else {
                $("#formBox").hide();
            }
        },
        //加载流转过程
        flowBox: function () {
            if (WF.Context.Wiid && WF.Context.instanceState > 0) {
                var hisGrid = new AR.DataGrid("WF_TaskInstance", null, "ApprovalHistoryGrid");
                if (WF.Context.instanceState != WF.Enum.InstanceState.Invalid) {
                    hisGrid.addWhere("IsValid", 1);
                }
                hisGrid.addWhere("InstanceID", WF.Context.Wiid).addWhere("IsCirculate", 0).orderBy("CreateTime asc, ActivityName asc,TaskSeq");
                hisGrid.ToolBar.isHidden = true;
                hisGrid.isShowCheckBox = false;
                hisGrid.options.pageSize = 10;
                hisGrid.bind();
            } else { $("#flowBox").hide(); }
        },
        //加载处理意见
        opinionBox: function () {
            if (WF.Context.formAction != WF.Enum.FormAction.Todo || !WF.Context.isShowOpinion || WF.Context.activityType == WF.Enum.ActivityType.Start) {
                $("#opinionBox").hide();
            }
        },
        //调整iframe 高度。
        iframeHeight: function () {
            var $frame = $("#formFrame");
            var height = $frame.contents().find("body").height();
            // alert($("body").height() + "," + height);
            if (height > $frame.height()) {
                $frame.height(height + 10);
                //$("body").height($("body").height() + height);
            }

        },
        //加载工作流表单
        form: function () {
            document.title = WF.Context.title;
            setTimeout(function () {
                AR.Form.$target && AR.Form.$target.form("load", WF.Context);
                if (WF.Context.Wiid) {
                    if (WF.Context.formAction != WF.Enum.FormAction.Todo || WF.Context.activityType != WF.Enum.ActivityType.Start) {
                        $(".wf-form").toView();
                    }
                }
            }, 10);
           
        }
    };
}(window.WF, window.AR));



(function (WF, AR) {
    WF.Context.onAfterExecute = function () {

        WF.Button.onInit();
        WF.Init.form();
        WF.Init.opinionBox();
        WF.Init.flowBox();
        WF.Init.frameBox();
    }
    WF.Context.onInit();
    if (parent != window && parent.WF) {
        window.WF = WF = parent.WF;
        AR.Form.onAfterExecute = function () {
            if (WF.Context.formAction == WF.Enum.FormAction.View
                || WF.Context.formAction == WF.Enum.FormAction.Circulate
                || (WF.Context.activityType != WF.Enum.ActivityType.Start && !WF.Context.isEditForm)) {
                AR.Form.$target.toView();
            }
        }
        setTimeout(function () {
            parent.WF.Init.iframeHeight();
        }, 2000);
    }
}(window.WF, window.AR));
