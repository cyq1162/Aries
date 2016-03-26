<%@ Page Title="" Language="C#" MasterPageFile="~/Web.Master" AutoEventWireup="true" CodeBehind="ConfigEdit.aspx.cs" Inherits="Web.UI.Web.Sys.ConfigEdit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="cont-box">
    	<div class="cont-box-tit">
        	<h3>配置信息-变更</h3>
            <a href="" class="arrows hover"></a>
        </div>
        <div class="cont-box-in">
        	<div class="cont-box-form">
                <form >
                    <div class="line">
                	    <div class="short">
                              <label><em>*</em>配置键：</label>
                            <input id="ConfigKey" name="ConfigKey" missingmessage="配置键不能空" type="text" class="easyui-validatebox" data-options="required:true" />
                        </div>
                        <div class="short">
                          <label>上级ID：</label>
                            <input id="TopComID" name="TopComID" type="text" class="easyui-validatebox" />
                        </div>
                        <div class="short">
                          <label>排序号：</label>
                            <input id="OrderNo" name="OrderNo" type="text" class="easyui-validatebox" />
                        </div>
                    </div>
                    <div class="line">
                        <div class="short">
                          <label><em>*</em>名称：</label>
                            <input id="ConfigName" name="ConfigName" type="text" missingmessage="名称不能空" class="easyui-validatebox" data-options="required:true" />
                        </div>
                        <div class="short">
                    	    <label><em>*</em>值：</label>
                            <input id="ConfigValue" name="ConfigValue" missingmessage="值不能空" type="text" class="easyui-validatebox" data-options="required:true" />
                        </div>         
                        <div class="short">
                            <label>标示符：</label>
                            <input id="Flag" name="Flag" type="text" class="easyui-validatebox" />
                        </div>       	    
                	    
                    </div>
                    <div class="line">
                        <div class="area">
                    	    <label>备注信息：</label>
                            <textarea id="Notes" name="Notes"  class="easyui-validatebox"></textarea>
                        </div>
                    </div>
                    <input type="hidden" name="CFID" id="CFID" />
                    <div class="btn">
                    	<a ><input class="submit" type="button" id="btn_save" name="保存" value="" /></a>
                    	<a ><input class="return" type="button" id="btn_cancel" name="取消"/></a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="aa" ContentPlaceHolderID="script" runat="server">
    <script>
        TY.Utility.Ajax.Settings.url = TY.handler.sys;     
        </script>
</asp:Content>