
//AR.Utility 定义
(function ($, $Core) {
    $Core.Lang || ($Core.Lang = {});
    /*工具类，包含：窗体操作、Ajax请求、Cookie、以及其它常用方法*/
    $Core.Utility = {

        //深度克隆对象
        cloneObject: function (obj) {
            var objClone;
            if (obj.constructor == Object) {
                objClone = new obj.constructor();
            } else {
                objClone = new obj.constructor(obj.valueOf());
            }
            for (var key in obj) {
                if (objClone[key] != obj[key]) {
                    if (typeof (obj[key]) == "object") {
                        objClone[key] = this.cloneObject(obj[key]);
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
        cloneArray: function (array, hasObject) {
            var newArray = [];
            if (array) {
                if (hasObject == true) {
                    for (var i = 0, len = array.length; i < len; i++) {
                        if (typeof (array[i]) == "object") {
                            newArray.push(this.cloneObject(array[i]));
                        } else {
                            newArray.push(array[i]);
                        }
                    }
                }
                else {
                    for (var i = 0; i < array.length; i++) {
                        newArray.push(array[i]);
                    }
                }
            }
            return newArray;
        },

        /**
         *将普通数组转成树形数组，根据数组内对象的id跟parent属性过滤
         *@nodes {array} nodes
         *@return {array} 树形数组
        */
        //获取下拉树形递归,nodes参数是一个对象数组，根据对象的id跟parent属性过滤
        getTree: function (nodes) {
            return function (pid) {
                pid || (pid = ''); //undefined,null,都转''处理
                var cn = new Array();
                for (var i = 0; i < nodes.length; i++) {
                    var n = nodes[i];
                    n.parent || (n.parent = '')
                    if (n.parent == pid) {
                        n.id = n.value;
                        n.children = arguments.callee(n.id);
                        cn.push(n);
                    }
                }
                return cn;
            }(undefined);
        },

        /**
            *模拟.NET的Request对象
            *@param {string} key
            */
        queryString: function (key) {
            var svalue = location.search.match(new RegExp("[\?\&]" + key + "=([^\&]*)(\&?)", "i"));
            return svalue ? svalue[1] : svalue;
        },
        /**
            *模拟.NET的String.Format函数，调用方式String.Format("a={0}",'a')
            *@param {string} str 需要格式的字符串
            *@param {params} arguments
            */
        stringFormat: function (str, args) {
            var len = arguments.length;
            var ostr = arguments[0].toString();
            for (var i = 0; i + 1 < len; i++) {
                ostr = ostr.replace(new RegExp("\\{" + i + "\\}", "gim"), arguments[i + 1]);
            }
            return ostr;
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
        },
        Cookie: {
            get: function (name) {
                var c = document.cookie;
                var start = c.indexOf(name);
                if (start > -1) {
                    start = start + name.length + 1;
                    var end = c.indexOf(';', start);
                    if (end > start) {
                        return c.substr(start, end - start);
                    }
                    return c.substr(start, c.length - start);
                }

            },
            set: function (key, value, expiredays) {
                var exdate = new Date();
                exdate.setDate(exdate.getDate() + expiredays);
                document.cookie = key + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString());
            },
            remove: function (name) {
                var exp = new Date();
                exp.setTime(exp.getTime() - 1);
                var cval = this.get(name);
                if (cval != null) { document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString(); }
            }
        },
        download: function (method, data, url) {
            var url = url || $Core.Global.route, frame_id = "f_id", frame_name = "f_name";
            data || (data = {}), $form = $("<form>");
            $("#" + frame_id).remove();
            $ifrme = $("<iframe>").attr("id", frame_id).attr("name", frame_name).css({ display: 'none' });
            $form.attr("action", url).attr("target", frame_name)
                .append($("<input>").attr("name", "sys_method").val(method));
            if (parent != null && parent != window) {
                $form.append($("<input>").attr("name", "sys_mid").val($Core.Utility.getSysmid()));
            }
            if (data) { for (var i in data) { $form.append($("<input>").attr("name", i).val(data[i])); } };
            $("body").append($ifrme).append($form);
            $form[0].submit();
            $ifrme.on('load', function () {
                var doc = this.contentDocument || this.contentWindow.document;
                var result = JSON.parse(doc.body.innerHTML);
                $Core.Utility.Window.showMsg(result.msg);
                $form.remove();
            });
        },
        getPageWindow: function () {
            var win = (function (win) {
                var ar = win.AR;
                if (ar.Global.Variable.mid || win == win.top) {
                    return win;
                }
                return arguments.callee(win.parent.window);
            })(window);
            return win;
        },
        getSysmid: function () {
            var topWin = window, mid = $Core.Global.Variable.mid;
            if (!mid) {
                mid = (function (win) {
                    var ar = win.AR;
                    if (ar.Global.Variable.mid || win == win.top) {
                        return ar.Global.Variable.mid;
                    }
                    return arguments.callee(win.parent.window);
                })(topWin);
            }
            return mid;
        }


    };
    //Window对象域
    (function () {
        $Core.Utility.Window = {
            refresh: false,
            /*打开一个窗口,
            * update 默认false既添加，如更新传递true,调用此函数会触发更新AR.Global.DG.action的值
            *，opts重写窗口属性，具体用法查看easyui window API
            */
            open: open,
            //窗口的关闭事件
            close: close,
            showMsg: showMsg,
            confirm: confirm,
            openLoading: showLoading,
            closeLoading: closeLoading,
            dialog: dialog,
            closeDialog: closeDialog
        }
        function showLoading(message) {
            if ($("body")[0]) {
                var msg = message || "Loading......";
                var paddingtop = parseInt(document.documentElement.clientHeight / 2);
                var opacity = "opacity:.5;"
                var nv = navigator.userAgent.toLowerCase();
                if (/msie/.test(nv)) {
                    if (parseInt(/msie (\d+)/.exec(nv)[1]) < 10) {
                        opacity = "filter: alpha(opacity = 50);";
                    }
                }
                var loadingHtml = "<div id=\"LoadingDiv\" style='text-align:center; border:solid 2px #D4F0FC; font-weight: bold; float: left; width: 100%;  height:100%;line-height: 100%;  position: absolute;  top: 1px; left: 1px; z-index: 1000;" + opacity + "\" style=\"text-align: center; background-color:gray;  font-size: 14px; color: Red; padding-top:" + paddingtop + "px;'><div><img alt=\"\" src=\"/Style/Theme/EasyUI/default/images/loading.gif\" /></div><div>" + msg + "<span style='cursor:pointer' onclick=\"AR.Window.closeLoading();\">关闭</span></div></div>";

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
        *@param{bool}   isUpdate 是否更新标记，默认false
        *param{object}  opts easyui window属性覆盖
        */
        function open(url, title, isUpdate, opts) {
            if (isUpdate) {
                AR.Global.DG.action = "Update";
            } else {
                AR.Global.DG.action = "Add";
            }
            var iframe;
            iframe = $('<iframe src="' + url + '" frameborder="0" style="border:0;width:100%;height:98%;"></iframe>');
            $("#AddWindow")[0] && $("#AddWindow").remove();
            var div = $("<div id='AddWindow' ></div>");
            var defaultOptions = {
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
            if (opts) {
                if (typeof (opts) == "string") {
                    opts = JSON.parse(opts)
                }
                if (opts.width || opts.height) {
                    defaultOptions.fit = false;
                }
            }
            div.window($.extend(defaultOptions, opts));
        }
        function close() {
            if (this.refresh == true) {
                parent.location.reload();
            }
            window.parent.$("#AddWindow").window('close');
        }
        function confirm(msg, title, okEvent, cancelEvent) {
            $.messager.confirm(title || $Core.Lang.prompt, msg, function (isOK) {
                if (isOK) {
                    okEvent && okEvent();
                }
                else {
                    cancelEvent && cancelEvent();;
                }
            });
        }
        //注释看Easyui相关API
        function showMsg(msg, title, showType, timeout, opts) {
            $.messager.show($.extend({
                title: title || $Core.Lang.msg,
                msg: msg,
                timeout: timeout || 1500,
                showType: showType || 'slide'
            }, opts));
        }
        function dialog(title, html, opts) {
            var _container = $("#_div_dialog");
            _container[0] || (_container = $('<div>').attr('id', '_div_dialog'));
            opts = $.extend({
                title: title,
                width: 800,
                height: 450,
                modal: true,
                content: html
            }, opts);
            _container.dialog(opts)
        }
        function closeDialog() {
            var _container = $("#_div_dialog");
            _container.dialog('destroy');
        }
    })();
    //Ajax对象域
    (function () {
        /***/
        $Core.Utility.Ajax = {
            Settings: {
                url: $Core.Global.route,
                method: 'GetList',
                data: {},
                dataType: 'json',
                async: true,
                callback: null
            },
            get: function (method, objName, data, callback, isShowProgress, dataType) {
                return ajax.call(this, method, objName, data, false, 'GET', null, callback, isShowProgress, dataType);
            },
            post: function (method, objName, data, callback, isShowProgress, dataType) {
                return ajax.call(this, method, objName, data, false, 'POST', null, callback, isShowProgress, dataType);
            }
        }
        function ajax(method, objName, data, async, type, url, callback, isShowProgress, dataType) {
            var that = this, json = {}, opts = new Object(), mid = $Core.Global.Variable.mid;
            var str = '{0}?sys_method={1}';
            if (objName) {
                var items = objName.split(',');
                if (objName.indexOf(',') == -1 || !items[1] || items[1] == "null") {
                    str = '{0}?sys_method={1}&sys_objName=' + items[0];
                }
                else {
                    str = '{0}?sys_method={1}&sys_objName=' + items[0] + '&sys_tableName=' + items[1];
                }
            }
            str += "&sys_rnd=" + Math.random();
            url = $Core.Utility.stringFormat(str, url || that.Settings.url, method);
            opts.data = data || that.Settings.data;
            if (parent != null && parent != window) {
                var mid = $Core.Utility.getSysmid();
                if (!(data instanceof Array)) {
                    opts.data.sys_mid = mid;
                } else {
                    var item = { name: 'sys_mid', value: mid }
                    opts.data.unshift(item);
                }
            }
            opts.callback = callback || that.Settings.callback;
            opts.dataType = dataType || that.Settings.dataType;
            var ajaxOpts =
            {
                type: type,
                async: (async == false && !callback) ? false : that.Settings.async,
                url: url || that.Settings.url,
                data: opts.data,
                dataType: opts.dataType,
                //headers: {
                //    "Referer":location.href
                //},
                success: function (d) {
                    if (opts.callback && typeof (opts.callback) != "function") {
                        throw TypeError("the callback parameter not is a function");
                    }
                    if (d.success == false && d.msg && d.msg.startWith("/") && d.msg.endWith(".html")) {
                        location.href = d.msg;//跳转到登陆。
                    }
                    else if (d.success == false && d.msg && !opts.callback && $.messager) {
                        $Core.Utility.Window.showMsg(d.msg);//需要引用easyui，而其它页面可能没有
                        json = null;
                    }
                    else {
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
                        console.log("eval json error : " + d.responseText);
                    }
                },
                beforeSend: function () {
                    if (isShowProgress) {
                        $Core.Utility.Window.openLoading();
                    }
                },
                complete: function () {
                    if (isShowProgress) {
                        $Core.Utility.Window.closeLoading();
                    }
                }
            };
            ////检测是否文件上传,FormData 不支持IE 10以下，所以重写AjaxUpload，并使用它来上传
            //if (FormData != null && opts.data instanceof FormData) {
            //    ajaxOpts.processData = false;
            //    ajaxOpts.contentType = false;
            //}
            $.ajax(ajaxOpts);
            return json;
        }
    })();
})(jQuery, AR);