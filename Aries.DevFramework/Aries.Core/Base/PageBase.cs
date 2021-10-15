﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Reflection;
using System.Data;
using System.IO;
using CYQ.Data;
using System.Text;
using CYQ.Data.Tool;
using Aries.Core;
using Aries.Core.Auth;
using Aries.Core.Helper;


namespace Aries.Core
{
    public abstract partial class PageBase : System.Web.UI.Page
    {
        /// <summary>
        /// 是否跳过检测当前账号是否拥有当前Url的访问权限。
        /// </summary>
        protected virtual bool IsBreakCheckMenuUrl { get { return false; } }
        protected void SetNoCache()
        {
            HttpContext.Current.Response.Expires = 0;
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
            HttpContext.Current.Response.CacheControl = "no-cache";

        }
        /// <summary>
        /// 用户权限
        /// </summary>
        public Permission p = null;
        protected override void OnPreInit(EventArgs e)
        {

            //KeyValueConfig.SaveJavaScript();
            UserAuth.IsExistsToken(true);//检测登陆状态。
            p = new Permission(UserAuth.UserName, !IsBreakCheckMenuUrl);//初始化权限检测。

            base.OnPreInit(e);
            SetNoCache();
        }

        #region 基础方法

        public static T Query<T>(string key)
        {
            return Query<T>(key, default(T));
        }
        public static T Query<T>(string key, T defaultValue)
        {
          return  WebHelper.Query<T>(key, defaultValue, false);
        }
        protected void Write(string result)
        {
            System.Web.HttpContext.Current.Response.Write(result);
        }
        #endregion

    }


}