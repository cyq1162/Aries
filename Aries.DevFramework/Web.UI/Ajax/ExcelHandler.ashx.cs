using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Web.Core;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using Web.Utility;


namespace Web.UI.Ajax
{
    /// <summary>
    /// ExcelHandler 的摘要说明
    /// </summary>
    public class ExcelHandler : AjaxBase
    {

        #region Excel导入功能模块。
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
       
        public void InitExcelColumn()
        {
            string excelID = Query<string>("ExcelID");
            MDataRow row = ExcelConfig.GetExcelRow(excelID);
            if (row != null)
            {
                string EnName = row.Get<string>(Config_Excel.EnName);
                string path = HttpContext.Current.Server.MapPath("~/Resource/Excel/" + EnName + ".xls");
                if (File.Exists(path))
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
                            using (MAction action = new MAction(TableNames.Config_Grid))
                            {
                                for (int i = 0; i < mdc.Count; i++)
                                {
                                    MCellStruct ms = mdc[i];
                                    bool result = action.Fill(string.Format("Field='{0}' And TableName='{1}' order by Formatter desc", ms.ColumnName, EnName));//刘盼:需加TableName过滤
                                    if (string.IsNullOrEmpty(ms.Description))
                                    {
                                        if (result)
                                        {
                                            ms.Description = action.Get<string>(Config_Grid.Title);
                                        }
                                        else if (GridConfig.FieldTitle.ContainsKey(ms.ColumnName))
                                        {
                                            ms.Description = GridConfig.FieldTitle[ms.ColumnName];
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
                        }
                        using (MAction action = new MAction(TableNames.Config_ExcelInfo))
                        {
                            action.AllowInsertID = true;
                            action.BeginTransation();
                            foreach (MCellStruct st in table.Columns)
                            {
                                action.Set(Config_ExcelInfo.ExceInfoID, Guid.NewGuid());
                                action.Set(Config_ExcelInfo.ExcelID, excelID);
                                action.Set(Config_ExcelInfo.ExcelName, st.ColumnName);
                                string name = st.ColumnName.Split('_')[0];
                                MCellStruct key = null;
                                foreach (var ms in msList)
                                {
                                    if (!string.IsNullOrEmpty(ms.Key.Description))
                                    {
                                        if (ms.Key.Description.Trim().Equals(name.Trim(), StringComparison.OrdinalIgnoreCase))//刘盼：避免相似描述的字段列名弄错
                                        //if (ms.Key.Description.IndexOf(name, StringComparison.OrdinalIgnoreCase) > -1)
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
                                    msList.Remove(key);//刘盼：Config_Grid存在Title值相同的数据，添加完须立即删除
                                }
                                if (!action.Insert(InsertOp.None))
                                {
                                    Log.WriteLogToTxt(action.DebugInfo);
                                    break;
                                }
                                else
                                {
                                    action.Set(Config_ExcelInfo.TableName, DBNull.Value);
                                    action.Set(Config_ExcelInfo.Field, DBNull.Value);
                                    action.Set(Config_ExcelInfo.Formatter, DBNull.Value);
                                }

                            }
                            action.EndTransation();
                        }
                    }
                }
            }




        }
        #endregion
    }
}