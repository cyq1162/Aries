/// <reference path="/Style/JS/Aries.Loader.js" />
/// <reference path="/WF/Style/JS/Gemini.Workflow.js" />

//由Gemini.Workflow.js 里调用。

//***************提交或退回通用业务方法******************
(function (WF, AR) {

    //提交请求前，重新设定所有请求参数。
    WF.Actor.onSure = function () {
        var aNames = "", aJson = [], users = [];
        var list = WF.Actor.getSelectedActivity([], 1);
        for (var i = 0; i < list.length; i++) {
            $el = list[i];
            aNames += (i > 0 ? "," : "") + $el.attr("activityname");

            var item = { "ActivityID": $el.attr("activityid"), "ActivityName": $el.attr("activityname"), "ActivityType": $el.attr("activitytype"), "FromActivityID": $el.attr("fromactivityid") };
            aJson.push(item);
        }

        $("#" + WF.Actor.rejectPre + "ActorDiv input[flag='actor']:checked").each(function () {
            var activityid = $(this).attr("activityid");
            var isOK = false;
            for (var i = 0; i < aJson.length; i++) {
                if (aJson[i].ActivityID == activityid) {
                    isOK = true;
                    break;
                }
            }
            if (isOK) {
                var userid = $(this).attr("userid");
                var username = $(this).attr("username");
                var fullname = $(this).attr("fullname");
                var orgID = $(this).attr("orgID");
                var orgName = $(this).attr("orgName");
                var activityname = $(this).attr("activityname");
                var activitytype = $(this).attr("activitytype");
                var email = $(this).attr("email");
                var mobile = $(this).attr("mobile");
                var item = {
                    userid: userid, username: username, fullname: fullname, orgID: orgID, orgName: orgName,
                    activityid: activityid, activityname: activityname, activitytype: activitytype, email: email, mobile: mobile
                };
                users.push(item);
            }
        });

        $("#hidUserJson").val(JSON.stringify(users));
        $("#hidActivityNames").val(aNames);
        $("#hidActivityJson").val(JSON.stringify(aJson));
    }
    //返回数组：获取所有选择的节点（$input）列表：WF.Actor.getSelectedActivity([],1);
    WF.Actor.getSelectedActivity = function (list, level, $parent) {
        var $lv;
        if ($parent) {
            $lv = $parent.parent().parent().find("input[level='" + level + "']:checked");
        }
        else {
            $lv = $("#" + WF.Actor.rejectPre + "ActivityDiv input[level='" + level + "']:checked");
        }
        $lv.each(function () {
            list.push($(this));
            WF.Actor.getSelectedActivity(list, level + 1, $(this));
        });
        return list;
    }
    //最后校验是否处理人选择完毕
    WF.Actor.verifyIsOK = function ($el) {
        var result = true;
        if (!$el) {
            var $lv = $("#" + WF.Actor.rejectPre + "ActivityDiv input[level='1']:checked");
            if ($lv.size() == 0) {
                AR.Window.alert("请选择处理步骤");
                return false;
            }

            $lv.each(function () {
                if (!WF.Actor.verifyIsOK($(this))) {
                    result = false;
                    return false;
                }
            });
            if (result) {
                WF.Actor.onSure();
            }
        }
        else {
            var acitvityid = $el.attr("activityid");
            var activityName = $el.attr("activityname");
            var $subs = $el.parent().parent().find("input[activityid!='" + acitvityid + "']:checked");
            if ($subs.size() == 0) {
                var $span = $("#" + WF.Actor.rejectPre + "ActorDiv span[activityid='" + acitvityid + "']");
                if ($span[0] && parseInt($span.html()) == 0) {
                    AR.Window.alert("请为【" + activityName + "】选择处理人");
                    return false;
                }
            }
            else {
                $subs.each(function () {
                    if (!WF.Actor.verifyIsOK($(this))) {
                        result = false;
                        return false;
                    }
                });
            }
        }
        return result;
    }

    //---------已经重写的方法------------------
    //步骤前面展开或收缩
    WF.Actor.hideOrShow = function (el, flag, rejectPre) {
        var $el = $(el);
        var $div = $el.parent().next().next();
        if ($div.is(":hidden")) {
            $div.show();
            $el.attr("class", "subRight3");
        }
        else {
            $div.hide();
            $el.attr("class", "addRight3");
        }
    }
    //清除所有选中的用户
    WF.Actor.clearSelectedAll = function (exceptActivityID) {
        $("#" + WF.Actor.rejectPre + "ActorDiv input:checked").each(function () {
            if (exceptActivityID && $(this).attr("activityid") == exceptActivityID) {

            }
            else {
                $(this).prop("checked", false);
            }
        });

        $(".selectedCount").each(function () {
            $(this).html("0");
        });
        !exceptActivityID && WF.Actor.setActivityBackground();//清空背景色。
        $("#hidUserJson").val("");
        $("#hidActivityJson").val("");
    }
    //右侧步骤 全选/反全选指定步骤的处理人
    WF.Actor.onSelect = function (el, type) {
        $el = $(el);
        var aid = $(el).attr("activityid");
        WF.Actor.setActivityBackground(aid);
        var isChecked = $el.is(":checked");
        isChecked && WF.Actor.setActivityChecked(aid);
        if (type == "activity") {

        }
        else {
            var $div = $el.parent().next();
            if ($div && $div[0] && ($div[0].tagName == "DIV" || $div[0].tagName == "UL")) {
                $div.find("input").each(function () {
                    $(this).prop("checked", isChecked);
                    WF.Actor.setSelectedCount($(this).attr("activityid"));
                });
            }
        }
        $el.prop("checked", isChecked);
        WF.Actor.setSelectedCount(aid);
    }
    //选中左侧指定的步骤
    WF.Actor.setActivityChecked = function (activityid) {
        var $el = $("#" + WF.Actor.rejectPre + "ActivityDiv input[flag='activity'][activityid='" + activityid + "']");
        //如果为单选的步骤则需要清除其它步骤已选择的人
        if ($el.attr("type") == "radio") {
            WF.Actor.clearSelectedAll(activityid);
        }
        $el.prop("checked", true);
    }

    //统计指定步骤已选中人数
    WF.Actor.setSelectedCount = function (activityid) {
        var count = $("#" + WF.Actor.rejectPre + "ActorDiv input[flag='actor'][activityid='" + activityid + "']:checked").size();
        $("span[activityid='" + activityid + "']").html(count);
        var n = $("#" + WF.Actor.rejectPre + "ActorDiv input[flag='actor']:checked").size();
        $("#" + WF.Actor.rejectPre + "selectCount").html(n);
    }

    //设置左侧指定步骤的背景色
    WF.Actor.setActivityBackground = function (activityid) {
        $("#" + WF.Actor.rejectPre + "ActivityDiv div").each(function () {
            if (activityid == undefined || $(this).attr("activityid") != activityid) {
                $(this).removeClass("activityBackground");
            }
            else {
                $(this).addClass("activityBackground");
            }
        });
    }

    //隐藏分支节点
    WF.Actor.Private.removeActivity = function () {
        var activityNameOrIDs = WF.Actor.Private.hideActivityNameOrIDs;
        if (activityNameOrIDs && typeof activityNameOrIDs == "string") {
            var items = activityNameOrIDs.split(',');
            for (var i in items) {
                var id = this.getActivityIDByName(items[i]);
                //hid activity and users
                $("div[activityid='" + id + "']").each(function () {
                    $(this).remove();
                });
            }
        }
    }
    WF.Actor.Private.getActivityIDByName = function (name) {
        var id = name;
        if (id.length != 36 || id.split('-').length < 4) {
            var $input = $("input[flag='activity'][activityname='" + id + "']:first");
            if ($input[0]) {
                id = $input.attr("activityid");
            }
        }
        return id;
    }
    WF.Actor.Private.getActorHtml = function (activityNameOrID, userNames, callBack) {
        var id = this.getActivityIDByName(activityNameOrID);
        var result = AR.Ajax.post("GetActorHtml", null, { userNames: userNames, activityID: id }, callBack);
        if (!callBack && result.success) {
            return result.msg;
        }
    }
    //替换节点的Html
    WF.Actor.Private.setActorHtml = function (activityNameOrID, html) {
        var id = this.getActivityIDByName(activityNameOrID);
        $("div[flag='actor'][activityid='" + id + "']").each(function () {
            $(this).replaceWith(html);
        });
    }
}(window.WF, window.AR));
