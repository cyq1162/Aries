using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using Aries.Core;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using Aries.Core.DB;
using Aries.Core.Helper;
using Aries.Core.Config;
using Aries.Core.Auth;
using Aries.Core.Extend;

namespace Aries.Logic
{
    /// <summary>
    /// 注：本类由框架组提供，其它人不得修改。
    /// 需要扩展定义，新建一个文件，定义同名的partial类即可。
    /// </summary>
    public partial class SysLogic : LogicBase
    {
        public SysLogic(IBase custom) : base(custom) { }

        #region 用户表相关操作
        /// <summary>
        /// 更新用户by CYQ
        /// </summary>
        /// <param name="objName"></param>
        public string UpdateUser()
        {
            bool result = false;
            string pwd = Query<string>("Password");
            string userID = Query<string>("UserID");
            using (MAction action = new MAction(U_AriesEnum.Sys_User))
            {
                action.BeginTransation();
                if (!string.IsNullOrEmpty(pwd))
                {
                    action.Set(Sys_User.Password, EncrpytHelper.Encrypt(pwd));//加密
                }
                result = action.Update(userID, true);
                if (result)
                {
                    action.ResetTable(U_AriesEnum.Sys_UserInfo);
                    if (action.Exists(userID))
                    {
                        if (action.Data.Count > 1)//有自定义列
                        {
                            result = action.Update(userID, true);
                        }
                    }
                    else
                    {
                        action.Set(Sys_UserInfo.UserInfoID, userID);
                        action.AllowInsertID = true;
                        result = action.Insert(true);
                    }
                }
                if (!result)
                {
                    action.RollBack();
                }
                action.EndTransation();

            }
            return JsonHelper.OutResult(result, result ? "更新成功!" : "更新失败!");
        }

        /// <summary>
        /// 添加用户by CYQ
        /// </summary>
        /// <returns></returns>
        public string AddUser()
        {
            string jsonResult = string.Empty;
            bool result = false;
            string userName = Query<string>("userName");
            string pwd = Query<string>("password");
            using (MAction action = new MAction(U_AriesEnum.Sys_User))
            {
                action.BeginTransation();
                if (!action.Exists("UserName = '" + userName + "'"))
                {
                    action.Set("Password", EncrpytHelper.Encrypt(pwd));//加密
                    if (action.Insert(true, InsertOp.ID))
                    {
                        string userID = action.Get<string>(Sys_User.UserID);

                        action.ResetTable(U_AriesEnum.Sys_UserInfo);
                        action.Set(Sys_UserInfo.UserInfoID, userID);
                        action.AllowInsertID = true;
                        result = action.Insert(true);
                        if (!result)
                        {
                            action.RollBack();
                        }
                        else
                        {
                            jsonResult = JsonHelper.OutResult(result, result ? "添加用户成功!" : "添加用户失败!");
                        }
                    }
                }
                else
                {
                    jsonResult = JsonHelper.OutResult(false, "帐号已存在,请重新输入");
                }
                action.EndTransation();
            }

            return jsonResult;
        }

        public string DeleteUser()
        {
            bool result = false;
            using (MAction action = new MAction(U_AriesEnum.Sys_User))
            {
                action.BeginTransation();
                result = action.Delete(GetID);
                if (result)
                {
                    action.ResetTable(U_AriesEnum.Sys_UserInfo);
                    if (action.Exists(GetID))
                    {
                        result = action.Delete(GetID);
                    }
                }
                if (!result)
                {
                    action.RollBack();
                }
                action.EndTransation();
            }
            return JsonHelper.OutResult(result, result ? "删除成功!" : "删除失败!");
        }

        public MDataTable GetUserList(GridConfig.SelectType st)
        {
            MDataTable dt = null;
            using (MAction action = new MAction(U_AriesEnum.Sys_User))
            {
                dt = action.Select();
            }
            dt.JoinOnName = Sys_User.UserID.ToString();
            MDataTable joinDt = dt.Join(U_AriesEnum.Sys_UserInfo, Sys_UserInfo.UserInfoID.ToString());
            return joinDt.Select(PageIndex, PageSize, GetWhere() + GetOrderBy(Sys_User.UserID.ToString()), GridConfig.GetSelectColumns(ObjName, st));
        }

        #endregion


        #region 菜单权限相关操作
        /// <summary>
        /// 获取菜单（菜单管理，Json已转小写）
        /// </summary>
        /// <returns></returns>
        public string GetMenuJson()
        {
            string result = string.Empty;
            MDataTable dt;
            using (MAction action = new MAction(U_AriesEnum.Sys_Menu))
            {
                dt = action.Select("ORDER BY menulevel ASC,sortorder asc");
            }

            return dt.ToJson(false, false, RowOp.None, true);//字段转小写，兼容Oracle
        }
        /// <summary>
        /// 获取所有权限
        /// </summary>
        /// <returns></returns>
        public string GetActions()
        {
            string result = string.Empty;
            using (MAction action = new MAction(U_AriesEnum.Sys_Action))
            {
                result = action.Select("order by SortOrder asc").ToJson(false, false, RowOp.None, true);
            }
            return result;
        }

        /// <summary>
        /// 获取菜单详细数据
        /// </summary>
        /// <returns></returns>
        public string GetMenuDetails()
        {
            string result = string.Empty;
            string id = Query<string>("id");
            using (MAction action = new MAction(U_AriesEnum.Sys_Menu))
            {
                if (action.Fill(id))
                {
                    result = action.Data.ToJson(true);
                }
            }
            return result;
        }

        /// <summary>
        /// 删除菜单
        /// </summary>
        /// <returns></returns>
        public string DeleteMenu()
        {
            bool result = false;
            string id = Query<string>("id");
            using (MAction action = new MAction(U_AriesEnum.Sys_Menu))
            {
                action.SetSelectColumns("MenuID", "ParentMenuID");
                MDataTable dt = action.Select();
                StringBuilder sb = new StringBuilder();
                sb.Append("'" + id + "',");
                GatherChildrenID(dt, id, sb, "ParentMenuID");
                string where = "MenuID in (" + sb.ToString().TrimEnd(',') + ")";
                result = action.Delete(where);
                if (result)
                {
                    action.ResetTable(U_AriesEnum.Sys_RoleAction);//删除权限的设置
                    action.Delete(where);
                }
            }
            return JsonHelper.OutResult(result, result ? "删除成功" : "删除失败");
        }
        /// <summary>
        /// 验证菜单是否有子节点
        /// luoshushi
        /// </summary>
        /// <returns></returns>
        public string ValidMenuHasChild()
        {
            bool result = false;
            string MenuID = Query<string>("MenuID");
            using (MAction action = new MAction(U_AriesEnum.Sys_Menu))
            {
                result = action.Exists("ParentMenuID='" + MenuID + "'");
            }
            return JsonHelper.OutResult(result, "");
        }
        /// <summary>
        /// 接收Post过来的Json权限
        /// </summary>
        /// <returns></returns>
        private MDataTable GetTable(string roleID)
        {
            MDataTable rowAction = new MDataTable(U_AriesEnum.Sys_RoleAction.ToString());
            rowAction.Columns.Add("RoleID", SqlDbType.NVarChar);
            rowAction.Columns.Add("MenuID", SqlDbType.NVarChar);
            rowAction.Columns.Add("ActionID", SqlDbType.NVarChar);
            MDataTable dt;
            if (Query<string>("all") == "1")
            {
                if (UserAuth.IsSuperAdmin)
                {
                    dt = SysMenu.MenuTable;
                }
                else
                {
                    dt = SysMenu.GetUserMenu(true);
                }
            }
            else
            {
                dt = MDataTable.CreateFrom(Query<string>("data"));
            }
            if (dt != null && dt.Rows.Count > 0)
            {
                string menuID = string.Empty;
                foreach (MDataRow row in dt.Rows)
                {
                    menuID = row.Get<string>("MenuID");
                    if (!string.IsNullOrEmpty(menuID))
                    {
                        string[] ActionIDs = row.Get<string>("ActionIDs", "").Split(',');
                        foreach (string actionID in ActionIDs)
                        {
                            if (!string.IsNullOrEmpty(actionID))
                            {
                                rowAction.NewRow(true).Set(0, roleID).Set(1, menuID).Set(2, actionID);
                            }
                        }
                    }
                }
            }
            return rowAction;
        }
        /// <summary>
        /// 添加权限
        /// </summary>
        /// <returns></returns>
        public string AddPromission()
        {

            string roleID = Query<string>("RoleID");
            bool result = false;
            MDataTable dt = GetTable(roleID);// MDataTable.CreateFrom(strArr, mdc);

            if (dt != null && dt.Rows.Count > 0)
            {
                //删除该角色下面所有权限
                using (MAction action = new MAction(U_AriesEnum.Sys_RoleAction))
                {
                    action.BeginTransation();
                    action.Delete("RoleID='" + roleID + "'");
                    dt.DynamicData = action;
                    dt.SetState(1);
                    result = dt.AcceptChanges(AcceptOp.Insert);
                    if (!result)
                    {
                        action.RollBack();
                    }
                    action.EndTransation();
                }
            }

            return JsonHelper.OutResult(result, result ? "添加成功！" : "添加失败！");
        }
        public string GetMenuAndAction()
        {
            return SysMenu.SysMenuAction.ToJson(true, false, RowOp.IgnoreNull, true);
        }

        public string GetMenuIDsandActionIds()
        {
            string roleID = Query<String>("RoleID");
            MDataTable raDt = null;
            using (MAction action = new MAction(U_AriesEnum.Sys_RoleAction))
            {
                raDt = action.Select("RoleID ='" + roleID + "'");
            }
            Dictionary<string, string> dic = SysMenu.RoleActionToDic(raDt, true);
            return JsonHelper.ToJson(dic);
        }
        /// <summary>
        /// 新增菜单(重写 返回个ID)
        /// </summary>
        /// <returns></returns>
        public string AddMenu()
        {

            bool result = false;
            string msg = string.Empty;
            using (MAction action = new MAction(ObjName))
            {
                if (Query<int>("MenuLevel") == 1)
                {
                    action.Set("ParentMenuID", DBNull.Value);
                }
                result = action.Insert(true, InsertOp.ID);
                if (result)
                {
                    msg = action.Get<string>(action.Data.PrimaryCell.ColumnName);
                    AddSuperAdminPromission(msg, action.Get<string>("ActionIDs"));
                }
                else if (AppConfig.Debug.OpenDebugInfo)
                {
                    Log.WriteLogToTxt(action.DebugInfo);
                }
            }
            return JsonHelper.OutResult(result, result ? msg : "添加失败!");
        }
        private void AddSuperAdminPromission(string menuID, string actionIDs)
        {
            if (!string.IsNullOrEmpty(actionIDs))
            {
                MDataTable dt = new MDataTable(U_AriesEnum.Sys_RoleAction.ToString());
                dt.Columns.Add("RoleID");
                dt.Columns.Add("MenuID");
                dt.Columns.Add("ActionID");
                foreach (string actionID in actionIDs.Split(','))
                {
                    dt.NewRow(true).Set(0, UserAuth.SuperAdminRoleID)
                        .Set(1, menuID).Set(2, actionID);
                }
                dt.AcceptChanges(AcceptOp.Insert, CrossDb.GetConn(U_AriesEnum.Sys_RoleAction.ToString()));
            }
        }

        #endregion


        private void GatherChildrenID(MDataTable dt, string parentID, StringBuilder sb, string parentName = "ParentID")
        {
            if (!string.IsNullOrEmpty(parentID))
            {
                MDataRowCollection rows = dt.FindAll(parentName + "='" + parentID + "'");
                if (rows != null)
                {
                    string id = string.Empty;
                    foreach (MDataRow row in rows)
                    {
                        id = row.Get<string>(0);
                        sb.Append("'" + id + "',");
                        GatherChildrenID(dt, id, sb, parentName);
                    }
                }
            }
        }

        public string GetExcelMapping()
        {
            MDataRow row = ExcelConfig.GetExcelRow(Query<string>("ID"));
            string objName = row.Get<string>(Config_Excel.ExcelName);
            string[] TableNames = row.Get<string>(Config_Excel.TableNames).Split(',');
            Dictionary<string, string> dic = new Dictionary<string, string>();
            JsonHelper js = new JsonHelper();
            foreach (string name in TableNames)
            {
                MDataColumn mdc = DBTool.GetColumns(name);
                js.Add(name, GetJson(mdc), true);
                dic.Add(name, name);
            }
            JsonHelper jh = new JsonHelper();
            jh.Add("objName", objName);
            jh.Add("arrColumns", js.ToString(false));
            jh.Add("arrTables", MDataTable.CreateFrom(dic).ToJson(false, false));
            return jh.ToString();
        }
        private string GetJson(MDataColumn mdc)
        {
            JsonHelper js = new JsonHelper();
            foreach (var cell in mdc)
            {
                js.Add("Key", cell.ColumnName);
                js.Add("Value", cell.ColumnName);
                js.AddBr();
            }
            return js.ToString(true);
        }
    }

    public partial class SysLogic
    {
        /// <summary>
        /// 根据Excel导入模板创建初始映射数据到（Config_ExcelInfo）表中。
        /// </summary>
        public void InitExcelColumn()
        {
            string excelID = Query<string>("ExcelID");
            MDataRow row = ExcelConfig.GetExcelRow(excelID);
            if (row != null)
            {
                string excelName = row.Get<string>(Config_Excel.ExcelName);
                string path = Context.Server.MapPath("~/Resource/Excel/" + excelName + ".xls");
                bool isExists = File.Exists(path);
                if (!isExists)
                {
                    path = Context.Server.MapPath("~/Resource/Excel/" + excelName + ".xlsx");
                    isExists = File.Exists(path);
                }
                if (isExists)
                {
                    MDataTable table;
                    using (FileStream stream = File.OpenRead(path))
                    {
                        table = ExcelHelper.ReadExcel(stream, null, row.Get<int>(Config_Excel.StartIndex), row.Get<int>(Config_Excel.HeadCrossRowNum), true);
                    }
                    if (table != null && table.Columns.Count > 0)
                    {
                        string tableNames = row.Get<string>(Config_Excel.TableNames, string.Empty);
                        Dictionary<MCellStruct, string> msList = new Dictionary<MCellStruct, string>();
                        foreach (string tableName in tableNames.Split(','))
                        {
                            MDataColumn mdc = DBTool.GetColumns(tableName);
                            #region MyRegion
                            using (MAction action = new MAction(U_AriesEnum.Config_Grid))
                            {
                                for (int i = 0; i < mdc.Count; i++)
                                {
                                    MCellStruct ms = mdc[i];
                                    bool result = action.Fill(string.Format("{0}='{1}' And {2}='{3}' order by {4} desc",
                                      Config_Grid.Field, ms.ColumnName, Config_Grid.ObjName, excelName, Config_Grid.Formatter));
                                    if (string.IsNullOrEmpty(ms.Description))
                                    {
                                        if (result)
                                        {
                                            ms.Description = action.Get<string>(Config_Grid.Title);
                                        }
                                    }
                                    if (result)
                                    {
                                        string formatter = action.Get<string>(Config_Grid.Formatter, string.Empty);
                                        if (formatter.StartsWith("#") && formatter.Length > 2)
                                        {
                                            ms.DefaultValue = formatter.Split('=')[0];
                                        }
                                        else
                                        {
                                            ms.DefaultValue = string.Empty;
                                        }
                                    }
                                    msList.Add(ms, tableName);
                                }
                            }
                            #endregion
                        }
                        using (MAction action = new MAction(U_AriesEnum.Config_ExcelInfo))
                        {
                            action.AllowInsertID = true;
                            action.BeginTransation();
                            foreach (MCellStruct st in table.Columns)
                            {
                                action.Data.Clear();
                                action.Set(Config_ExcelInfo.ExceInfoID, Guid.NewGuid());
                                action.Set(Config_ExcelInfo.ExcelID, excelID);
                                action.Set(Config_ExcelInfo.ExcelName, st.ColumnName);
                                action.Set(Config_ExcelInfo.IsForeignkey, false);
                                action.Set(Config_ExcelInfo.IsRequired, false);
                                action.Set(Config_ExcelInfo.IsUnique, false);
                                string name = st.ColumnName.Split('_')[0];
                                MCellStruct key = null;
                                foreach (var ms in msList)
                                {
                                    if (!string.IsNullOrEmpty(ms.Key.Description))
                                    {
                                        if (ms.Key.Description.Trim().Equals(name.Trim(), StringComparison.OrdinalIgnoreCase))//避免相似描述的字段列名弄错
                                        {
                                            action.Set(Config_ExcelInfo.TableName, msList[ms.Key]); key = ms.Key;
                                            action.Set(Config_ExcelInfo.Field, ms.Key.ColumnName);
                                            action.Set(Config_ExcelInfo.Formatter, ms.Key.DefaultValue);
                                            if (!ms.Key.IsCanNull) { action.Set(Config_ExcelInfo.IsRequired, true); }
                                            if (ms.Key.IsUniqueKey) { action.Set(Config_ExcelInfo.IsUnique, true); }
                                            if (ms.Key.IsForeignKey)
                                            {
                                                action.Set(Config_ExcelInfo.IsForeignkey, true);
                                                action.Set(Config_ExcelInfo.ForeignTable, ms.Key.FKTableName);
                                            }
                                            break;
                                        }
                                    }
                                }
                                if (key != null)
                                {
                                    msList.Remove(key);//Config_Grid存在Title值相同的数据，添加完须立即删除
                                }
                                if (!action.Insert(InsertOp.None))
                                {
                                    Log.WriteLogToTxt(action.DebugInfo);
                                    break;
                                }
                            }
                            action.EndTransation();
                        }
                    }
                }


            }
        }
    }
}
