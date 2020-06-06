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
2：商业用途二：用于开发外包项目(直接盈利)时产生直接盈利的，需向作者登记信息，并支付相关的授权费用。<br />

<br />
作者联系方式：<br />
1：QQ：272657997<br />
2：微信：cyq1162<br />
<br />
授权及技术支持费用：下载项目运行后，见：系统管理-授权登记 页面（授权类型 选择商业）。



<hr />
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Foreword:</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">As the years progressed, I have been fighting for a decade in the field of .NET.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Youth has not come to anxiously feel, but it is already an old man who has entered the forgetful autumn.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">With a little memory, you have to share and share the 80G items hidden in the hard disk.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">After all, life, this is a process of inheritance: open source, is a way.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Ok, life sighs three or two sentences and you have to go back to the topic:</span></span></p>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">background:&nbsp;</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">At that time, when I was selling and open source QBlog, I also thought about sorting out the development concept of QBlog and opening a framework to open source.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">However, the more people grow up, the more they are embarrassed. The passion is the enemy, but the inertia is exhausted. In the end, there is no trace, and even the 3.0 version is not open source.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Regarding the origin of the framework: it should be the two companies that the previous company had stayed in before, and then formed a version in the previous company.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">This version of the framework is a recently re-created version that is streamlined and powerful for a wide range of developers.</span></span></p>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Introduction to the Aries framework:</span></span></h1>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">The name of the frame: the first constellation: Aries</span></span></h3>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">The main application scenarios of the framework are: internal business systems, management backgrounds, and others.</span></span></h3>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Project:</span></span></h3>
<p><img src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160512234326671-110225289.jpg" alt="" /></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Project Engineering Introduction:</span></span></h3>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">1: Aries.Core is mainly a core class (not involved in development, can be compiled into a dll)</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">2: Aries.Controller request entry</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">3: Aries.Logic business class (business code writing office)</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">4: Web.UI interface rendering (html).&nbsp;</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">5: There are two empty engineering projects in the source code: Web.Entity (can put Model entity or enumeration) and Web.Utility (put some Helper class) (reserved for newcomers who don't know how to plan to store project classes)</span></span></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Components referenced by the front end:</span></span></h3>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">1: Data layer: CYQ.Data</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">2: Excel: NPOI&nbsp;</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">3: Frontend: EasyUI&nbsp;</span></span></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Request processing flow:</span></span></h3>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">1: html page Url request = "Aries.Core's UrlRewrite.cs for permission check</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">2: html page initiates ajax request = "Aries.Core's InvokeLogic.cs call = "Aries.Controller corresponding code, return Json =&gt; front-end display interface.&nbsp;</span></span></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">The system management functions that come with the framework:</span></span></h3>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">User, menu, function, permissions, configuration, import configuration.</span></span></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">The framework integrates all the features of the page:</span></span></h3>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Add, delete, change, list, query, form submission, export, single table import, multi-table import, configuration header.&nbsp;</span></span></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Framework support for cross-databases:</span></span></h3>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">As long as you have a database link, you can refer to it everywhere, no need to pay attention to where the database is.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">For example: the framework comes with N tables and one database (such as Mssql), and its own business is a database (such as Mysql).&nbsp;</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">In addition, the frame comes with an Aop aura, which makes it easy to read and write.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">The framework comes with distributed caching (MemCache, Redis) for easy distributed caching.&nbsp;</span></span></p>
<h2><span style="line-height: 1.5;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Interface diagram:&nbsp;</span></span></span></h2>
<p><img src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160513000103015-1263961123.jpg" alt="" /></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Interface configuration header:</span></span></h3>
<p><img src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160513000315796-2111375048.jpg" alt="" /></p>
<p>&nbsp;</p>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Aries simple development process demonstration:</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">&nbsp;1: Add a database link in Web.Config: &lt;add name="database name Conn" connectionString=".... /&gt;</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">&nbsp;2: Add a menu, the path is located in /web/sysadmin/customview.html;</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">&nbsp;3: Give the user a good permission and configure the header display.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">&nbsp;4: Development is complete, just like Easy, don't ask why.&nbsp;</span></span></p>
<p><img style="line-height: 1.5;" src="http://images2015.cnblogs.com/blog/17408/201605/17408-20160513002235390-1329017153.jpg" alt="" />&nbsp;</p>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Aries open source agreement:&nbsp;</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Subsequent additions to SVN, you can use it for commercial or non-commercial purposes, but you must not delete the relevant information about the original author in the source code.</span></span></p>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">The source directory SVN contains three directories:</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">1: </span></span><span style="line-height: 1.5;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Aries.DataBase Initial: Data table scripts, data scripts, database design documents.</span></span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">2: </span></span><span style="line-height: 1.5;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Aries.DevFramework framework source code.</span></span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">3: </span></span><span style="line-height: 1.5;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Aries.Document API documentation or helper documentation.</span></span></span></p>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">to sum up:</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">1: This article does not explain the implementation mechanism in detail.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">2: This article does not explain the development method in detail.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">But at least you can: look at the source code, look at the API, watch the demo, and join any of the three button groups on the left side of the blog to communicate.</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Of course, I will supplement related articles, more detailed and perfect mechanisms and development methods.</span></span></p>
<h3><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">If you support the spirit of open source, you can </span></span><span style="color: red;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">praise it</span></span></span><span style="vertical-align: inherit;"><span style="vertical-align: inherit;"> on the spiritual level </span><span style="vertical-align: inherit;">to show encouragement; of </span></span><br /><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">course, for those who want to encourage, I am also ready for the </span></span><span style="color: red;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">sponsored</span></span></span><span style="vertical-align: inherit;"><span style="vertical-align: inherit;"> plug-in </span><span style="vertical-align: inherit;">on the right </span><span style="vertical-align: inherit;">, hahaha (hands-on, 1 dollar is also OK) Very inspirational).</span></span></h3>
<h3><span style="color: red;"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">In addition: there are bugs and loopholes, please submit it privately, don't make damage, don't modify the administrator password, thank you.&nbsp;</span></span></span></h3>
<h1><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">Aries two or three addresses:</span></span></h1>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">1: Project preview address: </span></span><a title="Http://aries.cyqdata.com" href="http://aries.cyqdata.com/" target="_blank"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">http://aries.cyqdata.com</span></span></a></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">2: Source SVN address (has been changed to GitHub): https://github.com/cyq1162/Aries.git</span></span></p>
<p><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">3: Series Getting Started Tutorial: </span></span><a href="http://www.cnblogs.com/cyq1162/category/828163.html" target="_blank"><span style="vertical-align: inherit;"><span style="vertical-align: inherit;">http://www.cnblogs.com/cyq1162/category/828163.html</span></span></a></p>
