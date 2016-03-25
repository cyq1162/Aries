//处理3个全局变量，避免框架外迁时的异常。
if (typeof (ui) == "undefined") {
    ui = "";//定义全局变量:Url前缀。
}
if (typeof (mid) == "undefined") {
    mid = "";//定义全局变量:菜单标识。
}
if (typeof (actionKeys) == "undefined") {
    ui = "";//定义全局变量:功能标识。
    actionKeys = "";
}

if (typeof (TY) != "object") {
    TY = new Object();
    TY.Global = {
        DG: {
            //datagrid集合
            Items: {},
            //当前操作的datagrid对象
            operating: null
        },
        config: {},
        m_combobox_json: [],
        //open window this value will be set
        operator: null
    };
    TY.handler = {
        ajax : ui + '/Ajax/AjaxHandler.ashx'
    };
}

(function ($,ty) {     
    ty.Utility = {
        /**
        *浅复制对象属性
        *@param{object} obj 对象
        */
        extendPrototype: function (obj) {
            function Obj() {
            }
            Obj.prototype = new o();
            return Obj;
        },
        //深度克隆对象
        cloneObjcet: function (obj) {
            var objClone;
            if (obj.constructor == Object) {
                objClone = new obj.constructor();
            } else {
                objClone = new obj.constructor(obj.valueOf());
            }
            for (var key in obj) {
                if (objClone[key] != obj[key]) {
                    if (typeof (obj[key]) == "object") {
                        objClone[key] = clone(obj[key]);
                    } else {
                        objClone[key] = obj[key];
                    }
                }
            }
            objClone.toString = obj.toString;
            objClone.valueOf = obj.valueOf;
            return objClone;
        },
        //克隆数组
        //hasObjcet,数组是否存在对象
        cloneArray: function (array, hasObjcet) {
            var newArray = [];
            if (array) {
                if (hasObjcet == true) {
                    for (var i = 0, len = array.length; i < len; i++) {
                        if (typeof (array[i]) == "object") {
                            newArray.push(this.cloneObjcet(array[i]));
                        } else {
                            newArray.push(array[i]);
                        }
                    }
                } else {
                    newArray = null;
                }
            }
            return newArray;
        },
        /**
         *字符串转为DOM对象
         *@param {string} html
        */
        parseDom: function (html) {
            var objE = document.createElement("div");
            objE.innerHTML = arg;
            return objE.childNodes;
        },
        /**
         *将普通数组转成树形数组，根据数组内对象的id跟parent属性过滤
         *@nodes {array} nodes
         *@return {array} 树形数组
        */
        //获取树形递归,nodes参数是一个对象数组，根据对象的id跟parent属性过滤
        gettree: function (nodes) {
            return function (parentid) {
                var cn = new Array();
                for (var i = 0; i < nodes.length; i++) {
                    var n = nodes[i];
                    n.id = n.value;
                    if (n.parent == parentid) {
                        n.children = arguments.callee(n.id);
                        cn.push(n);
                    }
                }
                return cn;
            }(undefined);
        },
        /**
        *初始化上传按钮
        *@param {string} path 上传至的服务地址,
        *@param {string} target 可以是ID、JQ对象、JS对象，
        *@param {string} fieldName 保存的文件名，此名字发送到后台，
        *@param {Array} exts 后缀约束 如：['xls','js','txt']
        */
        initUploadButton: function (path, target, fieldName, exts, onSubmit, onComplete, data) {
            var exts = exts.join(",");
            var _upload = new AjaxUpload(target, {
                action: path,
                name: fieldName,
                onSubmit: onSubmit,
                onComplete: onComplete
            });
        },
        Request: {
            /**
            *模拟.NET的Request对象
            *@param {string} key
            */
            queryString: function (key) {
                var svalue = location.search.match(new RegExp("[\?\&]" + key + "=([^\&]*)(\&?)", "i"));
                return svalue ? svalue[1] : svalue;
            }
        },
        StringFormat: {
            /**
            *模拟.NET的String.Format函数，调用方式String.Format("a={0}",'a')
            *@param {string} str 需要格式的字符串
            *@param {params} arguments
            */
            execute: function (str) {
                var len = arguments.length;
                var ostr = arguments[0].toString();
                for (var i = 0; i + 1 < len; i++) {
                    ostr = ostr.replace(new RegExp("\\{" + i + "\\}", "gim"), arguments[i + 1]);
                }
                return ostr;
            }
        },
        /**
        *验证值是否存在数组内
        *@param {Array} array
        *@param {object} value
        *@return {bool}
        */
        isInArray: function (array, value) {
            var result = false;
            each: for (var i = 0; i < array.length; i++) {
                if (array[i].toString() == value.toString()) {
                    result = true;
                    break each;
                }
            }
            return result;
        },
        /**
        *搜索对象是否存在数组
        *@param {array} array 对象数组
        *@param {object} obj 对象
        *@param {string} key 根据对象内想要对比的key
        *@return {bool}
        */
        objIsInArray: function (array, obj, key) {
            var result = false;
            f1: for (var i = 0; i < array.length; i++) {
                if (array[i][key] == obj[key]) {
                    result = true;
                    break f1;
                }
            }
            return result;
        },
        //生成随机guid数
        guid: function () {
            var S4 = function () {
                return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1);
            };
            return (S4() + S4() + "-" + S4() + "-" + S4() + "-" + S4() + "-" + S4() + S4() + S4());
        },
        /**
        *@param {int|double} s:传入的float数字 
        *@param{int} n:希望返回小数点几位
        */
        fmoney: function (s, n) {
            n = n > 0 && n <= 20 ? n : 2;
            s = parseFloat((s + "").replace(/[^\d\.-]/g, "")).toFixed(n) + "";
            var l = s.split(".")[0].split("").reverse(),
            r = s.split(".")[1];
            t = "";
            for (i = 0; i < l.length; i++) {
                t += l[i] + ((i + 1) % 3 == 0 && (i + 1) != l.length ? "," : "");
            }
            return t.split("").reverse().join("") + "." + r;
        },
        /**
        *将字符串转换成正常数字
        *@param {string} s 数字符串
        */
        rmoney: function (s) {
            return parseFloat(s.replace(/[^\d\.-]/g, ""));
        },
        loadJs: function (url, callback) {
            var done = false;
            var script = document.createElement('script');
            script.type = 'text/javascript';
            script.language = 'javascript';
            script.src = url;
            script.onload = script.onreadystatechange = function () {
                if (!done && (!script.readyState || script.readyState == 'loaded' || script.readyState == 'complete')) {
                    done = true;
                    script.onload = script.onreadystatechange = null;
                    if (callback) {
                        callback.call(script);
                    }
                }
            }
            document.getElementsByTagName("head")[0].appendChild(script);
        },
        loadCss: function (url, callback) {
            var link = document.createElement('link');
            link.rel = 'stylesheet';
            link.type = 'text/css';
            link.media = 'screen';
            link.href = url;
            document.getElementsByTagName('head')[0].appendChild(link);
            if (callback) {
                callback.call(link);
            }
        }
    };
    //Window对象域
    (function () {
        ty.Utility.Window = {
            refresh: false,
            //打开一个窗口,update 默认false既添加，如更新传递true，opts重写窗口属性，具体用法查看easyui window API
            open: open,
            //窗口的关闭事件
            close: close,
            showMsg: showMsg,
            confirm: confirm,
            openLoading: showLoading,
            closeLoading: closeLoading
        }
        function showLoading(message) {
            if ($("body")[0]) {
                var msg = message || "正在处理，请稍等......";
                var paddingtop = parseInt(document.documentElement.clientHeight / 2);
                var opacity = "opacity:.5;"
                var nv = navigator.userAgent.toLowerCase();
                if (/msie/.test(nv)) {
                    if (parseInt(/msie (\d+)/.exec(nv)[1]) < 10) {
                        opacity = "filter: alpha(opacity = 50);";
                    }
                }
                var loadingHtml = "<div id=\"LoadingDiv\" style='text-align:center; border:solid 2px #D4F0FC; font-weight: bold; float: left; width: 100%;  height:100%;line-height: 100%;  position: absolute;  top: 1px; left: 1px; z-index: 1000;" + opacity + "\" style=\"text-align: center; background-color:gray;  font-size: 14px; color: Red; padding-top:" + paddingtop + "px;'><div><img alt=\"\" src=\"/Style/Images/mask_loading.gif\" /></div><div>" + msg + "<span style='cursor:pointer' onclick=\"TY.Window.closeLoading();\">关闭</span></div></div>";

                if ($("#LoadingDiv")[0]) {
                    $("#LoadingDiv").show();
                }
                else {
                    $(document.body).append(loadingHtml);
                    $("#LoadingDiv").show();
                }
            }
        }
        //关闭遮罩层
        function closeLoading() {
            if ($("#LoadingDiv")[0]) {
                $("#LoadingDiv").remove();
                $("#LoadingDiv").hide();
            }
        }
        /**
        *打开一个新页面
        *@param{string} url 连接
        *@param{string} title 打开后的窗口标题
        *@param{bool} update 是否更新标记，默认false
        *param{object} opts easyui window属性覆盖
        */
        function open(url, title, update, opts) {
            if (update != undefined && typeof (update) != "boolean") {
                throw new TypeError("第三个参数传入的类型必须是布尔类型！");
            }
            if (update) {
                TY.Global.operator = "Update";
            } else {
                TY.Global.operator = "Add";
            }
            var iframe;
            iframe = $('<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:98%;"></iframe>');
            $("#AddWindow")[0] && $("#AddWindow").remove();
            var div = $("<div id='AddWindow' ></div>");
            var default_options = {
                title: title,
                border: false,
                fit: true,
                resizable: true,
                content: iframe,
                maximizable: false,
                minimizable: false,
                collapsible: false,
                modal: true,
                cache: false
            }
            div.window($.extend(default_options, opts));
        }
        function close() {
            if (this.refresh == true) {
                parent.location.reload();
            }
            window.parent.$("#AddWindow").window('close');
        }
        function confirm(msg, title, asyncFun) {
            $.messager.confirm(title || "温馨提示", msg, function (r) {
                if (r) {
                    if (typeof (asyncFun) == "function") {
                        asyncFun();
                    }
                }
            });
        }
        //注释看Easyui相关API
        function showMsg(msg, title, showType, timeout) {
            $.messager.show({
                title: title || "温馨提示",
                msg: msg,
                timeout: timeout || 1500,
                showType: showType || 'slide'
            });
        };
    })();
    //Ajax对象域
    (function () {
        ty.Utility.Ajax = {
            Settings: {
                url: TY.handler.ajax,
                method: 'GetList',
                data: {},
                dataType: null,
                async: true,
                callback: null,
            },
            get: function (fn, objName, data, async, url, callback, unShowLoding) {
                return ajax.call(this, fn, objName, data, async, 'GET', url, callback, unShowLoding);
            },
            post: function (fn, objName, data, async, url, callback, unShowLoding) {
                return ajax.call(this,fn, objName, data, async, 'POST', url, callback, unShowLoding);
            }
        }
        function ajax(fn, objName, data, async, type, url, callback, unShowLoding) {
            var that = this;
            var json = {};
            var opts = new Object();
            opts.data = data || that.Settings.data;
            if (!(data instanceof Array)) {
                opts.data.method = fn || that.Settings.method;
                opts.data.objName = objName;
                if (mid) {
                    opts.data.mid = mid; //附加菜单ID
                }
            } else {
                var item = { name: 'method', value: fn || that.Settings.method };
                opts.data.push(item);
                item = { name: 'objName', value: objName}
                opts.data.push(item);
                if (mid) {
                    item = { name: 'mid', value: mid }
                    opts.data.push(item);
                }
            }
            opts.callback = callback || that.Settings.callback;
            $.ajax({
                type: type,
                async: (async == false && (!callback)) ? false : that.Settings.async,
                url: url || that.Settings.url,
                data: opts.data,
                dataType: that.Settings.dataType || "json",
                success: function (d) {
                    if (opts.callback && typeof (opts.callback) != "function") {
                        throw TypeError("the callback parameter not is a function");
                    }
                    if (d.success == false && /登陆/.test(d.msg)) {
                        ty.Utility.Window.showMsg(d.msg);
                        json = null;
                    } else {
                        if (opts.callback) {
                            opts.callback(d);
                        }
                        opts.callback = undefined;
                        json = d;
                    }
                },
                error: function (d) {
                    try {
                        d = eval("(" + d.responseText + ")");
                        this.success(d);
                    }
                    catch (e) {
                        console.log("服务器返回数据出错");
                        //throw new Error("服务器返回数据出错");
                    }
                },
                beforeSend: function () {
                    if (!unShowLoding) {
                        ty.Utility.Window.openLoading();
                    }
                },
                complete: function () {
                    if (!unShowLoding) {
                        ty.Utility.Window.closeLoading();
                    }
                }
            });
            return json;
        }
    })();
})(jQuery, TY);


/**
*基于Jquery对象的扩展请写在此代码块内
*/
(function ($) {
    //渲染容器下的所有数据
    $.fn.Render = function (url, queryData, attrFlag, renderComplete) {
        queryData.mid = mid;//带上权限。
        var self = $(this);
        $.ajax({
            type: "post",
            url: url,
            data: queryData,
            success: function (d) {
                var jsondata = String2Json(d);
                if (jsondata) {
                    var jsonSource;
                    if (jsondata[0]) {
                        jsonSource = jsondata[0];
                    } else {
                        jsonSource = jsondata;
                    }
                    if (window.beforeRender && $.isFunction(window.beforeRender)) {
                        window.beforeRender(jsonSource);
                    }
                    self.find("[" + attrFlag + "]").each(function () {
                        var type = $(this).attr("type");
                        if (type) {

                            switch (type) {
                                case "checkbox":
                                    var ckb_checked = $(this).attr("value") == jsonSource[$(this).attr(attrFlag)] ? true : false;
                                    $(this).attr("checked", ckb_checked);
                                    break;
                                case "radio":
                                    var rdo_checked = $(this).attr("value") == jsonSource[$(this).attr(attrFlag)] ? true : false;
                                    if (rdo_checked) {
                                        $(this)[0].checked = rdo_checked;
                                    }
                                    break;
                                default:
                                    $(this).val(jsonSource[$(this).attr(attrFlag)]);
                                    break;
                            }
                        } else {
                            var tname = $(this)[0].tagName.toLowerCase();
                            if (tname == 'input' || tname == 'textarea') {
                                $(this).val(jsonSource[$(this).attr(attrFlag)]);
                            } else {
                                $(this).html(jsonSource[$(this).attr(attrFlag)]);
                            }
                        }
                    });
                    if (typeof (renderComplete) == 'function')
                        renderComplete(jsonSource);
                }
                self = null;
            },
            error: function () {

            }
        });
    }

    //jsondata,需要渲染的数据
    //attrFlag,需要渲染的标签标记,默认值 = name
    //renderComplete,渲染完成的事件参数是data
    $.fn.renderForm = function (jsondata, attrFlag, renderComplete) {
        if (jsondata) {
            var jsonSource;
            if (jsondata[0]) {
                jsonSource = jsondata[0];
            } else {
                jsonSource = jsondata;
            }
            attrFlag = attrFlag || 'name';
            $(this).find("[" + attrFlag + "]").each(function () {
                var type = $(this).attr("type");
                if (type) {
                    switch (type) {
                        case "checkbox":
                            var _value = jsonSource[$(this).attr(attrFlag)];
                            if ($.type(_value) == "boolean") {
                                $(this).attr("checked", _value);
                            } else {
                                var values = _value.split(',');
                                for (var i = 0; i < values.length; i++) {
                                    var ckb_checked = $(this).attr("value") == values[i] ? true : false;
                                    if (ckb_checked) {
                                        $(this).attr("checked", ckb_checked);
                                    }
                                }
                            }
                            break;
                        case "radio":
                            var rdo_checked = $(this).attr("value") == jsonSource[$(this).attr(attrFlag)] ? true : false;
                            if (rdo_checked) {
                                $(this)[0].checked = rdo_checked;
                            }
                            break;
                        default:
                            $(this).val(jsonSource[$(this).attr(attrFlag)]);
                            break;
                    }
                } else {
                    if ($(this).attr("value")) {

                    }
                    $(this).val(jsonSource[$(this).attr(attrFlag)]);
                }
            });
            if (typeof (renderComplete) == 'function')
                renderComplete(jsonSource);
        }
        self = null; //release object remenber
    }

    //转换input变成lable形式
    $.fn.ConvertToView = function () {
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
    $.IsNullOrEmpty = function (obj) {
        if (obj && obj.trim() != "") {
            return false;
        } else {
            return true;
        }
    }
})(jQuery)