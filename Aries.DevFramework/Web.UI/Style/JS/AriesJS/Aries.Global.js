
window.AR || (window.AR = {});
//多语言定义
(function ($Core) {
    $Core.Lang || ($Core.Lang = {});
    if ($Core.Lang.langKey == undefined) {
        $Core.Lang.edit = '编辑';
        $Core.Lang.del = '删除';
        $Core.Lang.detail = '查看详情';
        $Core.Lang.cancel = '取消';
        $Core.Lang.save = '保存';
    }

})(window.AR);

//AR.Global 定义
(function ($Core) {
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
    $Core.Config= {
        data: {},
        getText: function (configKey, value) {
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
        getValue: function (configKey, text) {
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
    $Core.Global = {
        DG: {
            //datagrid集合，根据ID取出DataGrid对象，将Json当数组用。
            Items: new $Core.Dictionary(),
            //当前操作的datagrid对象
            operating: null,
            //当前页面DataGrid操作，值为Update，Add
            action: null,
            PKTemplate: {
                edit: '<a class="bj" title="' + $Core.Lang.edit + '" op="1"></a>',
                del: '<a class="sc" title="' + $Core.Lang.del + '"></a>',
                detail: '<a class="ckxq" title="' + $Core.Lang.deltail + '" op="0"></a>',
                save: '<a class="bc" title="' + $Core.Lang.save + '"   op="0"></a>',
                cancel: '<a class="cx" title="' + $Core.Lang.cancel + '"   op="0"></a>'
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
                fit: true,
                fitColumns: true,
                pagination: true,
                rownumbers: true,
                autoRowHeight: false
            }
        },
        route: { root: 'ajax.html' },
        themes: ['default', 'black', 'gray', 'metro'],
        /*
        *页面全局变量
        *ui(虚拟应用程序的路径)，actionkeys（页面对应的权限集）,mid（当前菜单ID）
        */
        Variable: {},
        //存档用户信息
        _User: undefined,
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
                AR.Utility.Ajax.get("GetUserInfo", null, null, function (data) {
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
(function ($) {

    //转换input变成lable形式
    $.fn.toView = function () {
        $(this).find(":input[type!='button'][type!='rest']").each(function () {
            var $jqueryItem = jQuery(this);
            if ($jqueryItem.css("display") == "none" || $jqueryItem.attr("type") == "hidden") {
            } else {
                var width = $jqueryItem.width();
                var value = $jqueryItem.val();
                var $span = jQuery("<span class='viewTitle' title=" + value + " style='display:inline-block; overflow: hidden;text-overflow: ellipsis;white-space: nowrap;padding-left:3px;'>" + value + "</span>");
                $span.css({ height: $jqueryItem.height(), width: width });
                $jqueryItem.wrap($span);
            }
            $jqueryItem.remove();

        });
        var viewClass = "view";
        $(".combo,.datebox").each(function () {
            var className = jQuery(this).attr("class");
            $(this).removeClass(className);
            $(this).addClass(viewClass);
            $(".viewTitle", $(this)).siblings().remove();
        })
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
})(jQuery);


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
})();