(function ($Core) {
    $Core.Lang || ($Core.Lang = {});
    /**
    * @requires jQuery,EasyUI
    * 
    * panel关闭时回收内存，主要用于layout使用iframe嵌入网页时的内存泄漏问题
    */
    $.fn.panel.defaults.onBeforeDestroy = function () {
        var frame = $('iframe', this);
        try {
            if (frame.length > 0) {
                for (var i = 0; i < frame.length; i++) {
                    frame[i].contentWindow.document.write('');
                    frame[i].contentWindow.close();
                }
                frame.remove();
                if ($.browser.msie) {
                    CollectGarbage();
                }
            }
        } catch (e) {
        }
    };

    /**
    * 
    * @requires jQuery,EasyUI
    * 
    * 通用错误提示
    * 
    * 用于datagrid/treegrid/tree/combogrid/combobox/form加载数据出错时的操作
    */
    var easyuiErrorFunction = function (XMLHttpRequest) {
        $.messager.progress('close');
        //$.messager.alert('错误', XMLHttpRequest.responseText);
        alert("error:" + XMLHttpRequest.responseText);
    };
    $.fn.datagrid.defaults.onLoadError = easyuiErrorFunction;
    $.fn.treegrid.defaults.onLoadError = easyuiErrorFunction;
    $.fn.tree.defaults.onLoadError = easyuiErrorFunction;
    $.fn.combogrid.defaults.onLoadError = easyuiErrorFunction;
    $.fn.combobox.defaults.onLoadError = easyuiErrorFunction;
    $.fn.form.defaults.onLoadError = easyuiErrorFunction;

    /*
    * 将后端的列表数据，解析成tree格式的数据。
    */
    $.fn.tree.defaults.loadFilter = function (data, parent) {
        if (parent) {
            //新增（直接返回）
            return data;
        } else {
            var opt = $(this).data().tree.options;
            if (data.rows) {
                data = data.rows;
            }
            try {
                //for (var i = 0; i < length; i++) {

                //}
                var data = _getTreeData(data, opt.idField || 'id', opt.textField || 'text', opt.parentField || '_parentId', opt.rootID);
            } catch (ex) {
                return data;
            }
            var root = [{ 'text': opt.rootText || $Core.Lang.root, 'id': opt.rootID || undefined }];
            root[0].children = data;
            _openFirstNode(root);
            return root;
        }
    };
    _getTreeData = function (nodes, idField, textField, parentField, rootID) {
        return function (parentid) {
            var cn = new Array();
            for (var i = 0; i < nodes.length; i++) {
                var n = {}, attrs = {};
                each: for (var j in nodes[i]) {
                    if (j == idField || j == textField) {
                        continue each;
                    }
                    attrs[j] = nodes[i][j];
                }
                if (!n.attributes) {
                    n.attributes = attrs;
                }
                n.id = nodes[i][idField], n.text = nodes[i][textField];
                if (nodes[i][parentField] == parentid) {
                    n.children = arguments.callee(nodes[i][idField]);
                    if (!n.children.length == 0) {
                        n.state = 'closed';
                    }
                    cn.push(n);
                }
            }
            return cn;
        }(rootID);
    }
    _openFirstNode = function (data) {
        if (data[0].children && data[0].children.length > 0) {
            data[0].state = 'open';
            arguments.callee(data[0].children);
        }
    }
    /*
   * 将后端的列表数据，解析成treegrid格式的数据。
   */
    $.fn.treegrid.defaults.loadFilter = function (data) {
        var op = $(this).data().treegrid.options;
        if (data.rows) {
            var pagination = $(this).treegrid('getPager');//处理记录总数
            $(pagination).pagination({
                total: data.total
            });
            data = data.rows;
        }

        var id = op.idField, name = op.treeField, pid = op.parentField;
        if (pid) {
            var i, l, treeData = [], tmpMap = {};
            for (i = 0, l = data.length; i < l; i++) {
                data[i][name] || (data[i][name] = '');//处理null为空
                tmpMap[data[i][id]] = data[i];
            }
            for (i = 0, l = data.length; i < l; i++) {
                if (tmpMap[data[i][pid]] && data[i][id] != data[i][pid]) {
                    tmpMap[data[i][pid]]['children'] || (tmpMap[data[i][pid]]['children'] = []);
                    tmpMap[data[i][pid]]['children'].push(data[i]);
                }
                else {
                    treeData.push(data[i]);
                }
            }
            data = null;
            tmpMap = null;
            return treeData;
        }
        return data;
    };
    /*
  * 检测数据，未登陆时跳转到登陆。
  */
    $.fn.datagrid.defaults.loadFilter = function (d) {
        if (d.success == false && d.msg && d.msg.startWith("/") && d.msg.endWith(".html")) {
            location.href = d.msg;//跳转到登陆。
        }
        return d;
    }
    /**
    * 重写 Jquery-Easyui form的load事件，不区分大小写
    */
    var _formload = $.fn.form.methods.load;
    $.fn.form.methods.load = function (jq, param) {
        for (var i in param) {/*处理下拉绑定Boolean类型的数据还原。*/
            if (typeof (param[i]) == "boolean") {
                param[i] = param[i] == true ? 1 : 0;
            }
        }
        //兼容Oracle，不区分大小写
        var _name, _lowerName;
        $("[name],[comboname]").each(function () {
            _name = $(this).attr('name') || $(this).attr('comboname');
            if (_name != undefined) {
                _lowerName = _name.toLowerCase();
                for (var i in param) {
                    if (i != _name && i.toLowerCase() == _lowerName) {
                        param[_name] = param[i];//追加数据，原来的保留不变
                        break;
                    }
                }
            }
        });
        _formload(jq, param);
        $(":checkbox").each(function () {
            var _value = param[$(this).attr('name')];
            if (_value == 1 || $.type(_value) == "boolean") {
                $(this).attr("checked", _value);
            }
        });
        $("span[name],label[name]").each(function () {
            var value = param[$(this).attr('name')];
            if (value != undefined) {
                $(this).html(value);
            }
        });
    }

    //重写 下拉框的搜索，不区分大小写
    $.fn.combobox.defaults.filter = function (q, row) {
        var opts = $(this).combobox('options');
        return row[opts.textField].toLowerCase().indexOf(q.toLowerCase()) > -1;
    }
    //重写 下拉框，当文本和值相同时，允许后端不传值，前端补
    $.fn.combobox.defaults.loadFilter = function (data) {
        if (data && data.length > 0) {
            for (var i = 0; i < data.length; i++) {
                if (data[i].value == undefined) {
                    data[i].value = data[i].text;
                }
            }
        }
        return data;
    },
    //扩展datagrid的编辑器类型：datetimebox
    $.extend($.fn.datagrid.defaults.editors, {
        datetimebox: {
            init: function (container, options) {
                var editor = $('<input/>').appendTo(container);
                if (!options) { options = {}; }
                if (options) {
                    options.editable = false;
                    editor.datetimebox(options);
                }
                return editor;
            },
            getValue: function (target, value) {
                return $(target).datetimebox('getValue');
            },
            setValue: function (target, value) {
                $(target).datetimebox('setValue', value);
            },
            resize: function (target, width) {
                $(target).datetimebox('resize', width);
            },
            destroy: function (target) {
                $(target).datetimebox('destroy');
            }
        },

        window: {
            init: function (container, options) {
                var editor = $('<input/>').appendTo(container);
                editor.attr("options",JSON.stringify(options));
                editor.enableEdit = false;
                return editor;
            },
            getValue: function (target) {
                return $(target).val();
            },
            setValue: function (target, value) {
                $(target).val(value);
                var opts = JSON.parse($(target).attr("options"));
                AR.Global.Dialog.$target = $(target);
                AR.Global.Dialog.options = opts;
                //url, title, isUpdate, opts
                AR.Utility.Window.open(opts.url, opts.title, false, opts);
            },
            resize: function (target, width) {
            },
            destroy: function (target) {
            }
        }
    });

    //扩展validatebox，添加验证两次密码功能
    $.extend($.fn.validatebox.defaults.rules, {
        //中文
        CHS: {
            validator: function (value, param) {
                return /^[\u0391-\uFFE5]+$/.test(value);
            },
            message: $Core.Lang.isChinese
        },
        pwd: {
            validator: function (value, param) {
                return /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])[^'\"%/\\\\]{6,20}$/.test(value);
            },
            message: $Core.Lang.isPwd
        },
        eqPwd: {
            validator: function (value, param) {
                return value == $(param[0]).val();
            },
            message: $Core.Lang.isSamePwd
        },// start ---2013-12-3 lzw 修正验证手机正则和单个电话
        mobile: {
            validator: function (value, param) {
                return /^1[3|4|5|7|8|9][0-9]\d{8}$/.test(value);
            },
            message: $Core.Lang.isMobile
        },
        tel: {
            validator: function (value, param) {
                return /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}$/.test(value);
            },
            message: $Core.Lang.isTelePhone
        },// end ---2013-12-3 lzw
        loginName: {
            validator: function (value, param) {
                return /^[\u0391-\uFFE5\w]+$/.test(value);
            },
            message: $Core.Lang.isUserName
        },
        number: {
            validator: function (value, param) {
                return /^(-?\d+)(\.\d+)?$/.test(value);
            },
            message: $Core.Lang.isNumber
        },
        // start ---2013-12-3 lzw
        idcard: {
            validator: function (value, param) {
                if (value.indexOf('x') > 0) {
                    return (/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/).test(value.replace('x', '0'));
                }
                if (value.indexOf('X') > 0) {
                    return (/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/).test(value.replace('X', '0'));
                }
                return (/^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{4}$/).test(value);
                //  return /^\d{15}(\d{2}[A-Za-z0-9])?$/i.test(value);
            },
            message: $Core.Lang.isID
        },
        telormobile: {
            validator: function (value, param) {
                return /^((\d{3,4}\s+)?\d{7,8}$|(\d{3,4}-)?\d{7,8}$|1[3|4|5|8][0-9]\d{4,8})$/.test(value);
            },
            message: $Core.Lang.isMobileOrTelePhone
        },
        combobox: {
            validator: function (value, param) {
                return $.trim(value) != $Core.Lang.select
            },
            message: $Core.Lang.selectData
        },
        datebox: {
            validator: function (value, param) {
                return /^\d{4}(-|\/)\d{2}(-|\/)\d{2}\s?(\d{2}:\d{2})?(:\d{2})?$/.test(value);
            },
            message: $Core.Lang.isDateTime
        },
        exists: {
            validator: function (value, param) {
                if (!param[0]) {
                    this.message = $Core.Lang.ruleError;
                    return false;
                }
                var data = {};
                data.n = param[0].name || param[0];
                data.v = value;
                if (data.n.indexOf(',') > -1) {
                    var items = data.n.split(',');
                    if (items.length > 1) {
                        data.n = items[0];
                        var $input = $(":input[name='" + items[1] + "']");
                        if ($input) {
                            data.n2 = items[1];
                            data.v2 = $input.val();
                        }
                        if (items.length > 2) {
                            var $input = $(":input[name='" + items[2] + "']");
                            if ($input) {
                                data.n3 = items[2];
                                data.v3 = $input.val();
                            }

                        }
                    }
                }
                var id = param[1] || AR.Utility.queryString('id');
                if (id) data.id = id;
                //method, objName, data, async, url, callback, isShowProgress
                var result = AR.Utility.Ajax.get("Exists", AR.Form.tableName, data);
                if (result) {
                    if (result.success) {
                        this.message = $Core.Lang.dataExists;
                        return false;
                    }
                    return true;
                }
                else {
                    this.messgage = $Core.Lang.requestFail;
                    return false;
                }
            }
        },

        //multiple: {
        //    validator: function (value, vtypes) {
        //        var returnFlag = true;
        //        var opts = $.fn.validatebox.defaults;
        //        for (var i = 0; i < vtypes.length; i++) {
        //            var methodinfo = /([a-zA-Z_]+)(.*)/.exec(vtypes[i]);
        //            var rule = opts.rules[methodinfo[1]];
        //            if (value && rule) {
        //                var parame = eval(methodinfo[2]);
        //                if (!rule["validator"](value, parame)) {
        //                    returnFlag = false;
        //                    this.message = rule.message;
        //                    break;
        //                }
        //            }
        //        }
        //        return returnFlag;
        //    }
        //},
        length: {
            validator: function (value, param) {
                this.message = $Core.Lang.isLength;
                var len = $.trim(value).length;
                if (param) {
                    for (var i = 0; i < param.length; i++) {
                        this.message = this.message.replace(new RegExp(
                                        "\\{" + i + "\\}", "g"), param[i]);
                    }
                }
                return len >= param[0] && len <= param[1];
            },
            message: $Core.Lang.isLength
        },
        email: {
            validator: function (value, param) {
                return /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(value);
            },
            message: $Core.Lang.isEmail
        },
        year: {
            validator: function (value, param) {
                return /^19[0-9][0-9]|20[0-9][0-9]$/.test(value);
            },
            message: $Core.Lang.isYear
        }
        //end extends
    });
})(AR);