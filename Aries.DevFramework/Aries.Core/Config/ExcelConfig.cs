using System;
using System.Collections.Generic;
using System.Reflection;
using System.Text;
using CYQ.Data;
using CYQ.Data.SQL;
using CYQ.Data.Table;
using Aries.Core.DB;
using Aries.Core.Sql;
using CYQ.Data.Aop;
using CYQ.Data.Tool;

namespace Aries.Core.Config
{
    /// <summary>
    /// Excel配置组件核心类
    /// </summary>
    public partial class ExcelConfig
    {
        /// <summary>
        /// 获取表配置信息
        /// </summary>
        public static MDataRow GetExcelRow(string idOrExcelName)
        {
            using (MAction action = new MAction(TableNames.Config_Excel))
            {
                bool isID = idOrExcelName.Length >= 36 && idOrExcelName.Split('-').Length >= 3;
                string where = (isID ? Config_Excel.ExcelID : Config_Excel.ExcelName).ToString() + "='{0}'";
                if (action.Fill(string.Format(where, idOrExcelName)))
                {
                    return action.Data;
                }
            }
            return null;
        }
        /// <summary>
        /// 获取具体列配置信息。
        /// </summary>
        /// <param name="excelID"></param>
        /// <returns></returns>
        public static MDataTable GetExcelInfo(string excelID)
        {
            using (MAction action = new MAction(TableNames.Config_ExcelInfo))
            {
                return action.Select(Config_Excel.ExcelID + "='" + excelID + "'");
            }
        }

        /// <summary>
        /// 导入时：把中文列头翻译成英文列头（同时处理列头结构）。
        /// 并返回字典：key:列头,value:格式化名
        /// </summary>
        public static Dictionary<string, string> FormatterTitle(MDataTable dt, MDataRow info, string objName)
        {

            if (info == null)
            {
                return GridConfig.SetHeaderField(dt, objName);
            }
            else
            {
                Dictionary<string, string> formatDic = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
                MDataTable infoConfig = GetExcelInfo(info.Get<string>(0));
                if (infoConfig != null)
                {
                    //附加自定义列。
                    foreach (var configRow in infoConfig.Rows)
                    {
                        string formatter = configRow.Get<string>(Config_ExcelInfo.Formatter);
                        if (!string.IsNullOrEmpty(formatter) && formatter[0] != '#')//增加默认值的列。
                        {
                            string excelName = configRow.Get<string>(Config_ExcelInfo.ExcelName);
                            if (!dt.Columns.Contains(excelName))
                            {
                                MCellStruct ms = new MCellStruct(excelName, System.Data.SqlDbType.NVarChar);
                                ms.TableName = configRow.Get<string>(Config_ExcelInfo.TableName);
                                dt.Columns.Insert(dt.Columns.Count - 1, ms);
                            }
                        }
                    }
                    MDataRow infoRow;
                    foreach (MCellStruct item in dt.Columns)
                    {
                        infoRow = infoConfig.FindRow(Config_ExcelInfo.ExcelName + "='" + item.ColumnName + "'");
                        if (infoRow == null && item.ColumnName.IndexOf('_') > 0) // 兼容只找一级的映射列。
                        {
                            string columnName = item.ColumnName.Split('_')[0];
                            infoRow = infoConfig.FindRow(Config_ExcelInfo.ExcelName + "='" + columnName + "'");
                        }
                        if (infoRow != null)
                        {
                            string field = infoRow.Get<string>(Config_ExcelInfo.Field);
                            if (string.IsNullOrEmpty(field))
                            {
                                continue;
                            }
                            item.Description = item.ColumnName;//把中文列名放到描述里。
                            item.TableName = infoRow.Get<string>(Config_ExcelInfo.TableName);
                            if (string.Compare(item.ColumnName, field, StringComparison.OrdinalIgnoreCase) != 0)
                            {
                                int index = dt.Columns.GetIndex(field);
                                if (index < 0)
                                {
                                    item.ColumnName = field;//
                                }
                                else // 字段同名
                                {
                                    item.ColumnName = item.TableName + "." + field;
                                    //修改上一个，也增加表名。
                                    dt.Columns[index].ColumnName = dt.Columns[index].TableName + "." + dt.Columns[index].ColumnName;
                                }
                            }
                            string formatter = infoRow.Get<string>(Config_ExcelInfo.Formatter);
                            if (!string.IsNullOrEmpty(formatter)) // 需要格式化的项
                            {
                                if (formatter.Length > 2 && formatter[0] == '#')
                                {
                                    //item.SqlType = System.Data.SqlDbType.NVarChar;//重置数据类型(int数据将格式成文本）
                                    formatDic.Add(item.ColumnName, formatter.Substring(1).Split(new string[] { "=>" }, StringSplitOptions.None)[0]);
                                }
                                else
                                {
                                    item.DefaultValue = SqlCode.FormatPara(formatter);//如果不是#开头的，设置为默认值（同时处理@参数）。
                                }
                            }
                        }
                    }
                }
                return formatDic;
            }
        }
        /// <summary>
        /// 验证基础数据(数据类型、长度、是否为Null）
        /// </summary>
        /// <returns></returns>
        public static bool ValidateData(MDataTable dt, MDataRow info)
        {
            bool result = true;
            string[] tables = null;
            List<string> requiredList = new List<string>();//必填项表。
            if (info != null)
            {
                tables = info.Get<string>(Config_Excel.TableNames, string.Empty).Split(',');
                MDataTable dtRequired = GetExcelInfo(info.Get<string>(0));//必填项表。
                if (dtRequired != null && dtRequired.Rows.Count > 0)
                {
                    dtRequired = dtRequired.Select(Config_ExcelInfo.IsRequired + "=1");
                    if (dtRequired != null && dtRequired.Rows.Count > 0)
                    {
                        foreach (var row in dtRequired.Rows)
                        {
                            requiredList.Add(row.Get<string>(Config_ExcelInfo.TableName) + row.Get<string>(Config_ExcelInfo.Field));
                        }
                    }
                }
            }
            else
            {
                tables = dt.TableName.Split(',');
            }
            bool isOK = false;
            foreach (var table in tables)//重置列头。
            {
                MDataColumn mdc = DBTool.GetColumns(table);
                foreach (var cs in dt.Columns)
                {
                    string[] items = cs.ColumnName.Split('.');
                    if (cs.TableName == table)
                    {
                        int index = mdc.GetIndex(items[items.Length - 1]);
                        if (index > -1)
                        {
                            isOK = true;//至少需要一个列对应上，若没有，则模板错误
                            cs.SqlType = mdc[index].SqlType;
                            cs.IsCanNull = mdc[index].IsCanNull;
                            if (requiredList.Contains(table + mdc[index].ColumnName))//要求必填
                            {
                                cs.IsCanNull = false;
                            }
                            cs.MaxSize = mdc[index].MaxSize;
                        }
                    }
                }
            }
            if (!isOK) { return false; }
            foreach (var row in dt.Rows)
            {
                StringBuilder sb = new StringBuilder();
                foreach (var cell in row)
                {
                    if (!string.IsNullOrEmpty(cell.Struct.TableName))
                    {
                        string columnName = string.IsNullOrEmpty(cell.Struct.Description) ? cell.Struct.ColumnName : cell.Struct.Description;
                        if (!cell.Struct.IsCanNull && cell.IsNullOrEmpty)
                        {
                            sb.AppendFormat("[{0}]{1}", columnName, LangConst.CantBeEmpty);
                            cell.State = -1;
                        }
                        else if (cell.Struct.MaxSize != -1 && cell.ToString().Length > cell.Struct.MaxSize && cell.Struct.SqlType != System.Data.SqlDbType.Bit)
                        {
                            sb.AppendFormat("[{0}]{1}{2}。", columnName, LangConst.SizeOver, cell.Struct.MaxSize);
                            cell.State = -1;
                        }
                        else if (!cell.FixValue())
                        {
                            sb.AppendFormat("[{0}]{1}。", columnName, LangConst.DataTypeError);
                            cell.State = -1;
                        }
                    }
                }
                if (sb.Length > 0)
                {
                    result = false;
                    row.Set(LangConst.ErrorInfo, row.Get<string>(LangConst.ErrorInfo) + sb.ToString());
                }

            }
            return result;
        }
        /// <summary>
        /// 批量更新或插入。
        /// </summary>
        /// <param name="dt"></param>
        /// <param name="excelRow"></param>
        /// <returns></returns>
        public static bool AcceptChanges(MDataTable dt, MDataRow excelRow, string objName = null)
        {
            if (excelRow == null)
            {
                MDataTable dtImportUnique = GridConfig.GetList(objName, GridConfig.SelectType.ImportUnique);
                string[] names = null;
                if (dtImportUnique != null && dtImportUnique.Rows.Count > 0)
                {
                    names = new String[dtImportUnique.Rows.Count];
                    for (int i = 0; i < dtImportUnique.Rows.Count; i++)
                    {
                        names[i] = dtImportUnique.Rows[i].Get<string>(Config_Grid.Field);
                    }
                }
                return dt.AcceptChanges(AcceptOp.Auto, null, names);
            }
            bool result = true;
            //获取相关配置
            string[] tables = excelRow.Get<string>(Config_Excel.TableNames).Split(',');
            MDataTable configTable = GetExcelInfo(excelRow.Get<string>(Config_Excel.ExcelID));

            Dictionary<string, string> rowPrimaryValue = new Dictionary<string, string>();//存档每个表每行的主键值。
            Dictionary<string, string> wherePrimaryValue = new Dictionary<string, string>();//存档where条件对应的主键值。
            int acceptType = excelRow.Get<int>(Config_Excel.AcceptType);
            using (MAction action = new MAction(tables[0]))
            {
                action.SetAopState(AopOp.CloseAll);
                action.BeginTransation();
                AppConfig.Debug.OpenDebugInfo = false;
                IExcelConfig excelConfigExtend = ExcelConfigFactory.GetExcelConfigExtend();
                foreach (var table in tables)
                {
                    GC.Collect();//后面的Fill查询代码循环上万次会增长太多内存，提前调用，能降低内存。
                    action.ResetTable(table);
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        action.Data.Clear();
                        var row = dt.Rows[i];
                        foreach (var cell in row)//遍历所有数据行
                        {
                            if (cell.Struct.TableName != null && cell.Struct.TableName.ToLower() == table.ToLower())//过滤出属于本表的字段。
                            {
                                string[] items = cell.ColumnName.Split('.');
                                string columnName = items[items.Length - 1];
                                action.Set(columnName, cell.Value);
                            }
                        }


                        #region 检测是否需要插入外键。
                        MDataTable foreignTable = configTable.FindAll("TableName='" + table + "' and IsForeignkey=1");
                        if (foreignTable != null)
                        {
                            foreach (var foreignRow in foreignTable.Rows)
                            {
                                string formatter = foreignRow.Get<string>("Formatter");
                                string fTableName = foreignRow.Get<string>("ForeignTable");
                                if (string.IsNullOrEmpty(formatter))
                                {
                                    //获取主键外值键
                                    string key = fTableName + i;
                                    if (rowPrimaryValue.ContainsKey(key))
                                    {
                                        string value = rowPrimaryValue[key];
                                        action.Set(foreignRow.Get<string>("Field"), value);
                                    }
                                }
                                else // 从其它自定义列取值。
                                {
                                    MDataCell cell = row[formatter];
                                    cell = cell ?? row[fTableName + "." + formatter];
                                    if (cell != null)
                                    {
                                        action.Set(foreignRow.Get<string>("Field"), cell.Value);
                                    }
                                }
                            }
                            foreignTable = null;
                        }
                        #endregion


                        #region //获取唯一联合主键,检测是否重复

                        string where = string.Empty;
                        List<MDataRow> rowList = configTable.FindAll("TableName='" + table + "' and IsUnique=1");
                        if (rowList != null && rowList.Count > 0)
                        {
                            bool isUniqueOr = excelRow.Get<bool>(Config_Excel.WhereType);
                            List<MDataCell> cells = new List<MDataCell>();
                            StringBuilder errText = new StringBuilder();
                            int errorCount = 0;
                            foreach (var item in rowList)
                            {
                                var cell = action.Data[item.Get<string>(Config_ExcelInfo.Field)];
                                if (cell != null)
                                {
                                    if (cell.IsNullOrEmpty) // 唯一主键是必填写字段
                                    {
                                        errorCount++;
                                        errText.Append("[" + LangConst.The + "" + (i + 1) + LangConst.Row + "]：" + cell.Struct.ColumnName + "[" + cell.Struct.Description + "]" + LangConst.CantBeEmpty + "！\r\n");
                                    }
                                    else
                                    {
                                        cells.Add(cell);
                                    }
                                }
                            }
                            if (errorCount > 0)
                            {
                                if (!isUniqueOr || errorCount == rowList.Count)
                                {
                                    result = false;
                                    dt.DynamicData = new Exception(errText.ToString());
                                    goto err;
                                }
                            }

                            MDataCell[] item2s = cells.ToArray();
                            where = action.GetWhere(!isUniqueOr, item2s);
                            item2s = null;
                            rowList = null;
                        }
                        if (!string.IsNullOrEmpty(where))
                        {
                            MDataRow data = action.Data.Clone();
                            action.SetSelectColumns(action.Data.PrimaryCell.ColumnName);
                            if (action.Fill(where))//根据条件查出主键ID (数据被清空)
                            {
                                string key = table + where;
                                if (wherePrimaryValue.ContainsKey(key))
                                {
                                    rowPrimaryValue.Add(table + i, wherePrimaryValue[key]);//记录上一个主键值。
                                }
                                else
                                {
                                    rowPrimaryValue.Add(table + i, action.Get<string>(action.Data.PrimaryCell.ColumnName));//记录上一个主键值。
                                }
                                action.Data.LoadFrom(data, RowOp.IgnoreNull, false);//还原数据。
                                if (action.Data.GetState() == 2 && acceptType != 1)//排除掉仅插入选项
                                {
                                    ExcelResult eResult = excelConfigExtend.BeforeUpdate(action.Data, row);
                                    if (eResult == ExcelResult.Ignore || (eResult == ExcelResult.Default && action.Update(where)))
                                    {
                                        continue;//已经存在了，更新，准备下一条。
                                    }
                                    else
                                    {
                                        result = false;
                                        dt.DynamicData = new Exception("[" + LangConst.The + (i + 1) + LangConst.Row + "]：" + action.DebugInfo);
                                        goto err;
                                    }
                                }
                                else
                                {
                                    continue;//已经存在了，同时没有可更新字段
                                }
                            }
                            else if (action.RecordsAffected == -2)//产生错误信息，发生异常
                            {
                                result = false;
                                dt.DynamicData = new Exception("[" + LangConst.The + (i + 1) + LangConst.Row + "]：" + action.DebugInfo);
                                goto err;
                            }
                        }
                        #endregion

                        if (action.Data.GetState() == 0 || acceptType == 2)//仅更新则跳过插入
                        {
                            continue;//没有可映射插入的列。
                        }

                        //插入前，调用函数（插入特殊主键等值）
                        string errMsg;
                        ExcelResult excelResult = excelConfigExtend.BeforeInsert(action.Data, row, out errMsg);
                        if (excelResult == ExcelResult.Ignore)
                        {
                            continue;
                        }

                        if (excelResult == ExcelResult.Error || !action.Insert(InsertOp.ID))
                        {
                            result = false;
                            action.RollBack();
                            if (string.IsNullOrEmpty(errMsg))
                            {
                                errMsg = "[" + LangConst.The + (i + 1) + LangConst.Row + "]：" + action.DebugInfo;
                            }
                            dt.DynamicData = new Exception(errMsg);
                            excelConfigExtend.OnInsertError(errMsg, dt);
                            goto err;
                        }
                        //插入后事件（可以触发其它事件）
                        excelConfigExtend.AfterInsert(action.Data, row, i == dt.Rows.Count - 1);
                        string primaryKey = action.Get<string>(action.Data.PrimaryCell.ColumnName);
                        rowPrimaryValue.Add(table + i, primaryKey);//记录上一个主键值。
                        if (!wherePrimaryValue.ContainsKey(table + where))
                        {
                            wherePrimaryValue.Add(table + where, primaryKey);
                        }

                    }
                }
            err:
                action.EndTransation();
                excelConfigExtend.Dispose();
            }
            return result;

        }

    }
}
