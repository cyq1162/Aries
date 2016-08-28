--说明:本SQL文本仅为简化SQL语句存放使用，一行只能定义一条简单语句，复杂的请单独创建文件存放。
--视图语句（MAction调用）和SQL语句（MProc调用)参考命名规范
--示例：
--视图语句：	V_SYS_Users= select * from Users 
--SQL语句：	S_SYS_Users= select * from Users  

--V_SYS_UserInfoTest = SELECT u.*,r.RenZhengZhuanYe FROM System_Users u LEFT JOIN dbo.HZ_RenYuanXinXi r ON r.LoginID=u.LoginID
--V_PB_WorkOrder = SELECT * FROM dbo.PB_WorkOrder WHERE SendUser =:?UserID
--V_PB_WorkOrder = SELECT * FROM dbo.PB_WorkOrder WHERE SendUser = 3830




