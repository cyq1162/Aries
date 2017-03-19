/*  Table：Config_Excel   */
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('f8754ebd-b722-0e9d-002f-2510100d07cf','V_Test2','V_Test2222','Demo_TestA,Demo_TestB',0,0,0,0,to_date('2016/10/20 0:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('a3410cbc-144d-e90e-53ed-897eee8df4e6','V_Test','V_Test','Demo_TestA,Demo_TestB',0,0,0,1,to_date('2016/5/9 9:18:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('fb700287-84c2-8118-f8bd-b70f458ac48f','V_Test3','这是测试的','Demo_TestA,Demo_TestB',0,0,0,0,to_date('2016/11/28 0:00:00','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Config_ExcelInfo   */
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9d000fed-38e1-4e69-aafb-0822f25783b1','f8754ebd-b722-0e9d-002f-2510100d07cf','F8','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('39f09652-64b4-4e17-bb79-1a08ddfbbb0f','fb700287-84c2-8118-f8bd-b70f458ac48f','F3','Demo_TestA','F3','',0,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('c3b04f9e-d9e6-4253-a761-25319f3e539a','a3410cbc-144d-e90e-53ed-897eee8df4e6','F3','Demo_TestA','F3','',0,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('a64654d2-8d9a-4748-af86-280e4fa5ed1a','a3410cbc-144d-e90e-53ed-897eee8df4e6','F6','Demo_TestB','F6','Demo_TestA.F1',0,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('3632c756-5a40-4862-9000-38bbf1e6fedf','a3410cbc-144d-e90e-53ed-897eee8df4e6','ID','Demo_TestB','ID','',0,1,'Demo_TestA',0,to_date('2016/10/16 0:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('752a77dd-2b91-4743-91f1-4adfd36ba42d','a3410cbc-144d-e90e-53ed-897eee8df4e6','F4','Demo_TestA','F4','@UserID',1,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9ce21a16-9386-423f-8aa4-52aff90bfb88','fb700287-84c2-8118-f8bd-b70f458ac48f','F7','Demo_TestB','F7','Demo_TestA.F3',0,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('55b31261-92ff-48af-b7ec-5ad9ce652b1b','a3410cbc-144d-e90e-53ed-897eee8df4e6','F8','Demo_TestB','F8','',0,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('b16c8ad3-0619-4d6e-b5ff-5f3f39a19789','f8754ebd-b722-0e9d-002f-2510100d07cf','F1','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('74f856c7-b393-4335-a8b3-70b9b020e262','f8754ebd-b722-0e9d-002f-2510100d07cf','F5','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9c143af2-244f-4ea8-aee4-774380707c7c','fb700287-84c2-8118-f8bd-b70f458ac48f','ID','Demo_TestB','ID','@UserID',0,1,'Demo_TestA',0,to_date('2016/11/28 0:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('22e71bfb-c0ac-428e-aac8-80bb061cfbfc','fb700287-84c2-8118-f8bd-b70f458ac48f','F6','Demo_TestB','F6','',0,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('65202899-b08e-4fa5-a292-850442df551a','f8754ebd-b722-0e9d-002f-2510100d07cf','F2','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('6c563e8a-10f0-4eb9-a091-8530541204e9','a3410cbc-144d-e90e-53ed-897eee8df4e6','F5','Demo_TestB','F5','F8',0,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('ba86c51c-44ba-4607-8958-912970e67e84','a3410cbc-144d-e90e-53ed-897eee8df4e6','F2','Demo_TestA','F2','#是否',0,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('96490057-5f02-4a10-9e06-92a16e811739','f8754ebd-b722-0e9d-002f-2510100d07cf','F3','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('cad40b08-50d0-449a-a849-93ceffb40752','a3410cbc-144d-e90e-53ed-897eee8df4e6','FK','Demo_TestB','FK','F8',0,0,'',0,to_date('2016/10/16 0:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('ab7c748a-2f50-4fff-88da-941f9268fcbb','fb700287-84c2-8118-f8bd-b70f458ac48f','F4','Demo_TestA','F4','',1,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('1ed5f947-2592-473b-b7e3-a410ed0a459e','fb700287-84c2-8118-f8bd-b70f458ac48f','F1','Demo_TestA','F1','',0,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('00d1bccf-52f2-40b6-bd0b-b1db3a5d89d5','fb700287-84c2-8118-f8bd-b70f458ac48f','F2','Demo_TestA','F2','',1,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('5706b5b0-fb37-4d44-bf5a-b449910fb23e','a3410cbc-144d-e90e-53ed-897eee8df4e6','F7','Demo_TestB','F7','',0,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('ea304b62-650e-4d28-b048-d2b2c7d1bf97','f8754ebd-b722-0e9d-002f-2510100d07cf','F6','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9d8519f8-945a-4971-a91d-da1afd0066c4','f8754ebd-b722-0e9d-002f-2510100d07cf','F7','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('3c5312ed-902e-493a-9323-dba96b95372e','a3410cbc-144d-e90e-53ed-897eee8df4e6','F1','Demo_TestA','F1','',1,0,'',0,to_date('2016/10/16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('93948ef7-f44f-4002-908b-e092796244e2','fb700287-84c2-8118-f8bd-b70f458ac48f','F8','Demo_TestB','F8','@UserName',0,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('d69137e2-1259-4f86-8daf-e1f978530ac9','f8754ebd-b722-0e9d-002f-2510100d07cf','F4','','','',0,0,'',0,to_date('2016/10/20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('a9cd4dd9-5fbb-426b-b768-f44b9bc73fff','fb700287-84c2-8118-f8bd-b70f458ac48f','F5','Demo_TestB','F5','',0,0,'',0,to_date('2016/11/28 21:50:59','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Config_Grid   */
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('24976ab8-7869-4348-80cd-023ef5151fad','Config_ExcelInfo','','ExcelName','Excel列名',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,400,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6ab9641e-5733-45b6-8468-029387c7f816','Demo_Tree','','ParentID','ParentID',0,30,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,1,0,1,0,to_date('2016/8/31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8e09bd3c-6c3d-4eae-baa5-02f58973b953','Config_Excel','','TableNames','相关表名',0,40,300,'center',1,'stringFormatter','','',1,1,1,'string,400,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7ff6c059-f76f-458b-b76c-033208044b21','V_Test','','F6','F6',0,70,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('383948d3-0d7b-47a0-a014-033b89f713a6','Sys_Role','','Notes','备注',0,30,100,'center',0,'stringFormatter','','',1,1,0,'string,150,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:00:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('aae8f76e-9b5e-4dbd-a827-0557951ca056','Config_Grid','','Align','对齐',0,90,40,'center',0,'#对齐方式','','',1,1,0,'string,10,0,1',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0fd6ddbc-1c9a-4d36-a07b-06bf8c98aa05','Config_ExcelInfo','','IsRequired','必填',0,65,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f45e7f16-5072-402d-8e9b-0852aabf7966','V_SYS_UserList','','CompanyID','CompanyID',1,160,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dea533d7-030b-49e7-87f1-0a46b7b883d9','Demo_TestB','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,1',0,1,1,0,1,0,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('95c85991-697e-460e-bd64-0b3059457e7b','Config_KeyValue','','Flag','分类标记',1,50,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ff78894c-a989-4a9a-8274-0ebd1e21bf56','Sys_Action','','IsSys','是否系统',0,50,100,'center',1,'boolFormatter','','',1,1,0,'boolean,50,0,0',0,0,0,1,1,0,to_date('2016/11/30 14:34:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ad49b8f1-c67f-4781-993f-10aef3f1b75d','Sys_Area','','ID','ID',0,10,100,'center',0,'','','',1,1,0,'int32,10,0,1',0,1,1,0,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('76f8e451-29a8-4ca1-bf37-11438aa0fede','Config_KeyValue','','Notes','备注',0,60,100,'center',1,'stringFormatter','','',1,1,0,'string,1000,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('648889ea-fb6b-4e89-882d-12f49c6498cd','V_SYS_UserList','','UserInfoID','UserInfoID',1,150,100,'center',0,'','','',1,1,0,'guid,16,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b83f25c0-d17b-4b28-89ea-1596a0e293d3','Config_Grid','','DataType','类型|长度|精度|必填',0,1000,120,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fc5fd213-1914-4b5f-bf82-1696df2654f8','_Sys_User','','PwdExpiredTime','PwdExpiredTime',0,50,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bc885b93-5c1c-4930-b9b1-16b875af4725','Config_ExcelInfo','','ExceInfoID','ExceInfoID',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8d085aab-6484-42f9-a7ed-17459ebb602a','V_SYS_UserList','','PwdExpiredTime','密码过期时间',1,50,100,'center',0,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b379a08c-9aff-4b7f-8223-176583e345a2','Config_KeyValue','','ConfigValue','配置值',0,40,100,'center',1,'stringFormatter','','',1,1,0,'string,300,0,1',1,1,1,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('80864f96-df08-49a1-bd26-181662a65e25','V_SYS_UserList','','Status','状态',0,90,100,'center',0,'#账号状态','','',1,1,1,'int32,10,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cd99cc96-0754-4f46-a9b8-1a84a68ef333','Config_ExcelInfo','','Field','表字段名',0,50,100,'center',1,'#C_SYS_Column=>C_SYS_Table','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3a03941a-eef9-4ee0-8253-1b0944af00d4','V_SYS_UserList','','Phone','工作电话',0,70,100,'center',0,'','','',1,1,0,'string,100,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('eee3ac47-a47c-4a9e-a6b8-2129959bf908','Sys_Area','','Lvl','Lvl',0,60,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a65e05c2-a2ff-4c01-b91c-21682064b4c1','Config_ExcelInfo','','Formatter','格式化',0,60,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b7259b59-2248-47df-bfa5-21dbaf2ce0d9','Demo_Area','','Code','Code',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('16682fbe-ecd4-49f8-bc33-21e357b918fc','_Demo_TestA','','F4','F4',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/9/5 1:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('584c48a0-559d-47ec-ae25-22a138c9ec4e','Demo_TestB','','mg_表头','二级表头',0,15,100,'center',0,'','','',1,2,0,'string,50,0,0',1,1,1,0,1,0,to_date('2016/10/15 23:48:44','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3d330be7-eac6-426c-84aa-25db45f46626','V_SYS_UserList','','Email','Email',0,132,100,'center',0,'','','',1,1,0,'string,50,0,0',0,0,0,0,1,0,to_date('2016/9/6 18:17:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4eb3d51f-7315-4a38-9f5b-26698373b93e','Config_Grid','','MergeIndex','行索引',1,888,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9c2b44fd-e6b7-4723-a5a3-283d8a371227','V_Test','','mg_02','三级表头',0,12,100,'center',0,'','','',1,2,0,'string,50,0,0',0,1,1,0,1,0,to_date('2016/10/13 14:58:32','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b7a8def3-caf8-4d61-936d-28c4f34ba3de','Config_Excel','','Description','模板描述',0,35,180,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('26099072-b07a-4af1-9332-29a19255a847','TestA','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',0,1,1,1,1,0,to_date('2016/5/10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('983652ec-9bef-4a5a-9a20-2d5c02cd54c3','Sys_Area','','PCode','PCode',0,40,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ae0049ad-71e4-4936-a932-2e2bfd048eaf','Config_Grid','','Search','搜索',0,107,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('575f9939-c4ba-4a84-acb0-31045b52d005','Config_Excel','','CreateTime','创建日期',0,80,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ed6f016f-4cd9-46aa-b710-3116477e220a','V_Test','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',0,1,1,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('47048b72-1f76-44d0-885a-3202082f70ae','_Sys_User','','Sex','Sex',0,60,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2e86407b-7d80-45ee-9d6b-32185f7e08d8','V_Test','','F5','F5',0,60,100,'center',1,'','','',1,1,1,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('794edf55-d63d-460e-b01f-326916700cfe','_Sys_User','','Phone','Phone',0,70,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('00b22580-e7cc-45a5-90e9-370614859063','_Sys_User','','LoginCount','LoginCount',0,100,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0a355aed-1c72-4f6c-96ce-3a6d71e3877e','_Demo_TestA','','F1','F1',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016/9/5 1:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dd40ea93-ef36-405f-b7fb-3bf71446e386','Config_Excel','','HeadCrossRowNum','列头跨行数',0,60,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('20d5946f-a496-4ba2-b5f3-3c4b9a4af63a','V_SYS_UserList','','RoleIDs','关联角色',0,190,100,'center',0,'#C_SYS_Role','','',1,1,0,'string,500,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bfc869c2-6e6a-433d-9724-3dd4e158d1c4','_Sys_User','','RoleIDs','RoleIDs',0,130,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4518811e-f7e0-4723-898b-402e4c5c191e','Demo_TestA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,1',0,1,1,0,1,0,to_date('2016/8/10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ac83943e-7419-4506-8b79-40550af5c76b','Demo_TestB','$:{multiple:true}','F7','F7',0,40,100,'center',1,'#C_PB_Province2','','',1,1,1,'string,100,0,0',1,1,1,1,1,0,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('672ea915-78a3-4caf-b800-4062c8ef23a6','Config_ExcelInfo','','IsForeignkey','外键',0,80,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b4b3b655-0577-4e91-926d-41c5e9ddd955','Sys_Area','','Desc','Desc',0,70,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c9283c29-92ed-47f9-87aa-42ec67a41f11','Demo_TestB','','F8','F8',0,50,100,'center',1,'#C_PB_City2=>C_PB_Province2','','',1,1,1,'string,100,0,0',1,1,0,1,1,0,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('03899636-ab70-4cf1-ae2e-432003a78d49','V_Test','','mg_01','二级表头',0,11,100,'center',0,'','','',1,3,0,'string,50,0,0',0,1,1,0,1,0,to_date('2016/10/13 14:23:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9631c562-e129-4b18-81bc-44e688eb8b26','V_SYS_UserList','','FullName','用户真实姓名',0,30,100,'center',0,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9a76fc20-314a-4b9a-933c-45ee9de4d45a','_Sys_User','','Status','Status',0,90,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('33a68b4d-c4f1-4d7d-8350-46d583d4e5af','TestA','','F4','自定义Editor',0,50,100,'center',1,'','','fnEditor',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('72fe612a-f35c-4301-aec3-48781a36f79a','V_SYS_UserList','','Sex','性别',0,60,100,'center',0,'#性别','','',1,1,1,'boolean,1,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f7c175af-7add-4c37-bd80-490a526374f4','sys_Action','$3:{fitColumns:true}','ActionID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016/5/9 9:00:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('79313eeb-84f4-4fa4-abe1-49b8fa405536','Config_Grid','','Field','字段',0,40,100,'left',0,'','','',1,1,0,'string,40,0,1',1,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('13bbfb6c-eb5c-44a8-80ce-4a29a2e58c1e','sys_Action','','ActionName','权限名称',0,20,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1',1,1,1,1,1,0,to_date('2016/5/9 9:00:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4f9c007d-1ac6-4e3b-b28c-4c1c2cef3fd1','V_Test','$:{title:"自定义标题F1",pattern:"="}','F1','F1',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('45555602-26fa-4d87-a532-4e9e26316da2','Config_Grid','','Rules','格式规则',0,210,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7babd9f8-9b09-4628-9cb8-518ed4776f04','V_SYS_UserList','','UserID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,16,0,1',0,1,1,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ed9c3034-0362-4a28-bd55-52c4c5e0aa93','Config_Grid','','Import','导入',0,157,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('35da724f-0dc3-473d-ac34-54dc31322748','_Sys_User','','CreateTime','CreateTime',0,140,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3060c08f-c367-44f5-9d5f-54f3c52a217c','_Sys_User','','UserName','UserName',0,20,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1',1,1,1,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('05691a25-e20a-4095-b112-55a5968f1cf0','V_Test','','F8','F8',0,90,100,'center',1,'F8','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4b176675-a232-466f-88a4-55bcf5331fe1','Demo_Tree','','CreateTime','创建日期',0,40,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,1,1,1,0,to_date('2016/8/31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6dd5a8ad-d83c-4f3e-a562-5d1c55322876','V_Test','','FK','FK',0,100,200,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe9d098a-9fdd-459c-89c6-61fea138d364','Demo_Tree','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,0',0,1,1,0,1,0,to_date('2016/8/31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c51e7d87-7076-44c6-9e22-62b370829f9b','Config_KeyValue','','KeyValueID','主键',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8f52ce43-43a6-4e3b-ba29-62d9338d077f','V_Test','','ID','ID',1,5,100,'center',0,'#','','',1,1,0,'string,50,0,0',0,0,1,0,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('38e4d76e-c510-4624-a18c-6340d480d60e','Config_Grid','','GridID','操作',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ea2ee9d5-50d7-4757-a9e1-657690e9413d','V_Test','','mg_a','F7-F8',0,13,100,'center',0,'','','',1,2,0,'string,50,0,0',0,1,0,0,1,0,to_date('2016/10/14 0:16:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f7763105-86ce-4bd9-9690-6929f7394eba','Config_Grid','','Formatter','格式化',0,215,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('083fecf7-0a69-43be-8108-69721b843627','Config_ExcelInfo','','CreateTime','创建日期',0,110,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('29754384-d5a8-42f6-8c90-6b09cb03d976','Config_Grid','','Styler','样式函数',0,220,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d2a96030-51fd-4654-92d2-6b674b7a0834','_Sys_User','','UserID','UserID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9a01f38b-6d36-45f9-9524-6bbf6efe97eb','Config_Grid','','Width','列宽',0,80,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5d324cfa-383c-4c20-bc9e-6d66d977693e','Demo_TestB','','FK','FK',0,60,100,'center',1,'stringFormatter','','',1,1,0,'string,1000,0,0',1,1,0,1,1,0,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2370be85-9bf0-491a-87eb-6d9771cfe783','Config_Grid','','Frozen','冻结',0,93,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e16223c1-c109-4e4c-87ac-6defcfd7d8a4','Demo_TestA','','F2','F2',0,30,100,'center',1,'#是否','','',1,1,0,'boolean,1,0,0',1,1,1,1,1,0,to_date('2016/8/10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5e0292e8-fad9-49f6-98a9-6f19b8acc0e4','V_SYS_UserList','','UserName','账号',0,20,100,'center',0,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6e5f066a-266e-490e-bd27-6f766b42bc82','Demo_Area','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,1',0,1,1,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c9f214b4-8a2d-4922-bad1-6fb922e5b8db','Config_Grid','','Export','导出',0,155,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a4745393-d50f-4eea-acc6-6ff51faa3166','TestA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3176d7e-8f30-47fb-94b4-72ea863f0edf','Config_Grid','','LastEditTime','LastEditTime',1,999,100,'center',0,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('07f5d6ea-a864-43b0-be20-73e2ee27639b','Config_Grid','','Hidden','隐藏',0,105,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dc3bd7f6-85c6-423b-9b6e-753c260e8db1','Config_Grid','','OrderNum','序号',0,70,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8cfa1f35-efb1-43a4-8cf5-75471622ea03','Sys_Area','','Name','Name',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,1,1,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('090c99fb-3b4b-4a55-bbcc-7599f3521f1a','Demo_TestA','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',1,1,1,1,1,0,to_date('2016/8/10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('79ef80b4-c99e-4329-80d1-75bc6982827e','Demo_Area','','Sort','Sort',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c50abf17-f51e-4451-bf16-7a47d323c20c','V_SYS_UserList','','LoginCount','登录次数',0,100,100,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('94408e99-112c-4fd5-b01c-7abaa2230232','Config_ExcelInfo','','ExcelID','ExcelID',1,20,100,'center',1,'#','','',1,1,0,'guid,36,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('783b2307-5c6c-4918-9651-83c335897749','V_Test','$1','F4','F4',0,50,100,'center',1,'','','',1,1,1,'int32,10,0,0',0,1,1,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('54b485ed-b4a7-4dd2-80b7-83e5a2d9e08a','Config_Excel','','ExcelID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b91c6dee-98e7-44a5-a561-846026b0ac4c','V_SYS_UserList','','LastLoginIP','最后登录IP',0,120,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ad991995-8fdf-435b-847e-84a819642c5f','Config_Excel','','WhereType','条件方式',0,65,100,'center',0,'#异或','','',1,1,0,'string,50,0,0',0,0,0,1,1,0,to_date('2016/10/15 2:22:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('22aeb5a6-fbb6-44a7-98a6-86c37157447f','_Demo_TestA','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',0,1,1,1,1,0,to_date('2016/9/5 1:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ec5c9a21-3f59-467d-b00a-8771c9ed8009','_Sys_User','','LastLoginIP','LastLoginIP',0,120,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('22561a80-0c17-4f33-90ad-89383b4d863b','Demo_TestA','','F4','F4',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/8/10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6926db39-5a1b-474a-8a49-8c3ade5e8a80','Config_KeyValue','','ConfigName','配置名称',0,30,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,1,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('39ef9b02-2398-49e5-92ab-8f9868843c86','Demo_TestA','','mg_一级','F1-F2',0,11,100,'center',0,'','','',1,2,0,'string,50,0,0',1,1,1,0,1,0,to_date('2016/10/15 21:51:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('59b20311-abc0-4833-83b6-8fa48b1b5c62','V_SYS_UserList','','CreateTime','创建日期',1,140,100,'center',0,'创建日期','','',1,1,0,'datetime,23,3,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7cab0bb6-cf51-4fc9-97a7-904e2e8c3c04','_Sys_User','','Email','Email',0,80,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('47cb6912-8e5b-4c32-a704-92923e27295a','Sys_Role','','RoleID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,1,1,0,to_date('2016/5/9 9:00:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('87dba7eb-29b4-4d9a-87c5-9790295ad26e','Demo_Area','','Lvl','Lvl',0,60,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('945406d9-0413-4fcf-9b7d-980f7bd19dc0','Config_Excel','','StartIndex','起始行索引',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('55243ce2-adf4-4cef-9040-9b806984b7a8','Config_KeyValue','$1,''''titie'''':‘a''''','CreateTime','创建日期',0,80,100,'center',1,'dateFormatter','','',1,1,1,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2325f0b4-6761-4299-bfaf-9bf194990ff9','_Sys_User','','Password','Password',0,40,100,'center',1,'stringFormatter','','',1,1,0,'string,300,0,1',1,1,1,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('15a4c338-dbcf-463e-ad19-9d6db73d28a8','Demo_TestB','','F6','F6',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',1,1,1,1,1,0,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3f55684-ec71-478c-b4d4-9fa994d9f5c8','TestA','','F2','F2',0,30,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/5/10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cb7f2d58-f86d-4ea2-9b61-a34f45536091','V_SYS_UserList','','AreaID','AreaID',1,190,100,'center',0,'','','',1,1,0,'guid,16,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f91edd85-8eb2-4c76-b0d7-a7a920a834bd','Demo_Area','','Name','Name',0,30,200,'left',1,'stringFormatter','','',1,1,1,'string,100,0,0',0,1,1,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5aaf4825-c13a-4db3-b9d2-ab484a7423db','Config_Grid','','Edit','编辑',0,95,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c6324c64-e1a6-4040-941d-b0a5f090dcc9','V_Test','','F7','F7',0,80,100,'center',1,'','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7818505b-d8fc-467f-a31b-b0f8df331d5a','Demo_Area','','Desc','Desc',0,70,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('347a1c34-e085-4572-bd8c-b1bb58af0fd2','V_SYS_UserList','','Password','登陆密码',1,40,100,'center',0,'stringFormatter','','',1,1,0,'string,300,0,1',1,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('626652da-1073-4c21-a171-b4dc87b8faa2','Demo_Area','','PCode','PCode',0,40,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/8/21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a62ce6fe-7e82-4534-8bbe-bf220c5041ae','Config_Grid','','ImportUnique','唯一',0,158,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3de68456-fd6c-4e9d-b96f-bff50c372a86','Config_KeyValue','','OrderNo','排序号',0,70,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0b793799-d4f3-4965-89ac-c021c2bf1812','Config_Excel','','ExcelName','模板名称',0,30,100,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('969fd082-c2dc-4695-8530-c59cf2ac6909','V_Test','','mg_fk','Fk表头一只',0,85,100,'center',0,'','','',1,2,0,'string,50,0,0',0,0,0,0,1,0,to_date('2016/9/24 1:56:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8a5510bd-3318-4450-b8e5-c7a1e0b4603c','Sys_Action','','IsEnabled','是否启用',0,40,100,'center',0,'boolFormatter','','',1,1,0,'boolean,50,0,0',0,0,1,1,1,0,to_date('2016/10/26 15:50:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('372973fb-a89e-4a8f-b077-c88a594b90f0','_Sys_User','','FullName','FullName',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1',1,1,1,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2b2a9ed3-d90c-4215-9297-c9c16e083ba7','Config_Grid','','Colspan','跨列',0,877,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9d1c54c8-8573-415c-a693-cdb03a46a8e5','Config_Grid','','Sortable','排序',0,100,26,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('49d04e2b-544d-47e0-84c0-d0701eb300e0','Config_Grid','','Title','列称',0,50,100,'left',0,'','','',1,1,0,'string,50,0,1',1,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe3f3872-a746-4d1d-b363-d150363b0389','Demo_TestB','','F5','F5',0,20,100,'center',1,'','','',1,1,0,'int32,10,0,0',1,1,1,1,1,0,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f03ef5aa-e364-421c-adb4-d50d5a61bfe0','Config_Excel','','AcceptType','导入方式',0,70,100,'center',0,'#导入方式','','',1,1,0,'string,50,0,0',0,0,0,1,1,0,to_date('2016/10/16 19:46:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a154a2f8-e178-44fb-b4cc-d5c136702908','Demo_TestA','','F1','F1',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0',1,1,1,1,1,0,to_date('2016/8/10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('876e09ba-b754-4f24-bdca-db4e9703129b','Sys_Area','','Code','Code',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('691b4283-2d5e-489c-988c-dccc8c47734f','V_Test','$:{configkey:''''''''}','F2','F2',0,30,100,'center',1,'#是否','','',1,1,1,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/5/10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('727d5700-ba89-4f42-832b-e476a4654452','Sys_Area','','Sort','Sort',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/5/9 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e2e5cb59-81f6-4454-a0cb-e5465d89865f','V_SYS_UserList','','IsOk','IsOk',1,180,100,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2599c597-2486-40aa-b696-e5df14d17074','Sys_Action','','SortOrder','排序号',0,60,100,'center',1,'','','',1,1,0,'string,50,0,0',0,0,0,1,1,0,to_date('2016/11/30 14:34:55','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('213e5377-5ac7-4f08-ab10-e7f94fcfbadc','Config_Grid','','ObjName','对象名',0,20,100,'center',0,'','','',1,1,0,'string,50,0,1',1,1,1,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c5d2a39b-0d0e-43c3-b6f4-e8cfb46f6d4e','TestA','','F1','F1',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/5/10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('71633365-79ee-4bf8-bade-eaf2b64b0689','V_Test','','mg_00','一级表头',0,10,100,'center',0,'','','',1,4,0,'string,50,0,0',0,1,1,0,1,0,to_date('2016/10/14 0:13:41','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fc43313b-05f9-42d5-9ecb-ec53d27a3808','Config_ExcelInfo','','ForeignTable','外键对应的表名',0,90,100,'center',1,'#C_SYS_Table','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e1356447-8ed2-43b5-aa72-ec86c8c56674','sys_Action','','ActionRefName','代码引用名',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1',1,1,1,1,1,0,to_date('2016/5/9 9:00:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1571b424-c126-490b-b3e2-ed19ee52a86c','Config_ExcelInfo','','IsUnique','唯一',0,70,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1',1,1,0,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('20794510-2552-42af-95c4-f0c58e895a43','V_SYS_UserList','','Memo','Memo',1,170,100,'center',0,'stringFormatter','','',1,1,0,'string,150,0,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('05b355a0-2c63-4fad-b9f6-f368472fdbfe','_Demo_TestA','','F2','F2',0,30,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016/9/5 1:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7a88cb33-5b49-41d2-9430-f4e73407ab39','_Demo_TestA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,1',0,1,1,0,1,0,to_date('2016/9/5 1:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3556c02-3495-4d73-84b0-f5bb2580d0eb','Config_ExcelInfo','','TableName','表名',0,40,100,'center',1,'#C_SYS_Table','','',1,1,0,'string,100,0,0',0,1,1,1,1,0,to_date('2016/5/9 9:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('eca570f8-e84d-4dd0-9c6c-f5dc16ba6d0c','Config_KeyValue','','ConfigKey','配置键',0,20,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,1,1,1,0,to_date('2016/5/9 9:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6bad4445-d192-4cdc-b3d8-f696ed5d0dff','Sys_Role','','RoleName','角色',0,20,100,'center',0,'stringFormatter','','',1,1,0,'string,100,0,1',1,1,1,1,1,0,to_date('2016/5/9 9:00:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('416d3cdb-3767-4b7c-aa03-f6ee762ce36c','Config_Grid','','Editor','编辑函数',0,230,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('844685be-4b48-43bf-b6ea-f749e2d3149e','Config_Grid','','Rowspan','跨行',1,866,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016/4/26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0e0eb2a0-6550-4eeb-885b-fb44f6b5ee4f','_Sys_User','','LastLoginTime','LastLoginTime',0,110,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bcfaf8e0-0f20-439c-87ba-fc053839718d','V_SYS_UserList','$1','LastLoginTime','最后登录时间',0,110,100,'center',0,'dateFormatter','','',1,1,1,'datetime,23,3,0',0,1,0,0,1,0,to_date('2016/3/30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1e5f41e6-242e-45c1-beab-fd6ead9ad17f','Demo_Tree','','Name','Name',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016/8/31 21:50:00','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Config_KeyValue   */
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('8cc03067-437b-4baf-97df-003dfef000cd','异或','or','1','','',999,to_date('2016/10/15 2:23:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a47d3b60-c568-437b-a644-09c0298e4317','对齐方式','左','left','','',10,to_date('2016/5/4 10:01:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('776ec09f-f172-4858-bd84-0e2739651a26','性别','女','0','','',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('5283f129-c942-485b-92a4-156286db9f11','表名描述','V_SYS_UserList','用户管理','sys','',999,to_date('2016/4/29 17:33:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('b1b66447-22ad-4409-a4eb-20f0e35ad313','表名描述','Config_ExcelInfo','Excel导入配置','sys','',999,to_date('2016/10/16 2:40:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('1a96dae8-1ebb-4fb7-860c-21c118b6042c','账号状态','已删','4','','',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('4d2074d6-4720-4d61-9d91-31910c3dc869','导入方式','仅更新','2','','',2,to_date('2016/10/16 19:47:50','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('e00de83e-9b63-4ad0-9511-469000c9400d','账号状态','停用','2','','',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('f26442a5-faa2-4bc3-8177-4a0ba8e6146d','是否','否','0','','333',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('77ca2ee2-5cea-4ba2-9e04-5a5c9c2da8c2','导入方式','插入或更新','0','','',0,to_date('2016/10/16 19:47:35','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('0ba7ee95-b749-457d-8281-5bcf4ca684bc','表名描述','_Demo_TestA','Input对话框','sys','',999,to_date('2016/9/5 19:08:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('caa16e37-a4a8-42a3-abdb-61273930ecb7','表名描述','Demo_TestA','行内编辑列表','sys','',999,to_date('2016/9/5 17:09:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('bcb45af1-f17c-4973-ae1b-68f4c844e8d8','表名描述','Demo_TestB','行内编辑级联','sys','',999,to_date('2016/10/15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('c21dfd8d-613f-4830-bacf-6cd903cf6541','表名描述','Config_KeyValue','配置维护','sys','',999,to_date('2016/9/7 11:02:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('fa192da4-7b4b-4bbd-bae3-8208544c42ba','异或','and','0','','',999,to_date('2016/10/15 2:23:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('46096d68-464f-4b02-b5a6-9153c2fb3479','表名描述','sys_Action','功能管理','sys','',999,to_date('2016/9/8 16:48:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('2a774a0d-b4e7-4ba3-8c4b-969de63a533a','导入方式','仅插入','1','','',1,to_date('2016/10/16 19:47:42','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('7950cddc-0b13-4a30-8b60-984d5f08437e','账号状态','启用','1','','',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('46ca804f-9055-40c8-b5b5-9a6a79ba65f3','表名描述','Sys_Role','权限管理','sys','',999,to_date('2016/9/6 19:49:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('7097c1b7-45f2-4cbb-bd72-9d58e8357636','对齐方式','右','right','','',30,to_date('2016/5/4 10:01:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a366918e-a24a-4288-ab57-a29b858ab5ef','表名描述','_Sys_User','Input对话框','sys','',999,to_date('2016/9/10 0:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a9836e3e-bbe4-4f3e-8963-af06e4963403','SysConfig','OperatorTitle','操作','','',999,to_date('2016/9/1 1:03:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('911aaf5b-bade-43a2-91ae-b86304dc420d','表名描述','Config_Excel','导入配置','sys','',999,to_date('2016/9/8 16:48:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('e574bcb7-2345-4022-a11f-c50c03861afc','对齐方式','中','center','','',20,to_date('2016/5/4 10:01:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('8fa0eab5-e033-4f51-82db-ce179baa124f','表名描述','Config_Grid','Input对话框','sys','',999,to_date('2016/9/6 3:12:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a662070b-ab2a-4f0a-a6da-df03640c0a91','表名描述','Demo_Area','树形表格','sys','',999,to_date('2016/9/5 17:21:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('596a4a36-ff60-453b-83df-e8e6e34e013f','表名描述','V_Test','普通列表','sys','',999,to_date('2016/5/10 14:35:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('c9000a82-2e52-40e6-ba4d-ebef95cf4e46','账号状态','锁定','3','','',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a58f89d2-4f23-471b-b05c-f9b9ff7337a6','是否','是','1','','32323',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('9bae6656-0bb0-438b-9e9d-fc06fcbfab56','性别','男','1','','32323',999,to_date('2014/11/11 11:37:47','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Demo_Area   */
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1,'100000000','北京市','',1,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2,'200000000','天津市','',2,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3,'200100000','天津市','200000000',2,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(4,'200100001','和平区','200100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(5,'200100002','河东区','200100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(6,'200100003','河西区','200100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(7,'200100004','南开区','200100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(8,'200100005','河北区','200100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(9,'200100006','红桥区','200100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(10,'200100007','塘沽区','200100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(11,'200100008','汉沽区','200100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(12,'200100009','大港区','200100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(13,'200100010','东丽区','200100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(14,'200100011','西青区','200100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(15,'200100012','津南区','200100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(16,'200100013','北辰区','200100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(17,'200100014','武清区','200100000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(18,'200100015','宝坻区','200100000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(19,'200100016','宁河县','200100000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(20,'200100017','静海县','200100000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(21,'200100018','蓟县','200100000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(22,'300000000','上海市','',3,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(23,'300100000','上海市','300000000',3,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(24,'300100001','黄浦区','300100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(25,'300100002','卢湾区','300100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(26,'300100003','徐汇区','300100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(27,'300100004','长宁区','300100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(28,'300100005','静安区','300100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(29,'300100006','普陀区','300100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(30,'300100007','闸北区','300100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(31,'300100008','虹口区','300100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(32,'300100009','杨浦区','300100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(33,'300100010','闵行区','300100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(34,'300100011','宝山区','300100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(35,'300100012','嘉定区','300100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(36,'300100013','浦东新区','300100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(37,'300100014','金山区','300100000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(38,'300100015','松江区','300100000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(39,'300100016','青浦区','300100000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(40,'300100017','南汇区','300100000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(41,'300100018','奉贤区','300100000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(42,'300100019','崇明县','300100000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(43,'400000000','重庆市','',4,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(44,'400100000','重庆市','400000000',4,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(45,'400100001','万州区','400100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(46,'400100002','涪陵区','400100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(47,'400100003','渝中区','400100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(48,'400100004','大渡口区','400100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(49,'400100005','江北区','400100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(50,'400100006','沙坪坝区','400100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(51,'400100007','九龙坡区','400100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(52,'400100008','南岸区','400100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(53,'400100009','北碚区','400100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(54,'400100010','万盛区','400100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(55,'400100011','双桥区','400100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(56,'400100012','渝北区','400100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(57,'400100013','巴南区','400100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(58,'400100014','黔江区','400100000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(59,'400100015','长寿区','400100000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(60,'400100016','江津区','400100000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(61,'400100017','合川区','400100000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(62,'400100018','永川区','400100000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(63,'400100019','南川区','400100000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(64,'400100020','綦江县','400100000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(65,'400100021','潼南县','400100000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(66,'400100022','铜梁县','400100000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(67,'400100023','大足县','400100000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(68,'400100024','荣昌县','400100000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(69,'400100025','璧山县','400100000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(70,'400100026','梁平县','400100000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(71,'400100027','城口县','400100000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(72,'400100028','丰都县','400100000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(73,'400100029','垫江县','400100000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(74,'400100030','武隆县','400100000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(75,'400100031','忠县','400100000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(76,'400100032','开县','400100000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(77,'400100033','云阳县','400100000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(78,'400100034','奉节县','400100000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(79,'400100035','巫山县','400100000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(80,'400100036','巫溪县','400100000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(81,'400100037','石柱土家族自治县','400100000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(82,'400100038','秀山土家族苗族自治县','400100000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(83,'400100039','酉阳土家族苗族自治县','400100000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(84,'400100040','彭水苗族土家族自治县','400100000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(85,'500000000','河北省','',5,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(86,'500100000','邯郸市','500000000',5,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(87,'500100001','邯山区','500100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(88,'500100002','丛台区','500100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(89,'500100003','复兴区','500100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(90,'500100004','峰峰矿区','500100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(91,'500100005','邯郸县','500100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(92,'500100006','临漳县','500100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(93,'500100007','成安县','500100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(94,'500100008','大名县','500100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(95,'500100009','涉县','500100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(96,'500100010','磁县','500100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(97,'500100011','肥乡县','500100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(98,'500100012','永年县','500100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(99,'500100013','邱县','500100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(100,'500100014','鸡泽县','500100000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(101,'500100015','广平县','500100000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(102,'500100016','馆陶县','500100000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(103,'500100017','魏县','500100000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(104,'500100018','曲周县','500100000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(105,'500100019','武安市','500100000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(106,'500200000','石家庄市','500000000',6,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(107,'500200020','长安区','500200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(108,'500200021','桥东区','500200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(109,'500200022','桥西区','500200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(110,'500200023','新华区','500200000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(111,'500200024','井陉矿区','500200000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(112,'500200025','裕华区','500200000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(113,'500200026','井陉县','500200000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(114,'500200027','正定县','500200000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(115,'500200028','栾城县','500200000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(116,'500200029','行唐县','500200000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(117,'500200030','灵寿县','500200000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(118,'500200031','高邑县','500200000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(119,'500200032','深泽县','500200000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(120,'500200033','赞皇县','500200000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(121,'500200034','无极县','500200000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(122,'500200035','平山县','500200000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(123,'500200036','元氏县','500200000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(124,'500200037','赵县','500200000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(125,'500200038','辛集市','500200000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(126,'500200039','藁城市','500200000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(127,'500200040','晋州市','500200000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(128,'500200041','新乐市','500200000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(129,'500200042','鹿泉市','500200000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(130,'500300000','保定市','500000000',7,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(131,'500300043','新市区','500300000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(132,'500300044','北市区','500300000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(133,'500300045','南市区','500300000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(134,'500300046','满城县','500300000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(135,'500300047','清苑县','500300000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(136,'500300048','涞水县','500300000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(137,'500300049','阜平县','500300000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(138,'500300050','徐水县','500300000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(139,'500300051','定兴县','500300000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(140,'500300052','唐县','500300000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(141,'500300053','高阳县','500300000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(142,'500300054','容城县','500300000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(143,'500300055','涞源县','500300000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(144,'500300056','望都县','500300000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(145,'500300057','安新县','500300000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(146,'500300058','易县','500300000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(147,'500300059','曲阳县','500300000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(148,'500300060','蠡县','500300000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(149,'500300061','顺平县','500300000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(150,'500300062','博野县','500300000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(151,'500300063','雄县','500300000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(152,'500300064','涿州市','500300000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(153,'500300065','定州市','500300000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(154,'500300066','安国市','500300000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(155,'500300067','高碑店市','500300000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(156,'500400000','张家口市','500000000',8,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(157,'500400068','桥东区','500400000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(158,'500400069','桥西区','500400000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(159,'500400070','宣化区','500400000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(160,'500400071','下花园区','500400000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(161,'500400072','宣化县','500400000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(162,'500400073','张北县','500400000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(163,'500400074','康保县','500400000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(164,'500400075','沽源县','500400000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(165,'500400076','尚义县','500400000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(166,'500400077','蔚县','500400000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(167,'500400078','阳原县','500400000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(168,'500400079','怀安县','500400000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(169,'500400080','万全县','500400000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(170,'500400081','怀来县','500400000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(171,'500400082','涿鹿县','500400000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(172,'500400083','赤城县','500400000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(173,'500400084','崇礼县','500400000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(174,'500500000','承德市','500000000',9,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(175,'500500085','双桥区','500500000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(176,'500500086','双滦区','500500000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(177,'500500087','鹰手营子矿区','500500000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(178,'500500088','承德县','500500000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(179,'500500089','兴隆县','500500000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(180,'500500090','平泉县','500500000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(181,'500500091','滦平县','500500000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(182,'500500092','隆化县','500500000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(183,'500500093','丰宁满族自治县','500500000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(184,'500500094','宽城满族自治县','500500000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(185,'500500095','围场满族蒙古族自治县','500500000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(186,'500600000','唐山市','500000000',10,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(187,'500600096','路南区','500600000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(188,'500600097','路北区','500600000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(189,'500600098','古冶区','500600000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(190,'500600099','开平区','500600000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(191,'500600100','丰南区','500600000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(192,'500600101','丰润区','500600000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(193,'500600102','滦县','500600000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(194,'500600103','滦南县','500600000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(195,'500600104','乐亭县','500600000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(196,'500600105','迁西县','500600000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(197,'500600106','玉田县','500600000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(198,'500600107','唐海县','500600000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(199,'500600108','遵化市','500600000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(200,'500600109','迁安市','500600000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(201,'500700000','廊坊市','500000000',11,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(202,'500700110','安次区','500700000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(203,'500700111','广阳区','500700000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(204,'500700112','固安县','500700000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(205,'500700113','永清县','500700000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(206,'500700114','香河县','500700000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(207,'500700115','大城县','500700000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(208,'500700116','文安县','500700000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(209,'500700117','大厂回族自治县','500700000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(210,'500700118','霸州市','500700000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(211,'500700119','三河市','500700000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(212,'500800000','沧州市','500000000',12,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(213,'500800120','新华区','500800000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(214,'500800121','运河区','500800000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(215,'500800122','沧县','500800000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(216,'500800123','青县','500800000',123,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(217,'500800124','东光县','500800000',124,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(218,'500800125','海兴县','500800000',125,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(219,'500800126','盐山县','500800000',126,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(220,'500800127','肃宁县','500800000',127,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(221,'500800128','南皮县','500800000',128,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(222,'500800129','吴桥县','500800000',129,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(223,'500800130','献县','500800000',130,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(224,'500800131','孟村回族自治县','500800000',131,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(225,'500800132','泊头市','500800000',132,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(226,'500800133','任丘市','500800000',133,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(227,'500800134','黄骅市','500800000',134,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(228,'500800135','河间市','500800000',135,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(229,'500900000','衡水市','500000000',13,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(230,'500900136','桃城区','500900000',136,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(231,'500900137','枣强县','500900000',137,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(232,'500900138','武邑县','500900000',138,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(233,'500900139','武强县','500900000',139,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(234,'500900140','饶阳县','500900000',140,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(235,'500900141','安平县','500900000',141,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(236,'500900142','故城县','500900000',142,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(237,'500900143','景县','500900000',143,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(238,'500900144','阜城县','500900000',144,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(239,'500900145','冀州市','500900000',145,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(240,'500900146','深州市','500900000',146,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(241,'501000000','邢台市','500000000',14,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(242,'501000147','桥东区','501000000',147,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(243,'501000148','桥西区','501000000',148,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(244,'501000149','邢台县','501000000',149,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(245,'501000150','临城县','501000000',150,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(246,'501000151','内丘县','501000000',151,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(247,'501000152','柏乡县','501000000',152,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(248,'501000153','隆尧县','501000000',153,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(249,'501000154','任县','501000000',154,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(250,'501000155','南和县','501000000',155,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(251,'501000156','宁晋县','501000000',156,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(252,'501000157','巨鹿县','501000000',157,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(253,'501000158','新河县','501000000',158,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(254,'501000159','广宗县','501000000',159,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(255,'501000160','平乡县','501000000',160,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(256,'501000161','威县','501000000',161,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(257,'501000162','清河县','501000000',162,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(258,'501000163','临西县','501000000',163,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(259,'501000164','南宫市','501000000',164,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(260,'501000165','沙河市','501000000',165,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(261,'600000000','山西省','',6,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(262,'600100000','朔州市','600000000',16,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(263,'600100001','朔城区','600100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(264,'600100002','平鲁区','600100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(265,'600100003','山阴县','600100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(266,'600100004','应县','600100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(267,'600100005','右玉县','600100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(268,'600100006','怀仁县','600100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(269,'600200000','忻州市','600000000',17,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(270,'600200007','忻府区','600200000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(271,'600200008','定襄县','600200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(272,'600200009','五台县','600200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(273,'600200010','代县','600200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(274,'600200011','繁峙县','600200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(275,'600200012','宁武县','600200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(276,'600200013','静乐县','600200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(277,'600200014','神池县','600200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(278,'600200015','五寨县','600200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(279,'600200016','岢岚县','600200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(280,'600200017','河曲县','600200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(281,'600200018','保德县','600200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(282,'600200019','偏关县','600200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(283,'600200020','原平市','600200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(284,'600300000','太原市','600000000',18,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(285,'600300021','小店区','600300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(286,'600300022','迎泽区','600300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(287,'600300023','杏花岭区','600300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(288,'600300024','尖草坪区','600300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(289,'600300025','万柏林区','600300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(290,'600300026','晋源区','600300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(291,'600300027','清徐县','600300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(292,'600300028','阳曲县','600300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(293,'600300029','娄烦县','600300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(294,'600300030','古交市','600300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(295,'600400000','大同市','600000000',19,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(296,'600400031','矿区','600400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(297,'600400032','南郊区','600400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(298,'600400033','新荣区','600400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(299,'600400034','阳高县','600400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(300,'600400035','天镇县','600400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(301,'600400036','广灵县','600400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(302,'600400037','灵丘县','600400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(303,'600400038','浑源县','600400000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(304,'600400039','左云县','600400000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(305,'600400040','大同县','600400000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(306,'600500000','阳泉市','600000000',20,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(307,'600500041','矿区','600500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(308,'600500042','平定县','600500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(309,'600500043','盂县','600500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(310,'600600000','晋中市','600000000',21,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(311,'600600044','榆次区','600600000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(312,'600600045','榆社县','600600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(313,'600600046','左权县','600600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(314,'600600047','和顺县','600600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(315,'600600048','昔阳县','600600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(316,'600600049','寿阳县','600600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(317,'600600050','太谷县','600600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(318,'600600051','祁县','600600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(319,'600600052','平遥县','600600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(320,'600600053','灵石县','600600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(321,'600600054','介休市','600600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(322,'600700000','长治市','600000000',22,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(323,'600700055','长治县','600700000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(324,'600700056','襄垣县','600700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(325,'600700057','屯留县','600700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(326,'600700058','平顺县','600700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(327,'600700059','黎城县','600700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(328,'600700060','壶关县','600700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(329,'600700061','长子县','600700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(330,'600700062','武乡县','600700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(331,'600700063','沁县','600700000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(332,'600700064','沁源县','600700000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(333,'600700065','潞城市','600700000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(334,'600800000','晋城市','600000000',23,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(335,'600800066','沁水县','600800000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(336,'600800067','阳城县','600800000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(337,'600800068','陵川县','600800000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(338,'600800069','泽州县','600800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(339,'600800070','高平市','600800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(340,'600900000','临汾市','600000000',24,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(341,'600900071','尧都区','600900000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(342,'600900072','曲沃县','600900000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(343,'600900073','翼城县','600900000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(344,'600900074','襄汾县','600900000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(345,'600900075','洪洞县','600900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(346,'600900076','古县','600900000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(347,'600900077','安泽县','600900000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(348,'600900078','浮山县','600900000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(349,'600900079','吉县','600900000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(350,'600900080','乡宁县','600900000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(351,'600900081','大宁县','600900000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(352,'600900082','隰县','600900000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(353,'600900083','永和县','600900000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(354,'600900084','蒲县','600900000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(355,'600900085','汾西县','600900000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(356,'600900086','侯马市','600900000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(357,'600900087','霍州市','600900000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(358,'601000000','吕梁市','600000000',25,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(359,'601000088','离石区','601000000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(360,'601000089','文水县','601000000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(361,'601000090','交城县','601000000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(362,'601000091','兴县','601000000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(363,'601000092','临县','601000000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(364,'601000093','柳林县','601000000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(365,'601000094','石楼县','601000000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(366,'601000095','岚县','601000000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(367,'601000096','方山县','601000000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(368,'601000097','中阳县','601000000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(369,'601000098','交口县','601000000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(370,'601000099','孝义市','601000000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(371,'601000100','汾阳市','601000000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(372,'601100000','运城市','600000000',26,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(373,'601100101','盐湖区','601100000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(374,'601100102','临猗县','601100000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(375,'601100103','万荣县','601100000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(376,'601100104','闻喜县','601100000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(377,'601100105','稷山县','601100000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(378,'601100106','新绛县','601100000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(379,'601100107','绛县','601100000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(380,'601100108','垣曲县','601100000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(381,'601100109','夏县','601100000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(382,'601100110','平陆县','601100000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(383,'601100111','芮城县','601100000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(384,'601100112','永济市','601100000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(385,'601100113','河津市','601100000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(386,'700000000','台湾省','',7,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(387,'700100000','台北市','700000000',363,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(388,'700200000','高雄市','700000000',364,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(389,'700300000','基隆市','700000000',365,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(390,'700400000','台中市','700000000',366,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(391,'700500000','台南市','700000000',367,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(392,'700600000','新竹市','700000000',368,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(393,'700700000','嘉义市','700000000',369,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(394,'800000000','辽宁省','',8,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(395,'800100000','沈阳市','800000000',27,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(396,'800100001','和平区','800100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(397,'800100002','沈河区','800100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(398,'800100003','大东区','800100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(399,'800100004','皇姑区','800100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(400,'800100005','铁西区','800100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(401,'800100006','苏家屯区','800100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(402,'800100007','东陵区','800100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(403,'800100008','沈北新区','800100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(404,'800100009','于洪区','800100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(405,'800100010','辽中县','800100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(406,'800100011','康平县','800100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(407,'800100012','法库县','800100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(408,'800100013','新民市','800100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(409,'800200000','铁岭市','800000000',28,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(410,'800200014','银州区','800200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(411,'800200015','清河区','800200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(412,'800200016','铁岭县','800200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(413,'800200017','西丰县','800200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(414,'800200018','昌图县','800200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(415,'800200019','调兵山市','800200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(416,'800200020','开原市','800200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(417,'800300000','大连市','800000000',29,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(418,'800300021','长海县','800300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(419,'800300022','旅顺口区','800300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(420,'800300023','中山区','800300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(421,'800300024','西岗区','800300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(422,'800300025','沙河口区','800300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(423,'800300026','甘井子区','800300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(424,'800300027','金州区','800300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(425,'800300028','普兰店市','800300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(426,'800300029','瓦房店市','800300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(427,'800300030','庄河市','800300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(428,'800400000','鞍山市','800000000',30,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(429,'800400031','铁东区','800400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(430,'800400032','铁西区','800400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(431,'800400033','立山区','800400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(432,'800400034','千山区','800400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(433,'800400035','台安县','800400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(434,'800400036','岫岩满族自治县','800400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(435,'800400037','海城市','800400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(436,'800500000','抚顺市','800000000',31,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(437,'800500038','新抚区','800500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(438,'800500039','东洲区','800500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(439,'800500040','望花区','800500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(440,'800500041','顺城区','800500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(441,'800500042','抚顺县','800500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(442,'800500043','新宾满族自治县','800500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(443,'800500044','清原满族自治县','800500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(444,'800600000','本溪市','800000000',32,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(445,'800600045','平山区','800600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(446,'800600046','溪湖区','800600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(447,'800600047','明山区','800600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(448,'800600048','南芬区','800600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(449,'800600049','本溪满族自治县','800600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(450,'800600050','桓仁满族自治县','800600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(451,'800700000','丹东市','800000000',33,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(452,'800700051','元宝区','800700000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(453,'800700052','振兴区','800700000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(454,'800700053','振安区','800700000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(455,'800700054','宽甸满族自治县','800700000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(456,'800700055','东港市','800700000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(457,'800700056','凤城市','800700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(458,'800800000','锦州市','800000000',34,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(459,'800800057','古塔区','800800000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(460,'800800058','凌河区','800800000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(461,'800800059','太和区','800800000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(462,'800800060','黑山县','800800000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(463,'800800061','义县','800800000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(464,'800800062','凌海市','800800000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(465,'800800063','北镇市','800800000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(466,'800900000','营口市','800000000',35,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(467,'800900064','站前区','800900000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(468,'800900065','西市区','800900000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(469,'800900066','鮁鱼圈区','800900000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(470,'800900067','老边区','800900000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(471,'800900068','盖州市','800900000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(472,'800900069','大石桥市','800900000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(473,'801000000','阜新市','800000000',36,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(474,'801000070','海州区','801000000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(475,'801000071','新邱区','801000000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(476,'801000072','太平区','801000000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(477,'801000073','清河门区','801000000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(478,'801000074','细河区','801000000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(479,'801000075','阜新蒙古族自治县','801000000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(480,'801000076','彰武县','801000000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(481,'801100000','辽阳市','800000000',37,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(482,'801100077','白塔区','801100000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(483,'801100078','文圣区','801100000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(484,'801100079','宏伟区','801100000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(485,'801100080','弓长岭区','801100000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(486,'801100081','太子河区','801100000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(487,'801100082','辽阳县','801100000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(488,'801100083','灯塔市','801100000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(489,'801200000','朝阳市','800000000',38,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(490,'801200084','双塔区','801200000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(491,'801200085','龙城区','801200000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(492,'801200086','朝阳县','801200000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(493,'801200087','建平县','801200000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(494,'801200088','喀喇沁左翼蒙古族自治县','801200000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(495,'801200089','北票市','801200000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(496,'801200090','凌源市','801200000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(497,'801300000','盘锦市','800000000',39,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(498,'801300091','双台子区','801300000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(499,'801300092','兴隆台区','801300000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(500,'801300093','大洼县','801300000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(501,'801300094','盘山县','801300000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(502,'801400000','葫芦岛市','800000000',40,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(503,'801400095','连山区','801400000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(504,'801400096','龙港区','801400000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(505,'801400097','南票区','801400000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(506,'801400098','绥中县','801400000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(507,'801400099','建昌县','801400000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(508,'801400100','兴城市','801400000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(509,'900000000','吉林省','',9,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(510,'900100000','长春市','900000000',41,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(511,'900100001','南关区','900100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(512,'900100002','宽城区','900100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(513,'900100003','朝阳区','900100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(514,'900100004','二道区','900100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(515,'900100005','绿园区','900100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(516,'900100006','双阳区','900100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(517,'900100007','农安县','900100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(518,'900100008','九台市','900100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(519,'900100009','榆树市','900100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(520,'900100010','德惠市','900100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(521,'900200000','吉林市','900000000',42,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(522,'900200011','昌邑区','900200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(523,'900200012','龙潭区','900200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(524,'900200013','船营区','900200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(525,'900200014','丰满区','900200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(526,'900200015','永吉县','900200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(527,'900200016','蛟河市','900200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(528,'900200017','桦甸市','900200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(529,'900200018','舒兰市','900200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(530,'900200019','磐石市','900200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(531,'900300000','延边朝鲜族自治州','900000000',43,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(532,'900300020','延吉市','900300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(533,'900300021','图们市','900300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(534,'900300022','敦化市','900300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(535,'900300023','珲春市','900300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(536,'900300024','龙井市','900300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(537,'900300025','和龙市','900300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(538,'900300026','汪清县','900300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(539,'900300027','安图县','900300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(540,'900400000','四平市','900000000',44,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(541,'900400028','铁西区','900400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(542,'900400029','铁东区','900400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(543,'900400030','梨树县','900400000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(544,'900400031','伊通满族自治县','900400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(545,'900400032','公主岭市','900400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(546,'900400033','双辽市','900400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(547,'900500000','通化市','900000000',45,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(548,'900500034','东昌区','900500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(549,'900500035','二道江区','900500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(550,'900500036','通化县','900500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(551,'900500037','辉南县','900500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(552,'900500038','柳河县','900500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(553,'900500039','梅河口市','900500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(554,'900500040','集安市','900500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(555,'900600000','白城市','900000000',46,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(556,'900600041','洮北区','900600000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(557,'900600042','镇赉县','900600000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(558,'900600043','通榆县','900600000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(559,'900600044','洮南市','900600000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(560,'900600045','大安市','900600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(561,'900700000','辽源市','900000000',47,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(562,'900700046','龙山区','900700000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(563,'900700047','西安区','900700000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(564,'900700048','东丰县','900700000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(565,'900700049','东辽县','900700000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(566,'900800000','松原市','900000000',48,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(567,'900800050','宁江区','900800000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(568,'900800051','前郭尔罗斯蒙古族自治县','900800000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(569,'900800052','长岭县','900800000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(570,'900800053','乾安县','900800000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(571,'900800054','扶余县','900800000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(572,'900900000','白山市','900000000',49,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(573,'900900055','八道江区','900900000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(574,'900900056','江源区','900900000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(575,'900900057','抚松县','900900000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(576,'900900058','靖宇县','900900000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(577,'900900059','长白朝鲜族自治县','900900000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(578,'900900060','临江市','900900000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(579,'1000000000','黑龙江省','',10,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(580,'1000100000','哈尔滨市','1000000000',50,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(581,'1000100001','道里区','1000100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(582,'1000100002','南岗区','1000100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(583,'1000100003','道外区','1000100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(584,'1000100004','平房区','1000100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(585,'1000100005','松北区','1000100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(586,'1000100006','香坊区','1000100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(587,'1000100007','呼兰区','1000100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(588,'1000100008','阿城区','1000100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(589,'1000100009','依兰县','1000100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(590,'1000100010','方正县','1000100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(591,'1000100011','宾县','1000100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(592,'1000100012','巴彦县','1000100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(593,'1000100013','木兰县','1000100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(594,'1000100014','通河县','1000100000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(595,'1000100015','延寿县','1000100000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(596,'1000100016','双城市','1000100000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(597,'1000100017','尚志市','1000100000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(598,'1000100018','五常市','1000100000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(599,'1000200000','齐齐哈尔市','1000000000',51,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(600,'1000200019','龙沙区','1000200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(601,'1000200020','建华区','1000200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(602,'1000200021','铁锋区','1000200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(603,'1000200022','昂昂溪区','1000200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(604,'1000200023','富拉尔基区','1000200000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(605,'1000200024','碾子山区','1000200000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(606,'1000200025','梅里斯达翰尔族区','1000200000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(607,'1000200026','龙江县','1000200000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(608,'1000200027','依安县','1000200000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(609,'1000200028','泰来县','1000200000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(610,'1000200029','甘南县','1000200000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(611,'1000200030','富裕县','1000200000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(612,'1000200031','克山县','1000200000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(613,'1000200032','克东县','1000200000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(614,'1000200033','拜泉县','1000200000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(615,'1000200034','讷河市','1000200000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(616,'1000300000','鸡西市','1000000000',52,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(617,'1000300035','鸡冠区','1000300000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(618,'1000300036','恒山区','1000300000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(619,'1000300037','滴道区','1000300000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(620,'1000300038','梨树区','1000300000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(621,'1000300039','城子河区','1000300000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(622,'1000300040','麻山区','1000300000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(623,'1000300041','鸡东县','1000300000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(624,'1000300042','虎林市','1000300000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(625,'1000300043','密山市','1000300000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(626,'1000400000','牡丹江市','1000000000',53,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(627,'1000400044','东安区','1000400000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(628,'1000400045','阳明区','1000400000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(629,'1000400046','爱民区','1000400000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(630,'1000400047','西安区','1000400000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(631,'1000400048','东宁县','1000400000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(632,'1000400049','林口县','1000400000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(633,'1000400050','绥芬河市','1000400000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(634,'1000400051','海林市','1000400000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(635,'1000400052','宁安市','1000400000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(636,'1000400053','穆棱市','1000400000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(637,'1000500000','七台河市','1000000000',54,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(638,'1000500054','新兴区','1000500000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(639,'1000500055','桃山区','1000500000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(640,'1000500056','茄子河区','1000500000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(641,'1000500057','勃利县','1000500000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(642,'1000600000','佳木斯市','1000000000',55,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(643,'1000600058','向阳区','1000600000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(644,'1000600059','前进区','1000600000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(645,'1000600060','东风区','1000600000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(646,'1000600061','桦南县','1000600000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(647,'1000600062','桦川县','1000600000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(648,'1000600063','汤原县','1000600000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(649,'1000600064','抚远县','1000600000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(650,'1000600065','同江市','1000600000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(651,'1000600066','富锦市','1000600000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(652,'1000700000','鹤岗市','1000000000',56,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(653,'1000700067','向阳区','1000700000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(654,'1000700068','工农区','1000700000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(655,'1000700069','南山区','1000700000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(656,'1000700070','兴安区','1000700000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(657,'1000700071','东山区','1000700000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(658,'1000700072','兴山区','1000700000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(659,'1000700073','萝北县','1000700000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(660,'1000700074','绥滨县','1000700000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(661,'1000800000','双鸭山市','1000000000',57,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(662,'1000800075','尖山区','1000800000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(663,'1000800076','岭东区','1000800000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(664,'1000800077','四方台区','1000800000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(665,'1000800078','宝山区','1000800000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(666,'1000800079','集贤县','1000800000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(667,'1000800080','友谊县','1000800000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(668,'1000800081','宝清县','1000800000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(669,'1000800082','饶河县','1000800000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(670,'1000900000','绥化市','1000000000',58,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(671,'1000900083','北林区','1000900000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(672,'1000900084','望奎县','1000900000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(673,'1000900085','兰西县','1000900000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(674,'1000900086','青冈县','1000900000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(675,'1000900087','庆安县','1000900000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(676,'1000900088','明水县','1000900000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(677,'1000900089','绥棱县','1000900000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(678,'1000900090','安达市','1000900000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(679,'1000900091','肇东市','1000900000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(680,'1000900092','海伦市','1000900000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(681,'1001000000','黑河市','1000000000',59,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(682,'1001000093','爱辉区','1001000000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(683,'1001000094','嫩江县','1001000000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(684,'1001000095','逊克县','1001000000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(685,'1001000096','孙吴县','1001000000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(686,'1001000097','北安市','1001000000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(687,'1001000098','五大连池市','1001000000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(688,'1001100000','大兴安岭地区','1000000000',60,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(689,'1001100099','呼玛县','1001100000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(690,'1001100100','塔河县','1001100000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(691,'1001100101','漠河县','1001100000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(692,'1001200000','伊春市','1000000000',61,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(693,'1001200102','伊春区','1001200000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(694,'1001200103','南岔区','1001200000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(695,'1001200104','友好区','1001200000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(696,'1001200105','西林区','1001200000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(697,'1001200106','翠峦区','1001200000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(698,'1001200107','新青区','1001200000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(699,'1001200108','美溪区','1001200000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(700,'1001200109','金山屯区','1001200000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(701,'1001200110','五营区','1001200000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(702,'1001200111','乌马河区','1001200000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(703,'1001200112','汤旺河区','1001200000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(704,'1001200113','带岭区','1001200000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(705,'1001200114','乌伊岭区','1001200000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(706,'1001200115','红星区','1001200000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(707,'1001200116','上甘岭区','1001200000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(708,'1001200117','嘉荫县','1001200000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(709,'1001200118','铁力市','1001200000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(710,'1001300000','大庆市','1000000000',62,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(711,'1001300119','萨尔图区','1001300000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(712,'1001300120','龙凤区','1001300000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(713,'1001300121','让胡路区','1001300000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(714,'1001300122','红岗区','1001300000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(715,'1001300123','大同区','1001300000',123,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(716,'1001300124','肇州县','1001300000',124,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(717,'1001300125','肇源县','1001300000',125,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(718,'1001300126','林甸县','1001300000',126,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(719,'1001300127','杜尔伯特蒙古族自治县','1001300000',127,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(720,'1100000000','江苏省','',11,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(721,'1100100000','南京市','1100000000',63,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(722,'1100100001','江宁区','1100100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(723,'1100100002','浦口区','1100100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(724,'1100100003','玄武区','1100100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(725,'1100100004','白下区','1100100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(726,'1100100005','秦淮区','1100100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(727,'1100100006','建邺区','1100100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(728,'1100100007','鼓楼区','1100100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(729,'1100100008','下关区','1100100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(730,'1100100009','栖霞区','1100100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(731,'1100100010','雨花台区','1100100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(732,'1100100011','六合区','1100100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(733,'1100100012','溧水县','1100100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(734,'1100100013','高淳县','1100100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(735,'1100200000','无锡市','1100000000',64,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(736,'1100200014','崇安区','1100200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(737,'1100200015','南长区','1100200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(738,'1100200016','北塘区','1100200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(739,'1100200017','锡山区','1100200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(740,'1100200018','惠山区','1100200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(741,'1100200019','滨湖区','1100200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(742,'1100200020','江阴市','1100200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(743,'1100200021','宜兴市','1100200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(744,'1100300000','镇江市','1100000000',65,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(745,'1100300022','京口区','1100300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(746,'1100300023','润州区','1100300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(747,'1100300024','丹徒区','1100300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(748,'1100300025','丹阳市','1100300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(749,'1100300026','扬中市','1100300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(750,'1100300027','句容市','1100300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(751,'1100400000','苏州市','1100000000',66,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(752,'1100400028','沧浪区','1100400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(753,'1100400029','常熟市','1100400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(754,'1100400030','平江区','1100400000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(755,'1100400031','金阊区','1100400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(756,'1100400032','虎丘区','1100400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(757,'1100400033','昆山市','1100400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(758,'1100400034','太仓市','1100400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(759,'1100400035','吴江市','1100400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(760,'1100400036','吴中区','1100400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(761,'1100400037','相城区','1100400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(762,'1100400038','张家港市','1100400000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(763,'1100500000','南通市','1100000000',67,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(764,'1100500039','崇川区','1100500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(765,'1100500040','港闸区','1100500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(766,'1100500041','海安县','1100500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(767,'1100500042','如东县','1100500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(768,'1100500043','启东市','1100500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(769,'1100500044','如皋市','1100500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(770,'1100500045','通州市','1100500000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(771,'1100500046','海门市','1100500000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(772,'1100600000','扬州市','1100000000',68,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(773,'1100600047','高邮市','1100600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(774,'1100600048','广陵区','1100600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(775,'1100600049','邗江区','1100600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(776,'1100600050','维扬区','1100600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(777,'1100600051','宝应县','1100600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(778,'1100600052','江都市','1100600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(779,'1100600053','仪征市','1100600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(780,'1100700000','盐城市','1100000000',69,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(781,'1100700054','亭湖区','1100700000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(782,'1100700055','盐都区','1100700000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(783,'1100700056','响水县','1100700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(784,'1100700057','滨海县','1100700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(785,'1100700058','阜宁县','1100700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(786,'1100700059','射阳县','1100700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(787,'1100700060','建湖县','1100700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(788,'1100700061','东台市','1100700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(789,'1100700062','大丰市','1100700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(790,'1100800000','徐州市','1100000000',70,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(791,'1100800063','鼓楼区','1100800000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(792,'1100800064','云龙区','1100800000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(793,'1100800065','九里区','1100800000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(794,'1100800066','贾汪区','1100800000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(795,'1100800067','泉山区','1100800000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(796,'1100800068','丰县','1100800000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(797,'1100800069','沛县','1100800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(798,'1100800070','铜山县','1100800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(799,'1100800071','睢宁县','1100800000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(800,'1100800072','新沂市','1100800000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(801,'1100800073','邳州市','1100800000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(802,'1100900000','淮安市','1100000000',71,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(803,'1100900074','清河区','1100900000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(804,'1100900075','楚州区','1100900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(805,'1100900076','淮阴区','1100900000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(806,'1100900077','清浦区','1100900000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(807,'1100900078','涟水县','1100900000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(808,'1100900079','洪泽县','1100900000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(809,'1100900080','盱眙县','1100900000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(810,'1100900081','金湖县','1100900000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(811,'1101000000','连云港市','1100000000',72,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(812,'1101000082','连云区','1101000000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(813,'1101000083','新浦区','1101000000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(814,'1101000084','海州区','1101000000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(815,'1101000085','赣榆县','1101000000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(816,'1101000086','东海县','1101000000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(817,'1101000087','灌云县','1101000000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(818,'1101000088','灌南县','1101000000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(819,'1101100000','常州市','1100000000',73,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(820,'1101100089','天宁区','1101100000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(821,'1101100090','钟楼区','1101100000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(822,'1101100091','戚墅堰区','1101100000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(823,'1101100092','新北区','1101100000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(824,'1101100093','武进区','1101100000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(825,'1101100094','溧阳市','1101100000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(826,'1101100095','金坛市','1101100000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(827,'1101200000','泰州市','1100000000',74,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(828,'1101200096','海陵区','1101200000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(829,'1101200097','高港区','1101200000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(830,'1101200098','兴化市','1101200000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(831,'1101200099','靖江市','1101200000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(832,'1101200100','泰兴市','1101200000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(833,'1101200101','姜堰市','1101200000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(834,'1101300000','宿迁市','1100000000',75,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(835,'1101300102','宿城区','1101300000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(836,'1101300103','宿豫区','1101300000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(837,'1101300104','沭阳县','1101300000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(838,'1101300105','泗阳县','1101300000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(839,'1101300106','泗洪县','1101300000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(840,'1200000000','浙江省','',12,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(841,'1200100000','舟山市','1200000000',76,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(842,'1200100001','定海区','1200100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(843,'1200100002','普陀区','1200100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(844,'1200100003','岱山县','1200100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(845,'1200100004','嵊泗县','1200100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(846,'1200200000','衢州市','1200000000',77,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(847,'1200200005','柯城区','1200200000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(848,'1200200006','衢江区','1200200000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(849,'1200200007','常山县','1200200000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(850,'1200200008','开化县','1200200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(851,'1200200009','龙游县','1200200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(852,'1200200010','江山市','1200200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(853,'1200300000','杭州市','1200000000',78,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(854,'1200300011','上城区','1200300000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(855,'1200300012','下城区','1200300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(856,'1200300013','江干区','1200300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(857,'1200300014','拱墅区','1200300000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(858,'1200300015','西湖区','1200300000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(859,'1200300016','滨江区','1200300000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(860,'1200300017','余杭区','1200300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(861,'1200300018','桐庐县','1200300000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(862,'1200300019','淳安县','1200300000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(863,'1200300020','建德市','1200300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(864,'1200300021','富阳市','1200300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(865,'1200300022','临安市','1200300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(866,'1200300023','萧山区','1200300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(867,'1200400000','湖州市','1200000000',79,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(868,'1200400024','吴兴区','1200400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(869,'1200400025','南浔区','1200400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(870,'1200400026','德清县','1200400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(871,'1200400027','长兴县','1200400000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(872,'1200400028','安吉县','1200400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(873,'1200500000','嘉兴市','1200000000',80,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(874,'1200500029',' 南湖区','1200500000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(875,'1200500030',' 秀洲区','1200500000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(876,'1200500031',' 嘉善县','1200500000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(877,'1200500032',' 海盐县','1200500000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(878,'1200500033',' 海宁市','1200500000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(879,'1200500034',' 平湖市','1200500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(880,'1200500035',' 桐乡市 ','1200500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(881,'1200600000','宁波市','1200000000',81,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(882,'1200600036','海曙区','1200600000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(883,'1200600037','江东区','1200600000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(884,'1200600038','江北区','1200600000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(885,'1200600039','北仑区','1200600000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(886,'1200600040','镇海区','1200600000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(887,'1200600041','鄞州区','1200600000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(888,'1200600042','象山县','1200600000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(889,'1200600043','宁海县','1200600000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(890,'1200600044','余姚市','1200600000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(891,'1200600045','慈溪市','1200600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(892,'1200600046','奉化市','1200600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(893,'1200700000','绍兴市','1200000000',82,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(894,'1200700047','越城区','1200700000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(895,'1200700048','绍兴县','1200700000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(896,'1200700049','新昌县','1200700000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(897,'1200700050','诸暨市','1200700000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(898,'1200700051','上虞市','1200700000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(899,'1200700052','嵊州市','1200700000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(900,'1200800000','温州市','1200000000',83,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(901,'1200800053','鹿城区','1200800000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(902,'1200800054','龙湾区','1200800000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(903,'1200800055','瓯海区','1200800000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(904,'1200800056','洞头县','1200800000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(905,'1200800057','永嘉县','1200800000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(906,'1200800058','平阳县','1200800000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(907,'1200800059','苍南县','1200800000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(908,'1200800060','文成县','1200800000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(909,'1200800061','泰顺县','1200800000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(910,'1200800062','瑞安市','1200800000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(911,'1200800063','乐清市','1200800000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(912,'1200900000','丽水市','1200000000',84,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(913,'1200900064','莲都区','1200900000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(914,'1200900065','青田县','1200900000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(915,'1200900066','缙云县','1200900000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(916,'1200900067','遂昌县','1200900000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(917,'1200900068','松阳县','1200900000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(918,'1200900069','云和县','1200900000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(919,'1200900070','庆元县','1200900000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(920,'1200900071','景宁畲族自治县','1200900000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(921,'1200900072','龙泉市','1200900000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(922,'1201000000','金华市','1200000000',85,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(923,'1201000073','婺城区','1201000000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(924,'1201000074','金东区','1201000000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(925,'1201000075','武义县','1201000000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(926,'1201000076','浦江县','1201000000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(927,'1201000077','磐安县','1201000000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(928,'1201000078','兰溪市','1201000000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(929,'1201000079','义乌市','1201000000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(930,'1201000080','东阳市','1201000000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(931,'1201000081','永康市','1201000000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(932,'1201100000','台州市','1200000000',86,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(933,'1201100082','椒江区','1201100000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(934,'1201100083','黄岩区','1201100000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(935,'1201100084','路桥区','1201100000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(936,'1201100085','玉环县','1201100000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(937,'1201100086','三门县','1201100000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(938,'1201100087','天台县','1201100000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(939,'1201100088','仙居县','1201100000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(940,'1201100089','温岭市','1201100000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(941,'1201100090','临海市','1201100000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(942,'1300000000','安徽省','',13,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(943,'1300100000','合肥市','1300000000',87,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(944,'1300100001','瑶海区','1300100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(945,'1300100002','庐阳区','1300100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(946,'1300100003','蜀山区','1300100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(947,'1300100004','包河区','1300100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(948,'1300100005','长丰县','1300100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(949,'1300100006','肥东县','1300100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(950,'1300100007','肥西县','1300100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(951,'1300200000','芜湖市','1300000000',88,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(952,'1300200008','镜湖区','1300200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(953,'1300200009','弋江区','1300200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(954,'1300200010','鸠江区','1300200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(955,'1300200011','三山区','1300200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(956,'1300200012','芜湖县','1300200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(957,'1300200013','繁昌县','1300200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(958,'1300200014','南陵县','1300200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(959,'1300300000','蚌埠市','1300000000',89,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(960,'1300300015','龙子湖区','1300300000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(961,'1300300016','蚌山区','1300300000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(962,'1300300017','禹会区','1300300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(963,'1300300018','淮上区','1300300000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(964,'1300300019','怀远县','1300300000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(965,'1300300020','五河县','1300300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(966,'1300300021','固镇县','1300300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(967,'1300400000','淮南市','1300000000',90,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(968,'1300400022','大通区','1300400000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(969,'1300400023','田家庵区','1300400000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(970,'1300400024','谢家集区','1300400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(971,'1300400025','八公山区','1300400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(972,'1300400026','潘集区','1300400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(973,'1300400027','凤台县','1300400000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(974,'1300500000','马鞍山市','1300000000',91,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(975,'1300500028','金家庄区','1300500000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(976,'1300500029','花山区','1300500000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(977,'1300500030','雨山区','1300500000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(978,'1300500031','当涂县','1300500000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(979,'1300600000','淮北市','1300000000',92,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(980,'1300600032','杜集区','1300600000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(981,'1300600033','相山区','1300600000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(982,'1300600034','烈山区','1300600000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(983,'1300600035','濉溪县 ','1300600000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(984,'1300700000','铜陵市','1300000000',93,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(985,'1300700036','铜官山区','1300700000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(986,'1300700037','狮子山区','1300700000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(987,'1300700038','铜陵县','1300700000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(988,'1300800000','安庆市','1300000000',94,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(989,'1300800039','迎江区','1300800000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(990,'1300800040','大观区','1300800000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(991,'1300800041','宜秀区','1300800000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(992,'1300800042','怀宁县','1300800000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(993,'1300800043','枞阳县','1300800000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(994,'1300800044','潜山县','1300800000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(995,'1300800045','太湖县','1300800000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(996,'1300800046','宿松县','1300800000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(997,'1300800047','望江县','1300800000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(998,'1300800048','岳西县','1300800000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(999,'1300800049','桐城市','1300800000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1000,'1300900000','黄山市','1300000000',95,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1001,'1300900050','屯溪区','1300900000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1002,'1300900051','黄山区','1300900000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1003,'1300900052','徽州区','1300900000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1004,'1300900053','歙县','1300900000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1005,'1300900054','休宁县','1300900000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1006,'1300900055','黟县','1300900000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1007,'1300900056','祁门县','1300900000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1008,'1301000000','滁州市','1300000000',96,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1009,'1301000057','琅琊区','1301000000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1010,'1301000058','南谯区','1301000000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1011,'1301000059','来安县','1301000000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1012,'1301000060','全椒县','1301000000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1013,'1301000061','定远县','1301000000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1014,'1301000062','凤阳县','1301000000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1015,'1301000063','天长市','1301000000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1016,'1301000064','明光市','1301000000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1017,'1301100000','阜阳市','1300000000',97,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1018,'1301100065','颍州区','1301100000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1019,'1301100066','颍东区','1301100000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1020,'1301100067','颍泉区','1301100000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1021,'1301100068','临泉县','1301100000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1022,'1301100069','太和县','1301100000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1023,'1301100070','阜南县','1301100000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1024,'1301100071','颍上县','1301100000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1025,'1301100072','界首市','1301100000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1026,'1301200000','宿州市','1300000000',98,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1027,'1301200073','埇桥区','1301200000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1028,'1301200074','砀山县','1301200000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1029,'1301200075','萧县','1301200000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1030,'1301200076','灵璧县','1301200000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1031,'1301200077','泗县 ','1301200000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1032,'1301300000','巢湖市','1300000000',99,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1033,'1301300078','居巢区','1301300000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1034,'1301300079','庐江县','1301300000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1035,'1301300080','无为县','1301300000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1036,'1301300081','含山县','1301300000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1037,'1301300082','和县 ','1301300000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1038,'1301400000','六安市','1300000000',100,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1039,'1301400083','金安区','1301400000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1040,'1301400084','裕安区','1301400000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1041,'1301400085','寿县','1301400000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1042,'1301400086','霍邱县','1301400000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1043,'1301400087','舒城县','1301400000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1044,'1301400088','金寨县','1301400000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1045,'1301400089','霍山县','1301400000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1046,'1301500000','亳州市','1300000000',101,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1047,'1301500090','谯城区','1301500000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1048,'1301500091','涡阳县','1301500000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1049,'1301500092','蒙城县','1301500000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1050,'1301500093','利辛县','1301500000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1051,'1301600000','池州市','1300000000',102,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1052,'1301600094','贵池区','1301600000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1053,'1301600095','东至县','1301600000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1054,'1301600096','石台县','1301600000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1055,'1301600097','青阳县','1301600000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1056,'1301700000','宣城市','1300000000',103,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1057,'1301700098','宣州区','1301700000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1058,'1301700099','郎溪县','1301700000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1059,'1301700100','广德县','1301700000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1060,'1301700101','泾县','1301700000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1061,'1301700102','绩溪县','1301700000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1062,'1301700103','旌德县','1301700000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1063,'1301700104','宁国市','1301700000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1064,'1400000000','福建省','',14,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1065,'1400100000','福州市','1400000000',104,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1066,'1400100001','鼓楼区','1400100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1067,'1400100002','台江区','1400100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1068,'1400100003','仓山区','1400100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1069,'1400100004','马尾区','1400100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1070,'1400100005','晋安区','1400100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1071,'1400100006','闽侯县','1400100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1072,'1400100007','连江县','1400100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1073,'1400100008','罗源县','1400100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1074,'1400100009','闽清县','1400100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1075,'1400100010','永泰县','1400100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1076,'1400100011','平潭县','1400100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1077,'1400100012','福清市','1400100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1078,'1400100013','长乐市','1400100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1079,'1400200000','厦门市','1400000000',105,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1080,'1400200014','思明区','1400200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1081,'1400200015','海沧区','1400200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1082,'1400200016','湖里区','1400200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1083,'1400200017','集美区','1400200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1084,'1400200018','同安区','1400200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1085,'1400200019','翔安区','1400200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1086,'1400300000','宁德市','1400000000',106,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1087,'1400300020','蕉城区','1400300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1088,'1400300021','霞浦县','1400300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1089,'1400300022','古田县','1400300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1090,'1400300023','屏南县','1400300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1091,'1400300024','寿宁县','1400300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1092,'1400300025','周宁县','1400300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1093,'1400300026','柘荣县','1400300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1094,'1400300027','福安市','1400300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1095,'1400300028','福鼎市','1400300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1096,'1400400000','莆田市','1400000000',107,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1097,'1400400029','城厢区','1400400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1098,'1400400030','涵江区','1400400000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1099,'1400400031','荔城区','1400400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1100,'1400400032','秀屿区','1400400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1101,'1400400033','仙游县','1400400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1102,'1400500000','泉州市','1400000000',108,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1103,'1400500034','鲤城区','1400500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1104,'1400500035','丰泽区','1400500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1105,'1400500036','洛江区','1400500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1106,'1400500037','泉港区','1400500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1107,'1400500038','惠安县','1400500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1108,'1400500039','安溪县','1400500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1109,'1400500040','永春县','1400500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1110,'1400500041','德化县','1400500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1111,'1400500042','石狮市','1400500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1112,'1400500043','晋江市','1400500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1113,'1400500044','南安市','1400500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1114,'1400600000','漳州市','1400000000',109,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1115,'1400600045','芗城区','1400600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1116,'1400600046','龙文区','1400600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1117,'1400600047','云霄县','1400600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1118,'1400600048','漳浦县','1400600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1119,'1400600049','诏安县','1400600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1120,'1400600050','长泰县','1400600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1121,'1400600051','东山县','1400600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1122,'1400600052','南靖县','1400600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1123,'1400600053','平和县','1400600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1124,'1400600054','华安县','1400600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1125,'1400600055','龙海市','1400600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1126,'1400700000','龙岩市','1400000000',110,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1127,'1400700056','新罗区','1400700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1128,'1400700057','长汀县','1400700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1129,'1400700058','永定县','1400700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1130,'1400700059','上杭县','1400700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1131,'1400700060','武平县','1400700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1132,'1400700061','连城县','1400700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1133,'1400700062','漳平市','1400700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1134,'1400800000','三明市','1400000000',111,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1135,'1400800063','梅列区','1400800000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1136,'1400800064','三元区','1400800000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1137,'1400800065','明溪县','1400800000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1138,'1400800066','清流县','1400800000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1139,'1400800067','宁化县','1400800000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1140,'1400800068','大田县','1400800000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1141,'1400800069','尤溪县','1400800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1142,'1400800070','沙县','1400800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1143,'1400800071','将乐县','1400800000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1144,'1400800072','泰宁县','1400800000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1145,'1400800073','建宁县','1400800000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1146,'1400800074','永安市','1400800000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1147,'1400900000','南平市','1400000000',112,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1148,'1400900075','延平区','1400900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1149,'1400900076','顺昌县','1400900000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1150,'1400900077','浦城县','1400900000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1151,'1400900078','光泽县','1400900000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1152,'1400900079','松溪县','1400900000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1153,'1400900080','政和县','1400900000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1154,'1400900081','邵武市','1400900000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1155,'1400900082','武夷山市','1400900000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1156,'1400900083','建瓯市','1400900000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1157,'1400900084','建阳市','1400900000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1158,'1500000000','江西省','',15,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1159,'1500100000','鹰潭市','1500000000',113,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1160,'1500100001','月湖区','1500100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1161,'1500100002','余江县','1500100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1162,'1500100003','贵溪市','1500100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1163,'1500200000','新余市','1500000000',114,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1164,'1500200004','渝水区','1500200000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1165,'1500200005','分宜县','1500200000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1166,'1500300000','南昌市','1500000000',115,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1167,'1500300006','东湖区','1500300000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1168,'1500300007','西湖区','1500300000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1169,'1500300008','青云谱区','1500300000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1170,'1500300009','湾里区','1500300000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1171,'1500300010','青山湖区','1500300000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1172,'1500300011','南昌县','1500300000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1173,'1500300012','新建县','1500300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1174,'1500300013','安义县','1500300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1175,'1500300014','进贤县','1500300000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1176,'1500400000','九江市','1500000000',116,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1177,'1500400015','庐山区','1500400000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1178,'1500400016','浔阳区','1500400000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1179,'1500400017','九江县','1500400000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1180,'1500400018','武宁县','1500400000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1181,'1500400019','修水县','1500400000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1182,'1500400020','永修县','1500400000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1183,'1500400021','德安县','1500400000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1184,'1500400022','星子县','1500400000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1185,'1500400023','都昌县','1500400000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1186,'1500400024','湖口县','1500400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1187,'1500400025','彭泽县','1500400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1188,'1500400026','瑞昌市','1500400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1189,'1500500000','上饶市','1500000000',117,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1190,'1500500027','信州区','1500500000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1191,'1500500028','上饶县','1500500000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1192,'1500500029','广丰县','1500500000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1193,'1500500030','玉山县','1500500000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1194,'1500500031','铅山县','1500500000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1195,'1500500032','横峰县','1500500000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1196,'1500500033','弋阳县','1500500000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1197,'1500500034','余干县','1500500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1198,'1500500035','鄱阳县','1500500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1199,'1500500036','万年县','1500500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1200,'1500500037','婺源县','1500500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1201,'1500500038','德兴市','1500500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1202,'1500600000','抚州市','1500000000',118,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1203,'1500600039','临川区','1500600000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1204,'1500600040','南城县','1500600000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1205,'1500600041','黎川县','1500600000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1206,'1500600042','南丰县','1500600000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1207,'1500600043','崇仁县','1500600000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1208,'1500600044','乐安县','1500600000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1209,'1500600045','宜黄县','1500600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1210,'1500600046','金溪县','1500600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1211,'1500600047','资溪县','1500600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1212,'1500600048','东乡县','1500600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1213,'1500600049','广昌县','1500600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1214,'1500700000','宜春市','1500000000',119,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1215,'1500700050','袁州区','1500700000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1216,'1500700051','奉新县','1500700000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1217,'1500700052','万载县','1500700000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1218,'1500700053','上高县','1500700000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1219,'1500700054','宜丰县','1500700000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1220,'1500700055','靖安县','1500700000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1221,'1500700056','铜鼓县','1500700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1222,'1500700057','丰城市','1500700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1223,'1500700058','樟树市','1500700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1224,'1500700059','高安市','1500700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1225,'1500800000','吉安市','1500000000',120,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1226,'1500800060','吉州区','1500800000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1227,'1500800061','青原区','1500800000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1228,'1500800062','吉安县','1500800000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1229,'1500800063','吉水县','1500800000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1230,'1500800064','峡江县','1500800000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1231,'1500800065','新干县','1500800000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1232,'1500800066','永丰县','1500800000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1233,'1500800067','泰和县','1500800000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1234,'1500800068','遂川县','1500800000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1235,'1500800069','万安县','1500800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1236,'1500800070','安福县','1500800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1237,'1500800071','永新县','1500800000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1238,'1500800072','井冈山市','1500800000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1239,'1500900000','赣州市','1500000000',121,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1240,'1500900073','章贡区','1500900000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1241,'1500900074','赣县','1500900000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1242,'1500900075','信丰县','1500900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1243,'1500900076','大余县','1500900000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1244,'1500900077','上犹县','1500900000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1245,'1500900078','崇义县','1500900000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1246,'1500900079','安远县','1500900000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1247,'1500900080','龙南县','1500900000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1248,'1500900081','定南县','1500900000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1249,'1500900082','全南县','1500900000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1250,'1500900083','宁都县','1500900000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1251,'1500900084','于都县','1500900000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1252,'1500900085','兴国县','1500900000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1253,'1500900086','会昌县','1500900000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1254,'1500900087','寻乌县','1500900000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1255,'1500900088','石城县','1500900000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1256,'1500900089','瑞金市','1500900000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1257,'1500900090','南康市','1500900000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1258,'1501000000','景德镇市','1500000000',122,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1259,'1501000091','昌江区','1501000000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1260,'1501000092','珠山区','1501000000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1261,'1501000093','浮梁县','1501000000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1262,'1501000094','乐平市','1501000000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1263,'1501100000','萍乡市','1500000000',123,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1264,'1501100095','安源区','1501100000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1265,'1501100096','湘东区','1501100000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1266,'1501100097','莲花县','1501100000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1267,'1501100098','上栗县','1501100000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1268,'1501100099','芦溪县','1501100000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1269,'1600000000','山东省','',16,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1270,'1600100000','菏泽市','1600000000',124,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1271,'1600100001','牡丹区','1600100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1272,'1600100002','曹县','1600100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1273,'1600100003','单县','1600100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1274,'1600100004','成武县','1600100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1275,'1600100005','巨野县','1600100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1276,'1600100006','郓城县','1600100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1277,'1600100007','鄄城县','1600100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1278,'1600100008','定陶县','1600100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1279,'1600100009','东明县','1600100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1280,'1600200000','济南市','1600000000',125,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1281,'1600200010','历下区','1600200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1282,'1600200011','市中区','1600200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1283,'1600200012','槐荫区','1600200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1284,'1600200013','天桥区','1600200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1285,'1600200014','历城区','1600200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1286,'1600200015','长清区','1600200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1287,'1600200016','平阴县','1600200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1288,'1600200017','济阳县','1600200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1289,'1600200018','商河县','1600200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1290,'1600200019','章丘市','1600200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1291,'1600300000','青岛市','1600000000',126,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1292,'1600300020','市南区','1600300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1293,'1600300021','市北区','1600300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1294,'1600300022','四方区','1600300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1295,'1600300023','黄岛区','1600300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1296,'1600300024','崂山区','1600300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1297,'1600300025','李沧区','1600300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1298,'1600300026','城阳区','1600300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1299,'1600300027','胶州市','1600300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1300,'1600300028','即墨市','1600300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1301,'1600300029','平度市','1600300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1302,'1600300030','胶南市','1600300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1303,'1600300031','莱西市','1600300000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1304,'1600400000','淄博市','1600000000',127,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1305,'1600400032','淄川区','1600400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1306,'1600400033','张店区','1600400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1307,'1600400034','博山区','1600400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1308,'1600400035','临淄区','1600400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1309,'1600400036','周村区','1600400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1310,'1600400037','桓台县','1600400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1311,'1600400038','高青县','1600400000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1312,'1600400039','沂源县','1600400000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1313,'1600500000','德州市','1600000000',128,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1314,'1600500040','德城区','1600500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1315,'1600500041','陵县','1600500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1316,'1600500042','宁津县','1600500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1317,'1600500043','庆云县','1600500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1318,'1600500044','临邑县','1600500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1319,'1600500045','齐河县','1600500000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1320,'1600500046','平原县','1600500000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1321,'1600500047','夏津县','1600500000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1322,'1600500048','武城县','1600500000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1323,'1600500049','乐陵市','1600500000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1324,'1600500050','禹城市','1600500000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1325,'1600600000','烟台市','1600000000',129,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1326,'1600600051','芝罘区','1600600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1327,'1600600052','福山区','1600600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1328,'1600600053','牟平区','1600600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1329,'1600600054','莱山区','1600600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1330,'1600600055','长岛县','1600600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1331,'1600600056','龙口市','1600600000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1332,'1600600057','莱阳市','1600600000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1333,'1600600058','莱州市','1600600000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1334,'1600600059','蓬莱市','1600600000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1335,'1600600060','招远市','1600600000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1336,'1600600061','栖霞市','1600600000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1337,'1600600062','海阳市','1600600000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1338,'1600700000','潍坊市','1600000000',130,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1339,'1600700063','潍城区','1600700000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1340,'1600700064','寒亭区','1600700000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1341,'1600700065','坊子区','1600700000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1342,'1600700066','奎文区','1600700000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1343,'1600700067','临朐县','1600700000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1344,'1600700068','昌乐县','1600700000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1345,'1600700069','青州市','1600700000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1346,'1600700070','诸城市','1600700000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1347,'1600700071','寿光市','1600700000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1348,'1600700072','安丘市','1600700000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1349,'1600700073','高密市','1600700000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1350,'1600700074','昌邑市','1600700000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1351,'1600800000','济宁市','1600000000',131,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1352,'1600800075','市中区','1600800000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1353,'1600800076','任城区','1600800000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1354,'1600800077','微山县','1600800000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1355,'1600800078','鱼台县','1600800000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1356,'1600800079','金乡县','1600800000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1357,'1600800080','嘉祥县','1600800000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1358,'1600800081','汶上县','1600800000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1359,'1600800082','泗水县','1600800000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1360,'1600800083','梁山县','1600800000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1361,'1600800084','曲阜市','1600800000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1362,'1600800085','兖州市','1600800000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1363,'1600800086','邹城市','1600800000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1364,'1600900000','泰安市','1600000000',132,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1365,'1600900087','泰山区','1600900000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1366,'1600900088','岱岳区','1600900000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1367,'1600900089','宁阳县','1600900000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1368,'1600900090','东平县','1600900000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1369,'1600900091','新泰市','1600900000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1370,'1600900092','肥城市','1600900000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1371,'1601000000','临沂市','1600000000',133,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1372,'1601000093','兰山区','1601000000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1373,'1601000094','罗庄区','1601000000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1374,'1601000095','河东区','1601000000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1375,'1601000096','沂南县','1601000000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1376,'1601000097','郯城县','1601000000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1377,'1601000098','沂水县','1601000000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1378,'1601000099','苍山县','1601000000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1379,'1601000100','费县','1601000000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1380,'1601000101','平邑县','1601000000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1381,'1601000102','莒南县','1601000000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1382,'1601000103','蒙阴县','1601000000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1383,'1601000104','临沭县','1601000000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1384,'1601100000','滨州市','1600000000',134,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1385,'1601100105','滨城区','1601100000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1386,'1601100106','惠民县','1601100000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1387,'1601100107','阳信县','1601100000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1388,'1601100108','无棣县','1601100000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1389,'1601100109','沾化县','1601100000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1390,'1601100110','博兴县','1601100000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1391,'1601100111','邹平县','1601100000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1392,'1601200000','东营市','1600000000',135,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1393,'1601200112','东营区','1601200000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1394,'1601200113','河口区','1601200000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1395,'1601200114','垦利县','1601200000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1396,'1601200115','利津县','1601200000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1397,'1601200116','广饶县','1601200000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1398,'1601300000','威海市','1600000000',136,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1399,'1601300117','环翠区','1601300000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1400,'1601300118','文登市','1601300000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1401,'1601300119','荣成市','1601300000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1402,'1601300120','乳山市','1601300000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1403,'1601400000','枣庄市','1600000000',137,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1404,'1601400121','市中区','1601400000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1405,'1601400122','薛城区','1601400000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1406,'1601400123','峄城区','1601400000',123,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1407,'1601400124','台儿庄区','1601400000',124,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1408,'1601400125','山亭区','1601400000',125,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1409,'1601400126','滕州市','1601400000',126,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1410,'1601500000','日照市','1600000000',138,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1411,'1601500127','东港区','1601500000',127,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1412,'1601500128','岚山区','1601500000',128,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1413,'1601500129','五莲县','1601500000',129,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1414,'1601500130','莒县','1601500000',130,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1415,'1601600000','莱芜市','1600000000',139,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1416,'1601600131','莱城区','1601600000',131,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1417,'1601600132','钢城区','1601600000',132,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1418,'1601700000','聊城市','1600000000',140,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1419,'1601700133','东昌府区','1601700000',133,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1420,'1601700134','阳谷县','1601700000',134,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1421,'1601700135','莘县','1601700000',135,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1422,'1601700136','茌平县','1601700000',136,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1423,'1601700137','东阿县','1601700000',137,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1424,'1601700138','冠县','1601700000',138,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1425,'1601700139','高唐县','1601700000',139,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1426,'1601700140','临清市','1601700000',140,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1427,'1700000000','河南省','',17,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1428,'1700100000','商丘市','1700000000',141,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1429,'1700100001','梁园区','1700100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1430,'1700100002','睢阳区','1700100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1431,'1700100003','民权县','1700100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1432,'1700100004','睢县','1700100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1433,'1700100005','宁陵县','1700100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1434,'1700100006','柘城县','1700100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1435,'1700100007','虞城县','1700100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1436,'1700100008','夏邑县','1700100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1437,'1700100009','永城市','1700100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1438,'1700200000','郑州市','1700000000',142,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1439,'1700200010','中原区','1700200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1440,'1700200011','二七区','1700200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1441,'1700200012','管城回族区','1700200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1442,'1700200013','金水区','1700200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1443,'1700200014','上街区','1700200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1444,'1700200015','惠济区','1700200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1445,'1700200016','中牟县','1700200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1446,'1700200017','巩义市','1700200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1447,'1700200018','荥阳市','1700200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1448,'1700200019','新密市','1700200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1449,'1700200020','新郑市','1700200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1450,'1700200021','登封市','1700200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1451,'1700300000','安阳市','1700000000',143,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1452,'1700300022','文峰区','1700300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1453,'1700300023','北关区','1700300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1454,'1700300024','殷都区','1700300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1455,'1700300025','龙安区','1700300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1456,'1700300026','安阳县','1700300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1457,'1700300027','汤阴县','1700300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1458,'1700300028','滑县','1700300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1459,'1700300029','内黄县','1700300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1460,'1700300030','林州市','1700300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1461,'1700400000','新乡市','1700000000',144,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1462,'1700400031','红旗区','1700400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1463,'1700400032','卫滨区','1700400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1464,'1700400033','凤泉区','1700400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1465,'1700400034','牧野区','1700400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1466,'1700400035','新乡县','1700400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1467,'1700400036','获嘉县','1700400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1468,'1700400037','原阳县','1700400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1469,'1700400038','延津县','1700400000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1470,'1700400039','封丘县','1700400000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1471,'1700400040','长垣县','1700400000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1472,'1700400041','卫辉市','1700400000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1473,'1700400042','辉县市','1700400000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1474,'1700500000','许昌市','1700000000',145,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1475,'1700500043','魏都区','1700500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1476,'1700500044','许昌县','1700500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1477,'1700500045','鄢陵县','1700500000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1478,'1700500046','襄城县','1700500000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1479,'1700500047','禹州市','1700500000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1480,'1700500048','长葛市','1700500000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1481,'1700600000','平顶山市','1700000000',146,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1482,'1700600049','新华区','1700600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1483,'1700600050','卫东区','1700600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1484,'1700600051','石龙区','1700600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1485,'1700600052','湛河区','1700600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1486,'1700600053','宝丰县','1700600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1487,'1700600054','叶县','1700600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1488,'1700600055','鲁山县','1700600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1489,'1700600056','郏县','1700600000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1490,'1700600057','舞钢市','1700600000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1491,'1700600058','汝州市','1700600000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1492,'1700700000','信阳市','1700000000',147,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1493,'1700700059','浉河区','1700700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1494,'1700700060','平桥区','1700700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1495,'1700700061','罗山县','1700700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1496,'1700700062','光山县','1700700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1497,'1700700063','新县','1700700000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1498,'1700700064','商城县','1700700000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1499,'1700700065','固始县','1700700000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1500,'1700700066','潢川县','1700700000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1501,'1700700067','淮滨县','1700700000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1502,'1700700068','息县','1700700000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1503,'1700800000','南阳市','1700000000',148,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1504,'1700800069','宛城区','1700800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1505,'1700800070','卧龙区','1700800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1506,'1700800071','南召县','1700800000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1507,'1700800072','方城县','1700800000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1508,'1700800073','西峡县','1700800000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1509,'1700800074','镇平县','1700800000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1510,'1700800075','内乡县','1700800000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1511,'1700800076','淅川县','1700800000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1512,'1700800077','社旗县','1700800000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1513,'1700800078','唐河县','1700800000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1514,'1700800079','新野县','1700800000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1515,'1700800080','桐柏县','1700800000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1516,'1700800081','邓州市','1700800000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1517,'1700900000','开封市','1700000000',149,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1518,'1700900082','龙亭区','1700900000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1519,'1700900083','顺河回族区','1700900000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1520,'1700900084','鼓楼区','1700900000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1521,'1700900085','禹王台区','1700900000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1522,'1700900086','金明区','1700900000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1523,'1700900087','杞县','1700900000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1524,'1700900088','通许县','1700900000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1525,'1700900089','尉氏县','1700900000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1526,'1700900090','开封县','1700900000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1527,'1700900091','兰考县','1700900000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1528,'1701000000','洛阳市','1700000000',150,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1529,'1701000092','老城区','1701000000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1530,'1701000093','西工区','1701000000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1531,'1701000094','瀍河回族区','1701000000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1532,'1701000095','涧西区','1701000000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1533,'1701000096','吉利区','1701000000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1534,'1701000097','洛龙区','1701000000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1535,'1701000098','孟津县','1701000000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1536,'1701000099','新安县','1701000000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1537,'1701000100','栾川县','1701000000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1538,'1701000101','嵩县','1701000000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1539,'1701000102','汝阳县','1701000000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1540,'1701000103','宜阳县','1701000000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1541,'1701000104','洛宁县','1701000000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1542,'1701000105','伊川县','1701000000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1543,'1701000106','偃师市','1701000000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1544,'1701100000','济源市','1700000000',151,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1545,'1701200000','焦作市','1700000000',152,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1546,'1701200107','解放区','1701200000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1547,'1701200108','中站区','1701200000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1548,'1701200109','马村区','1701200000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1549,'1701200110','山阳区','1701200000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1550,'1701200111','修武县','1701200000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1551,'1701200112','博爱县','1701200000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1552,'1701200113','武陟县','1701200000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1553,'1701200114','温县','1701200000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1554,'1701200115','沁阳市','1701200000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1555,'1701200116','孟州市','1701200000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1556,'1701300000','鹤壁市','1700000000',153,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1557,'1701300117','鹤山区','1701300000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1558,'1701300118','山城区','1701300000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1559,'1701300119','淇滨区','1701300000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1560,'1701300120','浚县','1701300000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1561,'1701300121','淇县','1701300000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1562,'1701400000','濮阳市','1700000000',154,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1563,'1701400122','华龙区','1701400000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1564,'1701400123','清丰县','1701400000',123,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1565,'1701400124','南乐县','1701400000',124,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1566,'1701400125','范县','1701400000',125,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1567,'1701400126','台前县','1701400000',126,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1568,'1701400127','濮阳县','1701400000',127,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1569,'1701500000','周口市','1700000000',155,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1570,'1701500128','川汇区','1701500000',128,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1571,'1701500129','扶沟县','1701500000',129,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1572,'1701500130','西华县','1701500000',130,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1573,'1701500131','商水县','1701500000',131,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1574,'1701500132','沈丘县','1701500000',132,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1575,'1701500133','郸城县','1701500000',133,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1576,'1701500134','淮阳县','1701500000',134,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1577,'1701500135','太康县','1701500000',135,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1578,'1701500136','鹿邑县','1701500000',136,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1579,'1701500137','项城市','1701500000',137,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1580,'1701600000','漯河市','1700000000',156,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1581,'1701600138','源汇区','1701600000',138,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1582,'1701600139','郾城区','1701600000',139,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1583,'1701600140','召陵区','1701600000',140,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1584,'1701600141','舞阳县','1701600000',141,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1585,'1701600142','临颍县','1701600000',142,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1586,'1701700000','驻马店市','1700000000',157,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1587,'1701700143','驿城区','1701700000',143,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1588,'1701700144','西平县','1701700000',144,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1589,'1701700145','上蔡县','1701700000',145,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1590,'1701700146','平舆县','1701700000',146,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1591,'1701700147','正阳县','1701700000',147,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1592,'1701700148','确山县','1701700000',148,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1593,'1701700149','泌阳县','1701700000',149,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1594,'1701700150','汝南县','1701700000',150,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1595,'1701700151','遂平县','1701700000',151,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1596,'1701700152','新蔡县','1701700000',152,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1597,'1701800000','三门峡市','1700000000',158,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1598,'1701800153','湖滨区','1701800000',153,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1599,'1701800154','渑池县','1701800000',154,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1600,'1701800155','陕县','1701800000',155,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1601,'1701800156','卢氏县','1701800000',156,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1602,'1701800157','义马市','1701800000',157,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1603,'1701800158','灵宝市','1701800000',158,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1604,'1800000000','湖北省','',18,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1605,'1800100000','武汉市','1800000000',159,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1606,'1800100001','江岸区','1800100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1607,'1800100002','江汉区','1800100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1608,'1800100003','硚口区','1800100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1609,'1800100004','汉阳区','1800100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1610,'1800100005','武昌区','1800100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1611,'1800100006','青山区','1800100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1612,'1800100007','洪山区','1800100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1613,'1800100008','东西湖区','1800100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1614,'1800100009','汉南区','1800100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1615,'1800100010','蔡甸区','1800100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1616,'1800100011','江夏区','1800100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1617,'1800100012','黄陂区','1800100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1618,'1800100013','新洲区','1800100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1619,'1800200000','襄樊市','1800000000',160,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1620,'1800200014','襄城区','1800200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1621,'1800200015','樊城区','1800200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1622,'1800200016','襄阳区','1800200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1623,'1800200017','南漳县','1800200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1624,'1800200018','谷城县','1800200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1625,'1800200019','保康县','1800200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1626,'1800200020','老河口市','1800200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1627,'1800200021','枣阳市','1800200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1628,'1800200022','宜城市','1800200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1629,'1800300000','鄂州市','1800000000',161,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1630,'1800300023','梁子湖区','1800300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1631,'1800300024','华容区','1800300000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1632,'1800300025','鄂城区','1800300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1633,'1800400000','孝感市','1800000000',162,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1634,'1800400026','孝南区','1800400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1635,'1800400027','孝昌县','1800400000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1636,'1800400028','大悟县','1800400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1637,'1800400029','云梦县','1800400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1638,'1800400030','应城市','1800400000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1639,'1800400031','安陆市','1800400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1640,'1800400032','汉川市','1800400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1641,'1800500000','黄冈市','1800000000',163,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1642,'1800500033','黄州区','1800500000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1643,'1800500034','团风县','1800500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1644,'1800500035','红安县','1800500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1645,'1800500036','罗田县','1800500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1646,'1800500037','英山县','1800500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1647,'1800500038','浠水县','1800500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1648,'1800500039','蕲春县','1800500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1649,'1800500040','黄梅县','1800500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1650,'1800500041','麻城市','1800500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1651,'1800500042','武穴市','1800500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1652,'1800600000','黄石市','1800000000',164,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1653,'1800600043','黄石港区','1800600000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1654,'1800600044','西塞山区','1800600000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1655,'1800600045','下陆区','1800600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1656,'1800600046','铁山区','1800600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1657,'1800600047','阳新县','1800600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1658,'1800600048','大冶市','1800600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1659,'1800700000','咸宁市','1800000000',165,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1660,'1800700049','咸安区','1800700000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1661,'1800700050','嘉鱼县','1800700000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1662,'1800700051','通城县','1800700000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1663,'1800700052','崇阳县','1800700000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1664,'1800700053','通山县','1800700000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1665,'1800700054','赤壁市','1800700000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1666,'1800800000','荆州市','1800000000',166,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1667,'1800800055','沙市区','1800800000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1668,'1800800056','荆州区','1800800000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1669,'1800800057','公安县','1800800000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1670,'1800800058','监利县','1800800000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1671,'1800800059','江陵县','1800800000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1672,'1800800060','石首市','1800800000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1673,'1800800061','洪湖市','1800800000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1674,'1800800062','松滋市','1800800000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1675,'1800900000','宜昌市','1800000000',167,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1676,'1800900063','西陵区','1800900000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1677,'1800900064','伍家岗区','1800900000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1678,'1800900065','点军区','1800900000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1679,'1800900066','猇亭区','1800900000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1680,'1800900067','夷陵区','1800900000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1681,'1800900068','远安县','1800900000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1682,'1800900069','兴山县','1800900000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1683,'1800900070','秭归县','1800900000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1684,'1800900071','长阳土家族自治县','1800900000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1685,'1800900072','五峰土家族自治县','1800900000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1686,'1800900073','宜都市','1800900000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1687,'1800900074','当阳市','1800900000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1688,'1800900075','枝江市','1800900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1689,'1801000000','恩施土家族苗族自治州','1800000000',168,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1690,'1801000076','恩施市','1801000000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1691,'1801000077','利川市','1801000000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1692,'1801000078','建始县','1801000000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1693,'1801000079','巴东县','1801000000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1694,'1801000080','宣恩县','1801000000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1695,'1801000081','咸丰县','1801000000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1696,'1801000082','来凤县','1801000000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1697,'1801000083','鹤峰县','1801000000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1698,'1801100000','神农架林区','1800000000',169,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1699,'1801200000','十堰市','1800000000',170,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1700,'1801200084','茅箭区','1801200000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1701,'1801200085','张湾区','1801200000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1702,'1801200086','郧县','1801200000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1703,'1801200087','郧西县','1801200000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1704,'1801200088','竹山县','1801200000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1705,'1801200089','竹溪县','1801200000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1706,'1801200090','房县','1801200000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1707,'1801200091','丹江口市','1801200000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1708,'1801300000','随州市','1800000000',171,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1709,'1801300092','曾都区','1801300000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1710,'1801300093','广水市','1801300000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1711,'1801400000','荆门市','1800000000',172,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1712,'1801400094','东宝区','1801400000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1713,'1801400095','掇刀区','1801400000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1714,'1801400096','京山县','1801400000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1715,'1801400097','沙洋县','1801400000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1716,'1801400098','钟祥市','1801400000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1717,'1801500000','仙桃市','1800000000',173,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1718,'1801600000','天门市','1800000000',174,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1719,'1801700000','潜江市','1800000000',175,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1720,'1900000000','湖南省','',19,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1721,'1900100000','岳阳市','1900000000',176,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1722,'1900100001','岳阳楼区','1900100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1723,'1900100002','云溪区','1900100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1724,'1900100003','君山区','1900100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1725,'1900100004','岳阳县','1900100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1726,'1900100005','华容县','1900100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1727,'1900100006','湘阴县','1900100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1728,'1900100007','平江县','1900100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1729,'1900100008','汨罗市','1900100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1730,'1900100009','临湘市','1900100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1731,'1900200000','长沙市','1900000000',177,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1732,'1900200010','芙蓉区','1900200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1733,'1900200011','天心区','1900200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1734,'1900200012','岳麓区','1900200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1735,'1900200013','开福区','1900200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1736,'1900200014','雨花区','1900200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1737,'1900200015','长沙县','1900200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1738,'1900200016','望城县','1900200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1739,'1900200017','宁乡县','1900200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1740,'1900200018','浏阳市','1900200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1741,'1900300000','湘潭市','1900000000',178,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1742,'1900300019','雨湖区','1900300000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1743,'1900300020','岳塘区','1900300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1744,'1900300021','湘潭县','1900300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1745,'1900300022','湘乡市','1900300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1746,'1900300023','韶山市','1900300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1747,'1900400000','株洲市','1900000000',179,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1748,'1900400024','荷塘区','1900400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1749,'1900400025','芦淞区','1900400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1750,'1900400026','石峰区','1900400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1751,'1900400027','天元区','1900400000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1752,'1900400028','株洲县','1900400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1753,'1900400029','攸县','1900400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1754,'1900400030','茶陵县','1900400000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1755,'1900400031','炎陵县','1900400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1756,'1900400032','醴陵市','1900400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1757,'1900500000','衡阳市','1900000000',180,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1758,'1900500033','珠晖区','1900500000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1759,'1900500034','雁峰区','1900500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1760,'1900500035','石鼓区','1900500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1761,'1900500036','蒸湘区','1900500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1762,'1900500037','南岳区','1900500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1763,'1900500038','衡阳县','1900500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1764,'1900500039','衡南县','1900500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1765,'1900500040','衡山县','1900500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1766,'1900500041','衡东县','1900500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1767,'1900500042','祁东县','1900500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1768,'1900500043','耒阳市','1900500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1769,'1900500044','常宁市','1900500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1770,'1900600000','郴州市','1900000000',181,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1771,'1900600045','北湖区','1900600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1772,'1900600046','苏仙区','1900600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1773,'1900600047','桂阳县','1900600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1774,'1900600048','宜章县','1900600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1775,'1900600049','永兴县','1900600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1776,'1900600050','嘉禾县','1900600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1777,'1900600051','临武县','1900600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1778,'1900600052','汝城县','1900600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1779,'1900600053','桂东县','1900600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1780,'1900600054','安仁县','1900600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1781,'1900600055','资兴市','1900600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1782,'1900700000','常德市','1900000000',182,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1783,'1900700056','武陵区','1900700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1784,'1900700057','鼎城区','1900700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1785,'1900700058','安乡县','1900700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1786,'1900700059','汉寿县','1900700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1787,'1900700060','澧县','1900700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1788,'1900700061','临澧县','1900700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1789,'1900700062','桃源县','1900700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1790,'1900700063','石门县','1900700000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1791,'1900700064','津市市','1900700000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1792,'1900800000','益阳市','1900000000',183,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1793,'1900800065','资阳区','1900800000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1794,'1900800066','赫山区','1900800000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1795,'1900800067','南县','1900800000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1796,'1900800068','桃江县','1900800000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1797,'1900800069','安化县','1900800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1798,'1900800070','沅江市','1900800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1799,'1900900000','娄底市','1900000000',184,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1800,'1900900071','娄星区','1900900000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1801,'1900900072','双峰县','1900900000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1802,'1900900073','新化县','1900900000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1803,'1900900074','冷水江市','1900900000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1804,'1900900075','涟源市','1900900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1805,'1901000000','邵阳市','1900000000',185,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1806,'1901000076','双清区','1901000000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1807,'1901000077','大祥区','1901000000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1808,'1901000078','北塔区','1901000000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1809,'1901000079','邵东县','1901000000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1810,'1901000080','新邵县','1901000000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1811,'1901000081','邵阳县','1901000000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1812,'1901000082','隆回县','1901000000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1813,'1901000083','洞口县','1901000000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1814,'1901000084','绥宁县','1901000000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1815,'1901000085','新宁县','1901000000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1816,'1901000086','城步苗族自治县','1901000000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1817,'1901000087','武冈市','1901000000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1818,'1901100000','湘西土家族苗族自治州','1900000000',186,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1819,'1901100088','吉首市','1901100000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1820,'1901100089','泸溪县','1901100000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1821,'1901100090','凤凰县','1901100000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1822,'1901100091','花垣县','1901100000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1823,'1901100092','保靖县','1901100000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1824,'1901100093','古丈县','1901100000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1825,'1901100094','永顺县','1901100000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1826,'1901100095','龙山县','1901100000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1827,'1901200000','张家界市','1900000000',187,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1828,'1901200096','永定区','1901200000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1829,'1901200097','武陵源区','1901200000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1830,'1901200098','慈利县','1901200000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1831,'1901200099','桑植县','1901200000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1832,'1901300000','怀化市','1900000000',188,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1833,'1901300100','鹤城区','1901300000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1834,'1901300101','中方县','1901300000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1835,'1901300102','沅陵县','1901300000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1836,'1901300103','辰溪县','1901300000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1837,'1901300104','溆浦县','1901300000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1838,'1901300105','会同县','1901300000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1839,'1901300106','麻阳苗族自治县','1901300000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1840,'1901300107','新晃侗族自治县','1901300000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1841,'1901300108','芷江侗族自治县','1901300000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1842,'1901300109','靖州苗族侗族自治县','1901300000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1843,'1901300110','通道侗族自治县','1901300000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1844,'1901300111','洪江市','1901300000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1845,'1901400000','永州市','1900000000',189,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1846,'1901400112','零陵区','1901400000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1847,'1901400113','冷水滩区','1901400000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1848,'1901400114','祁阳县','1901400000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1849,'1901400115','东安县','1901400000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1850,'1901400116','双牌县','1901400000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1851,'1901400117','道县','1901400000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1852,'1901400118','江永县','1901400000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1853,'1901400119','宁远县','1901400000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1854,'1901400120','蓝山县','1901400000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1855,'1901400121','新田县','1901400000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1856,'1901400122','江华瑶族自治县','1901400000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1857,'2000000000','广东省','',20,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1858,'2000100000','广州市','2000000000',190,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1859,'2000100001','从化市','2000100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1860,'2000100002','荔湾区','2000100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1861,'2000100003','越秀区','2000100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1862,'2000100004','海珠区','2000100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1863,'2000100005','天河区','2000100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1864,'2000100006','白云区','2000100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1865,'2000100007','花都区','2000100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1866,'2000100008','黄埔区','2000100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1867,'2000100009','萝岗区','2000100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1868,'2000100010','南沙区','2000100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1869,'2000100011','番禺区','2000100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1870,'2000100012','增城市','2000100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1871,'2000200000','汕尾市','2000000000',191,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1872,'2000200013','海丰县','2000200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1873,'2000200014','陆河县','2000200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1874,'2000200015','陆丰市','2000200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1875,'2000300000','阳江市','2000000000',192,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1876,'2000300016','江城区','2000300000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1877,'2000300017','阳西县','2000300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1878,'2000300018','阳东县','2000300000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1879,'2000300019','阳春市','2000300000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1880,'2000400000','揭阳市','2000000000',193,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1881,'2000400020','榕城区','2000400000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1882,'2000400021','揭东县','2000400000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1883,'2000400022','揭西县','2000400000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1884,'2000400023','惠来县','2000400000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1885,'2000400024','普宁市','2000400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1886,'2000500000','茂名市','2000000000',194,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1887,'2000500025','茂南区','2000500000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1888,'2000500026','茂港区','2000500000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1889,'2000500027','电白县','2000500000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1890,'2000500028','高州市','2000500000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1891,'2000500029','化州市','2000500000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1892,'2000500030','信宜市','2000500000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1893,'2000600000','惠州市','2000000000',195,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1894,'2000600031','惠城区','2000600000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1895,'2000600032','惠阳区','2000600000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1896,'2000600033','博罗县','2000600000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1897,'2000600034','惠东县','2000600000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1898,'2000600035','龙门县','2000600000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1899,'2000700000','江门市','2000000000',196,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1900,'2000700036','蓬江区','2000700000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1901,'2000700037','江海区','2000700000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1902,'2000700038','新会区','2000700000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1903,'2000700039','台山市','2000700000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1904,'2000700040','开平市','2000700000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1905,'2000700041','鹤山市','2000700000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1906,'2000700042','恩平市','2000700000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1907,'2000800000','韶关市','2000000000',197,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1908,'2000800043','武江区','2000800000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1909,'2000800044','浈江区','2000800000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1910,'2000800045','曲江区','2000800000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1911,'2000800046','始兴县','2000800000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1912,'2000800047','仁化县','2000800000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1913,'2000800048','翁源县','2000800000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1914,'2000800049','乳源瑶族自治县','2000800000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1915,'2000800050','新丰县','2000800000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1916,'2000800051','乐昌市','2000800000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1917,'2000800052','南雄市','2000800000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1918,'2000900000','梅州市','2000000000',198,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1919,'2000900053','梅江区','2000900000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1920,'2000900054','梅县','2000900000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1921,'2000900055','大埔县','2000900000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1922,'2000900056','丰顺县','2000900000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1923,'2000900057','五华县','2000900000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1924,'2000900058','平远县','2000900000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1925,'2000900059','蕉岭县','2000900000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1926,'2000900060','兴宁市','2000900000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1927,'2001000000','汕头市','2000000000',199,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1928,'2001000061','龙湖区','2001000000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1929,'2001000062','金平区','2001000000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1930,'2001000063','濠江区','2001000000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1931,'2001000064','潮阳区','2001000000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1932,'2001000065','潮南区','2001000000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1933,'2001000066','澄海区','2001000000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1934,'2001000067','南澳县','2001000000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1935,'2001100000','深圳市','2000000000',200,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1936,'2001100068','罗湖区','2001100000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1937,'2001100069','福田区','2001100000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1938,'2001100070','南山区','2001100000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1939,'2001100071','宝安区','2001100000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1940,'2001100072','龙岗区','2001100000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1941,'2001100073','盐田区','2001100000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1942,'2001200000','珠海市','2000000000',201,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1943,'2001200074','香洲区','2001200000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1944,'2001200075','斗门区','2001200000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1945,'2001200076','金湾区','2001200000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1946,'2001300000','佛山市','2000000000',202,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1947,'2001300077','禅城区','2001300000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1948,'2001300078','南海区','2001300000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1949,'2001300079','顺德区','2001300000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1950,'2001300080','三水区','2001300000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1951,'2001300081','高明区','2001300000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1952,'2001400000','肇庆市','2000000000',203,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1953,'2001400082','端州区','2001400000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1954,'2001400083','鼎湖区','2001400000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1955,'2001400084','广宁县','2001400000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1956,'2001400085','怀集县','2001400000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1957,'2001400086','封开县','2001400000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1958,'2001400087','德庆县','2001400000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1959,'2001400088','高要市','2001400000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1960,'2001400089','四会市','2001400000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1961,'2001500000','湛江市','2000000000',204,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1962,'2001500090','赤坎区','2001500000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1963,'2001500091','霞山区','2001500000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1964,'2001500092','坡头区','2001500000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1965,'2001500093','麻章区','2001500000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1966,'2001500094','遂溪县','2001500000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1967,'2001500095','徐闻县','2001500000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1968,'2001500096','廉江市','2001500000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1969,'2001500097','雷州市','2001500000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1970,'2001500098','吴川市','2001500000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1971,'2001600000','中山市','2000000000',205,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1972,'2001700000','河源市','2000000000',206,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1973,'2001700099','源城区','2001700000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1974,'2001700100','紫金县','2001700000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1975,'2001700101','龙川县','2001700000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1976,'2001700102','连平县','2001700000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1977,'2001700103','和平县','2001700000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1978,'2001700104','东源县','2001700000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1979,'2001800000','清远市','2000000000',207,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1980,'2001800105','清城区','2001800000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1981,'2001800106','佛冈县','2001800000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1982,'2001800107','阳山县','2001800000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1983,'2001800108','连山壮族瑶族自治县','2001800000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1984,'2001800109','连南瑶族自治县','2001800000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1985,'2001800110','清新县','2001800000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1986,'2001800111','英德市','2001800000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1987,'2001800112','连州市','2001800000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1988,'2001900000','云浮市','2000000000',208,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1989,'2001900113','云城区','2001900000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1990,'2001900114','新兴县','2001900000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1991,'2001900115','郁南县','2001900000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1992,'2001900116','云安县','2001900000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1993,'2001900117','罗定市','2001900000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1994,'2002000000','潮州市','2000000000',209,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1995,'2002000118','湘桥区','2002000000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1996,'2002000119','潮安县','2002000000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1997,'2002000120','饶平县','2002000000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1998,'2002100000','东莞市','2000000000',210,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(1999,'2100000000','甘肃省','',21,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2000,'2100100000','兰州市','2100000000',211,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2001,'2100100001','城关区','2100100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2002,'2100100002','七里河区','2100100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2003,'2100100003','西固区','2100100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2004,'2100100004','安宁区','2100100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2005,'2100100005','红古区','2100100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2006,'2100100006','永登县','2100100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2007,'2100100007','皋兰县','2100100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2008,'2100100008','榆中县','2100100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2009,'2100200000','金昌市','2100000000',212,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2010,'2100200009','金川区','2100200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2011,'2100200010','永昌县','2100200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2012,'2100300000','白银市','2100000000',213,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2013,'2100300011','白银区','2100300000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2014,'2100300012','平川区','2100300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2015,'2100300013','靖远县','2100300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2016,'2100300014','会宁县','2100300000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2017,'2100300015','景泰县','2100300000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2018,'2100400000','天水市','2100000000',214,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2019,'2100400016','秦州区','2100400000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2020,'2100400017','麦积区','2100400000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2021,'2100400018','清水县','2100400000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2022,'2100400019','秦安县','2100400000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2023,'2100400020','甘谷县','2100400000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2024,'2100400021','武山县','2100400000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2025,'2100400022','张家川回族自治县','2100400000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2026,'2100500000','嘉峪关市','2100000000',215,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2027,'2100600000','武威市','2100000000',216,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2028,'2100600023','凉州区','2100600000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2029,'2100600024','民勤县','2100600000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2030,'2100600025','古浪县','2100600000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2031,'2100600026','天祝藏族自治县','2100600000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2032,'2100700000','张掖市','2100000000',217,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2033,'2100700027','甘州区','2100700000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2034,'2100700028','肃南裕固族自治县','2100700000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2035,'2100700029','民乐县','2100700000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2036,'2100700030','临泽县','2100700000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2037,'2100700031','高台县','2100700000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2038,'2100700032','山丹县','2100700000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2039,'2100800000','平凉市','2100000000',218,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2040,'2100800033','崆峒区','2100800000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2041,'2100800034','泾川县','2100800000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2042,'2100800035','灵台县','2100800000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2043,'2100800036','崇信县','2100800000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2044,'2100800037','华亭县','2100800000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2045,'2100800038','庄浪县','2100800000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2046,'2100800039','静宁县','2100800000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2047,'2100900000','酒泉市','2100000000',219,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2048,'2100900040','肃州区','2100900000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2049,'2100900041','金塔县','2100900000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2050,'2100900042','瓜州县','2100900000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2051,'2100900043','肃北蒙古族自治县','2100900000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2052,'2100900044','阿克塞哈萨克族自治县','2100900000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2053,'2100900045','玉门市','2100900000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2054,'2100900046','敦煌市','2100900000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2055,'2101000000','庆阳市','2100000000',220,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2056,'2101000047','西峰区','2101000000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2057,'2101000048','庆城县','2101000000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2058,'2101000049','环县','2101000000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2059,'2101000050','华池县','2101000000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2060,'2101000051','合水县','2101000000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2061,'2101000052','正宁县','2101000000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2062,'2101000053','宁县','2101000000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2063,'2101000054','镇原县','2101000000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2064,'2101100000','定西市','2100000000',221,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2065,'2101100055','安定区','2101100000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2066,'2101100056','通渭县','2101100000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2067,'2101100057','陇西县','2101100000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2068,'2101100058','渭源县','2101100000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2069,'2101100059','临洮县','2101100000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2070,'2101100060','漳县','2101100000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2071,'2101100061','岷县','2101100000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2072,'2101200000','陇南市','2100000000',222,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2073,'2101200062','武都区','2101200000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2074,'2101200063','成县','2101200000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2075,'2101200064','文县','2101200000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2076,'2101200065','宕昌县','2101200000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2077,'2101200066','康县','2101200000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2078,'2101200067','西和县','2101200000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2079,'2101200068','礼县','2101200000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2080,'2101200069','徽县','2101200000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2081,'2101200070','两当县','2101200000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2082,'2101300000','临夏回族自治州','2100000000',223,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2083,'2101300071','临夏市','2101300000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2084,'2101300072','临夏县','2101300000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2085,'2101300073','康乐县','2101300000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2086,'2101300074','永靖县','2101300000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2087,'2101300075','广河县','2101300000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2088,'2101300076','和政县','2101300000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2089,'2101300077','东乡族自治县','2101300000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2090,'2101300078','积石山保安族东乡族撒拉族自治县','2101300000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2091,'2101400000','甘南藏族自治州','2100000000',224,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2092,'2101400079','合作市','2101400000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2093,'2101400080','临潭县','2101400000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2094,'2101400081','卓尼县','2101400000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2095,'2101400082','舟曲县','2101400000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2096,'2101400083','迭部县','2101400000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2097,'2101400084','玛曲县','2101400000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2098,'2101400085','碌曲县','2101400000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2099,'2101400086','夏河县','2101400000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2100,'2200000000','四川省','',22,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2101,'2200100000','成都市','2200000000',225,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2102,'2200100001','锦江区','2200100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2103,'2200100002','青羊区','2200100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2104,'2200100003','金牛区','2200100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2105,'2200100004','武侯区','2200100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2106,'2200100005','成华区','2200100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2107,'2200100006','龙泉驿区','2200100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2108,'2200100007','青白江区','2200100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2109,'2200100008','新都区','2200100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2110,'2200100009','温江区','2200100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2111,'2200100010','金堂县','2200100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2112,'2200100011','双流县','2200100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2113,'2200100012','郫县','2200100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2114,'2200100013','大邑县','2200100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2115,'2200100014','蒲江县','2200100000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2116,'2200100015','新津县','2200100000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2117,'2200100016','都江堰市','2200100000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2118,'2200100017','彭州市','2200100000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2119,'2200100018','邛崃市','2200100000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2120,'2200100019','崇州市','2200100000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2121,'2200200000','攀枝花市','2200000000',226,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2122,'2200200020','东区','2200200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2123,'2200200021','西区','2200200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2124,'2200200022','仁和区','2200200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2125,'2200200023','米易县','2200200000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2126,'2200200024','盐边县','2200200000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2127,'2200300000','自贡市','2200000000',227,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2128,'2200300025','自流井区','2200300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2129,'2200300026','贡井区','2200300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2130,'2200300027','大安区','2200300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2131,'2200300028','沿滩区','2200300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2132,'2200300029','荣县','2200300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2133,'2200300030','富顺县','2200300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2134,'2200400000','绵阳市','2200000000',228,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2135,'2200400031','涪城区','2200400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2136,'2200400032','游仙区','2200400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2137,'2200400033','三台县','2200400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2138,'2200400034','盐亭县','2200400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2139,'2200400035','安县','2200400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2140,'2200400036','梓潼县','2200400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2141,'2200400037','北川羌族自治县','2200400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2142,'2200400038','平武县','2200400000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2143,'2200400039','江油市','2200400000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2144,'2200500000','南充市','2200000000',229,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2145,'2200500040','顺庆区','2200500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2146,'2200500041','高坪区','2200500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2147,'2200500042','嘉陵区','2200500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2148,'2200500043','南部县','2200500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2149,'2200500044','营山县','2200500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2150,'2200500045','蓬安县','2200500000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2151,'2200500046','仪陇县','2200500000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2152,'2200500047','西充县','2200500000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2153,'2200500048','阆中市','2200500000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2154,'2200600000','达州市','2200000000',230,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2155,'2200600049','通川区','2200600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2156,'2200600050','达县','2200600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2157,'2200600051','宣汉县','2200600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2158,'2200600052','开江县','2200600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2159,'2200600053','大竹县','2200600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2160,'2200600054','渠县','2200600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2161,'2200600055','万源市','2200600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2162,'2200700000','遂宁市','2200000000',231,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2163,'2200700056','船山区','2200700000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2164,'2200700057','安居区','2200700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2165,'2200700058','蓬溪县','2200700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2166,'2200700059','射洪县','2200700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2167,'2200700060','大英县','2200700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2168,'2200800000','广安市','2200000000',232,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2169,'2200800061','广安区','2200800000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2170,'2200800062','岳池县','2200800000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2171,'2200800063','武胜县','2200800000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2172,'2200800064','邻水县','2200800000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2173,'2200800065','华蓥市','2200800000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2174,'2200900000','巴中市','2200000000',233,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2175,'2200900066','巴州区','2200900000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2176,'2200900067','通江县','2200900000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2177,'2200900068','南江县','2200900000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2178,'2200900069','平昌县','2200900000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2179,'2201000000','泸州市','2200000000',234,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2180,'2201000070','江阳区','2201000000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2181,'2201000071','纳溪区','2201000000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2182,'2201000072','龙马潭区','2201000000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2183,'2201000073','泸县','2201000000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2184,'2201000074','合江县','2201000000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2185,'2201000075','叙永县','2201000000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2186,'2201000076','古蔺县','2201000000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2187,'2201100000','宜宾市','2200000000',235,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2188,'2201100077','翠屏区','2201100000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2189,'2201100078','宜宾县','2201100000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2190,'2201100079','南溪县','2201100000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2191,'2201100080','江安县','2201100000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2192,'2201100081','长宁县','2201100000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2193,'2201100082','高县','2201100000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2194,'2201100083','珙县','2201100000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2195,'2201100084','筠连县','2201100000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2196,'2201100085','兴文县','2201100000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2197,'2201100086','屏山县','2201100000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2198,'2201200000','资阳市','2200000000',236,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2199,'2201200087','雁江区','2201200000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2200,'2201200088','安岳县','2201200000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2201,'2201200089','乐至县','2201200000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2202,'2201200090','简阳市','2201200000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2203,'2201300000','内江市','2200000000',237,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2204,'2201300091','市中区','2201300000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2205,'2201300092','东兴区','2201300000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2206,'2201300093','威远县','2201300000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2207,'2201300094','资中县','2201300000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2208,'2201300095','隆昌县','2201300000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2209,'2201400000','乐山市','2200000000',238,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2210,'2201400096','市中区','2201400000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2211,'2201400097','沙湾区','2201400000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2212,'2201400098','五通桥区','2201400000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2213,'2201400099','金口河区','2201400000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2214,'2201400100','犍为县','2201400000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2215,'2201400101','井研县','2201400000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2216,'2201400102','夹江县','2201400000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2217,'2201400103','沐川县','2201400000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2218,'2201400104','峨边彝族自治县','2201400000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2219,'2201400105','马边彝族自治县','2201400000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2220,'2201400106','峨眉山市','2201400000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2221,'2201500000','眉山市','2200000000',239,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2222,'2201500107','东坡区','2201500000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2223,'2201500108','仁寿县','2201500000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2224,'2201500109','彭山县','2201500000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2225,'2201500110','洪雅县','2201500000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2226,'2201500111','丹棱县','2201500000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2227,'2201500112','青神县','2201500000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2228,'2201600000','凉山彝族自治州','2200000000',240,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2229,'2201600113','西昌市','2201600000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2230,'2201600114','木里藏族自治县','2201600000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2231,'2201600115','盐源县','2201600000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2232,'2201600116','德昌县','2201600000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2233,'2201600117','会理县','2201600000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2234,'2201600118','会东县','2201600000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2235,'2201600119','宁南县','2201600000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2236,'2201600120','普格县','2201600000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2237,'2201600121','布拖县','2201600000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2238,'2201600122','金阳县','2201600000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2239,'2201600123','昭觉县','2201600000',123,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2240,'2201600124','喜德县','2201600000',124,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2241,'2201600125','冕宁县','2201600000',125,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2242,'2201600126','越西县','2201600000',126,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2243,'2201600127','甘洛县','2201600000',127,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2244,'2201600128','美姑县','2201600000',128,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2245,'2201600129','雷波县','2201600000',129,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2246,'2201700000','雅安市','2200000000',241,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2247,'2201700130','雨城区','2201700000',130,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2248,'2201700131','名山县','2201700000',131,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2249,'2201700132','荥经县','2201700000',132,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2250,'2201700133','汉源县','2201700000',133,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2251,'2201700134','石棉县','2201700000',134,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2252,'2201700135','天全县','2201700000',135,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2253,'2201700136','芦山县','2201700000',136,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2254,'2201700137','宝兴县','2201700000',137,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2255,'2201800000','甘孜藏族自治州','2200000000',242,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2256,'2201800138','康定县','2201800000',138,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2257,'2201800139','泸定县','2201800000',139,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2258,'2201800140','丹巴县','2201800000',140,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2259,'2201800141','九龙县','2201800000',141,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2260,'2201800142','雅江县','2201800000',142,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2261,'2201800143','道孚县','2201800000',143,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2262,'2201800144','炉霍县','2201800000',144,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2263,'2201800145','甘孜县','2201800000',145,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2264,'2201800146','新龙县','2201800000',146,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2265,'2201800147','德格县','2201800000',147,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2266,'2201800148','白玉县','2201800000',148,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2267,'2201800149','石渠县','2201800000',149,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2268,'2201800150','色达县','2201800000',150,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2269,'2201800151','理塘县','2201800000',151,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2270,'2201800152','巴塘县','2201800000',152,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2271,'2201800153','乡城县','2201800000',153,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2272,'2201800154','稻城县','2201800000',154,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2273,'2201800155','得荣县','2201800000',155,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2274,'2201900000','阿坝藏族羌族自治州','2200000000',243,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2275,'2201900156','汶川县','2201900000',156,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2276,'2201900157','理县','2201900000',157,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2277,'2201900158','茂县','2201900000',158,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2278,'2201900159','松潘县','2201900000',159,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2279,'2201900160','九寨沟县','2201900000',160,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2280,'2201900161','金川县','2201900000',161,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2281,'2201900162','小金县','2201900000',162,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2282,'2201900163','黑水县','2201900000',163,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2283,'2201900164','马尔康县','2201900000',164,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2284,'2201900165','壤塘县','2201900000',165,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2285,'2201900166','阿坝县','2201900000',166,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2286,'2201900167','若尔盖县','2201900000',167,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2287,'2201900168','红原县','2201900000',168,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2288,'2202000000','德阳市','2200000000',244,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2289,'2202000169','旌阳区','2202000000',169,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2290,'2202000170','中江县','2202000000',170,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2291,'2202000171','罗江县','2202000000',171,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2292,'2202000172','广汉市','2202000000',172,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2293,'2202000173','什邡市','2202000000',173,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2294,'2202000174','绵竹市','2202000000',174,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2295,'2202100000','广元市','2200000000',245,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2296,'2202100175','市中区','2202100000',175,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2297,'2202100176','元坝区','2202100000',176,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2298,'2202100177','朝天区','2202100000',177,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2299,'2202100178','旺苍县','2202100000',178,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2300,'2202100179','青川县','2202100000',179,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2301,'2202100180','剑阁县','2202100000',180,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2302,'2202100181','苍溪县','2202100000',181,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2303,'2300000000','贵州省','',23,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2304,'2300100000','贵阳市','2300000000',246,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2305,'2300100001','南明区','2300100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2306,'2300100002','云岩区','2300100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2307,'2300100003','花溪区','2300100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2308,'2300100004','乌当区','2300100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2309,'2300100005','白云区','2300100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2310,'2300100006','小河区','2300100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2311,'2300100007','开阳县','2300100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2312,'2300100008','息烽县','2300100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2313,'2300100009','修文县','2300100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2314,'2300100010','清镇市','2300100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2315,'2300200000','遵义市','2300000000',247,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2316,'2300200011','红花岗区','2300200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2317,'2300200012','汇川区','2300200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2318,'2300200013','遵义县','2300200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2319,'2300200014','桐梓县','2300200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2320,'2300200015','绥阳县','2300200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2321,'2300200016','正安县','2300200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2322,'2300200017','道真仡佬族苗族自治县','2300200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2323,'2300200018','务川仡佬族苗族自治县','2300200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2324,'2300200019','凤冈县','2300200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2325,'2300200020','湄潭县','2300200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2326,'2300200021','余庆县','2300200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2327,'2300200022','习水县','2300200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2328,'2300200023','赤水市','2300200000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2329,'2300200024','仁怀市','2300200000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2330,'2300300000','安顺市','2300000000',248,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2331,'2300300025','西秀区','2300300000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2332,'2300300026','平坝县','2300300000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2333,'2300300027','普定县','2300300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2334,'2300300028','镇宁布依族苗族自治县','2300300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2335,'2300300029','关岭布依族苗族自治县','2300300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2336,'2300300030','紫云苗族布依族自治县','2300300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2337,'2300400000','黔南布依族苗族自治州','2300000000',249,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2338,'2300400031','都匀市','2300400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2339,'2300400032','福泉市','2300400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2340,'2300400033','荔波县','2300400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2341,'2300400034','贵定县','2300400000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2342,'2300400035','瓮安县','2300400000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2343,'2300400036','独山县','2300400000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2344,'2300400037','平塘县','2300400000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2345,'2300400038','罗甸县','2300400000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2346,'2300400039','长顺县','2300400000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2347,'2300400040','龙里县','2300400000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2348,'2300400041','惠水县','2300400000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2349,'2300400042','三都水族自治县','2300400000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2350,'2300500000','黔东南苗族侗族自治州','2300000000',250,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2351,'2300500043','凯里市','2300500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2352,'2300500044','黄平县','2300500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2353,'2300500045','施秉县','2300500000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2354,'2300500046','三穗县','2300500000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2355,'2300500047','镇远县','2300500000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2356,'2300500048','岑巩县','2300500000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2357,'2300500049','天柱县','2300500000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2358,'2300500050','锦屏县','2300500000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2359,'2300500051','剑河县','2300500000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2360,'2300500052','台江县','2300500000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2361,'2300500053','黎平县','2300500000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2362,'2300500054','榕江县','2300500000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2363,'2300500055','从江县','2300500000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2364,'2300500056','雷山县','2300500000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2365,'2300500057','麻江县','2300500000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2366,'2300500058','丹寨县','2300500000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2367,'2300600000','铜仁地区','2300000000',251,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2368,'2300600059','铜仁市','2300600000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2369,'2300600060','江口县','2300600000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2370,'2300600061','玉屏侗族自治县','2300600000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2371,'2300600062','石阡县','2300600000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2372,'2300600063','思南县','2300600000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2373,'2300600064','印江土家族苗族自治县','2300600000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2374,'2300600065','德江县','2300600000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2375,'2300600066','沿河土家族自治县','2300600000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2376,'2300600067','松桃苗族自治县','2300600000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2377,'2300600068','万山特区','2300600000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2378,'2300700000','毕节地区','2300000000',252,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2379,'2300700069','毕节市','2300700000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2380,'2300700070','大方县','2300700000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2381,'2300700071','黔西县','2300700000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2382,'2300700072','金沙县','2300700000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2383,'2300700073','织金县','2300700000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2384,'2300700074','纳雍县','2300700000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2385,'2300700075','威宁彝族回族苗族自治县','2300700000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2386,'2300700076','赫章县','2300700000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2387,'2300800000','六盘水市','2300000000',253,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2388,'2300800077','钟山区','2300800000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2389,'2300800078','六枝特区','2300800000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2390,'2300800079','水城县','2300800000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2391,'2300800080','盘县','2300800000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2392,'2300900000','黔西南布依族苗族自治州','2300000000',254,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2393,'2300900081','兴义市','2300900000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2394,'2300900082','兴仁县','2300900000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2395,'2300900083','普安县','2300900000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2396,'2300900084','晴隆县','2300900000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2397,'2300900085','贞丰县','2300900000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2398,'2300900086','望谟县','2300900000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2399,'2300900087','册亨县','2300900000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2400,'2300900088','安龙县','2300900000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2401,'2400000000','海南省','',24,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2402,'2400100000','海口市','2400000000',255,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2403,'2400100001','秀英区','2400100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2404,'2400100002','龙华区','2400100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2405,'2400100003','琼山区','2400100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2406,'2400100004','美兰区','2400100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2407,'2400200000','三亚市','2400000000',256,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2408,'2400300000','五指山市','2400000000',257,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2409,'2400400000','琼海市','2400000000',258,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2410,'2400500000','儋州市','2400000000',259,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2411,'2400600000','文昌市','2400000000',260,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2412,'2400700000','万宁市','2400000000',261,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2413,'2400800000','东方市','2400000000',262,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2414,'2400900000','澄迈县','2400000000',263,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2415,'2401000000','定安县','2400000000',264,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2416,'2401100000','屯昌县','2400000000',265,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2417,'2401200000','临高县','2400000000',266,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2418,'2401300000','白沙黎族自治县','2400000000',267,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2419,'2401400000','昌江黎族自治县','2400000000',268,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2420,'2401500000','乐东黎族自治县','2400000000',269,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2421,'2401600000','陵水黎族自治县','2400000000',270,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2422,'2401700000','保亭黎族苗族自治县','2400000000',271,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2423,'2401800000','琼中黎族苗族自治县','2400000000',272,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2424,'2500000000','云南省','',25,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2425,'2500100000','西双版纳傣族自治州','2500000000',273,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2426,'2500100001','景洪市','2500100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2427,'2500100002','勐海县','2500100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2428,'2500100003','勐腊县','2500100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2429,'2500200000','德宏傣族景颇族自治州','2500000000',274,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2430,'2500200004','瑞丽市','2500200000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2431,'2500200005','潞西市','2500200000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2432,'2500200006','梁河县','2500200000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2433,'2500200007','盈江县','2500200000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2434,'2500200008','陇川县','2500200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2435,'2500300000','昭通市','2500000000',275,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2436,'2500300009','昭阳区','2500300000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2437,'2500300010','鲁甸县','2500300000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2438,'2500300011','巧家县','2500300000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2439,'2500300012','盐津县','2500300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2440,'2500300013','大关县','2500300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2441,'2500300014','永善县','2500300000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2442,'2500300015','绥江县','2500300000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2443,'2500300016','镇雄县','2500300000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2444,'2500300017','彝良县','2500300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2445,'2500300018','威信县','2500300000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2446,'2500300019','水富县','2500300000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2447,'2500400000','昆明市','2500000000',276,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2448,'2500400020','五华区','2500400000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2449,'2500400021','盘龙区','2500400000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2450,'2500400022','官渡区','2500400000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2451,'2500400023','西山区','2500400000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2452,'2500400024','东川区','2500400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2453,'2500400025','呈贡县','2500400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2454,'2500400026','晋宁县','2500400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2455,'2500400027','富民县','2500400000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2456,'2500400028','宜良县','2500400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2457,'2500400029','石林彝族自治县','2500400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2458,'2500400030','嵩明县','2500400000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2459,'2500400031','禄劝彝族苗族自治县','2500400000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2460,'2500400032','寻甸回族彝族自治县','2500400000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2461,'2500400033','安宁市','2500400000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2462,'2500500000','大理白族自治州','2500000000',277,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2463,'2500500034','大理市','2500500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2464,'2500500035','漾濞彝族自治县','2500500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2465,'2500500036','祥云县','2500500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2466,'2500500037','宾川县','2500500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2467,'2500500038','弥渡县','2500500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2468,'2500500039','南涧彝族自治县','2500500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2469,'2500500040','巍山彝族回族自治县','2500500000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2470,'2500500041','永平县','2500500000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2471,'2500500042','云龙县','2500500000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2472,'2500500043','洱源县','2500500000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2473,'2500500044','剑川县','2500500000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2474,'2500500045','鹤庆县','2500500000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2475,'2500600000','红河哈尼族彝族自治州','2500000000',278,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2476,'2500600046','个旧市','2500600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2477,'2500600047','开远市','2500600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2478,'2500600048','蒙自县','2500600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2479,'2500600049','屏边苗族自治县','2500600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2480,'2500600050','建水县','2500600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2481,'2500600051','石屏县','2500600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2482,'2500600052','弥勒县','2500600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2483,'2500600053','泸西县','2500600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2484,'2500600054','元阳县','2500600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2485,'2500600055','红河县','2500600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2486,'2500600056','金平苗族瑶族傣族自治县','2500600000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2487,'2500600057','绿春县','2500600000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2488,'2500600058','河口瑶族自治县','2500600000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2489,'2500700000','曲靖市','2500000000',279,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2490,'2500700059','麒麟区','2500700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2491,'2500700060','马龙县','2500700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2492,'2500700061','陆良县','2500700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2493,'2500700062','师宗县','2500700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2494,'2500700063','罗平县','2500700000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2495,'2500700064','富源县','2500700000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2496,'2500700065','会泽县','2500700000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2497,'2500700066','沾益县','2500700000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2498,'2500700067','宣威市','2500700000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2499,'2500800000','保山市','2500000000',280,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2500,'2500800068','隆阳区','2500800000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2501,'2500800069','施甸县','2500800000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2502,'2500800070','腾冲县','2500800000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2503,'2500800071','龙陵县','2500800000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2504,'2500800072','昌宁县','2500800000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2505,'2500900000','文山壮族苗族自治州','2500000000',281,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2506,'2500900073','文山县','2500900000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2507,'2500900074','砚山县','2500900000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2508,'2500900075','西畴县','2500900000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2509,'2500900076','麻栗坡县','2500900000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2510,'2500900077','马关县','2500900000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2511,'2500900078','丘北县','2500900000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2512,'2500900079','广南县','2500900000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2513,'2500900080','富宁县','2500900000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2514,'2501000000','玉溪市','2500000000',282,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2515,'2501000081','红塔区','2501000000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2516,'2501000082','江川县','2501000000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2517,'2501000083','澄江县','2501000000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2518,'2501000084','通海县','2501000000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2519,'2501000085','华宁县','2501000000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2520,'2501000086','易门县','2501000000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2521,'2501000087','峨山彝族自治县','2501000000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2522,'2501000088','新平彝族傣族自治县','2501000000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2523,'2501000089','元江哈尼族彝族傣族自治县','2501000000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2524,'2501100000','楚雄彝族自治州','2500000000',283,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2525,'2501100090','楚雄市','2501100000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2526,'2501100091','双柏县','2501100000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2527,'2501100092','牟定县','2501100000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2528,'2501100093','南华县','2501100000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2529,'2501100094','姚安县','2501100000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2530,'2501100095','大姚县','2501100000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2531,'2501100096','永仁县','2501100000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2532,'2501100097','元谋县','2501100000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2533,'2501100098','武定县','2501100000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2534,'2501100099','禄丰县','2501100000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2535,'2501200000','普洱市','2500000000',284,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2536,'2501200100','思茅区','2501200000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2537,'2501200101','宁洱哈尼族彝族自治县','2501200000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2538,'2501200102','墨江哈尼族自治县','2501200000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2539,'2501200103','景东彝族自治县','2501200000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2540,'2501200104','景谷傣族彝族自治县','2501200000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2541,'2501200105','镇沅彝族哈尼族拉祜族自治县','2501200000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2542,'2501200106','江城哈尼族彝族自治县','2501200000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2543,'2501200107','孟连傣族拉祜族佤族自治县','2501200000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2544,'2501200108','澜沧拉祜族自治县','2501200000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2545,'2501200109','西盟佤族自治县','2501200000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2546,'2501300000','临沧市','2500000000',285,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2547,'2501300110','临翔区','2501300000',110,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2548,'2501300111','凤庆县','2501300000',111,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2549,'2501300112','云县','2501300000',112,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2550,'2501300113','永德县','2501300000',113,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2551,'2501300114','镇康县','2501300000',114,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2552,'2501300115','双江拉祜族佤族布朗族傣族自治县','2501300000',115,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2553,'2501300116','耿马傣族佤族自治县','2501300000',116,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2554,'2501300117','沧源佤族自治县','2501300000',117,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2555,'2501400000','怒江傈傈族自治州','2500000000',286,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2556,'2501400118','泸水县','2501400000',118,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2557,'2501400119','福贡县','2501400000',119,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2558,'2501400120','贡山独龙族怒族自治县','2501400000',120,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2559,'2501400121','兰坪白族普米族自治县','2501400000',121,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2560,'2501500000','迪庆藏族自治州','2500000000',287,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2561,'2501500122','香格里拉县','2501500000',122,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2562,'2501500123','德钦县','2501500000',123,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2563,'2501500124','维西傈僳族自治县','2501500000',124,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2564,'2501600000','丽江市','2500000000',288,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2565,'2501600125','古城区','2501600000',125,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2566,'2501600126','玉龙纳西族自治县','2501600000',126,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2567,'2501600127','永胜县','2501600000',127,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2568,'2501600128','华坪县','2501600000',128,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2569,'2501600129','宁蒗彝族自治县','2501600000',129,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2570,'2600000000','青海省','',26,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2571,'2600100000','海北藏族自治州','2600000000',289,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2572,'2600100001','门源回族自治县','2600100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2573,'2600100002','祁连县','2600100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2574,'2600100003','海晏县','2600100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2575,'2600100004','刚察县','2600100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2576,'2600200000','西宁市','2600000000',290,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2577,'2600200005','城东区','2600200000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2578,'2600200006','城中区','2600200000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2579,'2600200007','城西区','2600200000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2580,'2600200008','城北区','2600200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2581,'2600200009','大通回族土族自治县','2600200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2582,'2600200010','湟中县','2600200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2583,'2600200011','湟源县','2600200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2584,'2600300000','海东地区','2600000000',291,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2585,'2600300012','平安县','2600300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2586,'2600300013','民和回族土族自治县','2600300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2587,'2600300014','乐都县','2600300000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2588,'2600300015','互助土族自治县','2600300000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2589,'2600300016','化隆回族自治县','2600300000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2590,'2600300017','循化撒拉族自治县','2600300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2591,'2600400000','黄南藏族自治州','2600000000',292,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2592,'2600400018','同仁县','2600400000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2593,'2600400019','尖扎县','2600400000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2594,'2600400020','泽库县','2600400000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2595,'2600400021','河南蒙古族自治县','2600400000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2596,'2600500000','海南藏族自治州','2600000000',293,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2597,'2600500022','共和县','2600500000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2598,'2600500023','同德县','2600500000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2599,'2600500024','贵德县','2600500000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2600,'2600500025','兴海县','2600500000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2601,'2600500026','贵南县','2600500000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2602,'2600600000','果洛藏族自治州','2600000000',294,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2603,'2600600027','玛沁县','2600600000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2604,'2600600028','班玛县','2600600000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2605,'2600600029','甘德县','2600600000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2606,'2600600030','达日县','2600600000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2607,'2600600031','久治县','2600600000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2608,'2600600032','玛多县','2600600000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2609,'2600700000','玉树藏族自治州','2600000000',295,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2610,'2600700033','玉树县','2600700000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2611,'2600700034','杂多县','2600700000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2612,'2600700035','称多县','2600700000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2613,'2600700036','治多县','2600700000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2614,'2600700037','囊谦县','2600700000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2615,'2600700038','曲麻莱县','2600700000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2616,'2600800000','海西蒙古族藏族自治州','2600000000',296,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2617,'2600800039','格尔木市','2600800000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2618,'2600800040','德令哈市','2600800000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2619,'2600800041','乌兰县','2600800000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2620,'2600800042','都兰县','2600800000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2621,'2600800043','天峻县','2600800000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2622,'2700000000','陕西省','',27,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2623,'2700100000','西安市','2700000000',297,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2624,'2700100001','新城区','2700100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2625,'2700100002','碑林区','2700100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2626,'2700100003','莲湖区','2700100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2627,'2700100004','灞桥区','2700100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2628,'2700100005','未央区','2700100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2629,'2700100006','雁塔区','2700100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2630,'2700100007','阎良区','2700100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2631,'2700100008','临潼区','2700100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2632,'2700100009','长安区','2700100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2633,'2700100010','蓝田县','2700100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2634,'2700100011','周至县','2700100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2635,'2700100012','户县','2700100000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2636,'2700100013','高陵县','2700100000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2637,'2700200000','咸阳市','2700000000',298,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2638,'2700200014','秦都区','2700200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2639,'2700200015','杨陵区','2700200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2640,'2700200016','渭城区','2700200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2641,'2700200017','三原县','2700200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2642,'2700200018','泾阳县','2700200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2643,'2700200019','乾县','2700200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2644,'2700200020','礼泉县','2700200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2645,'2700200021','永寿县','2700200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2646,'2700200022','彬县','2700200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2647,'2700200023','长武县','2700200000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2648,'2700200024','旬邑县','2700200000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2649,'2700200025','淳化县','2700200000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2650,'2700200026','武功县','2700200000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2651,'2700200027','兴平市','2700200000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2652,'2700300000','延安市','2700000000',299,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2653,'2700300028','宝塔区','2700300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2654,'2700300029','延长县','2700300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2655,'2700300030','延川县','2700300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2656,'2700300031','子长县','2700300000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2657,'2700300032','安塞县','2700300000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2658,'2700300033','志丹县','2700300000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2659,'2700300034','吴起县','2700300000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2660,'2700300035','甘泉县','2700300000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2661,'2700300036','富县','2700300000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2662,'2700300037','洛川县','2700300000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2663,'2700300038','宜川县','2700300000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2664,'2700300039','黄龙县','2700300000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2665,'2700300040','黄陵县','2700300000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2666,'2700400000','榆林市','2700000000',300,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2667,'2700400041','榆阳区','2700400000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2668,'2700400042','神木县','2700400000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2669,'2700400043','府谷县','2700400000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2670,'2700400044','横山县','2700400000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2671,'2700400045','靖边县','2700400000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2672,'2700400046','定边县','2700400000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2673,'2700400047','绥德县','2700400000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2674,'2700400048','米脂县','2700400000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2675,'2700400049','佳县','2700400000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2676,'2700400050','吴堡县','2700400000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2677,'2700400051','清涧县','2700400000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2678,'2700400052','子洲县','2700400000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2679,'2700500000','渭南市','2700000000',301,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2680,'2700500053','临渭区','2700500000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2681,'2700500054','华县','2700500000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2682,'2700500055','潼关县','2700500000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2683,'2700500056','大荔县','2700500000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2684,'2700500057','合阳县','2700500000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2685,'2700500058','澄城县','2700500000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2686,'2700500059','蒲城县','2700500000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2687,'2700500060','白水县','2700500000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2688,'2700500061','富平县','2700500000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2689,'2700500062','韩城市','2700500000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2690,'2700500063','华阴市','2700500000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2691,'2700600000','商洛市','2700000000',302,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2692,'2700600064','商州区','2700600000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2693,'2700600065','洛南县','2700600000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2694,'2700600066','丹凤县','2700600000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2695,'2700600067','商南县','2700600000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2696,'2700600068','山阳县','2700600000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2697,'2700600069','镇安县','2700600000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2698,'2700600070','柞水县','2700600000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2699,'2700700000','安康市','2700000000',303,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2700,'2700700071','汉滨区','2700700000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2701,'2700700072','汉阴县','2700700000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2702,'2700700073','石泉县','2700700000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2703,'2700700074','宁陕县','2700700000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2704,'2700700075','紫阳县','2700700000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2705,'2700700076','岚皋县','2700700000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2706,'2700700077','平利县','2700700000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2707,'2700700078','镇坪县','2700700000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2708,'2700700079','旬阳县','2700700000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2709,'2700700080','白河县','2700700000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2710,'2700800000','汉中市','2700000000',304,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2711,'2700800081','汉台区','2700800000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2712,'2700800082','南郑县','2700800000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2713,'2700800083','城固县','2700800000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2714,'2700800084','洋县','2700800000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2715,'2700800085','西乡县','2700800000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2716,'2700800086','勉县','2700800000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2717,'2700800087','宁强县','2700800000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2718,'2700800088','略阳县','2700800000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2719,'2700800089','镇巴县','2700800000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2720,'2700800090','留坝县','2700800000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2721,'2700800091','佛坪县','2700800000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2722,'2700900000','宝鸡市','2700000000',305,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2723,'2700900092','渭滨区','2700900000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2724,'2700900093','金台区','2700900000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2725,'2700900094','陈仓区','2700900000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2726,'2700900095','凤翔县','2700900000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2727,'2700900096','岐山县','2700900000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2728,'2700900097','扶风县','2700900000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2729,'2700900098','眉县','2700900000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2730,'2700900099','陇县','2700900000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2731,'2700900100','千阳县','2700900000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2732,'2700900101','麟游县','2700900000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2733,'2700900102','凤县','2700900000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2734,'2700900103','太白县','2700900000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2735,'2701000000','铜川市','2700000000',306,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2736,'2701000104','王益区','2701000000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2737,'2701000105','印台区','2701000000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2738,'2701000106','耀州区','2701000000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2739,'2701000107','宜君县','2701000000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2740,'2800000000','广西壮族自治区','',28,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2741,'2800100000','防城港市','2800000000',307,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2742,'2800100001','港口区','2800100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2743,'2800100002','防城区','2800100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2744,'2800100003','上思县','2800100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2745,'2800100004','东兴市','2800100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2746,'2800200000','南宁市','2800000000',308,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2747,'2800200005','兴宁区','2800200000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2748,'2800200006','青秀区','2800200000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2749,'2800200007','江南区','2800200000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2750,'2800200008','西乡塘区','2800200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2751,'2800200009','良庆区','2800200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2752,'2800200010','邕宁区','2800200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2753,'2800200011','武鸣县','2800200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2754,'2800200012','隆安县','2800200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2755,'2800200013','马山县','2800200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2756,'2800200014','上林县','2800200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2757,'2800200015','宾阳县','2800200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2758,'2800200016','横县','2800200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2759,'2800300000','崇左市','2800000000',309,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2760,'2800300017','江洲区','2800300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2761,'2800300018','扶绥县','2800300000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2762,'2800300019','宁明县','2800300000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2763,'2800300020','龙州县','2800300000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2764,'2800300021','大新县','2800300000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2765,'2800300022','天等县','2800300000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2766,'2800300023','凭祥市','2800300000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2767,'2800400000','来宾市','2800000000',310,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2768,'2800400024','兴宾区','2800400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2769,'2800400025','忻城县','2800400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2770,'2800400026','象州县','2800400000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2771,'2800400027','武宣县','2800400000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2772,'2800400028','金秀瑶族自治县','2800400000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2773,'2800400029','合山市','2800400000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2774,'2800500000','柳州市','2800000000',311,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2775,'2800500030','城中区','2800500000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2776,'2800500031','鱼峰区','2800500000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2777,'2800500032','柳南区','2800500000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2778,'2800500033','柳北区','2800500000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2779,'2800500034','柳江县','2800500000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2780,'2800500035','柳城县','2800500000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2781,'2800500036','鹿寨县','2800500000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2782,'2800500037','融安县','2800500000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2783,'2800500038','融水苗族自治县','2800500000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2784,'2800500039','三江侗族自治县','2800500000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2785,'2800600000','桂林市','2800000000',312,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2786,'2800600040','秀峰区','2800600000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2787,'2800600041','叠彩区','2800600000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2788,'2800600042','象山区','2800600000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2789,'2800600043','七星区','2800600000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2790,'2800600044','雁山区','2800600000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2791,'2800600045','阳朔县','2800600000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2792,'2800600046','临桂县','2800600000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2793,'2800600047','灵川县','2800600000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2794,'2800600048','全州县','2800600000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2795,'2800600049','兴安县','2800600000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2796,'2800600050','永福县','2800600000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2797,'2800600051','灌阳县','2800600000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2798,'2800600052','龙胜各族自治县','2800600000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2799,'2800600053','资源县','2800600000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2800,'2800600054','平乐县','2800600000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2801,'2800600055','荔浦县','2800600000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2802,'2800600056','恭城瑶族自治县','2800600000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2803,'2800700000','梧州市','2800000000',313,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2804,'2800700057','万秀区','2800700000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2805,'2800700058','碟山区','2800700000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2806,'2800700059','长洲区','2800700000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2807,'2800700060','苍梧县','2800700000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2808,'2800700061','藤县','2800700000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2809,'2800700062','蒙山县','2800700000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2810,'2800700063','岑溪市','2800700000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2811,'2800800000','贺州市','2800000000',314,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2812,'2800800064','八步区','2800800000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2813,'2800800065','昭平县','2800800000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2814,'2800800066','钟山县','2800800000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2815,'2800800067','富川瑶族自治县','2800800000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2816,'2800900000','贵港市','2800000000',315,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2817,'2800900068','港北区','2800900000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2818,'2800900069','港南区','2800900000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2819,'2800900070','覃塘区','2800900000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2820,'2800900071','平南县','2800900000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2821,'2800900072','桂平市','2800900000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2822,'2801000000','玉林市','2800000000',316,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2823,'2801000073','玉州区','2801000000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2824,'2801000074','容县','2801000000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2825,'2801000075','陆川县','2801000000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2826,'2801000076','博白县','2801000000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2827,'2801000077','兴业县','2801000000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2828,'2801000078','北流市','2801000000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2829,'2801100000','百色市','2800000000',317,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2830,'2801100079','右江区','2801100000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2831,'2801100080','田阳县','2801100000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2832,'2801100081','田东县','2801100000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2833,'2801100082','平果县','2801100000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2834,'2801100083','德保县','2801100000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2835,'2801100084','靖西县','2801100000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2836,'2801100085','那坡县','2801100000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2837,'2801100086','凌云县','2801100000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2838,'2801100087','乐业县','2801100000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2839,'2801100088','田林县','2801100000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2840,'2801100089','西林县','2801100000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2841,'2801100090','隆林各族自治县','2801100000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2842,'2801200000','钦州市','2800000000',318,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2843,'2801200091','钦南区','2801200000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2844,'2801200092','钦北区','2801200000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2845,'2801200093','灵山县','2801200000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2846,'2801200094','浦北县','2801200000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2847,'2801300000','河池市','2800000000',319,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2848,'2801300095','金城江区','2801300000',95,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2849,'2801300096','南丹县','2801300000',96,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2850,'2801300097','天峨县','2801300000',97,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2851,'2801300098','凤山县','2801300000',98,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2852,'2801300099','东兰县','2801300000',99,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2853,'2801300100','罗城仫佬族自治县','2801300000',100,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2854,'2801300101','环江毛南族自治县','2801300000',101,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2855,'2801300102','巴马瑶族自治县','2801300000',102,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2856,'2801300103','都安瑶族自治县','2801300000',103,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2857,'2801300104','大化瑶族自治县','2801300000',104,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2858,'2801300105','宜州市','2801300000',105,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2859,'2801400000','北海市','2800000000',320,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2860,'2801400106','海城区','2801400000',106,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2861,'2801400107','银海区','2801400000',107,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2862,'2801400108','铁山港区','2801400000',108,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2863,'2801400109','合浦县','2801400000',109,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2864,'2900000000','西藏自治区','',29,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2865,'2900100000','拉萨市','2900000000',321,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2866,'2900100001','城关区','2900100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2867,'2900100002','林周县','2900100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2868,'2900100003','当雄县','2900100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2869,'2900100004','尼木县','2900100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2870,'2900100005','曲水县','2900100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2871,'2900100006','堆龙德庆县','2900100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2872,'2900100007','达孜县','2900100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2873,'2900100008','墨竹工卡县','2900100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2874,'2900200000','日喀则地区','2900000000',322,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2875,'2900200009','日喀则市','2900200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2876,'2900200010','南木林县','2900200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2877,'2900200011','江孜县','2900200000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2878,'2900200012','定日县','2900200000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2879,'2900200013','萨迦县','2900200000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2880,'2900200014','拉孜县','2900200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2881,'2900200015','昂仁县','2900200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2882,'2900200016','谢通门县','2900200000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2883,'2900200017','白朗县','2900200000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2884,'2900200018','仁布县','2900200000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2885,'2900200019','康马县','2900200000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2886,'2900200020','定结县','2900200000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2887,'2900200021','仲巴县','2900200000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2888,'2900200022','亚东县','2900200000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2889,'2900200023','吉隆县','2900200000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2890,'2900200024','聂拉木县','2900200000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2891,'2900200025','萨嘎县','2900200000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2892,'2900200026','岗巴县','2900200000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2893,'2900300000','山南地区','2900000000',323,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2894,'2900300027','乃东县','2900300000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2895,'2900300028','扎囊县','2900300000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2896,'2900300029','贡嘎县','2900300000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2897,'2900300030','桑日县','2900300000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2898,'2900300031','琼结县','2900300000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2899,'2900300032','曲松县','2900300000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2900,'2900300033','措美县','2900300000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2901,'2900300034','洛扎县','2900300000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2902,'2900300035','加查县','2900300000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2903,'2900300036','隆子县','2900300000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2904,'2900300037','错那县','2900300000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2905,'2900300038','浪卡子县','2900300000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2906,'2900400000','林芝地区','2900000000',324,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2907,'2900400039','林芝县','2900400000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2908,'2900400040','工布江达县','2900400000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2909,'2900400041','米林县','2900400000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2910,'2900400042','墨脱县','2900400000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2911,'2900400043','波密县','2900400000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2912,'2900400044','察隅县','2900400000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2913,'2900400045','朗县','2900400000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2914,'2900500000','昌都地区','2900000000',325,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2915,'2900500046','昌都县','2900500000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2916,'2900500047','江达县','2900500000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2917,'2900500048','贡觉县','2900500000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2918,'2900500049','类乌齐县','2900500000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2919,'2900500050','丁青县','2900500000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2920,'2900500051','察雅县','2900500000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2921,'2900500052','八宿县','2900500000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2922,'2900500053','左贡县','2900500000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2923,'2900500054','芒康县','2900500000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2924,'2900500055','洛隆县','2900500000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2925,'2900500056','边坝县','2900500000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2926,'2900600000','那曲地区','2900000000',326,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2927,'2900600057','那曲县','2900600000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2928,'2900600058','嘉黎县','2900600000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2929,'2900600059','比如县','2900600000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2930,'2900600060','聂荣县','2900600000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2931,'2900600061','安多县','2900600000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2932,'2900600062','申扎县','2900600000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2933,'2900600063','索县','2900600000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2934,'2900600064','班戈县','2900600000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2935,'2900600065','巴青县','2900600000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2936,'2900600066','尼玛县','2900600000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2937,'2900700000','阿里地区','2900000000',327,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2938,'2900700067','普兰县','2900700000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2939,'2900700068','札达县','2900700000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2940,'2900700069','噶尔县','2900700000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2941,'2900700070','日土县','2900700000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2942,'2900700071','革吉县','2900700000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2943,'2900700072','改则县','2900700000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2944,'2900700073','措勤县','2900700000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2945,'3000000000','宁夏回族自治区','',30,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2946,'3000100000','银川市','3000000000',328,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2947,'3000100001','兴庆区','3000100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2948,'3000100002','西夏区','3000100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2949,'3000100003','金凤区','3000100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2950,'3000100004','永宁县','3000100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2951,'3000100005','贺兰县','3000100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2952,'3000100006','灵武市','3000100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2953,'3000200000','石嘴山市','3000000000',329,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2954,'3000200007','大武口区','3000200000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2955,'3000200008','惠农区','3000200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2956,'3000200009','平罗县','3000200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2957,'3000300000','吴忠市','3000000000',330,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2958,'3000300010','利通区','3000300000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2959,'3000300011','盐池县','3000300000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2960,'3000300012','同心县','3000300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2961,'3000300013','青铜峡市','3000300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2962,'3000400000','固原市','3000000000',331,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2963,'3000400014','原州区','3000400000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2964,'3000400015','西吉县','3000400000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2965,'3000400016','隆德县','3000400000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2966,'3000400017','泾源县','3000400000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2967,'3000400018','彭阳县','3000400000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2968,'3000500000','中卫市','3000000000',332,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2969,'3000500019','沙坡头区','3000500000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2970,'3000500020','中宁县','3000500000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2971,'3000500021','海原县','3000500000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2972,'3100000000','新 疆维吾尔自治区','',31,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2973,'3100100000','塔城地区','3100000000',333,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2974,'3100100001','塔城市','3100100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2975,'3100100002','乌苏市','3100100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2976,'3100100003','额敏县','3100100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2977,'3100100004','沙湾县','3100100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2978,'3100100005','托里县','3100100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2979,'3100100006','裕民县','3100100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2980,'3100100007','和布克赛尔蒙古自治县','3100100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2981,'3100200000','哈密地区','3100000000',334,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2982,'3100200008','哈密市','3100200000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2983,'3100200009','巴里坤哈萨克自治县','3100200000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2984,'3100200010','伊吾县','3100200000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2985,'3100300000','和田地区','3100000000',335,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2986,'3100300011','和田市','3100300000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2987,'3100300012','和田县','3100300000',12,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2988,'3100300013','墨玉县','3100300000',13,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2989,'3100300014','皮山县','3100300000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2990,'3100300015','洛浦县','3100300000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2991,'3100300016','策勒县','3100300000',16,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2992,'3100300017','于田县','3100300000',17,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2993,'3100300018','民丰县','3100300000',18,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2994,'3100400000','阿勒泰地区','3100000000',336,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2995,'3100400019','阿勒泰市','3100400000',19,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2996,'3100400020','布尔津县','3100400000',20,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2997,'3100400021','富蕴县','3100400000',21,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2998,'3100400022','福海县','3100400000',22,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(2999,'3100400023','哈巴河县','3100400000',23,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3000,'3100400024','青河县','3100400000',24,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3001,'3100400025','吉木乃县','3100400000',25,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3002,'3100500000','克孜勒苏柯尔克孜自治州','3100000000',337,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3003,'3100500026','阿图什市','3100500000',26,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3004,'3100500027','阿克陶县','3100500000',27,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3005,'3100500028','阿合奇县','3100500000',28,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3006,'3100500029','乌恰县','3100500000',29,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3007,'3100600000','博尔塔拉蒙古自治州','3100000000',338,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3008,'3100600030','博乐市','3100600000',30,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3009,'3100600031','精河县','3100600000',31,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3010,'3100600032','温泉县','3100600000',32,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3011,'3100700000','克拉玛依市','3100000000',339,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3012,'3100700033','独山子区','3100700000',33,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3013,'3100700034','克拉玛依区','3100700000',34,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3014,'3100700035','白碱滩区','3100700000',35,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3015,'3100700036','乌尔禾区','3100700000',36,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3016,'3100800000','乌鲁木齐市','3100000000',340,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3017,'3100800037','天山区','3100800000',37,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3018,'3100800038','沙依巴克区','3100800000',38,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3019,'3100800039','新市区','3100800000',39,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3020,'3100800040','水磨沟区','3100800000',40,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3021,'3100800041','头屯河区','3100800000',41,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3022,'3100800042','达坂城区','3100800000',42,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3023,'3100800043','米东区','3100800000',43,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3024,'3100800044','乌鲁木齐县','3100800000',44,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3025,'3100900000','石河子市','3100000000',341,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3026,'3101000000','昌吉回族自治州','3100000000',342,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3027,'3101000045','昌吉市','3101000000',45,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3028,'3101000046','阜康市','3101000000',46,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3029,'3101000047','呼图壁县','3101000000',47,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3030,'3101000048','玛纳斯县','3101000000',48,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3031,'3101000049','奇台县','3101000000',49,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3032,'3101000050','吉木萨尔县','3101000000',50,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3033,'3101000051','木垒哈萨克自治县','3101000000',51,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3034,'3101100000','五家渠市','3100000000',343,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3035,'3101200000','吐鲁番地区','3100000000',344,2,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3036,'3101200052','吐鲁番市','3101200000',52,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3037,'3101200053','鄯善县','3101200000',53,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3038,'3101200054','托克逊县','3101200000',54,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3040,'3101300055','库尔勒市','3101300000',55,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3041,'3101300056','轮台县','3101300000',56,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3042,'3101300057','尉犁县','3101300000',57,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3043,'3101300058','若羌县','3101300000',58,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3044,'3101300059','且末县','3101300000',59,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3045,'3101300060','焉耆回族自治县','3101300000',60,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3046,'3101300061','和静县','3101300000',61,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3047,'3101300062','和硕县','3101300000',62,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3048,'3101300063','博湖县','3101300000',63,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3050,'3101400064','阿克苏市','3101400000',64,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3051,'3101400065','温宿县','3101400000',65,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3052,'3101400066','库车县','3101400000',66,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3053,'3101400067','沙雅县','3101400000',67,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3054,'3101400068','新和县','3101400000',68,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3055,'3101400069','拜城县','3101400000',69,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3056,'3101400070','乌什县','3101400000',70,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3057,'3101400071','阿瓦提县','3101400000',71,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3058,'3101400072','柯坪县','3101400000',72,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3061,'3101600073','喀什市','3101600000',73,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3062,'3101600074','疏附县','3101600000',74,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3063,'3101600075','疏勒县','3101600000',75,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3064,'3101600076','英吉沙县','3101600000',76,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3065,'3101600077','泽普县','3101600000',77,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3066,'3101600078','莎车县','3101600000',78,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3067,'3101600079','叶城县','3101600000',79,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3068,'3101600080','麦盖提县','3101600000',80,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3069,'3101600081','岳普湖县','3101600000',81,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3070,'3101600082','伽师县','3101600000',82,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3071,'3101600083','巴楚县','3101600000',83,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3072,'3101600084','塔什库尔干塔吉克自治县','3101600000',84,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3075,'3101800085','伊宁市','3101800000',85,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3076,'3101800086','奎屯市','3101800000',86,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3077,'3101800087','伊宁县','3101800000',87,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3078,'3101800088','察布查尔锡伯自治县','3101800000',88,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3079,'3101800089','霍城县','3101800000',89,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3080,'3101800090','巩留县','3101800000',90,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3081,'3101800091','新源县','3101800000',91,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3082,'3101800092','昭苏县','3101800000',92,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3083,'3101800093','特克斯县','3101800000',93,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3084,'3101800094','尼勒克县','3101800000',94,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3085,'3200000000','内蒙古自治区','',32,1,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3087,'3200100001','海拉尔区','3200100000',1,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3088,'3200100002','阿荣旗','3200100000',2,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3089,'3200100003','莫力达瓦达斡尔族自治旗','3200100000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3090,'3200100004','鄂伦春自治旗','3200100000',4,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3091,'3200100005','鄂温克族自治旗','3200100000',5,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3092,'3200100006','陈巴尔虎旗','3200100000',6,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3093,'3200100007','新巴尔虎左旗','3200100000',7,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3094,'3200100008','新巴尔虎右旗','3200100000',8,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3095,'3200100009','满洲里市','3200100000',9,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3096,'3200100010','牙克石市','3200100000',10,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3097,'3200100011','扎兰屯市','3200100000',11,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3101,'3200200014','新城区','3200200000',14,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3102,'3200200015','回民区','3200200000',15,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3204,'666','eeeee','3200200000',3,3,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3206,'a3e6de2b-419e-fa5e-0c62-727f29093d30','ttttt','3200200015',333,null,null);
insert into Demo_Area(ID,Code,Name,PCode,Sort,Lvl,Description) 
 values(3207,'rrrrr','fffff','666',33,33,null);

/*  Table：Demo_TestA   */
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('2c2b6b19-2b8e-4961-b6f0-ebca921d657b','311',1,31.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('2ff92056-d3aa-497b-96a9-554b9be39fbb','3115',1,666.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('478ce6f1-d2a3-483e-8419-e7954f0bc2b5','3114',1,666.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('51cfdb37-c91a-41a7-966d-37cb9134f71f','3113',0,31.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('5b8845d7-7ada-4cf2-ba91-76e2fa162915','3111',1,31.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('7b7aad70-3c45-470f-a245-ed896650ff24','323',1,3.00,32);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('90e229ec-2fcd-494b-a0c7-b7e819c87694','311',1,31.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('9c015ff9-094c-4a8c-9e5e-096b95a3312e','3116',1,666.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('9dc820ce-a4eb-4ea5-bb50-281d69d348cb','5555',1,31.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('d33f50e7-f152-4980-8777-f4cd94c6cf75','3112',0,31.00,31);
insert into Demo_TestA(ID,F1,F2,F3,F4) 
 values('f896c770-e4ab-4be2-bd37-e20033427b55','3333',1,31.00,3232);

/*  Table：Demo_TestB   */
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('1e1d8c72-b3f9-4199-8b52-21da9a9926dc',null,'','200000000','200100000','');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('2c2b6b19-2b8e-4961-b6f0-ebca921d657b',66,'66','2000000000','2000100000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('2c47dad2-4941-4a8a-89e8-497c6a3f11c7',66,'66','1900000000','1900300000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('478ce6f1-d2a3-483e-8419-e7954f0bc2b5',66,'66','500000000','500400000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('5b8845d7-7ada-4cf2-ba91-76e2fa162915',66,'66','200000000','200100000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('85002786-054a-4e29-9afa-2d0972488e46',443,'33','200000000','400100000','');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('90e229ec-2fcd-494b-a0c7-b7e819c87694',66,'66','100000000','','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('9c015ff9-094c-4a8c-9e5e-096b95a3312e',66,'66','400000000','400100000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('9dc820ce-a4eb-4ea5-bb50-281d69d348cb',66,'66','1300000000','1300100000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('d0c83254-be0f-49e7-a072-aff6a98d008a',66,'66','300000000','300100000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('d33f50e7-f152-4980-8777-f4cd94c6cf75',66,'66','2900000000','2900400000','66');
insert into Demo_TestB(ID,F5,F6,F7,F8,FK) 
 values('f896c770-e4ab-4be2-bd37-e20033427b55',66,'66','200000000','200100000','66');

/*  Table：Demo_Tree   */
insert into Demo_Tree(ID,Name,ParentID,CreateTime) 
 values(1,'ppp',null,null);
insert into Demo_Tree(ID,Name,ParentID,CreateTime) 
 values(2,'21212333',null,null);

/*  Table：Sys_Action   */
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('8bc4d68a-ec7d-48f7-97c4-03a09836f45c','分配权限','auth',1,1,19);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('71e39291-59d3-4ed6-9ae1-0d7df7da2f91','导入','import',1,1,9);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('630e0452-00d6-4452-8a5c-19b2c3115ee3','配置表头','config',1,1,13);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('cf8f418e-2468-4f6c-96cf-3302a2d9fa9b','删除','del',1,1,5);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('c97f8956-5c79-4393-8423-34451a1bcc95','查看SQL','viewsql',1,1,15);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('d0739946-99e0-4770-8d2a-6faf25a8457a','新增','add',1,1,1);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('8a59a358-5a8f-4cb4-b600-9313028b911b','导出','export',1,1,11);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('15b73068-6c0f-49c9-800c-a7216cb2d079','查看界面','view',1,1,7);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('a9ee0f5e-ff85-4f00-ac18-f6118286671d','保存SQL','savesql',1,1,17);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('1c613ade-6665-49fb-b298-faf1b82dd6d2','编辑','edit',1,1,3);

/*  Table：Sys_Menu   */
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('813318ba-b3a7-437c-9405-016dcf48f224','8d60d828-56de-4b56-9c14-93fa94ccf300','下拉框','Demo/combobox.html',2,500,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('76fe9cef-11e1-4752-b7a8-01c220e9e473',null,'AA','#',1,10,'','',null,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('2e388df1-ad13-40d5-b183-0987ed2ebe93',null,'外链','http://taurus.cyqdata.com',1,15,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('33c3179e-1ddc-4655-a65e-0b27ef10da8d','3b5e2f04-9f2a-48b0-9bc7-27701971484c','菜单管理','/Web/SysAdmin/MenuEdit.html',2,5,'','',0,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('72997801-a545-468d-b7a9-0b9f1d0613ac','8d60d828-56de-4b56-9c14-93fa94ccf300','Input对话框','/Demo/InputDialog.html',2,11,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('5fc6b135-85be-4234-970d-14918c26f958','8d60d828-56de-4b56-9c14-93fa94ccf300','级联【行内、导出】','/Web/SysAdmin/CustomView.html?objname=Demo_TestB',2,201,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('3b5e2f04-9f2a-48b0-9bc7-27701971484c',null,'系统管理','#',1,30,'','',0,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('edd516a1-4180-4f0e-ac16-292d7dd4febd','3b5e2f04-9f2a-48b0-9bc7-27701971484c','功能管理','/Web/SysAdmin/ActionList.html',2,10,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('3493cabc-667d-459c-bab8-3a8f7d58842e','3b5e2f04-9f2a-48b0-9bc7-27701971484c','Excel导入配置','/Web/SysAdmin/ConfigExcel.html',2,60,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('177b5c8e-465e-4bc1-80aa-45ddbb65c911','80a620b6-175a-493f-b7b5-54c61c1fd1e9','EE','Demo/list.html',4,4,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('80a620b6-175a-493f-b7b5-54c61c1fd1e9','626e25c2-2dde-4847-8edc-e87dbb92bb1d','CC','#',3,1,'','',null,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('86f8c95f-48c0-4f0c-9503-5b4605aeb378','3b5e2f04-9f2a-48b0-9bc7-27701971484c','配置维护','/web/SysAdmin/ConfigKeyValue.html',2,4,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('eba566dc-95e7-4529-bf2e-656c7a490d69','3b5e2f04-9f2a-48b0-9bc7-27701971484c','权限管理','/Web/SysAdmin/Rolelist.html',2,30,'','',0,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3,8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('9bb56ff2-6715-4838-a660-773e6c7eeb45','8d60d828-56de-4b56-9c14-93fa94ccf300','定义查询区域','Demo/list.html?toolbar=true',2,110,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('e844697e-900e-42b2-a96a-89ff5233c29b','8d60d828-56de-4b56-9c14-93fa94ccf300','树形表格','/demo/treegrid.html',2,210,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('8d60d828-56de-4b56-9c14-93fa94ccf300',null,'功能演示','#',1,20,'','',0,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('e4312e26-edb8-4e9d-9a66-96b7f252d559','3b5e2f04-9f2a-48b0-9bc7-27701971484c','用户管理','/Web/SysAdmin/UserList.html',2,1,'/Resource/Images/IconMenu/gxgfwh.png','',0,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('13ce68d5-1261-4bec-95ac-b56f708f480b','8d60d828-56de-4b56-9c14-93fa94ccf300','普通列表','Demo/list.html',2,100,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('626e25c2-2dde-4847-8edc-e87dbb92bb1d','76fe9cef-11e1-4752-b7a8-01c220e9e473','BBB','#',2,1,'','',null,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('bd3c53a3-55eb-427a-8707-f525682955ba','8d60d828-56de-4b56-9c14-93fa94ccf300','行内编辑列表','Demo/rowedit.html',2,200,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');

/*  Table：Sys_Role   */
insert into Sys_Role(RoleID,RoleName,Notes) 
 values('53536a66-0d99-4ee8-b4a6-5928129d0ab6','普通管理员','运营级别的权限');
insert into Sys_Role(RoleID,RoleName,Notes) 
 values('d8e1ae3b-8451-436a-a59b-c7516e711b9c','超级管理员','开发级别的权限');

/*  Table：Sys_RoleAction   */
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6fb78c16-acb0-4f5d-a384-0374af18ade0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('975e0a73-2331-4dcf-a678-03ab0df58020','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b5227116-5eca-4650-ab83-0781522bed71','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('de3b2faa-a430-480a-9be5-0b4d63619243','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('81b9629b-bed8-49ef-a029-0bd17eacb039','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('967a8af2-6ace-41db-b0e6-0cc5dd4290ef','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ca013ca4-3c36-4428-8320-0e5b83d10f30','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('01435d1d-7455-4bfe-9eb0-0f4c901cca48','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('96ea6566-3248-4a4f-bec6-0fb9f5d7e877','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2a6cbe02-6eb6-4d2a-b3c5-1091da1d1a4b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f95aa142-e2c6-4182-a1ee-10db6c115fcd','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c11eed76-6a22-4285-8a93-11919aa3896b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e3e1f201-058d-4a4a-ab2c-122b4e7df101','53536a66-0d99-4ee8-b4a6-5928129d0ab6','813318ba-b3a7-437c-9405-016dcf48f224','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('55914746-304f-48c9-882c-126039b1db39','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('647adce6-2f09-4e32-8983-132da31ee15e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4f714332-927c-4b90-92cf-1467a61cfe5b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a24c2c92-6bd6-4f0a-bb0a-1545d34f8f6e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('33e326f6-2ae8-4dc4-87ff-15f83c4f67b5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2e388df1-ad13-40d5-b183-0987ed2ebe93','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9a2d82b6-a584-4be6-af73-163fcc197f6a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('113c4966-d46d-4fcd-9853-1ece935717f5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('834f0a43-9708-45b6-9762-1fc9cae7014f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cf93d384-bd65-4454-9a0d-1fe786a07c25','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6bc91075-4ab3-41ef-8b19-20ebf4f27e07','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('af9b6355-9c9e-4020-b159-22a770eb11f6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9b506bc4-34ad-47bd-83ee-244a94cfe7bf','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('dd4e4926-e2e4-406c-aaf5-245d47780ab0','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d48a0b47-b433-41fc-bb1d-2651e5aebb77','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e71d3dbb-a634-46fd-b5c7-28643e59108f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','819f8aac-82e9-4a4b-ad1e-84824a985d73');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('607853d9-215c-4360-b70d-2c7f53b9916f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','15B73068-6C0F-49C9-800C-A7216CB2D079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('20910ef7-ca15-4854-9776-2fbff292026f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4a1a32f6-893b-4148-b23f-30f594966677','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','819f8aac-82e9-4a4b-ad1e-84824a985d73');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f8e28b30-57f9-48c8-bfb9-31180da34f6b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e39f8781-0b43-429b-af98-31fc0918eb94','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('40aab83d-02e6-4b3c-8176-32f7f8133019','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6a6c98b2-0ae5-4268-ab8f-35867c485e17','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2a6c7ed5-bd37-4252-b572-35a28947380e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','630E0452-00D6-4452-8A5C-19B2C3115EE3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cc211f2e-3e5e-41c3-b5c4-379381a9378e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('51d12529-3870-457d-a924-3b24e4c12ceb','53536a66-0d99-4ee8-b4a6-5928129d0ab6','177b5c8e-465e-4bc1-80aa-45ddbb65c911','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8a47bc83-758e-4378-b750-418ad4d701b1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('20e291cc-bee8-4081-9f64-41ef01201313','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('56cf184a-7ecd-4058-9d5c-45ad0908a0fb','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bf0d8be3-4fad-459e-931d-466a18f904f1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cf4b4306-bbcd-4c7b-ad92-4b89d5c2fa73','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d8cfd621-2f70-4857-93b4-4ba5183ad7dc','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c18a5fa1-ec01-4886-98f7-4cb2bdc96194','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d603a53c-2035-41ee-b94f-4d7203faccc8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','813318ba-b3a7-437c-9405-016dcf48f224','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ee5c7843-9f01-49f3-923b-4d8a04cb07f9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('73ec8bb2-d7bd-4a15-ac03-52eec17d12a3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1cbde9de-9e77-45cd-9935-54b7eea68867','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1b22a11e-09f0-4f1a-8fee-556a37e35160','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('87284aab-5658-422e-ab2c-56b9fe1a20d7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','819f8aac-82e9-4a4b-ad1e-84824a985d73');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('94083086-7703-4fe0-a6a4-580aae2b1404','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0510b5d3-7db3-4cdc-9d6a-61a6e95f27d2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('791b38e5-ddf6-4b59-88ae-6528b5b53843','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7ba8176e-67f0-4a8d-9d28-66e2c4d3b4a8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('167416bc-6f72-42b7-9ee7-690488a6eee4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','1C613ADE-6665-49FB-B298-FAF1B82DD6D2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('78cee798-713e-414c-88a2-69f4928120f6','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9568b29b-dbed-469f-b219-6ab5e9dd8b9f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('728b9f12-a555-4c13-9abc-6d29c722326c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3479e124-6d2c-4152-ad04-6d51c5ccdac7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2a0d8763-2389-49a7-896f-6e93d0b630d4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d0ec6e53-26c9-475a-b3c1-6ee874d493b8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b51540cd-6099-4011-bf43-71b8c0e7c7a3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cf193530-ee06-4a9b-9530-71e5b4fd38b6','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('86b6bfe4-879a-4a54-930b-72c474232b62','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a36bc372-d8e7-4483-9d5d-7368420e89b5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('56126846-fe3a-46be-8b25-7454e2c8f126','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f0002aa3-ddd4-4e35-9728-75674dde4b9b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','D0739946-99E0-4770-8D2A-6FAF25A8457A');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7748d4fc-fe2d-45a6-8a35-75a910f25076','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e64fbe3e-5801-493c-8857-7ade5146b434','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f3d57549-50de-4cc3-a620-7f0be632de95','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('19b339c4-7d46-4fcf-b5c7-7f25c018b880','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('253ca8e0-da3b-4470-8e01-7f4c9da15316','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('647f7433-94b7-47cc-ad5d-818614f573a3','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c7b8cc24-fdd6-4114-a5b7-82c279327f3b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ea268dae-9e4f-4277-9628-870f7daaa51b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5de97c97-12eb-45e0-97b5-874d95ea59f1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6198b199-d59e-412e-82a7-8ac31b90fdd4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f1b9991e-6303-404a-80ff-8b48e46161d8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('34128b5b-8036-4dff-abb8-8dec718af3ca','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8675a28c-4fbd-4668-a0ca-8e7dbd300690','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('838f978e-25fd-4715-add5-8f45a3da6a36','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3e6932f0-97c0-4009-a052-910790143099','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ed08b6f5-6050-4d2e-b9f0-930891a4c14a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f0f13aca-d9ef-4f92-b01a-944caa57caa3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8dad363b-3c43-4edb-9e79-948844208d12','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7748ca90-d99b-460e-81b1-9557150d8d99','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c2d0d9a1-2eb5-4a2b-8e95-95b1e85a124d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('03d08996-5292-4831-be06-9712261c5d18','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b1ca8598-1fde-4a1a-aa20-99282d82ed4b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('53497121-4a1b-4b91-9b22-9c1e3015b3e0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('98bcfb4c-a6ed-46ff-878e-9e7fda04bc9d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b248d3fa-53a4-48a6-aeba-a012387efb45','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bca816bb-ce8b-49db-939c-a180a233afb4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c84e896b-6630-4eab-89cd-a55a87173cd1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9ac5bb45-5730-419c-945a-a5e5d425450d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('89fe6305-9ac6-441a-a043-a6b598e865f1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ae5cd9e3-d436-4708-9f85-a8a31ca9df1f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('01a20129-d07e-4d90-9704-a8fe3fea7cf0','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('72f655dd-4291-4513-96a9-a9a521d1eaab','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f6f9db69-8444-49f7-892f-ac25b2382322','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2e388df1-ad13-40d5-b183-0987ed2ebe93','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('82f2ebb8-7924-4936-9dd6-ac3e9619b36b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d74230d5-703e-45ea-97c8-ad7399868d0e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9af7bfda-afa4-483c-87bf-b087eb2abd21','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5b672039-2b8e-4913-87f6-b17ea1996980','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('df4e38aa-df1d-41be-b036-b20cd8a7000a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8c74e978-8333-4e88-988a-b3e6ce3896d5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('872febe8-397b-44eb-a8c9-b3ea0c5d9c51','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('43429739-d970-41d7-826a-b5eba8411760','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('db19f5f0-f5e8-4ec3-9e36-b6e49c0d33f5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','CF8F418E-2468-4F6C-96CF-3302A2D9FA9B');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('39af34ad-3526-4373-8468-bb9b57213fd4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ae338256-e59c-4aa1-9891-bd20bae6090a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('13750659-e022-4298-bfb3-be9d9838931e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1aa1a6a2-7cfc-41d1-89a2-bea19a93c60a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','819f8aac-82e9-4a4b-ad1e-84824a985d73');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('07823150-e79c-4bd7-a21a-c0076705db98','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f1d5fe04-a63f-48f5-8d43-c02a59dd740f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6b1641b3-a54d-4905-a1a6-c09d9f15b1e4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('17b4f4d3-a4b5-43f7-a0ae-c0ce70a6e8ac','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6177930a-e46c-4fb9-8625-c195198fa728','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('89c746d3-8985-4bfc-9e5c-c3eb2475ba5f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d6419a5f-2096-4965-81f2-c42aaf62986f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('64315ca3-6088-4e4b-84d7-c53fc56b6e67','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('823ed3f8-18ba-4a90-91ad-c5ccd58d2831','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('631fb6d5-316a-4402-af47-c948836e0a0c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7c8239d5-afdf-400d-ad43-cc174b4fd2ab','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2df47cc3-d1c8-4c3f-a814-ccfc96c8f9ff','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('67ee534e-355e-4bd1-8b09-d077d83af8c8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a72600b0-6c64-47f4-95bd-d112dcea5883','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d3e026b9-f7f6-471e-b522-d20d5e496519','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a9b4d05c-1c56-44a0-ae5f-d2ca519ffd4a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b61b59a7-9514-4718-a20f-d3871a2c5043','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c2eedd96-8bd6-4c51-9f64-d395a4875aeb','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('27f8cf4f-7860-4a23-bd77-d5e5f6f32deb','d8e1ae3b-8451-436a-a59b-c7516e711b9c','177b5c8e-465e-4bc1-80aa-45ddbb65c911','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('340c4da6-e835-48b9-9e1f-db6e043e9189','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('028191f6-d02f-422a-9929-db79167c79a6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('304e05bc-8620-4fe2-901c-dcb976c4e61d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('89dcd96d-c94a-47db-a2a5-dcd3d3564ecc','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('89e6ca5e-080c-4457-b032-de54b3f895a3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8984a70b-cfd4-483e-9b4c-e21d07e88548','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9337c69a-b9be-4bed-84f0-e4a65895402b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6b759a96-5471-4b41-b409-e4c2091d1ad7','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7f457619-1c53-4a3a-a33e-e5def5f30668','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0d84be94-730c-499d-8129-e9dec92bc51e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('074176ee-c23b-499d-bb39-ea130f148fb9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2b8d0d37-0ccd-42c9-9ba9-ea7b1b49fc8c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('349a54bb-88e8-4ad6-8992-ed6a3b4a0503','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8d051c9c-d574-46d7-b777-f0a751b9d21e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9e7bf3d2-e92f-498f-ac01-f18e98a194f2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('928706fd-2ee3-4c9d-a472-f2851dbc3d85','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7b332d26-0869-45e0-961a-f2ef507ff535','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d203682a-fa8d-47da-8b16-f436f125b19f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0dc8d091-028e-49a0-a708-f4580a7e6974','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f76905a5-4dbc-4a7c-be0d-f4726b217a98','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1c7c8deb-bcbf-4424-a153-f6c040074145','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('17d72aa6-565f-45c0-b35b-f6ec4550bfa2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a3216a5c-2685-4fec-b335-f8bc6d31eb43','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d490207f-a1d4-408f-9523-f8f96adcd736','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('49e9d35e-65c5-490d-82ec-fc987b09824f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9a3d6e1e-c0de-4ab1-bcef-fd6abbbf293e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a0fd634c-e5bf-4ff0-ad09-fd88978dcaec','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6974d758-41ee-47b0-aab2-ff2627f876f8','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','c97f8956-5c79-4393-8423-34451a1bcc95');

/*  Table：Sys_User   */
insert into Sys_User(UserID,UserName,FullName,Password,PwdExpiredTime,Sex,Phone,Email,Status,LoginCount,LastLoginTime,LastLoginIP,RoleIDs,CreateTime) 
 values('6a8aaec9-7fe0-430d-919d-935ebb09af40','admin2','普通管理员','nDE4HzLUuqc#',to_date('2017/10/24 18:06:21','yyyy-mm-dd hh24:mi:ss'),1,'13431142222','a@a.com',1,6,to_date('2016/11/30 16:00:39','yyyy-mm-dd hh24:mi:ss'),'::1','53536a66-0d99-4ee8-b4a6-5928129d0ab6',to_date('2016/8/15 14:46:34','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_User(UserID,UserName,FullName,Password,PwdExpiredTime,Sex,Phone,Email,Status,LoginCount,LastLoginTime,LastLoginIP,RoleIDs,CreateTime) 
 values('d8e1ae3b-8451-436a-a59b-c7516e711b9c','admin','系统管理员','nDE4HzLUuqc#',to_date('2019/5/11 15:00:53','yyyy-mm-dd hh24:mi:ss'),1,'13431142222','admin@admin.com',1,276,to_date('2016/11/30 16:16:15','yyyy-mm-dd hh24:mi:ss'),'::1','d8e1ae3b-8451-436a-a59b-c7516e711b9c',to_date('2016/5/9 8:41:22','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Sys_UserInfo   */
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('6a8aaec9-7fe0-430d-919d-935ebb09af40','','xxxxx',null);
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('d8e1ae3b-8451-436a-a59b-c7516e711b9c','','xxxxeee',null);

