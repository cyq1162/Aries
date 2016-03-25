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
        private static Dictionary<string, DateTime> appTokenList = new Dictionary<string, DateTime>();//token,最后请求日期

        /// <summary>
        /// 获取授权Token（手机APP登陆调用此方法获取Token为登陆凭证）
        /// </summary>
        public static string GetAuthToken(string loginID, string password, out string errMsg)
        {
            string token = string.Empty;
            errMsg = string.Empty;
            using (MAction action = new MAction(SQLCode.GetCode("V_SYS_UserList")))
            {
                action.SetSelectColumns("UserID", "Password", "UserName", "FullName", "PwdExpiredTime", "AreaID", "CompanyID");//,"Status"
                action.SetPara("LoginID", loginID, System.Data.DbType.String);
                string where = string.Format("LoginID=@LoginID and Status=1", loginID);
                if (action.Fill(where))
                {
                    if (action.Get<DateTime>("PwdExpiredTime", DateTime.MaxValue) < DateTime.Now)
                    {
                        errMsg = "账号密码已过期！";
                    }
                    else
                    {
                        string userID = action.Get<string>("UserID");
                        string pwd = action.Get<string>("Password");
                        string fullName = action.Get<string>("FullName", action.Get<string>("UserName"));
                        string areaID = action.Get<string>("AreaID");
                        string companyID = action.Get<string>("CompanyID");
                        if (pwd == EncrpytHelper.Encrypt(password))
                        {
                            action.ResetTable("System_Users");
                            action.SetPara("LoginID", loginID, System.Data.DbType.String);
                            token = EncrpytHelper.Encrypt(userID + "," + loginID + "," + fullName + "," + areaID + "," + companyID + "," + DateTime.Now.Day);
                            action.SetExpression("LoginCount=ISNULL(LoginCount,0)+1");
                            action.Set("LastLoginTime", DateTime.Now);
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
        public static bool Login(string loginID, string password, bool isRemember, out string errMsg)
        {
            string token = GetAuthToken(loginID, password, out errMsg);
            if (string.IsNullOrEmpty(token))
            {
                return false;
            }
            SetToken(token, loginID);
            WriteCookie(token, loginID, isRemember);
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
                        SetToken(token, LoginID);//回写全局内存
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
        /// 验证用户是否在线(For App手机端）
        /// </summary>
        /// <returns></returns>
        public static bool IsExistsAppToken()
        {
            string token = Token;
            if (!string.IsNullOrEmpty(token))
            {
                if (!appTokenList.ContainsKey(token))//Token不存在，可能内存回收。
                {
                    if (Day == DateTime.Now.Day)//同一天的Token
                    {
                        SetAppToken(token);//回写全局内存
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                return true;
            }
            return false;
        }
        /// <summary>
        /// 退出
        /// </summary>
        public static void Logout()
        {
            string loginID = LoginID;
            if (!string.IsNullOrEmpty(loginID))
            {
                try
                {
                    if (pcTokenList.ContainsKey(loginID))
                    {
                        pcTokenList.Remove(loginID);
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
        private static void SetToken(string token, string loginID)
        {
            try
            {
                if (!pcTokenList.ContainsKey(loginID))
                {
                    pcTokenList.Add(loginID, token);
                }
                else
                {
                    pcTokenList[loginID] = token;
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }
        }

        private static void WriteCookie(string token, string loginID, bool isRemember)
        {
            bool local = HttpContext.Current.Request.Url.Host == "localhost";

            HttpCookie tokenCookie = new HttpCookie("token", token);// { HttpOnly = !local };
            HttpCookie rememberCookie = new HttpCookie("remember", isRemember.ToString().ToLower());
            HttpCookie loginIDCookie = new HttpCookie("loginID", loginID);
            if (isRemember || local)
            {
                DateTime extTime = DateTime.Now.AddDays(7);
                if (local)
                {
                    tokenCookie.Expires = extTime;
                }
                rememberCookie.Expires = extTime;
                loginIDCookie.Expires = extTime;
            }
            HttpContext.Current.Response.Cookies.Add(tokenCookie);
            HttpContext.Current.Response.Cookies.Add(rememberCookie);
            HttpContext.Current.Response.Cookies.Add(loginIDCookie);
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

        #region 手机在线人数相关处理
        /// <summary>
        /// 每次请求都更新App的最后活动时间。
        /// </summary>
        private static void SetAppToken(string token)
        {
            try
            {
                if (!string.IsNullOrEmpty(token))
                {
                    if (appTokenList.ContainsKey(token))
                    {
                        appTokenList[token] = DateTime.Now;
                    }
                    else
                    {
                        appTokenList.Add(token, DateTime.Now);
                    }
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }

        }
        #endregion
        #region 对外属性

        public static string UserID
        {
            get
            {
                return GetTokenValue(0);
            }
        }
        /// <summary>
        /// 获取当前登陆账号的登陆ID
        /// </summary>
        public static string LoginID
        {
            get
            {
                string loginID = GetTokenValue(1);
                if (string.IsNullOrEmpty(loginID))
                {
                    loginID = GetCookieValue("loginID");
                }
                return loginID;
            }
        }
        /// <summary>
        /// 获取当前登陆账号的用户名称
        /// </summary>
        public static string UserName
        {
            get
            {
                return GetTokenValue(2);
            }
        }
        /// <summary>
        /// 获取当前登陆账号的区域ID
        /// </summary>
        public static string AreaID
        {
            get
            {
                return GetTokenValue(3);
            }
        }
        /// <summary>
        /// 获取当前登陆账号的分公司ID
        /// </summary>
        public static string CompanyID
        {
            get
            {
                return GetTokenValue(4);
            }
        }
        /// <summary>
        /// 是否省公司账号
        /// </summary>
        public static bool IsProvince
        {
            get
            {
                return CompanyID == "300";
            }
        }
        /// <summary>
        /// 省公司名称。
        /// </summary>
        public static string CompanyName
        {
            get
            {
                return KeyValueConfig.GetName("分公司", CompanyID);
            }
        }
        /// <summary>
        /// 是否系统管理员账号
        /// </summary>
        public static bool IsAdmin
        {
            get
            {
                return LoginID.ToLower().EndsWith("admin");
            }
        }
        internal static int Day
        {
            get
            {
                int d;
                int.TryParse(GetTokenValue(5), out d);
                return d;
            }
        }
        /// <summary>
        /// 是否记住登陆ID
        /// </summary>
        public static bool IsRemember
        {
            get
            {
                HttpCookie remember = HttpContext.Current.Request.Cookies["remember"];
                if (remember != null)
                {
                    return remember.Value == "true";
                }
                return false;
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
        /// 当前App手机端在线人数
        /// </summary>
        public static int OnlineAppCount
        {
            get
            {
                return appTokenList.Count;
            }
        }
        /// <summary>
        /// 获取手机最近N分钟活跃的在线人数
        /// </summary>
        /// <param name="minitues"></param>
        /// <returns></returns>
        public static int GetOnlineAppCount(int minutes)
        {
            int count = 0;
            try
            {
                if (appTokenList.Count > 0)
                {
                    foreach (DateTime time in appTokenList.Values)
                    {
                        if (time.AddMinutes(minutes) > DateTime.Now)
                        {
                            count++;
                        }
                    }
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }
            return count;
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
