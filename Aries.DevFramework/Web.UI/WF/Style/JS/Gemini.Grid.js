/// <reference path="/Style/JS/Aries.Loader.js" />


/***扩展editors的datetimebox方法*****/
$.extend($.fn.datagrid.defaults.editors, {
    datetimebox: {//datetimebox就是你要自定义editor的名称
        init: function (container, options) {
            var editor = $('<input />').appendTo(container);
            editor.enableEdit = false;
            editor.datetimebox(options);
            this.setValue(editor, null);//默认当前时间
            return editor;
        },
        getValue: function (target) {
            var new_str = $(target).datetimebox('getValue').replace(/:/g, '-');
            new_str = new_str.replace(/ /g, '-');
            var arr = new_str.split("-");
            var datum = new Date(Date.UTC(arr[0], arr[1] - 1, arr[2], arr[3] - 8, arr[4], arr[5]));
            var timeStamp = datum.getTime();

            return new Date(timeStamp).format("yyyy-MM-dd hh:mm:ss");
            //return timeStamp;
        },
        setValue: function (target, value) {
            if (value)
                $(target).datetimebox('setValue', new Date(value).format("yyyy-MM-dd hh:mm:ss"));
            else
                $(target).datetimebox('setValue', new Date().format("yyyy-MM-dd hh:mm:ss"));
        },
        resize: function (target, width) {
            $(target).datetimebox('resize', width);
        },
        destroy: function (target) {
            $(target).datetimebox('destroy');
        }
    },
    window: {//editWindow就是你要自定义editor的名称,窗口编辑器
        init: function (container, options) {
            var editor = $("<input/>").appendTo(container);
            editor.opts = options;
            editor.enableEdit = false;
            return editor;
        },
        getValue: function (target) {
            return target.opts.value;
        },
        setValue: function (target, value) {
            var opts = target.opts;
            opts.value = target.val() || value;
            AR.Window.dialog(opts.title, opts.url, opts, function (value) {
                if (value) {
                    target.opts.value = value;
                }
                if (window.Grid) {
                    window.Grid.endEdit();
                }
                else {
                    parent.window.Grid.endEdit();
                }
            });

        },
        resize: function (target, width) {
        },
        destroy: function (target) {
        }
    },
    dialog: {
        init: function (container, options) {
            var editor = $("<input/>").appendTo(container);
            for (var i in options) {
                if (i == "opts" || i == "options") {
                    editor.attr(i, JSON.stringify(options[i]));
                }
                else {
                    editor.attr(i, options[i]);
                }
            }
            editor.attr("name", AR.Utility.guid());
            AR.Combobox.bind(editor);
            editor.opts = options;
            editor.enableEdit = false;
            return editor;
        },
        getValue: function (target) {
            if (AR.Dialog.value != undefined) {
                return AR.Dialog.value;
            }
            var value = AR.Combobox.getValue(target);
            if (!value) {
                value = target.oldValue;
            }
            return value;
        },
        setValue: function (target, value) {
            target.oldValue = value;
            target.click();
        },
        resize: function (target, width) {
        },
        destroy: function (target) {
        }
    }
});
