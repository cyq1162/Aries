using System;

namespace Aries.Core.DB
{
    /// <summary>
    /// 使用多数据库枚举，可以空出默认的Conn给其它数据库使用
    /// </summary>
    public enum U_AriesEnum { Config_Grid, Sys_RoleAction, Sys_Role, Sys_Menu, Sys_Action, Config_Excel, Config_KeyValue, Config_ExcelInfo, Sys_UserInfo, Sys_User, Sys_Organization }

    #region 枚举
    public enum Config_Grid { GridID, ObjName, Rules, Field, Title, Hidden, OrderNum, Width, Align, Sortable, Formatter, Styler, Editor, Rowspan, Colspan, Search, DataType, Import, Export, Frozen, Edit, MergeIndex, ImportUnique, LastEditTime }
    public enum Sys_RoleAction { RoleActionid, Roleid, Menuid, Actionid }
    public enum Sys_Role { Roleid, RoleName, Notes }
    public enum Sys_Menu { Menuid, ParentMenuid, MenuName, MenuUrl, MenuLevel, SortOrder, MenuIcon, BigMenuIcon, IsShortcut, IsShow, Actionids }
    public enum Sys_Action { Actionid, ActionName, ActionRefName, IsEnabled, IsSys, SortOrder }
    public enum Config_Excel { Excelid, ExcelName, Description, TableNames, StartIndex, HeadCrossRowNum, WhereType, AcceptType, CreateTime }
    public enum Config_KeyValue { KeyValueid, ConfigKey, ConfigName, ConfigValue, Flag, Notes, OrderNo, CreateTime }
    public enum Config_ExcelInfo { ExceInfoid, Excelid, ExcelName, TableName, Field, Formatter, IsUnique, IsForeignkey, ForeignTable, IsRequired, CreateTime }
    public enum Sys_UserInfo { UserInfoID }
    public enum Sys_User { UserID, UserName, FullName, Password, PwdExpiredTime, Sex, Phone, Email, Status, LoginCount, LastLoginTime, LastLoginIP, Roleids,OrgIDs, CreateTime }
    public enum Sys_Organization { OrgID, OrgName, OrgFullName, OrgCode, OrgLevel, ParentOrg, CreateTime }
    #endregion
}