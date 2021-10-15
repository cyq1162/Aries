using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Aries.Core.Auth;
using Aries.Core.DB;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Cache;
using Gemini.Workflow.Interface;
namespace Gemini.Workflow.Entity
{
    /// <summary>
    /// 登录者登录信息接口适配器 
    /// 修改接入系统当前登录者返回相关信息
    /// </summary>
    public class CurrentUser : IUserInfo
    {
        CacheManage cache = CacheManage.LocalInstance;
        MDataRow GetUser()
        {
            string key = "WF_User_" + UserID;
            if (cache.Contains(key))
            {
                return cache.Get<MDataRow>(key);
            }
            else
            {
                using (MAction action = new MAction(U_AriesEnum.Sys_User))
                {
                    if (action.Fill(UserID))
                    {
                        cache.Set(key, action.Data, 1);
                        return action.Data;
                    }
                }
            }
            return null;
        }
        MDataRow GetOrg()
        {
            string key = "WF_Org_" + OrgID;
            if (cache.Contains(key))
            {
                return cache.Get<MDataRow>(key);
            }
            else
            {
                using (MAction action = new MAction(U_AriesEnum.Sys_Organization))
                {
                    if (action.Fill(OrgID))
                    {
                        cache.Set(key, action.Data, 1);
                        return action.Data;
                    }
                }
            }
            return null;
        }
        MDataRow GetRole()
        {
            string key = "WF_Role_" + RoleID;
            if (cache.Contains(key))
            {
                return cache.Get<MDataRow>(key);
            }
            else
            {
                using (MAction action = new MAction(U_AriesEnum.Sys_Role))
                {
                    if (action.Fill(RoleID))
                    {
                        cache.Set(key, action.Data, 1);
                        return action.Data;
                    }
                }
            }
            return null;
        }
        /// <summary>
        /// 用户id
        /// </summary>
        public string UserID
        {
            get
            {
                //在这里返回当前登录用户的UserID
                //例如：return SecurityContext.CurrentUser.UserID.ToString();
                return UserAuth.UserID;
            }
        }
        /// <summary>
        /// 登录账号
        /// </summary>
        public string UserName
        {
            get
            {
                //在这里返回当前登录账号
                //return SecurityContext.CurrentUser.UserName;
                return UserAuth.UserName;
            }
        }

        /// <summary>
        /// 真实姓名
        /// </summary>
        public string FullName
        {
            get
            {
                //return SecurityContext.CurrentUser.FullName;
                return UserAuth.FullName;
            }
        }

        /// <summary>
        /// 部门id
        /// </summary>
        public string OrgID
        {
            get
            {
                //return SecurityContext.CurrentUser.OrgID;
                return OrgIDs.Split(',')[0];//只取第一个部门。
            }
        }

        /// <summary>
        /// 部门名称
        /// </summary>
        public string OrgName
        {
            get
            {
                return GetOrg().Get<string>(Sys_Organization.OrgName);
            }

        }
        /// <summary>
        /// 部门全名称
        /// </summary>
        public string OrgFullName
        {
            get
            {
                return GetOrg().Get<string>(Sys_Organization.OrgFullName);
            }

        }

        public string Email
        {
            get { return GetUser().Get<string>(Sys_User.Email); }
        }

        public string Mobile
        {
            get { return GetUser().Get<string>(Sys_User.Phone); }
        }


        public string OrgIDs
        {
            get { return UserAuth.OrgIDs; }
        }

        public string RoleID
        {
            get
            {
                return RoleIDs.Split(',')[0];//只取第一个部门。 
            }
        }

        public string RoleName
        {
            get { return GetRole().Get<string>(Sys_Role.RoleName); }
        }

        public string RoleIDs
        {
            get { return UserAuth.RoleIDs; }
        }
    }
}