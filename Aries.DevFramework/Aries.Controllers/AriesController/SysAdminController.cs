﻿using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Aries.Core;
using Aries.Logic;
using Aries.Core.Config;
using Aries.Core.Helper;
using Aries.Core.Auth;
using Aries.Core.DB;
using Aries.Core.Sql;
using CYQ.Data.Json;

namespace Aries.Controllers
{
    /// <summary>
    /// 重写事件
    /// </summary>
    public partial class SysAdminController : Controller
    {
        public override void Get()
        {

            switch (TableName)
            {
                case "V_SYS_UserList":
                case "Sys_User":
                    ObjName = "V_SYS_UserList";
                    MDataRow row = GetOne();
                    if (row != null)
                    {
                        row.Set("Password", EncryptHelper.Decrypt(row.Get<string>("Password")));
                        jsonResult = JsonHelper.OutResult(true, row.ToJson());
                    }
                    break;
                default:
                    base.Get();
                    break;
            }
        }
        public override void Add()
        {
            switch (TableName)
            {
                case "V_SYS_UserList":
                case "Sys_User":
                    jsonResult = sysLogic.AddUser();
                    break;
                case "Sys_Menu":
                    jsonResult = sysLogic.AddMenu();
                    break;
                default:
                    base.Add();
                    break;
            }
        }
        public override void Update()
        {
            switch (TableName)
            {
                case "V_SYS_UserList":
                case "Sys_User":
                    jsonResult = sysLogic.UpdateUser();
                    break;
                default:
                    base.Update();
                    if (TableName == "Config_KeyValue")
                    {
                        if (KeyValueConfig.IsChangeLangConfig(GetID))
                        {
                            LangConst.InitKeyValue();//重新始始化多语言
                        }
                    }
                    break;
            }
        }

        public override void Delete()
        {
            switch (TableName)
            {
                case "V_SYS_UserList":
                case "Sys_User":
                    jsonResult = sysLogic.DeleteUser();
                    break;
                default:
                    base.Delete();
                    break;
            }
        }

        protected override MDataRow GetOne()
        {
            switch (ObjName)
            {
                case "V_SYS_UserList"://重写是为了支持文本数据库
                    return Select(GridConfig.SelectType.All).FindRow(GetID);
                //if (AppConfig.DB.DefaultDalType == DalType.Txt)
                //{

                //}
                //break;
            }
            return base.GetOne();
        }
        protected override MDataTable Select(GridConfig.SelectType st)
        {
            MDataTable dt = null;
            switch (ObjName)
            {
                case "Config_ExcelInfo":
                    dt = base.Select(st);
                    if (dt == null || dt.Rows.Count == 0)
                    {
                        string where = GetWhere();
                        if (!where.Contains(" and "))//包含其它查询条件时
                        {
                            sysLogic.InitExcelColumn();

                            //从Excel读取列写入
                            dt = base.Select(st);
                        }
                    }
                    break;
                case "V_SYS_UserList"://重写是为了支持文本数据库
                    dt = sysLogic.GetUserList(st);
                    //if (AppConfig.DB.DefaultDalType == DalType.Txt)
                    //{

                    //}
                    //else
                    //{
                    //    dt = base.Select(st);
                    //}

                    break;
                default:
                    dt = base.Select(st);
                    break;
            }
            return dt;
        }
        public override string GetWhere()
        {
            string where = base.GetWhere();
            if (!UserAuth.IsSuperAdmin)
            {
                switch (ObjName)
                {
                    case "Sys_Role":
                        string w = "RoleID<>'" + UserAuth.SuperAdminRoleID + "'";
                        if (string.IsNullOrEmpty(where))
                        {
                            where = w;
                        }
                        else
                        {
                            where = w + " and " + where;
                        }
                        break;
                    case "V_SYS_UserList":
                        w = "RoleIDs not like '%" + UserAuth.SuperAdminRoleID + "%'";
                        if (string.IsNullOrEmpty(where))
                        {
                            where = w;
                        }
                        else
                        {
                            where = w + " and " + where;
                        }
                        break;
                }
            }
            return where;
        }
        //protected override void EndInvoke(string methodName)
        //{
        //    //CYQ.Data 已具备自动缓存功能，所以可以简化掉一些手工的缓存机制。
        //    //switch (ObjName)
        //    //{
        //    //    case "Config_KeyValue":
        //    //       KeyValueConfig.KeyValueTable = null;
        //    //        break;
        //    //    case "Sys_Menu":
        //    //        SysMenu.MenuTable = null;
        //    //        break;

        //    //}
        //}
    }
    /// <summary>
    /// 菜单操作
    /// </summary>
    public partial class SysAdminController
    {
        SysLogic sysLogic;
        public SysAdminController()
        {
            sysLogic = new SysLogic(this);
        }
        /// <summary>
        /// 获取树菜单(Json转小写)[MenuEdit.html]
        /// </summary>
        public void GetMenu()
        {
            jsonResult = sysLogic.GetMenuJson();
            jsonResult = jsonResult.Replace(",\"parentmenuid\":\"\"", "");//兼容为空的情况。
        }

        /// <summary>
        /// 获取权限（Json转小写）[MenuEdit.html]
        /// </summary>
        public void GetActions()
        {
            jsonResult = sysLogic.GetActions();
        }
        /// <summary>
        /// 获取菜单详细数据[MenuEdit.html]
        /// </summary>
        public void GetMenuDetails()
        {
            jsonResult = sysLogic.GetMenuDetails();
        }

        /// <summary>
        /// 删除菜单[MenuEdit.html]
        /// {id:menuid}
        /// </summary>
        public void DeleteMenu()
        {
            jsonResult = sysLogic.DeleteMenu();
        }

        /// <summary>
        /// 验证菜单是否有子菜单[MenuEdit.html]
        /// </summary>
        public void ValidMenuHasChild()
        {
            jsonResult = sysLogic.ValidMenuHasChild();
        }
        /// <summary>
        /// [RoleAction.html]
        /// </summary>
        public void GetMenuAndAction()
        {
            jsonResult = sysLogic.GetMenuAndAction();
        }

        /// <summary>
        /// [RoleAction.html]
        /// </summary>
        public void GetMenuIDsandActionIDs()
        {
            jsonResult = sysLogic.GetMenuIDsandActionIDs();
        }

        /// <summary>
        /// [RoleAction.html]
        /// </summary>
        public void AddPromission()
        {
            jsonResult = sysLogic.AddPromission();
        }

        //public void MappingExelInfo()
        //{
        //    jsonResult = sysLogic.GetExcelMapping();
        //}

        /// <summary>

    }

    /// <summary>
    /// SqlCode操作
    /// </summary>
    public partial class SysAdminController
    {
        /// [SQLCodeEdit.html]
        /// </summary>
        public void GetSqlCode()
        {
            jsonResult = sysLogic.GetSQLCodeJson();
        }
        [ActionKey("View,Get")]
        /// <summary>
        /// 获取框架文件对应的SQL语句 By CYQ
        /// </summary>
        public void GetSql()
        {
            string sql = SqlCode.Get(ObjName);
            bool result = !string.IsNullOrEmpty(sql);
            jsonResult = JsonHelper.OutResult(result, sql);
        }
        [ActionKey("Edit,Update")]
        /// <summary>
        /// 保存框架文件对应的SQL语句 By CYQ
        /// </summary>
        public void SaveSql()
        {
            string msg;
            bool result = SqlCode.Save(ObjName, Query<string>("sys_code"), out msg);
            jsonResult = JsonHelper.OutResult(result, result ? LangConst.SaveSuccess : LangConst.SaveError + msg);
        }
        [ActionKey("Add,Insert")]
        /// <summary>
        /// 保存框架文件对应的SQL语句 By CYQ
        /// </summary>
        public void AddSql()
        {
            string msg;
            bool result = SqlCode.Create(ObjName, Query<string>("sys_path"), out msg);
            jsonResult = JsonHelper.OutResult(result, result ? LangConst.AddSuccess : LangConst.AddError + msg);
        }
        [ActionKey("Del,Delete")]
        public void DeleteSql()
        {
            string msg;
            bool result = SqlCode.Delete(ObjName, out msg);
            jsonResult = JsonHelper.OutResult(result, result ? LangConst.DeleteSuccess : LangConst.DeleteError + msg);
        }
    }
}
