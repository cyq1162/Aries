--说明：本SQL文本仅为简化SQL语句存放使用，一行只能定义一条简单语句，复杂的请单独创建文件存放。
--说明：本SQL文本仅存储下拉框所使用的语句。
--说明：注意命名规范:C_模块名_业务名

C_SYS_Role=	 SELECT RoleID AS [value], RoleName AS [text] FROM System_Role
C_SYS_Department=SELECT ID AS [value], DepartmentName AS [text],ParentID as [TopComID] FROM System_Department  where DepartmentName like '%@text%'
--区域表

C_PB_Country=SELECT ID AS [value] ,AreaName AS [text],ParentID AS parent FROM PB_Area WHERE [Level] = 1
C_PB_Province =SELECT ID AS [value] ,AreaName AS [text],ParentID AS parent FROM PB_Area WHERE [Level] = 2
C_PB_City =SELECT ID AS [value] ,AreaName AS [text],ParentID AS parent FROM PB_Area WHERE [Level] =3
C_PB_District =SELECT ID AS [value] ,AreaName AS [text],ParentID AS parent FROM PB_Area WHERE [Level] = 4


C_PB_LV1=SELECT XJID AS value,Name AS text FROM dbo.PB_Inspect WHERE Lvl= 1 AND InspectLevel = 1
C_PB_LV2=SELECT XJID AS value,Name AS text,FXJID AS parent FROM dbo.PB_Inspect WHERE Lvl= 2 AND InspectLevel = 1
C_PB_LV3=SELECT XJID AS value,Name AS text,FXJID AS parent FROM dbo.PB_Inspect WHERE Lvl= 3 AND InspectLevel = 1
C_PB_All=SELECT XJID AS value,Name AS text,FXJID AS parent FROM dbo.PB_Inspect WHERE InspectLevel = 2