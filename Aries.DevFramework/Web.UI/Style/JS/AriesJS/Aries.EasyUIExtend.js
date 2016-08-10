//________________________________________________________基础扩展部分begin_____________________________________________________________________________

/**
* @author 孙宇
* 
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
* @author 孙宇
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
    alert(XMLHttpRequest.responseText);
};
$.fn.datagrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.treegrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.tree.defaults.onLoadError = easyuiErrorFunction;
$.fn.combogrid.defaults.onLoadError = easyuiErrorFunction;
$.fn.combobox.defaults.onLoadError = easyuiErrorFunction;
$.fn.form.defaults.onLoadError = easyuiErrorFunction;


/**
* @author 孙宇
* 
* @requires jQuery,EasyUI
* 
* 为datagrid、treegrid增加表头菜单，用于显示或隐藏列，注意：冻结列不在此菜单中
*/
//var createGridHeaderContextMenu = function (e, field) {
//    e.preventDefault();
//    var grid = $(this); /* grid本身 */
//    var headerContextMenu = this.headerContextMenu; /* grid上的列头菜单对象 */
//    if (!headerContextMenu) {
//        var tmenu = $('<div style="width:100px;"></div>').appendTo('body');
//        var fields = grid.datagrid('getColumnFields');
//        for (var i = 0; i < fields.length; i++) {
//            var fildOption = grid.datagrid('getColumnOption', fields[i]);
//            if (!fildOption.hidden) {
//                $('<div iconCls="icon-ok" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
//            } else {
//                $('<div iconCls="icon-empty" field="' + fields[i] + '"/>').html(fildOption.title).appendTo(tmenu);
//            }
//        }
//        headerContextMenu = this.headerContextMenu = tmenu.menu({
//            onClick: function (item) {
//                var field = $(item.target).attr('field');
//                if (item.iconCls == 'icon-ok') {
//                    grid.datagrid('hideColumn', field);
//                    $(this).menu('setIcon', {
//                        target: item.target,
//                        iconCls: 'icon-empty'
//                    });
//                } else {
//                    grid.datagrid('showColumn', field);
//                    $(this).menu('setIcon', {
//                        target: item.target,
//                        iconCls: 'icon-ok'
//                    });
//                }
//            }
//        });
//    }
//    headerContextMenu.menu('show', {
//        left: e.pageX,
//        top: e.pageY
//    });
//};
//$.fn.datagrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;
//$.fn.treegrid.defaults.onHeaderContextMenu = createGridHeaderContextMenu;

/**
* @author 梁水
* 
* @requires jQuery,EasyUI
* 
* 扩展tree，使其支持平滑数据格式
*/
$.fn.tree.defaults.loadFilter = function (data, parent) {
    if (parent) {
        return data;
    } else {
        var opt = $(this).data().tree.options;
        if (data.rows) {
            data = data.rows;
        }
        try{
            var data = _getTreeData(data, opt.idField || 'id', opt.textField || 'text', opt.parentField || '_parentId', opt.rootID);
        } catch (ex) {
            return data;
        }
        var root = [{ 'text': opt.rootText || '根目录', 'id': opt.rootID || undefined }];
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

/**
* @author 孙宇
* 
* @requires jQuery,EasyUI
* 
* 扩展treegrid，使其支持平滑数据格式
*/
//$.fn.treegrid.defaults.loadFilter = function (data) { 
//    var dg = $(this); 
//    var opts = dg.treegrid('options'); 
//    var parentField = opts.parentField || '_parentId'; 
//     
//    if ($.isArray(data)) {    // is array  
//        data = {
//            total: data.length,
//            rows: data
//        }
//    }

//    if (!data.topRows) {
//        data.topRows = [];
//        data.childRows = [];
//        for (var i = 0; i < data.rows.length; i++) {
//            var row = data.rows[i];
//            parentField ? data.childRows.push(row) : data.topRows.push(row);
//        } 
//    }
//    var start = (opts.pageNumber - 1) * parseInt(opts.pageSize);
//    var end = start + parseInt(opts.pageSize);
//    data.rows = $.extend(true, [], data.topRows.slice(start, end).concat(data.childRows));
//    return data;
//};

$.fn.treegrid.defaults.loadFilter = function (data, parentId) {
    var opt = $(this).data().treegrid.options, bindData = {};
    var pagination = $(this).datagrid('getPager');
    $(pagination).pagination({
        total: data.total,
        beforePageText: '第', //页数文本框前显示的汉字  
        afterPageText: '页    共 {pages} 页',
        displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录'
    });

    if (data.rows && opt.parentField) {
        bindData.total = data.total;
        bindData.rowcount = data.rowcount;
        data = data.rows;//2014-4-28,修改人：梁水
    }
    var idField, treeField, parentField;
    if (opt.parentField) {
        idField = opt.idField || 'id';
        treeField = opt.treeField || 'text';
        parentField = opt.parentField || '_parentId';
        var i, l, treeData = [], tmpMap = [];
        for (i = 0, l = data.length; i < l; i++) {
            tmpMap[data[i][idField]] = data[i];
        }
        for (i = 0, l = data.length; i < l; i++) {
            if (tmpMap[data[i][parentField]] && data[i][idField] != data[i][parentField]) {
                if (!tmpMap[data[i][parentField]]['children'])
                    tmpMap[data[i][parentField]]['children'] = [];
                data[i]['text'] = data[i][treeField];
                tmpMap[data[i][parentField]]['children'].push(data[i]);
            } else {
                data[i]['text'] = data[i][treeField];
                treeData.push(data[i]);
            }
        }
        bindData.rows = treeData;
        // return bindData;
        return treeData;
    }
    return data;
};


/**
* @author 梁水 
* 重写 Jquery-Easyui reload，reload之前取消选中所有行
*/
var _reload = $.fn.datagrid.methods.reload;
$.fn.datagrid.methods.reload = function (jq, param) {
    jq.datagrid("unselectAll");
    jq.datagrid("uncheckAll");
    _reload(jq, param);
}
/**
* @author 梁水 
* 重写 Jquery-Easyui form的load事件
*/
var _formload = $.fn.form.methods.load;
$.fn.form.methods.load = function (jq, param) {

    for (var i in param) {/*处理下拉绑定Boolean类型的数据还原。*/
        if (typeof (param[i]) == "boolean") {
            param[i] = param[i] == true ? 1 : 0;
        }
    }
    _formload(jq, param);
    $(":checkbox").each(function () {
        var _value = param[$(this).attr('name')];
        if (_value == 1 || $.type(_value) == "boolean") {
            $(this).attr("checked", _value);
        }
    });
}



$.extend($.fn.datagrid.methods, {
    addToolbarItem: function (jq, items) {
        return jq.each(function () {
            var dpanel = $(this).datagrid('getPanel');
            var toolbar = dpanel.children("div.datagrid-toolbar");
            if (!toolbar.length) {
                toolbar = $("<div class=\"datagrid-toolbar\"><table cellspacing=\"0\" cellpadding=\"0\"><tr></tr></table></div>").prependTo(dpanel);
                $(this).datagrid('resize');
            }
            var tr = toolbar.find("tr");
            for (var i = 0; i < items.length; i++) {
                var btn = items[i];
                if (btn == "-") {
                    $("<td><div class=\"datagrid-btn-separator\"></div></td>").appendTo(tr);
                } else {
                    var td = $("<td></td>").appendTo(tr);
                    var b = $("<a href=\"javascript:void(0)\"></a>").appendTo(td);
                    b[0].onclick = eval(btn.handler || function () { });
                    b.linkbutton($.extend({}, btn, {
                        plain: true
                    }));
                }
            }
        });
    },
    removeToolbarItem: function (jq, param) {
        return jq.each(function () {
            var dpanel = $(this).datagrid('getPanel');
            var toolbar = dpanel.children("div.datagrid-toolbar");
            var cbtn = null;
            if (typeof param == "number") {
                cbtn = toolbar.find("td").eq(param).find('span.l-btn-text');
            } else if (typeof param == "string") {
                cbtn = toolbar.find("span.l-btn-text:contains('" + param + "')");
            }
            if (cbtn && cbtn.length > 0) {
                cbtn.closest('td').remove();
                cbtn = null;
            }
        });
    }
});

/**
    * @author 林少平
    * date : 2014/09/26
    * datagrid动态添加移除编辑功能
    */
$.extend($.fn.datagrid.methods, {
    addEditor: function (jq, param) {
        if (param instanceof Array) {
            $.each(param, function (index, item) {
                var e = $(jq).datagrid('getColumnOption', item.field);
                e.editor = item.editor;
            });
        } else {
            var e = $(jq).datagrid('getColumnOption', param.field);
            e.editor = param.editor;
        }
    },
    removeEditor: function (jq, param) {
        if (param instanceof Array) {
            $.each(param, function (index, item) {
                var e = $(jq).datagrid('getColumnOption', item);
                e.editor = {};
            });
        } else {
            var e = $(jq).datagrid('getColumnOption', param);
            e.editor = {};
        }
    }
});

$.extend($.fn.datagrid.defaults.editors, {
    auditradio: {
        init: function (container, options) {
            var input = $('<div id = "auditdiv"><input type="radio" value="1" name="auditFlag">通过<input type="radio" value="0" name="auditFlag">不通过</div>').appendTo(container);
            return input;
        },
        getValue: function (target) {
            return $("input[name='auditFlag']:checked").val();
        },
        setValue: function (target, value) {
            $("input[name='auditFlag']").val([value]);
        },
        resize: function (target, width) {
            var input = $("#auditdiv");
            if ($.boxModel == true) {
                input.width(width - (input.outerWidth() - input.width()));
            } else {
                input.width(width);
            }
        }
    }
});

//________________________________________________________基础扩展部分end_______________________________________________________________________________

//________________________________________________________输入框扩展部分end_______________________________________________________________________________


//扩展datagrid的编辑器类型：datetimebox
$.extend($.fn.datagrid.defaults.editors, {
    datetimebox: {
        init: function (container, options) {
            var editor = $('<input/>').appendTo(container);
            options.editable = false;
            editor.datetimebox(options);
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
    }
});

//扩展validatebox，添加验证两次密码功能
$.extend($.fn.validatebox.defaults.rules, {
    CHS: {
        validator: function (value, param) {
            return /^[\u0391-\uFFE5]+$/.test(value);
        },
        message: '请输入汉字'
    },
    eqPwd: {
        validator: function (value, param) {
            return value == $(param[0]).val();
        },
        message: '密码不一致！'
    },// start ---2013-12-3 lzw 修正验证手机正则和单个电话
    mobile: {
        validator: function (value, param) {
            // return /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/.test(value);
            return /^1[3|4|5|8][0-9]\d{8}$/.test(value);
        },
        message: '手机号码不正确'
    },
    tel: {
        validator: function (value, param) {
            return /^(\(\d{3,4}\)|\d{3,4}-|\s)?\d{8}$/.test(value);
        },
        message: '电话号码不正确'
    },// end ---2013-12-3 lzw
    loginName: {
        validator: function (value, param) {
            return /^[\u0391-\uFFE5\w]+$/.test(value);
        },
        message: '登录名称只允许汉字、英文字母、数字及下划线。'
    },
    ZIP: {
        validator: function (value, param) {
            return /^[1-9]\d{5}$/.test(value);
        },
        message: '邮政编码不存在'
    },
    QQ: {
        validator: function (value, param) {
            return /^[1-9]\d{4,10}$/.test(value);
        },
        message: 'QQ号码不正确'
    },
    safepass: {
        validator: function (value, param) {
            return safePassword(value);
        },
        message: '密码由字母和数字组成，至少6位'
    },
    number: {
        validator: function (value, param) {
            return /^\d+(\.\d{1,2})?$/.test(value);
        },
        message: '请输入数字'
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
        message: '请输入正确的身份证号码'
    },
    telormobile: {
        validator: function (value, param) {
            return /^((\d{3,4}\s+)?\d{7,8}$|(\d{3,4}-)?\d{7,8}$|1[3|4|5|8][0-9]\d{4,8})$/.test(value);
        },
        message: '请输入正确的手机或电话号码'
    },
    combobox: {
        validator: function (value, param) {
            return /^[^请选择|\s]+$/.test(value);
        },
        message: '请选择下拉值'
    },
    datebox: {
        validator: function (value, param) {
            return /^\d{4}(-|\/)\d{2}(-|\/)\d{2}\s?(\d{2}:\d{2})?(:\d{2})?$/.test(value);
        },
        message: '输入的日期格式不正确'
    },
    //Author:梁水 date：2014-1-7
    //modify:2014-9-23更新（1.新增参数两个，操作和其它参数传递）
    //begin
    remoteValid: {
        validator: function (value, param) {
            var that = this;
            var bl = false;
            var url = param[1] || AR.route.root;
            var op = param[2] || parent.AR.Page.operator;
            var param = param[0] || {};
            var post_data = { text: value, op: op,method:'ValidFieldRepeat',id:Request.queryString('id') };
            for (var k in param) {
                post_data[k] = param[k];
            }
            $.ajax({
                type: 'POST',
                async: false,
                dateType: 'json',
                url: url,
                data: post_data,
                success: function (result) {
                    var r = eval('(' + result + ')');
                    if (!r.success) {
                        that.message = param.errorMsg || "服务验证失败,数据重复.";
                    }
                    bl = r.success;
                }
            });
            return bl;
        }
    },
    multiple: {
        validator: function (value, vtypes) {
            var returnFlag = true;
            var opts = $.fn.validatebox.defaults;
            for (var i = 0; i < vtypes.length; i++) {
                var methodinfo = /([a-zA-Z_]+)(.*)/.exec(vtypes[i]);
                var rule = opts.rules[methodinfo[1]];
                if (value && rule) {
                    var parame = eval(methodinfo[2]);
                    if (!rule["validator"](value, parame)) {
                        returnFlag = false;
                        this.message = rule.message;
                        break;
                    }
                }
            }
            return returnFlag;
        }
    },
    length: {
        validator: function (value, param) {
            this.message = '字符长度必须在{0}~{1}之间.';
            var len = $.trim(value).length;
            if (param) {
                for (var i = 0; i < param.length; i++) {
                    this.message = this.message.replace(new RegExp(
                                    "\\{" + i + "\\}", "g"), param[i]);
                }
            }
            return len >= param[0] && len <= param[1];
        },
        message: '字符长度必须在{0}~{1}之间.'
    },
    email: {
        validator: function (value, param) {
            return /^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/.test(value);
        },
        message: '请输入正确Email地址'
    },
    year: {
        validator: function (value, param) {
            return /^19[0-9][0-9]|20[0-9][0-9]$/.test(value);
        },
        message: '请输入有效年份'
    }
    //end extends
});

/* 密码由字母和数字组成，至少6位 */
var safePassword = function (value) {
    return !(/^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/.test(value));
}


//________________________________________________________输入框扩展部分end_______________________________________________________________________________