using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using Aries.Core;
using Aries.Logic;

namespace Aries.Handler
{
    /// <summary>
    /// 重写事件
    /// </summary>
    public partial class SysAdminHandler : AjaxBase
    {
        public override void Get()
        {
            switch (TableName)
            {
                case "Sys_User":
                    ObjName = "V_SYS_UserList";
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
            switch (TableName)
            {
                case "Sys_User":
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
            switch (TableName)
            {
                case "Sys_User":
                    jsonResult = sysLogic.UpdateUser();
                    break;
                default:
                    base.Update();
                    break;
            }
        }

        public override void Delete()
        {
            switch (TableName)
            {
                case "Sys_User":
                    jsonResult = sysLogic.DeleteUser();
                    break;
                default:
                    base.Delete();
                    break;
            }
        }

        protected override MDataTable Select(GridConfig.SelectType st)
        {
            MDataTable dt = base.Select(st);
            if (ObjName == "Config_ExcelInfo")
            {
                if (dt == null || dt.Rows.Count == 0)
                {
                    InitExcelColumn();
                    //从Excel读取列写入
                    dt = base.Select(st);
                }
            }
            return dt;
        }

        protected override void EndInvoke()
        {
            switch (ObjName)
            {
                case "Config_KeyValue":
                    KeyValueConfig.KeyValueTable = null;
                    break;
                case "Sys_Menu":
                    SysMenu.MenuTable = null;
                    break;

            }
        }
    }
    /// <summary>
    /// SysHandler 的摘要说明
    /// </summary>
    public partial class SysAdminHandler
    {
        SysLogic sysLogic;
        public SysAdminHandler()
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

        public void MappingExelInfo()
        {
            jsonResult = sysLogic.GetExcelMapping();
        }



        private void InitExcelColumn()
        {
            string excelID = Query<string>("ExcelID");
            MDataRow row = ExcelConfig.GetExcelRow(excelID);
            if (row != null)
            {
                string EnName = row.Get<string>(Config_Excel.EnName);
                string path = context.Server.MapPath("~/Resource/Excel/" + EnName + ".xls");
                bool isExists = File.Exists(path);
                if (!isExists)
                {
                    path = context.Server.MapPath("~/Resource/Excel/" + EnName + ".xlsx");
                    isExists = File.Exists(path);
                }
                if (isExists)
                {
                    MDataTable table;
                    using (FileStream stream = File.OpenRead(path))
                    {
                        table = ExcelHelper.ReadExcel(true, stream, row.Get<int>("StartIndex"), row.Get<int>("HeadCrossRowNum"));
                    }
                    if (table != null && table.Columns.Count > 0)
                    {
                        string tableNames = row.Get<string>(Config_Excel.TableNames, string.Empty);
                        Dictionary<MCellStruct, string> msList = new Dictionary<MCellStruct, string>();
                        foreach (string tableName in tableNames.Split(','))
                        {
                            MDataColumn mdc = DBTool.GetColumns(tableName);
                            #region MyRegion
                            using (MAction action = new MAction(TableNames.Config_Grid))
                            {
                                for (int i = 0; i < mdc.Count; i++)
                                {
                                    MCellStruct ms = mdc[i];
                                    bool result = action.Fill(string.Format("Field='{0}' And TableName='{1}' order by Formatter desc", ms.ColumnName, EnName));
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
                        using (MAction action = new MAction(TableNames.Config_ExcelInfo))
                        {
                            action.AllowInsertID = true;
                            action.BeginTransation();
                            foreach (MCellStruct st in table.Columns)
                            {
                                action.Data.Clear();
                                action.Set(Config_ExcelInfo.ExceInfoID, Guid.NewGuid());
                                action.Set(Config_ExcelInfo.ExcelID, excelID);
                                action.Set(Config_ExcelInfo.ExcelName, st.ColumnName);
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
