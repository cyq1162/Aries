using System;
using System.Reflection;
using System.Collections.Generic;
using System.Web;
using CYQ.Data;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System.Text;
using System.IO;
using System.Web.SessionState;
using Aries.Core.Auth;
using Aries.Core.Config;
using Aries.Core.Helper;
using Aries.Core.Sql;
using Aries.Core.Extend;
using Aries.Core.DB;


namespace Aries.Core
{

    public abstract partial class Controller : IHttpHandler, IRequiresSessionState, IBase
    {
        /// <summary>
        /// 用于错误Excel的下载输出。
        /// </summary>
        private static Dictionary<string, MemoryStream> streamList = new Dictionary<string, MemoryStream>();
        /// <summary>
        /// 保存表单要修改的键值对。
        /// </summary>
        private Dictionary<string, string> keyValue = new Dictionary<string, string>();
        /// <summary>
        /// 最终被输出的Json结果
        /// </summary>
        protected string jsonResult = JsonHelper.OutResult(false, "Uninitialized");
        protected Permission p;
        protected HttpContext context;
        protected string functionName;
        public void ProcessRequest(HttpContext context)
        {
            this.context = context;
            try
            {
                if (string.IsNullOrEmpty(context.Response.Charset))
                {
                    context.Response.Charset = "utf-8";
                }
                context.Response.ContentType = "application/json";

                functionName = Query<string>("sys_method", "").Trim(' ', ',');
                string[] items = functionName.Split(',');
                JsonHelper js = null;
                if (items.Length > 1)
                {
                    js = new JsonHelper(false, false);
                }
                foreach (string item in items)
                {
                    string lowerItem = item.ToLower();
                    bool isAllow = !WebHelper.IsCheckToken() || UserAuth.IsExistsToken(false);
                    if (isAllow)
                    {
                        if (p == null)
                        {
                            p = new Permission(UserAuth.UserName, false);
                        }
                        MethodInvoke(item);
                        if (items.Length > 1)
                        {
                            js.Add(item, jsonResult);
                        }
                        else
                        {
                            Write(jsonResult);
                        }
                    }
                    else
                    {
                        WriteError(AppConfig.GetApp("UI") + "/login.html");
                        return;
                    }
                }
                if (items.Length > 1)
                {
                    Write(js.ToString());
                }
            }
            catch (Exception err)
            {
                WriteError(err.Message);
            }

            context.Response.End();
        }
        /// <summary>
        /// 执行其他业务
        /// </summary>
        public void MethodInvoke(string functionName)
        {
            if (string.IsNullOrEmpty(functionName))
            {
                jsonResult = JsonHelper.OutResult(false, "method can't be empty");
                return;
            }
            MethodInfo method = InvokeLogic.GetMethod(this.GetType(), functionName);
            if (method == null)
            {
                jsonResult = JsonHelper.OutResult(false, "not found the method : " + functionName);
            }
            else
            {
                //权限检测
                if (p.IsCanInvokeMethod(method) && PreBeforeInvoke(method.Name))//同时检测菜单对应的操作方式。
                {
                    try
                    {
                        BeforeInvoke(method.Name);
                        if (!CancelInvoke)
                        {
                            object result = method.Invoke(this, null);
                            if (!CancelInvoke)
                            {
                                EndInvoke(method.Name);
                            }
                            if (result != null)
                            {
                                jsonResult = Convert.ToString(result);
                            }
                        }
                    }
                    catch (System.Threading.ThreadAbortException)
                    {
                        return;
                    }
                    catch (Exception err)
                    {
                        jsonResult = JsonHelper.OutResult(false, err.InnerException.Message);
                    }
                }
                else
                {
                    SetError("Permission denied！");
                    return;
                }
            }
            if (excelStream != null)
            {
                string name = OutputExcelName;
                string g = name + "#" + DateTime.Now.Ticks;
                streamList.Add(g, excelStream);
                jsonResult = "{\"sys_down\":\"" + g + "\"," + jsonResult.Substring(1);//对应的上传收到downcode会发起下载请求
            }

        }
        /// <summary>
        /// 增加这一步做进一步的权限验证
        /// </summary>
        protected bool PreBeforeInvoke(string methodName)
        {
            switch (methodName)
            {
                case "GetHeader":
                    p.Set(ObjName, TableName);
                    break;
                case "Add":
                case "Delete":
                case "Update":
                case "Export":
                case "Import":
                case "GetList":
                case "Get":
                    if (!p.Exists(ObjName))
                    {
                        if (WebHelper.IsKeyInHtml(ObjName))
                        {
                            p.Set(ObjName, null);
                            return true;
                        }
                        return false;
                    }
                    break;

            }
            return true;
        }
        protected virtual void BeforeInvoke(string methodName)
        {

        }
        protected virtual void EndInvoke(string methodName)
        {

        }

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }

        #region 基础方法

        public void SetKeyValue(Enum key, string value)
        {
            SetKeyValue(key.ToString(), value);
        }
        /// <summary>
        /// 设置表单要修改的值。
        /// </summary>
        public void SetKeyValue(string key, string value)
        {
            if (!keyValue.ContainsKey(key))
            {
                keyValue.Add(key, value);
            }
        }
        protected void SetError(string msg)
        {
            SetError(msg, null);
        }
        protected void SetSuccess(string msg)
        {
            jsonResult = JsonHelper.OutResult(true, msg);
        }
        protected void SetError(string msg, string debugInfo)
        {
#if DEBUG
            jsonResult = JsonHelper.OutResult(false, msg + debugInfo);
#else
            jsonResult = JsonHelper.OutResult(false, msg);
#endif
        }
        protected void WriteError(string msg)
        {
            Write(JsonHelper.OutResult(false, msg));
        }
        protected void Write(string result)
        {
            if (!string.IsNullOrEmpty(result))
            {
                result = result.Replace("\t", " ").Replace("\r", " ").Replace("\n", "<br/>");//Replace("\n", HttpUtility.HtmlEncode("<br/>"))
            }
            context.Response.Write(result);
        }
        public string GetWhereIn(string primaryKey, string requestKey = null)
        {
            string where = string.Empty;
            if (!string.IsNullOrEmpty(requestKey))
            {
                where = Query<string>(requestKey);
            }
            else
            {
                where = GetID;
            }
            if (!string.IsNullOrEmpty(where))
            {
                string[] items = where.Split(',');
                where = string.Empty;
                foreach (var item in items)
                {
                    where += "'" + item.Trim('\'') + "',";
                }
                where = string.Format("{0} in ({1})", primaryKey, where.TrimEnd(','));//避免删除不了GUID为主键的数据
            }
            return where;
        }

        /// <summary>
        /// 构造Where条件
        /// </summary>
        public virtual string GetWhere()
        {
            string search = Query<string>("sys_search");
            if (string.IsNullOrEmpty(search))
            {
                return search;
            }
            return SqlFormat.Format(HttpContext.Current.Server.HtmlDecode(search));
        }
        public string GetOrderBy(string defaultSort)
        {
            string sort = Sort;
            if (string.IsNullOrEmpty(sort))
            {
                sort = defaultSort;
            }
            if (!string.IsNullOrEmpty(sort))
            {
                return string.Format(" order by {0} {1} ", sort, Order);
            }
            return "";
        }


        #endregion

        #region 属性、字段

        /// <summary>
        /// Excel文件数据流（当导入验证失败需要返回Excel文件时，可以对此属性赋值。)
        /// </summary>
        protected MemoryStream excelStream = null;
        private string _OutputExcelName;
        /// <summary>
        /// 文件数据流对应的输出文件名。
        /// </summary>
        protected string OutputExcelName
        {
            get
            {
                if (string.IsNullOrEmpty(_OutputExcelName))
                {
                    if (HttpContext.Current.Request.Files.Count > 0)
                    {
                        _OutputExcelName = HttpContext.Current.Request.Files[0].FileName.Replace(".xls", "_Error.xls");
                        _OutputExcelName = Path.GetFileName(_OutputExcelName);
                    }
                    else
                    {
                        _OutputExcelName = "Excel_Import_Error" + ".xls";
                    }
                }
                return _OutputExcelName;

            }
            set { _OutputExcelName = value; }
        }
        /// <summary>
        /// 取消继续调用事件（可以在重载BeforeInvoke方法内使用）
        /// </summary>
        protected bool CancelInvoke = false;
        public virtual string GetID
        {
            get
            {
                string id = Query<string>("id");
                if (string.IsNullOrEmpty(id) && HttpContext.Current.Request.QueryString.Keys.Count > 0)
                {
                    for (int i = 0; i < HttpContext.Current.Request.QueryString.Keys.Count; i++)
                    {
                        if (HttpContext.Current.Request.QueryString.Keys[i].ToLower().EndsWith("id"))
                        {
                            return Query<string>(HttpContext.Current.Request.QueryString.Keys[i], string.Empty);
                        }
                    }
                }
                if (id.IndexOf(',') == -1)
                {
                    id = id.Trim('\'');//单个值，去掉批量时带来的引号
                }
                return id;
            }
        }


        /// <summary>
        /// 对名对称对应的SQL语句
        /// </summary>
        public string ObjCode
        {
            get
            {

                return SqlCode.GetCode(ObjName);
            }
        }
        /// <summary>
        /// 跨库对象名称
        /// </summary>
        public object CrossObjName
        {
            get
            {
                return CrossDb.GetEnum(ObjCode);
            }
        }
        private string _ObjName;
        /// <summary>
        /// 远程传过来的对象名称
        /// </summary>
        public string ObjName
        {
            get
            {
                if (string.IsNullOrEmpty(_ObjName))
                {
                    _ObjName = Query<string>("sys_objName");
                    //if (string.IsNullOrEmpty(_ObjName))// || _ObjName.Contains(" ")
                    //{
                    //    WriteError("ObjName can't be empty or contain blank!");
                    //}
                    return _ObjName;
                }
                return _ObjName;
            }
            set
            {
                _ObjName = value;
            }
        }
        /// <summary>
        /// 跨库对象表名称
        /// </summary>
        public object CrossTableName
        {
            get
            {
                return CrossDb.GetEnum(TableName);
            }
        }
        private string _TableName;
        /// <summary>
        /// 对象视图名称的主表名
        /// </summary>
        public string TableName
        {
            get
            {
                if (string.IsNullOrEmpty(_TableName))
                {
                    _TableName = Query<string>("sys_tableName");
                    if (string.IsNullOrEmpty(_TableName))
                    {
                        _TableName = ObjName;
                    }
                    else if (_TableName.Contains(" "))
                    {
                        WriteError("TableName can't contain blank!");
                    }

                    return _TableName;
                }
                return _TableName;
            }
        }

        #endregion

        #region 增删改查
        /// <summary>
        /// 允许重写导出的数据源（适用于存储过程的自定义数据源）
        /// </summary>
        protected virtual MDataTable Select(GridConfig.SelectType st)
        {
            MDataTable dt;
            using (MAction action = new MAction(CrossObjName))
            {
                action.SetSelectColumns(GridConfig.GetSelectColumns(ObjName, st));//只查询要显示的列数据。
                dt = action.Select(PageIndex, PageSize, GetWhere() + GetOrderBy(action.Data.JointPrimaryCell.Count > 1 ? null : action.Data.PrimaryCell.ColumnName));
            }
            return dt;
        }
        [ActionKey("View,Get")]
        /// <summary>
        /// 读取界面列表数据
        /// </summary>
        public virtual void GetList()
        {
            jsonResult = Select(GridConfig.SelectType.Show).ToJson(true, false,RowOp.None, true);
        }
        /// <summary>
        /// 获取一行数据。
        /// </summary>
        protected virtual MDataRow GetOne()
        {
            using (MAction action = new MAction(CrossObjName))
            {
                string where = string.IsNullOrWhiteSpace(GetID) ? GetWhere() : GetID.ToString();
                if (action.Fill(where))
                {
                    return action.Data;
                }
            }
            return null;
        }
        [ActionKey("View,Get")]
        /// <summary>
        /// 获取一条数据
        /// </summary>
        public virtual void Get()
        {
            MDataRow row = GetOne();
            if (row != null)
            {
                jsonResult = row.ToJson();
            }
        }
        /// <summary>
        /// 添加一条数据
        /// </summary>
        [ActionKey("Add,Insert")]
        public virtual void Add()
        {
            bool result = false;
            string msg = string.Empty;
            using (MAction action = new MAction(CrossTableName))
            {
                SetKeyValue(action.Data);
                result = action.Insert(true, InsertOp.ID);
                if (result)
                {
                    msg = action.Get<string>(action.Data.PrimaryCell.ColumnName);
                    SetSuccess(msg);
                }
                else
                {
                    if (AppConfig.Debug.OpenDebugInfo)
                    {
                        Log.WriteLogToTxt("Add(): " + action.DebugInfo);
                    }
                    SetError(LangConst.AddError, action.DebugInfo);
                }
            }
        }
        /// <summary>
        /// 在进行新增加前处理的事件（action参数不需要关闭）。
        /// 数据行直接拿action.Data
        /// 返回true则继续执行更新，返回false则停止更新。
        /// </summary>
        private void SetKeyValue(MDataRow row)
        {
            if (keyValue.Count > 0)
            {
                foreach (KeyValuePair<string, string> item in keyValue)
                {
                    row.Set(item.Key, item.Value);
                }
            }
        }
        /// <summary>
        /// 删除数据（传ID则一条，也可以构造where条件删除）
        /// </summary>
        [ActionKey("Del,Delete")]
        public virtual void Delete()
        {

            using (MAction action = new MAction(CrossTableName))
            {
                action.BeginTransation();
                //dg.foreignKeys="TableA.ColumnNameA,TableB.ColumnNameB";
                string foreignKeys = Query<string>("foreignKeys");
                bool result = true;
                if (!string.IsNullOrEmpty(foreignKeys))//增加了外键删除
                {
                    string[] items = foreignKeys.Split(',');
                    foreach (string item in items)
                    {
                        string[] kv = item.Split('.');
                        if (kv.Length == 2)
                        {
                            action.ResetTable(CrossDb.GetEnum(kv[0]));
                            result = action.Delete(GetWhereIn(kv[1]));
                            if (!result)
                            {
                                break;
                            }
                        }
                    }
                    if (result) { action.ResetTable(CrossTableName); }
                }
                if (result)
                {
                    result = action.Delete(GetID);//!string.IsNullOrEmpty(where) &&
                }
                if (!result)
                {
                    action.RollBack();
                }
                action.EndTransation();
                if (result)
                {
                    SetSuccess(LangConst.DelSuccess);
                }
                else
                {
                    if (AppConfig.Debug.OpenDebugInfo)
                    {
                        Log.WriteLogToTxt("Delete(): " + action.DebugInfo);
                    }
                    SetError(LangConst.DelError, action.DebugInfo);
                }

            }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        [ActionKey("Edit,Update")]
        public virtual void Update()
        {
            using (MAction action = new MAction(CrossTableName))
            {
                SetKeyValue(action.Data);
                if (action.Update(true))
                {
                    SetSuccess(LangConst.UpdateSuccess);
                }
                else
                {
                    if (AppConfig.Debug.OpenDebugInfo)
                    {
                        Log.WriteLogToTxt("Update(): " + action.DebugInfo);
                    }
                    SetError(LangConst.UpdateError, action.DebugInfo);
                }
            }

        }


        #endregion

        #region 导入导出
        /// <summary>
        /// 导出数据
        /// </summary>
        [ActionKey("Export")]
        public void Export()
        {
            MDataTable dt = Select(GridConfig.SelectType.Export);
            dt.TableName = ObjName;
            dt.DynamicData = GridConfig.GetList(ObjName, GridConfig.SelectType.Export);
            Dictionary<string, string> formatParas = GridConfig.GetFormatter(dt); //格式化列头（描述）（需要修改列头的数据格式）
            KeyValueConfig.FormatNameValue(dt, formatParas, true); //格式化配置项
            string fix = ExcelHelper.BookType == ExcelHelper.WorkBookType.High ? ".xlsx" : ".xls";
            WebHelper.SendFile(KeyValueConfig.GetTableDescription(ObjName, TableName) + "_" + DateTime.Now.ToString("yyyyMMdd") + fix, ExcelHelper.CreateExcel(dt));//ExcelHelper.CreateExcel(dt)
        }

        /// <summary>
        /// 获取导入数据的模板（支持2007以上）
        /// </summary>
        public void ExcelTemplate()
        {
            string path = HttpContext.Current.Server.MapPath("~/Resource/Excel/" + ObjName + ".xls");
            if (!File.Exists(path))
            {
                path = path + "x";
                if (!File.Exists(path) && ObjName != TableName)
                {
                    path = HttpContext.Current.Server.MapPath("~/Resource/Excel/" + TableName + ".xls");
                    if (!File.Exists(path))
                    {
                        path = path + "x";
                    }
                }
            }

            MemoryStream ms = null;
            string fix = ExcelHelper.BookType == ExcelHelper.WorkBookType.High ? ".xlsx" : ".xls";
            if (File.Exists(path))
            {
                byte[] data = File.ReadAllBytes(path);
                ms = new MemoryStream(data, 0, data.Length, false, true);
                fix = Path.GetExtension(path);
            }
            if (ms == null)
            {
                string objName = ObjName;
                MDataTable header = GridConfig.GetList(objName, GridConfig.SelectType.Import);//获取所有列的字段名。
                if (header.Rows.Count > 0)
                {
                    ms = ExcelHelper.CreateExcelHeader(header, KeyValueConfig.GetValidationData(header));
                }
            }
            WebHelper.SendFile(KeyValueConfig.GetTableDescription(ObjName, TableName) + fix, ms);
        }
        /// <summary>
        /// 下载错误的Excel列表。
        /// </summary>
        public void Down()
        {
            string downCode = Query<string>("sys_down");
            if (!string.IsNullOrEmpty(downCode) && streamList.ContainsKey(downCode))
            {
                MemoryStream ms = streamList[downCode];
                try
                {
                    streamList.Remove(downCode);
                }
                catch
                {

                }
                string name = downCode.Split('#')[0];
                WebHelper.SendFile(name, ms);
            }
        }

        /// <summary>
        /// 导入数据
        /// </summary>
        [ActionKey("Import")]
        public void Import()
        {
            //根据视图名读取ExcelConfig信息。

            MDataRow excelInfo = null;
            int index = 0, headCrossRowNum = 0;
            string sheetName = null;
            try
            {
                excelInfo = ExcelConfig.GetExcelRow(ObjName);
                if (excelInfo != null)
                {
                    index = excelInfo.Get<int>(Config_Excel.StartIndex, 0);
                    headCrossRowNum = excelInfo.Get<int>(Config_Excel.HeadCrossRowNum, 0);
                    sheetName = excelInfo.Get<string>(Config_Excel.Description);
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);//避免其它地方没有升级数据库表脚本。
            }
            MDataTable dt = ExcelHelper.ReadExcel(null, sheetName, index, headCrossRowNum, excelInfo != null);
            if (!dt.Columns.Contains(LangConst.ErrorInfo))
            {
                dt.Columns.Add(LangConst.ErrorInfo, System.Data.SqlDbType.NVarChar);
            }
            dt.TableName = excelInfo != null ? ObjName : TableName;
            bool result = false;
            string msg = string.Empty;
            ImportResult iResult = BeforeImport(dt, excelInfo, out msg);
            if (iResult == ImportResult.Continue)
            {
                result = FormatExcel(dt, excelInfo);
                if (result)
                {
                    result = ExcelConfig.AcceptChanges(dt, excelInfo, ObjName);// dt.AcceptChanges(AcceptOp.Auto);
                }
            }
            else
            {
                result = iResult == ImportResult.True;
            }
            if (!result)
            {
                if (dt.DynamicData != null && dt.DynamicData is Exception)
                {
                    msg = ((Exception)dt.DynamicData).Message;
                    msg += LangConst.ImportTemplateNotMatch;
                }
                if (excelStream == null)
                {
                    excelStream = ExcelHelper.SetError(dt);
                }
                if (string.IsNullOrEmpty(msg))
                {
                    msg = LangConst.ImportError + (excelStream != null ? LangConst.ImportCheckErrorInfo : LangConst.ImportCheckTemplateIsRight);
                }
            }
            else if (string.IsNullOrEmpty(msg))
            {
                msg = LangConst.ImportSuccess;
            }
            dt.DynamicData = null;
            dt = null;
            GC.Collect();

            jsonResult = JsonHelper.OutResult(result, msg);
        }
        protected bool FormatExcel(MDataTable dt)
        {
            return FormatExcel(dt, null);
        }
        /// <summary>
        /// 格式化Excel列头和Config_KeyValue数据。
        /// </summary>
        protected bool FormatExcel(MDataTable dt, MDataRow excelInfo)
        {

            //翻译列头、设置默认值。
            Dictionary<string, string> formatterDic = ExcelConfig.FormatterTitle(dt, excelInfo, ObjName);//
            //翻译字典值，处理默认值。
            bool result = KeyValueConfig.FormatNameValue(dt, formatterDic, false);

            //校验基础数据类型。
            result = ExcelConfig.ValidateData(dt, excelInfo) && result;

            if (result)//验证是否存在有错误信息
            {
                int index = dt.Columns.GetIndex(LangConst.ErrorInfo);
                if (index > -1)
                {
                    foreach (var row in dt.Rows)
                    {
                        if (!row[index].IsNullOrEmpty)
                        {
                            result = false;
                            break;
                        }
                    }
                }
            }
            dt.SetState(2, BreakOp.NullOrEmpty);
            return result;
        }
        /// <summary>
        /// 可以对导入的数据进行验证
        /// </summary>
        public virtual ImportResult BeforeImport(MDataTable dt, MDataRow excelInfo, out string msg)
        {
            msg = "";
            return ImportResult.Continue;
        }
        #endregion

        #region 初始数据获取
        /// <summary>
        /// 获取UI、MID、ActionKey的配置值。
        /// </summary>
        public virtual void GetInitConfig()
        {
            string ui = string.Empty, actionKeys = string.Empty, menuID = string.Empty;
            if (IsUseUISite)
            {
                ui = "/" + AppConfig.GetApp("UI").Trim('/');
            }
            actionKeys = p.GetFuncKeys();
            if (!string.IsNullOrEmpty(actionKeys))
            {
                actionKeys = "," + actionKeys.ToLower() + ",";
            }

            menuID = p.UrlMenuID;
            JsonHelper js = new JsonHelper(false, false);
            js.Add("ui", ui);
            js.Add("actionKeys", actionKeys);
            js.Add("mid", menuID);
            jsonResult = js.ToString();
        }
        /// <summary>
        /// 获取Config_KeyValue的配置值。
        /// </summary>
        public virtual void GetKeyValueConfig()
        {
            jsonResult = KeyValueConfig.GetJson();
        }
        /// <summary>
        /// 获取表的列头数据（输出EasyUI的列头格式）
        /// </summary>
        public virtual void GetHeader()
        {
            MDataTable dt = GridConfig.GetList(ObjName, GridConfig.SelectType.All);
            if (dt == null || dt.Rows.Count == 0)
            {
                dt = GridConfig.Create(ObjName, ObjCode, dt.GetSchema(false));
                if (p.UrlMenuID != string.Empty)//仅处理配置了菜单的数据。
                {
                    //顺带处理视图语句与菜单名称的绑定
                    KeyValueConfig.SetTableDescription(ObjName, p.MenuName);
                }
            }
            if (Query<string>("reflesh") == "1")//刷新表结构
            {
                string msg;
                bool result = GridConfig.Flesh(ObjName, ObjCode, dt, out msg);
                jsonResult = JsonHelper.OutResult(result, msg);
            }
            else if (dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    dt.Rows[i][Config_Grid.Field].Value = dt.Rows[i].Get<string>(Config_Grid.Field).ToLower();
                }
                jsonResult = dt.ToJson(false, false, RowOp.None, true);
            }
            else
            {
                jsonResult = JsonHelper.OutResult(false, "Init Column Header Fail!");
            }
        }
        /// <summary>
        /// 下拉框统一处理参数对象
        /// </summary>
        internal class ComboboxItem
        {
            public string ObjName { get; set; }
            public string Parent { get; set; }
            public string Para { get; set; }
        }
        //[ActionKey("View")]
        /// <summary>
        /// 获取下拉框Json结果集(统一处理）
        /// </summary>
        /// <returns></returns>
        public void GetCombobox()
        {
            string itemJson = Query<string>("sys_json");
            if (!string.IsNullOrEmpty(itemJson))
            {
                List<ComboboxItem> boxes = JsonHelper.ToList<ComboboxItem>(itemJson);
                JsonHelper json = new JsonHelper();
                if (boxes.Count > 0)
                {
                    List<MDataTable> dtList = new List<MDataTable>();
                    StringBuilder sb = new StringBuilder();
                    for (int i = 0; i < boxes.Count; i++)
                    {
                        ComboboxItem item = boxes[i];
                        string code = SqlCode.GetCode(item.ObjName);
                        if (code != item.ObjName)
                        {
                            #region 核心处理
                            var sql = SqlCode.GetCode(item.ObjName);//已经处理过系统参数和Post参数
                            sql = WebHelper.ReplacePara(sql, "@para", item.Para);
                            sql = WebHelper.ReplacePara(sql, "@parent", item.Parent);

                            sb.Append(sql + ";");
                            #endregion
                        }
                        else
                        {
                            #region 找不到，则移除。
                            boxes.RemoveAt(i);
                            //从程序里找。
                            MDataTable dt = Combobox.Get(item.ObjName, Query<string>("q", item.Para));
                            if (dt != null)
                            {
                                dtList.Insert(0, dt);
                                boxes.Insert(0, item);
                            }
                            else
                            {
                                i--;
                            }
                            #endregion
                        }
                    }
                    if (sb.Length > 0)
                    {
                        string sql = sb.ToString().TrimEnd(';');
                        using (MProc proc = new MProc(null, CrossDb.GetConn(sql)))
                        {
                            if (proc.DalType == DalType.MsSql)
                            {
                                proc.ResetProc(sql);
                                dtList.AddRange(proc.ExeMDataTableList());
                            }
                            else
                            {
                                string[] items = sql.Split(';');
                                foreach (string item in items)
                                {
                                    proc.ResetProc(item);
                                    dtList.Add(proc.ExeMDataTable());
                                }
                            }
                        }
                    }
                    if (dtList.Count == 1 && Query<string>("q", null) != null)
                    {
                        jsonResult = dtList[0].ToJson(false, false, RowOp.None, true);
                        return;
                    }
                    for (int i = 0; i < dtList.Count; i++)
                    {
                        json.Add(boxes[i].ObjName, dtList[i].Rows.Count > 0 ? dtList[i].ToJson(false, false, RowOp.None, true) : "[]", true);
                    }
                    json.AddBr();
                }
                jsonResult = json.ToString();
            }
        }

        [ActionKey("View,Get")]
        /// <summary>
        /// 是否存在某数据。
        /// </summary>
        public void Exists()
        {
            string value = Query<string>("v", "");
            string name = Query<string>("n", "");
            bool result = false;
            using (MAction action = new MAction(CrossObjName))
            {
                string id = GetID;
                string where = string.Format("{0}='{1}'", name, value);
                if (!string.IsNullOrEmpty(id))
                {
                    where += string.Format(" and {0}<>'{1}'", action.Data.PrimaryCell.ColumnName, id);
                }
                result = action.Exists(where);
            }
            jsonResult = JsonHelper.OutResult(result, string.Empty);
        }
        #endregion

        /// <summary>
        /// 是否使用子应用程序部署
        /// </summary>
        public bool IsUseUISite
        {
            get { return WebHelper.IsUseUISite; }
        }
    }

    public abstract partial class Controller
    {
        /// <summary>
        /// datagrid分页的页码数
        /// </summary>
        public int PageIndex
        {
            get
            {
                return Query<int>("page");
            }
        }
        /// <summary>
        /// datagrid分页的页容量
        /// </summary>
        public int PageSize
        {
            get
            {
                return Query<int>("rows");
            }
        }

        /// <summary>
        /// 排序字段名
        /// </summary>
        public string Sort
        {
            get
            {
                return Query<string>("sort", "");
            }

        }
        /// <summary>
        /// 排序类型（升或降）
        /// </summary>
        public string Order
        {
            get
            {
                string order = Query<string>("order");
                if (order != "asc")
                {
                    return order;//支持前端简化成一个sortName配置
                }
                return string.Empty;
            }
        }
        public T Query<T>(Enum key)
        {
            return Query<T>(key.ToString(), default(T));
        }
        public T Query<T>(string key)
        {
            return Query<T>(key, default(T));
        }
        public T Query<T>(string key, T defaultValue)
        {
            return WebHelper.Query<T>(key, defaultValue, false);
        }


        public HttpContext Context
        {
            get { return HttpContext.Current; }
        }


        public bool IsHttpGet
        {
            get { return Context.Request.HttpMethod == "GET"; }
        }

        public bool IsHttpPost
        {
            get { return Context.Request.HttpMethod == "POST"; }
        }
    }
    /// <summary>
    /// BeForeImport的结果参数
    /// </summary>
    public enum ImportResult
    {
        /// <summary>
        /// 继续执行原有流程。
        /// </summary>
        Continue,
        /// <summary>
        /// 中止执行，并返回True结果
        /// </summary>
        True,
        /// <summary>
        ///  中止执行，并返回False结果
        /// </summary>
        False
    }

}
