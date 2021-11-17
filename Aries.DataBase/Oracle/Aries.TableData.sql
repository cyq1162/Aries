/*  Table：Config_Excel   */
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('a3410cbc-144d-e90e-53ed-897eee8df4e6','V_Test','V_Test333','Demo_TestA,Demo_TestB',0,0,0,1,to_date('2016-05-09 09:18:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('ccf3f4c3-f718-a844-d6f2-74edf3624d03','V_SYS_UserList','用户数据导入','Sys_User,Sys_UserInfo',0,0,0,0,to_date('2018-09-01 00:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('f8754ebd-b722-0e9d-002f-2510100d07cf','V_Test2','V_Test2222','Demo_TestA,Demo_TestB',0,0,0,0,to_date('2016-10-20 00:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Excel(ExcelID,ExcelName,Description,TableNames,StartIndex,HeadCrossRowNum,WhereType,AcceptType,CreateTime) 
 values('fb700287-84c2-8118-f8bd-b70f458ac48f','V_Test3','这是测试的3333434','Demo_TestA,Demo_TestB',0,0,0,0,to_date('2016-11-28 00:00:00','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Config_ExcelInfo   */
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('00d1bccf-52f2-40b6-bd0b-b1db3a5d89d5','fb700287-84c2-8118-f8bd-b70f458ac48f','F2','Demo_TestA','F2','',1,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('016d118f-3888-46bf-b3ce-9bcefd2029ea','ccf3f4c3-f718-a844-d6f2-74edf3624d03','登陆密码','Sys_User','Password','',0,0,'',1,to_date('2018-09-02 00:36:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('1ed5f947-2592-473b-b7e3-a410ed0a459e','fb700287-84c2-8118-f8bd-b70f458ac48f','F1','Demo_TestA','F1','',0,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('22e71bfb-c0ac-428e-aac8-80bb061cfbfc','fb700287-84c2-8118-f8bd-b70f458ac48f','F6','Demo_TestB','F6','',0,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('3632c756-5a40-4862-9000-38bbf1e6fedf','a3410cbc-144d-e90e-53ed-897eee8df4e6','ID','Demo_TestB','ID','',0,1,'Demo_TestA',0,to_date('2016-10-16 00:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('39f09652-64b4-4e17-bb79-1a08ddfbbb0f','fb700287-84c2-8118-f8bd-b70f458ac48f','F3','Demo_TestA','F3','',0,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('3c5312ed-902e-493a-9323-dba96b95372e','a3410cbc-144d-e90e-53ed-897eee8df4e6','F1','Demo_TestA','F1','',1,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('3ddf55cc-50a5-4d64-a359-cde42e23882e','ccf3f4c3-f718-a844-d6f2-74edf3624d03','用户真实姓名','Sys_User','FullName','',0,0,'',1,to_date('2018-09-02 00:36:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('55b31261-92ff-48af-b7ec-5ad9ce652b1b','a3410cbc-144d-e90e-53ed-897eee8df4e6','F8','Demo_TestB','F8','',0,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('5706b5b0-fb37-4d44-bf5a-b449910fb23e','a3410cbc-144d-e90e-53ed-897eee8df4e6','F7','Demo_TestB','F7','',0,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('65202899-b08e-4fa5-a292-850442df551a','f8754ebd-b722-0e9d-002f-2510100d07cf','F2','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('6c563e8a-10f0-4eb9-a091-8530541204e9','a3410cbc-144d-e90e-53ed-897eee8df4e6','F5','Demo_TestB','F5','F8',0,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('74f856c7-b393-4335-a8b3-70b9b020e262','f8754ebd-b722-0e9d-002f-2510100d07cf','F5','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('752a77dd-2b91-4743-91f1-4adfd36ba42d','a3410cbc-144d-e90e-53ed-897eee8df4e6','F4','Demo_TestA','F4','@UserID',1,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('93948ef7-f44f-4002-908b-e092796244e2','fb700287-84c2-8118-f8bd-b70f458ac48f','F8','Demo_TestB','F8','@UserName',0,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('96490057-5f02-4a10-9e06-92a16e811739','f8754ebd-b722-0e9d-002f-2510100d07cf','F3','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9c143af2-244f-4ea8-aee4-774380707c7c','fb700287-84c2-8118-f8bd-b70f458ac48f','ID','Demo_TestB','ID','@UserID',0,1,'Demo_TestA',0,to_date('2016-11-28 00:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9ce21a16-9386-423f-8aa4-52aff90bfb88','fb700287-84c2-8118-f8bd-b70f458ac48f','F7','Demo_TestB','F7','Demo_TestA.F3',0,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9d000fed-38e1-4e69-aafb-0822f25783b1','f8754ebd-b722-0e9d-002f-2510100d07cf','F8','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('9d8519f8-945a-4971-a91d-da1afd0066c4','f8754ebd-b722-0e9d-002f-2510100d07cf','F7','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('a55b000b-7b7b-4e63-ad5c-2ad8fee2bff7','ccf3f4c3-f718-a844-d6f2-74edf3624d03','备注','','','',0,0,'',0,to_date('2018-09-02 00:36:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('a64654d2-8d9a-4748-af86-280e4fa5ed1a','a3410cbc-144d-e90e-53ed-897eee8df4e6','F6','Demo_TestB','F6','Demo_TestA.F1',0,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('a9cd4dd9-5fbb-426b-b768-f44b9bc73fff','fb700287-84c2-8118-f8bd-b70f458ac48f','F5','Demo_TestB','F5','',0,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('ab7c748a-2f50-4fff-88da-941f9268fcbb','fb700287-84c2-8118-f8bd-b70f458ac48f','F4','Demo_TestA','F4','',1,0,'',0,to_date('2016-11-28 21:50:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('b16c8ad3-0619-4d6e-b5ff-5f3f39a19789','f8754ebd-b722-0e9d-002f-2510100d07cf','F1','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('ba86c51c-44ba-4607-8958-912970e67e84','a3410cbc-144d-e90e-53ed-897eee8df4e6','F2','Demo_TestA','F2','#是否',0,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('c3b04f9e-d9e6-4253-a761-25319f3e539a','a3410cbc-144d-e90e-53ed-897eee8df4e6','F3','Demo_TestA','F3','',0,0,'',0,to_date('2016-10-16 16:38:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('cad40b08-50d0-449a-a849-93ceffb40752','a3410cbc-144d-e90e-53ed-897eee8df4e6','FK','Demo_TestB','FK','F8',0,0,'',0,to_date('2016-10-16 00:00:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('d69137e2-1259-4f86-8daf-e1f978530ac9','f8754ebd-b722-0e9d-002f-2510100d07cf','F4','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('e23230f0-16a4-4ef6-b534-30575768d924','ccf3f4c3-f718-a844-d6f2-74edf3624d03','账号','Sys_User','UserName','',0,0,'',1,to_date('2018-09-02 00:36:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_ExcelInfo(ExceInfoID,ExcelID,ExcelName,TableName,Field,Formatter,IsUnique,IsForeignkey,ForeignTable,IsRequired,CreateTime) 
 values('ea304b62-650e-4d28-b048-d2b2c7d1bf97','f8754ebd-b722-0e9d-002f-2510100d07cf','F6','','','',0,0,'',0,to_date('2016-10-20 14:00:54','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Config_Grid   */
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0101ea97-ae30-4288-abaa-75d9814ac960','_WF_Activity','','ActivityFormPath','ActivityFormPath',1,490,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('01d0cbe7-198c-4428-bc5d-e696df252f1a','V_WF_Task','','FromCreatorID','FromCreatorID',1,255,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:44:07','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('020c1cb2-6138-4a3b-813e-fc7346538fab','_WF_Activity','','ActivityType','ActivityType',1,60,100,'center',1,'','','',1,1,0,'string,20,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('028370db-dc56-4eca-a040-5c0e69136c50','_Sys_Organization','','CreateTime','CreateTime',1,70,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('02ac3906-bb64-4e84-9deb-e68f67880340','WF_Definition','','CreateTime','创建日期',0,110,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('030d6a33-b07a-4e80-9cab-bb24cff7b783','_WF_Activity','','IsEnableInvalid','IsEnableInvalid',1,520,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('03899636-ab70-4cf1-ae2e-432003a78d49','V_Test','','mg_01','二级表头',0,11,100,'center',0,'','','',1,3,0,'string,50,0,0',0,1,1,0,1,0,to_date('2016-10-13 14:23:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('05691a25-e20a-4095-b112-55a5968f1cf0','V_Test','{"namefor":"F7","dialogfor":"Demo_TestA","editable":"true"}','F8','F8',0,90,100,'center',1,'F8','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('05b355a0-2c63-4fad-b9f6-f368472fdbfe','_Demo_TestA','','F2','F2',0,30,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016-09-05 01:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('06652b3d-e2e8-4e8a-85cf-80d3ddf4e1b4','WF_Instance','','StartTime','发起时间',0,50,100,'center',1,'','','',1,1,0,'datetime,23,3,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('06ba5055-ff52-4f96-901d-36c02bb875ac','Sys_Organization','','OrgName','组织名称',0,20,150,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1,0',1,1,1,1,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('07f5d6ea-a864-43b0-be20-73e2ee27639b','Config_Grid','','Hidden','隐藏',0,105,30,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('08240433-cb48-4810-8aa5-b51e77d8304d','_WF_Activity','','Width','Width',1,420,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('083fecf7-0a69-43be-8108-69721b843627','Config_ExcelInfo','','CreateTime','创建日期',0,110,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('090c99fb-3b4b-4a55-bbcc-7599f3521f1a','Demo_TestA','{"dialogfor":"_Demo_TestA","editable":"true","namefor":"F1"}','F3','F3',0,40,100,'center',1,'','','',1,1,1,'decimal,8,2,0',1,1,1,1,1,0,to_date('2016-08-10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0a355aed-1c72-4f6c-96ce-3a6d71e3877e','_Demo_TestA','','F1','F1',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016-09-05 01:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0b793799-d4f3-4965-89ac-c021c2bf1812','Config_Excel','','ExcelName','模板名称',0,30,100,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0beae935-6a7e-4cc1-ace1-f8f5765964b8','V_WF_Task','','StartTime','发起时间',0,100,100,'center',1,'','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0e136dab-1990-467c-81dc-21e95e24cafd','WF_Activity','','ExtendedProperty','ExtendedProperty',0,170,100,'center',1,'','','',1,1,0,'string,-1,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0e68e4d4-cc16-4487-bb6f-d4ecd4912111','WF_Definition','','WorkflowID','WorkflowID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0f14f34e-5567-479c-a1a6-204b05f5b7d7','WF_Instance','','SheetID','工单号',0,13,100,'center',1,'goto','','',1,1,1,'string,100,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('0fd6ddbc-1c9a-4d36-a07b-06bf8c98aa05','Config_ExcelInfo','','IsRequired','必填',0,65,80,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1010ab24-41e8-44cc-9de3-6b98c5dfa37e','_Sys_User','','Sex','性别',0,60,100,'center',1,'#性别','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-09 15:42:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('11515478-58e4-4edb-9ad8-3c67a97f2a8b','WF_Activity','','ActorParser','ActorParser',0,110,100,'center',1,'stringFormatter','','',1,1,0,'string,200,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('124c0bfc-eda2-42cc-b04c-521b1fdc096a','_WF_Activity','','SubAssembly','SubAssembly',1,480,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('13569cf8-63f6-4785-9498-5b053654e10c','_WF_Activity','','IsShowOpinion','IsShowOpinion',1,460,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('13b2f7f1-e39f-464b-9002-7cb60b74af31','WF_Definition','','IsHistoryActorPriority','历史参与者优先',0,44,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('13bbfb6c-eb5c-44a8-80ce-4a29a2e58c1e','sys_Action','','ActionName','权限名称',0,20,200,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,1,1,1,0,to_date('2016-05-09 09:00:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('146a36c0-5981-416a-8f0a-454be3fc089e','_WF_Activity','','JoinType','JoinType',1,210,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('14b3e5f8-81d2-4449-b780-c92532cdb678','WF_Activity','','RejectType','RejectType',1,350,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1571b424-c126-490b-b3e2-ed19ee52a86c','Config_ExcelInfo','','IsUnique','唯一',0,70,80,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1',1,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('15a4c338-dbcf-463e-ad19-9d6db73d28a8','Demo_TestB','','F6','F6',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',1,1,1,1,1,0,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('161b9f28-7f93-4cbd-8e99-11e6d0707af8','WF_Activity','','JoinRuleParam','JoinRuleParam',0,230,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1639a7c9-ae45-49f7-a20d-721b2f5bc8c5','V_WF_Task','','CreatorID','CreatorID',1,255,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 11:59:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('16682fbe-ecd4-49f8-bc33-21e357b918fc','_Demo_TestA','','F4','F4',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-09-05 01:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('17474779-c661-43ac-a248-b0bfd9cd9600','_WF_Activity','','StepID','步骤',0,30,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,1,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('18fbaa40-97c9-464e-8834-290bf68346fb','WF_TaskInstance','','Opinion','处理意见',0,70,200,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('198d1994-cded-4693-a0ac-545a94305d1f','WF_Activity','','RespondType','RespondType',0,250,100,'center',1,'','','',1,1,0,'string,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('19f0ad97-c330-4feb-a468-aee53b001f09','_WF_Activity','','RejectActivity','RejectActivity',1,560,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1a9817aa-5f84-4984-ad80-17ba12a875fa','Sys_Organization','','ParentOrgID','上级',1,60,100,'center',1,'#','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1d8daf7b-951c-4a8a-b573-16cf0243329a','_WF_Activity','','SplitType','SplitType',1,220,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1dbf168b-7bbc-4afc-9e4d-85c23c9cd18b','_WF_Activity','','IsEnableWithdraw','IsEnableWithdraw',1,510,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1e1937ce-18f7-4002-b102-38e94ad5a19f','_WF_App','','AppID','流程应用ID',0,10,100,'center',0,'#','','',1,1,1,'string,50,0,1,1',0,0,1,0,1,0,to_date('2019-05-03 22:17:38','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1e5f41e6-242e-45c1-beab-fd6ead9ad17f','Demo_Tree','','Name','Name',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-08-31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('1f5cb623-8c15-43d9-8bd3-c9ca6e5c8783','WF_Instance','','FinishTime','结束时间',0,60,100,'center',1,'','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('20794510-2552-42af-95c4-f0c58e895a43','V_SYS_UserList','','Memo','Memo',1,170,100,'center',0,'stringFormatter','','',1,1,0,'string,150,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('20d5946f-a496-4ba2-b5f3-3c4b9a4af63a','V_SYS_UserList','','RoleIDs','角色',0,190,100,'center',0,'#C_SYS_Role','','',1,1,1,'string,500,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('213e5377-5ac7-4f08-ab10-e7f94fcfbadc','Config_Grid','${objname:"C_SYS_ObjName",pattern:"="}','ObjName','对象名',0,20,100,'center',0,'','','',1,1,1,'string,50,0,1',1,1,1,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('22561a80-0c17-4f33-90ad-89383b4d863b','Demo_TestA','','F4','F4',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-08-10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('22aeb5a6-fbb6-44a7-98a6-86c37157447f','_Demo_TestA','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',0,1,1,1,1,0,to_date('2016-09-05 01:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2370be85-9bf0-491a-87eb-6d9771cfe783','Config_Grid','','Frozen','冻结',0,93,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('23d1bb15-8587-42a9-8993-666f05c2ed11','V_WF_Task','','AppID','流程别名',0,50,50,'center',1,'','','',1,1,1,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('24976ab8-7869-4348-80cd-023ef5151fad','Config_ExcelInfo','','ExcelName','Excel列名',0,30,100,'center',1,'stringFormatter','','',1,1,1,'string,400,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('252746e5-a6f7-4305-a092-a8954222587b','V_TestAAA','','UserID','用户ID',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-04-13 19:15:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2599c597-2486-40aa-b696-e5df14d17074','Sys_Action','','SortOrder','排序号',0,60,100,'center',1,'','','',1,1,0,'string,50,0,0',0,0,0,1,1,0,to_date('2016-11-30 14:34:55','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('259f9781-3c80-457e-b0d7-94b6a887c4e7','Sys_Organization','','OrgLevel','组织层级',0,50,50,'center',1,'','','',1,1,1,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('26099072-b07a-4af1-9332-29a19255a847','TestA','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',0,1,1,1,1,0,to_date('2016-05-10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('261bbeb3-b7a4-433b-90d5-11d56ab252e4','V_MyTest','','ID','ID',0,20,100,'center',1,'','','',1,1,0,'int32,10,0,1,1',1,1,1,1,null,0,to_date('2017-06-05 21:08:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2802ebf9-30c8-4327-898e-43c619a269f1','WF_App','','WorkflowID','WorkflowID',1,255,100,'center',1,'#','','',1,1,0,'guid,36,0,0,0',1,1,0,1,1,0,to_date('2019-05-07 21:46:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('29754384-d5a8-42f6-8c90-6b09cb03d976','Config_Grid','','Styler','样式函数',1,220,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2a7f7c03-6592-4427-9eaf-5b6e26a96883','TestABC','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,1,1',0,0,1,0,null,0,to_date('2017-04-13 18:04:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2a9fe005-1a8b-4f16-a854-8ed279c3a20f','WF_App','','AppID','别名',0,10,40,'center',1,'#','','',1,1,1,'string,50,0,1,1',0,0,1,0,1,0,to_date('2018-08-30 18:53:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2b2a9ed3-d90c-4215-9297-c9c16e083ba7','Config_Grid','','Colspan','跨列',0,877,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2c76ffc0-b103-45c3-98bd-6ed3820f089a','_WF_Activity','','AlertRule','AlertRule',1,140,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2d385412-bd84-47d8-897b-0c2139d381f2','_Sys_User','','UserName','用户名',0,20,100,'center',1,'#','','',1,1,1,'string,100,0,1,0',1,1,1,1,1,0,to_date('2019-04-09 15:42:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2d7472d7-7e2d-4e58-a654-1e9d725bf5db','WF_Activity','','IsEnableTransmit','IsEnableTransmit',0,260,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2dfaad67-c75b-43b5-a690-ebb27a3973b2','_Sys_Organization','','OrgID','OrgID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('2e86407b-7d80-45ee-9d6b-32185f7e08d8','V_Test','','F5','F5',0,60,100,'center',1,'','','',1,1,1,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('311fb6bd-2025-40fd-a78a-4ec4f152df9d','WF_TaskInstance','','IsCompleter','IsCompleter',1,270,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('32b8d8f4-11fd-4bfc-8f7a-8732063c4831','WF_Activity','','OutType','OutType',0,200,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3376d4d9-d12a-425d-a016-e10d4263750e','Sys_Organization','','OrgID','OrgID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('33a68b4d-c4f1-4d7d-8350-46d583d4e5af','TestA','','F4','自定义Editor',0,50,100,'center',1,'','','fnEditor',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('347a1c34-e085-4572-bd8c-b1bb58af0fd2','V_SYS_UserList','','Password','密码',1,40,100,'center',0,'stringFormatter','','',1,1,0,'string,300,0,1',1,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3493d04d-4261-4c91-9372-cb2c44048619','WF_TaskInstance','','TaskState','处理状态',0,60,60,'center',1,'#WF_TaskState','','',1,1,0,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('356d85db-bd20-49c4-aa5c-9f8b0a62a859','WF_App','','FormPath','表单Url',0,90,160,'center',1,'stringFormatter','','',1,1,1,'string,500,0,0,0',1,1,0,1,1,0,to_date('2018-08-30 18:53:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('36180707-e631-4458-bff1-bdcecd8b93f7','WF_Activity','','DealHours','DealHours',0,150,100,'center',1,'stringFormatter','','',1,1,0,'single,53,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('365962eb-4b0a-4e5e-87fb-1bbb4f963203','_WF_Activity','','IsNotifyStartor','IsNotifyStartor',1,360,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('383948d3-0d7b-47a0-a014-033b89f713a6','Sys_Role','','Notes','备注',0,30,300,'center',0,'stringFormatter','','',1,1,0,'string,150,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:00:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('38935522-577a-4ef7-8b0b-a62bcf01a0e3','_WF_Activity','','IsEditForm','IsEditForm',1,70,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('38ae1e36-ce73-46fc-a6c5-2434b1f3b45c','V_WF_Task','','ActivityName','流程步骤',0,50,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('38e4d76e-c510-4624-a18c-6340d480d60e','Config_Grid','','GridID','操作',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('39ef9b02-2398-49e5-92ab-8f9868843c86','Demo_TestA','','mg_一级','F1-F2',0,11,100,'center',0,'','','',1,2,0,'string,50,0,0',1,1,1,0,1,0,to_date('2016-10-15 21:51:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3a03941a-eef9-4ee0-8253-1b0944af00d4','V_SYS_UserList','','Phone','工作电话',0,70,100,'center',0,'','','',1,1,1,'string,100,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3a37aa72-8801-4ee8-b7fb-6dc984184c61','_WF_Definition','','CreateTime','创建时间',0,30,200,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-05-02 02:39:05','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3aa4bf35-16e9-4bc5-a5b7-a5cb374c9270','WF_Definition','','Updator','Updator',1,100,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3bedb67a-42bb-4be3-b540-07427ac40c5e','_Sys_Organization','','OrgLevel','OrgLevel',1,50,100,'center',1,'','','',1,1,0,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3d330be7-eac6-426c-84aa-25db45f46626','V_SYS_UserList','','Email','Email',0,132,160,'center',0,'','','',1,1,0,'string,50,0,0',0,0,0,0,1,0,to_date('2016-09-06 18:17:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3d492426-6927-4506-981b-463431dd8141','MyTestExtend','','CreateTime','CreateTime',0,40,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,1,1,1,0,to_date('2018-03-07 11:44:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3de5a99c-22f1-42cf-8f8b-4a0e687ad533','WF_Instance','','InstanceID','InstanceID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('3de68456-fd6c-4e9d-b96f-bff50c372a86','Config_KeyValue','','OrderNo','排序号',0,70,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('416d3cdb-3767-4b7c-aa03-f6ee762ce36c','Config_Grid','','Editor','编辑函数',1,230,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('419cea93-1477-4469-b62a-fad8de6daafe','_WF_Activity','','ActorParser','ActorParser',1,110,100,'center',1,'stringFormatter','','',1,1,0,'string,200,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('45055528-835a-4e96-b130-df4bf8a00898','MyTestExtend','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,1,1',0,0,1,0,1,0,to_date('2018-03-07 11:44:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4518811e-f7e0-4723-898b-402e4c5c191e','Demo_TestA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,1',0,1,1,0,1,0,to_date('2016-08-10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4519c1a0-3bfa-4347-a7ee-df7575297b8f','V_TestAAA','','Title','标题',0,30,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-04-13 19:15:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('45555602-26fa-4d87-a532-4e9e26316da2','Config_Grid','','Rules','格式规则',0,210,200,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4601ffb8-6dd5-4a8e-a387-1fa352faf0bc','WF_Activity','','SplitRuleParam','SplitRuleParam',0,240,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('47240707-25e1-461e-8e49-dcbe804be47d','WF_Definition','','IsEnableWithdraw','退回',0,40,50,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('47cb6912-8e5b-4c32-a704-92923e27295a','Sys_Role','','RoleID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,1,1,0,to_date('2016-05-09 09:00:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('48052f3f-85ec-4c64-8059-a49faade400d','WF_Activity','','SubAssembly','SubAssembly',1,480,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('49d04e2b-544d-47e0-84c0-d0701eb300e0','Config_Grid','','Title','列称',0,50,100,'left',0,'','','',1,1,1,'string,50,0,1',1,1,1,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4a471fb3-e7b1-4703-b517-38f395e1f24c','_WF_Activity','','FormPath','FormPath',1,550,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4a59125d-6d89-40e4-a2e0-e14d092fad25','WF_TaskInstance','','IsTransmit','IsTransmit',1,380,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4afdb5d7-c29b-4f15-a802-9ee3ea03ba5f','WF_App','','CreateTime','创建时间',0,120,60,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,1,0',1,1,0,1,1,0,to_date('2018-08-30 18:53:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4b176675-a232-466f-88a4-55bcf5331fe1','Demo_Tree','','CreateTime','创建日期',0,40,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,1,1,1,0,to_date('2016-08-31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4b9595b5-0f02-442e-924e-68f8e691d427','WF_TaskInstance','','FromTaskID','FromTaskID',1,20,100,'center',1,'','','',1,1,0,'guid,36,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4bc12442-5363-4bd4-a484-27cacce6e448','_Sys_Role','','RoleName','角色名称',0,20,220,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1,0',1,1,1,1,1,0,to_date('2019-04-09 05:38:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4bf669f4-da41-4ace-9c29-b005de63624e','WF_Instance','','MainInstanceID','MainInstanceID',1,230,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4c2ca77d-fdcb-477f-a828-a0e593fe54f5','_WF_Activity','','Remark','Remark',1,180,100,'center',1,'stringFormatter','','',1,1,0,'string,300,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4dcdb9ae-c75c-4ef8-9827-f4b24cb8b9cd','_WF_Activity','','IsDeleted','IsDeleted',1,80,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4e989e45-7332-4c44-b245-ca4851bc7a59','WF_Activity','','IsActorSpread','IsActorSpread',1,530,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4eb3d51f-7315-4a38-9f5b-26698373b93e','Config_Grid','','MergeIndex','行索引',1,888,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4ed1c409-ea04-4c79-b35d-4738dc61f5c5','WF_Definition','','Remark','备注',0,60,200,'center',1,'stringFormatter','','',1,1,0,'string,3000,0,0,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4f8d750e-3700-4d05-bc88-6a9992a9b1a7','WF_Activity','','Width','Width',1,420,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('4fda00e6-62f9-4eb6-a18e-db78cd177409','WF_Activity','','IsDeleted','IsDeleted',0,80,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('505442a9-41bf-4590-8516-63397a844fc9','WF_App','','Creator','创建人',0,110,60,'center',1,'','','',1,1,1,'string,50,0,0,0',1,1,0,1,1,0,to_date('2018-08-30 18:53:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('51759dab-2828-4273-a044-51a31cc53d31','MyTest','','Password','密码',0,30,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-06-05 21:03:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('53770b6b-f647-4af8-ba11-24c4b47a9457','WF_Definition','','IsShowFlowMap','显示流程图',0,30,70,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5393acb4-6294-46ff-8054-c387f6f41a7f','_WF_Activity','','RejectType','RejectType',1,350,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('54b485ed-b4a7-4dd2-80b7-83e5a2d9e08a','Config_Excel','','ExcelID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('55243ce2-adf4-4cef-9040-9b806984b7a8','Config_KeyValue','','CreateTime','创建日期',0,80,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5613038a-75f7-4558-83f1-390871c2689a','WF_Definition','','IsEnableInvalid','作废',0,42,50,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('567b9e45-3823-40e5-91ce-eff29b9b7594','WF_Activity','','MessageTemplate','MessageTemplate',1,370,100,'center',1,'stringFormatter','','',1,1,0,'string,1000,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('573de86e-5405-4556-a967-40a325a13426','WF_Activity','','ActivityFormPath','ActivityFormPath',1,490,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('575f9939-c4ba-4a84-acb0-31045b52d005','Config_Excel','','CreateTime','创建日期',0,80,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('584c48a0-559d-47ec-ae25-22a138c9ec4e','Demo_TestB','','mg_表头','二级表头',0,15,100,'center',0,'','','',1,2,0,'string,50,0,0',1,1,1,0,1,0,to_date('2016-10-15 23:48:44','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('593f0be4-ebe1-4ca9-a6d9-a9b227bcd8fd','V_SYS_UserList','$:{tree:true,pattern:"likeor",multiple:true}','OrgIDs','组织部门',0,200,180,'center',0,'#C_SYS_Org','','',1,1,1,'string,50,0,0',0,1,0,0,1,0,to_date('2018-09-06 21:23:38','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('59b20311-abc0-4833-83b6-8fa48b1b5c62','V_SYS_UserList','','CreateTime','创建日期',1,140,100,'center',0,'创建日期','','',1,1,0,'datetime,23,3,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5a0c0379-0a28-413c-8b06-e5a771fc4324','WF_TaskInstance','','UserID','UserID',1,90,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5a6da57e-a15f-401a-af84-09a143be7dfe','_WF_Activity','','Creator','Creator',1,290,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5aaf4825-c13a-4db3-b9d2-ab484a7423db','Config_Grid','','Edit','编辑',0,95,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5ba83bab-bb91-4fd6-9af7-8fc9c673223c','_Sys_Role','','Notes','说明',0,30,300,'center',1,'stringFormatter','','',1,1,0,'string,150,0,0,0',1,1,1,1,1,0,to_date('2019-04-09 05:38:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5c10f192-4c54-45a4-9d21-3de77e1efecc','WF_Activity','','IsOpinionRequire','IsOpinionRequire',0,100,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5c6f7d3f-180b-413e-8214-15bf78df48b9','_WF_Activity','','DealHours','DealHours',1,150,100,'center',1,'stringFormatter','','',1,1,0,'single,53,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5d324cfa-383c-4c20-bc9e-6d66d977693e','Demo_TestB','','FK','FK',0,60,100,'center',1,'stringFormatter','','',1,1,1,'string,1000,0,0',1,1,0,1,1,0,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5e0292e8-fad9-49f6-98a9-6f19b8acc0e4','V_SYS_UserList','','UserName','账号',0,20,100,'center',0,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,0,0,1,1,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('5ea600c5-6227-41e3-9727-f3efa6ee89fa','_WF_Activity','','Height','Height',1,430,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6130d475-6897-4113-b6a5-2380ccd59e97','_Sys_Organization','','OrgCode','编号',0,40,100,'center',1,'stringFormatter','','',1,1,1,'string,300,0,1,0',1,1,1,1,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('61484156-87da-4f35-a8a2-27e5dac294da','_WF_Activity','','IsEnableTransmit','IsEnableTransmit',1,260,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('618bb6c8-7701-48a5-a043-a5c866131771','WF_Activity','','IsNotifyStartor','IsNotifyStartor',1,360,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('626652da-1073-4c21-a171-b4dc87b8faa2','Demo_Area','','PCode','PCode',0,40,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6284c11b-1e10-44d4-aa7a-9af451cc8988','V_TestAAA','','Name','Name',0,50,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,null,0,to_date('2017-04-13 19:15:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('62ccd899-d584-40af-8894-f76feb334819','WF_TaskInstance','','StepID','StepID',1,70,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('648889ea-fb6b-4e89-882d-12f49c6498cd','V_SYS_UserList','','UserInfoID','UserInfoID',1,150,100,'center',0,'','','',1,1,0,'guid,16,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('64de5abb-db02-4ebb-96ac-1bd157c6a640','WF_TaskInstance','','Mobile','Mobile',1,420,100,'center',1,'','','',1,1,0,'string,16,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('652e8443-01b0-40db-9f4b-c5e9d4b2745b','_WF_Activity','','PositionX','PositionX',1,400,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('672ea915-78a3-4caf-b800-4062c8ef23a6','Config_ExcelInfo','','IsForeignkey','外键',0,80,80,'center',1,'boolFormatter','','',1,1,1,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('67a50f16-a471-4d7d-b1a4-ffd55b016ca5','_WF_Activity','','IsHistoryActorPriority','IsHistoryActorPriority',1,500,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6880f7ec-d22f-4d28-b5eb-c647515ad2fb','WF_Activity','','Remark','Remark',0,180,100,'center',1,'stringFormatter','','',1,1,0,'string,300,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6898608b-0b86-4cf3-9e51-dd8bfa7c6b72','WF_Instance','','CreatorID','CreatorID',1,100,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('68d4787b-8f03-4272-93ed-cd4faebcb88d','MyTestExtend','','MyTestID','MyTestID',0,20,100,'center',1,'','','',1,1,0,'int32,10,0,0,0',1,1,1,1,1,0,to_date('2018-03-07 11:44:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('69049314-5507-47d7-a543-293df433acc3','WF_Activity','','IsEditForm','IsEditForm',0,70,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('691b4283-2d5e-489c-988c-dccc8c47734f','V_Test','$:{configkey2:''''''''}','F2','F2',0,30,100,'center',1,'#是否','','',1,1,1,'boolean,1,0,0',1,1,1,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6926db39-5a1b-474a-8a49-8c3ade5e8a80','Config_KeyValue','','ConfigName','配置名称',0,30,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,1,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('695e45f2-95cf-41a6-9722-e21247bf3033','WF_Activity','','IsHistoryActorPriority','IsHistoryActorPriority',1,500,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6a1e3b53-394d-4de0-9acf-0691a033f75b','WF_Activity','','FormPath','FormPath',1,550,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6ab9641e-5733-45b6-8468-029387c7f816','Demo_Tree','','ParentID','ParentID',0,30,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,1,0,1,0,to_date('2016-08-31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6bad4445-d192-4cdc-b3d8-f696ed5d0dff','Sys_Role','','RoleName','角色',0,20,200,'center',0,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,1,1,1,0,to_date('2016-05-09 09:00:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6bea6a55-4c50-4caa-abd5-65d45ac7abb4','_WF_Activity','','ExtendExcuteAssembly','ExtendExcuteAssembly',1,390,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6dd5a8ad-d83c-4f3e-a562-5d1c55322876','V_Test','','FK','FK',0,100,200,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6e55dcfa-978c-4b83-bb65-3ae25181747f','V_WF_Task','','CreatorFullName','提单人',0,53,60,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 11:59:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6e5f066a-266e-490e-bd27-6f766b42bc82','Demo_Area','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,1',0,1,1,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('6f8853fa-4a2f-4d68-8de6-f300c79ab24d','WF_TaskInstance','','RespondType','RespondType',1,260,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7004642a-1ee2-4cc8-8d79-cb66baab0830','_WF_Activity','','UpdateTime','UpdateTime',1,300,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('70e6ef29-d91f-4028-90e3-eeecf55c4a5f','WF_Activity','','IsShowOpinion','IsShowOpinion',1,460,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('71633365-79ee-4bf8-bade-eaf2b64b0689','V_Test','','mg_00','一级表头',0,10,100,'center',0,'','','',1,4,0,'string,50,0,0',0,1,1,0,1,0,to_date('2016-10-14 00:13:41','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('727d5700-ba89-4f42-832b-e476a4654452','Sys_Area','','Sort','Sort',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7286b1ba-1b12-439e-b305-c6fbd6147c1c','_WF_Definition','','WorkflowName','流程名称',0,20,300,'center',1,'','','',1,1,1,'string,50,0,1,0',1,1,1,1,1,0,to_date('2019-05-02 02:39:05','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('72fe612a-f35c-4301-aec3-48781a36f79a','V_SYS_UserList','$:{defaultValue:''''1''''}','Sex','性别',0,60,50,'center',0,'#性别','','',1,1,0,'boolean,1,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('74cccabc-739a-42b7-a730-19cd3318685e','_WF_Activity','','Updator','Updator',1,310,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7631c0f2-cff2-4259-b7b4-2c5bd266c690','WF_App','','WorkflowName','流程名称',0,25,200,'center',1,'editFlow','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-05-07 21:46:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('766f0042-7ac8-4054-a51a-f6f38d332430','_WF_Activity','','ProcessType','ProcessType',1,580,100,'center',1,'','','',1,1,0,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('768f7874-7323-4977-9c2d-b81625006582','TestABC','','CreateTime','创建日期',0,30,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,1,1,null,0,to_date('2017-04-13 18:04:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('76f8e451-29a8-4ca1-bf37-11438aa0fede','Config_KeyValue','','Notes','备注',0,60,100,'center',1,'stringFormatter','','',1,1,0,'string,1000,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7818505b-d8fc-467f-a31b-b0f8df331d5a','Demo_Area','','Desc','Desc',0,70,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('783b2307-5c6c-4918-9651-83c335897749','V_Test','$:{clone:true}','F4','F4',0,50,100,'center',1,'','','',1,1,1,'int32,10,0,0',1,1,1,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('78a5224d-9a92-43f1-8319-4d175d9744b1','V_MyTest','','Password','密码',0,30,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-06-05 21:08:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('78ba2b90-7cd4-4c8f-b48b-c34e3363a9bd','WF_TaskInstance','','CreateTime','到达时间',0,40,100,'center',1,'','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('79313eeb-84f4-4fa4-abe1-49b8fa405536','Config_Grid','','Field','字段',0,40,110,'left',1,'','','',1,1,1,'string,40,0,1',1,1,1,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7981a803-7367-4f8a-8a4a-d15cf4320980','_WF_Activity','','ActorParamter','ActorParamter',1,120,100,'center',1,'','','',1,1,0,'string,-1,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('79ef80b4-c99e-4329-80d1-75bc6982827e','Demo_Area','','Sort','Sort',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7a88cb33-5b49-41d2-9430-f4e73407ab39','_Demo_TestA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,1',0,1,1,0,1,0,to_date('2016-09-05 01:58:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7b8a7f4b-6099-4076-860f-53f995492609','WF_Activity','','JoinType','JoinType',0,210,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7babd9f8-9b09-4628-9cb8-518ed4776f04','V_SYS_UserList','','UserID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,16,0,1',0,1,1,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7d29120c-3d67-4825-969a-c34bc4617b5a','_WF_Activity','','WorkflowID','WorkflowID',1,20,100,'center',1,'','','',1,1,0,'guid,36,0,0,0',1,1,1,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7d3da9f3-8a76-43d3-a476-ab142df3ec05','V_WF_Task','','InstanceState','流程状态',0,60,50,'center',1,'#WF_InstanceState','','',1,1,1,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7d481800-9809-4e95-a23b-d5046fe1e746','WF_Instance','','WorkflowID','WorkflowID',1,30,100,'center',1,'','','',1,1,0,'guid,36,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7e283fea-ad3b-4099-91b1-4984faa09032','V_WF_Task','','UserID','UserID',1,255,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 16:30:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7e976e26-10a5-46fe-a7d7-d25b25a9a380','WF_TaskInstance','','ActivityInstanceID','ActivityInstanceID',1,190,100,'center',1,'','','',1,1,0,'guid,36,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7f33f0dc-1868-46ff-b76c-c04b78753916','WF_Activity','','ProcessType','ProcessType',1,580,100,'center',1,'','','',1,1,0,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('7ff6c059-f76f-458b-b76c-033208044b21','V_Test','','F6','F6',0,70,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('80864f96-df08-49a1-bd26-181662a65e25','V_SYS_UserList','$:{defaultValue:1}','Status','状态',0,90,50,'center',0,'#账号状态','','',1,1,0,'int32,10,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('81ca1ac9-0298-42a4-8bce-5fe35d1b0fa7','WF_Instance','','Importance','Importance',1,180,100,'center',1,'','','',1,1,0,'byte,3,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('844685be-4b48-43bf-b6ea-f749e2d3149e','Config_Grid','','Rowspan','跨行',1,866,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('84cd5d24-cb53-4a29-b028-d56b13536a64','_WF_Activity','','ExpirationRule','ExpirationRule',1,160,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('84e25bb1-be82-4369-9f0f-076dd9928051','WF_Instance','','Urgency','Urgency',1,170,100,'center',1,'','','',1,1,0,'byte,3,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('85405c38-10cc-4807-ac43-f3460b8c4110','WF_Activity','','Creator','Creator',1,290,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('859f99a9-2444-4c34-bcd8-ca9d411a0021','_Demo_TestA','','CreateTime','日期',0,100,100,'center',0,'','','',1,1,0,'datetime,50,0,0',0,0,0,0,1,0,to_date('2018-09-10 21:55:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('870f7c3f-3c65-489f-819c-db6b3f198212','WF_Instance','','OpenBizDate','OpenBizDate',1,20,100,'center',1,'','','',1,1,0,'string,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('876e09ba-b754-4f24-bdca-db4e9703129b','Sys_Area','','Code','Code',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('87b36212-0614-4d5e-b3ea-73909922080a','_WF_Activity','','PositionY','PositionY',1,410,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('87dba7eb-29b4-4d9a-87c5-9790295ad26e','Demo_Area','','Lvl','Lvl',0,60,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('88a659a3-4712-4aae-9ffe-ac96dc742783','WF_Instance','','AppID','流程别名',0,11,60,'center',1,'','','',1,1,1,'string,50,0,1,0',1,1,1,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('88d0d163-72a0-4772-a6f1-7d7efdadbbcc','_WF_Activity','','AutoOutAssembly','AutoOutAssembly',1,440,100,'center',1,'stringFormatter','','',1,1,0,'string,800,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('891a5b31-981e-4d4e-82ea-820ca7140948','_Sys_User','','FullName','姓名',0,30,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1,0',1,1,1,1,1,0,to_date('2019-04-09 15:42:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('89fb657c-3829-4a64-8412-af6a86fe08bf','WF_Definition','','WorkflowName','流程名称',0,20,200,'center',1,'','','',1,1,1,'string,50,0,1,0',1,1,1,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8a5510bd-3318-4450-b8e5-c7a1e0b4603c','Sys_Action','','IsEnabled','是否启用',0,40,100,'center',0,'boolFormatter','','',1,1,0,'boolean,50,0,0',0,0,1,1,1,0,to_date('2016-10-26 15:50:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8b1f4a99-1826-400d-8e15-720576900a0e','WF_Instance','','CreatorOrgID','CreatorOrgID',1,130,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8cfa1f35-efb1-43a4-8cf5-75471622ea03','Sys_Area','','Name','Name',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,1,1,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8d085aab-6484-42f9-a7ed-17459ebb602a','V_SYS_UserList','','PwdExpiredTime','密码过期时间',1,50,100,'center',0,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8e09bd3c-6c3d-4eae-baa5-02f58973b953','Config_Excel','','TableNames','相关表名',0,40,300,'center',1,'stringFormatter','','',1,1,1,'string,400,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8ed9d34c-15dc-4124-bdc6-a5b948edba66','WF_TaskInstance','','IsCirculate','IsCirculate',1,350,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8f52ce43-43a6-4e3b-ba29-62d9338d077f','V_Test','','ID','ID',1,5,100,'center',0,'#','','',1,1,0,'string,50,0,0',0,0,1,0,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8fb1be24-0604-40a0-bccf-5ac7e6ffa2f5','WF_Activity','','NotifyType','NotifyType',1,340,100,'center',1,'','','',1,1,0,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('8ffdd5da-ac3d-456f-9c1a-fe28af378f3b','WF_Activity','','PositionX','PositionX',1,400,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('90ea31e4-df23-4a5f-89f1-758cf57bdf4a','MyTest','$1','CreateTime','创建时间',0,40,100,'center',1,'dateFormatter','','',1,1,1,'datetime,23,3,0,0',1,1,1,1,null,0,to_date('2017-06-05 21:03:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('923bad02-096f-4671-84c0-9fd20318f363','WF_Activity','','EnterType','EnterType',0,190,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('934ee883-6017-4c13-bc01-21cbb5f1115f','WF_Activity','','AlertRule','AlertRule',0,140,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('94408e99-112c-4fd5-b01c-7abaa2230232','Config_ExcelInfo','','ExcelID','ExcelID',1,20,100,'center',1,'#','','',1,1,0,'guid,36,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('945406d9-0413-4fcf-9b7d-980f7bd19dc0','Config_Excel','','StartIndex','起始行索引',0,50,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('95c85991-697e-460e-bd64-0b3059457e7b','Config_KeyValue','','Flag','分类标记',0,50,100,'center',1,'stringFormatter','','',1,1,1,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9631c562-e129-4b18-81bc-44e688eb8b26','V_SYS_UserList','','FullName','姓名',0,30,100,'center',0,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('969fd082-c2dc-4695-8530-c59cf2ac6909','V_Test','','mg_fk','Fk表头一只',0,85,100,'center',0,'','','',1,2,0,'string,50,0,0',0,0,0,0,1,0,to_date('2016-09-24 01:56:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('983652ec-9bef-4a5a-9a20-2d5c02cd54c3','Sys_Area','','PCode','PCode',0,40,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9847d034-bac6-4097-9a98-c67a2467f875','_WF_Activity','','EnterType','EnterType',1,190,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('984ffbad-e506-483b-bb2a-647f4e8f5a78','WF_App','','AllowRoleIDs','限制访问的角色',1,255,100,'center',1,'stringFormatter','','',1,1,0,'string,740,0,0,0',1,1,0,1,1,0,to_date('2019-05-07 21:46:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('989739ee-45b6-4251-bf0d-4e26c1ba27cc','WF_TaskInstance','','FullName','处理人姓名',0,25,60,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('99d09a0f-5c7e-4b05-8b4a-06f6e185acdb','TestCCC','','KeyA','第二个主键',0,55,100,'center',1,'','','',1,1,0,'int32,10,0,1,1',1,1,0,1,1,0,to_date('2018-09-04 18:46:32','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9a01f38b-6d36-45f9-9524-6bbf6efe97eb','Config_Grid','','Width','列宽',0,80,30,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9b8e918e-82f1-4f56-9e00-a755eed423b8','WF_Activity','','CirculateType','CirculateType',1,450,100,'center',1,'','','',1,1,0,'byte,3,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9beed9fd-c0bf-43d1-b245-0e41ada7fb3c','WF_TaskInstance','','TaskID','TaskID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9c2b44fd-e6b7-4723-a5a3-283d8a371227','V_Test','','mg_02','三级表头',0,12,100,'center',0,'','','',1,2,0,'string,50,0,0',0,1,1,0,1,0,to_date('2016-10-13 14:58:32','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9d1c54c8-8573-415c-a693-cdb03a46a8e5','Config_Grid','','Sortable','排序',0,100,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9d5e40a6-d202-4a63-b0ab-82c5f03bfe64','TestCCC','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,1,1',0,0,1,0,null,0,to_date('2017-04-14 21:23:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9d77c22f-61ba-4a59-acde-96b753bc6791','WF_TaskInstance','','UserName','处理人账号',0,20,60,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('9f0ab15c-f0a8-489e-b7c5-9d69f575972a','WF_Definition','','IsEnableTransmit','转交',0,38,50,'center',1,'boolFormatter','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a06c52de-7592-489b-a458-5b3bd6a42c10','WF_Definition','','IsEnableCirculate','传阅',0,36,50,'center',1,'boolFormatter','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a0b3cafa-755e-4f64-93a9-5be5dde3b697','WF_TaskInstance','','InstanceID','InstanceID',1,40,100,'center',1,'','','',1,1,0,'guid,36,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a1266fd6-58e3-415d-b2b0-fd4eac90f0f1','WF_Definition','','Creator','创建者',0,50,100,'center',1,'','','',1,1,1,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a154a2f8-e178-44fb-b4cc-d5c136702908','Demo_TestA','','F1','F1',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0',1,1,1,1,1,0,to_date('2016-08-10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a20db50c-aa42-4b56-83d3-bece3b5f1f01','WF_App','','AppName','应用名称',0,20,200,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1,0',1,1,1,1,1,0,to_date('2018-08-30 18:53:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a3a73203-376c-4128-8859-0f4b9c5bf7a8','WF_Activity','','ExpirationRule','ExpirationRule',0,160,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a4745393-d50f-4eea-acc6-6ff51faa3166','TestA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-05-10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a4f8ed56-57a4-40e1-b936-83fe4925ccb4','WF_Activity','','IsShowOpinion','IsShowOpinion',0,90,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a5119991-0587-4395-ae55-db2bd1729af7','WF_Definition','','IsDeleted','IsDeleted',1,70,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a5369a0d-3bb1-48cd-8ae4-8a919a85b868','WF_Activity','','StepID','StepID',0,30,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,1,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a5d60154-f410-40b0-aa88-c67f33813dfe','WF_Activity','','ActivityName','ActivityName',0,40,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,1,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a604a061-54d8-4217-8779-f29ea842c7d5','_WF_Activity','','SplitRuleParam','SplitRuleParam',1,240,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a62ce6fe-7e82-4534-8bbe-bf220c5041ae','Config_Grid','','ImportUnique','唯一',0,158,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a65e05c2-a2ff-4c01-b91c-21682064b4c1','Config_ExcelInfo','','Formatter','格式化',0,60,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a6ec197d-437d-467b-87cc-fbd90f9649bb','WF_TaskInstance','','ActivityName','处理步骤',0,10,80,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a7e68314-9e17-4c8a-87b8-1aa61bf0bcda','WF_Instance','','CreatorFullName','提单人',0,40,60,'center',1,'','','',1,1,1,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a7fe6cc7-d328-4b92-a896-52790e58d2e9','_Sys_Organization','','ParentOrgID','ParentOrgID',1,60,100,'center',1,'#','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a809dc10-09a8-4ef0-af0a-a5f3fda7e086','WF_Activity','','UpdateTime','UpdateTime',1,300,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('a8409a51-6ee2-4c51-8a26-6243598531ad','TestCCC','','CreateTime','时间',0,30,100,'center',1,'now()','','',1,1,0,'datetime,23,3,0,0',1,1,1,1,null,0,to_date('2017-04-14 21:23:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('aa2b1d92-70cb-436d-8027-08299ba1e422','_WF_Activity','','ActivityID','ActivityID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('aae8f76e-9b5e-4dbd-a827-0557951ca056','Config_Grid','','Align','对齐',0,90,50,'center',0,'#对齐方式','','',1,1,0,'string,10,0,1',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('aaf793ef-433e-4a3f-ac9b-efc469ed8582','_WF_Activity','','JoinRuleParam','JoinRuleParam',1,230,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ac06609c-3b0c-4a33-9d1e-99a123d1353c','WF_Activity','','WorkflowID','WorkflowID',0,20,100,'center',1,'','','',1,1,0,'guid,36,0,0,0',1,1,1,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ac291490-83e4-4b73-9af5-493bbd3440e4','Sys_Organization','','CreateTime','创建日期',0,70,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ac83943e-7419-4506-8b79-40550af5c76b','Demo_TestB','$1:{multiple:true}','F7','F7',0,40,100,'center',1,'#C_PB_Province2','','',1,1,1,'string,100,0,0',1,1,1,1,1,0,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ad49b8f1-c67f-4781-993f-10aef3f1b75d','Sys_Area','','ID','ID',0,10,100,'center',0,'','','',1,1,0,'int32,10,0,1',0,1,1,0,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ad66ef1f-e428-4d12-a820-2f2c44464d6c','_WF_Activity','','CirculateActor','CirculateActor',1,380,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ad991995-8fdf-435b-847e-84a819642c5f','Config_Excel','','WhereType','条件方式',0,65,100,'center',0,'#异或','','',1,1,0,'string,50,0,0',0,0,0,1,1,0,to_date('2016-10-15 02:22:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ae0049ad-71e4-4936-a932-2e2bfd048eaf','Config_Grid','','Search','搜索',0,107,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ae8168fb-fd4b-4034-a7d3-e8de57302e26','V_WF_Task','','AppName','流程名称',0,55,80,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('afb5acfd-30f8-4345-b882-c30aca58b83f','MyTestExtend','','FullName','FullName',0,30,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,1,1,1,0,to_date('2018-03-07 11:44:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b0af5ed8-2eae-4a27-af16-bb87943dfc91','WF_Instance','','InstanceState','流程状态',0,17,50,'center',1,'#WF_InstanceState','','',1,1,1,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b130f234-b7fc-42dc-bb9f-5f8f52978450','WF_TaskInstance','','AppID','AppID',1,50,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b15afd26-cbb8-4871-9840-246030773665','TestABC','','Name','名称',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-04-13 18:04:51','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b175bd9a-a4f8-4399-b8e8-36a1acdd0905','_WF_Activity','','NotifyType','NotifyType',1,340,100,'center',1,'','','',1,1,0,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b2be917a-7f84-4fc2-bf94-a739e2f5ba35','_WF_Activity','','IsActorSpread','IsActorSpread',1,530,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b2e1e7c6-beb3-43b1-9364-0da26758d9ab','TestCCC','','MyValue','MyValue',0,255,100,'center',0,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2018-09-03 02:29:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3169ed5-17ec-477d-9512-ff97441fe55e','WF_TaskInstance','','FromCreator','FromCreator',1,360,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3176d7e-8f30-47fb-94b4-72ea863f0edf','Config_Grid','','LastEditTime','LastEditTime',1,999,100,'center',0,'dateFormatter','','',1,1,0,'datetime,23,3,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3324959-716d-4b61-8974-3c0a8bd4b734','V_WF_Task','','InstanceID','InstanceID',1,255,100,'center',1,'#','','',1,1,0,'guid,16,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 17:03:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3556c02-3495-4d73-84b0-f5bb2580d0eb','Config_ExcelInfo','','TableName','表名',0,40,100,'center',1,'#C_SYS_Table','','',1,1,1,'string,100,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b379a08c-9aff-4b7f-8223-176583e345a2','Config_KeyValue','','ConfigValue','配置值',0,40,150,'center',1,'stringFormatter','','',1,1,0,'string,300,0,1',1,1,1,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b3f55684-ec71-478c-b4d4-9fa994d9f5c8','TestA','','F2','F2',0,30,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,1,1,1,0,to_date('2016-05-10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b4b3b655-0577-4e91-926d-41c5e9ddd955','Sys_Area','','Desc','Desc',0,70,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b7259b59-2248-47df-bfa5-21dbaf2ce0d9','Demo_Area','','Code','Code',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b7a8def3-caf8-4d61-936d-28c4f34ba3de','Config_Excel','','Description','模板描述',0,35,180,'center',1,'','','',1,1,1,'string,50,0,0',0,1,1,1,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b800aa35-40b4-4c35-bf33-0b20978e7db4','WF_Activity','','PositionY','PositionY',1,410,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b83f25c0-d17b-4b28-89ea-1596a0e293d3','Config_Grid','','DataType','类型|长度|精度|必填|主键',0,1000,150,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b91c6dee-98e7-44a5-a561-846026b0ac4c','V_SYS_UserList','','LastLoginIP','最后登录IP',0,120,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('b9952c4e-1964-4fa8-b045-74a590ecb1a7','V_TestAAA','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,1,1',0,0,1,0,null,0,to_date('2017-04-13 19:15:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bac06068-33f1-48fb-977d-6252e32b627b','WF_Activity','','Height','Height',1,430,100,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bacfbae3-1acd-405f-a853-70c490359ea4','_Sys_Organization','','OrgName','名称',0,20,200,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1,0',1,1,1,1,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bae48943-b743-44ee-a066-aae1891e879a','_Sys_User','','Email','邮箱',0,80,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0,0',1,1,0,1,1,0,to_date('2019-04-09 15:42:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bbce3f99-e2e0-4437-ab55-c5064d23f568','WF_Activity','','CirculateActor','CirculateActor',1,380,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bc885b93-5c1c-4930-b9b1-16b875af4725','Config_ExcelInfo','','ExceInfoID','ExceInfoID',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bcfaf8e0-0f20-439c-87ba-fc053839718d','V_SYS_UserList','$1:{defaultValue:''''2007-11-11,2117-12-12''''}','LastLoginTime','最后登录时间',0,110,100,'center',0,'dateFormatter','','',1,1,1,'datetime,23,3,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('bdfe373f-5e21-4a30-9f38-8d590349eeec','MyTest','$1','Name','名称',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-06-05 21:03:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c25d1766-10f6-4fb8-b8a2-0c3ae48ec2d7','WF_Activity','','ActivityCode','ActivityCode',1,540,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c2a855cc-385d-42c6-b691-d8f0aa98f987','V_WF_Task','','IsCirculate','IsCirculate',1,255,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 12:08:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c50abf17-f51e-4451-bf16-7a47d323c20c','V_SYS_UserList','','LoginCount','登录次数',0,100,60,'center',0,'','','',1,1,0,'int32,10,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c51e7d87-7076-44c6-9e22-62b370829f9b','Config_KeyValue','','KeyValueID','主键',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c5d2a39b-0d0e-43c3-b6f4-e8cfb46f6d4e','TestA','','F1','F1',0,20,100,'center',1,'','','',1,1,0,'string,50,0,0',0,1,1,1,1,0,to_date('2016-05-10 15:48:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c6324c64-e1a6-4040-941d-b0a5f090dcc9','V_Test','','F7','F7',0,80,100,'center',1,'','','',1,1,0,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c718fbe3-1761-40fd-bbbb-e89d82d98449','WF_TaskInstance','','ActivityID','ActivityID',1,200,100,'center',1,'','','',1,1,0,'guid,36,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c9283c29-92ed-47f9-87aa-42ec67a41f11','Demo_TestB','','F8','F8',0,50,100,'center',1,'#C_PB_City2=>C_PB_Province2','','',1,1,1,'string,100,0,0',1,1,0,1,1,0,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c99c463d-41a0-47f8-a904-545784b8cef6','WF_TaskInstance','','FinishTime','完成时间',0,50,100,'center',1,'','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('c9f214b4-8a2d-4922-bad1-6fb922e5b8db','Config_Grid','','Export','导出',0,155,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cabf3942-b711-4bb3-9292-7a3eb76982fc','_Sys_Role','','RoleID','RoleID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-04-09 05:38:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cb3fc9d9-7594-4557-b6fa-ffe7a0effb7e','WF_Definition','','AreaMap','AreaMap',1,140,100,'center',1,'','','',1,1,0,'string,-1,0,0,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cb7f2d58-f86d-4ea2-9b61-a34f45536091','V_SYS_UserList','','AreaID','AreaID',1,190,100,'center',0,'','','',1,1,0,'guid,16,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cc6751b4-7e44-4d51-ab1e-7691d5f6e2fd','V_TestAAA','','CreateTime','CreateTime',0,40,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,0,0',1,1,1,1,null,0,to_date('2017-04-13 19:15:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cd6b946b-8621-4f2f-a440-09904cb1a2e5','_WF_Activity','','CirculateType','CirculateType',1,450,100,'center',1,'','','',1,1,0,'byte,3,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cd99cc96-0754-4f46-a9b8-1a84a68ef333','Config_ExcelInfo','','Field','表字段名',0,50,100,'center',1,'#C_SYS_Column=>C_SYS_Table','','',1,1,1,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cddc5b83-fb4c-485d-8a98-8d22463cfab3','V_WF_Task','','TaskState','状态',0,15,50,'center',1,'#WF_TaskState','','',1,1,1,'int32,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('cf28caf7-4549-4759-b4a2-ac5fc9299d54','WF_TaskInstance','','FromCreatorID','FromCreatorID',1,370,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d0ed60db-ce1d-40f4-aa26-e4240ab3c14d','WF_Activity','','ActivityID','ActivityID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d1a833d2-d5b9-4a80-8232-327fbc469178','Sys_Organization','','OrgFullName','组织全称',0,30,200,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1,0',1,1,1,1,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d21b620d-d528-4711-be6b-42a0efb8616f','_Sys_User','','Phone','手机',0,70,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0,0',1,1,0,1,1,0,to_date('2019-04-09 15:42:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d238d964-461f-4d38-a7ca-df659f684988','WF_Activity','','SplitType','SplitType',0,220,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d3ee57aa-80e3-44ff-8e39-40ae643d3f14','TestCCC','','MyName','名称',0,20,100,'center',1,'','','',1,1,1,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-04-14 21:23:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d4e0664b-758f-4fe8-b810-c35bb8cbfeb7','WF_TaskInstance','','OrgID','UserOrgID',1,120,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d5c624d3-6b58-457f-9b25-54b1587e0a99','WF_Definition','','Version','版本号',0,22,50,'center',1,'','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d7835554-e7de-4f53-8720-db2dc23b6a1e','_WF_Activity','','ExtendedProperty','ExtendedProperty',1,170,100,'center',1,'','','',1,1,0,'string,-1,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d7965d22-bf71-4ea3-b489-6e45f4cf84d3','_WF_Activity','','IsOpinionRequire','IsOpinionRequire',1,100,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d857419f-cec8-432d-96cc-e493ab074bd2','_WF_App','','AppName','应用名称',0,20,300,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1,0',1,1,0,1,1,0,to_date('2019-05-03 22:17:38','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d895e7f3-3409-4d6b-af1d-98217566cdcd','WF_Activity','','IsEnableInvalid','IsEnableInvalid',1,520,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('d8c6ee78-b4ee-4dda-a43e-71eee414ffc4','WF_App','','IsEnable','启用',0,100,40,'center',1,'#是否','','',1,1,1,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2018-08-30 18:53:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dbaf7728-f2ef-40c3-b0f9-f36905615d46','V_WF_Task','','InstanceTitle','标题',0,5,220,'center',1,'stringFormatter','','',1,1,1,'string,200,0,0,0',1,1,1,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dbb132fb-d072-42a3-858e-404794f430d3','WF_Definition','','UpdateTime','修改日期',0,120,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dc2c1c13-bd6f-4f32-822d-9ac95c567019','WF_TaskInstance','','IsValid','IsValid',1,340,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dc3bd7f6-85c6-423b-9b6e-753c260e8db1','Config_Grid','','OrderNum','序号',0,70,30,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dce7137b-7610-472f-ac01-4b9f3b5f6363','V_MyTest','','FullName','真实姓名',0,25,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,1,1,null,0,to_date('2017-06-05 21:08:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dd40ea93-ef36-405f-b7fb-3bf71446e386','Config_Excel','','HeadCrossRowNum','列头跨行数',0,60,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:00:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('dea533d7-030b-49e7-87f1-0a46b7b883d9','Demo_TestB','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,1',0,1,1,0,1,0,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('df481cf4-c773-465a-ab87-452ddeb65986','Sys_Organization','','OrgCode','组织编码',0,40,120,'center',1,'stringFormatter','','',1,1,1,'string,300,0,1,0',1,1,1,1,1,0,to_date('2018-09-06 19:12:13','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e1356447-8ed2-43b5-aa72-ec86c8c56674','sys_Action','','ActionRefName','代码引用名',0,30,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1',1,1,1,1,1,0,to_date('2016-05-09 09:00:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e15bf439-2917-4721-9752-f79b34551f19','V_WF_Task','','TaskID','TaskID',1,1,100,'center',0,'#','','',1,1,0,'guid,16,0,1,1',0,0,1,0,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e16223c1-c109-4e4c-87ac-6defcfd7d8a4','Demo_TestA','$:{configKey:"是否"}','F2','F2',0,30,100,'center',1,'boolFormatter','','',1,1,1,'boolean,1,0,0',1,1,1,1,1,0,to_date('2016-08-10 10:36:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e2cb16e2-a231-4498-a844-0a160da52be3','WF_TaskInstance','','WorkflowID','WorkflowID',1,60,100,'center',1,'','','',1,1,0,'guid,36,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e2e5cb59-81f6-4454-a0cb-e5465d89865f','V_SYS_UserList','','IsOk','IsOk',1,180,100,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e5642dea-5188-4f7d-8ab0-553ab439ea7e','WF_Definition','','IsShowOpinion','处理意见',0,32,60,'center',1,'boolFormatter','','',1,1,0,'int32,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e58e9559-4991-4b3f-9ae2-04882f06ffb1','WF_Definition','','IsEnableReject','允许退回',0,34,60,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e5adabee-3d5b-4b15-a18f-626fa4017af8','V_MyTest','','Name','名称',1,10,100,'center',0,'#','','',1,1,0,'string,50,0,0,0',0,0,1,0,null,0,to_date('2017-06-05 21:08:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e6968d2d-6680-4e21-9072-ad673dce02d9','V_WF_Task','','IsValid','IsValid',1,255,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 12:17:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e6e07ff7-e9c6-4e9f-997d-9cc646c378a4','WF_Activity','','Updator','Updator',1,310,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e8516610-802d-44c7-aa59-d56e9f61193a','_WF_Activity','','CreateTime','CreateTime',1,280,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('e8ad9ede-36bd-417a-9938-4f114a9c958c','WF_Activity','','AutoOutAssembly','AutoOutAssembly',1,440,100,'center',1,'stringFormatter','','',1,1,0,'string,800,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ea2ee9d5-50d7-4757-a9e1-657690e9413d','V_Test','','mg_a','F7-F8',0,13,100,'center',0,'','','',1,2,0,'string,50,0,0',0,1,0,0,1,0,to_date('2016-10-14 00:16:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ea621d30-e1d0-4f5d-a512-eab0bf7f3138','WF_Activity','','ActorParamter','ActorParamter',0,120,100,'center',1,'','','',1,1,0,'string,-1,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('eca570f8-e84d-4dd0-9c6c-f5dc16ba6d0c','Config_KeyValue','$:{objname:"C_SYS_ConfigKey"}','ConfigKey','配置键',0,20,160,'center',1,'stringFormatter','','',1,1,1,'string,100,0,1',1,1,1,1,1,0,to_date('2016-05-09 09:00:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ed6f016f-4cd9-46aa-b710-3116477e220a','V_Test','','F3','F3',0,40,100,'center',1,'','','',1,1,0,'decimal,8,2,0',1,1,1,1,1,0,to_date('2016-05-10 15:47:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ed817e80-8777-4369-9d74-b256005b182c','WF_Activity','','RejectActivity','RejectActivity',1,560,100,'center',1,'stringFormatter','','',1,1,0,'string,4000,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ed9c3034-0362-4a28-bd55-52c4c5e0aa93','Config_Grid','','Import','导入',0,157,30,'center',0,'boolFormatter','','',1,1,0,'boolean,1,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('eee3ac47-a47c-4a9e-a6b8-2129959bf908','Sys_Area','','Lvl','Lvl',0,60,100,'center',1,'','','',1,1,0,'int32,10,0,0',0,1,0,1,1,0,to_date('2016-05-09 16:34:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f03ef5aa-e364-421c-adb4-d50d5a61bfe0','Config_Excel','','AcceptType','导入方式',0,70,100,'center',0,'#导入方式','','',1,1,0,'string,50,0,0',0,0,0,1,1,0,to_date('2016-10-16 19:46:59','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f0924064-8e42-4594-b343-a4ec9c7cd94f','_WF_Activity','','OutType','OutType',1,200,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f18fdc4c-7e5a-45ec-b946-7b3e13f08671','WF_Instance','','CreatorOrgName','提单人部门',0,41,80,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f3389cfd-a867-4dae-88b4-fba75283a2a3','_WF_Activity','','RespondType','RespondType',1,250,100,'center',1,'','','',1,1,0,'string,10,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f45e7f16-5072-402d-8e9b-0852aabf7966','V_SYS_UserList','','CompanyID','CompanyID',1,160,100,'center',0,'','','',1,1,0,'string,50,0,0',0,1,0,0,1,0,to_date('2016-03-30 15:47:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f53e6f83-bd61-49d7-9cfc-db54f00a8960','_WF_Activity','','SubAppID','SubAppID',1,470,100,'center',1,'','','',1,1,0,'string,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f6f3d2fd-e72e-4760-9d72-655a55cb7ce4','WF_TaskInstance','','OrgName','处理人部门',0,30,80,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f7763105-86ce-4bd9-9690-6929f7394eba','Config_Grid','','Formatter','格式化',0,215,100,'center',0,'','','',1,1,1,'string,50,0,0',0,1,0,1,1,0,to_date('2016-04-26 10:11:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f7b1e283-8b52-4728-98c6-3e2eef0df0d2','WF_Activity','','IsEnableWithdraw','IsEnableWithdraw',1,510,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f7c175af-7add-4c37-bd80-490a526374f4','sys_Action','$3:{fitColumns:true}','ActionID','操作',1,10,1,'center',0,'#','','',1,1,0,'guid,36,0,1',0,1,1,0,1,0,to_date('2016-05-09 09:00:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f83fb314-cd9e-48eb-a9ce-af0a0f2fec47','_WF_Activity','','MessageTemplate','MessageTemplate',1,370,100,'center',1,'stringFormatter','','',1,1,0,'string,1000,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f849f5fd-17a8-44e0-a29a-b58480f28d72','V_WF_Task','','CreateTime','接收时间',0,20,100,'center',1,'','','',1,1,0,'datetime,23,3,0,0',1,1,0,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f8683e59-e208-4aa1-b31a-d113515cc23d','WF_Activity','','CreateTime','CreateTime',1,280,100,'center',1,'dateFormatter','','',1,1,0,'datetime,23,3,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f8e7ea8e-08c0-4627-9179-cb41a4f9ebb2','WF_TaskInstance','','TaskSeq','TaskSeq',1,80,100,'center',1,'stringFormatter','','',1,1,0,'string,200,0,1,0',1,1,0,1,1,0,to_date('2019-04-11 15:29:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('f91edd85-8eb2-4c76-b0d7-a7a920a834bd','Demo_Area','','Name','Name',0,30,200,'left',1,'stringFormatter','','',1,1,1,'string,100,0,0',0,1,1,1,1,0,to_date('2016-08-21 10:43:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fa2808ce-6c14-4f42-8c90-4e9c89fce358','WF_Instance','','FormID','FormID',1,80,100,'center',1,'','','',1,1,0,'string,50,0,0,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fa48e7cd-66ad-47de-8158-f94a1da79801','WF_Instance','','InstanceTitle','标题',0,15,220,'center',1,'stringFormatter','','',1,1,1,'string,200,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fae290fb-4708-4355-92c7-9a8ca89b93fa','WF_App','','AllowRoleNames','权限角色',0,255,100,'center',1,'stringFormatter','','',1,1,0,'string,740,0,0,0',1,1,0,1,1,0,to_date('2019-05-07 21:46:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fc43313b-05f9-42d5-9ecb-ec53d27a3808','Config_ExcelInfo','$:{"cascade":false}','ForeignTable','外键对应的表名',0,90,200,'center',1,'#C_SYS_Table','','',1,1,1,'string,100,0,0',0,1,0,1,1,0,to_date('2016-05-09 09:18:28','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fd2ff2c2-b155-498b-b6fe-827d4d893e4c','WF_Activity','','ActivityType','ActivityType',0,60,100,'center',1,'','','',1,1,0,'string,20,0,1,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fd6e34f1-9a60-4a2b-914c-9a780fc1ff35','WF_Instance','','Creator','Creator',1,110,100,'center',1,'','','',1,1,0,'string,50,0,1,0',1,1,0,1,1,0,to_date('2019-04-16 13:13:33','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe349f5e-f4a5-4e4c-b459-2044e00d8913','V_WF_Task','','SheetID','工单号',0,10,120,'center',1,'goto','','',1,1,1,'string,100,0,0,0',1,1,1,1,1,0,to_date('2019-04-11 16:27:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe3f3872-a746-4d1d-b363-d150363b0389','Demo_TestB','','F5','F5',0,20,100,'center',1,'','','',1,1,1,'int32,10,0,0',1,1,1,1,1,0,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe55b9fa-a6dd-45a4-957c-523fc870c9c2','WF_Activity','','ExtendExcuteAssembly','ExtendExcuteAssembly',1,390,100,'center',1,'stringFormatter','','',1,1,0,'string,500,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe85843d-0b24-4c74-9679-ddb6ebe1dce2','_WF_Activity','','ActivityCode','ActivityCode',1,540,100,'center',1,'stringFormatter','','',1,1,0,'string,100,0,0,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fe9d098a-9fdd-459c-89c6-61fea138d364','Demo_Tree','','ID','ID',1,10,100,'center',0,'#','','',1,1,0,'int32,10,0,0',0,1,1,0,1,0,to_date('2016-08-31 21:50:00','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('fec7d309-e347-4626-99cc-7daaefca67dd','_WF_Activity','','ActivityName','节点名称',0,40,100,'center',1,'','','',1,1,1,'string,50,0,1,0',1,1,1,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ff060975-688f-4897-9e58-5728deac2c2f','_WF_Definition','','WorkflowID','流程定义ID',1,10,100,'center',0,'#','','',1,1,0,'guid,36,0,1,1',0,0,1,0,1,0,to_date('2019-05-02 02:39:05','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ff78894c-a989-4a9a-8274-0ebd1e21bf56','Sys_Action','','IsSys','是否系统',0,50,100,'center',1,'boolFormatter','','',1,1,0,'boolean,50,0,0',0,0,0,1,1,0,to_date('2016-11-30 14:34:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ff9ffd93-4d31-4de1-8553-27ccfd869171','WF_Activity','','SubAppID','SubAppID',1,470,100,'center',1,'','','',1,1,0,'string,10,0,0,0',1,1,0,1,1,0,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ffb47d71-2521-421d-8187-e6129d186ffa','_Sys_Organization','','OrgFullName','全称',0,30,300,'center',1,'stringFormatter','','',1,1,0,'string,100,0,1,0',1,1,1,1,1,0,to_date('2019-04-09 17:00:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_Grid(GridID,ObjName,Rules,Field,Title,Hidden,OrderNum,Width,Align,Sortable,Formatter,Styler,Editor,Rowspan,Colspan,Search,DataType,Import,Export,Frozen,Edit,MergeIndex,ImportUnique,LastEditTime) 
 values('ffc97376-9cec-4636-b2d1-0d0b16e632ad','_WF_Activity','','IsShowOpinion','IsShowOpinion',1,90,100,'center',1,'boolFormatter','','',1,1,0,'boolean,1,0,1,0',1,1,0,1,1,0,to_date('2019-04-10 08:15:45','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Config_KeyValue   */
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('0ba7ee95-b749-457d-8281-5bcf4ca684bc','表名描述','_Demo_TestA','Input对话框','sys','',999,to_date('2016-09-05 19:08:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('15bc5a25-e17e-4b52-ad86-c4d4c6c6f091','表名描述','Sys_Organization','组织管理','sys','sys：仅框架后端使用，不输出到前端',999,to_date('2018-09-06 19:12:19','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('17187b0a-50c3-4043-9b94-6d0e096ffbf9','表名描述','WF_Instance','流程实例','sys','',999,to_date('2019-04-19 11:40:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('17d1cc50-8854-4050-a38c-efd5a5dedca2','表名描述','WF_WorkflowInstance','流程实例','sys','',999,to_date('2019-04-16 13:13:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('1a96dae8-1ebb-4fb7-860c-21c118b6042c','账号状态','已删','4','aries','',40,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('2434e0e7-64ce-463a-ad64-01cffff92b42','WF_Opinion','不同意','0','gemini','',2,to_date('2019-04-13 17:27:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('2a774a0d-b4e7-4ba3-8c4b-969de63a533a','导入方式','仅插入','1','aries','',1,to_date('2016-10-16 19:47:42','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('46096d68-464f-4b02-b5a6-9153c2fb3479','表名描述','sys_Action','功能管理','sys','',999,to_date('2016-09-08 16:48:34','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('46ca804f-9055-40c8-b5b5-9a6a79ba65f3','表名描述','Sys_Role','权限管理','sys','',999,to_date('2016-09-06 19:49:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('4760514d-9ffa-4b8f-a64c-9c4b5649f21e','表名描述','V_MyTest','V_MyTest','sys','',null,to_date('2017-06-05 21:08:36','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('47d13462-3737-4b82-972f-e7d9363f6fed','WF_InstanceState','拟稿','0','gemini','流程实例状态',1,to_date('2019-04-11 15:41:27','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('4d2074d6-4720-4d61-9d91-31910c3dc869','导入方式','仅更新','2','aries','aries：框架前端用到',2,to_date('2016-10-16 19:47:50','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('51ebb318-2cb4-4d8e-9ad8-fe254bb99c9c','表名描述','TestABC','TestABC管理','sys','',null,to_date('2017-04-13 18:03:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('5283f129-c942-485b-92a4-156286db9f11','表名描述','V_SYS_UserList','用户管理','sys','',999,to_date('2016-04-29 17:33:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('569cdc18-8d8f-4cdf-ba42-039b84a091b5','WF_InstanceState','已作废','99','gemini','',15,to_date('2019-04-11 15:43:40','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('596a4a36-ff60-453b-83df-e8e6e34e013f','表名描述','V_Test','普通列表','sys','',999,to_date('2016-05-10 14:35:49','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('623504b0-24c2-4683-ba96-84018709ff5a','WF_TaskState','已完成','2','gemini','',5,to_date('2019-04-11 15:39:50','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('6fcc7b3a-aedc-4797-b5e6-3d0a77b37be5','WF_InstanceState','审批中','2','gemini','',5,to_date('2019-04-11 15:42:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('7097c1b7-45f2-4cbb-bd72-9d58e8357636','对齐方式','右','right','aries','',30,to_date('2016-05-04 10:01:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('72e66919-8e44-4a59-8654-4c67bbe0bb22','表名描述','V_TestAAA','V_TestA管理','sys','',null,to_date('2017-04-13 18:08:22','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('776ec09f-f172-4858-bd84-0e2739651a26','性别','女','0','aries','',999,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('77ca2ee2-5cea-4ba2-9e04-5a5c9c2da8c2','导入方式','插入或更新','0','aries','',0,to_date('2016-10-16 19:47:35','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('7950cddc-0b13-4a30-8b60-984d5f08437e','账号状态','启用','1','aries','',10,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('7e09ed12-3d9e-494a-bb53-af5f65451463','WF_Opinion','同意','1','gemini','',1,to_date('2019-04-13 17:27:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('88c76900-ea84-49fb-ae0a-147b0579efca','表名描述','__WF_Activity','工32','sys','',999,to_date('2019-04-10 07:54:02','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('89c357dd-a6f7-442b-b5db-e3032c1b68fc','表名描述','MyTestExtend','aa','sys','',null,to_date('2017-11-16 21:44:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('8be330f5-8f2e-4403-82a4-e331e4fdaf5f','SysConfig','Theme','default','aries','default：默认Aries样式',999,to_date('2018-09-05 23:13:44','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('8cc03067-437b-4baf-97df-003dfef000cd','异或','or','1','aries','',999,to_date('2016-10-15 02:23:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('8fa0eab5-e033-4f51-82db-ce179baa124f','表名描述','Config_Grid','Input对话框','sys','',999,to_date('2016-09-06 03:12:26','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('9000aadd-8140-41b2-9434-36b6a2284bbc','WF_InstanceState','草稿','1','gemini','',3,to_date('2019-04-11 15:42:04','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('911aaf5b-bade-43a2-91ae-b86304dc420d','表名描述','Config_Excel','导入配置','sys','',999,to_date('2016-09-08 16:48:37','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('93fb1e4c-da18-42c3-9fcb-4f55370acc98','表名描述','wf_Definition','流程定义','sys','',999,to_date('2018-09-12 03:36:46','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('94d88793-29eb-4f56-9282-7b2da06cbc1f','表名描述','MyTest','MyTest表菜单','sys','',null,to_date('2017-06-05 21:03:53','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('98726400-d3e7-4596-88ad-81ae9f6df9e6','表名描述','WF_TaskInstance','待办事项','sys','',999,to_date('2019-04-11 15:29:18','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('9bae6656-0bb0-438b-9e9d-fc06fcbfab56','性别','男','1','aries','32323',999,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a35c437f-7812-4dae-a4c7-9677e6154f3a','SysConfig','Language','zh_CN','aries','中文：zh_CN，英文：en',999,to_date('2018-09-05 23:13:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a366918e-a24a-4288-ab57-a29b858ab5ef','表名描述','_Sys_User','Input对话框','sys','',999,to_date('2016-09-10 00:08:30','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a47d3b60-c568-437b-a644-09c0298e4317','对齐方式','左','left','aries','',10,to_date('2016-05-04 10:01:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a58f89d2-4f23-471b-b05c-f9b9ff7337a6','是否','是','1','aries','32323',999,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('a662070b-ab2a-4f0a-a6da-df03640c0a91','表名描述','Demo_Area','树形表格','sys','',999,to_date('2016-09-05 17:21:20','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('af6ffc9f-15b6-47f7-a565-83abdc8bae90','WF_TaskState','已读','1','gemini','',3,to_date('2019-04-11 15:39:31','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('b1b66447-22ad-4409-a4eb-20f0e35ad313','表名描述','Config_ExcelInfo','Excel导入配置','sys','',999,to_date('2016-10-16 02:40:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('bcb45af1-f17c-4973-ae1b-68f4c844e8d8','表名描述','Demo_TestB','行内编辑级联','sys','',999,to_date('2016-10-15 23:47:24','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('c21dfd8d-613f-4830-bacf-6cd903cf6541','表名描述','Config_KeyValue','配置维护','sys','',999,to_date('2016-09-07 11:02:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('c9000a82-2e52-40e6-ba4d-ebef95cf4e46','账号状态','锁定','3','aries','',30,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('caa16e37-a4a8-42a3-abdb-61273930ecb7','表名描述','Demo_TestA','行内编辑列表','sys','',999,to_date('2016-09-05 17:09:17','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('d2aeeb44-dee5-4e62-a4b0-7c12a47e51e4','表名描述','WF_App','流程应用','sys','',999,to_date('2019-04-19 11:39:55','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('dd0addfb-b67e-4fcf-a9cf-e423ae0c76b5','表名描述','TestCCC','TestCCC','sys','',null,to_date('2017-04-14 21:23:11','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('df944a64-1c20-4181-ac57-0b433e82667e','表名描述','WF_Definition','流程定义','sys','',999,to_date('2019-04-18 17:41:01','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('e00de83e-9b63-4ad0-9511-469000c9400d','账号状态','停用','2','aries','',20,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('e574bcb7-2345-4022-a11f-c50c03861afc','对齐方式','中','center','aries','',20,to_date('2016-05-04 10:01:54','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('ec06f584-a933-4386-9ee3-951584f5ceac','WF_InstanceState','退回提单','5','gemini','',11,to_date('2019-04-11 15:43:10','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('f215feff-0107-4692-ae72-043ff1a269ad','WF_TaskState','未读','0','gemini','任务实例状态',1,to_date('2019-04-11 15:39:16','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('f26442a5-faa2-4bc3-8177-4a0ba8e6146d','是否','否','0','aries','333',999,to_date('2014-11-11 11:37:47','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('f2f557b8-4d96-41b1-a62f-42c8b78ccc49','表名描述','WF_Activity','城3323','sys','',999,to_date('2019-04-17 12:09:06','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('f31f4526-8dad-4db3-9f59-35cf9443c0e6','表名描述','V_WF_Task','待办事项','sys','',999,to_date('2019-04-11 16:04:03','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('fa192da4-7b4b-4bbd-bae3-8208544c42ba','异或','and','0','aries','',999,to_date('2016-10-15 02:23:12','yyyy-mm-dd hh24:mi:ss'));
insert into Config_KeyValue(KeyValueID,ConfigKey,ConfigName,ConfigValue,Flag,Notes,OrderNo,CreateTime) 
 values('fdd815ae-6d66-4ecc-839b-cc8e93e2ff09','WF_InstanceState','已完成','3','gemini','',7,to_date('2019-04-11 15:42:39','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Sys_Action   */
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('15b73068-6c0f-49c9-800c-a7216cb2d079','查看界面','view',1,1,7);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('1c613ade-6665-49fb-b298-faf1b82dd6d2','编辑','edit',1,1,3);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('630e0452-00d6-4452-8a5c-19b2c3115ee3','配置表头','config',1,1,13);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('71e39291-59d3-4ed6-9ae1-0d7df7da2f91','导入','import',1,1,9);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('8a59a358-5a8f-4cb4-b600-9313028b911b','导出','export',1,1,11);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('8bc4d68a-ec7d-48f7-97c4-03a09836f45c','分配权限','auth',1,1,19);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('a9ee0f5e-ff85-4f00-ac18-f6118286671d','保存SQL','savesql',1,1,17);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('c97f8956-5c79-4393-8423-34451a1bcc95','查看SQL','viewsql',1,1,15);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('cf8f418e-2468-4f6c-96cf-3302a2d9fa9b','删除','del',1,1,5);
insert into Sys_Action(ActionID,ActionName,ActionRefName,IsEnabled,IsSys,SortOrder) 
 values('d0739946-99e0-4770-8d2a-6faf25a8457a','新增','add',1,1,1);

/*  Table：Sys_Menu   */
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('05f3393c-ff9e-46d4-ac6b-0817a3823c07','3b5e2f04-9f2a-48b0-9bc7-27701971484c','组织管理','/web/sysadmin/customview.html?objname=Sys_Organization&tree=1',2,20,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('13ce68d5-1261-4bec-95ac-b56f708f480b','8d60d828-56de-4b56-9c14-93fa94ccf300','普通列表[文件上传]','Demo/list.html',2,100,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('177b5c8e-465e-4bc1-80aa-45ddbb65c911','80a620b6-175a-493f-b7b5-54c61c1fd1e9','list.html','Demo/list.html',4,41,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('182aab95-d10f-4bea-9b0b-093a91e7f465','2f183dc6-b8c9-4094-b464-8f3780880caa','已办事项','/WF/Work/Done.html',2,11,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('2e388df1-ad13-40d5-b183-0987ed2ebe93',null,'开源外链','http://taurus.cyqdata.com',1,15,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('2ec845dc-8d3c-43f6-a12c-18245f24684c','2f183dc6-b8c9-4094-b464-8f3780880caa','我的工单','/WF/Work/MyWorks.html',2,12,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('2f183dc6-b8c9-4094-b464-8f3780880caa',null,'我的工作','#',1,40,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('33c3179e-1ddc-4655-a65e-0b27ef10da8d','3b5e2f04-9f2a-48b0-9bc7-27701971484c','菜单管理','/Web/SysAdmin/MenuEdit.html',2,50,'','',0,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('3493cabc-667d-459c-bab8-3a8f7d58842e','3b5e2f04-9f2a-48b0-9bc7-27701971484c','Excel导入配置','/Web/SysAdmin/ConfigExcel.html',2,80,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('3663fd96-913f-4b1a-8b4f-38f4c9778033',null,'流程管理','#',1,90,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('377979e6-846c-4f37-adf6-47f9c4fb2c24','8d60d828-56de-4b56-9c14-93fa94ccf300','多列表','/demo/mutillist.html',2,80,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('3b5e2f04-9f2a-48b0-9bc7-27701971484c',null,'系统管理','#',1,100,'','',0,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('56b273a2-08c6-4e9a-b31c-45c1eee0fea4','2f183dc6-b8c9-4094-b464-8f3780880caa','工单草稿','/WF/Work/Draft.html',2,90,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('5cda7a43-7c89-4b54-8cea-569db5b80b39','3663fd96-913f-4b1a-8b4f-38f4c9778033','流程实例','/WF/Definition/InstanceList.html',2,30,'','',null,1,'1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('5f19600b-38bd-43d0-b9f3-9fbdf651ba79','3b5e2f04-9f2a-48b0-9bc7-27701971484c','表头维护','/web/sysadmin/customview.html?objname=Config_Grid',2,70,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('5fc6b135-85be-4234-970d-14918c26f958','8d60d828-56de-4b56-9c14-93fa94ccf300','级联【行内、导出】','/Web/SysAdmin/CustomView.html?objname=Demo_TestB',2,201,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('626e25c2-2dde-4847-8edc-e87dbb92bb1d','76fe9cef-11e1-4752-b7a8-01c220e9e473','BBB','#',2,1,'','',null,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('72997801-a545-468d-b7a9-0b9f1d0613ac','8d60d828-56de-4b56-9c14-93fa94ccf300','Input对话框','/Demo/InputDialog.html',2,11,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('76fe9cef-11e1-4752-b7a8-01c220e9e473',null,'AA','#',1,10,'','',null,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('7f8a7fd4-681b-410d-983c-5aca3c8bc5db','2f183dc6-b8c9-4094-b464-8f3780880caa','发起工单','/WF/Work/Start.html',2,100,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('80a620b6-175a-493f-b7b5-54c61c1fd1e9','626e25c2-2dde-4847-8edc-e87dbb92bb1d','CC','#',3,1,'','',null,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('813318ba-b3a7-437c-9405-016dcf48f224','8d60d828-56de-4b56-9c14-93fa94ccf300','下拉框','Demo/combobox.html',2,500,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('86f8c95f-48c0-4f0c-9503-5b4605aeb378','3b5e2f04-9f2a-48b0-9bc7-27701971484c','配置维护','/web/SysAdmin/ConfigKeyValue.html',2,60,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('88a299cc-a324-41ee-bf04-db08b0eded17','3b5e2f04-9f2a-48b0-9bc7-27701971484c','SqlCode管理','/web/sysadmin/sqlcodeedit.html',2,100,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('8d60d828-56de-4b56-9c14-93fa94ccf300',null,'功能演示','#',1,20,'','',0,1,'');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('9790e0a6-08d4-4037-9c2b-ea08906f2aac','3663fd96-913f-4b1a-8b4f-38f4c9778033','流程设计','/WF/Designer/Designer.html',2,100,'','',null,0,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('97f9acb9-4e94-46e3-8845-9e825e8d6ead','2f183dc6-b8c9-4094-b464-8f3780880caa','工单页面','/WF/WorkForm.html',2,100,'','',null,0,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('9bb56ff2-6715-4838-a660-773e6c7eeb45','8d60d828-56de-4b56-9c14-93fa94ccf300','定义查询区域','Demo/list.html?toolbar=true',2,110,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('9e510347-693b-4337-b3c3-891ddc825921','3663fd96-913f-4b1a-8b4f-38f4c9778033','流程应用','/WF/Definition/AppList.html',2,5,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','2f183dc6-b8c9-4094-b464-8f3780880caa','我的传阅','/WF/Work/MyCirculates.html',2,22,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('bd3c53a3-55eb-427a-8707-f525682955ba','8d60d828-56de-4b56-9c14-93fa94ccf300','行内编辑列表','Demo/rowedit.html',2,200,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('c42f4890-a836-4725-ba24-7e6c8eab6016','8d60d828-56de-4b56-9c14-93fa94ccf300','主从表','/demo/masterslave.html',2,90,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('d3c4692f-cdc2-4063-acfb-f04c18eb145f','2f183dc6-b8c9-4094-b464-8f3780880caa','已阅事项','/WF/Work/Circulated.html',2,21,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('d46d817e-bc61-4678-bbe7-54f558227ec6','2f183dc6-b8c9-4094-b464-8f3780880caa','取消事项','/WF/Work/Cancel.html',2,30,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('de486794-6f7d-4b69-9c21-73d65ecd1728','2f183dc6-b8c9-4094-b464-8f3780880caa','待阅事项','/WF/Work/Circulate.html',2,20,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('e4136b8a-0f26-4c2d-aceb-e33b2997817d','2f183dc6-b8c9-4094-b464-8f3780880caa','待办事项','/WF/Work/ToDo.html',2,10,'','',null,1,'cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('e4312e26-edb8-4e9d-9a66-96b7f252d559','3b5e2f04-9f2a-48b0-9bc7-27701971484c','用户管理','/Web/SysAdmin/UserList.html',2,10,'/Resource/Images/IconMenu/gxgfwh.png','',0,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('e844697e-900e-42b2-a96a-89ff5233c29b','8d60d828-56de-4b56-9c14-93fa94ccf300','树形表格','/demo/treegrid.html',2,210,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,71e39291-59d3-4ed6-9ae1-0d7df7da2f91,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,c97f8956-5c79-4393-8423-34451a1bcc95,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('eba566dc-95e7-4529-bf2e-656c7a490d69','3b5e2f04-9f2a-48b0-9bc7-27701971484c','权限管理','/Web/SysAdmin/Rolelist.html',2,30,'','',0,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3,8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('eca81534-df5a-4811-9b21-ada48419c1dc','3663fd96-913f-4b1a-8b4f-38f4c9778033','流程定义','/WF/Definition/DefinitionList.html',2,20,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('edd516a1-4180-4f0e-ac16-292d7dd4febd','3b5e2f04-9f2a-48b0-9bc7-27701971484c','功能管理','/Web/SysAdmin/ActionList.html',2,40,'','',null,1,'d0739946-99e0-4770-8d2a-6faf25a8457a,1c613ade-6665-49fb-b298-faf1b82dd6d2,cf8f418e-2468-4f6c-96cf-3302a2d9fa9b,15b73068-6c0f-49c9-800c-a7216cb2d079,8a59a358-5a8f-4cb4-b600-9313028b911b,630e0452-00d6-4452-8a5c-19b2c3115ee3,a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_Menu(MenuID,ParentMenuID,MenuName,MenuUrl,MenuLevel,SortOrder,MenuIcon,BigMenuIcon,IsShortcut,IsShow,ActionIDs) 
 values('f053ff70-f070-4dba-afa1-0412c27d4a24','3b5e2f04-9f2a-48b0-9bc7-27701971484c','授权登记','http://lic.cyqdata.com/',2,255,'','',null,1,'15b73068-6c0f-49c9-800c-a7216cb2d079');

/*  Table：Sys_Organization   */
insert into Sys_Organization(OrgID,OrgName,OrgFullName,OrgCode,OrgLevel,ParentOrgID,CreateTime) 
 values('2c7a5e91-a447-b87a-0b8b-9e735252d05f','技术A组','A','002-1',2,'6f233f52-98eb-4379-a49a-e100c3a3427b',to_date('2018-09-06 19:29:31','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_Organization(OrgID,OrgName,OrgFullName,OrgCode,OrgLevel,ParentOrgID,CreateTime) 
 values('6a77bc50-ad90-6265-bc5a-e0979ebf0701','研发一组','一组','001-1',2,'e4412d10-e3ff-4e97-8ba9-7e8846c0e491',to_date('2018-09-06 19:25:46','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_Organization(OrgID,OrgName,OrgFullName,OrgCode,OrgLevel,ParentOrgID,CreateTime) 
 values('6f233f52-98eb-4379-a49a-e100c3a3427b','技术支持部','技术支持部','002',1,'',to_date('2018-09-06 19:16:56','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_Organization(OrgID,OrgName,OrgFullName,OrgCode,OrgLevel,ParentOrgID,CreateTime) 
 values('77585eb0-1458-ec70-6471-d7961eac28fc','技术B组','BX','002-2',2,'6f233f52-98eb-4379-a49a-e100c3a3427b',to_date('2018-09-06 22:28:14','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_Organization(OrgID,OrgName,OrgFullName,OrgCode,OrgLevel,ParentOrgID,CreateTime) 
 values('df4bb148-aa64-da5a-ef95-8122860ca567','研发二组','二组','001-2',2,'e4412d10-e3ff-4e97-8ba9-7e8846c0e491',to_date('2018-09-06 19:26:34','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_Organization(OrgID,OrgName,OrgFullName,OrgCode,OrgLevel,ParentOrgID,CreateTime) 
 values('e4412d10-e3ff-4e97-8ba9-7e8846c0e491','研发部','研发部2','001',1,'',to_date('2018-09-06 19:15:19','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Sys_Role   */
insert into Sys_Role(RoleID,RoleName,Notes) 
 values('53536a66-0d99-4ee8-b4a6-5928129d0ab6','普通管理员','运营级别的权限');
insert into Sys_Role(RoleID,RoleName,Notes) 
 values('7bd0ce76-20a6-4475-a70f-6691bb1af471','系统管理','仅有系统管理权限');
insert into Sys_Role(RoleID,RoleName,Notes) 
 values('d8e1ae3b-8451-436a-a59b-c7516e711b9c','超级管理员','开发级别的权限');
insert into Sys_Role(RoleID,RoleName,Notes) 
 values('e35ae728-2dc7-494e-96ce-ea95a50c092c','功能演示查看','只看功能演示');

/*  Table：Sys_RoleAction   */
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('00a950e8-8e4f-4932-b313-925dbbfa1ce8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('00fb401f-b93c-4d0e-b019-9693533d995a','7bd0ce76-20a6-4475-a70f-6691bb1af471','33c3179e-1ddc-4655-a65e-0b27ef10da8d','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0124980e-82c9-4d79-9ea8-594c8e2c6050','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('01920963-f168-49b8-a52e-4557a3e723cb','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('03698c66-ec60-4601-a6e0-d096b7765ad4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0394fc2f-d632-44fa-909b-baabe2e2b72f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('03b1ceff-1ecc-466c-8ccb-5731400cc4de','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('046231de-15bd-4e5f-b298-e6b04e9e85cc','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5cda7a43-7c89-4b54-8cea-569db5b80b39','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('05a81826-c622-4811-813c-a761b77c1cbc','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4136b8a-0f26-4c2d-aceb-e33b2997817d','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('069a7d04-c3c3-4a0a-aa12-5f83e1f9b1f2','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0722e01e-b738-49a5-964c-43ed76fb1354','d8e1ae3b-8451-436a-a59b-c7516e711b9c','182aab95-d10f-4bea-9b0b-093a91e7f465','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('074ab146-cda4-40d2-a054-1ff496c536f7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('076454a9-632b-4ced-af6c-171e7dc3ea60','e35ae728-2dc7-494e-96ce-ea95a50c092c','72997801-a545-468d-b7a9-0b9f1d0613ac','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('07705324-2031-4ad6-9174-c64511c113e0','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0911ac15-85f7-48c4-8051-32f69161c341','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('09b654ad-ac4b-43bc-9b9a-76bf93118cfd','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0a7e7724-2eb6-4b97-994e-4d270051dd14','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0aad23eb-494a-4448-9754-5c0135c5f7dd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2e388df1-ad13-40d5-b183-0987ed2ebe93','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0b4b02be-9784-4c67-b82a-edb59f47d2b3','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0b8f4de1-6638-4d1b-b8f1-9ca7749be04b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0bb3496f-14c4-4c04-8758-b2b4f34a96b8','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0c8e34fa-761f-465f-bcfe-901bd875f37c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0e001a73-d522-43d4-9e40-0a7c1bbbf903','53536a66-0d99-4ee8-b4a6-5928129d0ab6','182aab95-d10f-4bea-9b0b-093a91e7f465','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0edd5beb-e9bc-4aa7-8bc2-54ba8549d88e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0ee2b9d6-7d03-4c54-bb36-c12e72c0e7fb','7bd0ce76-20a6-4475-a70f-6691bb1af471','33c3179e-1ddc-4655-a65e-0b27ef10da8d','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0ef8ea05-5b68-458b-a8c7-4dcf86db4e24','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('0f8d19c2-6943-4ec3-83df-40e97c40e323','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('10570376-27e4-429d-a43e-0d5471a52e0a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('10921a5e-c291-4e21-b177-32e96d41e1f1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('110f7644-f18e-4458-ae87-392578651d21','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('112f1562-fa7c-4080-bfc6-4dc4bffa37e1','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('11b6956d-4132-4638-928b-d883fce956d1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','182aab95-d10f-4bea-9b0b-093a91e7f465','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('11e3deda-c875-4ef2-b346-8c1f003c5f47','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4136b8a-0f26-4c2d-aceb-e33b2997817d','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('127db976-fcd6-49ca-bead-c63251fc8fdc','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('144c7d78-1951-47e0-8ebf-e65d47d03500','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('14f9a2e9-00f6-4420-91b6-0130bad44f01','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('154aa657-eb11-4a9e-b3f8-2a36f6d0b376','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('15a4cd3b-6fca-4b63-b442-85fa09118057','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('15e0cf82-068b-405d-9232-3ba49889f0f2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1603a3a0-99c5-4040-86a9-1c0e798bd3de','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('169f27e3-76e0-4ed6-b386-1c8f551f63e8','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('16b6fe2e-464b-456b-ac29-3a0f0685b957','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('173e5418-f556-42a1-a2eb-4acb9c550e31','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('177b9ac0-0a94-4c23-a998-d2aa78893e81','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1796351e-1ca3-4a03-a42e-09a3a0ea371d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('180dda0f-966e-48e6-84e9-7c65d9cdecfe','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1af1a8b6-b90d-4329-93cd-1947dc5cf245','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1b243ddd-2b99-4657-b2be-5755a9308b6c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1b4894ec-0e15-4318-8ec2-ef7501583a13','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1b4d958a-f48d-45ef-ab82-91c5ac5ae8fd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1b562a2e-9c4c-49d5-8e48-f37f5cf191f1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eca81534-df5a-4811-9b21-ada48419c1dc','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1ba470fc-c21e-4112-b169-ef2efbe7bb02','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1bafdddc-17ea-491e-b039-2d21f231e460','7bd0ce76-20a6-4475-a70f-6691bb1af471','eba566dc-95e7-4529-bf2e-656c7a490d69','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1c110425-1b44-4655-ab7d-712589c1976f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1c1e41f6-0291-4db3-8e44-4790548b0d7a','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1cea96a5-4d01-4d3f-8111-f5e008804833','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1d163f4d-aece-461d-a211-aeb5b613fbbd','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1d1b3ad7-56a7-44f8-b501-431ef59faa8a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1e54167c-871a-42a2-a7c0-49abf1313ec3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','177b5c8e-465e-4bc1-80aa-45ddbb65c911','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1e61cca9-253e-4aea-b934-c3ab0b74d5e9','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1ecfec69-2b0c-4fd9-b4c3-4fea4983e370','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4136b8a-0f26-4c2d-aceb-e33b2997817d','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1f39291e-8665-409e-8038-461dcfe9d07e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('1ffb305b-0ddc-4380-bec5-3fb9e9cd4ef7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('207a1f73-5435-4276-a227-e5c850b550c3','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('210dfe91-1550-4884-a11a-68cdddc31b29','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('22626682-c4b4-43cd-be97-175ee6511453','53536a66-0d99-4ee8-b4a6-5928129d0ab6','182aab95-d10f-4bea-9b0b-093a91e7f465','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('22fcb2d0-7f29-41d8-8eca-3a05682c1704','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2355795f-4e66-445b-ab5c-7c3166cb4005','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('23c0d16c-4919-41cf-a1a6-316ff3a752b9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('24122d53-7df8-4511-b308-7d09a12695c7','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('24605143-6130-453a-bd4d-480f1b44ad65','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2571cfb0-e036-44cc-be40-8ccd01762ccd','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('263789b6-e485-49a4-8b3e-750eca6c8a0d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('26b11a8b-0828-4fa7-88dc-a254e3ecf090','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('277e63ec-a24c-4c99-ab0e-ab49ac8b022e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('279b40d8-23a4-4a78-9b83-7aa79604ebda','d8e1ae3b-8451-436a-a59b-c7516e711b9c','88a299cc-a324-41ee-bf04-db08b0eded17','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('27c195f5-97b9-4347-84f7-17d506e84b1d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('27e27341-31da-42b2-bbba-fd7af4e26023','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('28dad41d-eee6-49f7-bd91-fa0305e23221','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('299e2968-2b4c-4cae-9ccc-515178d28f9e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('29be3964-a406-406b-96a2-a3536f78783a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2ad00d1d-3ed7-423d-8dbf-22661a5ce8d8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2b68cf5e-57d0-4107-88f8-78b27fefbb90','7bd0ce76-20a6-4475-a70f-6691bb1af471','88a299cc-a324-41ee-bf04-db08b0eded17','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2b9bb1b2-3bd9-40a1-8e67-c3d2c78a8afc','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2cef3a0f-e5f3-442e-acc6-cd9d000648e1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2d16ccb8-f590-4ca0-b6e6-b1ba45361580','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2d8def6b-6ec6-4de0-a595-3a054d0f478c','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2dfe621d-70e6-4552-b4dc-4981606537a6','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2ed8405e-b754-44dd-83cd-b27164bc9658','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2f433f59-7cba-4127-8fed-7b646a7188a7','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('2fe12e56-cd50-4dc3-bf11-6a1e109dc097','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('30acc00f-10ad-4357-ab7f-05ba9c091bb3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('30b77378-87d1-4b44-b83f-e11ab7d8851b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('30d9c6eb-c04e-456c-b777-63429fd9883b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('30ea64bc-71b5-4af5-b89f-adf188ae0b29','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('31ca2547-1cca-4f82-867f-6603320f7339','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('31f2022f-3e58-48d8-b438-909117862402','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('32309d55-6fd2-481d-bbac-67ebd658ee71','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3349e46a-ccc1-432e-b0bf-c0bc2aa074b7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('33dcb644-8735-4b82-ba17-cf8e2737994a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4136b8a-0f26-4c2d-aceb-e33b2997817d','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('34419f92-2f8c-4487-af17-f3bb72939e17','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4136b8a-0f26-4c2d-aceb-e33b2997817d','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3447169c-df6f-42f7-a95f-17422b60ce0d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('350208bb-bd7c-43d3-bcfd-8505632e31f4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3571c564-d36b-4441-ae27-8907e72b6401','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('35d5fe88-98df-4906-84d9-0e1f5abb7811','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('365fbb95-49c9-4cc9-8db0-57abd93a01d5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','177b5c8e-465e-4bc1-80aa-45ddbb65c911','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('36d03a4a-7122-46fc-8825-b377b9fed224','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('36da9eae-6b67-4f63-9c23-7a7c705c2dad','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('371e661d-e16f-4363-8dc4-02340c8e2865','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('377ab32f-1b38-4fbb-84d7-a02cb292c086','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3784692c-2243-4ea6-90da-56412028fb10','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3805c8e8-6d85-4996-8580-fc8dc57ad36f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('380e5aa9-278b-4b1e-9e72-67117254a1aa','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3824cdd3-5bb4-4b81-8cf9-d88bc96f594c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3916dbdc-af20-449e-9a70-ad3bb44cd11a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('397e34fc-d104-4d7b-929d-362656b9dff8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('39b608c3-8121-43e0-84e4-96212d422cf2','e35ae728-2dc7-494e-96ce-ea95a50c092c','72997801-a545-468d-b7a9-0b9f1d0613ac','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3be00231-902c-4d29-8920-b07a480dba29','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3be0c0e0-8a1b-41db-913b-923b559e18a8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3c0ac985-932b-4838-99b3-fc10f20370c4','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3d5e1ed3-f18c-4f5b-8225-751260ac07c2','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3dd0ecaa-672c-43f2-bf70-880d81655ba2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3e775266-95ca-4144-986e-1b33de752568','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3edd8c6f-9b4d-4efb-9618-6627d6fce428','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4136b8a-0f26-4c2d-aceb-e33b2997817d','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3f291dc5-cc95-47de-9eea-929d6af5b1c6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9790e0a6-08d4-4037-9c2b-ea08906f2aac','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3fa387ad-d3ec-440d-aed9-7822e97f079f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3fa399c1-4669-4e0a-808a-1d79d97a7e57','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('3fdfc359-fcd2-4363-81ae-6cea65fec91a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('419454dd-ae75-4b06-8d92-78dc67edb8a4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('42822278-88a4-4782-8c4c-2a5af81cf6dd','7bd0ce76-20a6-4475-a70f-6691bb1af471','88a299cc-a324-41ee-bf04-db08b0eded17','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('43e6c87e-d909-4356-b545-4aa51f1a9ccb','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4484511c-de16-4289-b99f-709277253f5e','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('456a0089-c473-42db-a16e-86c41211fcf2','7bd0ce76-20a6-4475-a70f-6691bb1af471','88a299cc-a324-41ee-bf04-db08b0eded17','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('466b4b6e-4bf6-4733-a709-0c0b372e2312','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('46cafc17-adfc-47dd-b6ad-87dd13030651','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('475b7c29-330d-4461-89c3-f339d7a68812','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('47d865ee-8b39-4fdd-b09b-d5b9091882b4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('47e81e8a-85a9-40a6-9d08-aa023c676f19','d8e1ae3b-8451-436a-a59b-c7516e711b9c','88a299cc-a324-41ee-bf04-db08b0eded17','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('485c860a-f3ea-45de-8058-455d6a58c55f','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('48b23476-5cf5-4e32-8bb8-09a915f7450b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4a7da3d8-ed4c-4921-9e65-a34b944b6489','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4ac7ed7c-b205-40d6-ab9a-6f6b6ad53aa6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','88a299cc-a324-41ee-bf04-db08b0eded17','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4b69f784-0e5e-47d4-b7a4-109eb93ff0d6','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4c5847a9-60c5-4d03-800d-4ad361b54f0d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4d0b7e2e-6731-452f-9ab2-1bf165e9c105','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4d0cf844-f87b-4f57-93d1-07c93d0a0885','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2e388df1-ad13-40d5-b183-0987ed2ebe93','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4e025d3b-e184-419a-b5ed-1a6030b8349b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4e6c6e45-2c95-406f-976e-bbee07e45596','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4ecdfc05-08d5-4e42-b411-b5ff3ec734d4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4efdc8cb-e1be-4c23-809a-455129d559a6','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4f0ea6f8-be36-424e-b980-2fdc04cb0e0f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('4f4cff35-ce5e-4d80-8142-bb7a19b1e245','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('502b9334-37cf-4f0d-b990-f04d70abacd1','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('50f5206e-8a6b-478b-844c-c62083d490eb','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5377c413-f762-4be1-bc1b-d44b2f0f0931','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9e510347-693b-4337-b3c3-891ddc825921','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('53ed620d-6072-43aa-b97f-ee9c06a4d120','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4136b8a-0f26-4c2d-aceb-e33b2997817d','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('547b0495-5d9b-42ba-ac49-4a8384ba243e','7bd0ce76-20a6-4475-a70f-6691bb1af471','88a299cc-a324-41ee-bf04-db08b0eded17','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5498e9d5-e3c9-4fe8-aed6-0fbfc4d825f1','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('55291168-77a5-4158-a8fb-4dc0ac0423c9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('55668b0f-4a3d-422d-b168-d9e3ff16165f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5619e226-e6ab-4108-b597-a39bda518f24','7bd0ce76-20a6-4475-a70f-6691bb1af471','eba566dc-95e7-4529-bf2e-656c7a490d69','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('567c2910-6b3c-4875-afb3-8c5298c90350','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('568cadd9-f801-4cb1-a6d1-1bfc22d2055d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('575f8344-968e-4df6-9745-f91f5360d848','7bd0ce76-20a6-4475-a70f-6691bb1af471','88a299cc-a324-41ee-bf04-db08b0eded17','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('58303e5d-b050-453c-a727-4e968a22749d','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('583d72c4-0645-4ee4-b9f6-5e5b75db5245','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5a1dd2f5-93f0-4efb-afeb-830ae01c0ee4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4136b8a-0f26-4c2d-aceb-e33b2997817d','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5ac56804-39fa-47b6-8cd9-24410deb1eca','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5b866e4b-1079-49d9-9db9-7ecd73c3db87','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5bd77a65-e61d-40c3-992d-2e5b1df657d2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5bf00adc-6ecf-4a10-90a3-60e6911364a0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5c427eb9-7d43-4a88-9379-e8bede6d60b6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5c471c69-29c5-4a43-98d3-a9fdb85a77bf','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5c9f5ebb-25a8-4b2f-bf08-12d52b99de4e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9e510347-693b-4337-b3c3-891ddc825921','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5cbd5be4-5777-4fc9-a83b-7e9d689a4948','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9790e0a6-08d4-4037-9c2b-ea08906f2aac','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5cbe41eb-14f2-4710-becf-a7caf0d5c49f','7bd0ce76-20a6-4475-a70f-6691bb1af471','3493cabc-667d-459c-bab8-3a8f7d58842e','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5d1361be-43f1-4370-b4e2-a1e784de81f7','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5d2ac0bf-babc-4b01-be2d-bc265ca33208','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5d5c3540-2924-4901-82dd-cd7d5b4a1117','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5f19d899-f89a-42b3-8ac2-f3acf04cb44b','e35ae728-2dc7-494e-96ce-ea95a50c092c','72997801-a545-468d-b7a9-0b9f1d0613ac','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5f212391-2d2a-4d19-a98d-9132e7149672','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5f2e7653-4b32-40e1-baf6-e8c8c6e48051','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('5f8baf6a-194b-4000-a9e5-df9727a38789','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6023dd34-f4e4-4f14-a009-dca67ae99d40','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('604e0af7-c774-4733-a0f1-5ca0d483c593','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('605ab90a-9955-4195-bd88-9afdf812e2ae','7bd0ce76-20a6-4475-a70f-6691bb1af471','3493cabc-667d-459c-bab8-3a8f7d58842e','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('60d332d8-9177-4c05-b259-3bedcc941070','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('60fd9747-a5d0-4d6d-b4a9-2e71fa576051','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('610cb9cb-167f-4eac-b57d-1f428312293f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('61b7482b-be46-45f7-a571-2f57625f8ec9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('62c4efb5-6159-45da-aa05-e094a52b3c6f','7bd0ce76-20a6-4475-a70f-6691bb1af471','3493cabc-667d-459c-bab8-3a8f7d58842e','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('643dfdca-eef7-44e7-9cc1-1c3318bee8d7','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('64d16ed9-0530-42f6-9639-4ef7a05064c0','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('66a563a3-91f6-412a-8419-0e3f98b0f720','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('66b29159-a284-44ab-874a-3456cf09a7bb','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('66ed6160-c033-4e79-8b6d-bb9894e4692a','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('67418412-e9df-45c7-9f9d-a3fb3fc26440','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9790e0a6-08d4-4037-9c2b-ea08906f2aac','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6806c3b2-2376-4b61-ac4b-0ca7292cba0a','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('683f8f75-6643-4243-8c9b-61b0f76b0a89','d8e1ae3b-8451-436a-a59b-c7516e711b9c','88a299cc-a324-41ee-bf04-db08b0eded17','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('68458d00-1fae-4d42-987f-1837342188e3','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6875aa01-71eb-402d-b793-7974f8ad716d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6935247c-d5fe-46a6-845f-0668800ef85d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6a6d51f8-a558-4816-a7c4-4ed32bf53109','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6ab61280-4915-4089-aa07-c6577dc9aacd','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6cb37652-1407-457a-9d3a-76a01f5521bf','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6cb734d9-1f77-45de-b37b-c32fa0471211','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6dc920e7-d36b-4c66-a609-79d6d81e7c68','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6e773b95-2016-42e7-a8f3-23996d3a24f6','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6ec0f05f-6411-4b2e-b315-568af0886d24','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6fc310c4-0a15-4a8a-bb49-604a35ebf50d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6fda9364-af44-4911-96bf-58c0a68083ce','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('6ffcd24e-0f47-4ec8-9a57-3681c4771884','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('71979940-e82f-4333-9f83-9fdd4f6885d1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','177b5c8e-465e-4bc1-80aa-45ddbb65c911','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('719c1a5b-85bc-4658-9f99-99c76dae334c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('72c55a2f-aa15-412b-a949-a9f8722adc0b','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('72ef5aed-1b18-49de-aefb-cef697903b21','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('73955b6e-9cba-489a-b586-a6dbb4fad346','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7487d36e-fbca-4cac-8b78-c4c8a866de72','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('74d52ef2-21dd-4b32-9ffd-89f09c84ff77','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7641e28c-56c2-442f-b48f-fdb926843ee9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('766c0aaf-b6df-4b03-a190-9d5a7bb548cf','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5cda7a43-7c89-4b54-8cea-569db5b80b39','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('77381d14-6136-4e54-b425-e0ffccf60259','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('77f0b035-e606-4d44-ae53-d7041ebed90f','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('787674f5-14ad-4b5d-9331-015e82fd7bac','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('78d33cbb-11ae-45af-8ff7-465f278ed908','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('7b869a40-0c8e-4e7b-b889-1165f97c4d60','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('80f0edf3-c965-40df-993c-11877c038d98','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8366fcfd-2cfa-4b2c-a182-2d96051c4c80','7bd0ce76-20a6-4475-a70f-6691bb1af471','eba566dc-95e7-4529-bf2e-656c7a490d69','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8519710a-9f9b-42e7-a43f-a8b6574a8e1f','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8549338c-b160-477d-abf8-50e1e4907ebb','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('857aa1da-5bee-4dcb-8c1f-7ec6c2088a41','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8629a75a-cb02-400c-b410-c5a0107b2d9a','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('87a520cc-ab7a-404b-b53c-2cc65deb3740','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('87b5d818-6144-4a4e-b5ae-437afb39ffcb','53536a66-0d99-4ee8-b4a6-5928129d0ab6','182aab95-d10f-4bea-9b0b-093a91e7f465','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('88e6d689-e842-4b7b-9c85-001aef84fc71','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('89132c09-5f3b-4e2f-b055-05955b2e0706','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8919915d-c5fb-4d20-a35b-d3ca755b5c98','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8988d5ad-04d2-4403-b584-f0d8c89844a3','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('89bcc97c-1a58-4995-8734-91e6a55b0283','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8b7a879d-aca5-43a6-b123-9cf73b03fcdc','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eca81534-df5a-4811-9b21-ada48419c1dc','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8c539941-3ce3-4d87-8395-18274f44d1b0','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8cbf5213-034f-408d-8f39-38ad9ce6ea82','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8cd4826a-6f41-470c-931a-6b5032c05982','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8cf879a1-e99e-479c-9e20-dd3228955dca','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8d9c2842-554d-42a1-9073-d8cf948809d3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8e0b93b1-3bad-45ed-9bd0-f962fe6ba132','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eca81534-df5a-4811-9b21-ada48419c1dc','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8e51c493-d988-4737-bac0-3cc34e8be58f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8e60fd61-4d3e-476a-a28a-c72e7b3e8e8d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8e836d49-29c6-421a-878e-cd01688a6c12','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('8ffa697d-5ec9-4d68-97a6-0fefdf9209fd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('90267419-4706-40f3-93ce-7ae20aa186f6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2f183dc6-b8c9-4094-b464-8f3780880caa','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('905bef56-0ec6-4041-8768-30d6870d50c6','7bd0ce76-20a6-4475-a70f-6691bb1af471','3493cabc-667d-459c-bab8-3a8f7d58842e','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9075d15b-d326-45ed-a51e-98806f306a66','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('91d5bc51-6849-4281-aa52-19e1ad3140d3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('920731ad-d080-43f6-80d9-c6a3d3ee5545','d8e1ae3b-8451-436a-a59b-c7516e711b9c','182aab95-d10f-4bea-9b0b-093a91e7f465','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('928b6168-1d32-40d3-8a2d-3ce8d3eba26e','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('934110b4-8d85-4f7a-b467-a04eb00ed321','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('940c4846-1309-4a45-8beb-c7100ca4fc76','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('94493118-10ba-4248-b2cf-bb88269e1946','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('944da45e-bb10-4164-9526-65f6fcdd284d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5cda7a43-7c89-4b54-8cea-569db5b80b39','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('946c16f1-76c2-48f0-a3af-69ad2b3c0b43','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('94a5d67b-b302-4c11-9164-82433572a593','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4136b8a-0f26-4c2d-aceb-e33b2997817d','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('94e3adb8-173d-469e-8ba6-a83af797d523','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('94e3dc66-e8c1-4312-9e9e-1a1b12677fdb','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('95420cf3-6d70-4ea4-b2c3-ae0d0bc5d710','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('95431622-3b71-4383-b84e-d98f358e2583','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9621a149-6f1a-4abb-bad6-6488dc4bbb29','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('96a3ca9d-73fe-4a4e-a3bb-8659e9e1b839','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('96ca6212-a54f-4021-9774-e9a191c34e72','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('975fcc28-c080-4b10-88d1-8cc5d65a7959','d8e1ae3b-8451-436a-a59b-c7516e711b9c','88a299cc-a324-41ee-bf04-db08b0eded17','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('978133ce-d81c-4cf5-b347-ee28035cc0f7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','f053ff70-f070-4dba-afa1-0412c27d4a24','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('97a13ed2-bae7-4f01-b936-74b69ad78b49','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('989ad3b4-b6d8-433a-95b1-0e4bcb21952f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eca81534-df5a-4811-9b21-ada48419c1dc','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('98b7d98f-51ff-4056-82a4-db314e2abf07','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('98bf1b35-5a16-47b0-a60e-91b0f69a71ea','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('98cb3995-966b-4a1e-8f4f-0261268e633f','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9a64fcef-7db0-4d7f-9f80-ce5bfdbbefa5','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9aacd68c-937c-417b-afb1-0f8bccc27787','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9b75eb25-42db-43cf-8a91-bc781701d58b','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9be41e60-fffd-4afa-af9f-7d4ef56bac3e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9c3da452-29a7-4193-a250-fbe01382cb7e','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9c6edd92-b5cc-45f5-95cc-d4ec39ad4bbf','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9c9c9139-df09-48d2-9204-ce983bb76a24','d8e1ae3b-8451-436a-a59b-c7516e711b9c','88a299cc-a324-41ee-bf04-db08b0eded17','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9ce3cc73-64df-4501-96f0-5d8ff7d9f04d','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9d10dd19-eaf9-4933-b9e4-b01d46358291','e35ae728-2dc7-494e-96ce-ea95a50c092c','813318ba-b3a7-437c-9405-016dcf48f224','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9d32112f-b0f5-4399-87f3-68fae611c4a8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9d5d7794-38f2-47b7-8453-4c377f2a18c5','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9d9567ca-6dc7-4b42-8cf4-5a0963d6b1f6','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9d9b70d2-3cf3-462c-9991-f3d578bf9463','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9ddfce7f-16c9-4d75-a098-679dab66bb7a','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9df82e00-d027-4a6e-8df5-dfb001134f03','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9e12c776-220c-445c-ac91-5a9b04d810e8','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9e28f91e-49ae-4f71-96b2-443a9c14d1f9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9e3c1c30-e8ad-4278-8a9e-a78c65576c03','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9ead5512-031d-4d29-8389-adcd587b4324','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9ee0a2cb-f942-4851-a722-8bace4f5130a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9f01f310-9938-44ff-95c5-9f766d1599b5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9fd255d8-71d5-4057-a58b-374b428f76e1','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('9ffb8c9d-e6de-4fdd-93b2-8ff67640272e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a0397760-e105-4583-9cd9-e0e97dce576a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a0450c5d-c796-4bcd-a182-a63adf5b6634','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a0462f07-6de8-45cf-96f8-a6d064ef87af','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a117623a-d347-4fdc-b147-236be2168e4e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a1d7f347-fba6-48db-9eac-243efe43545c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a200e476-398a-4f35-a134-ca3eef26d0be','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a46d039a-94fe-4e28-9832-56c0861876e4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a5115d49-84c6-4fff-a204-cdf63a45fb49','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a5132b92-e288-42b7-bf18-7a44134fb07f','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a6981101-d514-4081-ad33-ac7b82a00bcd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a6b4c832-fb2b-49f9-931b-43f3fffdecad','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a718acee-cf09-494c-90f1-149148200179','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a774b455-a318-4d28-ad20-05818e32746c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d3c4692f-cdc2-4063-acfb-f04c18eb145f','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a7d4f9ff-b051-46d1-bafe-98cf210ba9d4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a8d0ecd1-2ae3-4f2c-adb5-99ccba055814','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('a990edc1-5f34-4915-af81-dd8d8bc8e697','d8e1ae3b-8451-436a-a59b-c7516e711b9c','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('aa5d08b2-484a-4886-89b6-80e7d9fe5b06','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('aa836fbf-0d7b-471a-9a56-d7389383afa3','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('aabfb6e2-e8dc-43bb-8003-e37fdbd3d446','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('aaee21df-9167-44dc-8129-51032e29e41e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','de486794-6f7d-4b69-9c21-73d65ecd1728','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ab2105a8-ca9a-4799-a746-41c909cb382a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ab3390e2-eb3d-4536-9155-2a33730f408e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ab7aee4c-feb4-42d8-b261-82ed41bc6395','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ac2db68d-9e9a-40b9-a8e5-92423e62d35b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9e510347-693b-4337-b3c3-891ddc825921','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ac609709-ac67-4457-b6c4-903cd7102476','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('acd18561-a67e-4a45-9b01-1c6518463b58','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b0cd22e6-3c38-4c4d-b235-37151dc42462','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b1ac3eb4-8808-4eca-9da4-db3e50a019d7','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b306ae76-abce-468e-9a26-2754fe1578c3','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b422c6ed-7881-4003-859f-0d8c30b6d339','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b4b51ee8-a1aa-48a2-ac94-b416bd44938f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b4f670c4-65ad-495f-94cb-c9c11a5e0872','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b512cec3-f427-41fe-9d44-355fdd7cd40c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b58d8938-79c1-4300-a118-e7fa9549a026','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b5c33ee3-34fa-4976-a56a-12b847445ecd','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b672af3f-dbf9-4458-88f3-137a7b7d770c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b779d756-612b-48d2-be74-2849179e156f','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b7fb3d2d-84bf-4995-8d06-0031af19a73b','7bd0ce76-20a6-4475-a70f-6691bb1af471','33c3179e-1ddc-4655-a65e-0b27ef10da8d','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b8b2881a-39cc-4f08-be71-0bb371cdf9d9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eca81534-df5a-4811-9b21-ada48419c1dc','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('b9cbd857-b633-4240-9c88-53c49994fcf4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ba18e586-0897-4134-bddb-b10ee15dd452','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bb0f0050-41fa-41ad-a5da-943523181251','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bbb46fc8-d3a6-47a0-8302-810749fddfce','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bbf6c8da-8ef7-499c-86e0-1bbb3cc17c35','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bc55a5f2-0292-4d20-afad-8a68efad2658','d8e1ae3b-8451-436a-a59b-c7516e711b9c','182aab95-d10f-4bea-9b0b-093a91e7f465','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bcd362d2-8485-411a-942d-5e9501ce689e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9e510347-693b-4337-b3c3-891ddc825921','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bdb15012-faac-49e6-855f-2beb64cd5d82','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bde3aecc-cc6e-4002-8399-fa7050b2b3d6','53536a66-0d99-4ee8-b4a6-5928129d0ab6','d46d817e-bc61-4678-bbe7-54f558227ec6','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('be132a54-8729-4bcd-9263-5d022c2836a1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('be278bcc-6825-4fc7-8420-e2018c0a444e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('be362376-5d97-4568-9c8d-e9c5bbee973e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('becc4f58-1b52-4ee1-baa2-e0e3d6f469e1','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bf027939-1879-445c-b02c-1c9397087cb4','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('bf7f3b3f-7049-411a-a703-07cb8281f6e6','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c0eac77c-fcd5-4e54-8da6-41f7f1d5a1b9','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c1c4113c-3818-4a19-9e4f-4cf98e3be1e0','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c1c514cf-0c67-47dc-9745-ce6a17f497d3','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c2188f40-4a04-433f-8ae4-8095a40f04b6','e35ae728-2dc7-494e-96ce-ea95a50c092c','72997801-a545-468d-b7a9-0b9f1d0613ac','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c2858d60-e7ea-482f-b248-9edcdbff38d6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c2d2d905-1f83-47fd-8e4d-c14f9aecc96b','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c337c4cd-e225-4880-be26-29482a519032','d8e1ae3b-8451-436a-a59b-c7516e711b9c','eba566dc-95e7-4529-bf2e-656c7a490d69','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c3ba4ba7-b499-4830-b78d-1956bac5f87e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c3bf6f00-4fc1-4ebe-968d-2f0c5ac954ec','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c418717b-0ed7-4c61-9279-58563e3bbc90','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c4770860-247f-4946-912d-d16e9a76fed1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c4ade98e-8c20-4d36-80a7-590da20fdda2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c4dc49bc-81a5-4dfa-abb4-cdcd4655c0e6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9790e0a6-08d4-4037-9c2b-ea08906f2aac','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c545fc58-c56e-4b42-9a8f-c6ddcc446623','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c57a0e3a-404d-4dd1-a2e8-e01cd626c519','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c63ff59d-29d3-419e-8fc8-9242ed905166','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c6d78baa-3e14-4033-8978-0c8ba6976896','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c7359363-8f84-412a-98c6-d48f07dc62e7','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c73d8f7b-0505-4311-87b8-f99440f1d7d0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c762a923-19a6-4fd6-863b-33aa98466881','e35ae728-2dc7-494e-96ce-ea95a50c092c','72997801-a545-468d-b7a9-0b9f1d0613ac','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c776ad48-11a6-411d-a129-0e9058215859','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c851c76d-8b9c-4eb7-ab0d-7f2095675b63','7bd0ce76-20a6-4475-a70f-6691bb1af471','eba566dc-95e7-4529-bf2e-656c7a490d69','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c8b74e4c-fb0b-4d87-86e9-df08ea3ec0e4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','813318ba-b3a7-437c-9405-016dcf48f224','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('c99bdab5-1288-4ed2-a138-c041d98f3c94','d8e1ae3b-8451-436a-a59b-c7516e711b9c','13ce68d5-1261-4bec-95ac-b56f708f480b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ca10c55c-3b5e-4f11-83ef-d507c102323d','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ca89d8f9-cf2b-45bf-a66d-0573e3f87d44','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ca8e6f59-0111-435c-87ef-96cc244b87f2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9e510347-693b-4337-b3c3-891ddc825921','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cc95e2b8-9c26-4842-a503-c6363bf9e56a','7bd0ce76-20a6-4475-a70f-6691bb1af471','3493cabc-667d-459c-bab8-3a8f7d58842e','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ccc87f3c-2670-44f0-b174-00008c379790','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ccd1525a-bb0f-41c8-b897-44901c77bb47','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cd0bf98a-be7b-4f86-a0d2-8e988ae043d3','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cd27da4d-c38d-4691-bfd8-bbd26f695d58','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cd7ec5da-3505-4cc5-b7ec-52a5553f8308','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cde1e4d9-ec90-44a9-9cdf-349ff397a645','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ce86344f-10c2-4c4b-9386-dd646299d9d9','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('cec6c1f4-be53-418f-9d07-a9c02ebe10b1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d06d93cb-f602-4e15-9da5-6931b1875a92','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d07d3c32-ab3f-4d20-8f2f-c3ffc93077b0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d0e0e047-9962-4316-958f-40b12da67774','e35ae728-2dc7-494e-96ce-ea95a50c092c','13ce68d5-1261-4bec-95ac-b56f708f480b','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d14ec859-18e0-44f5-97bf-d20680cee411','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d16b06be-ad98-4426-8dc6-25aca4cee195','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','c97f8956-5c79-4393-8423-34451a1bcc95');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d17cfe1c-cae8-4e6e-b41a-02274b39d5c5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d2e568a2-fd6c-474e-a091-e3fad1bce12d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d37325d6-47a6-450c-bf4e-e29b57c772ac','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d3b5c911-56c2-44e5-a7c3-fb37e40d63a9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','2ec845dc-8d3c-43f6-a12c-18245f24684c','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d3b7e5b5-ae6a-4d13-95f0-26e5aa099ff6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d46d817e-bc61-4678-bbe7-54f558227ec6','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d3dbac05-397e-484a-80c2-864e4aa5ec52','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d4ca8629-81ba-423c-acdf-ed7498121936','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d65e7934-6342-47ea-bf2a-af0202c5f75b','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d7777b7a-ffa8-464f-b3fd-1926eb24cfb8','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d7c7420d-1347-4154-8c5c-593a23f54148','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d81fe0a8-817f-45b8-92d6-b9cd23a3c61a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','9bb56ff2-6715-4838-a660-773e6c7eeb45','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d828b43f-c55c-49a0-b85a-799b57a227fd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4136b8a-0f26-4c2d-aceb-e33b2997817d','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('d8c529c9-e681-4e34-91ff-e026ef8edba9','d8e1ae3b-8451-436a-a59b-c7516e711b9c','05f3393c-ff9e-46d4-ac6b-0817a3823c07','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('daaad0a3-57d6-4e80-b859-188645404df0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('db865792-27ee-470c-9b15-6c879a8f644d','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('dc7689a1-06e9-4be5-b0b1-f3d24cb295e6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('dd6e9e5d-a8a4-4efc-ac61-fdb7125e6595','d8e1ae3b-8451-436a-a59b-c7516e711b9c','72997801-a545-468d-b7a9-0b9f1d0613ac','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ddab0082-e6d1-4ed3-830b-2aafc03ca1e2','d8e1ae3b-8451-436a-a59b-c7516e711b9c','edd516a1-4180-4f0e-ac16-292d7dd4febd','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ddac13c4-59f3-47c1-9541-64cb20bf9031','53536a66-0d99-4ee8-b4a6-5928129d0ab6','97f9acb9-4e94-46e3-8845-9e825e8d6ead','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('dde9b026-6a6c-425d-a410-7e0fc371ba72','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('de5a7d2f-44c7-45f8-b49c-c2f7046765f0','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('df3d8c0c-8878-4f43-a2db-bbeed8d45436','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('df55e2e0-ea6a-406f-ad08-06b21297754e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('df66c1ba-2e62-4a6c-a1d6-b7237bd720d6','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('dfb93a53-2124-40a1-9c7f-c80cc19e1837','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e073a39d-c6d4-4829-9c60-13f61f9fc6a8','7bd0ce76-20a6-4475-a70f-6691bb1af471','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e0f14252-90a3-44ff-b252-433ccd55badd','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e10be743-cbcc-4d0d-b99a-77d4466b8f1b','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e133f348-f2e8-4321-92d0-cc6fbb3be2a4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','13ce68d5-1261-4bec-95ac-b56f708f480b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e2b8ef8f-53e4-4e63-986d-fa3d54a6886e','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e3c513bf-4c42-446b-a309-4ea28f39ad32','e35ae728-2dc7-494e-96ce-ea95a50c092c','c42f4890-a836-4725-ba24-7e6c8eab6016','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e3d2fb38-70d8-46f6-a333-d3ae4268393c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e54fbc61-106b-4a2a-a9f3-a7097f627f0f','53536a66-0d99-4ee8-b4a6-5928129d0ab6','182aab95-d10f-4bea-9b0b-093a91e7f465','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e57d3149-0d3d-4d40-8f98-425eb8569d18','d8e1ae3b-8451-436a-a59b-c7516e711b9c','86f8c95f-48c0-4f0c-9503-5b4605aeb378','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e592c119-12ac-4acd-b25a-ceffd62f4080','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e74d55f5-b1a2-44fc-ac96-ebf8251a13a4','e35ae728-2dc7-494e-96ce-ea95a50c092c','5fc6b135-85be-4234-970d-14918c26f958','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e7da0431-b069-4b15-80b3-ec7cf8fe6f53','7bd0ce76-20a6-4475-a70f-6691bb1af471','eba566dc-95e7-4529-bf2e-656c7a490d69','8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e7fe0749-636b-4709-8af4-98c72268d94c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','72997801-a545-468d-b7a9-0b9f1d0613ac','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e858ddec-9c61-4156-ad2f-9e7e79e446ef','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e8629cff-2ace-4215-a9ac-98a14e62e2e4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('e9997ff2-42b1-4880-b572-c1677d1f7441','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('eab795a4-ed9d-4fab-9913-f3c284211d13','7bd0ce76-20a6-4475-a70f-6691bb1af471','33c3179e-1ddc-4655-a65e-0b27ef10da8d','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('eac1e16f-ed0a-42e0-8ac0-66388388c7ed','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('eac99034-a344-4fa0-b0aa-ab119973f369','d8e1ae3b-8451-436a-a59b-c7516e711b9c','97f9acb9-4e94-46e3-8845-9e825e8d6ead','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('eaf19961-16c1-449d-9945-926e20aa2275','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2ec845dc-8d3c-43f6-a12c-18245f24684c','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ec0cc87e-7dd0-42cc-a7d2-48f3eaaca87a','d8e1ae3b-8451-436a-a59b-c7516e711b9c','33c3179e-1ddc-4655-a65e-0b27ef10da8d','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ec24c11a-fdc0-494b-b18c-a4b73e4c57b6','d8e1ae3b-8451-436a-a59b-c7516e711b9c','182aab95-d10f-4bea-9b0b-093a91e7f465','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ec31a513-4f75-479c-8548-a95751e50a9d','53536a66-0d99-4ee8-b4a6-5928129d0ab6','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ed2383ef-e178-4987-8bcf-40977fe83b9c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','d3c4692f-cdc2-4063-acfb-f04c18eb145f','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('eddd8e90-7255-4e60-826f-b2ad2501ec38','e35ae728-2dc7-494e-96ce-ea95a50c092c','377979e6-846c-4f37-adf6-47f9c4fb2c24','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ee3c560a-723c-40ae-ade6-ec5a8e262e32','7bd0ce76-20a6-4475-a70f-6691bb1af471','edd516a1-4180-4f0e-ac16-292d7dd4febd','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ee61eb50-a88a-4382-8b75-94d0975eac82','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ee9c3b3a-de6d-4df6-8453-b4c32cc36631','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5cda7a43-7c89-4b54-8cea-569db5b80b39','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ef934976-5dbd-4a9e-9509-c645637dd544','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ef980891-ff53-45cb-bbd1-ec01031c97c3','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('efe4b6c4-40df-477f-a307-cddaddfc68eb','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e844697e-900e-42b2-a96a-89ff5233c29b','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f020885c-eee9-452d-8c7f-be07fd3c63fe','7bd0ce76-20a6-4475-a70f-6691bb1af471','eba566dc-95e7-4529-bf2e-656c7a490d69','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f04382cb-8926-431b-811e-584b11d9a2d5','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f07d058f-c3e7-49ba-9e38-e9f14cb362ec','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f149f4d0-3aae-4539-b6e1-d51909ae942e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3493cabc-667d-459c-bab8-3a8f7d58842e','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f1c959d2-a19e-4486-b74b-75b36ccf4bf4','53536a66-0d99-4ee8-b4a6-5928129d0ab6','9bb56ff2-6715-4838-a660-773e6c7eeb45','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f2009b3c-773a-4671-b90e-34807276a111','7bd0ce76-20a6-4475-a70f-6691bb1af471','86f8c95f-48c0-4f0c-9503-5b4605aeb378','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f2b924fe-3fc7-4d22-be72-464f0caffaea','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4312e26-edb8-4e9d-9a66-96b7f252d559','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f2bf62b4-d8c5-444d-b085-8813ee25fcf1','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f369d5d7-dd07-4ca1-a03b-9c9b60f24355','7bd0ce76-20a6-4475-a70f-6691bb1af471','88a299cc-a324-41ee-bf04-db08b0eded17','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f450fdca-090d-403b-9430-903bcb26406e','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','cf8f418e-2468-4f6c-96cf-3302a2d9fa9b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f4e10805-5d0e-4940-b0eb-9f5bd11f9c4c','53536a66-0d99-4ee8-b4a6-5928129d0ab6','e4312e26-edb8-4e9d-9a66-96b7f252d559','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f7408e21-d4e0-488c-ac5d-4a21c8b9096c','d8e1ae3b-8451-436a-a59b-c7516e711b9c','de486794-6f7d-4b69-9c21-73d65ecd1728','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f778c05c-1ad6-4e34-ac87-e7b8da8fd6cd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f7862ed2-de92-449e-8949-47b8629f8b77','d8e1ae3b-8451-436a-a59b-c7516e711b9c','7f8a7fd4-681b-410d-983c-5aca3c8bc5db','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f7a6c42f-8bc9-4736-a04b-64dd049c3fdf','e35ae728-2dc7-494e-96ce-ea95a50c092c','bd3c53a3-55eb-427a-8707-f525682955ba','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f7aa8c95-3e69-46fd-8677-796ac8a8f98a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','182aab95-d10f-4bea-9b0b-093a91e7f465','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f7dd55a3-2f46-437f-bf4b-153af708ff95','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5f19600b-38bd-43d0-b9f3-9fbdf651ba79','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f8a1a482-cc5e-4b33-9fad-794a71d7814b','53536a66-0d99-4ee8-b4a6-5928129d0ab6','2f183dc6-b8c9-4094-b464-8f3780880caa','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f8c18952-9372-411f-b128-5ca455310f8f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','c42f4890-a836-4725-ba24-7e6c8eab6016','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f913b20e-4382-4fd1-8425-b7874d241cac','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('f94d3096-a083-4d1d-9319-5a45d121e557','d8e1ae3b-8451-436a-a59b-c7516e711b9c','bd3c53a3-55eb-427a-8707-f525682955ba','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fa224578-cc73-4fa8-bbb8-6ac7fc707fcc','53536a66-0d99-4ee8-b4a6-5928129d0ab6','5fc6b135-85be-4234-970d-14918c26f958','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fad8befc-8840-4ba2-a1a0-76506811e470','e35ae728-2dc7-494e-96ce-ea95a50c092c','9bb56ff2-6715-4838-a660-773e6c7eeb45','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fb00a9bd-54a2-4561-b150-6a8d68a9af71','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','71e39291-59d3-4ed6-9ae1-0d7df7da2f91');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fb0e76aa-dc5e-409f-b72d-d5ae29f150ec','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fb1a035b-2ae6-4d1a-930a-c216bcebcbcf','d8e1ae3b-8451-436a-a59b-c7516e711b9c','377979e6-846c-4f37-adf6-47f9c4fb2c24','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fb2e2ac7-3b7e-465c-8b84-f9a6f65571b6','53536a66-0d99-4ee8-b4a6-5928129d0ab6','bd3c53a3-55eb-427a-8707-f525682955ba','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fbb8eb53-9b3c-47a9-a805-886233e27652','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fca446ac-73df-4927-890f-8f9460b6d44f','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e844697e-900e-42b2-a96a-89ff5233c29b','1c613ade-6665-49fb-b298-faf1b82dd6d2');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fd852cf7-84e4-4ba9-a89a-4c8c7144cfd7','d8e1ae3b-8451-436a-a59b-c7516e711b9c','3663fd96-913f-4b1a-8b4f-38f4c9778033','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fd894b56-58e3-4096-8459-248a808d88e3','e35ae728-2dc7-494e-96ce-ea95a50c092c','e844697e-900e-42b2-a96a-89ff5233c29b','a9ee0f5e-ff85-4f00-ac18-f6118286671d');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fd9d7f41-ee27-4962-9d03-9c549ee72403','7bd0ce76-20a6-4475-a70f-6691bb1af471','05f3393c-ff9e-46d4-ac6b-0817a3823c07','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fdac7365-aca8-4d73-b814-c381b22b4979','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','630e0452-00d6-4452-8a5c-19b2c3115ee3');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fdafd1d6-cb14-42dd-b6d6-9de1c5ddd776','d8e1ae3b-8451-436a-a59b-c7516e711b9c','813318ba-b3a7-437c-9405-016dcf48f224','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('fe7f22da-90ec-445c-842e-6d2306fc633a','53536a66-0d99-4ee8-b4a6-5928129d0ab6','56b273a2-08c6-4e9a-b31c-45c1eee0fea4','8a59a358-5a8f-4cb4-b600-9313028b911b');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('febd168d-009c-402a-9b44-4da202e2c19b','7bd0ce76-20a6-4475-a70f-6691bb1af471','e4312e26-edb8-4e9d-9a66-96b7f252d559','15b73068-6c0f-49c9-800c-a7216cb2d079');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ff72f2a3-3725-4f3d-a7df-8e36219d04fd','d8e1ae3b-8451-436a-a59b-c7516e711b9c','a9eb9610-27df-4bdb-ab51-5e6664e8b3f3','d0739946-99e0-4770-8d2a-6faf25a8457a');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ff9ac052-7cf2-4963-aecf-77da18577efd','53536a66-0d99-4ee8-b4a6-5928129d0ab6','eba566dc-95e7-4529-bf2e-656c7a490d69','8bc4d68a-ec7d-48f7-97c4-03a09836f45c');
insert into Sys_RoleAction(RoleActionID,RoleID,MenuID,ActionID) 
 values('ffcf8d09-f46a-4c37-a8d6-9f34c09f2205','d8e1ae3b-8451-436a-a59b-c7516e711b9c','5fc6b135-85be-4234-970d-14918c26f958','15b73068-6c0f-49c9-800c-a7216cb2d079');

/*  Table：Sys_User   */
insert into Sys_User(UserID,UserName,FullName,Password,PwdExpiredTime,Sex,Phone,Email,Status,LoginCount,LastLoginTime,LastLoginIP,RoleIDs,OrgIDs,CreateTime) 
 values('6a8aaec9-7fe0-430d-919d-935ebb09af40','admin2','普通管理员','nDE4HzLUuqc#',to_date('2117-10-24 18:06:21','yyyy-mm-dd hh24:mi:ss'),1,'13431142229','ab@a.com',1,8,to_date('2017-01-06 22:26:24','yyyy-mm-dd hh24:mi:ss'),'::1','53536a66-0d99-4ee8-b4a6-5928129d0ab6','6a77bc50-ad90-6265-bc5a-e0979ebf0701',to_date('2016-08-15 14:46:34','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_User(UserID,UserName,FullName,Password,PwdExpiredTime,Sex,Phone,Email,Status,LoginCount,LastLoginTime,LastLoginIP,RoleIDs,OrgIDs,CreateTime) 
 values('9869162f-9a4f-43aa-aa63-5fc260871ca4','admin3','李白','PMC4g4Nz0bI#',to_date('2126-09-30 01:35:13','yyyy-mm-dd hh24:mi:ss'),1,'13333333330','admin@admin.com',1,2,to_date('2019-05-07 21:35:35','yyyy-mm-dd hh24:mi:ss'),'::1','e35ae728-2dc7-494e-96ce-ea95a50c092c,7bd0ce76-20a6-4475-a70f-6691bb1af471','2c7a5e91-a447-b87a-0b8b-9e735252d05f',to_date('2018-09-01 16:05:30','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_User(UserID,UserName,FullName,Password,PwdExpiredTime,Sex,Phone,Email,Status,LoginCount,LastLoginTime,LastLoginIP,RoleIDs,OrgIDs,CreateTime) 
 values('bd34f8d8-ed4b-48a7-b64c-687f94c65ee9','admin4','东每胃','PMC4g4Nz0bI#',to_date('2119-04-29 04:17:57','yyyy-mm-dd hh24:mi:ss'),0,'13444445555','abb@qq.com',1,0,null,'','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4412d10-e3ff-4e97-8ba9-7e8846c0e491',to_date('2019-04-29 04:18:14','yyyy-mm-dd hh24:mi:ss'));
insert into Sys_User(UserID,UserName,FullName,Password,PwdExpiredTime,Sex,Phone,Email,Status,LoginCount,LastLoginTime,LastLoginIP,RoleIDs,OrgIDs,CreateTime) 
 values('d8e1ae3b-8451-436a-a59b-c7516e711b9c','admin','系统管理员','nDE4HzLUuqc#',to_date('2119-05-11 15:00:53','yyyy-mm-dd hh24:mi:ss'),1,'13431142222','admin@admin.com',1,433,to_date('2021-11-08 10:48:45','yyyy-mm-dd hh24:mi:ss'),'::1','d8e1ae3b-8451-436a-a59b-c7516e711b9c','e4412d10-e3ff-4e97-8ba9-7e8846c0e491,df4bb148-aa64-da5a-ef95-8122860ca567',to_date('2016-05-09 08:41:22','yyyy-mm-dd hh24:mi:ss'));

/*  Table：Sys_UserInfo   */
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('6a8aaec9-7fe0-430d-919d-935ebb09af40','','000',null);
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('9869162f-9a4f-43aa-aa63-5fc260871ca4','','这333',null);
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('b19bafcc-49e1-4a4b-948b-6e32b9e22ecd','','这是UserInfo表的信息',null);
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('bd34f8d8-ed4b-48a7-b64c-687f94c65ee9','','333bbb',null);
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('cf26280b-12a4-4ae1-9778-4511a2bc73cb','','这是UserInfo表的信息',null);
insert into Sys_UserInfo(UserInfoID,CompanyID,Memo,AreaID) 
 values('d8e1ae3b-8451-436a-a59b-c7516e711b9c','','xxxxeee',null);

