

(function ($, ty) {
    $(document).on("click", ".arrows", function () {
        $(this).toggleClass("hover");
        $(this).parent().next().toggle();
    });
    ty.Form = function () {
        function Obj() {
            ty.ExcuteEvent.call(this);
            this.data = [];
            this.method = "Get";
            this.objname = null;
            this.url = TY.handler.ajax;
            /**
            *格式化表单的数据,可格式化日期时间，字符显示的处理
            *@param{object} data 表单数据对象
            */
            this.onBeforeLoadFormat = function (data) { };
            //此方法可改变请求的地址、方法、对象名
            this.onBeforeExcute = function () { };
            this.onExcute = function () {
                if (this.onBeforeExcute.call(this) === false) {
                    return;
                }
                if (parent.TY && parent.TY.Global.operator == "Update") {
                    if (parent.TY.Global.DG.operating) {
                        var id = TY.Utility.Request.queryString("id");
                        this.data = TY.Utility.Ajax.post(this.method, this.objname, { "id": id }, false, this.url);
                        this.onBeforeLoadFormat(this.data);
                        this.$target.form("load", this.data);
                        //after request data clear the method and objname
                        this.method = null;
                        this.objname = null;
                    }
                }                
                this.onAfterExcuted();
            };
            this.onInit = function () {
                this.$target = $("form:eq(0)");
                this.BtnCommit.$target = $("#btn_submit").length == 0 ? $(".submit") : $("#btn_submit");
                this.BtnCancel.$target = $("#btn_cancel").length == 0 ? $(".return") : $("#btn_cancel");
                var that = this;
                if (parent.TY.Global.DG.operating) {
                    this.objname = parent.TY.Global.DG.operating.tableName;                    
                    this.BtnCommit.$target.click(function () {
                        that.BtnCommit.onExcute();
                    });
                    this.BtnCancel.$target.click(function () {
                        that.BtnCancel.onExcute();
                    });
                }
                
            }            
            this.BtnCommit = function () {
                function Fn() {
                    var that = this;
                    ty.BtnBase.call(this);
                    this.onExcute = function () {
                        if (this.onBeforeExcute() === false) {
                            return;
                        }
                        ty.Form.commit(this.$target, TY.Form.method,TY.Form.objname);
                    }
                    this.onAfterExcuted = function (data) { };
                };
                return new Fn();
            }();
            this.BtnCancel = function () {
                function Fn() {
                    var that = this;
                    ty.BtnBase.call(that);
                    that.onExcute = function () {
                        ty.Utility.Window.close();
                    };
                };                
                return new Fn();
            }();
            this.commit = function (btn, methodName, tbName, validate, clearEmptyValue, callBack, url) {
                var $targetForm = validate || btn.parents("form");
                if (validate && validate != "true") {
                    $targetForm = validate;
                }
                if ($targetForm.form("validate")) {
                    var formData = $targetForm.find("[name]:input").serializeArray();
                    for (var i in formData) {
                        if (formData[i].value == '请选择' || (clearEmptyValue && formData[i].value == '')) {
                            delete formData[i];
                        }
                    }
                    var obj = ty.Utility.Ajax.post(methodName || parent.TY.Global.operator, tbName || parent.TY.Global.DG.operating.tableName, formData, false, url || ty.Form.url);

                    if (callBack) {
                        callBack(obj, ty);
                    }
                    else {
                        var msg = obj.msg;
                        if (obj.success != undefined && obj.success) {
                            msg = "操作成功！";
                            if (parent.TY.Global.DG.operating) {
                                try {
                                    if (parent.TY.Global.DG.operating.Internal.type == 'datagrid') {
                                        parent.TY.Global.DG.operating.$target.datagrid('reload');
                                    } else {
                                        parent.TY.Global.DG.operating.$target.treegrid('reload');
                                    }
                                } catch (e) {

                                }

                            }
                        }
                        parent.TY.Utility.Window.showMsg(msg);
                        if (obj.success) {
                            TY.Utility.Window.close();//关闭当前窗口，而（可能）不是父窗口。
                        }
                        this.onAfterExcuted(obj);
                    }
                }
                else {
                    ty.Utility.Window.showMsg("请填写或选择（*）项");
                }
            };
        }
        return new Obj();
    }();
})(jQuery, TY);

//回车事件注册
function event_keydown() {
    var btn_query = $(".query");
    var btn_submit = $("#btn_submit").length == 0 ? $(".submit") : $("#btn_submit");
    btn_query[0] && registKeydown(btn_query);
    btn_submit[0] && registKeydown(btn_submit);
}

//需要注册新事件流，把事件写在此方法前面
/**
*方法接收多个参数,以字符串为标准如，调用方式如：registEvent("reset", "keydown");
*reset 重置按钮事件
*cancel 取消按钮事件
*keydown 回车事件
*/
function registEvent() {
    for (var i = 0; i < arguments.length; i++) {
        try {
            eval("event_" + arguments[i])();
        } catch (e) {
            //console.log(arguments[i]);
        }
    }
}
//注册回车事件
function registKeydown(el) {
    window.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            el.click();
            return false;
        }
    }
}

+$(function () {
    $.parser.parse($("#div_search"));
    TY.Combobox.onInit();
    TY.Form.onInit();
    event_keydown();
    if (parent.TY.Global.DG.operating) {
        TY.Form.onExcute();
    }
});