/* 
编写人员：XXX 
编写日期：2014-04-16 
 
参与修改：无（日期） 
 
描述说明：用户视图 ------Demo所用。 
使用 URL：/Web/SysAdmin/UserList.html
where a.CompanyID=@CompanyID 
*/ 
SELECT u.*,ui.* FROM Sys_User u left join Sys_UserInfo ui on u.UserID=ui.UserInfoID