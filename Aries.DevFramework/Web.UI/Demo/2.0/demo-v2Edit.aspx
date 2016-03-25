<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo-v2Edit.aspx.cs" Inherits="Web.UI.Demo.demo_v2Edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="/Style/CSS/ty-main.css" rel='stylesheet' />
       <link href="/Style/JS/EasyUI/themes/default/easyui.css" rel="stylesheet" type="text/css" />
       <link href="/Style/JS/EasyUI/themes/icon.css" rel="stylesheet" type="text/css" />
       <script src="/Style/JS/jquery-1.7.1.min.js"></script>
       <script src="/Style/JS/json2.js" ></script>
       <script src="/Style/JS/EasyUI/jquery.easyui.min.js"></script>
       <script src="/Style/JS/EasyUI/locale/easyui-lang-zh_CN.js"></script>
    <script src="../Style/JS/AjaxUpload.js"></script>
    <script>
        
    </script>
    <script src="../Style/JS/plugin2.0/TY.Core.EasyUIExtend.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Utility.js"></script>    
    <script src="../Style/JS/plugin2.0/TY.Core.Common.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.DataGrid.js"></script>
    <script src="../Style/JS/plugin2.0/TY.Core.Form.js"></script>
    <script src="../Style/JS/TY.Common.js"></script>
</head>
<body>
        <div class="cont-box">
        <div class="cont-box-tit">
            <h3>用户信息</h3>
            <a class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
            <div class="cont-box-form">
                <form>
                    <div class="line">

                        <div class="short">
                            <label><em>*</em>姓名：</label>
                            <input name="FullName" id="FullName" missingmessage="" class='easyui-validatebox'
                                data-options="required:true" validtype='length[2,30]' />
                        </div>
                        <div class="short">
                            <label><em>*</em>性别：</label>
                            <input name="Sex" configkey="性别" editable="false" selectedIndex="2" />
                        </div>
                         <div class="short">
                            <label><em>*</em>角色：</label>
                            <input name="RoleIDs" id="RoleIDs" objname="C_SYS_Role" validtype="combobox"  class="easyui-combobox" multiple="true" />
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
                            <input name="PwdExpiredTime" id="PwdExpiredTime" class="easyui-datebox" style="width: 150px;" validType="required" editable="false" value="<%=DateTime.Now.AddYears(1).ToString("yyyy-MM-dd")%>" />
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
                            <input class="submit" type="button" name="保存" value="" /></a>
                        <a>
                            <input class="return" type="button" name="取消" value="" /></a>
                    </div>
                    <input type="hidden" name="UserID" value="" />
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //TY.Form.url = TY.handler.fileupload;
        TY.Form.onBeforeLoadFormat = function (data) {
            //多选下拉必须处理值为数组            
            data.RoleIDs = data.RoleIDs?data.RoleIDs.split(','):[];
            data.DepartmentIDs = data.DepartmentIDs?data.DepartmentIDs.split(','):[];
            data.PwdExpiredTime =TY.common.Formatter.dateFormatter(data.PwdExpiredTime);
        }
    </script>
</body>
</html>
