using System;

namespace Aries.Core.DB
{
    public enum TableNames { Sys_Action , Sys_Menu , Sys_Role , Sys_RoleAction , Sys_UserInfo , Sys_User , Config_KeyValue , Config_Grid , Config_ExcelInfo , Config_Excel }

    #region Ã¶¾Ù 
    public enum Sys_Action { ActionID , ActionName , ActionRefName }
    public enum Sys_Menu { MenuID , ParentMenuID , MenuName , MenuUrl , MenuLevel , SortOrder , MenuIcon , BigMenuIcon , IsShortcut , IsShow , ActionIDs }
    public enum Sys_Role { RoleID , RoleName , Notes }
    public enum Sys_RoleAction { RoleActionID , RoleID , MenuID , ActionID }
    public enum Sys_UserInfo { UserInfoID , CompanyID , Memo , IsOk , AreaID }
    public enum Sys_User { UserID , UserName , FullName , Password , PwdExpiredTime , Sex , Phone , Email , Status , LoginCount , LastLoginTime , LastLoginIP , RoleIDs , CreateTime }
    public enum Config_KeyValue { KeyValueID , ConfigKey , ConfigName , ConfigValue , Flag , Notes , OrderNo , CreateTime }
    public enum Config_Grid { GridID , ObjName , Rules , Field , Title , Hidden , OrderNum , Width , Align , Sortable , Formatter , Styler , Editor , Rowspan , Colspan , Search , DataType , Import , Export , Frozen , Edit , MergeIndexed , ImportUnique , LastEditTime }
    public enum Config_ExcelInfo { ExceInfoID , ExcelID , ExcelName , TableName , Field , Formatter , IsUnique , IsForeignkey , ForeignTable , IsRequired , CreateTime }
    public enum Config_Excel { ExcelID , CnName , EnName , TableNames , StartIndex , HeadCrossRowNum , CreateTime }
    #endregion
}