using System;

namespace Web.Core
{
    public enum TableNames { System_Action , PB_File , Excel_Data , System_Role , testagain , testList , PB_Config , Test , TestUser , V_SYS_Test1 , PB_GridConfig , PB_ExcelConfig , System_Department , System_UserInfo , System_Users , PB_ExcelInfo , PB_Area , System_Menu , PB_Company , System_RoleAction }

    #region √∂æŸ 
    public enum System_Action { ActionID , ActionName , ActionRefName }
    public enum PB_File { FileID , FileName , FilePath , FileSize , FileTypeID , BusinessKey , PaiSheZhangHao , PaiSheZhangHaoName , PSAddrs , PSLatitude , PSLongitude , PSTime , HashCode , WFCode , StepID , Creator , CreatorName , CreatTime , FileNote , Note }
    public enum Excel_Data { Id , TypeId , CityId , SheetName , CloumIndex , RowIndex , Value }
    public enum System_Role { RoleID , RoleName , Notes }
    public enum testagain { id , name }
    public enum testList { listID , listName , isDel }
    public enum PB_Config { CFID , ConfigKey , ConfigName , ConfigValue , Flag , Notes , OrderNo , CreateTime }
    public enum Test { ID , ParentID , Name , Remark , listid }
    public enum TestUser { ID , Name , PhoneNum , Gender , QQ , Remark , IsDel , Area }
    public enum V_SYS_Test1 { ID , Name , Gender , isdel , areaName , area , ¥ÌŒÛ–≈œ¢ }
    public enum PB_GridConfig { ID , TableName , Field , Title , Hidden , OrderNum , Width , Align , Sortable , Formatter , Styler , Editor , Rowspan , Colspan , Search , DataType , Import , ImportUnique , Export , Frozen , Edit , ViewName , MergeIndexed , LastEditTime }
    public enum PB_ExcelConfig { ID , ExcelID , ExcelName , TableName , Field , Formatter , IsRequired , IsUnique , IsForeignkey , ForeignTable , CreateTime }
    public enum System_Department { ID , ParentID , DepartmentName , CreateTime }
    public enum System_UserInfo { UserID , CompanyID , Memo , IsOK }
    public enum System_Users { UserID , LoginID , FullName , Password , PwdExpiredTime , Sex , WorkPhone , CellPhone , Email , Status , LoginCount , LastLoginTime , LastLoginIP , UserType , AreaID , DepartmentIDs , RoleIDs , CreateTime }
    public enum PB_ExcelInfo { ID , CnName , EnName , TableNames , CreateTime , StartIndex , HeadCrossRowNum }
    public enum PB_Area { ID , AreaName , ParentID , Level , OrderNum , CreateTime , CompanyName }
    public enum System_Menu { MenuID , ParentMenuID , MenuName , MenuUrl , MenuLevel , SortOrder , MenuIcon , BigMenuIcon , IsShortcut , IsShow , ActionIDs }
    public enum PB_Company { CompanyID , CompanyName , CompanyFullName , DeleptID , TopComID , OrderNum , ViewBounds , PY , Note , FullIds , FullNames , HasChild , CityClass }
    public enum System_RoleAction { RoleActionID , RoleID , MenuID , ActionID }
    #endregion
}