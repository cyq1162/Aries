CREATE TABLE [Sys_User] 
(
    [UserID] uniqueidentifier Default (newid()) NOT NULL,
    [UserName] nvarchar(100) NOT NULL,
    [FullName] nvarchar(100) NOT NULL,
    [Password] nvarchar(300) NOT NULL,
    [PwdExpiredTime] datetime NULL,
    [Sex] bit Default (1) NULL,
    [Phone] nvarchar(100) NULL,
    [Email] nvarchar(100) NULL,
    [Status] int NULL,
    [LoginCount] int Default (0) NULL,
    [LastLoginTime] datetime NULL,
    [LastLoginIP] nvarchar(50) NULL,
    [RoleIDs] nvarchar(500) NULL,
    [CreateTime] datetime Default getdate() NULL,
    PRIMARY KEY ([UserID]) 
)exec sp_addextendedproperty N'MS_Description', N'登录ID', N'user', N'dbo', N'table', N'Sys_User', N'column', N'UserName';exec sp_addextendedproperty N'MS_Description', N'用户真实姓名', N'user', N'dbo', N'table', N'Sys_User', N'column', N'FullName';exec sp_addextendedproperty N'MS_Description', N'登陆密码', N'user', N'dbo', N'table', N'Sys_User', N'column', N'Password';exec sp_addextendedproperty N'MS_Description', N'密码过期时间', N'user', N'dbo', N'table', N'Sys_User', N'column', N'PwdExpiredTime';exec sp_addextendedproperty N'MS_Description', N'性别 1男0女', N'user', N'dbo', N'table', N'Sys_User', N'column', N'Sex';exec sp_addextendedproperty N'MS_Description', N'工作电话', N'user', N'dbo', N'table', N'Sys_User', N'column', N'Phone';exec sp_addextendedproperty N'MS_Description', N'电子邮箱', N'user', N'dbo', N'table', N'Sys_User', N'column', N'Email';exec sp_addextendedproperty N'MS_Description', N'状态 1 启用 2禁用 3已删', N'user', N'dbo', N'table', N'Sys_User', N'column', N'Status';exec sp_addextendedproperty N'MS_Description', N'登录次数', N'user', N'dbo', N'table', N'Sys_User', N'column', N'LoginCount';exec sp_addextendedproperty N'MS_Description', N'最后登录时间', N'user', N'dbo', N'table', N'Sys_User', N'column', N'LastLoginTime';exec sp_addextendedproperty N'MS_Description', N'公司ID', N'user', N'dbo', N'table', N'Sys_User', N'column', N'LastLoginIP';exec sp_addextendedproperty N'MS_Description', N'创建日期', N'user', N'dbo', N'table', N'Sys_User', N'column', N'CreateTime';CREATE TABLE [Sys_RoleAction] 
(
    [RoleActionID] uniqueidentifier Default (newid()) NOT NULL,
    [RoleID] uniqueidentifier NULL,
    [MenuID] uniqueidentifier NULL,
    [ActionID] nvarchar(36) NULL,
    PRIMARY KEY ([RoleActionID]) 
)CREATE TABLE [Sys_Role] 
(
    [RoleID] uniqueidentifier Default (newid()) NOT NULL,
    [RoleName] nvarchar(100) NOT NULL,
    [Notes] nvarchar(150) NULL,
    PRIMARY KEY ([RoleID]) 
)exec sp_addextendedproperty N'MS_Description', N'描述', N'user', N'dbo', N'table', N'Sys_Role', N'column', N'Notes';CREATE TABLE [Sys_Menu] 
(
    [MenuID] uniqueidentifier Default (newid()) NOT NULL,
    [ParentMenuID] uniqueidentifier NULL,
    [MenuName] nvarchar(100) NOT NULL,
    [MenuUrl] nvarchar(200) NOT NULL,
    [MenuLevel] int NULL,
    [SortOrder] int NOT NULL,
    [MenuIcon] nvarchar(500) NULL,
    [BigMenuIcon] nvarchar(500) NULL,
    [IsShortcut] bit NULL,
    [IsShow] int Default (1) NULL,
    [ActionIDs] nvarchar(500) NULL,
    PRIMARY KEY ([MenuID]) 
)exec sp_addextendedproperty N'MS_Description', N'菜单标识', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'MenuID';exec sp_addextendedproperty N'MS_Description', N'上级ID', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'ParentMenuID';exec sp_addextendedproperty N'MS_Description', N'1,2,3分别对于 一级模块 二级模块，三级菜单', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'MenuLevel';exec sp_addextendedproperty N'MS_Description', N'菜单图标路径', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'MenuIcon';exec sp_addextendedproperty N'MS_Description', N'常用菜单图标', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'BigMenuIcon';exec sp_addextendedproperty N'MS_Description', N'快捷键', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'IsShortcut';exec sp_addextendedproperty N'MS_Description', N'功能ID（以逗号分隔）', N'user', N'dbo', N'table', N'Sys_Menu', N'column', N'ActionIDs';CREATE TABLE [Sys_Action] 
(
    [ActionID] uniqueidentifier Default (newid()) NOT NULL,
    [ActionName] nvarchar(100) NOT NULL,
    [ActionRefName] nvarchar(100) NOT NULL,
    PRIMARY KEY ([ActionID]) 
)exec sp_addextendedproperty N'MS_Description', N'功能标识', N'user', N'dbo', N'table', N'Sys_Action', N'column', N'ActionID';CREATE TABLE [Config_KeyValue] 
(
    [KeyValueID] uniqueidentifier Default (newid()) NOT NULL,
    [ConfigKey] nvarchar(100) NOT NULL,
    [ConfigName] nvarchar(100) NOT NULL,
    [ConfigValue] nvarchar(300) NOT NULL,
    [Flag] nvarchar(100) NULL,
    [Notes] nvarchar(1000) NULL,
    [OrderNo] int Default (999) NULL,
    [CreateTime] datetime Default getdate() NULL,
    PRIMARY KEY ([KeyValueID]) 
)exec sp_addextendedproperty N'MS_Description', N'配置表标识', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'KeyValueID';exec sp_addextendedproperty N'MS_Description', N'配置键', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'ConfigKey';exec sp_addextendedproperty N'MS_Description', N'配置名称', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'ConfigName';exec sp_addextendedproperty N'MS_Description', N'配置值', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'ConfigValue';exec sp_addextendedproperty N'MS_Description', N'分类标记', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'Flag';exec sp_addextendedproperty N'MS_Description', N'备注', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'Notes';exec sp_addextendedproperty N'MS_Description', N'排序号', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'OrderNo';exec sp_addextendedproperty N'MS_Description', N'创建日期', N'user', N'dbo', N'table', N'Config_KeyValue', N'column', N'CreateTime';CREATE TABLE [Config_Grid] 
(
    [GridID] uniqueidentifier Default (newid()) NOT NULL,
    [ObjName] varchar(50) NOT NULL,
    [ViewName] nvarchar(50) NULL,
    [Field] varchar(40) NOT NULL,
    [Title] nvarchar(50) NOT NULL,
    [Hidden] bit Default (0) NULL,
    [OrderNum] int Default (0) NULL,
    [Width] int Default (100) NULL,
    [Align] varchar(10) Default (N'center') NULL,
    [Sortable] bit NULL,
    [Formatter] nvarchar(50) NULL,
    [Styler] varchar(50) NULL,
    [Editor] varchar(50) NULL,
    [Rowspan] int Default (1) NULL,
    [Colspan] int Default (1) NULL,
    [Search] bit Default (0) NULL,
    [DataType] varchar(50) NULL,
    [Import] bit NULL,
    [Export] bit NULL,
    [Frozen] bit NULL,
    [Edit] bit NULL,
    [MergeIndexed] int Default (1) NULL,
    [ImportUnique] bit Default (0) NULL,
    [LastEditTime] datetime Default getdate() NULL,
    PRIMARY KEY ([GridID]) 
)exec sp_addextendedproperty N'MS_Description', N'下拉框对象名称', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'ViewName';exec sp_addextendedproperty N'MS_Description', N'是否搜索', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'Search';exec sp_addextendedproperty N'MS_Description', N'数据类型', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'DataType';exec sp_addextendedproperty N'MS_Description', N'是否导入', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'Import';exec sp_addextendedproperty N'MS_Description', N'是否导出', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'Export';exec sp_addextendedproperty N'MS_Description', N'是否冻结列', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'Frozen';exec sp_addextendedproperty N'MS_Description', N'合并列索引', N'user', N'dbo', N'table', N'Config_Grid', N'column', N'MergeIndexed';CREATE TABLE [Config_ExcelInfo] 
(
    [ExceInfoID] uniqueidentifier Default (newid()) NOT NULL,
    [ExcelID] uniqueidentifier NULL,
    [ExcelName] nvarchar(400) NULL,
    [TableName] nvarchar(100) NULL,
    [Field] nvarchar(100) NULL,
    [Formatter] nvarchar(100) NULL,
    [IsUnique] bit Default (0) NOT NULL,
    [IsForeignkey] bit NULL,
    [ForeignTable] nvarchar(100) NULL,
    [IsRequired] bit Default (0) NULL,
    [CreateTime] datetime Default getdate() NULL,
    PRIMARY KEY ([ExceInfoID]) 
)exec sp_addextendedproperty N'MS_Description', N'Excel列中文名', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'ExcelName';exec sp_addextendedproperty N'MS_Description', N'表名', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'TableName';exec sp_addextendedproperty N'MS_Description', N'表字段名', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'Field';exec sp_addextendedproperty N'MS_Description', N'格式化', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'Formatter';exec sp_addextendedproperty N'MS_Description', N'是否唯一', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'IsUnique';exec sp_addextendedproperty N'MS_Description', N'是否外键', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'IsForeignkey';exec sp_addextendedproperty N'MS_Description', N'外键对应的表名', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'ForeignTable';exec sp_addextendedproperty N'MS_Description', N'创建日期', N'user', N'dbo', N'table', N'Config_ExcelInfo', N'column', N'CreateTime';CREATE TABLE [Config_Excel] 
(
    [ExcelID] uniqueidentifier Default (newid()) NOT NULL,
    [CnName] nvarchar(50) NULL,
    [EnName] varchar(50) NULL,
    [TableNames] nvarchar(400) NULL,
    [StartIndex] int Default (0) NULL,
    [HeadCrossRowNum] int Default (0) NULL,
    [CreateTime] datetime Default getdate() NULL,
    PRIMARY KEY ([ExcelID]) 
)exec sp_addextendedproperty N'MS_Description', N'模板中文名称', N'user', N'dbo', N'table', N'Config_Excel', N'column', N'CnName';exec sp_addextendedproperty N'MS_Description', N'模板英文名称', N'user', N'dbo', N'table', N'Config_Excel', N'column', N'EnName';exec sp_addextendedproperty N'MS_Description', N'关联的多个表名，以逗号分隔', N'user', N'dbo', N'table', N'Config_Excel', N'column', N'TableNames';exec sp_addextendedproperty N'MS_Description', N'创建时间', N'user', N'dbo', N'table', N'Config_Excel', N'column', N'CreateTime';CREATE TABLE [Sys_UserInfo] 
(
    [UserInfoID] uniqueidentifier Default (newid()) NOT NULL,
    [CompanyID] nvarchar(50) NULL,
    [Memo] nvarchar(150) NULL,
    [IsOk] bit NULL,
    [AreaID] uniqueidentifier NULL,
    PRIMARY KEY ([UserInfoID]) 
)
CREATE TABLE [Demo_Area] 
(
    [ID] int IDENTITY(1,1) NOT NULL,
    [Code] varchar(50) NULL,
    [Name] varchar(100) NULL,
    [PCode] varchar(50) NULL,
    [Sort] int NULL,
    [Lvl] int NULL,
    [Desc] varchar(100) NULL,
    PRIMARY KEY ([ID]) 
)CREATE TABLE [Demo_TestA] 
(
    [ID] varchar(50) NOT NULL,
    [F1] varchar(50) NULL,
    [F2] bit NULL,
    [F3] decimal(8,2) NULL,
    [F4] int NULL,
    PRIMARY KEY ([ID]) 
)CREATE TABLE [Demo_TestB] 
(
    [ID] varchar(50) NOT NULL,
    [F5] int NULL,
    [F6] varchar(100) NULL,
    [F7] varchar(100) NULL,
    [F8] varchar(100) NULL,
    [FK] varchar(100) NULL,
    PRIMARY KEY ([ID]) 
)