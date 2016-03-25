/*
    声明：津企软件工作室开源的组件，完全免费, 如有更新请发扬开源精神，及时通知我们并让我们做得更好
    作者: 毕加索的马
    制作：20130426
    版本：V1.0.0.1
*/
(function ($) {

    var defaultOptions = {
        caption: '选择窗口', //窗体标题
        icon: '',// 窗体图标
        width: 400, //窗体宽度
        height: 500, //窗体高度
        fit: false, //是否完全填充
        modal: false, //是否模式窗体
        closed: true, // 加载时是否关闭
        buttions: [], //窗体按钮可按照原生dialog控件
        sourceHandler: "", //源数据加载路径
        okClick: function () { } //确定按钮默认事件
    }

    var methods = {
        init: function (options) {

            var options = $.extend(defaultOptions, options);

            var id = $(this).attr('id');

            var btnAllRightId = 'btnAllRight' + id;
            var btnRightId = 'btnRight' + id;
            var btnLeftId = 'btnLeft' + id;
            var btnAllLeftId = 'btnAllLeft' + id;

            var lPanelId = 'lPanel' + id;
            var rPanelId = 'rPanel' + id;

            var sourceTreeId = 'treeSource' + id;
            var treeTargetId = 'treeTarget' + id;

            var middleButton = "";
            middleButton += "<a href='#' id='" + btnAllRightId + "'>>></a><br /><br />";
            middleButton += "<a href='#' id='" + btnRightId + "'>&nbsp;>&nbsp;</a><br /><br />";
            middleButton += "<a href='#' id='" + btnLeftId + "'>&nbsp;<&nbsp; </a><br /><br />";
            middleButton += "<a href='#' id='" + btnAllLeftId + "'><<</a>";

            var leftPanel = "";
            leftPanel += "<div id='lPanel" + id + "' class='easyui-panel' fit=true style='padding: 10px; border: 1px solid #ddd;'>";
            leftPanel += "    <ul id='" + sourceTreeId + "' class='easyui-tree' fit=true>";
            leftPanel += "    </ul>";
            leftPanel += "</div>";

            var rightPanel = "";
            rightPanel += "<div id='rPanel" + id + "' class='easyui-panel' fit=true style='padding: 10px; border: 1px solid #ddd;'>";
            rightPanel += "    <ul id='" + treeTargetId + "' class='easyui-tree' fit=true>";
            rightPanel += "    </ul>";
            rightPanel += "</div>";

            var content = "";
            content = "<table width=100% height=100%>";
            content += "<tr>";
            content += "<td width=45%></td><td width=10%></td><td width=45%></td>";
            content += "</tr>";
            content += "<tr>";
            content += "<td>" + leftPanel + "</td><td align=center>" + middleButton + "</td><td>" + rightPanel + "</td>";
            content += "</tr>";
            content += "</table>";

            $(this).html(content);

            $('#' + id).dialog({
                title: '&nbsp;' + defaultOptions.caption,
                width: defaultOptions.width,
                height: defaultOptions.height,
                closed: defaultOptions.closed,
                modal: defaultOptions.modal,
                buttons: defaultOptions.buttions.length == 0 ? [{
                    text: '确 定',
                    iconCls: 'icon-ok',
                    plain: true,
                    handler: function () {
                        defaultOptions.okClick();
                    }
                }, {
                    text: '取 消',
                    iconCls: 'icon-cancel',
                    plain: true,
                    handler: function () {
                        $('#' + id).dialog('close');
                    }
                }] : defaultOptions.buttions,
                iconCls: defaultOptions.icon
            });

            if ($.trim(defaultOptions.sourceHandler) != '') {

                $('#' + sourceTreeId).tree({
                    checkbox: false,
                    animate: true,
                    dnd: false,
                    url: defaultOptions.sourceHandler,
                    onDblClick: function (node) {
                        $('#' + btnRightId).click();
                    }
                });
            }
            var _source = $('#' + sourceTreeId);
            var _target = $('#' + treeTargetId);
            _target.tree({
                checkbox: false,
                animate: true,
                dnd: false,
                onDblClick: function (node) {
                    $('#' + btnLeftId).click();
                }
            });
            $('#' + btnAllRightId).live('click', function () {
                _target.tree({
                    checkbox: false,
                    animate: true,
                    dnd: false,
                    url: defaultOptions.sourceHandler,
                    onDblClick: function (node) {
                        $('#' + btnLeftId).click();
                    }
                });
                _source.tree('loadData', []);
            });

            $('#' + btnRightId).live('click', function () {
                var node = _source.tree('getSelected');
                if (node) {
                    var children = _source.tree('getChildren', node.target);
                    var parent = _source.tree('getParent', node.target);
                    var root = _source.tree('getRoot');
                    if (root) {
                        var r = _target.tree('find', root.id);
                        if (r == null) {
                            _target.tree('append', {
                                parent: null,
                                data: [root]
                            });
                        }
                    }
                    if (parent) {
                        var p = _target.tree('find', parent.id);
                        if (p == null) {
                            _target.tree('append', {
                                parent: _target.tree('getRoot').target,
                                data: [parent]
                            });
                        }
                    }
                    var p = _target.tree('find', parent ? parent.id : "-9999");
                    if (_target.tree('find', node.id) == null) {
                        _target.tree('append', {
                            parent: p == null ? null : p.target,
                            data: [node]
                        });
                    }
                    for (var i = 0; i < children.length; i++) {
                        var tn = _target.tree('find', children[i].id);
                        if (tn == null) {
                            var sp = _source.tree('getParent', children[i].target);
                            var rn = _target.tree('getRoot').target;
                            if (sp != null) {
                                _target.tree('append', {
                                    parent: (sp.id == rn.id) ? rn : _target.tree('find', sp.id).target,
                                    data: [children[i]]
                                });
                            }
                        }
                    }
                    _source.tree('remove', node.target);
                    if (parent) {
                        if (_source.tree('getChildren', parent.target).length == 0) {
                            _source.tree('remove', parent.target);
                        }
                    }
                    root = _source.tree('getRoot');
                    if (root) {
                        var rc = _source.tree('getChildren', root.target);
                        if (rc.length == 0) {
                            _source.tree('remove', rc.target);
                        }
                    }
                }
            });

            $('#' + btnLeftId).live('click', function () {
                var node = _target.tree('getSelected');
                if (node) {
                    var children = _target.tree('getChildren', node.target);
                    var parent = _target.tree('getParent', node.target);
                    var root = _target.tree('getRoot');
                    if (root) {
                        var r = _source.tree('find', root.id);
                        if (r == null) {
                            _source.tree('append', {
                                parent: null,
                                data: [root]
                            });
                        }
                    }
                    if (parent) {
                        var p = _source.tree('find', parent.id);
                        if (p == null) {
                            _source.tree('append', {
                                parent: _source.tree('getRoot').target,
                                data: [parent]
                            });
                        }
                    }
                    var p = _source.tree('find', parent ? parent.id : "-9999");
                    if (_source.tree('find', node.id) == null) {
                        _source.tree('append', {
                            parent: p == null ? null : p.target,
                            data: [node]
                        });
                    }
                    for (var i = 0; i < children.length; i++) {
                        var tn = _source.tree('find', children[i].id);
                        if (tn == null) {
                            var sp = _target.tree('getParent', children[i].target);
                            var rn = _source.tree('getRoot').target;
                            if (sp != null) {
                                _source.tree('append', {
                                    parent: (sp.id == rn.id) ? rn : _source.tree('find', sp.id).target,
                                    data: [children[i]]
                                });
                            }
                        }
                    }
                    _target.tree('remove', node.target);
                    if (parent) {
                        if (_target.tree('getChildren', parent.target).length == 0) {
                            _target.tree('remove', parent.target);
                        }
                    }
                    root = _target.tree('getRoot');
                    if (root) {
                        var rc = _target.tree('getChildren', root.target);
                        if (rc.length == 0) {
                            _target.tree('remove', rc.target);
                        }
                    }
                }
            });

            $('#' + btnAllLeftId).live('click', function () {
                _source.tree('reload', null);
                if (_target.tree('getRoot') != null) {
                    _target.tree('remove', _target.tree('getRoot').target);
                }
            });

            //重置下easyui样式
            $('#' + btnAllRightId + ',#' + btnRightId + ',#' + btnLeftId + ',#' + btnAllLeftId).linkbutton({});
            $('#' + lPanelId + ',#' + rPanelId).panel({});
            $('#' + treeTargetId).tree({});
        },
        open: function () {
            var _self = $(this);
            var id = _self.attr('id');
            //var btnAllLeftId = 'btnAllLeft' + id;
            //$('#' + btnAllLeftId).click();
            $('#' + id).dialog('open');
        },
        close: function () {
            var id = $(this).attr('id');
            $('#' + id).dialog('close');
        },
        getValue: function () {
            var selvalue = [];
            var id = $(this).attr('id');
            var treeTargetId = 'treeTarget' + id;
            var _target = $('#' + treeTargetId);
            var roots = _target.tree('getRoots');
            if (roots != null && roots.length > 0) {
                for (var i = 0; i < roots.length; i++) {
                    selvalue.push(roots[i]);
                    var children = _target.tree('getChildren', roots[i].target);
                    for (var j = 0; j < children.length; j++) {
                        selvalue.push(children[j]);
                    }
                }
                return selvalue;
            }
        },
        getSelectedChildren: function () {
            var selvalue = [];
            var id = $(this).attr('id');
            var treeTargetId = 'treeTarget' + id;
            var _target = $('#' + treeTargetId);
            var roots = _target.tree('getRoots');
            if (roots != null && roots.length > 0) {
                for (var i = 0; i < roots.length; i++) {
                    var children = _target.tree('getChildren', roots[i].target);
                    for (var j = 0; j < children.length; j++) {
                        var c = _target.tree('getChildren', children[j].target);                        
                        if (c == null || c.length == 0) {
                            selvalue.push(children[j]);
                        }
                    }
                }
                return selvalue;
            }
        }
    }

    $.fn.selectDialog = function (method) {
        if (methods[method]) {
            return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
        } else if (typeof method === "object" || !method) {
            return methods.init.apply(this, arguments);
        }
    };

})(jQuery);