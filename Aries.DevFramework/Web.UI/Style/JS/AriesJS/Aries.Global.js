/// <reference path="/Style/JS/Aries.Loader.js" />
window.AR || (window.AR = {});

//AR.Global 定义
(function ($Core) {
    $Core.Lang || ($Core.Lang = {});
    //自定义的健值对数组
    $Core.Dictionary = function () {
        this.length = 0;
        this.set = function (key, value) {
            if (key != undefined) {
                if (this[key] == undefined) {
                    this.length++;
                }
                this[key] = value;
            }
        };
        this.remove = function (key) {
            if (key) {
                if (this[key] != undefined) {
                    this.length--;
                }
                delete this[key];
            }
        }
    };
    //处理Config_KeyValue的数据。
    $Core.Config = {
        data: undefined,
        //获取下拉翻译的文本
        getText: function (configKey, value) {
            var count = 10;
            while (!this.data && count > 0) {
                $.sleep(10);
                count--;
            }
            if (!this.data || !configKey) { return ''; }
            var items = this.data[configKey];
            var itemValue = [];
            if (items != undefined && value != undefined && value != null && value.toString() != '') {
                var valueArray = value.toString().split(',');
                var isIn = false;
                for (var i = 0; i < items.length; i++) {
                    isIn = valueArray.contains(items[i].value);
                    if (!isIn) {
                        var iValue = items[i].value.toString();
                        if (iValue == "1" || iValue == "0") {
                            isIn = valueArray.contains(iValue == "1" ? true : false);
                        }
                        else if (iValue == "true" || iValue == "false") {
                            isIn = valueArray.contains(iValue == "true" ? 1 : 0);
                        }
                    }
                    if (isIn) {
                        itemValue.push(items[i].text);
                    }

                }
                return itemValue.length == 0 ? value : itemValue.join(',');
            } else {
                return '';
            }
        },
        //获取下拉翻译的值
        getValue: function (configKey, text) {
            var count = 10;
            while (!this.data && count > 0) {
                $.sleep(10);
                count--;
            }
            if (!this.data || !configKey) { return ''; }
            var items = this.data[configKey];
            var itemValue = [];
            if (items != undefined && text != undefined && text != null && text.toString() != '') {
                var valueArray = text.toString().split(',');
                for (var i = 0; i < items.length; i++) {
                    if (valueArray.contains(items[i].text)) {
                        itemValue.push(items[i].value);
                    }
                }
                return itemValue.length == 0 ? text : itemValue.join(',');
            }
            else {
                return '';
            }
        }
    },
    //存档当前对话框的相关变量
    $Core.Dialog = {
        //目标的JQ对象
        $target: undefined,
        //Dialog初始化：传递的参数
        options: {},
        //返回值：选择的文本
        text: undefined,
        //返回值：选择的值
        value: undefined,
        //返回值：选择的完整数据
        data: undefined,
        //返回值：下拉绑定的参数
        option: undefined,
        //清空返回值。
        clearReturnValue: function () {
            this.text = undefined;
            this.value = undefined;
            this.data = undefined;
            this.option = undefined;
        },
        //用户点击确定或取消后触发 $input，点击的input（JQ）对象，isOK（确定）按钮或取消按钮事件。
        onAfterExecute: function ($input, isOK) { }

    },
    //全局变量对象（用于存档全局使用的数据）
    $Core.Global = {
        DG: {
            //datagrid集合，根据id取出DataGrid对象，将Json当数组用。
            Items: new $Core.Dictionary(),
            //当前操作的datagrid对象
            operating: null,
            //当前页面DataGrid操作，值为Update，Add
            action: null,
            PKTemplate: {
                //op=1 指定 open 时的动作为更新
                edit: '<a class="edit" title="' + $Core.Lang.edit + '" op="1"></a>',
                del: '<a class="del" title="' + $Core.Lang.del + '"></a>',
                detail: '<a class="detail" title="' + $Core.Lang.deltail + '"></a>',
                save: '<a class="save" title="' + $Core.Lang.save + '" ></a>',
                cancel: '<a class="cancel" title="' + $Core.Lang.cancel + '" ></a>'
            },
            //datagrid或treegrid的默认配置
            DefaultConfig: {
                striped: true,
                nowrap: false,
                singleSelect: true,
                checkOnSelect: false,
                selectOnCheck: false,
                border: true,
                pageSize: 15,
                pageList: [10, 15, 20, 30, 40, 50, 100],
                //设置为true时，面版的大小将铺满它所在的容器（浏览器）。
                fit: true,
                //系统会自动判断该属性，如果字段显示的数量>10，则为false,显示滚动条。
                fitColumns: true,
                pagination: true,
                rownumbers: true,
                autoRowHeight: false
            }
        },
        route: 'ajax.html',
        //themes: ['default', 'black', 'gray', 'metro'],
        /*
        *页面全局变量
        *ui(虚拟应用程序的路径)，actionkeys（页面对应的权限集）,mid（当前菜单id）
        */
        Variable: {
            ui: undefined,
            actionKeys: undefined,
            mid: undefined
        },
        ////存档用户信息
        //_User: undefined,
        /*
       *获取当前登陆用户的信息
       */
        GetUser: function (callBack) {
            var topWin = window;
            if (!this._User) {
                this._User = (function (win) {//递归到index.html页取值。
                    var ar = win.AR;
                    if (ar.Global._User || win == win.top) {
                        topWin = win;
                        return ar.Global._User;
                    }
                    return arguments.callee(win.parent.window);
                })(topWin);
            }
            if (!this._User)//从远程获取。
            {
                AR.Ajax.get("GetUserInfo", null, null, function (data) {
                    AR.Global._User = data;
                    callBack && callBack(data);
                });
            }
            else {
                return this._User;
            }
        }

    };
    //AR.BtnBase 基类的定义
    $Core.ExecuteEvent = ExecuteEvent;
    function ExecuteEvent() {
        this.onExecute = function () { }
        //此方法只有返回false时，才会停止执行onExecute跟onAfterExecute事件
        this.onBeforeExecute = function () { }
        this.onAfterExecute = function () { }
    }
    $Core.BtnBase = BtnBase;
    function BtnBase(flag) {
        ExecuteEvent.call(this)
        if (flag) {
            this.$target = $("#" + flag) || $('[flag = ' + flag + ']');
        }
        else { this.$target = null; }
        this.isHidden = false;
    }
    return $Core;
})(window.AR);

//Jquery 扩展定义
(function ($, $Core) {

    //转换input变成lable形式
    $.fn.toView = function ($input) {
        if ($input == undefined && this.length > 0 && this[0].tagName == "INPUT") {
            $input = this;
        }
        if ($input) {
            if ($input.css("display") != "none") {
                var width = $input.width();
                var value = $input.val();
                if ($input[0].tagName == "SELECT") {
                    value = $input.find("option:selected").text();
                }
                var cName = $input.attr("class");
                if (cName && cName.startWith("combo")) {
                    $input.parent().replaceWith($input);
                    if (cName.startWith("combo") && value == $Core.Lang.select) { value = ""; }
                }
                var $span = $("<span class='textvalue' title=" + value + ">" + value + "</span>");
                $span.css({ height: $input.height() + 5, width: width });
                $input.wrap($span);
            }
            else {
                //移除easyui下拉产生的隐藏域项
                var name = $input.attr("name") || $input.attr("comboname");
                if (name) {
                    var $form = this.parents("form")[0] || $(document);
                    $form.find(":input[type='hidden'][name='" + name + "']").each(function () {
                        $(this).remove();
                    });
                }
            }
            $input.remove();
        }
        else {
            this.find("select").each(function () {
                $.fn.toView($(this));
            });
            this.find(":input[type!='button'][type!='rest'][type!='hidden']").each(function () {
                $.fn.toView($(this));
            });
            //$(".combo,.datebox").each(function () {
            //    $(this).replaceWith($(".textvalue", $(this)));
            //})
        }
    }
    /**
    *@return {bool}
    */
    $.isNullOrEmpty = function (value) {
        if (value && $.trim(value) != "") {
            return false;
        } else {
            return true;
        }
    }
    //根据id、name、class 找到第一个满足条件的元素（elTag的默认值为input）。
    $.el = function (idOrNameOrClass, elTag) {
        var $input = undefined;
        if (idOrNameOrClass) {
            var $input = $("#" + idOrNameOrClass);
            if (!$input[0]) {
                if (!elTag) { elTag = 'input'; }
                $input = $($(elTag + "[name='" + idOrNameOrClass + "']")[0]);
                if (!$input[0]) {
                    $input = $($("." + idOrNameOrClass)[0]);
                }
            }
        }
        return $input;
    }
    //休眠
    $.sleep = function (n) {

        var start = new Date().getTime();

        while (true) if (new Date().getTime() - start > n) break;

    }
})(jQuery, window.AR);


// Javascript对象属性扩展定义
(function () {
    Array.prototype.remove = function (v, k) {
        if (this instanceof Array && v != undefined && v != null) {
            var value;
            for (var i = 0; i < this.length; i++) {
                value = k ? this[i][k] : this[i];
                if (value.toString() == v.toString()) {
                    this.splice(i, 1);  //利用splice()函数删除指定元素，splice() 方法用于插入、删除或替换数组的元素
                }
            }
        }
    };
    //是否包含指定的值（值，Key）
    Array.prototype.contains = function (v, k) {
        if (v == undefined) {
            return false;
        }
        if (this instanceof Array) {
            var value;
            for (var i = 0; i < this.length; i++) {
                value = k ? this[i][k] : this[i];
                if (value.toString() == v.toString()) {
                    return true;
                }
            }
        }
        return false;
    };
    //返回满足条件的第一个元素（原来的对象）
    Array.prototype.get = function (k, v) {
        if (this instanceof Array) {
            var result = [];
            for (var i = 0; i < this.length; i++) {
                if (this[i][k]) {
                    if (v == undefined || this[i][k].toString() == v.toString()) {
                        return this[i];
                    }
                }
            }
        }
        return null;
    };
    //找到满足条件的新的数组(在新的数组中)
    Array.prototype.select = function (k, v) {
        if (this instanceof Array) {
            var result = [];
            for (var i = 0; i < this.length; i++) {
                if (this[i][k]) {
                    if (v == undefined || this[i][k].toString() == v.toString()) {
                        result.push(this[i]);
                    }
                }
            }
            return result.length > 0 ? result : null;
        }
        return null;
    };

    /*解决easyui.min.js 里下拉多选的取消选择问题 By CYQ 2014.12.04*/
    Array.prototype.indexOf = function (e) {
        for (var i = 0, j; j = this[i]; i++) {
            if (j == e) { return i; }
        }
        return -1;
    }
    // 对Date的扩展，将 Date 转化为指定格式的String   
    // 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，   
    // 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)   
    // 例子：   
    // (new Date()).format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
    // (new Date()).format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
    Date.prototype.format = function (fmt) { //author: meizz   
        var o = {
            "M+": this.getMonth() + 1,                 //月份   
            "d+": this.getDate(),                    //日   
            "h+": this.getHours(),                   //小时   
            "m+": this.getMinutes(),                 //分   
            "s+": this.getSeconds(),                 //秒   
            "q+": Math.floor((this.getMonth() + 3) / 3), //季度   
            "S": this.getMilliseconds()             //毫秒   
        };
        if (/(y+)/.test(fmt))
            fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt))
                fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };
    String.prototype.endWith = function (str) {
        if (str == null || str == "" || this.length == 0 || str.length > this.length)
            return false;
        if (this.substring(this.length - str.length) == str)
            return true;
        else
            return false;
        return true;
    };
    String.prototype.startWith = function (str) {
        if (str == null || str == "" || this.length == 0 || str.length > this.length)
            return false;
        if (this.substr(0, str.length) == str)
            return true;
        else
            return false;
        return true;
    };
    String.prototype.trim = function (char, type) {
        if (char) {
            if (type == 'left') {
                return this.replace(new RegExp('^\\' + char + '+', 'g'), '');
            } else if (type == 'right') {
                return this.replace(new RegExp('\\' + char + '+$', 'g'), '');
            }
            return this.replace(new RegExp('^\\' + char + '+|\\' + char + '+$', 'g'), '');
        }
        return this.replace(/^\s+|\s+$/g, '');
    };
})();