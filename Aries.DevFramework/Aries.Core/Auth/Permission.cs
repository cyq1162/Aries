using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;
using System.Reflection;
using Aries.Core.Helper;
using CYQ.Data.Tool;
using System.IO;
using CYQ.Data.Cache;

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
        #region 系统安全
        /// <summary>
        /// 记录页面对应可操作的对应：（降低安全问题）（mid：TableName）
        /// </summary>
        private static MDictionary<string, string> midTableNameList = new MDictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        public void Set(string objName, string tableName)
        {
            if (string.IsNullOrEmpty(objName)) { return; }
            if (midTableNameList.ContainsKey(MenuID))
            {
                string value = midTableNameList[MenuID];
                if (value.IndexOf(objName) == -1)
                {
                    value += "," + objName;
                }
                if (!string.IsNullOrEmpty(tableName) && value.IndexOf(tableName) == -1)
                {
                    value += "," + tableName;
                }
                midTableNameList[MenuID] = value;
            }
            else
            {
                string value = objName;
                if (!string.IsNullOrEmpty(tableName) && tableName != objName)
                {
                    value += "," + tableName;
                }
                midTableNameList.Add(MenuID, value);
            }
        }
        public bool Exists(string objName)
        {
            if (!string.IsNullOrEmpty(objName) && midTableNameList.ContainsKey(MenuID))
            {
                return midTableNameList[MenuID].IndexOf(objName) > -1;
            }
            return false;
        }
        #endregion

        /// <summary>
        /// 记录内面的上级ID（降低安全问题）（Url,mid）
        /// </summary>
        private static Dictionary<string, string> parentIDList = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
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
                return _menuID ?? string.Empty;
            }
        }
        private string _UrlMenuID;
        /// <summary>
        /// 针对Url当前请求获取的菜单ID
        /// </summary>
        public string UrlMenuID
        {
            get
            {
                if (string.IsNullOrEmpty(_UrlMenuID))
                {
                    MDataRow row = GetMenu(ReuqestUri);
                    if (row != null)
                    {
                        _UrlMenuID = row.Get<string>("MenuID");
                    }
                }
                return _UrlMenuID ?? string.Empty;
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
            Uri refUri = HttpContext.Current.Request.UrlReferrer;
            if (!HasMenu(uri) && refUri == null)
            {
                throw new Exception("No permission to view this page！");
            }
            else if (refUri != null && refUri.LocalPath != uri.LocalPath && Path.GetFileNameWithoutExtension(uri.LocalPath).ToLower() == "dialogview")//关键页面，进一步做权限验证
            {
                string objName = WebHelper.Query<string>("objName", "", false);//去掉前置的_
                if (objName == "" || !WebHelper.IsKeyInHtml(objName))
                {
                    throw new Exception("No permission on this objName！");
                }
            }
        }

        private MDataRow GetMenu(Uri uri)
        {
            if (UserMenu != null)
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
            }
            return null;
        }

        /// <summary>
        /// 是否拥有菜单的权限
        /// </summary>
        /// <param name="url">菜单的相对路径</param>
        public bool HasMenu(Uri uri)
        {
            string key = UserAuth.UserID + ":" + uri.PathAndQuery;
            MDataRow menu = CacheManage.LocalInstance.Get(key) as MDataRow;
            if (menu == null)
            {
                menu = GetMenu(uri);
                string mid = HttpContext.Current.Request["sys_mid"];
                if (menu == null && HttpContext.Current.Request.UrlReferrer != null)
                {
                    menu = GetMenu(HttpContext.Current.Request.UrlReferrer);
                }
                if (menu == null && !string.IsNullOrEmpty(mid) && mid.IndexOfAny(new char[] { ' ', '%', ',' }) == -1)
                {
                    bool isContain = parentIDList.ContainsKey(uri.LocalPath);
                    if (isContain)
                    {
                        mid = parentIDList[uri.LocalPath];//如果已经存在，则取存在过的。
                    }
                    menu = UserMenu.FindRow("MenuID='" + mid + "'");
                    if (menu != null && !isContain)
                    {
                        switch (Path.GetFileNameWithoutExtension(HttpContext.Current.Request.UrlReferrer.LocalPath).ToLower())
                        {
                            case "configgrid": //如果是系统页面，则忽略
                            case "dialogview":
                                break;
                            default:
                                parentIDList.Add(uri.LocalPath, mid);
                                break;
                        }

                    }
                }
            }
            if (menu != null)
            {
                CacheManage.LocalInstance.Set(key, menu, 0.5);//存档30秒。
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

            //#if DEBUG
            //            if (string.IsNullOrEmpty(menuID) || UserAuth.IsAdmin) // 开发时临时开权限。
            //            {
            //                return true;
            //            }
            //#endif
            if (!string.IsNullOrEmpty(menuID) && menuID.IndexOfAny(new char[] { ' ', '%', ',' }) == -1)
            {
                MDataRow menu = UserMenu.FindRow("MenuID='" + menuID + "'");
                //获取当前请求的Url
                if (menu != null)
                {
                    this._menuID = menuID;
                    MenuName = menu.Get<string>("MenuName");
                    return true;
                }
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
            if (!string.IsNullOrEmpty(menuID) && menuID.IndexOfAny(new char[] { ' ', '%', ',' }) == -1)
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
            switch (mi.Name)//只需要登陆权限的方法。
            {
                case "GetInitConfig":
                case "GetKeyValueConfig":
                case "GetHeader":
                    if (!CheckSafeKey(30))
                    {
                        return false;
                    }
                    return true;
                case "GetList":
                case "GetCombobox":
                    if (!CheckSafeKey(0))
                    {
                        return false;
                    }
                    return true;
            }
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
        private bool CheckSafeKey(int second)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["aries_safekey"];
            if (cookie != null)
            {
                string value = EncrpytHelper.Decrypt(cookie.Value);
                if (value.StartsWith("aries:"))
                {
                    if (second == 0) { return true; }
                    int time;
                    if (int.TryParse(value.Split(':')[1], out time))
                    {
                        int result = int.Parse(DateTime.Now.ToString("HHmmss")) - time;
#if DEBUG
                        return result > -1 && result < 120;//2分钟的调试时间
#else
                        return result > -1 && result < second;
#endif
                    }
                }
            }
            return false;
        }

    }
}
