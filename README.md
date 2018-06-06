# Aries
ASP.NET Aries is a Rapid Develop Framework for asp.net or asp.net core

QQ交流群：6033006<br /><br />
Aries 最近录的几集视频教程，放个人微信公众号里了，有需要的在公众号里输入aries就可以看到了<br />
<img src="https://images2018.cnblogs.com/blog/17408/201805/17408-20180523041027505-1002652922.jpg" width="200" height="200" /><br />

关于开源与商用的补充协议说明：<br /><br />
一：关于开源：<br /><br />
1：框架会持续保持开源，并不断持续改良优化。<br />
2：不得将框架源码修改后进行任何的公开传播，或改名后当成自己的成品使用。<br />
3：非商业时仅供用于学习用途。<br />

二：关于授权与商用：<br /><br />
1：商业用途一：用于开发自身产品运营（非外包盈利）项目时，需向作者登记下企业信息，并保留(登陆页和系统首页）底部的Aries版权信息，及以原有的项目及Dll名称，方可免费商用，否则视步侵仅处理。<br />
如需要去除底部版权信息，或修改框架默认dll名称，按商业用途二处理。<br /><br />
2：商业用途二：用于开发外包项目(直接盈利)时产生直接盈利的，需向作者登记信息，并支付一次性授权费用（具体双方协商）。<br />

<br />
作者联系方式：<br />
1：QQ：272657997<br />
2：微信：cyq1162<br />
3：邮箱：27265799@qq.com<br />


<hr />

<h1>前言：</h1>
<p>随着岁月的推进，不知不觉已在.NET这领域上战斗了十年了。</p>
<p>青春还没来得急好好感受，却已是步入健忘之秋的老人一枚了。</p>
<p>趁着还有点记忆，得赶紧把硬盘里那私藏的80G除外的东西，和大伙分享分享。</p>
<p>毕竟，人生，本就是一个传承的过程：开源，是一种的方式。</p>
<p>好吧，人生叹个三两句啰嗦完，得回正题了：</p>
<h1>背景：&nbsp;</h1>
<p>当年，在卖弄与开源QBlog时，也曾想过把QBlog的开发理念整理整理，独立一个框架来开源。</p>
<p>不过，人越长大就越憔悴，激情终敌不过疲惫的惰性，最终无痕而终，连3.0的版本也没开源出来。</p>
<p>关于框架的起源：应该是上家公司之前呆过的两家公司，然后在上一家公司成形了一个版本。</p>
<p>而这个框架版本，是近期重新打造的一个版本，面向广大的开发者，精简而强大。</p>
<h1>Aries框架简介：</h1>
<h3>框架的命名：第一星座：白羊座（Aries）</h3>
<h3>框架的主要适用场景：内部业务系统、管理后台、其它。</h3>
<h3>项目工程：</h3>
<p><img src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160512234326671-110225289.jpg" alt="" /></p>
<h3>项目工程简介：</h3>
<p>1：Aries.Core 主要是核心类（开发时不涉及，可编绎成dll提供）</p>
<p>2：Aries.Controller 请求入口</p>
<p>3：Aries.Logic 业务类（业务代码编写处）</p>
<p>4：Web.UI &nbsp;界面呈现（html）。&nbsp;</p>
<p>5：源码里还有两个空的工程项目：Web.Entity（可以放Model实体或枚举）和Web.Utility（放一些Helper类）（ 预留给不懂怎么规划存放项目类的新手）</p>
<h3>前后端引用的组件：</h3>
<p>1：数据层：CYQ.Data</p>
<p>2：Excel：NPOI&nbsp;</p>
<p>3：前端：EasyUI&nbsp;</p>
<h3>请求处理流程：</h3>
<p>1：html页面Url请求=》Aries.Core的UrlRewrite.cs 进行权限校验</p>
<p>2：html页面发起ajax请求=》Aries.Core的InvokeLogic.cs调用=》Aries.Controller里相应的代码，返回Json=&gt;前端展示界面。&nbsp;</p>
<h3>框架自带的系统管理功能：</h3>
<p>用户、菜单、功能、权限、配置、导入配置。</p>
<h3>框架对所有页面集成的功能：</h3>
<p>增、删、改、列表、查询、表单提交、导出、单表导入、多表导入、配置表头。&nbsp;</p>
<h3>框架对跨数库的支持：</h3>
<p>只要配好数据库链接，就可以随处引用，无需要关注数据库在哪里。</p>
<p>比如：框架自带的N个表一个数据库（如Mssql），自己的业务一个数据库（如Mysql）。&nbsp;</p>
<p>另外框架自带Aop光环，轻松可实现读写分离。</p>
<p>框架自带分布式缓存（MemCache、Redis），轻松实现分布式缓存。&nbsp;</p>
<h2><span style="line-height: 1.5;">界面示意图：&nbsp;</span></h2>
<p><img src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160513000103015-1263961123.jpg" alt="" /></p>
<h3>界面配置表头图：</h3>
<p><img src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160513000315796-2111375048.jpg" alt="" /></p>
<p>&nbsp;</p>
<h1>Aries简单开发流程演示：</h1>
<p>&nbsp;1：在Web.Config添加数据库链接：&lt;add name="数据库名Conn" connectionString=".... /&gt;</p>
<p>&nbsp;2：添加菜单，路径定位到/web/sysadmin/customview.html里；</p>
<p>&nbsp;3：给用户配好权限、配置好表头显示。</p>
<p>&nbsp;4：开发完成，就是这么Easy，别问为什么。&nbsp;</p>
<p><img style="line-height: 1.5;" src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160513002235390-1329017153.jpg" alt="" />&nbsp;</p>
<h1>源码SVN包含的三个目录：</h1>
<p>1：<span style="line-height: 1.5;">Aries.DataBase 初始：数据表脚本、数据脚本、数据库设计文档。</span></p>
<p>2：<span style="line-height: 1.5;">Aries.DevFramework 框架源代码。</span></p>
<p>3：<span style="line-height: 1.5;">Aries.Document API文档或帮助类文档。</span></p>
<p>更多教程：https://www.cnblogs.com/cyq1162/category/828163.html</p>
