using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;
using Aries.Core.Helper;
using Aries.Core.DB;
using Aries.Core.Sql;
using Aries.Core.Config;

namespace Aries.Core.Auth
{
    /// <summary>
    /// 用户登陆相关操作类
    /// </summary>
    public static partial class UserAuth
    {
        private static Dictionary<string, string> pcTokenList = new Dictionary<string, string>();//loginID,token

        /// <summary>
        /// 获取授权Token（手机APP登陆调用此方法获取Token为登陆凭证）
        /// </summary>
        public static string GetAuthToken(string userName, string password, out string errMsg)
        {
            string token = string.Empty;
            errMsg = string.Empty;
            using (MAction action = new MAction(U_AriesEnum.Sys_User))
            {
                string where = string.Empty;
                if (action.DalType == DalType.Txt || action.DalType == DalType.Xml)
                {
                    where = string.Format("Status=1 and UserName='{0}'", userName);
                }
                else
                {
                    action.SetPara("UserName", userName, System.Data.DbType.String);
                    where = "Status=1 and (UserName=@UserName or Phone=@UserName or Email=@UserName)";
                }
                if (action.Fill(where))
                {
                    if (action.Get<DateTime>(Sys_User.PwdExpiredTime, DateTime.MaxValue) < DateTime.Now)
                    {
                        errMsg = LangConst.PwdExpired;
                    }
                    else
                    {

                        string pwd = action.Get<string>(Sys_User.Password);
                        if (password == EncrpytHelper.Decrypt(pwd, false))
                        {
                            string userID = action.Get<string>(Sys_User.UserID);
                            userName = action.Get<string>(Sys_User.UserName);
                            string fullName = action.Get<string>(Sys_User.FullName, userName);
                            if (action.DalType == DalType.Txt || action.DalType == DalType.Xml)
                            {
                                action.Set(Sys_User.LoginCount, action.Get<int>(Sys_User.LoginCount, 0) + 1);
                            }
                            else
                            {
                                action.SetExpression("LoginCount=[#ISNULL](LoginCount,0)+1");
                            }
                            if (!pwd.EndsWith("=2") && EncrpytHelper.EncrpytKey != "")
                            {
                                action.Set(Sys_User.Password, EncrpytHelper.Encrypt(password));//重新加密密码
                            }
                            action.Set(Sys_User.LastLoginTime, DateTime.Now);
                            action.Set(Sys_User.LastLoginIP, HttpContext.Current.Request.UserHostAddress);
                            //action.SetPara("UserName", userName, System.Data.DbType.String);
                            action.Update(where);//更新信息。
                            //获取角色名称
                            string roleIDs = action.Get<string>(Sys_User.RoleIDs);
                            token = EncrpytHelper.Encrypt(DateTime.Now.Day + "," + userID + "," + userName + "," + fullName + "," + roleIDs);
                        }
                        else
                        {
                            errMsg = LangConst.PwdError;
                        }
                    }
                }
                else
                {
                    errMsg = LangConst.UserNotExists;
                }
            }
            return token;
        }


        /// <summary>
        /// 用户登陆（电脑PC端调用此方法，登陆成功会自动跳转到Index.html首页；手机端请调用GetAuthToken方法）
        /// </summary>
        public static bool Login(string userName, string password, out string errMsg)
        {
            string token = GetAuthToken(userName, password, out errMsg);
            if (string.IsNullOrEmpty(token))
            {
                return false;
            }
            SetToken(token, userName);
            WriteCookie(token, userName);
            //HttpContext.Current.Response.Redirect("/Index.html");
            return true;
        }

        public static bool ChangePassword(string password)
        {
            using (MAction action = new MAction(U_AriesEnum.Sys_User))
            {
                action.Set(Sys_User.Password, EncrpytHelper.Encrypt(password));
                return action.Update(UserID);
            }
        }
        /// <summary>
        /// 刷新Token的时间
        /// </summary>
        public static void RefleshToken()
        {
            HttpCookie tokenCookie = HttpContext.Current.Request.Cookies["aries_token"];
            if (tokenCookie != null)
            {
                tokenCookie.Expires = DateTime.Now.AddHours(8);//续延8小时
                tokenCookie.Domain = AppConfig.XHtml.Domain;
                HttpContext.Current.Response.Cookies.Add(tokenCookie);
            }
        }
        /// <summary>
        /// 验证用户是否在线(For PC电脑端）
        /// </summary>
        /// <param name="isRedirect">未登陆时是否跳转到登陆界面</param>
        /// <returns></returns>
        public static bool IsExistsToken(bool isRedirect)
        {
            bool result = false;
            string token = Token;
            if (!string.IsNullOrEmpty(token))
            {
                if (!pcTokenList.ContainsValue(token))//Token不存在，可能内存回收。
                {
                    if (Day == DateTime.Now.Day)//同一天的Token
                    {
                        SetToken(token, UserName);//回写全局内存
                        result = true;
                    }
                }
                else
                {
                    result = true;
                }
            }
            if (!result && isRedirect)
            {
                HttpContext.Current.Response.Redirect(AppConfig.GetApp("UI") + "/login.html");
            }
            return result;
        }

        /// <summary>
        /// 退出
        /// </summary>
        public static void Logout()
        {
            string userName = UserName;
            if (!string.IsNullOrEmpty(userName))
            {
                try
                {
                    ClearCookie();
                    if (pcTokenList.ContainsKey(userName))
                    {
                        pcTokenList.Remove(userName);
                    }
                }
                catch (Exception err)
                {

                }
                finally
                {
                    Token = null;
                }
            }
            string[] items = HttpContext.Current.Request.Url.LocalPath.Split('.');

            HttpContext.Current.Response.Redirect(AppConfig.GetApp("UI") + "/login." + items[items.Length - 1]);

        }
        private static void SetToken(string token, string userName)
        {
            try
            {
                if (!pcTokenList.ContainsKey(userName))
                {
                    pcTokenList.Add(userName, token);
                }
                else
                {
                    pcTokenList[userName] = token;
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }
        }
        private static void ClearCookie()
        {
            HttpResponse response = HttpContext.Current.Response;
            //清除token
            HttpCookie tokenCookie = new HttpCookie("aries_token","");
            // HttpCookie userNameCookie = new HttpCookie("aries_user");//为了保留记住用户名功能，不清用户名Cookie
            tokenCookie.Expires = DateTime.Now.AddYears(-1);
            //userNameCookie.Expires = DateTime.Now.AddDays(-1);
            response.Cookies.Add(tokenCookie);
            //HttpContext.Current.Response.Cookies.Add(userNameCookie);
            //清除aries_self
            //HttpCookie safekeyCookie = new HttpCookie("aries_safekey", "");
            //safekeyCookie.Expires = DateTime.Now.AddYears(-1);
            //response.Cookies.Add(safekeyCookie);
        }
        private static void WriteCookie(string token, string userName)
        {
            HttpCookie tokenCookie = new HttpCookie("aries_token", token);// { HttpOnly = !local };
            HttpCookie userNameCookie = new HttpCookie("aries_user", userName);
            tokenCookie.Domain = AppConfig.XHtml.Domain;
            userNameCookie.Domain = AppConfig.XHtml.Domain;
            tokenCookie.Expires = DateTime.Now.AddHours(8);
            userNameCookie.Expires = DateTime.Now.AddMonths(1);//记住用户名时（1个月）
            HttpContext.Current.Response.Cookies.Add(tokenCookie);
            HttpContext.Current.Response.Cookies.Add(userNameCookie);
        }
        private static string GetCookieValue(string name)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies[name];
            if (cookie != null)
            {
                return cookie.Value;
            }
            return string.Empty;
        }
        private static string GetTokenValue(int index)
        {
            string token = Token;
            if (!string.IsNullOrEmpty(token))
            {
                string text = EncrpytHelper.Decrypt(token);
                if (!string.IsNullOrEmpty(text))
                {
                    string[] items = text.Split(',');
                    if (items.Length > index)
                    {
                        return items[index];
                    }
                }
            }
            return string.Empty;
        }


        #region 对外属性
        internal static int Day
        {
            get
            {
                int d;
                int.TryParse(GetTokenValue(0), out d);
                return d;
            }
        }
        public static string UserID
        {
            get
            {
                return GetTokenValue(1);
            }
        }
        /// <summary>
        /// 获取当前登陆账号的登陆ID
        /// </summary>
        public static string UserName
        {
            get
            {
                string loginID = GetTokenValue(2);
                if (string.IsNullOrEmpty(loginID))
                {
                    loginID = GetCookieValue("aries_user");
                }
                return loginID;
            }
        }
        /// <summary>
        /// 获取当前登陆账号的用户名称
        /// </summary>
        public static string FullName
        {
            get
            {
                return GetTokenValue(3);
            }
        }
        /// <summary>
        /// 用户的角色IDs
        /// </summary>
        public static string RoleIDs
        {
            get
            {
                return GetTokenValue(4);
            }
        }
        /// <summary>
        /// 是否普通管理员账号(运营级别)
        /// </summary>
        public static bool IsAdmin
        {
            get
            {
                if (string.IsNullOrEmpty(AdminRoleID))
                {
                    return false;
                }
                return RoleIDs.Contains(AdminRoleID);
            }
        }
        /// <summary>
        /// 是否系统管理员账号(开发级别)
        /// </summary>
        public static bool IsSuperAdmin
        {
            get
            {
                if (string.IsNullOrEmpty(SuperAdminRoleID))
                {
                    return false;
                }
                return RoleIDs.Contains(SuperAdminRoleID);
            }
        }

        /// <summary>
        /// 当前电脑PC端在线人数
        /// </summary>
        public static int OnlineCount
        {
            get
            {
                return pcTokenList.Count;
            }
        }

        /// <summary>
        /// 获取当前用户信息行。
        /// </summary>
        public static MDataRow User
        {
            get
            {
                using (MAction action = new MAction(U_AriesEnum.Sys_User)) //转单表处理，兼容文本数据库演示
                {
                    if (action.Fill(UserID))
                    {
                        MDataRow row = action.Data.Clone();//克隆，不改变原有的结构。
                        action.ResetTable(U_AriesEnum.Sys_UserInfo);
                        if (action.Fill(UserID))
                        {
                            row.LoadFrom(action.Data, RowOp.None, true);//追加列
                        }
                        return row;
                    }
                }
                //using (MAction action = new MAction(SqlCode.GetCode("V_SYS_UserList")))
                //{
                //    if (action.Fill(UserID))
                //    {
                //        return action.Data;
                //    }
                //}
                HttpContext.Current.Response.Redirect("/login.html");
                return null;
            }
        }

        /// <summary>
        /// 获取当前登陆账号的Token（先取Request，再取Cookie值）
        /// </summary>
        public static string Token
        {
            get
            {
                string token = HttpContext.Current.Request["aries_token"];
                if (string.IsNullOrEmpty(token))
                {
                    HttpCookie tokenCookie = HttpContext.Current.Request.Cookies["aries_token"];
                    if (tokenCookie != null)
                    {
                        token = tokenCookie.Value;
                        //tokenCookie.Expires = DateTime.Now.AddHours(1);//续延1小时
                        //HttpContext.Current.Response.Cookies.Add(tokenCookie);
                    }
                }
                return token;
            }
            private set
            {
                HttpCookie tokenCookie = HttpContext.Current.Request.Cookies["aries_token"];
                if (tokenCookie != null)
                {
                    tokenCookie.HttpOnly = false;
                    tokenCookie.Expires = DateTime.Now.AddDays(-1);
                    tokenCookie.Domain = AppConfig.XHtml.Domain;
                    HttpContext.Current.Response.Cookies.Add(tokenCookie);
                }
            }
        }

        #endregion

    }

    public static partial class UserAuth
    {
        private static string _AdminRoleID;
        public static string AdminRoleID
        {
            get
            {
                if (string.IsNullOrEmpty(_AdminRoleID))
                {
                    using (MAction action = new MAction(U_AriesEnum.Sys_Role))
                    {
                        string where = string.Format("{0}='Admin' or {0}= '{1}'", Sys_Role.RoleName, LangConst.Admin);
                        if (action.Fill(where))
                        {
                            _AdminRoleID = action.Get<string>(Sys_Role.RoleID);
                        }
                    }
                }
                return _AdminRoleID;
            }
        }
        private static string _SuperAdminRoleID;
        public static string SuperAdminRoleID
        {
            get
            {
                if (string.IsNullOrEmpty(_SuperAdminRoleID))
                {
                    using (MAction action = new MAction(U_AriesEnum.Sys_Role))
                    {
                        string where = string.Format("{0}='SuperAdmin' or {0}= '{1}'", Sys_Role.RoleName, LangConst.SuperAdmin);
                        if (action.Fill(where))
                        {
                            _SuperAdminRoleID = action.Get<string>(Sys_Role.RoleID);
                        }
                    }
                }
                return _SuperAdminRoleID;
            }
        }
    }
}
