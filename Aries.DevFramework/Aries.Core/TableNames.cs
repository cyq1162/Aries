using System;

namespace Aries.Core.DB
{
    public enum TableNames { Config_Grid, Sys_RoleAction, Sys_Role, Sys_Menu, Sys_Action, Config_Excel, Config_KeyValue, Config_ExcelInfo, Sys_UserInfo, Sys_User }

    #region Ã¶¾Ù
    public enum Config_Grid { GridID, ObjName, Rules, Field, Title, Hidden, OrderNum, Width, Align, Sortable, Formatter, Styler, Editor, Rowspan, Colspan, Search, DataType, Import, Export, Frozen, Edit, MergeIndex, ImportUnique, LastEditTime }
    public enum Sys_RoleAction { RoleActionID, RoleID, MenuID, ActionID }
    public enum Sys_Role { RoleID, RoleName, Notes }
    public enum Sys_Menu { MenuID, ParentMenuID, MenuName, MenuUrl, MenuLevel, SortOrder, MenuIcon, BigMenuIcon, IsShortcut, IsShow, ActionIDs }
    public enum Sys_Action { ActionID, ActionName, ActionRefName, IsEnabled, IsSys, SortOrder }
    public enum Config_Excel { ExcelID, ExcelName, Description, TableNames, StartIndex, HeadCrossRowNum, WhereType, AcceptType, CreateTime }
    public enum Config_KeyValue { KeyValueID, ConfigKey, ConfigName, ConfigValue, Flag, Notes, OrderNo, CreateTime }
    public enum Config_ExcelInfo { ExceInfoID, ExcelID, ExcelName, TableName, Field, Formatter, IsUnique, IsForeignkey, ForeignTable, IsRequired, CreateTime }
    public enum Sys_UserInfo { UserInfoID }
    public enum Sys_User { UserID, UserName, FullName, Password, PwdExpiredTime, Sex, Phone, Email, Status, LoginCount, LastLoginTime, LastLoginIP, RoleIDs, CreateTime }
    #endregion
}