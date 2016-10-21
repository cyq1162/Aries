using NPOI.HSSF.UserModel;//2007 以下
using NPOI.HSSF.Util;
using NPOI.SS.UserModel;
using NPOI.SS.Util;
using NPOI.XSSF.UserModel;//2007 以上
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;
using Aries.Core.DB;

namespace Aries.Core.Helper
{
    /// <summary>
    /// 新版本用的（Excel导入和导出功能）
    /// </summary>
    public static partial class ExcelHelper
    {
        internal static WorkBookType BookType = WorkBookType.Aoto;
        public enum WorkBookType
        {
            /// <summary>
            /// 自动处理
            /// </summary>
            Aoto,
            /// <summary>
            /// 97-2007
            /// </summary>
            Low,
            /// <summary>
            /// 2007以上
            /// </summary>
            High
        }
        internal static IWorkbook GetWorkBook()
        {
            if (BookType == WorkBookType.High)
            {
                return new XSSFWorkbook();
            }
            else
            {
                return new HSSFWorkbook();
            }
        }
        /// <summary>
        /// 获取合并单元格的合并行。
        /// </summary>
        private static CellRangeAddress GetCellRange(this ISheet sheet, ICell cell)
        {
            List<CellRangeAddress> list = new List<CellRangeAddress>(sheet.NumMergedRegions);
            for (int i = 0; i < sheet.NumMergedRegions; i++)
            {
                CellRangeAddress m = sheet.GetMergedRegion(i);
                if (m.IsInRange(cell.RowIndex, cell.ColumnIndex))
                {
                    return m;
                }
            }
            return null;
        }
        /// <summary>
        /// 获取合并单元格的首格。
        /// </summary>
        private static ICell GetMergedRegion(this ISheet sheet, ICell cell)
        {
            List<CellRangeAddress> list = new List<CellRangeAddress>(sheet.NumMergedRegions);
            for (int i = 0; i < sheet.NumMergedRegions; i++)
            {
                CellRangeAddress m = sheet.GetMergedRegion(i);
                try
                {
                    if (m.IsInRange(cell.RowIndex, cell.ColumnIndex))
                    {
                        IRow row = sheet.GetRow(m.FirstRow);
                        if (row != null)
                        {
                            return row.GetCell(m.FirstColumn, MissingCellPolicy.RETURN_BLANK_AS_NULL);
                        }
                    }
                }
                catch
                {

                    continue;
                }
            }
            return null;
        }


        /// <summary>
        /// 获取样式
        /// </summary>
        /// <param name="book"></param>
        /// <param name="colorIndex">如：NPOI.HSSF.Util.HSSFColor.RED.index</param>
        /// <returns></returns>
        private static ICellStyle GetStyle(IWorkbook book, short colorIndex)
        {
            ICellStyle style = book.CreateCellStyle();
            style.BorderBottom = BorderStyle.Thin;
            style.BorderLeft = BorderStyle.Thin;
            style.BorderRight = BorderStyle.Thin;
            style.BorderTop = BorderStyle.Thin;
            style.FillForegroundColor = colorIndex;// NPOI.HSSF.Util.HSSFColor.RED.index;
            style.FillPattern = NPOI.SS.UserModel.FillPattern.SolidForeground;
            style.Alignment = HorizontalAlignment.Center;
            style.VerticalAlignment = VerticalAlignment.Center;
            return style;
        }

        /// <summary>
        /// 导出Excel和数据
        /// </summary>
        /// <param name="dt"></param>
        /// <returns></returns>
        public static MemoryStream CreateExcel(MDataTable dt)
        {
            MemoryStream ms = new MemoryStream();
            try
            {
                IWorkbook export = GetWorkBook();//2003版本以上。
                int maxLevel = 0;
                ISheet sheet = SetHeader(export, dt.DynamicData as MDataTable, dt.Columns, out maxLevel);
                SetData(sheet, dt, maxLevel);
                export.Write(ms);
                ms.Flush();
                ms.Close();
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }
            return ms;
        }


        /// <summary>
        /// 读取Excel头（特殊点：多级表头会组合名称）
        /// </summary>
        /// <param name="stream"></param>
        /// <returns></returns>
        public static MDataTable ReadExcel(Stream stream = null, string sheetName = null, int startIndex = 0, int headCrossRowNum = 0, bool isMergeCellName = false)
        {
            if (stream == null)
            {
                if (System.Web.HttpContext.Current.Request.Files.Count > 0)
                {
                    stream = System.Web.HttpContext.Current.Request.Files[0].InputStream;
                }
            }
            if (stream != null)
            {
                IWorkbook workbook;

                GC.Collect();//下一行代码会增长太多内存，提前调用，能降低内存。
                workbook = WorkbookFactory.Create(stream);
                int sheetIndex = 0;
                if (!string.IsNullOrEmpty(sheetName))
                {
                    List<string> names = GetSheetName(workbook);
                    sheetIndex = names.IndexOf(sheetName);
                    if (sheetIndex < 0)
                    {
                        sheetIndex = 0;
                    }
                }
                return ReadExcel(workbook, stream, sheetIndex, startIndex, headCrossRowNum, isMergeCellName);
            }
            return null;
        }
        /// <summary>
        /// 读取上传文件中的Excel（返回表格，如果需要导入，还需要格式化表头）
        /// </summary>
        /// <param name="workbook">Excel工作本</param>
        /// <param name="sheetIndex">第N个Sheet表格</param>
        /// <param name="isMergedCellName">是否把合并列头的名称连接起来</param>
        /// <param name="startIndex">开始索引</param>
        /// <param name="headCrossRowNum">头部跨行数（为0时自动识别）</param>
        /// <returns></returns>
        private static MDataTable ReadExcel(IWorkbook workbook, Stream stream = null, int sheetIndex = 0, int startIndex = 0, int headCrossRowNum = 0, bool isMergedCellName = false)
        {

            MDataTable dt = new MDataTable();
            try
            {
                if (workbook != null)
                {
                    ISheet sheet = workbook.GetSheetAt(sheetIndex);
                    dt.TableName = sheet.SheetName;
                    dt.DynamicData = sheet;
                    IRow excelRow = sheet.GetRow(startIndex);
                    int dataRowStart = startIndex;

                    if (headCrossRowNum <= 0)
                    {
                        dataRowStart += 1;
                        #region 遍历、找出(头部跨行数)最大行。用最大行进行遍历列（如果为空，往上一级找）
                        int mIndex = 0;
                        for (int i = 0; i < excelRow.Cells.Count; i++)
                        {
                            ICell cell = excelRow.GetCell(i, MissingCellPolicy.CREATE_NULL_AS_BLANK);// .Cells[i];
                            if (cell.IsMergedCell)
                            {
                                NPOI.SS.Util.CellRangeAddress range = sheet.GetCellRange(cell);//获取范围块。
                                if (range != null)
                                {
                                    dataRowStart = Math.Max(dataRowStart, range.LastRow + 1);//设置数据的读取行数。
                                    mIndex++;
                                    i += range.LastColumn - range.FirstColumn;
                                }
                            }
                        }
                        #endregion
                    }
                    else
                    {
                        dataRowStart += headCrossRowNum;
                    }

                    //读取列头。
                    if (dataRowStart > 1)
                    {
                        excelRow = sheet.GetRow(dataRowStart - 1);
                    }
                    dt.RecordsAffected = dataRowStart;
                    dt.Columns.CheckDuplicate = false;

                    #region 读取列头
                    //if (excelRow.FirstCellNum > 0)
                    //{
                    //    for (int i = 0; i < excelRow.FirstCellNum; i++)
                    //    {
                    //        string columnName = "该列头为空_" + i;
                    //        dt.Columns.Add(columnName);
                    //    }
                    //}
                    int emptyCellCount = 0;//兼容处理错误的Excel格式（读了256个空格列）
                    for (int i = 0; i < excelRow.Cells.Count; i++)
                    {
                        string columnName = string.Empty;
                        for (int j = dataRowStart; j > startIndex; j--)
                        {
                            #region MyRegion
                            IRow row = sheet.GetRow(j - 1);
                            ICell cell;
                            try
                            {
                                cell = row.GetCell(i, MissingCellPolicy.CREATE_NULL_AS_BLANK);//不能用GetCell(i)，会多出一行导致下面错误位。
                            }
                            catch (Exception)
                            {
                                continue;
                            }
                            string name = cell.ToString().Trim();// .StringCellValue.Trim();
                            if (!string.IsNullOrEmpty(name) && !columnName.Contains(name))//
                            {
                                columnName += name + "_";
                            }
                            else if (j != dataRowStart && cell.IsMergedCell)
                            {
                                cell = sheet.GetMergedRegion(cell);//获取范围块。
                                if (cell != null)
                                {
                                    name = cell.ToString().Trim();
                                    if (!string.IsNullOrEmpty(name) && !columnName.Contains(name))
                                    {
                                        columnName += name + "_";
                                    }
                                }
                            }
                            if (!isMergedCellName && !string.IsNullOrEmpty(columnName))
                            {
                                break;
                            }
                            #endregion
                        }
                        columnName = columnName.TrimEnd('_').Trim();
                        if (string.IsNullOrEmpty(columnName))
                        {
                            if (emptyCellCount > 30)//连续30次空格列
                            {
                                break;
                            }
                            emptyCellCount++;
                            columnName = "该列头为空_" + i;
                        }
                        else
                        {
                            emptyCellCount = 0;//只要一个正常，即回归索引
                        }
                        if (dt.Columns.Contains(columnName))
                        {
                            columnName += "_" + i;
                        }
                        dt.Columns.Add(columnName);
                    }
                    //移除空格列
                    if (emptyCellCount > 0)
                    {
                        dt.Columns.RemoveRange(dt.Columns.Count - emptyCellCount, emptyCellCount);
                    }
                    if (dt.Columns.Count > 0)
                    {
                        dt.Description = dt.Columns.Count.ToString();//找个变量存储实际的列的长度，在SetError中使用。（dt可能在SetError前列被变更)
                    }
                    #endregion

                    ICell sheetCell;
                    int emptyCount = 0;
                    for (int i = dataRowStart; i <= sheet.LastRowNum; i++)
                    {
                        excelRow = sheet.GetRow(i);
                        if (excelRow == null)
                        {
                            break;
                        }
                        MDataRow tbRow = dt.NewRow();
                        bool isOk = false;
                        for (int j = 0; j < dt.Columns.Count; j++)
                        {
                            #region 读一行
                            sheetCell = excelRow.GetCell(j, MissingCellPolicy.RETURN_BLANK_AS_NULL);
                            if (sheetCell != null)
                            {
                                string value = string.Empty;
                                if (sheetCell.CellType == CellType.Numeric)
                                {
                                    try
                                    {
                                        if (sheetCell.ToString().Split('/', '-').Length > 1)
                                        {
                                            value = sheetCell.DateCellValue.ToString();
                                        }
                                        else
                                        {
                                            value = sheetCell.NumericCellValue.ToString();
                                        }
                                    }
                                    catch
                                    {
                                        value = sheetCell.ToString();
                                    }

                                }
                                else if (sheetCell.CellType == CellType.Formula)
                                {
                                    try
                                    {
                                        /*公式不一定是Numeric的取值，也有可能是=G4 这种，然而单元格G4不是数字; 
                                         * 公式单元格也有可能读取错误 #VALUE!  #REF! 等*/
                                        CellType resultType = sheetCell.CachedFormulaResultType;
                                        switch (resultType)
                                        {
                                            case CellType.Boolean:
                                                value = sheetCell.BooleanCellValue.ToString();
                                                break;
                                            case CellType.Numeric:
                                                value = sheetCell.NumericCellValue.ToString();
                                                break;
                                            case CellType.Blank:
                                            case CellType.Error:
                                            case CellType.Unknown:
                                                value = string.Empty;
                                                break;
                                            default:
                                                value = sheetCell.StringCellValue;
                                                break;
                                        }


                                        //value = sheetCell.NumericCellValue.ToString(); //由公式取值
                                    }
                                    catch
                                    {

                                    }
                                }
                                else
                                {
                                    value = sheetCell.ToString();
                                }
                                value = value.Trim();
                                if (!isOk && !string.IsNullOrEmpty(value))
                                {
                                    isOk = true;
                                }
                                if (!string.IsNullOrEmpty(value))//空值当Null值处理，避免字段有Check对空值的约束
                                {
                                    tbRow.Set(sheetCell.ColumnIndex, value);
                                }
                            }
                            #endregion

                        }
                        if (isOk)//忽略空行数据。
                        {
                            dt.Rows.Add(tbRow);
                        }
                        else
                        {
                            if (dt.Rows.Count == 0)
                            {
                                dt.RecordsAffected++;
                            }
                            emptyCount++;
                            if (emptyCount > 1)//超过2次空格行，跳出。
                            {
                                break;
                            }
                        }
                    }
                    workbook.Close();//关闭了，dt.DynamicData带出了Sheet,还是可以后续使用（估计NPOI的没处理）
                }
            }
            catch (Exception err)
            {
                Log.WriteLogToTxt(err);
            }
            return dt;
        }

        /// <summary>
        /// 指量为多个Sheet写错误信息，并返回最终Excel流。
        /// </summary>
        /// <param name="dtList"></param>
        /// <returns></returns>
        public static MemoryStream SetError(List<MDataTable> dtList)
        {
            MemoryStream ms = null;
            if (dtList != null && dtList.Count > 0)
            {
                for (int i = dtList.Count - 1; i >= 0; i--)
                {
                    if (dtList[i] == null || dtList[i].DynamicData == null || !(dtList[i].DynamicData is ISheet))
                    {
                        dtList.RemoveAt(i);
                    }
                }
                for (int i = 0; i < dtList.Count; i++)
                {
                    bool isLast = i == dtList.Count - 1;
                    ms = SetError(dtList[i], isLast);
                }

            }
            return ms;
        }
        /// <summary>
        /// 将错误信息写回原始存档中，并返回文件流。
        /// </summary>
        public static MemoryStream SetError(MDataTable dt, bool isReturnStream = true)
        {
            if (dt != null && dt.Columns.Contains("错误信息") && dt.DynamicData != null && dt.DynamicData is ISheet)
            {
                try
                {
                    ISheet sheet = dt.DynamicData as ISheet;
                    IWorkbook workBook = sheet.Workbook;
                    ICellStyle style = GetStyle(workBook, HSSFColor.Red.Index);
                    int dataRowStart = dt.RecordsAffected;

                    IRow excelRow = null;
                    excelRow = sheet.GetRow(0);//处理列头的前面有垃圾数据导致列头比下面的列头少的情况
                    IRow dataRow = sheet.GetRow(dataRowStart - 1);
                    int firstRow = 0;
                    if (excelRow.LastCellNum < dataRow.LastCellNum)
                    {
                        excelRow = dataRow;
                        firstRow = dataRowStart - 1;
                    }
                    //int cellCount = excelRow.Cells.Count;
                    int cellCount;
                    if (!int.TryParse(dt.Description, out cellCount))
                    {
                        cellCount = excelRow.LastCellNum;   //修复左上角第一个单元格为空时，错误信息错位的问题
                    }
                    if (cellCount > 255)//如果出现256列（后面全是空格列）
                    {
                        cellCount = dt.Columns.Count;
                    }

                    ICell errorCell = excelRow.CreateCell(cellCount, CellType.String);
                    sheet.SetColumnWidth(cellCount, 100 * 256);
                    if (dataRowStart > 1)
                    {
                        //添加错误信息列
                        CellRangeAddress cellAddress = new CellRangeAddress(firstRow, dataRowStart - 1, cellCount, cellCount);
                        sheet.AddMergedRegion(cellAddress);
                    }
                    errorCell.SetCellValue("错误信息");
                    bool hasError = false;
                    int errColumnIndex = dt.Columns.GetIndex("错误信息");
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        MDataRow dtRow = dt.Rows[i];
                        string value = dtRow[errColumnIndex].ToString();
                        if (!string.IsNullOrEmpty(value))
                        {
                            IRow row = sheet.GetRow(i + dataRowStart);
                            if (row == null)
                            {
                                break;
                            }
                            hasError = true;
                            ICell cell = row.CreateCell(cellCount, CellType.String);
                            cell.SetCellValue(value);
                            cell.CellStyle = style;
                            for (int j = 0; j < dt.Columns.Count; j++)//标识错误的格的背景色为红色。
                            {
                                if (dtRow[j].State == -1)// && j < row.Cells.Count
                                {
                                    cell = row.GetCell(j, MissingCellPolicy.RETURN_BLANK_AS_NULL);
                                    if (cell != null)
                                    {
                                        cell.CellStyle = style;
                                    }
                                }
                            }
                        }

                    }
                    if (hasError && isReturnStream)
                    {
                        MemoryStream ms = new MemoryStream();
                        workBook.Write(ms);
                        return ms;
                    }
                    return null;
                }
                catch (Exception err)
                {
                    Log.WriteLogToTxt(err);
                }
            }
            return null;
        }

        /// <summary>
        /// 导出Excel列头模板
        /// </summary>
        /// <param name="header">列头数据</param>
        /// <param name="validateData">有效性数据</param>
        /// <returns></returns>
        internal static MemoryStream CreateExcelHeader(MDataTable header, Dictionary<string, string[]> validateData)
        {
            MemoryStream ms = new MemoryStream();
            if (header != null && header.Rows.Count > 0)
            {
                try
                {
                    IWorkbook export = GetWorkBook();
                    int maxLevel = 0;
                    ISheet sheet = SetHeader(export, header, null, out maxLevel);
                    CreateValidationSheet(export, validateData);
                    CreateCascadeSheet(sheet, header, validateData, maxLevel);
                    export.Write(ms);
                    ms.Flush();
                    ms.Close();
                    export.Close();
                    export = null;
                }
                catch (Exception err)
                {
                    Log.WriteLogToTxt(err);
                }
            }
            return ms;
        }

        /// <summary>
        /// 生成Sheet2的下拉验证数据
        /// </summary>
        /// <param name="export"></param>
        /// <param name="validateData"></param>
        private static void CreateValidationSheet(IWorkbook export, Dictionary<string, string[]> validateData)
        {
            int rowStartIndex = 0;
            ISheet refSheet = export.CreateSheet("Sheet2");

            int rowCount = rowStartIndex;
            int cellCount = validateData.Count;
            foreach (KeyValuePair<string, string[]> items in validateData)
            {
                rowCount = Math.Max(rowCount, items.Value.Length + rowStartIndex);
            }
            for (int i = 0; i < rowCount; i++)
            {
                IRow row = refSheet.CreateRow(i);
                for (int j = 0; j < cellCount; j++)
                {
                    row.CreateCell(j);
                }
            }

            int cellIndex = 0, rowIndex = rowStartIndex;
            foreach (KeyValuePair<string, string[]> items in validateData)
            {
                for (int k = 0; k < items.Value.Length; k++)
                {
                    IRow row = refSheet.GetRow(k + rowStartIndex);
                    row.GetCell(cellIndex, MissingCellPolicy.CREATE_NULL_AS_BLANK).SetCellValue(items.Value[k]);
                }

                IName range = export.CreateName();
                string title = ConvertIndexToChar(cellIndex);
                range.RefersToFormula = string.Format("Sheet2!${0}${1}:${0}${2}", title, rowStartIndex + 1, items.Value.Length + rowStartIndex);
                range.NameName = items.Key.Split('=')[0].Replace("#", "").Replace(" ", "");//不允许存在空格
                cellIndex++;
            }

        }

        /// <summary>
        /// 生成Sheet的级联指定
        /// </summary>
        private static void CreateCascadeSheet(ISheet sheet, MDataTable header, Dictionary<string, string[]> validateData, int maxLevel)
        {
            Dictionary<string, int> formatdic = new Dictionary<string, int>();
            MDataTable[] dt2 = header.Split(Config_Grid.Field + " like 'mg_%'");
            header = dt2[1];//去掉多级表头的数据。
            for (int i = 0; i < header.Rows.Count; i++)
            {
                string formater = header.Rows[i].Get<string>(Config_Grid.Formatter);
                if (!string.IsNullOrEmpty(formater) && formater.Length > 1 && !formatdic.ContainsKey(formater))
                {
                    formatdic.Add(formater, i);//存储列索引
                }
            }

            int maxRow = 1000;//限制最大行数(07之前版本的excel最大行数为65536，但NOPI似乎没有支持到最大行数,这里设置为50000行,到60000行数据有效性失效)
            IDataValidationHelper dvHelper = sheet.GetDataValidationHelper();


            for (int i = 0; i < header.Rows.Count; i++)
            {
                MDataRow dtRow = header.Rows[i];

                string formatter = dtRow.Get<string>(Config_Grid.Formatter);

                if (formatter == "boolFormatter")
                {
                    formatter = "#是否";//对bool型特殊处理。
                }
                if (!string.IsNullOrEmpty(formatter) && formatter.StartsWith("#") && validateData != null && formatter.Length > 1)//&& validateData.ContainsKey(formatter)
                {
                    //处理数据的有效性
                    CellRangeAddressList regions = null;
                    IDataValidationConstraint constraint = null;
                    IDataValidation dataValidate = null;
                    if (validateData.ContainsKey(formatter))
                    {
                        regions = new CellRangeAddressList(maxLevel, maxRow, i, i);
                        string key = formatter.Split('=')[0].Replace("#", "").Replace(" ", "");// "V" + (char)formatter.Length;// formatter.Replace("#", "V");
                        constraint = dvHelper.CreateFormulaListConstraint(key);
                        dataValidate = dvHelper.CreateValidation(constraint, regions);
                        sheet.AddValidationData(dataValidate);
                    }
                    if (formatter.StartsWith("#C"))//级联要接着父级后加数据有效性才行
                    {
                        string parentFormatter = formatter;
                        while (formatdic.ContainsKey(parentFormatter))
                        {
                            int point = 0;
                            int parentindex = formatdic[parentFormatter];
                            formatdic.Remove(parentFormatter);
                            foreach (var item in formatdic)
                            {
                                if (item.Key.IndexOf('=') > -1)
                                {
                                    string parent = item.Key.Split('=')[1];
                                    parent = parent.Replace(">", "#");
                                    if (parent.Equals(parentFormatter.Split('=')[0]))
                                    {
                                        int selfindex = item.Value;
                                        string t = ConvertIndexToChar(parentindex);
                                        for (int im = maxLevel; im < maxRow; im++)
                                        {
                                            string func = string.Format("INDIRECT(${0}${1})", t, im + 1);
                                            regions = new CellRangeAddressList(im, im, selfindex, selfindex);
                                            constraint = dvHelper.CreateFormulaListConstraint(func);
                                            dataValidate = dvHelper.CreateValidation(constraint, regions);
                                            sheet.AddValidationData(dataValidate);
                                        }
                                        parentFormatter = item.Key;
                                        break;
                                    }
                                }
                                point += 1;
                            }
                            if (point.Equals(formatdic.Count))
                            {
                                parentFormatter = string.Empty;
                            }
                        }
                    }

                }
            }
        }

        /// <summary>
        /// 设置Excel数据
        /// </summary>
        /// <param name="dt">数据表</param>
        /// <param name="startIndex">数据的起始索引</param>
        private static void SetData(ISheet sheet, MDataTable dt, int startIndex)
        {
            //设置数据
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                IRow row = sheet.CreateRow(startIndex + i);//index代表第N行0,1
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    row.CreateCell(j).SetCellValue(dt.Rows[i][j].ToString());
                }
            }
        }
        /// <summary>
        ///  设置Excel列头数据（支持多级表头）。
        /// <param name="maxLevel">表头的层级数</param>
        /// </summary>
        private static ISheet SetHeader(IWorkbook export, MDataTable header, MDataColumn columns, out int maxLevel)
        {
            ISheet sheet = export.CreateSheet("Sheet1");//创建内存Excel
            ICellStyle style = GetStyle(export, HSSFColor.LightOrange.Index);
            if (header != null && header.FindRow(Config_Grid.Field + " like 'mg_%'") != null)
            {
                Dictionary<int, List<MDataRow>> headerGroup = GetColumnGroup(header);// header 包含mg_
                MDataTable[] items = header.Split(Config_Grid.Field + " like 'mg_%'");
                CreateMergeHeader(sheet, style, headerGroup, items[1]);
                maxLevel = headerGroup.Count;
            }
            else
            {

                IRow row = sheet.CreateRow(0);//index代表第N行
                if (columns != null)
                {
                    for (int i = 0; i < columns.Count; i++)
                    {
                        string title = string.IsNullOrEmpty(columns[i].Description) ? columns[i].ColumnName : columns[i].Description;
                        ICell cell = row.CreateCell(i);
                        cell.SetCellValue(title);//设置列头
                        sheet.SetColumnWidth(i, 3000);
                        cell.CellStyle = style;
                    }
                }
                else
                {
                    for (int i = 0; i < header.Rows.Count; i++)
                    {
                        string title = header.Rows[i].Get<string>(Config_Grid.Title);
                        ICell cell = row.CreateCell(i);
                        cell.SetCellValue(title);//设置列头
                        sheet.SetColumnWidth(i, 3000);
                        cell.CellStyle = style;
                    }
                }
                maxLevel = 1;
            }

            return sheet;
        }

        /// <summary>
        /// 获得多表头层级，并分组(算法和前端Aries.Common.Js里的getColumnGroup一致)
        /// </summary>
        private static Dictionary<int, List<MDataRow>> GetColumnGroup(MDataTable header)
        {
            Dictionary<int, List<MDataRow>> result = new Dictionary<int, List<MDataRow>>();
            int index = 0;
            int[] num = new int[6];
            for (int i = 0; i < header.Rows.Count; i++)
            {
                MDataRow row = header.Rows[i];
                if (row.Get<string>(Config_Grid.Field).IndexOf("mg_") != -1)
                {
                    int colspan = row.Get<int>(Config_Grid.Colspan, 1);
                    if (num[index] > 0)//内部嵌套
                    {
                        index++;
                        num[index] = colspan;
                        num[index - 1] = num[index - 1] - num[index];//父级数字要减掉子级的数量
                    }
                    else
                    {
                        num[index] = colspan;
                    }
                    if (!result.ContainsKey(index)) { result.Add(index, new List<MDataRow>()); }
                    result[index].Add(row);
                }
                else
                {
                    var level = (num[index] > 0) ? index + 1 : index;
                    if (num[index] > 0)
                    {
                        num[index]--;
                        if (num[index] == 0)//列已经够了
                        {
                            if (index > 0)//如果是子级
                            {
                                index--;
                            }
                        }
                    }
                    if (!result.ContainsKey(level)) { result.Add(level, new List<MDataRow>()); }
                    result[level].Add(row);
                }
            }
            //设置RowSpan属性
            int maxLen = result.Count;
            for (int i = 0; i < result.Count; i++)
            {
                for (int k = 0; k < result[i].Count; k++)
                {
                    MDataRow row = result[i][k];
                    if (row.Get<int>(Config_Grid.Rowspan, 1) == 1 && !row.Get<string>(Config_Grid.Field).StartsWith("mg_"))
                    {
                        row.Set(Config_Grid.Rowspan, maxLen - i);
                    }
                }
            }
            return result;
        }
        private static void CreateMergeHeader(ISheet sheet, ICellStyle style, Dictionary<int, List<MDataRow>> headerGroup, MDataTable header)
        {
            for (int i = 0; i < headerGroup.Count; i++) //事先创建好每一行数据,之后能才产生合并数据。
            {
                IRow row = sheet.CreateRow(i);
                for (int d = 0; d < header.Rows.Count; d++)
                {
                    ICell cel = row.CreateCell(d);
                    cel.CellStyle = style;
                }
            }

            //设置标题和合并单元格。
            foreach (KeyValuePair<int, List<MDataRow>> item in headerGroup)
            {
                IRow row = sheet.GetRow(item.Key);
                row.Height = 300;
                int cellIndex = 0;
                for (int i = 0; i < item.Value.Count; i++)
                {
                    MDataRow data = item.Value[i];
                    int colspan = data.Get<int>(Config_Grid.Colspan, 1);
                    int rowspan = data.Get<int>(Config_Grid.Rowspan, 1);
                    string title = data.Get<string>(Config_Grid.Title);
                    if (i == 0)
                    {
                        string field = data.Get<string>(Config_Grid.Field);
                        cellIndex = header.GetIndex(Config_Grid.Field + "='" + field + "'");
                        if (cellIndex < 0) { cellIndex = 0; }
                    }
                    if (colspan > 1 || rowspan > 1)
                    {
                        sheet.AddMergedRegion(new CellRangeAddress(item.Key, item.Key + rowspan - 1, cellIndex, cellIndex + colspan - 1));//合并单元格
                    }
                    ICell cell = row.GetCell(cellIndex, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    sheet.SetColumnWidth(cell.ColumnIndex, 4000);

                    cell.SetCellValue(title);
                    cellIndex += colspan;

                }
            }
        }

        /// <summary>
        /// 索引转换为excel字母列名
        /// </summary>
        /// <param name="index"></param>
        /// <returns></returns>
        private static string ConvertIndexToChar(int index)
        {
            string rtn = string.Empty;
            List<int> iList = new List<int>();

            index += 1;
            while (index / 26 != 0 || index % 26 != 0)
            {
                iList.Add(index % 26);
                index /= 26;
            }
            for (int j = 0; j < iList.Count - 1; j++)
            {
                if (iList[j] == 0)
                {
                    iList[j + 1] -= 1;
                    iList[j] = 26;
                }
            }
            if (iList[iList.Count - 1] == 0)
            {
                iList.Remove(iList[iList.Count - 1]);
            }

            for (int j = iList.Count - 1; j >= 0; j--)
            {
                char c = (char)(iList[j] + 64);
                rtn += c.ToString();
            }
            return rtn;
        }

    }
    public static partial class ExcelHelper
    {
        /// <summary>
        /// 获取Excel整体接口
        /// </summary>
        /// <param name="stream"></param>
        /// <returns></returns>
        public static IWorkbook ReadWorkbook(Stream stream = null)
        {
            IWorkbook workbook = null;
            if (stream == null)
            {
                if (System.Web.HttpContext.Current.Request.Files.Count > 0)
                {
                    stream = System.Web.HttpContext.Current.Request.Files[0].InputStream;
                }
            }
            if (stream != null)
            {
                workbook = WorkbookFactory.Create(stream);
            }
            return workbook;
        }
        /// <summary>
        /// 取Excelsheet名集合
        /// </summary>
        /// <param name="workbook"></param>
        /// <returns></returns>
        public static List<string> GetSheetName(IWorkbook workbook)
        {
            List<string> sheetNames = null;
            if (workbook == null)
            {
                sheetNames = new List<string>(0);
            }
            else
            {
                sheetNames = new List<string>();
                for (int i = 0; i < workbook.NumberOfSheets; i++)
                {
                    sheetNames.Add(workbook.GetSheetName(i).Trim());
                }
            }
            return sheetNames;
        }
    }
}
