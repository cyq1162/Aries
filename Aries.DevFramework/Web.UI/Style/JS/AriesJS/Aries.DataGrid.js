(function ($Core) {
    $Core.Lang || ($Core.Lang = {});
    if ($Core.Lang.langKey == undefined) {
        $Core.Lang.edit = '编辑';
        $Core.Lang.add = '添加';
        $Core.Lang.addSuccess = '添加成功';

        $Core.Lang.isDel = '确认删除操作吗？';
        $Core.Lang.delSuccess = '删除成功';
        $Core.Lang.selectDelData = '请选择要删除的数据!';

        $Core.Lang.delError = '删除失败';
        $Core.Lang.errorInfo = '错误详情';
        $Core.Lang.msg = '消息提示';
        $Core.Lang.importTip = '正在导入数据，请稍候...';
        $Core.Lang.importError = '数据异常，导入失败！';
        $Core.Lang.uploadExtendName = '文件扩展名必须是：';

        $Core.Lang.beforePageText = '第';
        $Core.Lang.afterPageText = '页    共 {pages} 页';
        $Core.Lang.displayMsg = '当前显示 {from} - {to} 条记录   共 {total} 条记录';

        $Core.Lang.loadMsg = '正在加载中...';
    }

})(AR);
+function ($, $Core) {
    /**
   *该文件依赖与AR.Core.Utility.js文件
   */
    $Core.Utility.Ajax.post("GetInitConfig,GetKeyValueConfig", null, null, function (result) {
        $Core.Global.Variable = result.GetInitConfig;
        $Core.Global.Variable.isLoadCompleted = true;
        $Core.Config.data = result.GetKeyValueConfig;
        if (result && result.GetInitConfig.mid == "" && result.GetInitConfig.actionKeys == "" && parent.AR) {
            $Core.Global.Variable = parent.AR.Global.Variable;
        }
    });
    //==================================Internal Function Region======================================================
    $Core.DataGrid = DataGrid;
    /**
        *objName：视图名，表名，或者sql文件指定的路径
        *tbName:指定的操作主表名称
        *id 默认值 dg      
        *isTreeGrid 默认false(datagrid)，可设值为true(treegrid) 
        */
    function DataGrid(objName, tbName, id, isTreeGrid) {
        //内部变量
        this.Internal = {
            //第一个主键
            primarykey: null,
            //联合主键
            jointPrimary: [],
            headerData: new Array(),
            //contextData:null,
            isLoadCompleted: false
        }
        this.id = id || 'dg';
        this.isTreeGrid = isTreeGrid || isTreeGrid == "treegrid";
        //主表名
        this.tableName = tbName || objName;
        //对象（视图）名称
        this.objName = objName;
        //删除时指定的关联外键,如："TableA.ColumnNameA,TableB.ColumnNameB"
        this.foreignKeys = "";
        //是否显示复选框
        this.isShowCheckBox = true;
        //是否启用行内编辑
        this.isEditor = false;
        this.options = {
            //需要追求的请求数据(GetHeader也会追加）。
            queryParams: {},
            defaultWhere: []
        };
        /*可以事先构建，产生插时行时的默认值*/
        this.defaultInsertData = {};
        //对defaultWhere的操作
        this.addWhere = function (name, value, operator, isOr) {
            if (name && (value || operator)) {
                if (!operator) { operator = "="; }
                if (!this.options.defaultWhere) {
                    this.options.defaultWhere = [];
                }
                isOr = (isOr == true ? "or" : "and");
                this.removeWhere(name);//若有则移除。
                this.options.defaultWhere.push({ name: name, value: value, pattern: operator, OrAnd: isOr });
            }
        }
        this.removeWhere = function (name) {
            if (name && this.options.defaultWhere && this.options.defaultWhere.length > 0) {
                this.options.defaultWhere.remove(name, "name");
            }
        }
        this.$target = null;
        this.datagrid = function (v1, v2) {
            if (this.isTreeGrid) {
                switch (v1) {
                    case "getRowIndex":
                        return v2[this.options.idField];
                    case "deleteRow":
                        return this.$target.treegrid("remove", v2);//先删
                    case "appendRow":
                        v1 = "append";
                        break;
                    case "reload":
                        this.$target.treegrid("unselectAll");
                        this.$target.treegrid("uncheckAll");
                        break;
                }
                return v2 != undefined ? this.$target.treegrid(v1, v2) : this.$target.treegrid(v1);
            }
            else {
                switch (v1) {
                    case "deleteRow":
                        this.$target.datagrid(v1, v2);
                        return this.$target.treegrid("acceptChanges");
                    case "reload":
                        this.$target.datagrid("unselectAll");
                        this.$target.datagrid("uncheckAll");
                        this.$target.datagrid("clearChecked"); //清掉缓存的数据。
                        break;
                    case "select":
                        v1 = "selectRow";
                        break;
                }
                return v2 != undefined ? this.$target.datagrid(v1, v2) : this.$target.datagrid(v1);
            }
        }
        //获取列表的选中项，返回数组
        this.getChecked = function () {
            if (this.$target == null) {
                return [];
            }
            return this.datagrid("getChecked");
        };
        this._GetIDs = function (type, key) {
            if (this.$target == null) {
                return [];
            }
            var rows = this.datagrid(type);
            var ids = [];
            for (var i = 0; i < rows.length; i++) {
                ids.push(this.getPrimaryID(rows[i], key));
            }
            return ids;
        },
        //获得主键的ID数据
        this.getPrimaryID = function (row, key) {
            var id = "";
            if (!key && this.Internal.jointPrimary.length > 1) {
                for (var j = 0; j < this.Internal.jointPrimary.length; j++) {
                    if (j > 0) {
                        id += ";";
                    }
                    id += row[this.Internal.jointPrimary[j]];
                }
            }
            else {
                id = row[key || this.Internal.primarykey];
            }
            return id;
        }
        //获取列表的选中项，返回ID数组
        this.getCheckIDs = function (key) {
            return this._GetIDs("getChecked", key);
        };
        //获取列表的选中项，返回ID数组
        this.getSelectIDs = function (key) {
            return this._GetIDs("getSelections", key);
        };
        this.getSelected = function () {
            if (this.$target == null) {
                return [];
            }
            return this.datagrid("getSelected");
        }
        this.getData = function () {
            if (this.$target == null) {
                return [];
            }
            return this.datagrid("getData");
        }
        this.reload = function () {
            if (this.$target == null) {
                return;
            }
            $Core.Common._Internal.reloadGrid(this);
        }
        /**
        *主键列对象，可对按钮进行操作
        */
        this.PKColumn = new PKColumn(this);
        this.Search = new $Core.Common._Internal.Search();
        this.ToolBar = new $Core.Common._Internal.ToolBar();
        this.Formatter = $Core.Common.Formatter;
        this.HeaderMenu = new $Core.Common._Internal.HeaderMenu();
        this.RowMenu = new $Core.Common._Internal.RowMenu(this.isTreeGrid);
        //工具区（包含搜索区和按钮区）
        this.ToolArea = {
            id: this.id + "_ToolArea",
            $target: null,
            Search: this.Search,
            ToolBar: this.ToolBar,
            isHidden: false
        }
    };
    DataGrid.prototype.bind = function () {
        $Core.Global.DG.Items.set(this.id, this);
        $Core.Global.DG.operating = this;
        //如果是编辑模式 绑定行点击事件
        if (this.isEditor || this.isTreeGrid) {
            var that = this;
            var dbClick = this.options.onDblClickRow;
            this.options.onDblClickRow = function (index, row) {
                if (dbClick && dbClick(index, row) == false) {//对于外界的调用，保持参数不变。
                    return;
                }
                if (row == undefined) // TreeGrid，内部调用，修正参数
                {
                    row = index;//默认第1个是row
                    index = row[that.options.idField];
                }
                if ($Core.Global.Variable.actionKeys.indexOf(",edit,") > -1) {
                    _click(index, row, that, true);//双击事件需要编辑权限。
                }
            }
            var click = this.options.onClickRow;
            this.options.onClickRow = function (index, row) {
                if (click && click(index, row) == false) {
                    return;
                }
                if (row == undefined) // TreeGrid
                {
                    row = index;//默认第1个是row
                    index = row[that.options.idField];
                }
                _click(index, row, that, false);
            }
        }
        var dg = this;
        $Core.Utility.Ajax.post("GetHeader", dg.objName + "," + dg.tableName, dg.options.queryParams,
            function (dg) {
                return function (result) {
                    //拿到了Header，但GetKeyValuet Init，Combobox事件还没。
                    dg.Internal.headerData = result;
                    //加载Combobox数据。
                    _LoadComboxData(dg, result);
                    //创建表单，需要Header
                    if (!dg.ToolArea.isHidden) {
                        dg.ToolArea.$target = $('<div>').attr("id", dg.ToolArea.id); //创建并设置工具栏的ID  
                        $("body").append(dg.ToolArea.$target); //加到页面中  
                        if (!dg.Search.isHidden) {
                            dg.Search.onExecute(dg);
                            regSearchButtonEvents(dg);
                            $Core.Combobox.onInit();//绑定下拉。
                            $.parser.parse('#' + dg.ToolArea.id); //解析成easyui
                        }
                        var customToolBar = dg.ToolBar.$target;
                        //追加工具条(必须存在function-box样式，不然会影响到分页栏的显示)
                        dg.ToolBar.$target = $('<div class="function-box" id="' + dg.id + '_ToolbarArea">');
                        if (dg.ToolBar.isHidden) {
                            dg.ToolBar.$target.attr("style", "height:0px;padding:0 0;border-bottom:0px");
                        }
                        else if (customToolBar) { customToolBar.show(); dg.ToolBar.$target.append(customToolBar); }
                        dg.ToolArea.$target.append(dg.ToolBar.$target);
                    }
                }
            }(dg)
        );
    }
    function _LoadComboxData(dg, headerData) {
        if (headerData == null || headerData.length == 0) {
            return null;
        }
        //combobox的查询条件
        var _postArray = new Array();
        each: for (var i = 0, len = headerData.length; i < len; i++) {
            if (headerData[i].formatter == undefined || headerData[i].formatter == "" || headerData[i].formatter.indexOf('#') == -1 || !/^#C_+/.test(headerData[i].formatter)) {
                continue each;
            }
            objName = headerData[i].formatter.split('#')[1];
            var obj_item = {};
            if (objName.indexOf('=>') != -1) {
                objName = objName.split('=>')[0];
            }
            obj_item['ObjName'] = objName;
            if ($Core.Combobox.paras[objName] != undefined) {
                obj_item['Para'] = $Core.Combobox.paras[objName];
            }
            _postArray.push(obj_item);
        }
        //请求下拉框数据,子页面的下拉列表数据绑定
        if (_postArray.length > 0) {
            $Core.Combobox.loadData(_postArray, function (dg) {
                return function () {
                    dg._interval = setInterval(function () { bindGrid(dg); }, 5);
                }
            }(dg));
        }
        else {
            dg._interval = setInterval(function () { bindGrid(dg); }, 5);
        }
    }

    function bindGrid(dg) {
        if (!$Core.Global.Variable.isLoadCompleted) {
            return;
        }
        clearInterval(dg._interval);
        if (!dg.ToolArea.isHidden && !dg.ToolBar.isHidden) {
            //创建工具按钮，需要GetInit完成，有权限验证。
            dg.ToolBar.onExecute(dg);
            regToolbarEvents(dg);
        }
        //格式化列头（有Editor时，需要先有Combobox数据。）
        var objColumns = $Core.Common.Formatter.formatHeader(dg);//处理主键列和Formatter列设置
        if (!objColumns) {
            return false;
        }
        var cfg = $.extend({
            toolbar: "#" + dg.ToolArea.id,
            loadMsg: $Core.Lang.loadMsg,
            frozenColumns: objColumns.frozen,
            columns: objColumns.cols,
            queryParams: {},
            onHeaderContextMenu: function (e, field) {
                e.preventDefault();
                if (!dg.headMenu) {
                    dg.headMenu = $('<div/>').appendTo('body');
                    _createMenu(dg.HeaderMenu.Items, dg, dg.headMenu);
                }
                if (dg.headMenu.hasMenu) {
                    dg.headMenu.menu('show', {
                        left: e.pageX,
                        top: e.pageY
                    });
                }
            },
            //datagrid api
            onRowContextMenu: function (e, index, row) {
                _initMenu(dg, e, index, row);
            },
            //treegrid api
            onContextMenu: function (e, row) {
                _initMenu(dg, e, null, row);
            }
        }, $Core.Global.DG.DefaultConfig);
        if (dg.Internal.jointPrimary.length <= 1) {
            cfg.idField = dg.Internal.primarykey;//和getChecked有关系的主键
        }
        if (dg.isTreeGrid) { cfg.pagination = false; }//默认不分页
        var opts = dg.options;
        //检测是否带排序，若无，智能检测带time,date字母的时间为默认排序
        if (opts["sortName"] == undefined) {
            //遍历列头字段
            var hd = dg.Internal.headerData;
            if (hd && hd.length > 0) {
                var sortName = hd[0].field;
                for (var i = 0, len = hd.length; i < len; i++) {
                    if (hd[i].field.endWith("date") || hd[i].field.endWith("time")) {
                        sortName = hd[i].field;
                    }
                }
                opts.sortName = sortName;
                opts.sortOrder = "desc";
            }
        }
        dg._onBeforeLoad = opts.onBeforeLoad;
        opts.onBeforeLoad = function (param) {
            var mid = function () {
                var topWin = window;
                return function (win) {
                    var ar = win.AR;
                    if (ar.Global.Variable.mid && win != topWin) {
                        return ar.Global.Variable.mid;
                    }
                    if (win == win.top) {
                        return null;
                    }
                    return arguments.callee(win.parent.window);
                }(topWin);
            }();
            if (mid) { param.sys_mid = mid; };
            if (dg._onBeforeLoad) { return dg._onBeforeLoad(param) };
        };
        dg._onLoadSuccess = opts.onLoadSuccess;
        opts.onLoadSuccess = function (dg) {
            return function (data) {
                dg.Internal.isLoadCompleted = true;
                if (dg.isTreeGrid) {
                    regKeyDown(dg);
                }
                dg._onLoadSuccess && dg._onLoadSuccess(data);
            }
        }(dg);

        opts = opts || {};
        var searchJson = [];
        var options = $.extend(cfg, opts);
        if (dg.Search && dg.Search.$target) {
            //alert('1');
            var tForm = dg.Search.$target.children('form');
            searchJson = $Core.Common._Internal.buildSearchJson(tForm);
        }
        if (opts.defaultWhere && opts.defaultWhere.length > 0) {
            searchJson = searchJson.concat(opts.defaultWhere);
        }
        if (searchJson.length > 0) {
            options.queryParams['sys_search'] = JSON.stringify(searchJson);
        }


        //请求URL地址设置
        options.url = $Core.Global.route.root + "?sys_method=GetList&sys_objName=" + dg.objName + "&sys_tableName=" + dg.tableName;
        if (dg.isTreeGrid) {
            dg.$target = $("#" + dg.id).treegrid(options);
        }
        else {
            dg.$target = $("#" + dg.id).datagrid(options);
        }
        if (options.pagination) {
            var pager = {
                beforePageText: $Core.Lang.beforePageText, //页数文本框前显示的汉字  
                afterPageText: $Core.Lang.afterPageText,
                displayMsg: $Core.Lang.displayMsg
            };
            var pagination = dg.datagrid('getPager');
            $(pagination).pagination(pager);
        }
        $(".datagrid-cell-group").css({ fontWeight: 'bold' }); //设置合并列的加粗样式

    }
    function _initMenu(dg, e, index, row) {
        e.preventDefault();
        var selectValue = dg.isTreeGrid ? row[dg.options.idField] : index;
        dg.datagrid('select', selectValue);
        if (!dg.rowMenu) {
            dg.rowMenu = $('<div/>').appendTo('body');
            _createMenu(dg.RowMenu.Items, dg, dg.rowMenu, row);
        }
        if (dg.rowMenu.hasMenu) {
            dg.rowMenu.menu('show', {
                left: e.pageX,
                top: e.pageY
            });
        }
    }
    function _createMenu(items, dg, $menu, row) {
        var actionKeys = $Core.Global.Variable.actionKeys;
        if (!actionKeys) { return; }
        $menu.menu({});
        $menu.hasMenu = false;
        for (var i = 0; i < items.length; i++) {
            var menu = items[i];
            if (actionKeys.indexOf(',' + menu.lv2action + ',') != -1) {
                $menu.hasMenu = true;
                if (typeof (menu.onclick) == "string") {
                    menu.onclick = function (row, that, dgid, items) {
                        try {
                            var _fntt = eval(items[0]);
                        } catch (e) {

                        }
                        var para = items.length > 1 ? items[1] : undefined;
                        return function () {
                            if (row) {
                                _fntt(that, dgid, row[dg.Internal.primarykey], row[dg.options.idField], para);
                            } else {
                                _fntt(that, dgid, para);
                            }
                        };
                    }(row, this, dg.id, menu.onclick.split(','));
                }
                $menu.menu('appendItem', menu);
            }
        }

    }

    function PKColumn(dg) {
        $Core.BtnBase.call(this);
        //存档每行的主键列信息，只能在数据呈现之后获取,如onLoadSuccess事件
        this.Items = new $Core.Dictionary();
        this._btnArray = new Array();
        /**
        *如果设置clickName url&winTitle则无效
        *@param{string} key 即指向AR.Global.DG.PKTemplate的属性值
        *@param{string} title 鼠标划过显示的文字
        *@param{string} clickName 事件名
        *@param{string} url 打开页面的URL
        *@param{string} winTitle 打开窗口的标题
        *@param{string} lv2action 二级权限名称
        */
        this.add = function (key, title, clickName, url, winTitle, lv2action) {
            var btn = $(_getBtnTemp(key))[0];
            //设置添加按钮的连接
            if (key == 'edit') {
                dg.ToolBar.BtnAdd.winUrl = url;
                dg.ToolBar.BtnAdd.winTitle = (winTitle || "").replace($Core.Lang.edit, $Core.Lang.add);
            }
            url && btn.setAttribute("url", url);
            winTitle && btn.setAttribute("winTitle", winTitle);
            title && btn.setAttribute("title", title);
            clickName && clickName != "null" && btn.setAttribute("click", clickName) && btn.setAttribute("hasClick", "1");
            btn.key = key;
            btn.lv2action = lv2action || key;
            //var actionKeys = $Core.Global.Variable.actionKeys;//改异步后，这里不能进行权限过滤,内部做权限过滤
            //if ((actionKeys && actionKeys.indexOf(lv2action) != -1) || !lv2action) {
            this._btnArray.push(btn);
            // }
        };

        //打开业务页面
        this._onOpen = function (el, value, thatID, index) {
            var dg = $Core.Global.DG.operating = $Core.Global.DG.Items[thatID]; //赋值当前对象到page属性方便调用
            var $aTarget = $(el);
            var op = $aTarget.attr("op");
            var splitIndex = location.href.indexOf('List') == -1 ? location.href.indexOf('.') : location.href.indexOf('List');
            var url = $aTarget.attr("url") || dg.ToolBar.BtnAdd.winUrl || location.href.substring(location.href.lastIndexOf('/') + 1, splitIndex) + 'Edit.html';
            var winTitle = $aTarget.attr("winTitle");
            var _fn = $aTarget.attr("click");
            try {
                _fn = eval(_fn);
            } catch (e) {
                _fn = undefined;
            }
            if (_fn && typeof (_fn) == "function") {
                dg.datagrid('selectRecord', value);
                var row = dg.getSelected();
                _fn(value, row, index, el);
            } else {
                url = url.indexOf("?") == -1 ? url + "?id=" + value : url + "&id=" + value;
                var _match = url.match(/\{([\S\s]*?)\}/g);//匹配自定义标签
                if (_match) // add by cyq 2016-08-17
                {
                    var _row = dg.getSelected();//获取行数据
                    for (var i = 0; i < _match.length; i++) {
                        var _matchValue = _match[i];
                        var _key = _matchValue.substring(1, _matchValue.length - 1);
                        var _value = _row[_key];
                        if (_value) {
                            url = url.replace(_matchValue, _value);
                        }
                    }
                }
                $Core.Utility.Window.open(url, (winTitle || " "), op == 1);
            }

        };
        //外部批量的调用方式
        this._onDel = function (el, value, dgID, index) {
            var dg = $Core.Global.DG.Items[dgID];
            var ids = new Array();
            if (value) {
                ids.push(value);//"'" + id + "'"
            }
            else {
                var selRows = dg.getCheckIDs();
                if (selRows.length == 0) {
                    $Core.Utility.Window.showMsg($Core.Lang.selectDelData);
                    return false;
                }
                ids = selRows;
            }
            if (dg.ToolBar.BtnDelBatch.onBeforeExecute(ids, index) == false) {
                return false;
            }

            $Core.Utility.Window.confirm($Core.Lang.isDel, null, function () {
                $Core.Utility.Ajax.post("Delete", dg.tableName, { "id": ids.join(','), "foreignKeys": dg.foreignKeys }, function (responseData) {
                    if (dg.ToolBar.BtnDelBatch.onAfterExecute(ids, index, responseData) == false) {
                        return;
                    }
                    if (responseData.success != undefined && responseData.success) {
                        $Core.Utility.Window.showMsg($Core.Lang.delSuccess);
                        if (dg.options.pagination || !dg.isTreeGrid) {
                            dg.reload();
                        }
                        else {//不分页，时，只移除当前节点，避免树型节点太大。
                            var rows = dg.getCheckIDs(dg.options.idField);
                            for (var i = rows.length - 1; i >= 0; i--) {
                                dg.datagrid("deleteRow", rows[i]);
                            }
                            rows = null;
                        }
                        dg.datagrid("clearChecked");//清掉缓存的数据。
                    } else {
                        $Core.Utility.Window.showMsg($Core.Lang.delError + $Core.Lang.errorInfo + responseData.msg);
                    }
                });
            });

        };

        this.Editor = function () {
            var Obj = new Object();
            Obj.editIndex = null;
            this.operator = null;
            /*属性标识保存数据是否实时更新*/
            Obj.isSaveToBehind = true;
            Obj.BtnEdit = (function () {
                function Obj() {
                    $Core.BtnBase.call(this);
                    this.hidden = false;
                    this.onBeforeExecute = function (value, index) { };
                    this.onAfterExecute = function (value, index) { };
                    this.onExecute = function (dg, value, index) {
                        //把行设置为编辑状态,操作符设置为更新状态,设置为新增状态在添加按钮事件时触发
                        if (dg.PKColumn.Editor.operator == "Add" && dg.datagrid("getEditors", index).length > 0) {
                            return;
                        }
                        if (this.onBeforeExecute(value, index) == false) {
                            return;
                        }
                        if (_endEditing(dg)) {
                            _beginEditing(index, null, dg);
                        }
                        this.onAfterExecute(value, index);
                    };

                }
                return new Obj();
            })();
            Obj.BtnDel = (function () {
                function Obj() {
                    $Core.BtnBase.call(this);
                    this.hidden = false;
                    this.onBeforeExecute = function (value, index) { };
                    this.onAfterExecute = function (value, index, responseText) { };
                    this.onExecute = function (dg, value, index) {
                        if (_endEditing(dg) && value) {
                            if (this.onBeforeExecute(value, index) == false) {
                                return;
                            }

                            $Core.Utility.Window.confirm($Core.Lang.isDel, null, function () {
                                $Core.Utility.Ajax.post("Delete", dg.tableName, { id: value, "foreignKeys": dg.foreignKeys }, function (result) {
                                    if (result.success) {
                                        dg.datagrid('deleteRow', index);
                                    }
                                    $Core.Utility.Window.showMsg(result.msg);
                                    dg.PKColumn.Editor.BtnDel.onAfterExecute(value, index, result);//回调中不能用this
                                });

                            });
                        }
                    };

                }
                return new Obj();
            })();
            Obj.BtnSave = (function () {
                function Obj() {
                    $Core.BtnBase.call(this);
                    this.hidden = false;
                    //参数：主键值，行索引，Post的json数据
                    this.onBeforeExecute = function (value, index, postData) { };
                    this.onAfterExecute = function (value, index, postData, responseText) { };
                    this.onExecute = function (dg, value, index) {
                        //如果编辑状态则保存数据操作，如果新增状态，则插入数据的操作
                        if (index != dg.PKColumn.Editor.editIndex) {
                            return false;
                        }
                        if (this.onBeforeExecute(value, index) == false) {
                            return false;
                        }
                        var isAdd = dg.PKColumn.Editor.operator == "Add";
                        _editSave(dg, index, function (isSuccess) {

                            dg.PKColumn.Editor.editIndex = null;
                            //如果编辑状态则取消操作，删除状态则删除行
                            if (!isSuccess) {
                                if (isAdd) {
                                    dg.datagrid('deleteRow', index);
                                } else {
                                    //_editSave中已经endEdit过一次，再cacleEdit无法触发pkFormatter变更图标,reflreshRow能再触发事件
                                    dg.datagrid('refreshRow', index);
                                }
                            }
                            else { dg.datagrid('refreshRow', index); }
                        });
                    };

                }
                return new Obj();
            })();
            Obj.BtnCancel = function () {
                function Obj() {
                    $Core.BtnBase.call(this);
                    this.hidden = false;
                    this.onBeforeExecute = function (value, index) { };
                    this.onAfterExecute = function (value, index) { };
                    this.onExecute = function (dg, value, index) {
                        if (this.onBeforeExecute(value, index) == false) {
                            return;
                        }
                        dg.PKColumn.Editor.editIndex = null;//下面的会变更状态。
                        if (dg.datagrid("getEditors", index).length > 0) {
                            //如果编辑状态则取消操作，删除状态则删除行
                            if (dg.PKColumn.Editor.operator == "Add") {
                                dg.datagrid('deleteRow', index);
                            } else {
                                dg.datagrid('cancelEdit', index);
                            }
                        }
                        else { dg.datagrid('refreshRow', index); }
                        this.onAfterExecute(value, index)
                    };

                }
                return new Obj();
            }();
            return Obj;

        }();
        //参数：value, row, index, btnArray
        this.onBeforeExecute = function () { }
        //参数：value, row, index, $div
        this.onAfterExecute = function () { };
    }
    function _getBtnTemp(key) {
        var btn = $Core.Global.DG.PKTemplate[key];
        if (btn == undefined) {
            return '<span  title="' + key + '"   op="0">' + key + '</span>';
        }
        return btn;
    }

    function regSearchButtonEvents(dg) {
        //注册查询事件
        var btn_query = dg.Search.BtnQuery.$target;
        if (btn_query) {
            btn_query.click(function () {
                dg.Search.BtnQuery.onExecute(dg, btn_query);
            });
            var $form = btn_query.parents("form");
            //input，追加回车事件。
            $form.submit(function (e) { return false; });// 禁掉自动提交。（当表单只有一个输入框时，有些浏览器会自动触发回车即submit事件）"
            $form.find("input:[type='text']").each(function () {
                $(this).keyup(function (e) {
                    var ev = document.all ? window.event : e;
                    if (ev.keyCode == 13) // Enter
                    {
                        $(this).blur();//先触发光标离开事件（让easyui的值写回hidde域）
                        dg.Search.BtnQuery.onExecute(dg, btn_query);
                        $(this).focus();//将光标还原。
                    }
                });

            });
        }
        //重置按钮事件

        var btn_reset = dg.Search.BtnReset.$target;
        btn_reset && btn_reset.click(function () {
            dg.Search.BtnReset.onExecute(dg, btn_reset);
        });
    }

    function regToolbarEvents(dg) {
        var toolbar = dg.ToolBar.$target;
        if (!toolbar || !toolbar[0]) {
            //throw new ReferenceError("工具条的ID无效,页面未找到该ID值的HTML标签");
            return;
        }

        toolbar.delegate("[flag = 'btn_add']", "click", function () {
            dg.ToolBar.BtnAdd.onExecute(dg);
        });

        toolbar.delegate("[flag = 'btn_del']", "click", function () {
            dg.ToolBar.BtnDelBatch.onExecute(dg);
        });
        //导出

        toolbar.delegate("[flag = 'btn_export']", "click", function () {
            dg.ToolBar.BtnExport.onExecute(dg);
        });
        //导出模板
        toolbar.delegate("[flag = 'btn_export_template']", "click", function () {
            dg.ToolBar.BtnExportTemplate.onExecute(dg);
        });

        //导入按钮事件

        var $btnImport = toolbar.find("[flag = 'btn_import']");
        if ($btnImport[0]) {
            var opts = {};
            var url = $Core.Utility.stringFormat($Core.Global.route.root + '?sys_method=Import&sys_objName={0}&sys_tableName={1}&sys_mid={2}', dg.objName, dg.tableName, $Core.Global.Variable.mid);
            opts.action = url;
            opts.onSubmit = function (dg) {
                return function (file, ext) {
                    if (ext == "xls" || ext == "xlsx") {
                        $.messager.progress({
                            title: $Core.Lang.msg,
                            msg: $Core.Lang.importTip
                        });
                    }
                    else {
                        $Core.Utility.Window.showMsg($Core.Lang.uploadExtendName + exts);
                        return false;
                    }
                    var param = {};
                    if (dg.ToolBar.BtnImport.onBeforeExecute(param) == false) {
                        return false;
                    }
                    this.setData(param);
                }
            }(dg);
            opts.onComplete = function (dg) {
                return function (file, data) {
                    //file 是文件名,data 是返回的东西
                    $.messager.progress('close');
                    data = JSON.parse(data);
                    if (data.success) {
                        $Core.Utility.Window.showMsg(data.msg);
                        dg.reload();
                    }
                    else {
                        data.msg = data.msg.replace(/&/g, '&amp').replace(/\"/g, '&quot;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace("\"", "'");
                        var tip = "<div>" + $Core.Lang.importError + "<a title=\"" + data.msg + "\" onclick=\"javascript:alert(this.title)\"><font color='red'>" + $Core.Lang.errorInfo + "</font></a></div>";
                        $Core.Utility.Window.showMsg(tip, null, null, 8000);//"导入失败！"
                        if (data.sys_down != undefined) {
                            $Core.Utility.download('Down', { 'sys_down': data.sys_down });
                        }

                    }
                    dg.ToolBar.BtnImport.onAfterExecute(data);
                }
            }(dg);

            new $Core.Upload($btnImport, opts);
        }
    }
    function _click(index, row, dg, isDbClick) {
        if (dg.PKColumn.Editor.editIndex == null || dg.PKColumn.Editor.editIndex == index) {
            isDbClick && _beginEditing(index, row, dg);
            return false;
        }
        var editIndex = dg.PKColumn.Editor.editIndex;
        if (dg.datagrid('validateRow', editIndex)) {
            _editSave(dg, editIndex, function (isSuccess) {
                if (isSuccess) {
                    dg.PKColumn.Editor.editIndex = null;
                    dg.datagrid('refreshRow', editIndex);
                    isDbClick && _beginEditing(index, row, dg);
                }
                _endEditing(dg);
            });
        }
        else if (_endEditing(dg)) {
            isDbClick && _beginEditing(index, row, dg);
        }
    }
    //作用就是把已经打开的编辑状态给关闭。
    function _endEditing(dg) {
        if (dg.PKColumn.Editor.editIndex == null) { return true; }
        var index = dg.PKColumn.Editor.editIndex;
        if (dg.datagrid('validateRow', index)) {
            dg.PKColumn.Editor.editIndex = null;
            dg.datagrid('endEdit', index);
            dg.datagrid('refreshRow', index);
            //dg.datagrid("rejectChanges");
            return true;
        } else {
            //dg.datagrid('cancelEdit', index);
            return false;
        }
    }
    function _beginEditing(index, row, dg) {

        dg.PKColumn.Editor.editIndex = index;
        dg.datagrid('refreshRow', index);
        dg.PKColumn.Editor.operator = 'Update';
        dg.datagrid('selectRow', index);
        dg.datagrid('beginEdit', index);

        for (var i = 0; i < dg.Internal.jointPrimary.length; i++) {
            var primary = dg.datagrid("getEditor", { index: index, field: dg.Internal.jointPrimary[i] });
            primary && primary.target.attr('disabled', 'disabled');
        }

        dg.options.onEditing && dg.options.onEditing(index, row ? row : dg.getSelected());


    }
    function getRowParams(dg, value) {
        dg.datagrid("selectRecord", value);
        var row = dg.datagrid("getSelected");
        var index = dg.datagrid("getRowIndex", row);
        return [index, row];
    }
    function _editSave(dg, index, callBack) {
        var editResult = false;
        var editor = dg.datagrid("getEditors", index);
        if (editor.length > 0 && dg.datagrid('validateRow', index)) {
            var isTreeTrid = dg.isTreeGrid;
            var row = null;
            if (isTreeTrid) {
                row = $.extend(true, {}, dg.datagrid("find", index));
            }
            else {
                //data只存档1级的数据，不适合treegrid
                row = $.extend(true, {}, $.data(dg.$target[0], "datagrid").data.rows[index]);
            }
            if (row) {
                var _type = (dg.PKColumn.Editor.operator == "Update") ? 'updated' : 'inserted';
                try {
                    dg.datagrid("endEdit", index); //结束编辑行，如果TreeGrid改变idField，会有异步。
                } catch (e) { }
                var changes = dg.datagrid("getChanges");//_type 结束编辑后，才有Changes的数据。
                var _change_data = changes[changes.length - 1]; //获取行数据
                if (_change_data) {
                    if (dg.PKColumn.Editor.isSaveToBehind == false) {
                        dg.datagrid("acceptChanges");
                    }
                    else {
                        var post_data = {};
                        if (_type == 'inserted' && dg.defaultInsertData) {
                            post_data = _change_data;
                        } else {
                            post_data = getChangeJson(_change_data, row, dg);
                        }
                        if (!$.isEmptyObject(post_data)) //{ dg.datagrid('cancelEdit', index); }
                            //else
                        {
                            for (var i = 0; i < dg.Internal.jointPrimary.length; i++) {
                                var primary = dg.Internal.jointPrimary[i];
                                row[primary] && (post_data[primary] = row[primary]);//附加主键的ID值传入后台 
                            }
                            var value = dg.getPrimaryID(row);
                            if (dg.PKColumn.Editor.BtnSave.onBeforeExecute(value, index, post_data) != false) {
                                editResult = true;
                                $Core.Utility.Ajax.post(dg.PKColumn.Editor.operator, dg.tableName, post_data, function (result) {
                                    if (result) {
                                        if (result.success) {
                                            if (dg.PKColumn.Editor.operator == "Add") {
                                                _change_data[dg.Internal.primarykey] = result.msg;//这里才是将ID写回去的地方。
                                                result.msg = $Core.Lang.addSuccess;
                                            }
                                            if (isTreeTrid && index != _change_data[dg.options.idField]) {
                                                //树型节点，修改了idField，则刷新。
                                                dg.reload();
                                            }
                                            dg.datagrid("acceptChanges");
                                            dg.PKColumn.Editor.BtnSave.onAfterExecute(value, index, post_data, result);
                                        }
                                        else {
                                            dg.datagrid('cancelEdit', index);
                                        }
                                        dg.PKColumn.Editor.operator = undefined;
                                        callBack && callBack(result.success);//异步的回调处理
                                        $Core.Utility.Window.showMsg(result.msg);
                                    }
                                });
                            }
                        }
                    }
                }

            }
        }
        if (!editResult) {
            dg.PKColumn.Editor.operator = undefined;
            callBack && callBack(false);//非异步的处理
        }
    }

    //用于检测值是否被修改了，如果修改了，只提取出修改过的值。
    function getChangeJson(newJson, oldJson, dg) {
        var changeJson = {};
        var count = 0;
        if (oldJson && oldJson[dg.Internal.primarykey] == newJson[dg.Internal.primarykey]) {
            for (var item in newJson) {
                if (newJson[item] == undefined) { continue; }
                if ((oldJson[item] == undefined && newJson[item].toString() != "") ||
                    oldJson[item] != undefined && oldJson[item].toString() != newJson[item].toString()) {
                    changeJson[item] = newJson[item];
                    count++;
                }
            }
        }
        return changeJson;
    }
    //注册键盘按下事件
    function regKeyDown(dg) {
        document.onkeydown = function (e) {
            var ev = document.all ? window.event : e;
            if (ev.keyCode == 27) //Esc
            {
                dg.PKColumn.Editor.BtnCancel.onExecute(dg);
                return false;
            }
            else if (ev.keyCode == 13) // Enter
            {
                dg.PKColumn.Editor.BtnSave.onExecute(dg);
                return false;
            }
        }
    }
}(jQuery, AR);



