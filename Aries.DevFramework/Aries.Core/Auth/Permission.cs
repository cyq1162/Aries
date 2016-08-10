using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;
using System.Reflection;
using Aries.Core.Helper;

namespace Aries.Core.Auth
{
    /*
    /// <summary>
    /// 基础请求方法
    /// </summary>
    public enum MethodEnum
    {
        None = -1,
        Get,
        GetList,
        Add,
        Update,
        Delete,
        Export,
        Import
    }
    /// <summary>
    /// 基础功能条。
    /// </summary>
    public enum FuncEnum
    {
        /// <summary>
        /// 添加数据
        /// </summary>
        Add,
        /// <summary>
        /// 更新数据
        /// </summary>
        Edit,
        /// <summary>
        /// 删除数据
        /// </summary>
        Del,
        /// <summary>
        /// 查询
        /// </summary>
        Search,
        /// <summary>
        /// 导出Excel
        /// </summary>
        Export,
        /// <summary>
        /// 导入Excel
        /// </summary>
        Import,
        /// <summary>
        /// 配置表头
        /// </summary>
        Config
    }
     */
    /// <summary>
    /// 权限类
    /// </summary>
    public class Permission
    {
        private string loginID;
        private string _menuID;
        /// <summary>
        /// 菜单ID（可能是上级菜单ID，不一定针对当前请求页面)
        /// </summary>
        public string MenuID
        {
            get
            {
                if (string.IsNullOrEmpty(_menuID))
                {
                    HasMenu(ReuqestUri);
                }
                return _menuID;
            }
        }
        /// <summary>
        /// 针对Url当前请求获取的菜单ID
        /// </summary>
        public string UrlMenuID
        {
            get
            {
                MDataRow row = GetMenu(ReuqestUri);
                if (row != null)
                {
                    return row.Get<string>("MenuID");
                }
                return string.Empty;
            }
        }
        private Uri ReuqestUri
        {
            get
            {
                if (HttpContext.Current.Request.Url.LocalPath.EndsWith("/ajax.html"))
                {
                    return HttpContext.Current.Request.UrlReferrer;
                }
                return HttpContext.Current.Request.Url;
            }
        }
        /// <summary>
        /// 当前页面的菜单名称
        /// </summary>
        internal string MenuName { get; set; }
        public Permission(string loginID, bool checkMenu)
        {
            this.loginID = loginID;
            if (checkMenu)
            {
                CheckMenu(ReuqestUri);
            }

        }
        /// <summary>
        /// 检测是否拥有某个菜单的浏览权限
        /// </summary>
        /// <param name="url"></param>
        private void CheckMenu(Uri uri)
        {
            if (IsEndWith(uri, "") && string.Compare(uri.LocalPath.Substring(0, 7), "/index.", true) != 0) //不是首页
            {
                if (!HasMenu(uri) && IsEndWith(uri, "List") && HttpContext.Current.Request.UrlReferrer == null)
                {
#if !DEBUG
                    throw new Exception("您没有访问当前请求页面的权限！");
#endif
                }
            }
        }
        private bool IsEndWith(Uri uri, string key)
        {
            string[] items = new[] { ".html", ".aspx", ".shtml" };
            foreach (string item in items)
            {
                if (uri.LocalPath.EndsWith(key + item))
                {
                    return true;
                }
            }
            return false;
        }
        private MDataRow GetMenu(Uri uri)
        {
            string url = uri.LocalPath;
            string pathAndQuery = uri.PathAndQuery;
            if (WebHelper.IsUseUISite)
            {
                int start = AppConfig.GetApp("UI").Trim('/').Length + 1;
                url = url.Remove(0, start);
                pathAndQuery = pathAndQuery.Remove(0, start);
            }
            string where = "MenuUrl='" + pathAndQuery + "' or MenuUrl='" + pathAndQuery.TrimStart('/') + "'";
            MDataRow menu = UserMenu.FindRow(where);
            if (menu == null)
            {
                where = "MenuUrl='" + url + "' or MenuUrl='" + url.TrimStart('/') + "'";
                menu = UserMenu.FindRow(where);
                if (menu == null)//进一步检测是否补充了后续参数问题
                {
                    where = "MenuUrl like '" + url + "%' or MenuUrl like '" + url.TrimStart('/') + "%'";
                    menu = UserMenu.FindRow(where);
                }
            }
            //获取当前请求的Url
            if (menu != null)
            {
                return menu;
            }
            //else
            //{
            //    string ui = AppConfig.GetApp("UI");
            //    if (!string.IsNullOrEmpty(ui))
            //    {
            //        if (!url.ToLower().StartsWith(ui.ToLower()))
            //        {
            //            return GetMenu(new Uri("http://" + uri.Host + ui + uri.PathAndQuery));
            //        }
            //    }
            //}
            return null;
        }
        /// <summary>
        /// 记录内面的上级ID（降低安全问题）
        /// </summary>
        private static Dictionary<string, string> parentIDList = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        /// <summary>
        /// 是否拥有菜单的权限
        /// </summary>
        /// <param name="url">菜单的相对路径</param>
        public bool HasMenu(Uri uri)
        {
            string mid = HttpContext.Current.Request["sys_mid"];
            MDataRow menu = GetMenu(uri);
            if (menu == null && !string.IsNullOrEmpty(mid))
            {
                bool isContain = parentIDList.ContainsKey(uri.LocalPath);
                if (isContain)
                {
                    mid = parentIDList[uri.LocalPath];//如果已经存在，则取存在过的。
                }
                menu = UserMenu.FindRow("MenuID='" + mid + "'");
                if (menu != null && !isContain)
                {
                    parentIDList.Add(uri.LocalPath, mid);
                }
            }
            if (menu != null)
            {
                _menuID = menu.Get<string>("MenuID");
                MenuName = menu.Get<string>("MenuName");
            }
            return menu != null;
        }
        /// <summary>
        /// 是否拥有菜单的权限
        /// </summary>
        public bool HasMenu()
        {
            return HasMenu(MenuID);
        }
        /// <summary>
        /// 是否拥有菜单的权限
        /// </summary>
        public bool HasMenu(string menuID)
        {

#if DEBUG
            if (string.IsNullOrEmpty(menuID) || UserAuth.IsAdmin) // 开发时临时开权限。
            {
                return true;
            }
#endif
            MDataRow menu = UserMenu.FindRow("MenuID='" + menuID + "'");
            //获取当前请求的Url
            if (menu != null)
            {
                this._menuID = menuID;
                MenuName = menu.Get<string>("MenuName");
                return true;
            }
            return false;
        }

        /// <summary>
        /// 是否拥有某项二级权限
        /// </summary>
        public bool HasFunc(string key)
        {
            return HasFunc(key, MenuID);
        }
        public bool HasFunc(string key, string menuID)
        {
            string actionKeys = GetFuncKeys(menuID);
            if (!string.IsNullOrEmpty(actionKeys))
            {
                actionKeys = "," + actionKeys + ",";
                string[] items = key.ToLower().Split(',');
                foreach (string item in items)
                {
                    if (actionKeys.Contains("," + item + ","))
                    {
                        return true;
                    }
                }
            }
            return false;
        }
        /// <summary>
        /// 获取当前菜单下的FuncKeys
        /// </summary>
        /// <returns></returns>
        public string GetFuncKeys()
        {
            return GetFuncKeys(MenuID);
        }
        /// <summary>
        /// 获取指定菜单下的FuncKeys
        /// </summary>
        /// <returns></returns>
        public string GetFuncKeys(string menuID)
        {
            if (!string.IsNullOrEmpty(menuID))
            {
                MDataRow row = UserMenu.FindRow("MenuID='" + menuID + "'");
                if (row != null)
                {
                    return row.Get<string>("ActionRefNames", "").ToLower();
                }
            }
            return string.Empty;
        }
        private MDataTable _UserMenu;
        /// <summary>
        /// 用户的权限列表
        /// </summary>
        public MDataTable UserMenu
        {
            get
            {
                if (_UserMenu == null)
                {
                    _UserMenu = SysMenu.UserMenu;
                }
                return _UserMenu;
            }
        }

        internal bool IsCanInvokeMethod(MethodInfo mi)
        {
            string key = string.Empty;
            foreach (object item in mi.GetCustomAttributes(typeof(ActionKeyAttribute), true))
            {
                key = Convert.ToString(item.GetType().GetProperty("Key").GetValue(item, null));
            }
            if (string.IsNullOrEmpty(key))
            {
                return true;
            }
            return HasFunc(key);
        }
        /*
        /// <summary>
        /// 默认的权限检测
        /// </summary>
        internal bool CheckMethod(string funcName, out MethodEnum m, out string msg)
        {

            msg = string.Empty;
            m = MethodEnum.None;
            //不需要权限的功能：
            switch (funcName)
            {
                case "Login":
                case "GetKeyValueConfig":
                    return true;

            }
            if (funcName.StartsWith("Get"))
            {
                if (funcName.Contains("List"))
                {
                    m = MethodEnum.GetList;
                    funcName = "GetList";
                }
                else
                {
                    m = MethodEnum.Get;
                    funcName = "Get";
                }
            }
            else if (funcName.StartsWith("Add"))
            {
                m = MethodEnum.Add;
                funcName = "Add";
            }
            else if (funcName.StartsWith("Delete"))
            {
                m = MethodEnum.Delete;
                funcName = "Delete";
            }
            else if (funcName.StartsWith("Update"))
            {
                m = MethodEnum.Update;
                funcName = "Update";
            }
            else if (funcName.StartsWith("Export"))
            {
                m = MethodEnum.Export;
                funcName = "Export";
            }
            else if (funcName.StartsWith("Import"))
            {
                m = MethodEnum.Import;
                funcName = "Import";
            }
            switch (funcName)
            {
                case "Get":
                case "GetList":
                    if (!HasMenu())
                    {
                        msg = "没有当前页面请求权限！";
                        return false;
                    }
                    break;
                case "Add":
                    if (!HasFunc(FuncEnum.Add))
                    {
                        msg = "没有添加权限！";
                        return false;
                    }
                    break;
                case "Delete":
                    if (!HasFunc(FuncEnum.Del))
                    {
                        msg = "没有删除权限！";
                        return false;
                    }
                    break;
                case "Update":
                    if (!HasFunc(FuncEnum.Edit))
                    {
                        msg = "没有更新权限！";
                        return false;
                    }
                    break;
                case "Export":
                    if (!HasFunc(FuncEnum.Export))
                    {
                        msg = "没有导出权限！";
                        return false;
                    }
                    break;
                case "Import":
                    if (!HasFunc(FuncEnum.Import))
                    {
                        msg = "没有导入权限！";
                        return false;
                    }
                    break;
            }
            return true;
        }
         * */
    }
}
