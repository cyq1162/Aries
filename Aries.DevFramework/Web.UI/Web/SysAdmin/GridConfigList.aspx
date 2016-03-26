<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="GridConfigList.aspx.cs" Inherits="Web.UI.Web.Sys.GridConfigList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var editIndex;
        var editId;
        var returndata;
        var TableName;
        var editRow = {};
        var formatCheckbox = function (value, row, index) {
            if (value == true || value == 1) {
                return "<input type='checkbox' checked='checked' disabled='disabled' />";
            }
            return "<input type='checkbox' disabled='disabled' />";
        }
        var editorCheckbox = {
            type: 'checkbox',
            options: {
                on: 1,
                off: 0
            }
        }
        var editorRequiredTextBox = {
            type: 'validatebox',
            options: {
                required: true,
                validType: 'length[0,50]'
            }
        }
        var editorTextBox = {
            type: 'validatebox',
            options: {
                validType: 'length[0,50]'
            }
        }
        $(function () {
            myConfigDataGrid = $('#configTable');
            registEvent("cancel");
            TableName =TY.Utility.Request.queryString('tbname');
            KeyUpDownFun();
            myConfigDataGrid.datagrid({
                toolbar: "#ToolBar",
                striped: true,
                nowwrap: false,
                height: $(document).height(),
                border: true,
                //fit: true,
                fitColumns: false,
                loadMsg: "正在使劲加载中...",
                idField: 'ID',
                sortName: "OrderNum",
                remoteSort: false,
                queryParams: {
                    searchList: JSON.stringify([{ paramName: 'TableName', paramValue: TableName, paramPatten: 'Equal' }])
                },
                url: TY.handler.ajax + '?method=GetList&objName=PB_GridConfig&sort=OrderNum&mid=' + mid,
                collapsible: true,
                pagination: false,//分页
                rownumbers: true,
                singleSelect: true,
                onClickRow: onClickRow,
                frozenColumns: [[
                { field: 'ID', title: 'ID', sortable: true, align: 'center', width: "60" },//, checkbox: true
                //{ field: 'TableName', title: '数据表名', align: 'center', width: "180" },
                {
                    field: 'Field', title: '列字段', sortable: true, align: 'center', width: "150",
                    editor: editorRequiredTextBox
                },
                {
                    field: 'Title', title: '列标题', sortable: true, align: 'center', width: "150",
                    editor: editorRequiredTextBox
                }, {
                    field: 'OrderNum', title: '排序编号', sortable: true, align: 'center', width: "80", editor: {
                        type: 'numberbox',
                        options: {
                            min: 0,
                            value: 0
                        }
                    }
                }, {
                    field: 'Width', title: '列宽', sortable: true, align: 'center', width: "50", editor: {
                        type: 'numberbox',
                        options: {
                            value: 100
                        }
                    }
                }
                ]],
                columns: [[
                {
                    field: 'Align', title: '数据对齐', sortable: true, align: 'center', width: "80",
                    formatter: function (value, row, index) {
                        switch (value) {
                            case "center":
                                return "居中";
                            case "left":
                                return "居左";
                            case "right":
                                return "居右";
                            default:
                                return "";
                        }
                    },
                    editor: {
                        type: 'combobox',
                        options: {
                            valueField: 'value',
                            textField: 'name',
                            required: true,
                            panelHeight: 90,
                            value: "center",
                            data: [
                                { "name": "居中", "value": 'center' },
                                { "name": "居左", "value": 'left' },
                                { "name": "居右", "value": 'right' }
                            ]
                        }
                    }
                },
                {
                    field: 'Hidden', title: '隐藏', sortable: true, align: 'center', width: "40",//checkbox: true
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'Sortable', title: '排序', sortable: true, align: 'center', width: "40",
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'Frozen', title: '冻结', sortable: true, align: 'center', width: "40",
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'Import', title: '导入', sortable: true, align: 'center', width: "40",
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'ImportUnique', title: '导入唯一', sortable: true, align: 'center', width: "55",
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'Export', title: '导出', sortable: true, align: 'center', width: "40",
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'Edit', title: '编辑', sortable: true, align: 'center', width: "40",
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'Search', title: '搜索', sortable: true, align: 'center', width: "40",//checkbox: true,
                    formatter: formatCheckbox,
                    editor: editorCheckbox
                },
                {
                    field: 'ViewName', title: '下拉框对象名称', sortable: true, align: 'center', width: "120",
                    editor: editorTextBox
                },
                {
                    field: 'Formatter', title: 'Formatter', sortable: true, align: 'center', width: "120",
                    editor: editorTextBox
                },
                {
                    field: 'Styler', title: 'Styler', sortable: true, align: 'center', width: "120",
                    editor: editorTextBox
                },
                {
                    field: 'Editor', title: 'Editor', sortable: true, align: 'center', width: "120",
                    editor: editorTextBox
                },
                {
                    field: 'DataType', title: '类型|长度|精度|必填', sortable: true, align: 'center', width: "100",
                    editor: editorTextBox
                },
                {
                    field: 'Rowspan', title: '单元格跨行数', sortable: true, align: 'center', width: "80",
                    editor: {
                        type: 'numberbox'
                    }
                },
                {
                    field: 'Colspan', title: '单元格跨列数', sortable: true, align: 'center', width: "80", editor: {
                        type: 'numberbox'
                    }
                },
                {
                    field: 'MergeIndexed', title: '合并索引', sortable: true, align: 'center', width: "60", editor: {
                        type: 'numberbox'
                    }
                }

                ]]

            });


        });
        var editing = false;//正在编辑状态
        var isButtonClick = false;
        //单击时
        function onClickRow(rowIndex, rowData) {
            if (editing)//结束状态，结束编辑
            {
                endEditing();
            }
            if (!isButtonClick && !editing && this.editIndex != rowIndex) //新点一行。
            {
                TY.Utility.Ajax.Settings.method = "Update";
                beginEdit(rowIndex, rowData);
            }
            isButtonClick = false;
        }
        function beginEdit(editIndex, rowData) {
            this.editIndex = editIndex;
            this.editing = true;
            this.editRow = $.extend(true, {}, rowData);
            myConfigDataGrid.datagrid('beginEdit', editIndex);
        }
        //结束编辑
        function endEditing() {
            if (myConfigDataGrid.datagrid('validateRow', editIndex)) {
                var s = TY.Utility.Ajax.Settings.method == "Update" ? 'updated' : '';
                var updated = myConfigDataGrid.datagrid('getChanges', s);//, 
                myConfigDataGrid.datagrid('endEdit', editIndex);
                if (updated.length > 0) {
                    if (TY.Utility.Ajax.Settings.method == "Update") {
                        var changeJson = getChangeJson(updated[0], editRow);
                        if (changeJson.ID != undefined) {
                            Exec(changeJson);
                        }
                        else {
                            myConfigDataGrid.datagrid("rejectChanges");
                        }
                    }
                    else if (TY.Utility.Ajax.Settings.method == "Add") {
                        updated[0].ID = "";
                        Exec(updated[0]);
                        if (updated[0].ID) {
                            myConfigDataGrid.datagrid("rejectChanges");//还原保存按钮为显示ID
                        }
                        isButtonClick = true;
                    }
                }

            }
            else {
                myConfigDataGrid.datagrid('endEdit', editIndex);
                myConfigDataGrid.datagrid("rejectChanges");
            }
            editIndex = undefined;
            this.editing = false;

        }
        //用于检测值是否被修改了，如果修改了，只提取出修改过的值。
        function getChangeJson(newJson, oldJson) {
            var changeJson = {};
            var count = 0;
            if (oldJson && oldJson.ID == newJson.ID) {
                for (var item in newJson) {
                    if ((oldJson[item] == undefined && newJson[item].toString() != "") ||
                        oldJson[item] != undefined && oldJson[item].toString() != newJson[item].toString()) {
                        changeJson[item] = newJson[item];
                        count++;
                    }
                }
            }
            if (count > 0) {
                changeJson.ID = newJson["ID"];
                changeJson.LastEditTime = "now()";
            }
            return changeJson;
        }
        //obj对象转数组
        function JsonObj2Arr(json, formData) {
            for (var key in json) {
                formData.push({ name: key, value: json[key] });
            }
        }

        //ajax操作
        function Exec(json) {

            var formData = [];
            JsonObj2Arr(json, formData);
            formData.push({ name: "method", value: TY.Utility.Ajax.Settings.method });
            formData.push({ name: "objName", value: TY.Utility.Ajax.Settings.objName });
            formData.push({ name: "mid", value: mid });
            TY.Utility.Ajax.Settings.data = formData;
            TY.Utility.Ajax.Settings.async = false;
            $.ajax({
                type: "POST",
                async: TY.Utility.Ajax.Settings.async,
                url: TY.Utility.Ajax.Settings.url,
                data: TY.Utility.Ajax.Settings.data,
                dataType: TY.Utility.Ajax.Settings.dataType,
                success: function (data) {
                    var tip = "";
                    switch (TY.Utility.Ajax.Settings.method) {
                        case "Add":
                            tip = "添加"; break;
                        case "Update":
                            tip = "更新"; break;
                        case "Delete":
                            myConfigDataGrid.datagrid('deleteRow', editIndex);
                            tip = "删除"; break;
                    }
                    if (data.success) {
                        if (TY.Utility.Ajax.Settings.method == "Add") {
                            json.ID = data.msg;
                        }
                        TY.Window.refresh = true; //关闭刷新父窗体
                        myConfigDataGrid.datagrid("acceptChanges");
                        TY.Window.showMsg(tip + "成功！");
                    }
                    else {
                        myConfigDataGrid.datagrid("rejectChanges");
                        TY.Window.showMsg(tip + "失败：" + data.msg);
                    }
                },
                error: function (d) {
                    console.log("服务器出错");
                }
            });
        }
        function saveAdd() {
            TY.Utility.Ajax.Settings.method = "Add";
        }
        //新增
        function onAdd() {
            onCancel();
            var row = {
                'ID': '<input type="button" onclick="saveAdd();" value="保存" />',
                'TableName': TableName,
                'OrderNum': 201,
                'Width': 100,
                'Align': 'center',
                'DataType': 'string',
                'Rowspan': 1,
                'Colspan': 1,
                'MergeIndexed':1
            }
            myConfigDataGrid.datagrid('appendRow', row);
            var rows = myConfigDataGrid.datagrid('getRows');
            editIndex = rows.length - 1;
            beginEdit(editIndex, row);
        }

        function onCancel() {
            if (editing)//结束状态，结束编辑
            {
                this.editRow = null;
                endEditing();
            }
            if (TY.Utility.Ajax.Settings.method == "Add" && editIndex != undefined) {
                myConfigDataGrid.datagrid('deleteRow', editIndex);
                editIndex = undefined
            }
        }

        function DelRowsFun() {
            if (editIndex == undefined) {
                alert("请先选择要删除的数据行");
                return;
            }
            if (confirm('是否删除ID为' + editRow.ID + "的数据行?")) {
                TY.Utility.Ajax.Settings.method = "Delete";
                var json = {};
                json.ID = editRow.ID;
                Exec(json);
            }

        }

        //鼠标up和dowm事件
        function KeyUpDownFun() {
            //listen keyboad click function
            document.onkeydown = function (e) {

                //IE,firefox 兼容   
                var ev = document.all ? window.event : e;
                var obj = ev.srcElement ? ev.srcElement : ev.target;
                var tdField;
                if (obj.className != "panel-noscroll" && obj.parentNode.parentNode) {
                    tdField = $(obj.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode).attr("field");//
                }
                // Up 
                if (ev.keyCode == 38) {
                    if (editIndex == undefined) {
                        return true;
                    }

                    var allrows = myConfigDataGrid.datagrid("getRows");
                    var nextIndex = editIndex - 1;
                    if (nextIndex > -1) {
                        onClickRow(nextIndex, allrows[nextIndex]);
                        if (tdField) {
                            var editor = myConfigDataGrid.datagrid('getEditor', { index: nextIndex, field: tdField });
                            $(editor.target[0]).focus();
                        }
                    }
                }
                    //Down
                else if (ev.keyCode == 40) {
                    if (editIndex == undefined) {
                        return true;
                    }

                    var allrows = myConfigDataGrid.datagrid("getRows");
                    var nextIndex = editIndex + 1;
                    if (allrows.length > nextIndex) {
                        onClickRow(nextIndex, allrows[nextIndex]);

                        if (tdField) {
                            var editor = myConfigDataGrid.datagrid('getEditor', { index: nextIndex, field: tdField });
                            $(editor.target[0]).focus();
                        }
                    }
                }
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <table id="configTable" class="cont-box-tab"></table>
    <div id="ToolBar">
        <div class="function-box">
            <a onclick="onAdd()">
                <input class="add" type="button" name="新增" value="" /></a>
            <%-- <a onclick="endEditing()">
                <input class="btn-sm" type="button" name="" value="保存" /></a>--%>
            <a onclick="onCancel()">
                <input class="btn-sm" type="button" name="" value="取消" /></a>
            <a href="javascript:void(0)" onclick="DelRowsFun()">
                <input class="delete" type="button" name="删除" value="" /></a>
            <a>
                <input class="btn-sm" type="button" id="btn_cancel" name="" value="关闭窗口" /></a>
            <span style="margin-left: 40px;">数据表名： <b><a onclick="showView(this);"><font color="red"><%=Request["tbName"] %></font></a></b></span>
            <span> | <b><a onclick="showSQL('<%=Request["tbName"] %>');"><font color="red">下载同步脚本</font></a></b>
                | <b><a  href="ExcelInfoList.aspx?EnName=<%=Request["tbName"] %>"><font color="red">Excel导入配置</font></a></b>
                | <b><a target="_blank" href="/Tools/CreateFormList.aspx?tbName=<%=Request["tbName"] %>"><font color="red">表单表成器</font></a></b>
            </span>
        </div>
    </div>
    <div style="display:none">
    <div id="codeDiv"><textarea id="code" style="width:99%;height:96%"></textarea></div>
   <%-- <div id="scriptDiv"><textarea id="script" style="width:99%;height:96%"></textarea></div>--%>
        </div>
    <script>
        function showSQL(tbName)
        {
            down("GetGridConfigScript", TY.handler.ajax,tbName);
            //var result = TY.Ajax("GetGridConfigScript", tbName, {}, false, "GET", TY.handler.ajax);
            //if (result && result.success) {
            //    $('#script').val(result.msg.replace(/<br\/>/g, "\r\n"));
            //    $('#scriptDiv').dialog({
            //        title: tbName + ' 数据库同步脚本',
            //        width: 800,
            //        height: 450,
            //        closed: false,
            //        cache: false,
            //        modal: true
            //    });
            //}
        }
        function showView(target)
        {
            var tbName = $(target).text();
            var result = TY.Ajax("GetSQL", tbName, {}, false, "GET", TY.handler.ajax);
            if (result && result.success) {
                $('#code').val(result.msg.replace(/<br\/>/g, "\r\n"));
                $('#codeDiv').dialog({
                    title: tbName + ' SQL',
                    width: 800,
                    height: 450,
                    closed: false,
                    cache: false,
                    modal: true,
                    toolbar: [{
                        text: '保存',
                        iconCls: 'icon-save',
                        handler: function ()
                        {
                            result = TY.Ajax("SaveSQL", tbName, { "code": $('#code').val() }, false);
                            if (result && result.msg) {
                                TY.Window.showMsg(result.msg, "消息提示");
                            }
                        }
                    }]
                });
            }
           // $('#view').dialog('refresh', 'new_content.php');
        }
    </script>
</asp:Content>
