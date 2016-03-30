using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;

namespace Web.Core
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
            using (MAction action = new MAction(TableNames.Sys_User))
            {
               // action.SetSelectColumns(Sys_User.UserID, Sys_User.Password, Sys_User.FullName, Sys_User.PwdExpiredTime);
                action.SetPara("UserName", userName, System.Data.DbType.String);
                string where = string.Format("Status=1 and (UserName=@UserName or Phone=@UserName or Email=@UserName) ", userName);
                if (action.Fill(where))
                {
                    if (action.Get<DateTime>(Sys_User.PwdExpiredTime, DateTime.MaxValue) < DateTime.Now)
                    {
                        errMsg = "账号密码已过期！";
                    }
                    else
                    {
                       
                        string pwd = action.Get<string>(Sys_User.Password);
                        if (pwd == EncrpytHelper.Encrypt(password))
                        {
                            string userID = action.Get<string>(Sys_User.UserID);
                            userName = action.Get<string>(Sys_User.UserName);
                            string fullName = action.Get<string>(Sys_User.FullName, userName);
                            token = EncrpytHelper.Encrypt(DateTime.Now.Day + "," + userID + "," + userName + "," + fullName);
                            action.SetExpression("LoginCount=ISNULL(LoginCount,0)+1");
                            action.Set(Sys_User.LastLoginTime, DateTime.Now);
                            action.Set(Sys_User.LastLoginIP, HttpContext.Current.Request.UserHostAddress);
                            action.SetPara("UserName", userName, System.Data.DbType.String);
                            action.Update(where);//更新信息。
                        }
                        errMsg = "用户名或密码错误！";
                    }
                }
                else
                {
                    errMsg = "账号不存在！";
                }
            }
            return token;
        }


        /// <summary>
        /// 用户登陆（电脑PC端调用此方法，登陆成功会自动跳转到Index.aspx首页；手机端请调用GetAuthToken方法）
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
            HttpContext.Current.Response.Redirect("/Index.aspx");
            return true;
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
                HttpContext.Current.Response.Redirect("/Login.aspx");
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
                    if (pcTokenList.ContainsKey(userName))
                    {
                        pcTokenList.Remove(userName);
                    }
                }
                finally
                {
                    Token = null;
                }
            }
            if (HttpContext.Current.Request.Url.LocalPath.EndsWith(".aspx"))
            {
                HttpContext.Current.Response.Redirect("/Login.aspx");
            }
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

        private static void WriteCookie(string token, string userName)
        {
            bool local = HttpContext.Current.Request.Url.Host == "localhost";

            HttpCookie tokenCookie = new HttpCookie("token", token);// { HttpOnly = !local };
            HttpCookie userNameCookie = new HttpCookie("userName", userName);
            if (local)
            {
                DateTime extTime = DateTime.Now.AddDays(7);
                if (local)
                {
                    tokenCookie.Expires = extTime;
                }
                userNameCookie.Expires = extTime;
            }
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
                    loginID = GetCookieValue("userName");
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
        /// 是否系统管理员账号
        /// </summary>
        public static bool IsAdmin
        {
            get
            {
                return UserName.ToLower().EndsWith("admin");
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
                using (MAction action = new MAction(SQLCode.GetCode("V_SYS_UserList")))
                {
                    if (action.Fill(UserID))
                    {
                        return action.Data;
                    }
                }
                HttpContext.Current.Response.Redirect("/Login.aspx");
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
                string token = HttpContext.Current.Request["token"];
                if (string.IsNullOrEmpty(token))
                {
                    HttpCookie tokenCookie = HttpContext.Current.Request.Cookies["token"];
                    if (tokenCookie != null)
                    {
                        token = tokenCookie.Value;
                    }
                }
                return token;
            }
            private set
            {
                HttpCookie tokenCookie = HttpContext.Current.Request.Cookies["token"];
                if (tokenCookie != null)
                {
                    tokenCookie.HttpOnly = false;
                    tokenCookie.Expires = DateTime.Now.AddDays(-1);
                    HttpContext.Current.Response.Cookies.Add(tokenCookie);
                }
            }
        }

        #endregion

    }
}
