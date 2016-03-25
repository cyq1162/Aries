<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Combobox-V2.aspx.cs" Inherits="Web.UI.Demo.Combobox_V2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>下拉框示例</title>
    <link href="/Style/CSS/ty-main.css" rel='stylesheet' />
    <link href="/Style/JS/EasyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
    <link href="/Style/JS/EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
    <script src="/Style/JS/jquery-1.7.1.min.js"></script>
    <script src="/Style/JS/json2.js"></script>
    <script src="/Style/JS/EasyUI/jquery.easyui.min.js"></script>
    <script src="/Style/JS/EasyUI/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Style/JS/AjaxUpload.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.EasyUIExtend.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Utility.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.Common.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.DataGrid.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.Form.js"></script>
    <script src="../Style/JS/TY.Common.js"></script>
    <script src="../Style/JS/EasyUI/plugins/datagrid-detailview.js"></script>
    <style>
        label {
            display:inline-block; width:120px;
        }
        div {
            line-height:28px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server" style="margin:20px;">
    <div>
        <label>多级联</label><input type="text" configkey="性别" multiple="true" /><br/>
        <label>多级联</label><input type="text" objname="C_PB_LV1" />
        <input type="text" objname="C_PB_LV2" parent="C_PB_LV1" />
        <input type="text" objname="C_PB_LV3" parent="C_PB_LV2" /><span>属性：parent</span><br />
        <label>选中第三项</label><input type="text" objname="C_PB_LV3" selectedIndex="3" /><span>  属性：selectedIndex</span><br />
        <label>不显示请选择项</label><input type="text" objname="C_PB_LV3" defaultItem="false" /><span>  属性：defaultItem</span><br />
        <label>绑定事件</label><input type="text" objname="C_PB_LV3" onchange="fn" /><span>  属性：onchange</span><br />
        <label>禁用输入</label><input type="text" objname="C_PB_LV3" editable="false" /><span>  属性：editable</span><br />
        <label>禁用大数据过滤</label><input type="text" objname="C_PB_All" id="selAll"  multiple="true" /><span>  属性：isCustom</span><br />
    </div>
    </form>
    <script type="text/javascript">
        function fn(record) {
            if (record.value) {
                alert(record.text);
            }
        }

        //$.fn.combo = function () {

        //}

        //function init(target) {
        //    $(target).hide();

        //    var span = $('<span class="combo"></span>').insertAfter(target);
        //    var input = $('<input type="text" class="combo-text">').appendTo(span);
        //    $('<span><span class="combo-arrow"></span></span>').appendTo(span);
        //    $('<input type="hidden" class="combo-value">').appendTo(span);
        //    var panel = $('<div class="combo-panel"></div>').appendTo('body');
        //    panel.panel({
        //        doSize: false,
        //        closed: true,
        //        style: {
        //            position: 'absolute'
        //        },
        //        onOpen: function () {
        //            $(this).panel('resize');
        //        }
        //    });

        //    var name = $(target).attr('name');
        //    if (name) {
        //        span.find('input.combo-value').attr('name', name);
        //        $(target).removeAttr('name').attr('comboName', name);
        //    }
        //    input.attr('autocomplete', 'off');

        //    return {
        //        combo: span,
        //        panel: panel
        //    };
        //}

        //$.fn.combo = function (options, param) {
        //    if (typeof options == 'string') {
        //        return $.fn.combo.methods[options](this, param);
        //    }

        //    options = options || {};
        //    return this.each(function () {
        //        var state = $.data(this, 'combo');
        //        if (state) {
        //            $.extend(state.options, options);
        //        } else {
        //            var r = init(this);
        //            state = $.data(this, 'combo', {
        //                //options: $.extend({}, $.fn.combo.defaults, parseOptions(this), options),
        //                combo: r.combo,
        //                panel: r.panel
        //            });
        //            $(this).removeAttr('disabled');
        //        }
        //        $('input.combo-text', state.combo).attr('readonly', !state.options.editable);
        //        setDisabled(this, state.options.disabled);
        //        setSize(this);
        //        bindEvents(this);
        //        validate(this);
        //    });
        //};
    </script>
</body>
</html>
