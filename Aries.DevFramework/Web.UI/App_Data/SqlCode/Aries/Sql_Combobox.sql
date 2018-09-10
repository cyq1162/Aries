--说明：本SQL文本仅为简化SQL语句存放使用，一行只能定义一条简单语句，复杂的请单独创建文件存放。
--说明：本SQL文本仅存储下拉框所使用的语句。
--说明：注意命名规范:C_模块名_业务名 and PCode in (@parent)
--说明： 框架的，请勿修改，业务的，请将Sql_Yours.sql改名，并写在Sql_Yours.sql中
---- where RoleID<>'@SuperAdminRoleID'
C_SYS_Role=	 SELECT RoleID AS value, RoleName AS text FROM Sys_Role
C_SYS_Org = SELECT OrgID AS value, OrgName AS text,ParentOrg as parent FROM Sys_Organization
C_SYS_ObjName  =  SELECT distinct ObjName AS text FROM Config_Grid 
C_SYS_ConfigKey  =  SELECT distinct ConfigKey AS text FROM Config_KeyValue
--区域表
