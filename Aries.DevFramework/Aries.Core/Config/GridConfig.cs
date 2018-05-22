using System;
using System.Collections.Generic;
using System.Text;
using CYQ.Data;
using CYQ.Data.Cache;
using CYQ.Data.SQL;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using Aries.Core.Extend;
using Aries.Core.DB;

namespace Aries.Core.Config
{
    /// <summary>
    /// 表格头配置专用类（By CYQ）操作：Config_Grid 表
    /// </summary>
    public static class GridConfig
    {
        public enum SelectType
        {
            /// <summary>
            /// 所有
            /// </summary>
            All,
            /// <summary>
            /// 非隐藏字段
            /// </summary>
            Show,
            /// <summary>
            /// 导出字段
            /// </summary>
            Export,
            /// <summary>
            /// 导入字段
            /// </summary>
            Import,
            /// <summary>
            /// 导入唯一
            /// </summary>
            ImportUnique
        }
        public const string field = @"select distinct s1.name,s4.value from syscolumns s1 left join  sys.extended_properties  s4 on s4.major_id=s1.id and s4.minor_id=s1.colid where s4.value is not null and len(s1.name)>0";

        private static Dictionary<string, string> _FieldTitle = new Dictionary<string, string>();
        /// <summary>
        /// 获取默认的翻译配置
        /// </summary>
        public static Dictionary<string, string> FieldTitle
        {
            get
            {
                if (_FieldTitle.Count == 0)
                {
                    if (AppConfig.DB.DefaultDalType == DalType.MsSql)
                    {
                        MDataTable dt;
                        using (MProc proc = new MProc(field))
                        {
                            dt = proc.ExeMDataTable();
                        }
                        foreach (MDataRow row in dt.Rows)
                        {
                            string name = row.Get<string>(0);
                            string value = row.Get<string>(1);
                            if (value.Length > 1 && !_FieldTitle.ContainsKey(name))
                            {
                                _FieldTitle.Add(name, value.Split(new char[] { ' ', ',', '(' })[0]);
                            }
                        }
                    }
                }
                return _FieldTitle;
            }
        }
        public static Dictionary<string, string> GetTitleField(string tableName)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>();
            MDataColumn mdc = DBTool.GetColumns(CrossDb.GetEnum(tableName));
            if (mdc.Count > 0)
            {
                foreach (MCellStruct item in mdc)
                {
                    string des = Convert.ToString(item.Description);
                    if (!string.IsNullOrEmpty(des))
                    {
                        des = des.Split(new char[] { ' ', ',', '(' })[0];
                        if (!dic.ContainsKey(des))
                        {
                            dic.Add(des, item.ColumnName);
                        }
                    }
                }
            }
            return dic;
        }
        public static string[] GetSelectColumns(string objName, SelectType st)
        {

            return GetList(objName, st).GetColumnItems<string>("Field").ToArray();
        }

        /// <summary>
        /// 读取列表
        /// </summary>
        public static MDataTable GetList(string objName, SelectType st)
        {
            string where = "";
            switch (st)
            {
                case SelectType.Show:
                    where = "Hidden=0 or Formatter='#'";
                    break;
                case SelectType.Export:
                    where = "Export=1";
                    break;
                case SelectType.Import:
                    where = "Import=1";
                    break;
                case SelectType.ImportUnique:
                    where = "ImportUnique=1";
                    break;
            }
            MDataTable dt;
            using (MAction action = new MAction(U_AriesEnum.Config_Grid))
            {
                dt = action.Select(string.Format("ObjName='{0}' order by frozen desc,OrderNum asc", objName));
            }
            MDataTable dt2 = dt.FindAll(where);
            return dt2 != null ? dt2 : dt.GetSchema(false);//自动缓存只存档一份，同时兼容文本数据库
        }
        private static void FillTable(string objName, string objCode, MDataTable dt)
        {
            Dictionary<string, string> fieldTitleDic = GridConfig.FieldTitle;
            MDataColumn mdc = DBTool.GetColumns(CrossDb.GetEnum(objCode));
            MCellStruct cell = null;
            int jointPrimaryCount = mdc.JointPrimary.Count;
            for (int i = 0; i < mdc.Count; i++)
            {
                cell = mdc[i];
                MDataRow row = dt.NewRow();
                row.Set(Config_Grid.ObjName, objName);
                row.Set(Config_Grid.Field, cell.ColumnName);
                row.Set(Config_Grid.Title, fieldTitleDic.ContainsKey(cell.ColumnName) ? fieldTitleDic[cell.ColumnName] : cell.ColumnName);
                row.Set(Config_Grid.Hidden, i == 0 && jointPrimaryCount < 2);
                row.Set(Config_Grid.OrderNum, (i + 1) * 10);
                row.Set(Config_Grid.Width, 100);
                row.Set(Config_Grid.Sortable, i > 0);
                row.Set(Config_Grid.Import, i > 0);
                row.Set(Config_Grid.Export, i > 0);
                row.Set(Config_Grid.Colspan, 1);
                row.Set(Config_Grid.Rowspan, 1);
                row.Set(Config_Grid.Edit, i > 0 || jointPrimaryCount > 1);
                row.Set(Config_Grid.Frozen, i < 4);
                row.Set(Config_Grid.Align, "center");
                string value = DataType.GetType(cell.SqlType).Name.ToLower() + "," + cell.MaxSize + "," + cell.Scale + (cell.IsCanNull ? ",0" : ",1") + (cell.IsPrimaryKey ? ",1" : ",0");
                row.Set(Config_Grid.DataType, value);
                if (i == 0)
                {
                    if (jointPrimaryCount < 2)
                    {
                        row.Set(Config_Grid.Formatter, "#");
                    }
                }
                else
                {
                    switch (DataType.GetGroup(cell.SqlType))
                    {
                        case 2:
                            row.Set(Config_Grid.Formatter, "dateFormatter");
                            break;
                        case 3:
                            row.Set(Config_Grid.Formatter, "boolFormatter");
                            break;
                        default:
                            if (cell.MaxSize > 50)
                            {
                                row.Set(Config_Grid.Formatter, "stringFormatter");
                            }
                            break;
                    }
                }
                dt.Rows.Add(row);
            }
        }
        private static readonly object obj = new object();
        /// <summary>
        /// 创建数据结构行
        /// </summary>
        public static MDataTable Create(string objName, string objCode, MDataTable schema)
        {
            bool result = false;
            lock (obj)
            {
                FillTable(objName, objCode, schema);
                result = schema.AcceptChanges(AcceptOp.Auto, null, Config_Grid.ObjName, Config_Grid.Field);
            }
            if (result)
            {
                return GetList(objName, SelectType.All);
            }
            return schema;
        }
        /// <summary>
        /// 数据结构行刷新
        /// </summary>
        /// <param name="objName"></param>
        /// <param name="objCode"></param>
        /// <param name="dt">原有数据</param>
        /// <returns></returns>
        public static bool Flesh(string objName, string objCode, MDataTable dt,out string msg)
        {

            bool result = false;
            msg = LangConst.NoNewColumn ;
            MDataTable newDt = dt.GetSchema(false);
            //移除表结构缓存
            string tableKey = CacheManage.GetKey(CacheKeyType.Schema, objName, CrossDb.GetDBName(objName),CrossDb.GetDalType(objName));
            CacheManage.LocalInstance.Remove(tableKey);
            FillTable(objName, objCode, newDt);//重新获取。

            MDataTable addTable = dt.GetSchema(false);
           // bool needUpdate = false;
            foreach (MDataRow row in newDt.Rows)
            {
                MDataRow mr = dt.FindRow(string.Format("Field='{0}'", row.Get<string>("Field")));
                if (mr == null)//找不到，则添加行
                {
                    row.Set(Config_Grid.OrderNum, 255);
                    row.Set(Config_Grid.Hidden, true);
                    row.Set(Config_Grid.GridID, Guid.NewGuid());
                    addTable.Rows.Add(row);
                }
            }

            if (addTable.Rows.Count > 0)
            {
                result = addTable.AcceptChanges(AcceptOp.InsertWithID);
                if (!result)
                {
                    msg=Convert.ToString((Exception)addTable.DynamicData);
                }
            }

            return result;
        }
        /// <summary>
        /// 返回格式化并设置以下内容：
        /// 1：设置字段Description描述；2：设置翻译字段的数据类型。
        /// key:ColumnName value:Formatter
        /// </summary>
        /// <param name="dt">表数据（dt.DynamicData 存档列头数据）</param>
        /// <returns></returns>
        public static Dictionary<string, string> GetFormatter(MDataTable dt)
        {
            Dictionary<string, string> dic = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
            MDataTable config = dt.DynamicData as MDataTable;
            if (config != null)
            {
                MDataRow row;
                string formatter;
                foreach (MCellStruct item in dt.Columns)
                {
                    row = config.FindRow(Config_Grid.Field + "='" + item.ColumnName + "'");
                    if (row != null)
                    {
                        item.Description = row.Get<string>(Config_Grid.Title);
                        formatter = row.Get<string>(Config_Grid.Formatter);
                        if (formatter == "boolFormatter")
                        {
                            formatter = "#" + LangConst.IsYesNo;//对bool型特殊处理。
                        }
                        if (!string.IsNullOrEmpty(formatter) && formatter.Length > 2 && formatter[0] == '#') // 需要格式化的项
                        {
                            item.SqlType = System.Data.SqlDbType.NVarChar;//重置数据类型(int数据将格式成文本）
                            dic.Add(item.ColumnName, formatter.Substring(1));
                        }
                    }
                }
            }
            return dic;
        }

        /// <summary>
        /// 还原中文列头为字段名，并返回需要格式化的字段名(同时设置字段类型为NVarChar)和配置项（导入时调用到）
        /// </summary>
        /// <param name="dt"></param>
        public static Dictionary<string, string> SetHeaderField(MDataTable dt, string objName)
        {
            Dictionary<string, string> formatDic = new Dictionary<string, string>();
            Dictionary<string, string> dic = GetTitleField(dt.TableName);
            MDataTable gridConfig = GetList(objName, SelectType.All);
            MDataRow gridRow;
            foreach (MCellStruct item in dt.Columns)
            {
                item.TableName = dt.TableName;
                gridRow = gridConfig.FindRow(Config_Grid.Title + "='" + item.ColumnName + "'");
                if (gridRow != null)
                {
                    item.Description = item.ColumnName;
                    item.ColumnName = gridRow.Get<string>(Config_Grid.Field);
                    string formatter = gridRow.Get<string>(Config_Grid.Formatter);
                    if (formatter == "boolFormatter")
                    {
                        formatter = "#" + LangConst.IsYesNo;//对bool型特殊处理。
                    }
                    if (!string.IsNullOrEmpty(formatter) && formatter.Length > 2 && formatter[0] == '#') // 需要格式化的项
                    {
                        //item.SqlType = System.Data.SqlDbType.NVarChar;//重置数据类型(int数据将格式成文本）
                        formatDic.Add(item.ColumnName, formatter.Substring(1).Split(new string[] { "=>" }, StringSplitOptions.None)[0]);
                    }
                }
                else
                {

                    if (dic.ContainsKey(item.ColumnName))
                    {
                        item.Description = item.ColumnName;
                        item.ColumnName = dic[item.ColumnName];
                    }
                }
            }
            dic = null;
            return formatDic;
        }

    }
}
