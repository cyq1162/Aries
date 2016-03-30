<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="CreateFormList.aspx.cs" Inherits="Web.UI.Tool.CreateFormList" %>

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
            TY.registEvent("cancel");
            TableName = Request.queryString('tbname');
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
                url: '/Ajax/FormHandler.ashx?mid=0&method=GetFromList&objName=' + TableName,
                collapsible: true,
                pagination: false,//分页
                rownumbers: true,
                singleSelect: true,
                onClickRow: onClickRow,
                frozenColumns: [[
                { field: 'ID', title: 'ID', sortable: true, align: 'center', width: "60" },//, checkbox: true

                {
                    field: 'Field', title: '列字段', sortable: true, align: 'center', width: "150",
                    editor: editorRequiredTextBox
                },
                {
                    field: 'Title', title: '列标题', sortable: true, align: 'center', width: "150",
                    editor: editorRequiredTextBox
                },
                {
                    field: 'OrderNum', title: '排序', sortable: true, align: 'center', width: "80", editor: {
                        type: 'numberbox'
                    }
                }
                ]],
                columns: [[
                    {
                        field: 'DescripType', title: '操作类型', sortable: true, align: 'center', width: "120",
                        formatter: function (v, r, i) {
                            switch (v) {
                                case "text":
                                    return "文本框";
                                    break;
                                case "combox":
                                    return "下拉框";
                                    break;
                                case "radio":
                                    return "单选按钮";
                                    break;
                                case "checkbox":
                                    return "复选框";
                                    break;
                                case "textarea":
                                    return "多行文本框";
                                    break;
                                default:
                                    return "请选择";
                                    break;
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
                                    { "name": "请选择", "value": '0' },
                                    { "name": "文本框", "value": 'text' },
                                    { "name": "下拉框", "value": 'combox' },
                                    { "name": "单选按钮", "value": 'radio' },
                                    { "name": "复选框", "value": 'checkbox' },
                                    { "name": "多行文本框", "value": 'textarea' }
                                ]
                            }
                        }
                    },
        {
            field: 'IsCanNull', title: '是否允许为空', sortable: true, align: 'center', width: "80",//checkbox: true
            formatter: formatCheckbox,
            editor: editorCheckbox
        },
        {
            field: 'Sortable', title: '是否隐藏', sortable: true, align: 'center', width: "80",
            formatter: formatCheckbox,
            editor: editorCheckbox
        },
         {
             field: 'IsRead', title: '是否只读', sortable: true, align: 'center', width: "80",
             formatter: formatCheckbox,
             editor: editorCheckbox
         },
        {
            field: 'ViewName', title: '下拉框对象名称', sortable: true, align: 'center', width: "120",
            editor: editorTextBox
        },
        {
            field: 'Style', title: '样式', sortable: true, align: 'center', width: "140",
            editor: editorTextBox
        },
        {
            field: 'Validtype', title: 'Validtype', sortable: true, align: 'center', width: "140",
            editor: editorTextBox
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
            TY.Utility.Ajax.Settings.method = "UpdateFrom";
            var formData = [];
            JsonObj2Arr(json, formData);
            formData.push({ name: "method", value: TY.Utility.Ajax.Settings.method });
            formData.push({ name: "objName", value: TY.Utility.Ajax.Settings.objName });
            formData.push({ name: "mid", value: mid });
            TY.Utility.Ajax.Settings.data = formData;
            TY.Utility.Ajax.Settings.async = false;
            TableName = Request.queryString('tbname');
            $.ajax({
                type: "POST",
                async: TY.Utility.Ajax.Settings.async,
                url: '/Ajax/FormHandler.ashx?mid=0&method=UpdateFrom&objName=' + TableName,
                data: TY.Utility.Ajax.Settings.data,
                dataType: TY.Utility.Ajax.Settings.dataType,
                success: function (data) {

                    //var tip = "";
                    //if (data.success) {
                    //    if (TY.Utility.Ajax.Settings.method == "Add") {
                    //        json.ID = data.msg;
                    //    }
                    TY.Window.refresh = true; //关闭刷新父窗体
                    myConfigDataGrid.datagrid("acceptChanges");
                    TY.Window.showMsg(data.msg);
                    //}
                    //else {
                    //    myConfigDataGrid.datagrid("rejectChanges");
                    //    TY.Window.showMsg(tip + "失败：" + data.msg);
                    //    TY.Window.refresh = true; //关闭刷新父窗体
                    //}
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
            tableName = Request.queryString('tbname');
            var row = {
                'ID': '<input type="button" onclick="saveAdd();" value="保存" />',
                'TbName': tableName,
                'DescripType': "text",
                'IsCanNull': false,
                'Sortable': false,
                'ViewName': '',
                'IsRead': false,
                'Validtype': '',
                'Style': 'easyui-validatebox'
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
                var json = {};
                json.ID = editRow.ID;
                // Exec(json);

                $.ajax({
                    type: "POST",
                    async: TY.Utility.Ajax.Settings.async,
                    url: '/Ajax/FormHandler.ashx?method=DeleteFrom',
                    data: { method: "DeleteFrom", ID: json.ID },
                    dataType: TY.Utility.Ajax.Settings.dataType,
                    success: function (data) {
                        if (data.success) {
                            TY.Window.refresh = true; //关闭刷新父窗体
                            myConfigDataGrid.datagrid("acceptChanges");
                            TY.Window.showMsg(data.msg);
                        }
                    }
                });
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
            <%--<a href="javascript:void(0)" onclick="DelRowsFun()">
                <input class="delete" type="button" name="删除" value="" /></a>--%>
            <a>
                <input class="btn-sm" type="button" id="btnReturn" name="" value="返 回" /></a>
            <a>
                <input class="btn-sm" type="button" id="btnCreateFrom" name="" value="生成代码" /></a>
            <span style="margin-left: 40px;">数据表名： <b><a onclick="showView(this.innerText);"><font color="red"><%=Request["tbName"] %></font></a></b></span>
            <%--  <span>| <b><a onclick="showSQL('<%=Request["tbName"] %>');"><font color="red">查看同步脚本</font></a></b></span>--%>
        </div>
    </div>
    <div id="codeDiv">
        <textarea id="code" style="width: 99%; height: 96%"></textarea>
    </div>
    <div id="divFromCode">
        <textarea id="txtFromCode" style="width: 99%; height: 96%"></textarea>
    </div>

    <script>
        function showSQL(tbName) {
            var result = TY.Ajax("GetGridConfigScript", tbName, {}, false, "GET", TY.handler.ajax);
            if (result && result.success) {
                $('#script').val(result.msg.replace(/<br\/>/g, "\r\n"));
                $('#scriptDiv').dialog({
                    title: tbName + ' 数据库同步脚本',
                    width: 800,
                    height: 450,
                    closed: false,
                    cache: false,
                    modal: true
                });
            }
        }
        function showView(tbName) {
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
                        handler: function () {
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

        $(function () {


            $("#btnCreateFrom").click(function () {
                tableName = Request.queryString('tbname');
                $.ajax({
                    type: "POST",
                    async: TY.Utility.Ajax.Settings.async,
                    url: "/Ajax/FormHandler.ashx", //TY.Utility.Ajax.Settings.url,
                    data: { objName: tableName, method: "CreateFrom" },
                    dataType: "text",
                    success: function (data) {
                        $("#txtFromCode").text(data);

                        $('#divFromCode').dialog({
                            title: "表名：" + tableName + ' 生成代码窗口',
                            width: 800,
                            height: 450,
                            closed: false,
                            cache: false,
                            modal: true
                        });
                    }
                });


            });

            $("#btnReturn").click(function () {
                window.location("CreateForm.aspx");
            })
        })
    </script>
</asp:Content>

