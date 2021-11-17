CREATE TABLE Config_Excel 
(
    ExcelID char(36) Default (SYS_GUID()) NOT NULL,
    ExcelName nvarchar2(50) NULL,
    Description nvarchar2(100) NULL,
    TableNames nvarchar2(400) NULL,
    StartIndex NUMBER(10) Default 0 NULL,
    HeadCrossRowNum NUMBER(10) Default 1 NULL,
    WhereType NUMBER(3) Default 0 NULL,
    AcceptType NUMBER(3) Default 0 NULL,
    CreateTime date Default sysdate NULL,
    PRIMARY KEY (ExcelID) 
)

comment on column CONFIG_EXCEL.EXCELID  is '主键';
comment on column CONFIG_EXCEL.EXCELNAME  is 'Excel名称';
comment on column CONFIG_EXCEL.DESCRIPTION  is '模板描述';
comment on column CONFIG_EXCEL.TABLENAMES  is '关联表名，逗号分隔';
comment on column CONFIG_EXCEL.STARTINDEX  is '起始索引';
comment on column CONFIG_EXCEL.HEADCROSSROWNUM  is '列头跨几行';
comment on column CONFIG_EXCEL.WHERETYPE  is '条件方式（and、or）';
comment on column CONFIG_EXCEL.ACCEPTTYPE  is '操作类型（0：插入或更新；1；仅插入；2；仅更新）';
comment on column CONFIG_EXCEL.CREATETIME  is '创建时间';
comment on table CONFIG_EXCEL  is '';

CREATE TABLE Config_ExcelInfo 
(
    ExceInfoID char(36) Default (SYS_GUID()) NOT NULL,
    ExcelID char(36) NULL,
    ExcelName nvarchar2(400) NULL,
    TableName nvarchar2(100) NULL,
    Field nvarchar2(100) NULL,
    Formatter nvarchar2(100) NULL,
    IsUnique NUMBER(1) Default 0 NOT NULL,
    IsForeignkey NUMBER(1) NULL,
    ForeignTable nvarchar2(100) NULL,
    IsRequired NUMBER(1) Default 0 NULL,
    CreateTime date Default sysdate NULL,
    PRIMARY KEY (ExceInfoID) 
)

comment on column CONFIG_EXCELINFO.EXCEINFOID  is '主键';
comment on column CONFIG_EXCELINFO.EXCELID  is '外键ID';
comment on column CONFIG_EXCELINFO.EXCELNAME  is 'Excel列名';
comment on column CONFIG_EXCELINFO.TABLENAME  is '表名';
comment on column CONFIG_EXCELINFO.FIELD  is '表字段名';
comment on column CONFIG_EXCELINFO.FORMATTER  is '格式化';
comment on column CONFIG_EXCELINFO.ISUNIQUE  is '是否唯一';
comment on column CONFIG_EXCELINFO.ISFOREIGNKEY  is '是否外键';
comment on column CONFIG_EXCELINFO.FOREIGNTABLE  is '外键对应的表名';
comment on column CONFIG_EXCELINFO.ISREQUIRED  is '是否必填';
comment on column CONFIG_EXCELINFO.CREATETIME  is '创建日期';
comment on table CONFIG_EXCELINFO  is '';

CREATE TABLE Config_Grid 
(
    GridID char(36) Default (SYS_GUID()) NOT NULL,
    ObjName nvarchar2(50) NOT NULL,
    Rules nvarchar2(250) NULL,
    Field nvarchar2(40) NOT NULL,
    Title nvarchar2(50) NOT NULL,
    Hidden NUMBER(1) Default 0 NULL,
    OrderNum NUMBER(10) Default 0 NULL,
    Width NUMBER(10) Default 100 NULL,
    Align nvarchar2(10) Default 'center' NULL,
    Sortable NUMBER(1) NULL,
    Formatter nvarchar2(50) NULL,
    Styler nvarchar2(50) NULL,
    Editor nvarchar2(50) NULL,
    Rowspan NUMBER(3) Default 1 NULL,
    Colspan NUMBER(3) Default 1 NULL,
    Search NUMBER(1) Default 0 NULL,
    DataType nvarchar2(50) NULL,
    Import NUMBER(1) NULL,
    Export NUMBER(1) NULL,
    Frozen NUMBER(1) NULL,
    Edit NUMBER(1) NULL,
    MergeIndex NUMBER(3) Default 1 NULL,
    ImportUnique NUMBER(1) Default 0 NULL,
    LastEditTime date Default sysdate NULL,
    PRIMARY KEY (GridID) 
)

comment on column CONFIG_GRID.GRIDID  is '主键';
comment on column CONFIG_GRID.OBJNAME  is '对象名称（表或视图）';
comment on column CONFIG_GRID.RULES  is '下拉框对象名称';
comment on column CONFIG_GRID.FIELD  is '字段名';
comment on column CONFIG_GRID.TITLE  is '标题';
comment on column CONFIG_GRID.HIDDEN  is '隐藏';
comment on column CONFIG_GRID.ORDERNUM  is '排序号';
comment on column CONFIG_GRID.WIDTH  is '宽度';
comment on column CONFIG_GRID.ALIGN  is '对齐方式';
comment on column CONFIG_GRID.SORTABLE  is '是否可排序';
comment on column CONFIG_GRID.FORMATTER  is '格式化';
comment on column CONFIG_GRID.STYLER  is '样式函数';
comment on column CONFIG_GRID.EDITOR  is '行内编辑函数';
comment on column CONFIG_GRID.ROWSPAN  is '跨行数';
comment on column CONFIG_GRID.COLSPAN  is '跨列数';
comment on column CONFIG_GRID.SEARCH  is '是否搜索';
comment on column CONFIG_GRID.DATATYPE  is '数据类型|长度|精度|必填';
comment on column CONFIG_GRID.IMPORT  is '是否导入';
comment on column CONFIG_GRID.EXPORT  is '是否导出';
comment on column CONFIG_GRID.FROZEN  is '是否冻结列';
comment on column CONFIG_GRID.EDIT  is '行内编辑';
comment on column CONFIG_GRID.MERGEINDEX  is '合并列索引（已无用）';
comment on column CONFIG_GRID.IMPORTUNIQUE  is '导入唯一键';
comment on column CONFIG_GRID.LASTEDITTIME  is '最后更新时间';
comment on table CONFIG_GRID  is '';

CREATE TABLE Config_KeyValue 
(
    KeyValueID char(36) Default (SYS_GUID()) NOT NULL,
    ConfigKey nvarchar2(100) NOT NULL,
    ConfigName nvarchar2(100) NOT NULL,
    ConfigValue nvarchar2(300) NOT NULL,
    Flag nvarchar2(100) NULL,
    Notes nvarchar2(1000) NULL,
    OrderNo NUMBER(10) Default 999 NULL,
    CreateTime date Default sysdate NULL,
    PRIMARY KEY (KeyValueID) 
)

comment on column CONFIG_KEYVALUE.KEYVALUEID  is '配置表标识';
comment on column CONFIG_KEYVALUE.CONFIGKEY  is '配置键';
comment on column CONFIG_KEYVALUE.CONFIGNAME  is '配置名称';
comment on column CONFIG_KEYVALUE.CONFIGVALUE  is '配置值';
comment on column CONFIG_KEYVALUE.FLAG  is '分类标记';
comment on column CONFIG_KEYVALUE.NOTES  is '备注';
comment on column CONFIG_KEYVALUE.ORDERNO  is '排序号';
comment on column CONFIG_KEYVALUE.CREATETIME  is '创建日期';
comment on table CONFIG_KEYVALUE  is '';

CREATE TABLE Sys_Action 
(
    ActionID char(36) Default (SYS_GUID()) NOT NULL,
    ActionName nvarchar2(100) NOT NULL,
    ActionRefName nvarchar2(100) NOT NULL,
    IsEnabled NUMBER(1) Default 1 NULL,
    IsSys NUMBER(1) Default 0 NULL,
    SortOrder NUMBER(10) Default 999 NULL,
    PRIMARY KEY (ActionID) 
)

comment on column SYS_ACTION.ACTIONID  is '功能标识';
comment on column SYS_ACTION.ACTIONNAME  is '中文描述';
comment on column SYS_ACTION.ACTIONREFNAME  is '英文引用';
comment on column SYS_ACTION.ISENABLED  is '是否启用';
comment on table SYS_ACTION  is '';

CREATE TABLE Sys_Menu 
(
    MenuID char(36) Default (SYS_GUID()) NOT NULL,
    ParentMenuID char(36) NULL,
    MenuName nvarchar2(100) NOT NULL,
    MenuUrl nvarchar2(200) NOT NULL,
    MenuLevel NUMBER(10) NULL,
    SortOrder NUMBER(10) NOT NULL,
    MenuIcon nvarchar2(500) NULL,
    BigMenuIcon nvarchar2(500) NULL,
    IsShortcut NUMBER(1) NULL,
    IsShow NUMBER(10) Default 1 NULL,
    ActionIDs nvarchar2(500) NULL,
    PRIMARY KEY (MenuID) 
)

comment on column SYS_MENU.MENUID  is '菜单标识';
comment on column SYS_MENU.PARENTMENUID  is '上级ID';
comment on column SYS_MENU.MENUNAME  is '菜单名称';
comment on column SYS_MENU.MENUURL  is '菜单地址';
comment on column SYS_MENU.MENULEVEL  is '菜单层级';
comment on column SYS_MENU.SORTORDER  is '排序号';
comment on column SYS_MENU.MENUICON  is '菜单图标路径（未用到）';
comment on column SYS_MENU.BIGMENUICON  is '常用菜单图标（未用到）';
comment on column SYS_MENU.ISSHORTCUT  is '快捷键（未用到）';
comment on column SYS_MENU.ISSHOW  is '是否显示';
comment on column SYS_MENU.ACTIONIDS  is '菜果的功能ID（以逗号分隔）';
comment on table SYS_MENU  is '';

CREATE TABLE Sys_Organization 
(
    OrgID char(36) Default (SYS_GUID()) NOT NULL,
    OrgName nvarchar2(100) NOT NULL,
    OrgFullName nvarchar2(100) NOT NULL,
    OrgCode nvarchar2(300) NOT NULL,
    OrgLevel NUMBER(10) NULL,
    ParentOrgID nvarchar2(50) NULL,
    CreateTime date Default sysdate NULL,
    PRIMARY KEY (OrgID) 
)

comment on column SYS_ORGANIZATION.ORGID  is '主键';
comment on column SYS_ORGANIZATION.ORGNAME  is '组织名称';
comment on column SYS_ORGANIZATION.ORGFULLNAME  is '组织全称';
comment on column SYS_ORGANIZATION.ORGCODE  is '组织代码';
comment on column SYS_ORGANIZATION.ORGLEVEL  is '组织层级';
comment on column SYS_ORGANIZATION.PARENTORGID  is '上级组织';
comment on column SYS_ORGANIZATION.CREATETIME  is '创建日期';
comment on table SYS_ORGANIZATION  is '';

CREATE TABLE Sys_Role 
(
    RoleID char(36) Default (SYS_GUID()) NOT NULL,
    RoleName nvarchar2(100) NOT NULL,
    Notes nvarchar2(150) NULL,
    PRIMARY KEY (RoleID) 
)

comment on column SYS_ROLE.ROLEID  is '主键';
comment on column SYS_ROLE.ROLENAME  is '角色名称';
comment on column SYS_ROLE.NOTES  is '描述';
comment on table SYS_ROLE  is '';

CREATE TABLE Sys_RoleAction 
(
    RoleActionID char(36) Default (SYS_GUID()) NOT NULL,
    RoleID char(36) NULL,
    MenuID char(36) NULL,
    ActionID nvarchar2(36) NULL,
    PRIMARY KEY (RoleActionID) 
)

comment on column SYS_ROLEACTION.ROLEACTIONID  is '主键';
comment on column SYS_ROLEACTION.ROLEID  is '角色ID';
comment on column SYS_ROLEACTION.MENUID  is '菜单ID';
comment on column SYS_ROLEACTION.ACTIONID  is '权限功能ID';
comment on table SYS_ROLEACTION  is '';

CREATE TABLE Sys_User 
(
    UserID char(36) Default (SYS_GUID()) NOT NULL,
    UserName nvarchar2(100) NOT NULL,
    FullName nvarchar2(100) NOT NULL,
    Password nvarchar2(300) NOT NULL,
    PwdExpiredTime date NULL,
    Sex NUMBER(1) Default 1 NULL,
    Phone nvarchar2(100) NULL,
    Email nvarchar2(100) NULL,
    Status NUMBER(10) NULL,
    LoginCount NUMBER(10) Default 0 NULL,
    LastLoginTime date NULL,
    LastLoginIP nvarchar2(50) NULL,
    RoleIDs nvarchar2(500) NULL,
    OrgIDs nvarchar2(500) NULL,
    CreateTime date Default sysdate NULL,
    PRIMARY KEY (UserID) 
)

comment on column SYS_USER.USERID  is '主键';
comment on column SYS_USER.USERNAME  is '登录ID';
comment on column SYS_USER.FULLNAME  is '用户真实姓名';
comment on column SYS_USER.PASSWORD  is '登陆密码';
comment on column SYS_USER.PWDEXPIREDTIME  is '密码过期时间';
comment on column SYS_USER.SEX  is '性别 1男0女';
comment on column SYS_USER.PHONE  is '工作电话';
comment on column SYS_USER.EMAIL  is '电子邮箱';
comment on column SYS_USER.STATUS  is '状态 1 启用 2禁用 3已删';
comment on column SYS_USER.LOGINCOUNT  is '登录次数';
comment on column SYS_USER.LASTLOGINTIME  is '最后登录时间';
comment on column SYS_USER.LASTLOGINIP  is '公司ID';
comment on column SYS_USER.ROLEIDS  is '角色ID（可以多个）';
comment on column SYS_USER.ORGIDS  is '组织ID（可以多个）';
comment on column SYS_USER.CREATETIME  is '创建日期';
comment on table SYS_USER  is '用户表';

CREATE TABLE Sys_UserInfo 
(
    UserInfoID char(36) Default (SYS_GUID()) NOT NULL,
    CompanyID nvarchar2(50) NULL,
    Memo nvarchar2(150) NULL,
    AreaID char(36) NULL,
    PRIMARY KEY (UserInfoID) 
)

comment on column SYS_USERINFO.USERINFOID  is '用户ID';
comment on column SYS_USERINFO.COMPANYID  is '公司ID（未用到）';
comment on column SYS_USERINFO.MEMO  is '用户备注';
comment on column SYS_USERINFO.AREAID  is '区域ID（未用到）';
comment on table SYS_USERINFO  is '';

