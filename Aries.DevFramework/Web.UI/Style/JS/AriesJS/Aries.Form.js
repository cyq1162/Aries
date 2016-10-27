//AR.Form 定义
(function ($, $Core, $PCore) {
    $(document).on("click", ".arrows", function () {
        $(this).toggleClass("hover");
        $(this).parent().next().toggle();
    });
    $Core.Form = function () {
        function Obj() {
            $Core.ExecuteEvent.call(this);
            //编辑页根据主键请求回来的数据。
            this.data = [];
            //用于获取数据的函数指向，默认值Get
            this.method = "Get";
            //用于拦截form表单的请求数据对象名，可以表名，视图名
            this.objName = $PCore.Global.DG.operating && $PCore.Global.DG.operating.objName;
            this.tableName = $PCore.Global.DG.operating && $PCore.Global.DG.operating.tableName;
            this.url = $Core.Global.route.root;
            /**
            * 获取了数据，准备回填表单前（参数：data）
            * 可格式化表单的数据,可格式化日期时间，字符显示的处理。
            *@param{object} data 表单数据对象
            */
            this.onBeforeFillForm = function (data) { };
            //此方法可改变请求的地址、方法、对象名
            this.onBeforeExecute = function () { };
            //在Form加载完后触发的事件。
            this.onAfterExecute = function () { };
            this.onExecute = function () {
                if (this.onBeforeExecute() === false) {
                    return;
                }
                if ($PCore && $PCore.Global.DG.action == "Update") {
                    if ($PCore.Global.DG.operating) {
                        var id = $Core.Utility.queryString("id");
                        this.data = $Core.Utility.Ajax.post(this.method, this.objName, { "id": id });
                        if (this.onBeforeFillForm(this.data) == false) { return; }
                        this.$target.form("load", this.data);
                        $Core.Combobox.setValues(this.data);
                    }
                }
                this.onAfterExecute();
            };
            this.onInit = function () {
                this.$target = $("form:eq(0)");
                this.BtnCommit.$target = $("#btn_submit").length == 0 ? $(".submit") : $("#btn_submit");
                this.BtnCancel.$target = $("#btn_cancel").length == 0 ? $(".return") : $("#btn_cancel");
                var that = this;
                this.BtnCommit.$target.click(function () {
                    that.BtnCommit.onExecute();
                });
                //注册保存跟取消按钮事件
                this.BtnCancel.$target.click(function () {
                    that.BtnCancel.onExecute();
                });

            }

            this.BtnCommit = function () {
                function Fn() {
                    $Core.BtnBase.call(this);
                    this.onExecute = function () {
                        return $Core.Form.commit(this.$target);
                    }
                    //执行前事件（参数为表单数组：Array data）
                    this.onBeforeExecute = function (arrayData) { };
                };
                return new Fn();
            }();
            this.BtnCancel = function () {
                function Fn() {
                    $Core.BtnBase.call(this);
                    this.onExecute = function () {
                        if (this.onBeforeExecute() === false) {
                            return;
                        }
                        $Core.Utility.Window.close();
                    };
                    //执行前事件（无参数）
                    this.onBeforeExecute = function () { };
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
            this.commit = function ($target, mthodName, tableName, $validator, clearEmptyValue, callBack, url) {
                var $targetForm = $validator || $target.parents("form");
                if ($validator && $validator != "true") {
                    $targetForm = $validator;
                }
                var formData = $targetForm.find("[name]:input").serializeArray();
                for (var i in formData) {
                    if (formData[i].value == '请选择' || (clearEmptyValue && formData[i].value == '')) {
                        delete formData[i];
                    }
                }
                if (this.BtnCommit && this.BtnCommit.onBeforeExecute(formData) == false) { return; }
                if ($targetForm.form("validate")) {
                    var obj = $Core.Utility.Ajax.post(mthodName || ((this.method.toLowerCase() != 'get') && this.method) || $PCore.Global.DG.action, tableName || this.objName || $PCore.Global.DG.operating.tableName, formData);
                    if (callBack && typeof (callBack) == "function") {
                        callBack.call(this, obj);
                    }
                    else {
                        var msg = obj.msg;
                        if (obj.success != undefined && obj.success) {
                            msg = "操作成功！";
                            if ($PCore.Global.DG.operating) {
                                $PCore.Global.DG.operating.datagrid('reload');
                            }
                        }
                        $PCore.Utility.Window.showMsg(msg);
                        if (obj.success) {
                            $Core.Utility.Window.close();
                        }
                        this.BtnCommit && this.BtnCommit.onAfterExecute(obj);
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
})(jQuery, AR, parent.AR);


(function ($, $Core, $PCore) {
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
    $(function () {
        $Core.Combobox.onInit();
        $Core.Form.onInit();
        registEvent("keydown");
        if ($PCore.Global.DG.operating) {
            $Core.Form.onExecute();
        }
    });
})(jQuery, AR, parent.AR);

