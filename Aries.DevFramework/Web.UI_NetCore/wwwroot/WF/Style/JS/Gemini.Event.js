/// <reference path="/Style/JS/Aries.Loader.js" />
/// <reference path="/WF/Style/JS/Gemini.Workflow.js" />

//*****************提交窗口，退回窗口定义**********************************
$(function (WF, AR) {
    WF.closeWindow = function ()
    {
        try
        {
            window.close();
            window.open("about:blank", "_top").close();
        }
        catch(e)
        {
            window.open("about:blank", "_top").close();
        }
    }
    WF.Dialog.btnType = "";
    WF.Dialog.Send_OK = function () {
        //手动发出
        if (!WF.Actor.verifyIsOK())
            return false;

        var aNames = $("#hidActivityNames").val();
        $.messager.confirm('提交确认', "您确定提交到【" + aNames + "】吗？", function (r) {
            if (r) {
                //审批意见
                $("#hidOpinion").val($("#txtOpinion").val());
                $("#sendDialog").dialog("close");
                return WF.Event.onSubmit();
            }
        });

    }
    WF.Dialog.Send_Cancel = function () {
        WF.Actor.clearSelectedAll();
        $("#sendDialog").dialog("close");
    }
    WF.Dialog.Reject_OK = function () {
        if (!WF.Actor.verifyIsOK())
            return false;
        var aNames = $("#hidActivityNames").val();
        $.messager.confirm('提交确认', "您确定退回到【" + aNames + "】吗？", function (r) {
            if (r) {
                //审批意见
                $("#hidOpinion").val($("#txtOpinion").val());
                $("#rejectDialog").dialog("close");
                WF.Event.onReject();
            }
        });
    }
    WF.Dialog.Reject_Cancel = function () {
        WF.Actor.clearSelectedAll();
        $("#rejectDialog").dialog("close");

    }

    WF.Dialog.Common_OK = function () {
        var userFullNames = AR.Combobox.getText("txtUserNames").toString();
        var userNames = AR.Combobox.getValue("txtUserNames").toString();

        if (userNames == "") {
            AR.Window.alert("请选择用户！");
            return false;
        }
        else {
            $("#hidCommonUsers").val(userNames);
            $.messager.confirm('提示', "您确定要传给【" + userFullNames + "】吗？",
                function (r) {
                    if (r) {
                        if (WF.Dialog.btnType == "Circulate") {
                            return WF.Event.onCirculate();
                        }
                        if (WF.Dialog.btnType == "Transmit") {
                            return WF.Event.onTransmit();
                        }
                    }

                });

        }
        return false;
    }
    WF.Dialog.Common_Cancel = function () {
        $("#commonDialog").dialog("close");
    }
    //打开传阅或转交窗口
    WF.Dialog.showCommon = function (type) {
        WF.Dialog.btnType = type;
        var defaultOpinion = type == "Transmit" ? "烦请协助处理" : "请知悉，谢谢！";
        var title = type == "Transmit" ? "提交转交选择窗口" : "提交传阅选择窗口";
        $("#CommonActorSelectTitle").html(title);
        $("#ucTextBoxCommonOpinion").val(defaultOpinion)
        $("#hidCommonUsers").val("");
        $("#commonDialog").dialog("open");
    }
    WF.Dialog.onInit = function () {
        $("#sendDialog").dialog({
            title: '提交选择窗口',
            width: 750,
            height: 432,
            closed: true,
            cache: false,
            modal: true,
            buttons: '#SendButtons'

        });

        //退回选择窗口
        $("#rejectDialog").dialog({
            width: 750,
            height: 432,
            closed: true,
            cache: false,
            modal: true,
            buttons: '#RejectButtons'
        });
        //传阅选择窗口
        $("#commonDialog").dialog({
            width: 600,
            height: 400,
            closed: true,
            cache: false,
            modal: true,
            buttons: '#CirculatedButtons'
        });
    };
    WF.Dialog.onInit();
}(window.WF, window.AR));


//*****************工作流事件实现： 提交，保存，退回 作废 等实际触发*****************
(function (WF, AR) {
    //保存工作流和用户表单
    WF.Event.onSave = function () {
        if (!AR.Form.$target.form("validate")) {
            return false;
        }
        if (WF.Context.formPath) {
            //先提交表单：
            var childWin = $("#formFrame")[0].contentWindow;
            if (childWin && childWin.AR.Form) {
                AR.Window.showLoading();
                childWin.AR.Form.BtnCommit.onAfterExecute = function (result) {
                    if (result && result.success) {
                        WF.Event.onSaveWorkflow(WF.Context.formID || result.msg);//追加表单ID;
                        return false;
                    }
                    else {
                        AR.Window.closeLoading();
                        AR.Window.alert(result.msg);
                    }
                }
                childWin.AR.Form.BtnCommit.onExecute();//提交事件。
            }
        }
        else {
            WF.Event.onSaveWorkflow();
        }
    };
    //仅保存工作流表单
    WF.Event.onSaveWorkflow = function (formID) {
        if (WF.Context.activityType == WF.Enum.ActivityType.Start) {
            AR.Form.onBeforeCommit = function (formJson) {
                formID && (formJson.formID = formID);
                formJson = $.extend(true, formJson, { appID: WF.Context.appID, formAction: WF.Context.formAction, wid: WF.Context.workflowID, wiid: WF.Context.instanceID, taskID: WF.Context.taskID });
            }
            AR.Form.onCommit(null, "SaveWorkflow");
            AR.Form.onAfterCommit = function (result) {
                AR.Window.closeLoading();
                AR.Window.alert(result.msg, null, function () {
                    if (result.success && !WF.Context.formID) {
                        var query = AR.Utility.stringFormat(WF.Context.urlQuery, formID, WF.Context.instanceID, WF.Context.taskID, WF.Context.appID, 2);
                        location.href = location.pathname + query;
                    }

                });
            }
        }
        else {
            AR.Window.alert(formID ? "保存成功！" : "保存失败！");
        }
    };
    //打开提交窗口
    WF.Event.onShowSubmitDialog = function () {
        if (WF.Context.isShowOpinion && WF.Context.isOpinionRequire) {
            if ($("#txtOpinion").val() == "") {
                AR.Window.alert("审核意见不能为空！");
                return false;
            }
        }
        if ($("#Title").val() == "") {
            AR.Window.alert("标题不能为空！");
            return false;
        }
        WF.Actor.Private.loadHtml();

        WF.Actor.rejectPre = "";
        WF.Actor.clearSelectedAll();
        if (WF.Actor.Private.isEndActivityOnNext) {
            WF.Dialog.Send_OK();
        }
        else {
            WF.Actor.Private.removeActivity();
            if (WF.Actor.Private.activityUser) {
                var aus = WF.Actor.Private.activityUser;
                for (var id in aus) {
                    var html = WF.Actor.Private.getActorHtml(id, aus[id]);
                    WF.Actor.Private.setActorHtml(id, html);
                }
            }
            $("#sendDialog").dialog("open");
        }

    }

    WF.Event.onShowRejectDialog = function () {
        if (WF.Context.isShowOpinion && WF.Context.isOpinionRequire) {
            if ($("#txtOpinion").val() == "") {
                AR.Window.alert("审核意见不能为空！");
                return false;
            }
        }
        WF.Actor.Private.loadHtml(true);
        WF.Actor.rejectPre = "Reject";
        WF.Actor.clearSelectedAll();
        $("#rejectDialog").dialog("open");
    }
    //打开传阅窗口
    WF.Event.onShowCirculateDialog = function () {
        return WF.Dialog.showCommon('Circulate');
    }
    //打开转交窗口
    WF.Event.onShowTransmitDialog = function () {
        return WF.Dialog.showCommon('Transmit');
    }

    WF.Event.onSubmit = function () {
        //保存 先保存工作流，再保存表单，如果是未有实例的情况下保存为草稿，且保存完跳转页面
        var postParas = WF.Context.getJson();
        postParas = $.extend(true, postParas, AR.Form.getSerializeJson());
        AR.Ajax.post("SendWorkflow", null, postParas, function (result) {
            AR.Window.alert(result.msg, null, function () {
                if (result.success) {
                    WF.closeWindow();
                }
            });
        });
    }
    //退回
    WF.Event.onReject = function () {

        var postParas = WF.Context.getJson();
        postParas = $.extend(true, postParas, AR.Form.getSerializeJson());
        AR.Ajax.post("RejectWorkflow", null, postParas, function (result) {
            AR.Window.alert(result.msg, null, function () {
                if (result.success) {
                    WF.closeWindow();
                }
            });
        });
    }

    //传阅
    WF.Event.onCirculate = function () {
        var postParas = WF.Context.getJson();
        postParas.hidCommonUsers = $("#hidCommonUsers").val();
        postParas.hidOpinion = $("#hidOpinion").val();

        AR.Ajax.post("CirculateWorkflow", null, postParas, function (result) {
            AR.Window.alert(result.msg, null, function () {
                if (result.success) {
                    $("#commonDialog").dialog("close");
                }
            });
        });

    }
    //设置已阅
    WF.Event.onCirculated = function () {
        $.messager.confirm('提示', "您确定要设置为已阅吗？",
            function (r) {
                if (r) {
                    var postParas = WF.Context.getJson();
                    AR.Ajax.post("SetCirculated", null, postParas, function (result) {
                        AR.Window.alert(result.msg, null, function () {
                            if (result.success) {
                                WF.closeWindow();
                            }
                        });
                    });
                }
            });

        return false;
    }
    //转交
    WF.Event.onTransmit = function () {
        var postParas = WF.Context.getJson();

        postParas.hidCommonUsers = $("#hidCommonUsers").val();
        postParas.hidOpinion = $("#hidOpinion").val();

        AR.Ajax.post("TransmitWorkflow", null, postParas, function (result) {
            AR.Window.alert(result.msg, null, function () {
                if (result.success) {
                    WF.closeWindow();
                }
            });
        });
    }

    //撤回流程
    WF.Event.onWithdraw = function () {
        $.messager.prompt('确认窗口', '您确定要撤回此工单吗,请输入撤回原因？', function (r) {
            if (r) {
                var opinion = r;
                var postParas = WF.Context.getJson();
                postParas.opinion = opinion;
                AR.Ajax.post("WithdrawWorkflow", null, postParas, function (result) {
                    AR.Window.alert(result.msg, null, function () {
                        if (result.success) {
                            WF.closeWindow();
                        }
                    });
                });

            }
            else {
                AR.Window.showMsg("请输入撤回原因");
            }

        });
        return false;
    }

    //作废流程
    WF.Event.onInvalid = function () {
        $.messager.prompt('确认窗口', '您确定要作废此工单吗,请输入作废原因？', function (r) {
            if (r) {
                var opinion = r;
                var postParas = WF.Context.getJson();
                postParas.opinion = opinion;
                AR.Ajax.post("InvalidWorkflow", null, postParas, function (result) {
                    AR.Window.alert(result.msg, null, function () {
                        if (result.success) {
                            WF.closeWindow();
                        }
                    });
                });
            } else {
                AR.Window.showMsg("请输入作废原因");
            }
        });
    }
    WF.Event.onViewFlowMap = function () {
        var url = "/WF/Designer/Designer.html?dm=0&wid=" + WF.Context.workflowID + "&wiid=" + WF.Context.instanceID;
        AR.Window.dialog(WF.Context.name, url, { width: 980+100, height: 660+100 });
    }
    WF.Event.onGetActor = function () {
        if (WF.Context.formAction == WF.Enum.FormAction.Todo) {
            var postPara = WF.Context.requestPara;
            postPara.isReject = WF.Context.enableReject;
            AR.Ajax.get("GetNextActorHtml", null, postPara, function (result) {
                for (var i in WF.Actor.Private) {
                    if (result[i] != undefined) {
                        WF.Actor.Private[i] = result[i];
                    }
                }
            });
        }
    }
    WF.Event.onDivToggle = function (id, fn) {
        $("#" + id).toggle(500);
        if (fn && typeof (fn) == "function") {
            fn();
        }
    }

}(window.WF, window.AR));

