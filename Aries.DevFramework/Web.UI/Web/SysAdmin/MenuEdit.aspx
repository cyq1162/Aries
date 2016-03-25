<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="MenuEdit.aspx.cs" Inherits="Web.UI.Web.SysAdmin.MenuList" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        var currNode;
        $(document).ready(function () {
            initMenu();
            CreatePromisson();
            $("#cmbtn_add").click(function () { AddPage() });
            $("#cmbtn_del").click(function () { DelMenu() });

        });

        var checkboxData;
        //加载权限
        function CreatePromisson() {
            TY.Ajax("GetActions", "System_Action", {}, false, null, TY.handler.sys,
              function (data) {
                  checkboxData = data;
                  CreateCheck();
              });
        }
        function CreateCheck() {
            if (checkboxData != undefined) {
                //清除权限模块
                $("#promisson").html("");
                $.each(checkboxData.rows, function (i, dom) {
                    $("#promisson").append('<input type="checkbox"  ref="' + dom.ActionRefName + '" value="' + dom.ActionID + '"/>' + dom.ActionName + '');
                });
            }
            //每次选中之后帮隐藏表单赋值
            $("#promisson :checkbox").bind("click", function () {
                SetActionIDs();
            });
        }
        //新增页面
        function AddPage() {
            $("#form1").form("clear");
            var node = GetTreeNode();
            if (node) {
                //帮隐藏表单菜单ID赋值
                $("#ParentMenuID").val(node.id);
                //给ActionIDs赋值
                SetActionIDs();
                TY.Page.operator = "Add";
            }
            currNode = node;
        }
        function GetTreeNode() {
            var node = $("#ul_menus").tree("getSelected");
            return node;
        }
        function getParentNode() {
            var node = GetTreeNode();
            var parentNode;
            if (node) {
                parentNode = $("#ul_menus").tree("getParent", node);
            }
            return parentNode;
        }
        //删除菜单
        function DelMenu() {
            var node = $("#ul_menus").tree("getSelected");
            if (node != undefined) {
                var msg = "确认删除？";
                var hasChlid = CheckHasChlid(node.id);
                if (hasChlid) {
                    msg = "该节点下包含子节点，确认删除？";
                }
                TY.Window.confirm(msg, "提示", function () {
                    TY.Ajax("DeleteMenu", "System_Menu", { id: node.id }, false, null, TY.handler.sys,
                    function (data) {
                        if (data.success) {
                            $("#ul_menus").tree("remove", node.target);
                        }
                        TY.Window.showMsg(data.msg);

                    });
                });
            } else {
                TY.Window.showMsg("请选择一行数据");
            }
        }
        function CheckHasChlid(id) {
            var result = false;
            TY.Ajax("ValidMenuHasChlid", "System_Menu", { MenuID: id }, false, null, TY.handler.sys,
          function (data) {
              result = data.success
          });
            return result;
        }
        //初始化菜单
        function initMenu() {
            TY.Ajax("GetMenu", "System_Menu", {}, false, null, TY.handler.sys,
              function (data) {
                  $("#ul_menus").tree({
                      idField: "MenuID",
                      textField: "MenuName",
                      rootText: "菜单根目录",
                      //rootID: undefined,
                      parentField: "ParentMenuID",
                      data: data,
                      onContextMenu: function (e, node) {
                          e.preventDefault();
                          $(this).tree('select', node.target);
                          $('#mm').menu('show', {
                              left: e.pageX,
                              top: e.pageY
                          });
                      },
                      onClick: treeNodeClick
                  });

              });
        }

        //树节点单击
        function treeNodeClick(node) {
            var node = $("#ul_menus").tree("getSelected");

            SetMenuID();
            currNode = node;
            TY.Page.operator = "Update";
        }

        //获取选中菜单ID
        function SetMenuID() {
            var node = $("#ul_menus").tree("getSelected");
            if (node != undefined && node.id != null) {
                $("#MenuID").val(node.id);
                initEdit(node.id);
            } else {
                $("#form1").form("clear");
            }
            return null;
        }

        //获取选中的权限ID
        function SetActionIDs() {
            $("#ActionIDs").val("");
            var ids = [];
            $("#promisson [type='checkbox']:checked").each(function (i, dom) {
                ids.push($(this).val());
            });
            if (ids.length > 0) {
                $("#ActionIDs").val(ids.join(','));
            }
        }
        //加载编辑框
        function initEdit(menuid) {
            $("#form1").form("clear");
            TY.Ajax("GetMenuDetails", "System_Menu", { id: menuid }, false, null, TY.handler.sys,
             function (data) {
                 //data.check = data.ActionIDs;
                 $("#form1").form('load', data);
                 SelectPromisson(data.ActionIDs);
                 //为什么用$("#rdo_yes").attr("checked",true); 不行？
                 data.IsShow == "1" ? document.getElementById("rdo_yes").checked = true : document.getElementById("rdo_no").checked = true;
             });
        }

        //设置权限选中
        function SelectPromisson(ActionIDs) {
            CreateCheck();
            if (ActionIDs != null && ActionIDs != undefined) {
                var arr = ActionIDs.toLocaleLowerCase().split(',');
                for (var i = 0; i < arr.length; i++) {
                    $("#promisson :checkbox").each(function (k, dom) {
                        if (arr[i] == $(this).val()) {
                            $(this).attr("checked", "checked");
                        }
                    });
                }
                //编辑页加载 设置选中之后帮隐藏表单赋值
                $("#ActionIDs").val(ActionIDs);
            }
        }
        var _commit = commitForm;
        //提交表单
        commitForm = function (jq) {
            var node = $("#ul_menus").tree("getSelected");
           

            if (TY.Page.operator == "Add") {
                var menuLevel = 0;
                if (currNode.attributes == null) {
                    $("#MenuLevel").val(1);
                    menuLevel = 1;
                }
                else {
                    $("#MenuLevel").val(currNode.attributes.MenuLevel + 1);
                    menuLevel = currNode.attributes.MenuLevel + 1;
                }
            } else {
                if (node == null || node.id == null) {
                    TY.Window.showMsg("根节点不允许修改！");
                    return;
                }
            }

            _commit(jq, TY.Page.operator, TY.Page.that.tableName, null, false, function (data, ty) {
                if (TY.Page.operator.toLocaleLowerCase() == "add") {
                    if (data.success) {
                        TY.Window.showMsg("添加成功！");
                    } else {
                        TY.Window.showMsg(data.msg);
                    }
                } else {
                    TY.Window.showMsg(data.msg);
                }


                if (TY.Page.operator == "Update") {
                    $("#ul_menus").tree("update", {
                        target: currNode.target,
                        text: $("[name='MenuName']").val()
                    });

                } else {
                    $("#ul_menus").tree("append", {
                        parent: currNode.target,
                        data: [{
                            id: data.msg,
                            text: $("[name='MenuName']").val(),
                            attributes: { MenuLevel: menuLevel }
                        }]

                    });

                }
            });

        }
        TY.Page.operator = "Update";
        TY.Page.that = {};
        TY.Page.that.tableName = "System_Menu";
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="cont-box-tit">
        <h3>菜单配置</h3>
        <a class="arrows hover"></a>
    </div>
    <div class="cont-box-in">
        <div style="width: 1024px; float: left">
            <div style="width: 200px; float: left;">
                <ul id="ul_menus"></ul>

            </div>
            <div style="width: 800px; float: left">
                <div class="cont-box-form">
                    <form id="form1">
                        <div class="line">
                            <label><em>*</em>菜单名称：</label>
                            <input name="MenuName" id="MenuName" missingmessage="菜单名称不能为空" required='true' class='easyui-validatebox' style="width: 300px;" />
                        </div>
                        <div class="line">
                            <label><em>*</em>菜单路径：</label>
                            <input name="MenuUrl" id="MenuUrl" missingmessage="菜单路径格式不正确" validtype="WebAddress" required='true' class='easyui-validatebox' style="width: 300px;" />
                        </div>
                        <div class="line">
                            <label><em>*</em>排序号：</label>
                            <input name="SortOrder" id="SortOrder" missingmessage="" class='easyui-validatebox' style="width: 300px;" />
                        </div>
                        <div class="line">
                            <label><em>*</em>是否显示：</label>
                            <div class="formRad">
                                <input type="radio" name="isShow" id="rdo_yes" value="1" /><span>是</span><input type="radio" name="isShow" id="rdo_no" checked="checked" value="0" /><span>否</span>
                            </div>
                        </div>
                        <div class="line">
                            <label><em>*</em>菜单权限：</label>
                            <div class="formRad promisson" id="promisson"></div>
                        </div>
                        <div class="btn">
                            <a>
                                <input id="btn_submit" class="submit" type="button" name="保存" value="" /></a>
                            <a>
                                <input class="return" type="button" name="取消" value="" /></a>
                        </div>
                        <input type="hidden" name="MenuID" id="MenuID" value="" />
                        <input type="hidden" name="ActionIDs" id="ActionIDs" value="" />
                        <input type="hidden" name="ParentMenuID" id="ParentMenuID" value="" />
                        <input type="hidden" name="MenuLevel" id="MenuLevel" value="" />
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both;">
        <div id="mm" class="easyui-menu" style="width: 120px;">
            <div data-options="iconCls:'icon-add'" id="cmbtn_add">新增页面</div>
            <div data-options="iconCls:'icon-remove'" id="cmbtn_del">删除节点</div>
        </div>
        <div id="win"></div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        TY.ajaxOption.url = TY.handler.sys;
    </script>
</asp:Content>
