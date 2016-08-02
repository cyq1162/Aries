CREATE TABLE `Config_Excel` 
(
    `ExcelID` char(36) NOT NULL,
    `CnName` varchar(50) NULL COMMENT '模板中文名称',
    `EnName` varchar(50) NULL COMMENT '模板英文名称',
    `TableNames` varchar(400) NULL COMMENT '关联的多个表名，以逗号分隔',
    `StartIndex` int Default 0 NULL,
    `HeadCrossRowNum` int Default 0 NULL,
    `CreateTime` datetime NULL COMMENT '创建时间',
    PRIMARY KEY (`ExcelID`) 
);

CREATE TABLE `Config_ExcelInfo` 
(
    `ExceInfoID` char(36) NOT NULL,
    `ExcelID` char(36) NULL,
    `ExcelName` varchar(400) NULL COMMENT 'Excel列中文名',
    `TableName` varchar(100) NULL COMMENT '表名',
    `Field` varchar(100) NULL COMMENT '表字段名',
    `Formatter` varchar(100) NULL COMMENT '格式化',
    `IsUnique` bit Default 0 NOT NULL COMMENT '是否唯一',
    `IsForeignkey` bit NULL COMMENT '是否外键',
    `ForeignTable` varchar(100) NULL COMMENT '外键对应的表名',
    `IsRequired` bit Default 0 NULL,
    `CreateTime` datetime NULL COMMENT '创建日期',
    PRIMARY KEY (`ExceInfoID`) 
);

CREATE TABLE `Config_Grid` 
(
    `GridID` char(36) NOT NULL,
    `ObjName` varchar(50) NOT NULL,
    `ViewName` varchar(50) NULL COMMENT '下拉框对象名称',
    `Field` varchar(40) NOT NULL,
    `Title` varchar(50) NOT NULL,
    `Hidden` bit Default 0 NULL,
    `OrderNum` int Default 0 NULL,
    `Width` int Default 100 NULL,
    `Align` varchar(10) Default "center" NULL,
    `Sortable` bit NULL,
    `Formatter` varchar(50) NULL,
    `Styler` varchar(50) NULL,
    `Editor` varchar(50) NULL,
    `Rowspan` int Default 1 NULL,
    `Colspan` int Default 1 NULL,
    `Search` bit Default 0 NULL COMMENT '是否搜索',
    `DataType` varchar(50) NULL COMMENT '数据类型',
    `Import` bit NULL COMMENT '是否导入',
    `Export` bit NULL COMMENT '是否导出',
    `Frozen` bit NULL COMMENT '是否冻结列',
    `Edit` bit NULL,
    `MergeIndexed` int Default 1 NULL COMMENT '合并列索引',
    `ImportUnique` bit Default 0 NULL,
    `LastEditTime` datetime NULL,
    PRIMARY KEY (`GridID`) 
);

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

CREATE TABLE `Demo_Area` 
(
    `ID` int AUTO_INCREMENT NOT NULL,
    `Code` varchar(50) NULL,
    `Name` varchar(100) NULL,
    `PCode` varchar(50) NULL,
    `Sort` int NULL,
    `Lvl` int NULL,
    `Desc` varchar(100) NULL,
    PRIMARY KEY (`ID`) 
);

CREATE TABLE `Demo_TestA` 
(
    `ID` varchar(50) NOT NULL,
    `F1` varchar(50) NULL,
    `F2` bit NULL,
    `F3` decimal(8,2) NULL,
    `F4` int NULL,
    PRIMARY KEY (`ID`) 
);

CREATE TABLE `Demo_TestB` 
(
    `ID` varchar(50) NOT NULL,
    `F5` int NULL,
    `F6` varchar(100) NULL,
    `F7` varchar(100) NULL,
    `F8` varchar(100) NULL,
    `FK` varchar(100) NULL,
    PRIMARY KEY (`ID`) 
);

CREATE TABLE `Sys_Action` 
(
    `ActionID` char(36) NOT NULL COMMENT '功能标识',
    `ActionName` varchar(100) NOT NULL,
    `ActionRefName` varchar(100) NOT NULL,
    PRIMARY KEY (`ActionID`) 
);

CREATE TABLE `Sys_Menu` 
(
    `MenuID` char(36) NOT NULL COMMENT '菜单标识',
    `ParentMenuID` char(36) NULL COMMENT '上级ID',
    `MenuName` varchar(100) NOT NULL,
    `MenuUrl` varchar(200) NOT NULL,
    `MenuLevel` int NULL COMMENT '1,2,3分别对于 一级模块 二级模块，三级菜单',
    `SortOrder` int NOT NULL,
    `MenuIcon` varchar(500) NULL COMMENT '菜单图标路径',
    `BigMenuIcon` varchar(500) NULL COMMENT '常用菜单图标',
    `IsShortcut` bit NULL COMMENT '快捷键',
    `IsShow` int Default 1 NULL,
    `ActionIDs` varchar(500) NULL COMMENT '功能ID（以逗号分隔）',
    PRIMARY KEY (`MenuID`) 
);

CREATE TABLE `Sys_Role` 
(
    `RoleID` char(36) NOT NULL,
    `RoleName` varchar(100) NOT NULL,
    `Notes` varchar(150) NULL COMMENT '描述',
    PRIMARY KEY (`RoleID`) 
);

CREATE TABLE `Sys_RoleAction` 
(
    `RoleActionID` char(36) NOT NULL,
    `RoleID` char(36) NULL,
    `MenuID` char(36) NULL,
    `ActionID` varchar(36) NULL,
    PRIMARY KEY (`RoleActionID`) 
);

CREATE TABLE `Sys_User` 
(
    `UserID` char(36) NOT NULL,
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
    `RoleIDs` varchar(500) NULL,
    `CreateTime` datetime NULL COMMENT '创建日期',
    PRIMARY KEY (`UserID`) 
);

CREATE TABLE `Sys_UserInfo` 
(
    `UserInfoID` char(36) NOT NULL,
    `CompanyID` varchar(50) NULL,
    `Memo` varchar(150) NULL,
    `IsOk` bit NULL,
    `AreaID` char(36) NULL,
    PRIMARY KEY (`UserInfoID`) 
);

