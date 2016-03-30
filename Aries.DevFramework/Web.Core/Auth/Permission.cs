using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;

namespace Web.Core
{
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
    /// <summary>
    /// 权限类
    /// </summary>
    public class Permission
    {
        private string loginID;
        private string _menuID;
        public string MenuID
        {
            get
            {
                if (string.IsNullOrEmpty(_menuID) || _menuID == "0")
                {
                    _menuID = HttpContext.Current.Request["_mid"] ?? HttpContext.Current.Request["mid"];
                }
                return _menuID;
            }
        }
        /// <summary>
        /// 当前页面的菜单名称
        /// </summary>
        internal string MenuName { get; set; }
        public Permission(string loginID, bool checkMenu)
        {
            this.loginID = loginID;
#if !DEBUG
            checkMenu = true;
#endif
            if (checkMenu)
            {
                CheckMenu(System.Web.HttpContext.Current.Request.Url);
            }

        }
        /// <summary>
        /// 检测是否拥有某个菜单的浏览权限
        /// </summary>
        /// <param name="url"></param>
        private void CheckMenu(Uri uri)
        {
            if (IsEndWith(uri, "") && string.Compare(uri.LocalPath.Substring(0, 7), "/index.", true) != 0)
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
            string[] items = new[] { ".aspx", ".html", ".shtml" };
            foreach (string item in items)
            {
                if (uri.LocalPath.EndsWith(key + item))
                {
                    return true;
                }
            }
            return false;
        }
        /// <summary>
        /// 是否拥有菜单的权限
        /// </summary>
        /// <param name="url">菜单的相对路径</param>
        public bool HasMenu(Uri uri)
        {
            string url = uri.LocalPath;
            string where = string.Empty;
            string mid = HttpContext.Current.Request["_mid"] ?? HttpContext.Current.Request["mid"];
            if (!string.IsNullOrEmpty(mid))
            {
                where = "MenuID='" + mid + "' or ";
            }
            where += "MenuUrl='" + url + "' or MenuUrl='" + uri.PathAndQuery + "'";
            MDataRow menu = UserMenu.FindRow(where);
            if (menu == null)//进一步检测是否补充了后续参数问题
            {
                where = "MenuUrl like '" + url + "%'";
                menu = UserMenu.FindRow(where);
            }
            //获取当前请求的Url
            if (menu != null)
            {
                _menuID = menu.Get<string>(0);
                MenuName = menu.Get<string>("MenuName");
                return true;
            }
            else
            {
                string ui = AppConfig.GetApp("UI");
                if (!string.IsNullOrEmpty(ui))
                {
                    if (!url.ToLower().StartsWith(ui.ToLower()))
                    {
                        return HasMenu(new Uri("http://" + uri.Host + ui + uri.PathAndQuery));
                    }
                }
            }
            return false;
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
            if (string.IsNullOrEmpty(menuID) || menuID == "0" || UserAuth.IsAdmin) // 开发时临时开权限。
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
        /// 是否拥有某项二级功能按钮权限
        /// </summary>
        public bool HasFunc(FuncEnum key)
        {
            return HasFunc(key.ToString());
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
#if DEBUG
            if (string.IsNullOrEmpty(menuID) || menuID == "0" || UserAuth.IsAdmin)
            {
                return true;
            }
#else
            if (UserAuth.IsAdmin)
            {
                return true;
            }
#endif
            key = key.ToLower();
            string where = string.Empty;
            if (!string.IsNullOrEmpty(menuID) && menuID != "0")
            {
                where = "MenuID='" + menuID + "'";// and ActionRefNames like '%," + key + "%'";
                MDataRow row = UserMenu.FindRow(where);
                if (row != null)
                {
                    string actionRefNames = row.Get<string>("ActionRefNames", "");
                    string[] items = actionRefNames.Trim(',').Split(',');
                    foreach (string item in items)
                    {
                        if (item == key)
                        {
                            return true;
                        }
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
#if DEBUG
            if (string.IsNullOrEmpty(menuID))
            {
                return ",add,edit,del,import,export,config";
            }
#endif
            MDataTable dt = UserMenu;
            if (!string.IsNullOrEmpty(menuID))
            {
                MDataRow row = dt.FindRow("MenuID='" + menuID + "'");
                if (row != null)
                {
                    return row.Get<string>("ActionRefNames");
                }
            }
            return string.Empty;
        }
        /// <summary>
        /// 用户的权限列表
        /// </summary>
        public MDataTable UserMenu
        {
            get
            {
                return SysMenu.UserMenu;
            }
        }

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
    }
}
