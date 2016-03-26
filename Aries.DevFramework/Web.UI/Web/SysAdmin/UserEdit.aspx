<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="Web.UI.Web.Sys.UserEdit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <script type="text/javascript">

        jQuery(function () {

            //jQuery("form").ConvertToView();
        })
        //Window.onBeforeCommit = function () {
            
        //}
    </script>
    <div class="cont-box">
        <div class="cont-box-tit">
            <h3>用户信息</h3>
            <a class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
            <div class="cont-box-form">
                <form>
                   <%-- <div class="line">
                        <div class="line-checkbox short">
                            <label>用户类别：</label>
                            <input name="UserType" configkey="用户类别" />
                        </div>
                        <div class="short">
                            <label>合作单位：</label>
                            <input name="theFactID" objname="C_HZ_Fact" onchange="aa"  />
                            <input id="a" name="theFactName" type="hidden" />
                            <script>
                                function aa(obj)
                                {
                                    if (obj && obj.value) {
                                        $("#a").val(obj.text);
                                    }
                                }
                            </script>
                            
                        </div>
                        <div class="short">
                            <label>认证专业：</label>
                            <input name="RenZhengZhuanYe" configkey="认证专业" />
                        </div>
                    </div>--%>
                    <div class="line">

                        <div class="short">
                            <label><em>*</em>姓名：</label>
                            <input name="FullName" id="FullName" missingmessage="" class='easyui-validatebox'
                                data-options="required:true" validtype='length[2,30]' />
                        </div>
                        <div class="short">
                            <label><em>*</em>性别：</label>
                            <input name="Sex" configkey="性别" editable="false" />
                        </div>
                         <div class="short">
                            <label><em>*</em>角色：</label>
                            <input name="RoleIDs" id="RoleIDs" objname="C_SYS_Role" validtype="combobox"  class="easyui-combobox" multiple="true" editable="true" />
                        </div>
                    </div>
                    <div class="line">
                        <div class="short">
                            <label><em>*</em>登录账号：</label>
                            <input name="LoginID" id="LoginID" missingmessage="" class='easyui-validatebox' data-options="required:true" />
                        </div>
                        <div class="short">
                            <label><em>*</em>登录密码：</label>
                            <input name="Password" id="Password" type="password" missingmessage="" class='easyui-validatebox' required='true' validtype='length[6,18]' />
                        </div>

                        <div class="short">
                            <label><em>*</em>密码过期时间：</label>
                            <input name="PwdExpiredTime" id="PwdExpiredTime" class="easyui-datetimebox" style="width: 150px;" required="required" editable="false" value="<%=DateTime.Now.AddYears(1).ToString("yyyy-MM-dd")%>" />
                        </div>
                    </div>
                    <div class="line">
                        <div class="short">
                            <label><em>*</em>归属地市：</label>
                            <input name="AreaID" objname="C_PB_ProviceCity" />
                        </div>
                        <div class="short">
                            <label><em>*</em>归属分公司：</label>
                            <input name="CompanyID" configkey="分公司"  />
                        </div>
<%--                        <div class="short">
                            <label>职位名称：</label>
                            <input name="Job" id="Job" missingmessage="" class='easyui-validatebox' validtype='length[0,100]' />
                        </div>--%>
                    </div>

                    <div class="line">
                        <div class="short">
                            <label>工作电话：</label>
                            <input name="WorkPhone" id="WorkPhone" missingmessage=""  class='easyui-validatebox' validtype='telormobile' />
                        </div>
                        <div class="short">
                            <label><em>*</em>电子邮箱：</label>
                            <input name="Email" id="Email" missingmessage="" required='true' class='easyui-validatebox' validtype='email' />
                        </div>
                        <div class="short">
                            <label><em>*</em>部门名称：</label>
                            <input name="DepartmentIDs" objname="C_SYS_Department" multiple="true"  />
                        </div>
                    </div>

                    <div class="line">
                        <div class="short">
                            <label>手机：</label>
                            <input name="CellPhone" missingmessage=""  class='easyui-validatebox' validtype='telormobile' />
                        </div>
                        <div class="short">
                            <label><em>*</em>账号状态：</label>
                            <input name="Status" configkey="账号状态" />
                        </div>
                         <div class="short">
                            <label>备注：</label>
                            <input name="Memo"   class='easyui-validatebox'  />
                        </div>
                    </div>
                    <div class="btn">
                        <a>
                            <input class="submit" type="submit" name="保存" value="" /></a>
                        <a>
                            <input class="return" type="submit" name="取消" value="" /></a>
                    </div>
                    <input type="hidden" name="UserID" value="" />
                </form>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        parent.TY.Page.that.tableName = "V_SYS_UserList";
        TY.Utility.Ajax.Settings.url = TY.handler.sys;
    </script>
</asp:Content>
