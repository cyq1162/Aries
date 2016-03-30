using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Core;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using Web.Utility;
using Web.Logic.Sys;

namespace Web.UI.Ajax
{
    /// <summary>
    /// 重写事件
    /// </summary>
    public partial class SysHandler
    {
        private string _ObjName;
        public new string ObjName
        {
            get
            {
                if (string.IsNullOrEmpty(_ObjName))
                {
                    return base.ObjName;
                }
                return _ObjName;
            }
            set
            {
                _ObjName = value;
            }
        }
        public override void Get()
        {
            switch (ObjName)
            {
                case "V_SYS_UserList":
                    MDataRow row = GetOne();
                    if (row != null)
                    {
                        row.Set("Password", EncrpytHelper.Decrypt(row.Get<string>("Password")));
                        jsonResult = row.ToJson();
                    }
                    break;
                default:
                    base.Get();
                    break;
            }
        }
        public override void Add()
        {
            switch (ObjName)
            {
                case "V_SYS_UserList":

                    jsonResult = sysLogic.AddUser();
                    break;
                case "System_Menu":
                    jsonResult = sysLogic.AddMenu();
                    break;
                default:
                    base.Add();
                    break;
            }
        }
        public override void Update()
        {
            switch (ObjName)
            {
                case "V_SYS_UserList":
                    jsonResult = sysLogic.UpdateUser();
                    break;
                default:
                    base.Update();
                    break;
            }
        }

        public override void Delete()
        {
            switch (ObjName)
            {
                case "System_Users":
                case "V_SYS_UserList":
                    jsonResult = sysLogic.DeleteUser();
                    break;
                default:
                    base.Delete();
                    break;
            }
        }

        protected override void EndInvoke(TableNames t, MethodEnum m)
        {
            switch (t)
            {
                case TableNames.Config_KeyValue:
                    KeyValueConfig.KeyValueTable = null;
                    break;
                case TableNames.Sys_Menu:
                    SysMenu.MenuTable = null;
                    break;

            }
        }
    }
    /// <summary>
    /// SysHandler 的摘要说明
    /// </summary>
    public partial class SysHandler : AjaxBase
    {
        SysLogic sysLogic;
        public SysHandler()
        {
            sysLogic = new SysLogic(this);
        }
        /// <summary>
        /// 获取树菜单
        /// luoshushi
        /// </summary>
        public void GetMenu()
        {
            jsonResult = sysLogic.GetMenuJson();
        }

        /// <summary>
        /// 获取权限
        /// luoshushi
        /// </summary>
        public void GetActions()
        {
            jsonResult = sysLogic.GetActions();
        }
        /// <summary>
        /// 获取菜单详细数据
        /// luoshushi
        /// </summary>
        public void GetMenuDetails()
        {
            jsonResult = sysLogic.GetMenuDetails();
        }

        /// <summary>
        /// 删除菜单
        /// {id:menuid}
        /// luoshushi
        /// </summary>
        public void DeleteMenu()
        {
            jsonResult = sysLogic.DeleteMenu();
        }

        /// <summary>
        /// 验证菜单是否有子菜单
        /// luoshushi
        /// </summary>
        public void ValidMenuHasChlid()
        {
            jsonResult = sysLogic.ValidMenuHasChlid();
        }
        /// <summary>
        /// 获取系统图标
        /// </summary>
        public void GetIconsPath()
        {
            jsonResult = sysLogic.GetIconsPath("/JS/Images/IconMenu");
        }
        public void GetMenuAndAction()
        {
            jsonResult = sysLogic.GetMenuAndAction();
        }


        public void GetMenuIDsandActionIds()
        {
            jsonResult = sysLogic.GetMenuIDsandActionIds();
        }


        public void AddPromission()
        {
            jsonResult = sysLogic.AddPromission();
        }

        /// <summary>
        /// 匹配其他数据表
        /// </summary>
        /// <param name="item"></param>
        /// <param name="ConfigName">配置名</param>
        /// <param name="fildName">数据表的对应字的段名</param>
        /// <param name="valueCoulmn">数据表对应的值的字段名</param>
        /// <param name="TableName">数据表名称</param>
        /// <returns></returns>
        private string SetCoulmn(MDataRow item, string ConfigName, string fildName, string valueCoulmn, string TableName)
        {
            string result = string.Empty;
            string resultValue = string.Empty;
            try
            {
                using (MAction action = new MAction(TableName))
                {
                    if (item[ConfigName] == null)
                    {
                        return string.Empty;
                    }
                    string value = item[ConfigName].ToString();//89,90
                    string[] str = value.Split(',');
                    string val = string.Empty;
                    foreach (var key in str)
                    {

                        if (action.Fill(fildName + "='" + key + "'"))
                        {
                            resultValue = action.Data.Get<string>(valueCoulmn);
                        }
                        if (!string.IsNullOrWhiteSpace(resultValue))
                        {
                            val += resultValue + ",";
                            //item[key].Value = resultValue;
                        }
                        else
                        {
                            result = string.Format("【{0}】{1}无法匹配表{2},", key, value, TableName);
                        }
                    }
                    if (!string.IsNullOrWhiteSpace(val))
                    {
                        val = val.TrimEnd(',');
                        item[ConfigName].Value = val;
                    }

                }
            }
            catch (Exception ex)
            {
                result = result = ex.ToString();
            }
            return result;
        }


    }
}