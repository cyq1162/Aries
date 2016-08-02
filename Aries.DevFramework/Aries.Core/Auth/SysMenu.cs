using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;

namespace Aries.Core
{
    /// <summary>
    /// 系统菜单相关类
    /// </summary>
    public static partial class SysMenu
    {
        private static MDataTable _MenuTable;
        /// <summary>
        /// 菜单表（全局缓存）
        /// </summary>
        public static MDataTable MenuTable
        {
            get
            {
                if (_MenuTable == null)
                {
                    using (MAction action = new MAction(TableNames.Sys_Menu))
                    {
                        _MenuTable = action.Select("order by MenuLevel ASC,SortOrder ASC");
                    }
                }
                return _MenuTable;
            }
            set
            {
                _MenuTable = value;
            }
        }

        private static MDataTable _ActionTable;
        /// <summary>
        /// 菜单功能表（全局缓存）
        /// </summary>
        public static MDataTable ActionTable
        {
            get
            {
                if (_ActionTable == null)
                {
                    using (MAction action = new MAction(TableNames.Sys_Action))
                    {
                        _ActionTable = action.Select();
                    }
                }
                return _ActionTable;
            }
            set
            {
                _ActionTable = value;
            }
        }



    }
    public static partial class SysMenu
    {
        /// <summary>
        /// 系统菜单（功能项变成子节点）
        /// </summary>
        public static MDataTable SysMenuAction
        {
            get
            {
                MDataTable dt = MenuTable.Clone();
                MDataTable action = ActionTable;
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    var row = dt.Rows[i];
                    string actionIDs = row.Get<string>("ActionIDs");
                    if (!string.IsNullOrEmpty(actionIDs))
                    {
                        string[] ids = actionIDs.Split(',');
                        string refNames = string.Empty, actionNames = string.Empty;
                        string menuID = row.Get<string>("MenuID");
                        foreach (string id in ids)
                        {
                            var aRow = action.FindRow("ActionID='" + id + "'");
                            if (aRow != null)
                            {
                                var dr = dt.NewRow(true);
                                dr.Set("MenuID", id);
                                dr.Add("ParentMenuID", menuID);
                                dr.Add("MenuName", aRow.Get<string>("ActionName"));
                                dr.Add("ActionIDs", "");
                                dr.Add("menuIcon", "icon-save");
                                // dt.Rows.Add(dr);
                            }
                        }
                    }
                }
                return dt;
            }
        }

        /// <summary>
        /// 当前登陆用户的菜单
        /// </summary>
        public static MDataTable UserMenu
        {
            get
            {
                string roleIDs = UserAuth.User.Get<string>("RoleIDs");
                if (!string.IsNullOrEmpty(roleIDs))
                {
                    roleIDs = "RoleID in ('" + roleIDs.Replace(",", "','") + "')";
                    MDataTable dt;
                    using (MAction action = new MAction(TableNames.Sys_RoleAction))
                    {
                        action.SetSelectColumns("MenuID", "ActionID");
                        dt = action.Select(roleIDs);
                    }
                    if (dt.Rows.Count > 0)
                    {
                        Dictionary<string, string> dic = RoleActionToDic(dt);
                        MDataTable menuDt = MenuTable.Clone();
                        #region 组合有权限的菜单
                        menuDt.Columns.Add("ActionRefNames", System.Data.SqlDbType.NVarChar);
                        for (int i = 0; i < menuDt.Rows.Count; i++)
                        {
                            MDataRow row = menuDt.Rows[i];
                            string menuID = row.Get<string>("MenuID");
                            if (!dic.ContainsKey(menuID))
                            {
                                if (!HasChild(menuID, MenuTable, dic))
                                {
                                    menuDt.Rows.RemoveAt(i);
                                    i--;
                                }
                            }
                            else
                            {
                                row.Set("ActionRefNames", dic[menuID]);
                            }
                        }
                        #endregion
                        return menuDt;
                    }

                }
                return null;
            }
        }
        /// <summary>
        /// 角色权限表转字典
        /// </summary>
        /// <param name="onlyID">默认需要引用名，true时引用ID</param>
        /// <returns></returns>
        public static Dictionary<string, string> RoleActionToDic(MDataTable dt, bool onlyID = false)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            if (dt.Rows.Count > 0)
            {
                dt.Distinct();//去掉重复行。

                MDataTable action = ActionTable;
                foreach (MDataRow row in dt.Rows)
                {
                    string menuID = row.Get<string>("MenuID");
                    string actionID = row.Get<string>("ActionID");
                    MDataRow aRow = action.FindRow("ActionID='" + actionID + "'");
                    if (aRow != null)
                    {
                        if (dic.ContainsKey(menuID))
                        {
                            dic[menuID] = dic[menuID] + "," + (onlyID ? actionID : aRow.Get<string>("ActionRefName").Trim());
                        }
                        else
                        {
                            dic.Add(menuID, (onlyID ? actionID : aRow.Get<string>("ActionRefName").Trim()));
                        }
                    }
                }
            }
            return dic;
        }
        /// <summary>
        /// 是否拥有下级的菜单权限
        /// </summary>
        /// <param name="menuID">当前菜单ID</param>
        /// <param name="menuDt">整个菜单表</param>
        /// <param name="dic">当前用户拥有权限的的菜单</param>
        /// <returns></returns>
        private static bool HasChild(string menuID, MDataTable menuDt, Dictionary<string, string> dic)
        {
            List<MDataRow> childs = menuDt.FindAll("ParentMenuID='" + menuID + "'");
            if (childs != null && childs.Count > 0)
            {
                bool result = false;
                foreach (MDataRow row in childs)
                {
                    menuID = row.Get<string>("MenuID");
                    result = dic.ContainsKey(menuID);
                    if (!result)
                    {
                        result = HasChild(menuID, menuDt, dic);
                    }
                    if (result)
                    {
                        return result;
                    }
                }
            }
            return false;
        }

    }
}
