WITH CTE0 AS
(
SELECT	m.MenuID,m.ActionIDs, cast(a.ActionID as varchar(36)) ActionID
	FROM System_Users u 
		CROSS APPLY(SELECT CAST(Col AS varchar(36)) AS RoleID FROM dbo.fn_split(u.RoleIDs,','))r
		inner join System_RoleAction ra on ra.RoleID = r.RoleID
		inner join System_Action a on a.ActionID = ra.ActionID
		inner join System_Menu m on m.MenuID = ra.MenuID
	WHERE u.loginid = '@LoginID'
),AllowMenuInfo AS
(
SELECT	m.MenuID,
				dbo.fn_InCludeNode(m.ActionIDs,STUFF((SELECT N',' + ActionID
                    FROM (SELECT DISTINCT ActionID FROM CTE0 where MenuID = m.MenuID) AS Y
                    FOR XML PATH('')), 1, 1, N''))ActionIDs
	FROM CTE0 m
	GROUP BY	m.MenuID,m.ActionIDs
),
CTE AS
(
SELECT	m.MenuID,m.ParentMenuID,m.MenuName,
				m.MenuUrl,m.MenuLevel,m.SortOrder,
				m.MenuIcon,m.BigMenuIcon,m.IsShortcut,m.IsShow,
				m.MenuID AS TopMenuID
	FROM System_Menu m 
	WHERE m.MenuLevel = 1 
UNION ALL
SELECT m.MenuID,m.ParentMenuID,m.MenuName,
				m.MenuUrl,m.MenuLevel,m.SortOrder,
				m.MenuIcon,m.BigMenuIcon,m.isShortcut,m.IsShow,
				c.TopMenuID AS TopMenuID FROM System_Menu m 
	inner join CTE c 
		on m.ParentMenuID = c.MenuID
),
CTE2 AS
(SELECT m.MenuID,ParentMenuID,MenuName,
				MenuUrl,MenuLevel,SortOrder,
				MenuIcon,BigMenuIcon,IsShortcut,IsShow,
				MAX(CASE WHEN IsShow = 1 THEN MenuLevel ELSE NULL end)
				OVER(PARTITION BY TopMenuID) LevelCount
				FROM CTE m)
SELECT m.MenuID,ParentMenuID,MenuName,
				MenuUrl,MenuLevel,SortOrder,
				MenuIcon,BigMenuIcon,IsShortcut,IsShow,
				(','+dbo.fn_IndexToRefNames(ActionIDs)) AS ActionRefNames
				FROM CTE2 m
		inner join AllowMenuInfo a 
			on m.MenuID = a.MenuID