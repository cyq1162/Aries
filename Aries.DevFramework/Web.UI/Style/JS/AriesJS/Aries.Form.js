

(function ($, $Core,$PCore) {
    $(document).on("click", ".arrows", function () {
        $(this).toggleClass("hover");
        $(this).parent().next().toggle();
    });
    $Core.Form = function () {
        function Obj() {
            $Core.ExcuteEvent.call(this);
            this.data = [];
            //用于获取数据的函数指向，默认值Get
            this.method = "Get";
            //用于拦截form表单的请求数据对象名，可以表名，视图名
            this.objname = null;
            this.url = $Core.route.root;
            /**
            *格式化表单的数据,可格式化日期时间，字符显示的处理
            *@param{object} data 表单数据对象
            */
            this.onBeforeLoadFormat = function (data) { };
            //此方法可改变请求的地址、方法、对象名
            this.onBeforeExcute = function () { };
            //在Form加载完后触发的事件。
            this.onAfterExcuted = function () { };
            this.onExcute = function () {
                if (this.onBeforeExcute.call(this) === false) {
                    return;
                }
                if ($PCore && $PCore.Global.operator == "Update") {
                    if ($PCore.Global.DG.operating) {
                        var id = $Core.Utility.queryString("id");
                        var objname = this.objname || $PCore.Global.DG.operating.tableName;
                        this.data = $Core.Utility.Ajax.post(this.method, objname, { "id": id }, false, this.url);                        
                        this.onBeforeLoadFormat(this.data);
                        this.$target.form("load", this.data);
                        $Core.Combobox.selectedCombobox(this.data);
                    }
                }
                if (this.onAfterExcuted.call(this) === false) {
                    return;
                }
            };
            this.onInit = function () {
                this.$target = $("form:eq(0)");
                this.BtnCommit.$target = $("#btn_submit").length == 0 ? $(".submit") : $("#btn_submit");
                this.BtnCancel.$target = $("#btn_cancel").length == 0 ? $(".return") : $("#btn_cancel");
                var that = this;
                this.BtnCommit.$target.click(function () {
                    that.BtnCommit.onExcute();
                });
                //注册保存跟取消按钮事件
                this.BtnCancel.$target.click(function () {
                    that.BtnCancel.onExcute();
                });
                
            }
            
            this.BtnCommit = function () {
                function Fn() {
                    $Core.BtnBase.call(this);
                    this.onBeforeExcute = function () { };
                    this.onExcute = function () {
                        var flag = true;
                        if (this.onBeforeExcute() === false) {
                            return false;
                        }
                        return $Core.Form.commit(this.$target);
                    }
                    this.onAfterExcuted = function (data) { };                   
                };
                return new Fn();
            }();
            this.BtnCancel = function () {
                function Fn() {
                    var that = this;
                    $Core.BtnBase.call(that);
                    that.onExcute = function () {
                        if (this.onBeforeExcute() === false) {
                            return false;
                        }
                        $Core.Utility.Window.close();
                    };
                };                
                return new Fn();
            }();
            /**
            *提交数据事
            *@param{jquery} $target 需要提交的容器的表单
            *@param{string} mthodName 提交的函数名
            *@param{string} tableName 提交的表名
            *@param{jquery} $validator 是否只验证当前的容器
            *@param{function} callBack(result) 回调函数，result返回的json数据结果
            *@param{string} url 提交的处理程序路径
            */
            this.commit = function ($target,mthodName, tableName, $validator, clearEmptyValue, callBack, url) {
                var $targetForm = $validator || $target.parents("form");
                if ($validator && $validator != "true") {
                    $targetForm = $validator;
                }
                if ($targetForm.form("validate")) {
                    var formData = $targetForm.find("[name]:input").serializeArray();
                    for (var i in formData) {
                        if (formData[i].value == '请选择' || (clearEmptyValue && formData[i].value == '')) {
                            delete formData[i];
                        }
                    }
                    var obj = $Core.Utility.Ajax.post(mthodName || ((this.method.toLowerCase() != 'get') && this.method) || $PCore.Global.operator, tableName || this.objname || $PCore.Global.DG.operating.tableName, formData, false, url || $Core.Form.url);
                    if (callBack && typeof(callBack) == "function") {
                        callBack.call(this,obj);
                    }
                    else {
                        var msg = obj.msg;
                        if (obj.success != undefined && obj.success) {
                            msg = "操作成功！";
                            if ($PCore.Global.DG.operating) {
                                try {
                                    if ($PCore.Global.DG.operating.Internal.type == 'datagrid') {
                                        $PCore.Global.DG.operating.$target.datagrid('reload');
                                    } else {
                                        $PCore.Global.DG.operating.$target.treegrid('reload');
                                    }
                                } catch (e) {

                                }
                            }
                        }
                        $PCore.Utility.Window.showMsg(msg);
                        if (obj.success) {
                            $Core.Utility.Window.close();
                        }
                        this.onAfterExcuted(obj);
                    }
                }
                else {
                    $Core.Utility.Window.showMsg("请填写或选择（*）项");
                    return false;
                }
            };
        }
        return new Obj();
    }();
})(jQuery, AR,parent.AR);


(function ($, $Core, $PCore) {
    //回车事件注册
    function event_keydown() {
        var btn_query = $(".query");
        var btn_submit = $("#btn_submit").length == 0 ? $(".submit") : $("#btn_submit");
        btn_query[0] && registKeydown(btn_query);
        btn_submit[0] && registKeydown(btn_submit);
    }

    //关闭按钮事件
    function event_cancel() {
        $Core.Form.BtnCancel.$target.click(function () {
            $Core.Utility.Window.close();
        });
    }

    //表单提交事件
    function event_submit() {
        $Core.Form.BtnCommit.$target.click(function () {
            var flag = $Core.Form.onBeforeExcute();
            if (flag === false) {
                return false;
            }
            return $Core.Form.commit($(this));            
        });
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


    $(function () {
        $.parser.parse($("#div_search"));
        $Core.Combobox.onInit();
        $Core.Form.onInit();
        registEvent("keydown");
        if ($PCore.Global.DG.operating) {
            $Core.Form.onExcute();
        }
    });
})(jQuery, AR, parent.AR);

