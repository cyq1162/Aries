using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Principal;
using System.Runtime.InteropServices;
using System.Collections;
using System.Reflection;
using System.Data;
using System.DirectoryServices;
//using Revenco.Web.DevelopKit.Security;


namespace Web.Utility.ADHelper
{
    public class ADHelper
    {

        ///域名
        //private  string DomainName = string.Empty; // "tiams.com";

        ///// LDAP绑定路径   LDAP://域名/OU=组织名称,CN=,DC=域的名,DC=com  
        ///// cn是一个相对标识，可以指容器（不能指组织单位）；dc是域名，把‘点’分开单独写
        //private  string ADPath = string.Empty; // "LDAP://tiams.com/OU=TUsers,DC=tiams,DC=com";///CN=Administrator,CN=Users,DC=MyDomain,DC=com";  //"LDAP://cps01.test.com/CN=Users,DC=test,DC=com";
        /////登录帐号
        //private  string ADUser = string.Empty;//"test1";// "administrator";
        /////登录密码
        //private  string ADPassword =string.Empty;// "pass@word1";// "niuYear%214";


        private string _domainName = string.Empty;
        private string _adPath = string.Empty;
        private string _adUser = string.Empty;
        private string _adPassword = string.Empty;

        public ADHelper(string domainName, string adUser, string adPassword)
        {
            this._domainName = domainName;
            this._adUser = adUser;
            this._adPassword = adPassword;
        }

        public ADHelper(string domainName, string adUser, string adPassword, string adPath)
        {
            this._domainName = domainName;
            this._adUser = adUser;
            this._adPassword = adPassword;
            this._adPath = adPath;
        }

        ///扮演类实例
        //private  IdentityImpersonation impersonate = new IdentityImpersonation(_adUser, _adPassword, _domainName);

        ///用户登录验证结果
        public enum LoginResult
        {
            ///正常登录
            LOGIN_USER_OK = 0,
            ///用户不存在
            LOGIN_USER_DOESNT_EXIST,
            ///用户帐号被禁用
            LOGIN_USER_ACCOUNT_INACTIVE,
            ///用户密码不正确
            LOGIN_USER_PASSWORD_INCORRECT
        }

        ///用户属性定义标志
        public enum ADS_USER_FLAG_ENUM
        {
            ///登录脚本标志。如果通过 ADSI LDAP 进行读或写操作时，该标志失效。如果通过 ADSI WINNT，该标志为只读。
            ADS_UF_SCRIPT = 0X0001,
            ///用户帐号禁用标志
            ADS_UF_ACCOUNTDISABLE = 0X0002,
            ///主文件夹标志
            ADS_UF_HOMEDIR_REQUIRED = 0X0008,
            ///过期标志
            ADS_UF_LOCKOUT = 0X0010,
            ///用户密码不是必须的
            ADS_UF_PASSWD_NOTREQD = 0X0020,
            ///密码不能更改标志
            ADS_UF_PASSWD_CANT_CHANGE = 0X0040,
            ///使用可逆的加密保存密码
            ADS_UF_ENCRYPTED_TEXT_PASSWORD_ALLOWED = 0X0080,
            ///本地帐号标志
            ADS_UF_TEMP_DUPLICATE_ACCOUNT = 0X0100,
            ///普通用户的默认帐号类型
            ADS_UF_NORMAL_ACCOUNT = 0X0200,
            ///跨域的信任帐号标志
            ADS_UF_INTERDOMAIN_TRUST_ACCOUNT = 0X0800,
            ///工作站信任帐号标志
            ADS_UF_WORKSTATION_TRUST_ACCOUNT = 0x1000,
            ///服务器信任帐号标志
            ADS_UF_SERVER_TRUST_ACCOUNT = 0X2000,
            ///密码永不过期标志
            ADS_UF_DONT_EXPIRE_PASSWD = 0X10000,
            /// MNS 帐号标志
            ADS_UF_MNS_LOGON_ACCOUNT = 0X20000,
            ///交互式登录必须使用智能卡
            ADS_UF_SMARTCARD_REQUIRED = 0X40000,
            ///当设置该标志时，服务帐号（用户或计算机帐号）将通过 Kerberos 委托信任
            ADS_UF_TRUSTED_FOR_DELEGATION = 0X80000,
            ///当设置该标志时，即使服务帐号是通过 Kerberos 委托信任的，敏感帐号不能被委托
            ADS_UF_NOT_DELEGATED = 0X100000,
            ///此帐号需要 DES 加密类型
            ADS_UF_USE_DES_KEY_ONLY = 0X200000,
            ///不要进行 Kerberos 预身份验证
            ADS_UF_DONT_REQUIRE_PREAUTH = 0X4000000,
            ///用户密码过期标志
            ADS_UF_PASSWORD_EXPIRED = 0X800000,
            ///用户帐号可委托标志
            ADS_UF_TRUSTED_TO_AUTHENTICATE_FOR_DELEGATION = 0X1000000
        }

        #region GetDirectoryObject

        ///获得DirectoryEntry对象实例,以管理员登陆AD
        private DirectoryEntry GetDirectoryObject()
        {
            DirectoryEntry entry = new DirectoryEntry(_adPath, _adUser, _adPassword, AuthenticationTypes.Secure);
            return entry;
        }

        ///根据指定用户名和密码获得相应DirectoryEntry实体
        private DirectoryEntry GetDirectoryObject(string userName, string password)
        {
            DirectoryEntry entry = new DirectoryEntry(_adPath, userName, password, AuthenticationTypes.None);
            return entry;
        }

        ///CN=Users,DC=creditsights, DC=cyberelves, DC=Com
        private DirectoryEntry GetDirectoryObject(string domainReference)
        {
            DirectoryEntry entry = new DirectoryEntry(_adPath + domainReference, _adUser, _adPassword, AuthenticationTypes.Secure);
            return entry;
        }

        ///获得以UserName,Password创建的DirectoryEntry
        private DirectoryEntry GetDirectoryObject(string domainReference, string userName, string password)
        {
            DirectoryEntry entry = new DirectoryEntry(_adPath + domainReference, userName, password, AuthenticationTypes.Secure);
            return entry;
        }

        #endregion

        #region GetDirectoryEntry

        ///根据用户公共名称取得用户的 对象
        ///用户公共名称 
        ///如果找到该用户，则返回用户的 对象；否则返回 null      
        private DirectoryEntry GetDirectoryEntry(string commonName)
        {
            DirectoryEntry de = GetDirectoryObject();
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(&(objectCategory=person)(objectClass=user))(cn=" + commonName + "))";
            deSearch.SearchScope = SearchScope.Subtree;

            try
            {
                SearchResult result = deSearch.FindOne();
                de = new DirectoryEntry(result.Path);
                return de;
            }
            catch
            {
                return null;
            }
        }

        ///根据用户公共名称和密码取得用户的 对象。
        ///用户公共名称 
        ///用户密码 
        ///如果找到该用户，则返回用户的 对象；否则返回 null  
        private DirectoryEntry GetDirectoryEntry(string commonName, string password)
        {
            DirectoryEntry de = GetDirectoryObject(commonName, password);
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(&(objectCategory=person)(objectClass=user))(cn=" + commonName + "))";
            deSearch.SearchScope = SearchScope.Subtree;

            try
            {
                SearchResult result = deSearch.FindOne();
                de = new DirectoryEntry(result.Path);
                return de;
            }
            catch
            {
                return null;
            }
        }

        ///根据用户帐号称取得用户的 对象
        ///用户帐号名         如果找到该用户，则返回用户的 对象；否则返回 null   
        private DirectoryEntry GetDirectoryEntryByAccount(string sAMAccountName)
        {
            DirectoryEntry de = GetDirectoryObject();
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(&(objectCategory=person)(objectClass=user))(sAMAccountName=" + sAMAccountName + "))";
            deSearch.SearchScope = SearchScope.Subtree;

            try
            {
                SearchResult result = deSearch.FindOne();
                de = new DirectoryEntry(result.Path);
                return de;
            }
            catch
            {
                return null;
            }
        }

        ///根据用户帐号和密码取得用户的 对象
        ///用户帐号名 
        ///用户密码 
        ///如果找到该用户，则返回用户的 对象；否则返回 null      
        private DirectoryEntry GetDirectoryEntryByAccount(string sAMAccountName, string password)
        {
            DirectoryEntry de = GetDirectoryEntryByAccount(sAMAccountName);
            if (de != null)
            {
                string commonName = de.Properties["cn"][0].ToString();

                if (GetDirectoryEntry(commonName, password) != null)
                    return GetDirectoryEntry(commonName, password);
                else
                    return null;
            }
            else
            {
                return null;
            }
        }

        ///根据组名取得用户组的 对象
        ///组名 
        private DirectoryEntry GetDirectoryEntryOfGroup(string groupName)
        {
            DirectoryEntry de = GetDirectoryObject();
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(objectClass=group)(cn=" + groupName + "))";
            deSearch.SearchScope = SearchScope.Subtree;

            try
            {
                SearchResult result = deSearch.FindOne();
                de = new DirectoryEntry(result.Path);
                return de;
            }
            catch
            {
                return null;
            }
        }

        #endregion

        #region GetProperty

        ///获得指定 指定属性名对应的值
        ///属性名称          属性值       
        private string GetProperty(DirectoryEntry de, string propertyName)
        {
            if (de.Properties.Contains(propertyName))
            {
                return de.Properties[propertyName][0].ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        ///获得指定搜索结果 中指定属性名对应的值
        ///属性名称  属性值 
        private string GetProperty(SearchResult searchResult, string propertyName)
        {
            if (searchResult.Properties.Contains(propertyName))
            {
                return searchResult.Properties[propertyName][0].ToString();
            }
            else
            {
                return string.Empty;
            }
        }

        #endregion

        ///设置指定 的属性值
        ///属性名称 
        ///属性值 
        private void SetProperty(DirectoryEntry de, string propertyName, string propertyValue)
        {
            if (propertyValue != string.Empty || propertyValue != "" || propertyValue != null)
            {
                if (de.Properties.Contains(propertyName))
                {
                    de.Properties[propertyName][0] = propertyValue;
                }
                else
                {
                    de.Properties[propertyName].Add(propertyValue);
                }
            }
        }

        /// <summary>
        ///  指写DN位置创建域用户
        /// </summary>
        /// <param name="ldapDN">DN 位置。例如：OU=共享平台 或 CN=Users </param>
        /// <param name="commonName">公共名称</param>
        /// <param name="sAMAccountName">帐号 </param>
        /// <param name="newPassword">密码</param>
        /// <returns></returns>
        public bool CreateDomainUser(string ldapDN, string commonName, string sAMAccountName, string newPassword)
        {
            bool result = true;
            try
            {
                DirectoryEntry entry = GetDirectoryObject();
                DirectoryEntry subEntry = entry.Children.Find(ldapDN);
                DirectoryEntry deUser = subEntry.Children.Add("CN=" + commonName, "user");
                deUser.Properties["sAMAccountName"].Value = sAMAccountName;
                deUser.CommitChanges();
                EnableUser(commonName);

                deUser.Properties["userAccountControl"].Value = 0x10200;               //密码永不过期0x10000
                deUser.Properties["pwdLastSet"].Value = -1;            //取消用户下次登陆必须更改密码
                deUser.CommitChanges();

                SetPassword(commonName, newPassword);
                deUser.Close();
            }
            catch
            {
                result = false;
            }
            return result;
        }

        /// <summary>
        ///  DN位置默认为Users,创建域用户
        /// </summary>
        /// <param name="commonName">公共名称</param>
        /// <param name="sAMAccountName">帐号 </param>
        /// <param name="newPassword">密码</param>
        /// <returns></returns>
        public bool CreateDomainUser(string commonName, string sAMAccountName, string newPassword)
        {
            return CreateDomainUser("CN=Users", commonName, sAMAccountName, newPassword);
        }

        ///创建新的用户
        ///DN 位置。例如：OU=共享平台 或 CN=Users 
        ///公共名称 
        ///帐号 
        ///密码 
        private DirectoryEntry CreateNewUser(string ldapDN, string commonName, string sAMAccountName, string newPassword)
        {
            DirectoryEntry entry = GetDirectoryObject();
            DirectoryEntry subEntry = entry.Children.Find(ldapDN);
            DirectoryEntry deUser = subEntry.Children.Add("CN=" + commonName, "user");
            deUser.Properties["sAMAccountName"].Value = sAMAccountName;
            deUser.CommitChanges();
            EnableUser(commonName);

            deUser.Properties["userAccountControl"].Value = 0x10200;               //密码永不过期0x10000
            deUser.Properties["pwdLastSet"].Value = -1;            //取消用户下次登陆必须更改密码
            deUser.CommitChanges();

            SetPassword(commonName, newPassword);
            deUser.Close();
            return deUser;
        }

        ///创建新的用户。默认创建在 Users 单元下。
        ///公共名称 
        ///帐号 
        ///密码 
        private DirectoryEntry CreateNewUser(string commonName, string sAMAccountName, string password)
        {
            return CreateNewUser("CN=Users", commonName, sAMAccountName, password);
        }

        ///         ///判断指定公共名称的用户是否存在
        ///         ///用户公共名称 
        ///如果存在，返回 true；否则返回 false   
        private bool IsUserExists(string commonName)
        {
            DirectoryEntry de = GetDirectoryObject();
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(&(objectCategory=person)(objectClass=user))(cn=" + commonName + "))";       // LDAP 查询串
            SearchResultCollection results = deSearch.FindAll();

            if (results.Count == 0)
                return false;
            else
                return true;
        }

        ///判断用户帐号是否激活
        ///用户帐号属性控制器 
        ///如果用户帐号已经激活，返回 true；否则返回 false    
        private bool IsAccountActive(int userAccountControl)
        {
            int userAccountControl_Disabled = Convert.ToInt32(ADS_USER_FLAG_ENUM.ADS_UF_ACCOUNTDISABLE);
            int flagExists = userAccountControl & userAccountControl_Disabled;

            if (flagExists > 0)
                return false;
            else
                return true;
        }



        ///判断用户帐号与密码是否足够以满足身份验证进而登录
        ///用户帐号 
        ///密码 
        ///如能可正常登录，则返回 true；否则返回 false    
        public LoginResult LoginByAccount(string sAMAccountName, string password)
        {
            DirectoryEntry de = GetDirectoryEntryByAccount(sAMAccountName);

            if (de != null)
            {
                // 必须在判断用户密码正确前，对帐号激活属性进行判断；否则将出现异常。
                int userAccountControl = Convert.ToInt32(de.Properties["userAccountControl"][0]);
                de.Close();

                if (!IsAccountActive(userAccountControl))
                    return LoginResult.LOGIN_USER_ACCOUNT_INACTIVE;

                if (GetDirectoryEntryByAccount(sAMAccountName, password) != null)
                    return LoginResult.LOGIN_USER_OK;
                else
                    return LoginResult.LOGIN_USER_PASSWORD_INCORRECT;
            }
            else
            {
                return LoginResult.LOGIN_USER_DOESNT_EXIST;
            }
        }

        public LoginResult LoginByAccount(string sAMAccountName, string password, int type)
        {

            DirectoryEntry de = GetDirectoryObject();
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(&(objectCategory=person)(objectClass=user))(sAMAccountName=" + sAMAccountName + "))";
            deSearch.SearchScope = SearchScope.Subtree;

            DirectoryEntry newde;
            try
            {
                SearchResult result = deSearch.FindOne();
                if (result == null)
                    return LoginResult.LOGIN_USER_DOESNT_EXIST;

                newde = new DirectoryEntry(result.Path, sAMAccountName, password);

                if (newde != null)
                {
                    try
                    {
                        // 必须在判断用户密码正确前，对帐号激活属性进行判断；否则将出现异常。
                        int userAccountControl = Convert.ToInt32(newde.Properties["userAccountControl"][0]);
                        newde.Close();

                        if (!IsAccountActive(userAccountControl))
                            return LoginResult.LOGIN_USER_ACCOUNT_INACTIVE;
                        else
                            return LoginResult.LOGIN_USER_OK;
                    }
                    catch
                    {
                        return LoginResult.LOGIN_USER_PASSWORD_INCORRECT;
                    }
                }
            }
            catch
            {
                return LoginResult.LOGIN_USER_DOESNT_EXIST;
            }
            return LoginResult.LOGIN_USER_DOESNT_EXIST;


        }

        public DirectoryEntry GetUserDirectoryEntry(string sAMAccountName, string password)
        {

            DirectoryEntry de = GetDirectoryObject();
            DirectorySearcher deSearch = new DirectorySearcher(de);
            deSearch.Filter = "(&(&(objectCategory=person)(objectClass=user))(sAMAccountName=" + sAMAccountName + "))";
            deSearch.SearchScope = SearchScope.Subtree;

            DirectoryEntry userDe = null;
            try
            {
                SearchResult result = deSearch.FindOne();
                if (result != null)
                {
                    userDe = new DirectoryEntry(result.Path, sAMAccountName, password);
                    if (userDe != null)
                    {
                        int userAccountControl = Convert.ToInt32(userDe.Properties["userAccountControl"][0]);
                        if (IsAccountActive(userAccountControl))
                            return userDe;
                    }
                }
            }
            catch
            {
                try
                {
                    if (userDe != null)
                        userDe.Close();
                }
                catch
                {
                }
            }
            return null;
        }


        ///设置用户密码，管理员可以通过它来修改指定用户的密码。
        ///用户公共名称 
        ///用户新密码 
        private void SetPassword(string commonName, string newPassword)
        {
            DirectoryEntry de = GetDirectoryEntry(commonName);
            IdentityDomainImpersonation impersonate = new IdentityDomainImpersonation(_adUser, _adPassword, _domainName);
            try
            {
                // 模拟超级管理员，以达到有权限修改用户密码
                impersonate.BeginImpersonate();
                de.InvokeSet("SetPassword", newPassword);
                impersonate.StopImpersonate();
            }
            catch (Exception e)
            {
                string te = e.Message;
            }
            de.Close();
        }

        ///设置帐号密码，管理员可以通过它来修改指定帐号的密码。
        ///用户帐号 
        ///用户新密码 
        private void SetPasswordByAccount(string sAMAccountName, string newPassword)
        {
            DirectoryEntry de = GetDirectoryEntryByAccount(sAMAccountName);

            // 模拟超级管理员，以达到有权限修改用户密码
            IdentityDomainImpersonation impersonate = new IdentityDomainImpersonation(_adUser, _adPassword, _domainName);
            impersonate.BeginImpersonate();
            de.Invoke("SetPassword", new object[] { newPassword });
            impersonate.StopImpersonate();

            de.Close();
        }

        ///修改用户密码
        ///用户公共名称 
        ///旧密码 
        ///新密码 
        private void ChangeUserPassword(string commonName, string oldPassword, string newPassword)
        {
            // to-do: 需要解决密码策略问题
            DirectoryEntry oUser = GetDirectoryEntry(commonName);
            oUser.Invoke("ChangePassword", new Object[] { oldPassword, newPassword });
            oUser.Close();
        }

        ///启用指定公共名称的用户
        ///用户公共名称 
        private void EnableUser(string commonName)
        {
            EnableUser(GetDirectoryEntry(commonName));
        }

        ///启用指定 的用户
        private void EnableUser(DirectoryEntry de)
        {
            IdentityDomainImpersonation impersonate = new IdentityDomainImpersonation(_adUser, _adPassword, _domainName);
            impersonate.BeginImpersonate();
            de.Properties["userAccountControl"][0] = ADHelper.ADS_USER_FLAG_ENUM.ADS_UF_NORMAL_ACCOUNT | ADHelper.ADS_USER_FLAG_ENUM.ADS_UF_DONT_EXPIRE_PASSWD;
            de.CommitChanges();
            impersonate.StopImpersonate();
            de.Close();
        }

        ///禁用指定公共名称的用户
        ///用户公共名称 
        private void DisableUser(string commonName)
        {
            DisableUser(GetDirectoryEntry(commonName));
        }

        ///禁用指定 的用户
        private void DisableUser(DirectoryEntry de)
        {
            IdentityDomainImpersonation impersonate = new IdentityDomainImpersonation(_adUser, _adPassword, _domainName);
            impersonate.BeginImpersonate();
            de.Properties["userAccountControl"][0] = ADHelper.ADS_USER_FLAG_ENUM.ADS_UF_NORMAL_ACCOUNT | ADHelper.ADS_USER_FLAG_ENUM.ADS_UF_DONT_EXPIRE_PASSWD | ADHelper.ADS_USER_FLAG_ENUM.ADS_UF_ACCOUNTDISABLE;
            de.CommitChanges();
            impersonate.StopImpersonate();
            de.Close();
        }

        ///将指定的用户添加到指定的组中。默认为 Users 下的组和用户。
        ///用户公共名称 
        ///组名 
        private void AddUserToGroup(string userCommonName, string groupName)
        {
            DirectoryEntry oGroup = GetDirectoryEntryOfGroup(groupName);
            DirectoryEntry oUser = GetDirectoryEntry(userCommonName);
            IdentityDomainImpersonation impersonate = new IdentityDomainImpersonation(_adUser, _adPassword, _domainName);
            impersonate.BeginImpersonate();
            oGroup.Properties["member"].Add(oUser.Properties["distinguishedName"].Value);
            oGroup.CommitChanges();
            impersonate.StopImpersonate();

            oGroup.Close();
            oUser.Close();
        }

        ///将用户从指定组中移除。默认为 Users 下的组和用户。
        ///用户公共名称 
        ///组名 
        private void RemoveUserFromGroup(string userCommonName, string groupName)
        {
            DirectoryEntry oGroup = GetDirectoryEntryOfGroup(groupName);
            DirectoryEntry oUser = GetDirectoryEntry(userCommonName);
            IdentityDomainImpersonation impersonate = new IdentityDomainImpersonation(_adUser, _adPassword, _domainName);

            impersonate.BeginImpersonate();
            oGroup.Properties["member"].Remove(oUser.Properties["distinguishedName"].Value);
            oGroup.CommitChanges();
            impersonate.StopImpersonate();

            oGroup.Close();
            oUser.Close();
        }

        /// <summary>
        /// 取所用用户
        /// </summary>
        /// <returns></returns>
        public DataTable GetAllADUserInfo()
        {
            #region  define table
            DataTable dt = new DataTable();
            dt.Columns.Add(new DataColumn("ID", typeof(Guid)));
            dt.Columns.Add(new DataColumn("UserLogonName", typeof(string)));//samaccountname: LoginNameJoelin
            //dt.Columns.Add(new DataColumn("UserPrincipalName", typeof(string)));//userprincipalname: Joelin@MyDomain.com            
            //dt.Columns.Add(new DataColumn("FName", typeof(string)));//givenname
            //dt.Columns.Add(new DataColumn("LName", typeof(string)));//sn
            //dt.Columns.Add(new DataColumn("Initials", typeof(string)));//initials: Inital   姓名 缩写
            dt.Columns.Add(new DataColumn("DisplayName", typeof(string)));//displayname: Joe lin_DisPlayName
            //dt.Columns.Add(new DataColumn("Description", typeof(string)));//description
            //dt.Columns.Add(new DataColumn("Office", typeof(string)));//physicaldeliveryofficename: office
            //dt.Columns.Add(new DataColumn("Postofficebox", typeof(string)));//postofficebox: pobox 邮政信箱
            //dt.Columns.Add(new DataColumn("Street", typeof(string)));//streetaddress: street      街道
            //dt.Columns.Add(new DataColumn("City", typeof(string)));//l: city 
            //dt.Columns.Add(new DataColumn("Province", typeof(string)));//st: province
            //dt.Columns.Add(new DataColumn("Country", typeof(string)));//co: China                     
            //dt.Columns.Add(new DataColumn("TelephoneNumber", typeof(string)));//telephonenumber: 13670228490 
            //dt.Columns.Add(new DataColumn("Homephone", typeof(string)));//homephone: 13570229491 
            //dt.Columns.Add(new DataColumn("Pager", typeof(string)));//pager: 13570229492 
            //dt.Columns.Add(new DataColumn("Mobile", typeof(string)));//mobile: 13570229493
            //dt.Columns.Add(new DataColumn("Fax", typeof(string)));// facsimiletelephonenumber: 13570229494   fax
            //dt.Columns.Add(new DataColumn("IpPhone", typeof(string)));// ipphone: 13570229495
            //dt.Columns.Add(new DataColumn("Notes", typeof(string)));//info: Notes
            //dt.Columns.Add(new DataColumn("E-mail", typeof(string)));//mail: baoqiaolin0725@136.com 
            //dt.Columns.Add(new DataColumn("Webpage", typeof(string)));//wwwhomepage: webpage
            //dt.Columns.Add(new DataColumn("Title", typeof(string)));//        title: Orgabization_Title.
            //dt.Columns.Add(new DataColumn("Company", typeof(string)));// company: O_company 
            dt.Columns.Add(new DataColumn("Department", typeof(string)));//department: O_department 

            #endregion
            System.DirectoryServices.DirectoryEntry entry = GetDirectoryObject();
            System.DirectoryServices.DirectorySearcher search = new System.DirectoryServices.DirectorySearcher(entry);
            search.Filter = "(&(objectClass=user)(objectCategory=person))";
            search.PageSize = 10000;

            SearchResult result;
            SearchResultCollection resultCol = search.FindAll();
            string userLogonName = string.Empty;
            if (resultCol != null)
            {
                for (int counter = 0; counter < resultCol.Count; counter++)
                {
                    result = resultCol[counter];
                    DataRow dr = dt.NewRow();
                    #region row
                    dr["ID"] = Guid.NewGuid();
                    
                    if (result.Properties.Contains("samaccountname"))
                    {
                        userLogonName = result.Properties["samaccountname"][0].ToString().ToLower();
                        if (userLogonName == "administrator" || userLogonName == "asp.net" || userLogonName == "guest" || userLogonName == "iusr_ad" || userLogonName == "iwam_ad")
                            continue;
                        dr["UserLogonName"] = userLogonName;
                    }
                    //if (result.Properties.Contains("userprincipalname"))
                    //    dr["UserPrincipalName"] = result.Properties["userprincipalname"][0].ToString();
                    //if (result.Properties.Contains("givenname"))
                    //    dr["FName"] = result.Properties["givenname"][0].ToString();
                    //if (result.Properties.Contains("sn"))
                    //    dr["LName"] = result.Properties["sn"][0].ToString();
                    //if (result.Properties.Contains("initials"))
                    //    dr["Initials"] = result.Properties["initials"][0].ToString();
                    if (result.Properties.Contains("displayname"))
                        dr["DisplayName"] = result.Properties["displayname"][0].ToString();
                    //if (result.Properties.Contains("description"))
                    //    dr["Description"] = result.Properties["description"][0].ToString();
                    //if (result.Properties.Contains("physicaldeliveryofficename"))
                    //    dr["Office"] = result.Properties["physicaldeliveryofficename"][0].ToString();
                    //if (result.Properties.Contains("postofficebox"))
                    //    dr["Postofficebox"] = result.Properties["postofficebox"][0].ToString();
                    //if (result.Properties.Contains("streetaddress"))
                    //    dr["Street"] = result.Properties["streetaddress"][0].ToString();
                    //if (result.Properties.Contains("l"))
                    //    dr["City"] = result.Properties["l"][0].ToString();
                    //if (result.Properties.Contains("st"))
                    //    dr["Province"] = result.Properties["st"][0].ToString();
                    //if (result.Properties.Contains("co"))
                    //    dr["Country"] = result.Properties["co"][0].ToString();

                    //if (result.Properties.Contains("telephonenumber"))
                    //    dr["TelephoneNumber"] = result.Properties["telephonenumber"][0].ToString();
                    //if (result.Properties.Contains("homephone"))
                    //    dr["Homephone"] = result.Properties["homephone"][0].ToString();
                    //if (result.Properties.Contains("pager"))
                    //    dr["Pager"] = result.Properties["pager"][0].ToString();
                    //if (result.Properties.Contains("mobile"))
                    //    dr["Mobile"] = result.Properties["mobile"][0].ToString();
                    //if (result.Properties.Contains("facsimiletelephonenumber"))
                    //    dr["Fax"] = result.Properties["facsimiletelephonenumber"][0].ToString();
                    //if (result.Properties.Contains("ipphone"))
                    //    dr["IpPhone"] = result.Properties["ipphone"][0].ToString();
                    //if (result.Properties.Contains("info"))
                    //    dr["Notes"] = result.Properties["info"][0].ToString();
                    //if (result.Properties.Contains("mail"))
                    //    dr["E-mail"] = result.Properties["mail"][0].ToString();
                    //if (result.Properties.Contains("wwwhomepage"))
                    //    dr["Webpage"] = result.Properties["wwwhomepage"][0].ToString();
                    //if (result.Properties.Contains("title"))
                    //    dr["Title"] = result.Properties["title"][0].ToString();
                    //if (result.Properties.Contains("company"))
                    //    dr["Company"] = result.Properties["company"][0].ToString();
                    if (result.Properties.Contains("department"))
                        dr["Department"] = result.Properties["department"][0].ToString();
                    #endregion
                    dt.Rows.Add(dr);
                }
            }
            return dt;
        }


    }
}
