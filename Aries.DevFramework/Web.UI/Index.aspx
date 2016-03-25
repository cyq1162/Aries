<%@ Page Language="C#" AutoEventWireup="true" Inherits="Web.UI.Index" CodeBehind="Index.aspx.cs" MasterPageFile="~/Web.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Aries.DevFramework</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="easyui-layout" style="width: 100%;" data-options="fit:true">
        <div data-options="region:'north'" title="" style="height: 110px;">
            <div class="panel-top">
                <div class="panel-logo"><a href="#"></a></div>
                <div class="panel-login">
                    <span class="area"><%=Area %><%=UserName %>(<%=LoginID %>)</span>
                    <a id="btn_selfInfo" class="ico1">个人信息</a>
                    <a href="/Logout.aspx" id="btn_exit" class="ico2">退出</a>
                </div>
                <div class="panel-nav">
                    <ul id="ul_guid">
                    </ul>
                </div>
                <div class="panel-sub-nav" id="div_menus">
                </div>
            </div>
        </div>
        <%--<div data-options="region:'south',split:true" style="height:50px;"></div>--%>

        <div data-options="region:'west',title:'功能菜单',split:true" style="width: 168px;">
            <ul id="ul_power" class="sidebar-nav">
            </ul>
        </div>
      <%--  <div data-options="region:'east',iconCls:'icon-reload',title:'常用',split:true" style="width: 70px;">
            <div id="div_container">
                <ul class="sideder-right">
                    <li onclick="EventFlow('11,25,55,62')"><a class="kjicon-jlrz">监理日志</a></li>
                    <li onclick="EventFlow('9,16')"><a class="kjicon-ybgz">已办工作</a></li>
                    <li onclick="EventFlow('9,17')"><a class="kjicon-dbgz">待办工作</a></li>
                </ul>
            </div>
        </div>--%>
        <div data-options="region:'center',iconCls:'icon-ok'" style="width:100%">
            <div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,cache:false">
            </div>
        </div>
        <div id="mm" class="easyui-menu" style="width: 150px;">
            <div id="mm-tabclose">关闭</div>
            <div id="mm-tabcloseall">全部关闭</div>
            <div id="mm-tabcloseother">除此之外全部关闭</div>
            <div class="menu-sep"></div>
            <div id="mm-tabcloseright">当前页右侧全部关闭</div>
            <div id="mm-tabcloseleft">当前页左侧全部关闭</div>
        </div>

    </div>
    z
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script type="text/javascript">

        //var MenuJsonData;
        //模板、用于渲染各个层级的菜单
        var mTemplate = {
            1: "<li><a  linkURL='{2}'  selfID='{0}'>{1}</a></li>",
            2: "<a  linkURL='{2}' selfID='{0}' >{1}</a><em>|</em>"
        };
        var AccessData;
        var mIsShortcut = false; //用于标记判断是否是快捷菜单点击后的触发
        $(function () {
            AccessData =<%=MenuData%>;
            var  MenuJsonData=AccessData.rows;

            var FinalyRootID=undefined;
            var jsondata=_MyselfTreeData(MenuJsonData,'MenuID', 'MenuName', 'ParentMenuID',FinalyRootID);
                       
            var div_menus = $("#div_menus");
            var ul_power=$("#ul_power");
            var ul = $("#ul_guid");

            InitSonMenu(jsondata,ul,1);
            //一级菜单栏点击事件
            $("#ul_guid>li").bind("click",function(){
                $(this).siblings().removeClass("hover");
                $(this).addClass("hover");
               
                div_menus.html("");
                var selfID=$(this).children("a").attr("selfid");

                var jsondata=_MyselfTreeData(MenuJsonData,'MenuID', 'MenuName', 'ParentMenuID',selfID);
                if (jsondata.length==0) {
                    return false;
                }
                if( jsondata[0].children.length==0){
                    ul_power.html("").removeClass("easyui-tree").addClass("sidebar-nav"); //获取到菜单容器,并清空HTML
                    InitSonMenu(jsondata,ul_power,1);
                }
                else{
                    InitSonMenu(jsondata,div_menus,2);
                }
               
            })
          
            //二级菜单点击事件
            $(document).on("click", "#div_menus > a", function () {
                $(this).siblings().removeClass("hover");
                $(this).addClass("hover");

                ul_power.html("");

                var selfID=$(this).attr("selfID");

                var jsondata=_MyselfTreeData(MenuJsonData,'MenuID', 'MenuName', 'ParentMenuID',selfID);
                //临时处理
                for (var i = 0; i < jsondata.length; i++) {
                    var children= jsondata[i].children;
                    for (var j = 0; j < children.length; j++) {
                        
                        if(children[j].attributes.IsShow!=undefined&&children[j].attributes.IsShow==0){
                            delete jsondata[i].children[j];
                        }
                    }
                   
                }
                //临时处理
                if (jsondata.length==0) {
                    return false;
                }
                if (jsondata[0].children.length==0||jsondata[0].children[0]==undefined) {  //||jsondata[0].children[0]==undefined 临时处理           
                    ul_power.removeClass("easyui-tree").addClass("sidebar-nav");
                    InitSonMenu(jsondata,ul_power,1);
                }
                else
                {
                    ul_power.tree({
                        data: jsondata,
                        loadFilter:function(data){return data},
                        onClick:function(node){
                            ShowTab(node.attributes.MenuUrl, node.text);
                        },
                        onLoadSuccess:function(){
                            //重置图片URL地址
                            $(".tree-node").each(function () {
                                var tnode = $("#ul_tree").tree("getNode", this);
                                if (tnode.attributes && typeof (tnode.attributes.iconURL) != 'undefined') {
                                    var style = "background:url('" + tnode.attributes.iconURL + "') no-repeat center center;";
                                    $(this).find(".tree-icon").first().attr("style", style);
                                }
                            })
                        }
                    }).removeClass("sidebar-nav").addClass("easyui-tree");
                    if (!mIsShortcut) {
                        //触发第一项默认选中   
                        var id = GetFirstNode(jsondata[0]);
                        var node = $('#ul_power').tree('find', id);
                        $('#ul_power').tree('select', node.target);
                        $('[node-id="' + node.id + '"]').click();

                    }
                }
            }) 
        })

        //初始化当前根节点下所有子菜单
        function InitSonMenu(jsonSource,Dom,tempIndex){
            var innnerhtml="";
            for (var i = 0; i < jsonSource.length; i++) {
                if (jsonSource[i].attributes.IsShow==1) {
                    var MenuID=jsonSource[i].id;
                    var MenuName=jsonSource[i].text;
                    var MenuUrl=jsonSource[i].attributes.MenuUrl;
                    var template = mTemplate[tempIndex];
                    innnerhtml = innnerhtml +TY.Utility.StringFormat.execute(template, MenuID, MenuName,MenuUrl);
                }
            }
            Dom.html(innnerhtml);
            //先注册完事件，再触发
            setTimeout(function(){
                Dom.children().eq(0).addClass("hover").click();
            },100);
            
        }

        //使用递归遍历得到最后一层节点
        function GetFirstNode(jsonItem) {
            if (jsonItem.children.length>0) {
                return GetFirstNode(jsonItem.children[0]);
            } else {
                return jsonItem.id;
            }
        }

        //功能栏单击事件处理
        $(document).on("click", "#ul_power > li", function () {
            $("#ul_power> li").removeClass("hover");
            $(this).addClass("hover");
            var text = $(this).children("a").html();
            var url = $(this).children("a").attr("linkURL");
            ShowTab(url, text);
        });

        //是否直接打开一个tab
        function ShowTab(url, text, isAddBackUrl) {
            if (typeof (url) == 'string') {
                if (url.length > 4) {
                    var tab = AddTab(url, text, isAddBackUrl);
                    tabCloseFunc(tab);
                    return false;
                }
            }
            return true;
        }

        //传入tab添加关闭功能
        function tabCloseFunc(tab) {
            var span = tab.panel('options').tab.find('.tabs-inner');
            span.unbind("dblclick").dblclick(function () {
                var subtitle = $(this).children("span").text();
                $('#tabs').tabs('close', subtitle);
            });

            span.unbind('contextmenu').bind('contextmenu', function (e) {
                var mm = $('#mm');
                mm.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
                var subtitle = $(this).children("span").text();
                mm.data("currtab", subtitle);
                return false;
            });
        }      
        //添加选项卡方法，根据iframe模式
        function AddTab(url, title, isAddHistory) {
            var TabContainer = $("#tabs");
            var iframe = $("<iframe frameborder='0' />");
            iframe.attr({ "src": url, "id": "f_center" }).css({ width: "100%", height: TabContainer.height() - 42});
            //判断选项卡不存在则新增一个选项卡
            var tab = null;
            if (!TabContainer.tabs("exists", title)) {
                tab = TabContainer.tabs('add', {
                    title: title,
                    content: iframe,
                    closable: true,
                    tools: [{
                        iconCls: 'icon-mini-refresh',
                        handler: function () {
                            //var tab = $("#tabs").tabs("getTab", title);
                            //tab.panel('refresh');//ie8下没反应
                            iframe[0].src = url;
                        }
                    }]
                });
            } else {
                tab = TabContainer.tabs("getTab", title);
                var oldSrc = tab.panel().panel('body').find('#f_center').attr('src');
                if (isAddHistory == true) {
                    if (typeof (tab.historyUrl) == 'undefined')
                        tab.historyUrl = new Array();
                    tab.historyUrl.push(oldSrc);
                }
                tab.panel("options").content = iframe;
                TabContainer.tabs("select", title);
                //TabContainer.tabs('update', { tab: tab, options: { content: iframe } });
                // tab.panel('refresh');
            }
            if (TabContainer.tabs("tabs").length > 5) {
                TabContainer.tabs("close", 0);
            }
            return TabContainer.tabs('getTab', title);
        }
        //
        function _MyselfTreeData(nodesdatas,idField, textField, parentField, rootID){
            return  function(parentid){
                var cn=new Array();
                for (var i = 0; i < nodesdatas.length; i++) {
                    var n={},attrs = {};
                    each: for (var j in nodesdatas[i]) {
                        if (j == idField || j == textField) {
                            continue each;
                        }
                        attrs[j] = nodesdatas[i][j];
                    }
                    if (!n.attributes) {
                        n.attributes = attrs;
                    }
                    n.id=nodesdatas[i][idField],n.text=nodesdatas[i][textField],n.state='open';
                    if (nodesdatas[i][parentField]==parentid) {
                        var id=nodesdatas[i][idField];
                        n.children=arguments.callee(id);
                        cn.push(n);
                        
                    }
                }
                return cn;
            }(rootID);
        
        }
        
        //anotherWay Tree
        

    </script>

    <script type="text/javascript">
        $(function () {
            tabCloseEven();
        });
        //传入tab添加关闭功能
        function tabCloseFunc(tab) {
            var span = tab.panel('options').tab.find('.tabs-inner');
            span.unbind("dblclick").dblclick(function () {
                var subtitle = $(this).children("span").text();
                $('#tabs').tabs('close', subtitle);
            });

            span.unbind('contextmenu').bind('contextmenu', function (e) {
                var mm = $('#mm');
                mm.menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
                var subtitle = $(this).children("span").text();
                mm.data("currtab", subtitle);
                return false;
            });
        }
        //绑定右键菜单事件
        function tabCloseEven() {
            //关闭当前
            $('#mm-tabclose').click(function () {
                var currtab_title = $('#mm').data("currtab");
                $('#tabs').tabs('close', currtab_title);
            })
            //全部关闭
            $('#mm-tabcloseall').click(function () {
                $('.tabs-inner span').each(function (i, n) {
                    var t = $(n).text();
                    $('#tabs').tabs('close', t);
                });
            });
            //关闭除当前之外的TAB
            $('#mm-tabcloseother').click(function () {
                var currtab_title = $('#mm').data("currtab");
                $('.tabs-inner span').each(function (i, n) {
                    var t = $(n).text();
                    if (t != currtab_title)
                        $('#tabs').tabs('close', t);
                });
            });
            //关闭当前右侧的TAB
            $('#mm-tabcloseright').click(function () {
                var nextall = $('.tabs-selected').nextAll();
                if (nextall.length == 0) {
                    //msgShow('系统提示','后边没有啦~~','error');
                    alert('选中项右边不存在Tab');
                    return false;
                }
                nextall.each(function (i, n) {
                    var t = $('a:eq(0) span', $(n)).text();
                    $('#tabs').tabs('close', t);
                });
                return false;
            });
            //关闭当前左侧的TAB
            $('#mm-tabcloseleft').click(function () {
                var prevall = $('.tabs-selected').prevAll();
                if (prevall.length == 0) {
                    alert('选中项左边不存在Tab');
                    return false;
                }
                prevall.each(function (i, n) {
                    var t = $('a:eq(0) span', $(n)).text();
                    $('#tabs').tabs('close', t);
                });
                return false;
            });
        }
    </script>
</asp:Content>
