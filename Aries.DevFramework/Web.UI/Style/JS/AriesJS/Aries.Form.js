
//AR.Form 定义
(function ($, $Core, $PCore) {
    $Core.Lang || ($Core.Lang = {});
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
            this.objName = $PCore && $PCore.Global.DG.operating && $PCore.Global.DG.operating.objName;
            this.tableName = $PCore && $PCore.Global.DG.operating && $PCore.Global.DG.operating.tableName;
            //动作：Add 或 Update
            this.action = $PCore && $PCore.Global.DG.action;
            this.url = $Core.Global.route.root;
            /**
            * 获取了数据，准备回填表单前（参数：data json格式）
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
                var id = $Core.Utility.queryString("id");
                if (id && this.action == "Update" && this.objName) {
                    this.data = $Core.Utility.Ajax.post(this.method, this.objName, { "id": id });
                    if (this.onBeforeFillForm(this.data) == false) { return; }
                    this.$target.form("load", this.data);
                    $Core.Combobox.setValues(this.data);
                }
                this.onAfterExecute(this.data);
            };
            this.onInit = function () {
                this.$target = $("form:eq(0)");
                this.BtnCommit.$target = $($(".submit")[0] || $("#btnSubmit")[0]);
                this.BtnCancel.$target = $($(".return")[0] || $("#btnReturn")[0]);
                this.regEvent();
            };

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
                var $targetForm = $validator || $($target.parents("form")[0]);
                if ($validator && $validator != "true") {
                    $targetForm = $validator;
                }
                var formData = $targetForm.find("[name]:input").serializeArray();
                for (var i in formData) {
                    if (formData[i].value == $Core.Lang.select || (clearEmptyValue && formData[i].value == '')) {
                        delete formData[i];
                    }
                }
                if (this.BtnCommit && this.BtnCommit.onBeforeExecute(formData) == false) { return; }
                if (!$targetForm.form("validate")) {
                    $Core.Utility.Window.showMsg($Core.Lang.fillTheBlank);
                    return false;
                }
                var tName = tableName || this.tableName;
                var oName = this.objName || tName;
                var obj = $Core.Utility.Ajax.post(mthodName || ((this.method.toLowerCase() != 'get') && this.method) || this.action, oName + "," + tName, formData);
                if (callBack && typeof (callBack) == "function") {
                    callBack.call(this, obj);
                }
                else if (obj) {
                    if (this.BtnCommit && this.BtnCommit.onAfterExecute(obj) == false) {
                        return;
                    }
                    var msg = obj.msg;
                    if (obj.success != undefined && obj.success) {
                        msg = $Core.Lang.operationSuccess;
                        if ($PCore && $PCore.Global.DG.operating) {
                            $PCore.Global.DG.operating.datagrid('reload');
                        }
                    }
                    if ($PCore) {
                        $PCore.Utility.Window.showMsg(msg);
                        if (obj.success && parent != null && parent.document.title != document.title) {
                            $Core.Utility.Window.close();
                        }
                    }

                }

            };
            this.regEvent = function () {
                if (this.$target && this.BtnCommit.$target) {
                    var that = this;
                    this.BtnCommit.$target.click(function () {
                        that.BtnCommit.onExecute();
                    });
                    //注册保存跟取消按钮事件
                    this.BtnCancel.$target.click(function () {
                        that.BtnCancel.onExecute();
                    });
                    //input，追加回车事件。
                    this.$target.submit(function (e) { return false; });// 禁掉自动提交。（当表单只有一个输入框时，有些浏览器会自动触发回车即submit事件）"
                    this.$target.find("input:[type='text']").each(function () {
                        $(this).keyup(function (e) {
                            var ev = document.all ? window.event : e;
                            if (ev.keyCode == 13) // Enter
                            {
                                $(this).blur();//先触发光标离开事件（让easyui的值写回hidde域）
                                that.BtnCommit.onExecute();
                                $(this).focus();//将光标还原。
                            }
                        });

                    });
                }

            };
        }
        return new Obj();
    }();
})(jQuery, AR, parent.AR);

(function ($, $Core, $PCore) {
    $(function () {
        $Core.Combobox.onInit();
        $Core.Form.onInit();
        $Core.Form.onExecute();
    });
})(jQuery, AR, parent.AR);

