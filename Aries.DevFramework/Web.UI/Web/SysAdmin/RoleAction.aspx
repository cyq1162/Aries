<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="RoleAction.aspx.cs" Inherits="Web.UI.Web.SysAdmin.RoleAction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        var actionids = "";
        var menuids = "";
        var ActionData;
        $(function () {
            $("#btn_save").click(function () {
                $.messager.progress({ title: "温馨提示" });
                var nodes = $("#tree").tree("getChecked");
                var arr = [];
                for (var i = 0; i < nodes.length; i++) {
                    var parentNode = $("#tree").tree("getParent", nodes[i].target)
                    var data = {};
                    //判读是否是子节点
                    var isLeft = $("#tree").tree("isLeaf", nodes[i].target);
                    if (isLeft) {
                        if (nodes[i].id != null) {
                            data.MenuID = parentNode.id;
                            data.ActionID = nodes[i].id;

                        } else {
                            data.MenuID = parentNode.id;
                            data.ActionID = 0;
                        }
                        arr.push(data);
                    }

                }

                TY.Ajax("AddPromission", "System_ModuleMenu", { data: JSON.stringify(arr), RoleID: Request.queryString("id") }, true, null, TY.handler.sys,
                        function (data) {
                            $.messager.progress('close');
                            TY.Window.showMsg(data.msg);
                        });

            })

            var RoleID = Request.queryString("id");
            TY.Ajax("GetMenuAndAction", "System_ModuleMenu", { RoleID: RoleID }, false, null, TY.handler.sys,
             function (data) {
                 $("#tree").tree({
                     idField: "MenuID",
                     textField: "MenuName",
                     rootText: "菜单根目录",
                     rootID: undefined,
                     checkbox: true,
                     parentField: "ParentMenuID",
                     iconCls: 'icon-mini-add',
                     data: data,
                     onLoadSuccess: function (data) {
                         getActionIds();
                         BindIcons(this);
                     }

                 });
             }
        );

        })

        function getActionIds() {
            var RoleID = Request.queryString("id");
            TY.Ajax("GetMenuIDsandActionIds", "", { RoleID: RoleID }, false, null, TY.handler.sys,
             function (data) {
                 for (var i in data) {
                     var node = $("#tree").tree("find", i);
                     if (node != null) {
                         var action = data[i].toLocaleLowerCase().split(',');
                         var parentId = node.id;
                         var childen = $("#tree").tree("getChildren", node.target);
                         for (var n = 0; n < action.length; n++) {
                             for (var j = 0; j < childen.length; j++) {
                                 if (childen[j].attributes.ParentMenuID.toString().toLocaleLowerCase() == parentId.toString()) {
                                     if (childen[j].id.toString().toLocaleLowerCase() == action[n].toString())
                                         $("#tree").tree("check", childen[j].target)
                                 }
                             }
                         }
                     }
                 }

                 //alert(data.menuIDs + "---actionids:" + data.ActionIDs);
             })
        }


        function BindEvent() {

        }

        function BindIcons(tree) {
            var root = $("#tree").tree("getRoot");
            var nodes = $("#tree").tree("getChildren", root.target);
            var style = "background:url('" + "/Style/Images/IconMenu/aqjc.png" + "') no-repeat center center;";
            for (var i = 0; i <= nodes.length - 1; i++) {
                if ($("#tree").tree("isLeaf", nodes[i].target)) {
                    var t = nodes[i].target;
                    var $t = $(t);
                    $t.find(".tree-icon").first().attr("style", style);
                }
            }

        }


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div>
        当前角色 :<%=RoleName %>
    </div>
    <div class="content">
        <a>
            <input class="btn-lg" type="button" name="" id="btn_save" value="保存" /></a>
        <a>
            <input class="btn-lg" type="button" name="" id="btn_cancel" value="关闭" /></a>
    </div>
    <ul id="tree"></ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>
