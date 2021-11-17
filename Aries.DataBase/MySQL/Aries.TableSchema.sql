CREATE TABLE `Config_Excel` 
(
    `ExcelID` char(36) NOT NULL COMMENT '主键',
    `ExcelName` varchar(50) NULL COMMENT 'Excel名称',
    `Description` varchar(100) NULL COMMENT '模板描述',
    `TableNames` varchar(400) NULL COMMENT '关联表名，逗号分隔',
    `StartIndex` int Default 0 NULL COMMENT '起始索引',
    `HeadCrossRowNum` int Default 1 NULL COMMENT '列头跨几行',
    `WhereType` tinyint(3) UNSIGNED Default 0 NULL COMMENT '条件方式（and、or）',
    `AcceptType` tinyint(3) UNSIGNED Default 0 NULL COMMENT '操作类型（0：插入或更新；1；仅插入；2；仅更新）',
    `CreateTime` datetime NULL COMMENT '创建时间',
    PRIMARY KEY (`ExcelID`) 
);

comment = '';

CREATE TABLE `Config_ExcelInfo` 
(
    `ExceInfoID` char(36) NOT NULL COMMENT '主键',
    `ExcelID` char(36) NULL COMMENT '外键ID',
    `ExcelName` varchar(400) NULL COMMENT 'Excel列名',
    `TableName` varchar(100) NULL COMMENT '表名',
    `Field` varchar(100) NULL COMMENT '表字段名',
    `Formatter` varchar(100) NULL COMMENT '格式化',
    `IsUnique` bit Default 0 NOT NULL COMMENT '是否唯一',
    `IsForeignkey` bit NULL COMMENT '是否外键',
    `ForeignTable` varchar(100) NULL COMMENT '外键对应的表名',
    `IsRequired` bit Default 0 NULL COMMENT '是否必填',
    `CreateTime` datetime NULL COMMENT '创建日期',
    PRIMARY KEY (`ExceInfoID`) 
);

comment = '';

CREATE TABLE `Config_Grid` 
(
    `GridID` char(36) NOT NULL COMMENT '主键',
    `ObjName` varchar(50) NOT NULL COMMENT '对象名称（表或视图）',
    `Rules` varchar(250) NULL COMMENT '下拉框对象名称',
    `Field` varchar(40) NOT NULL COMMENT '字段名',
    `Title` varchar(50) NOT NULL COMMENT '标题',
    `Hidden` bit Default 0 NULL COMMENT '隐藏',
    `OrderNum` int Default 0 NULL COMMENT '排序号',
    `Width` int Default 100 NULL COMMENT '宽度',
    `Align` varchar(10) Default "center" NULL COMMENT '对齐方式',
    `Sortable` bit NULL COMMENT '是否可排序',
    `Formatter` varchar(50) NULL COMMENT '格式化',
    `Styler` varchar(50) NULL COMMENT '样式函数',
    `Editor` varchar(50) NULL COMMENT '行内编辑函数',
    `Rowspan` tinyint(3) UNSIGNED Default 1 NULL COMMENT '跨行数',
    `Colspan` tinyint(3) UNSIGNED Default 1 NULL COMMENT '跨列数',
    `Search` bit Default 0 NULL COMMENT '是否搜索',
    `DataType` varchar(50) NULL COMMENT '数据类型|长度|精度|必填',
    `Import` bit NULL COMMENT '是否导入',
    `Export` bit NULL COMMENT '是否导出',
    `Frozen` bit NULL COMMENT '是否冻结列',
    `Edit` bit NULL COMMENT '行内编辑',
    `MergeIndex` tinyint(3) UNSIGNED Default 1 NULL COMMENT '合并列索引（已无用）',
    `ImportUnique` bit Default 0 NULL COMMENT '导入唯一键',
    `LastEditTime` datetime NULL COMMENT '最后更新时间',
    PRIMARY KEY (`GridID`) 
);

comment = '';

CREATE TABLE `Config_KeyValue` 
(
    `KeyValueID` char(36) NOT NULL COMMENT '配置表标识',
    `ConfigKey` varchar(100) NOT NULL COMMENT '配置键',
    `ConfigName` varchar(100) NOT NULL COMMENT '配置名称',
    `ConfigValue` varchar(300) NOT NULL COMMENT '配置值',
    `Flag` varchar(100) NULL COMMENT '分类标记',
    `Notes` varchar(1000) NULL COMMENT '备注',
    `OrderNo` int Default 999 NULL COMMENT '排序号',
    `CreateTime` datetime NULL COMMENT '创建日期',
    PRIMARY KEY (`KeyValueID`) 
);

comment = '';

CREATE TABLE `Sys_Action` 
(
    `ActionID` char(36) NOT NULL COMMENT '功能标识',
    `ActionName` varchar(100) NOT NULL COMMENT '中文描述',
    `ActionRefName` varchar(100) NOT NULL COMMENT '英文引用',
    `IsEnabled` bit Default 1 NULL COMMENT '是否启用',
    `IsSys` bit Default 0 NULL,
    `SortOrder` int Default 999 NULL,
    PRIMARY KEY (`ActionID`) 
);

comment = '';

CREATE TABLE `Sys_Menu` 
(
    `MenuID` char(36) NOT NULL COMMENT '菜单标识',
    `ParentMenuID` char(36) NULL COMMENT '上级ID',
    `MenuName` varchar(100) NOT NULL COMMENT '菜单名称',
    `MenuUrl` varchar(200) NOT NULL COMMENT '菜单地址',
    `MenuLevel` int NULL COMMENT '菜单层级',
    `SortOrder` int NOT NULL COMMENT '排序号',
    `MenuIcon` varchar(500) NULL COMMENT '菜单图标路径（未用到）',
    `BigMenuIcon` varchar(500) NULL COMMENT '常用菜单图标（未用到）',
    `IsShortcut` bit NULL COMMENT '快捷键（未用到）',
    `IsShow` int Default 1 NULL COMMENT '是否显示',
    `ActionIDs` varchar(500) NULL COMMENT '菜果的功能ID（以逗号分隔）',
    PRIMARY KEY (`MenuID`) 
);

comment = '';

CREATE TABLE `Sys_Organization` 
(
    `OrgID` char(36) NOT NULL COMMENT '主键',
    `OrgName` varchar(100) NOT NULL COMMENT '组织名称',
    `OrgFullName` varchar(100) NOT NULL COMMENT '组织全称',
    `OrgCode` varchar(300) NOT NULL COMMENT '组织代码',
    `OrgLevel` int NULL COMMENT '组织层级',
    `ParentOrgID` varchar(50) NULL COMMENT '上级组织',
    `CreateTime` datetime NULL COMMENT '创建日期',
    PRIMARY KEY (`OrgID`) 
);

comment = '';

CREATE TABLE `Sys_Role` 
(
    `RoleID` char(36) NOT NULL COMMENT '主键',
    `RoleName` varchar(100) NOT NULL COMMENT '角色名称',
    `Notes` varchar(150) NULL COMMENT '描述',
    PRIMARY KEY (`RoleID`) 
);

comment = '';

CREATE TABLE `Sys_RoleAction` 
(
    `RoleActionID` char(36) NOT NULL COMMENT '主键',
    `RoleID` char(36) NULL COMMENT '角色ID',
    `MenuID` char(36) NULL COMMENT '菜单ID',
    `ActionID` varchar(36) NULL COMMENT '权限功能ID',
    PRIMARY KEY (`RoleActionID`) 
);

comment = '';

CREATE TABLE `Sys_User` 
(
    `UserID` char(36) NOT NULL COMMENT '主键',
    `UserName` varchar(100) NOT NULL COMMENT '登录ID',
    `FullName` varchar(100) NOT NULL COMMENT '用户真实姓名',
    `Password` varchar(300) NOT NULL COMMENT '登陆密码',
    `PwdExpiredTime` datetime NULL COMMENT '密码过期时间',
    `Sex` bit Default 1 NULL COMMENT '性别 1男0女',
    `Phone` varchar(100) NULL COMMENT '工作电话',
    `Email` varchar(100) NULL COMMENT '电子邮箱',
    `Status` int NULL COMMENT '状态 1 启用 2禁用 3已删',
    `LoginCount` int Default 0 NULL COMMENT '登录次数',
    `LastLoginTime` datetime NULL COMMENT '最后登录时间',
    `LastLoginIP` varchar(50) NULL COMMENT '公司ID',
    `RoleIDs` varchar(500) NULL COMMENT '角色ID（可以多个）',
    `OrgIDs` varchar(500) NULL COMMENT '组织ID（可以多个）',
    `CreateTime` datetime NULL COMMENT '创建日期',
    PRIMARY KEY (`UserID`) 
);

comment = '用户表';

CREATE TABLE `Sys_UserInfo` 
(
    `UserInfoID` char(36) NOT NULL COMMENT '用户ID',
    `CompanyID` varchar(50) NULL COMMENT '公司ID（未用到）',
    `Memo` varchar(150) NULL COMMENT '用户备注',
    `AreaID` char(36) NULL COMMENT '区域ID（未用到）',
    PRIMARY KEY (`UserInfoID`) 
);

comment = '';

