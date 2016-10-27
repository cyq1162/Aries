//AR.Global 定义
window.AR = (function ($Core) {
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
    $Core.Global = {
        DG: {
            //datagrid集合，根据ID取出DataGrid对象，将Json当数组用。
            Items: new $Core.Dictionary(),
            //当前操作的datagrid对象
            operating: null,
            //当前页面DataGrid操作，值为Update，Add
            action: null,
            PKTemplate: {
                edit: '<a class="bj" title="编辑" op="1"></a>',
                del: '<a class="sc" title="删除"></a>',
                detail: '<a class="ckxq" title="查看详情" op="0"></a>',
                picture: '<a  class="cktp" title="查看图片" op="0"></a>',
                download: '<a  class="xz" title="下载" op="0"></a>',
                save: '<a class="bc" title="保存"   op="0"></a>',
                file: '<a class="wj" title="文件"   op="0"></a>',
                save: '<a class="bc" title="保存"   op="0"></a>',
                upload: '<a class="bc" title="上传"   op="0"></a>',
                remove: '<a class="sc" title="移除"   op="0"></a>'
            }
        },
        route: { root: 'ajax.html' },
        themes: ['default', 'black', 'gray', 'metro'],
        //存档objname下拉数的数据。
        comboxData: [],
        //存档Config_KeyValue的数据。
        Config: {},
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
})(window.AR || {});

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
    $.isNullOrEmpty = function (obj) {
        if (obj && obj.trim() != "") {
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
                    return;
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
    Array.prototype.get = function (k, v) {
        if (this instanceof Array) {
            var result = [];
            for (var i = 0; i < this.length; i++) {
                if (this[i][k]) {
                    if (v == undefined) {
                        return this[i][k];
                    }
                    else if (this[i][k].toString() == v.toString()) {
                        result.push(this[i]);
                    }
                }
            }
            return result.length > 0 ? result : null;
        }
        return null;
    };
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