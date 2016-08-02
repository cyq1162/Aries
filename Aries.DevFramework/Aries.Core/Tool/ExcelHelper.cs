using NPOI.HSSF.UserModel;
using NPOI.HSSF.Util;
using NPOI.SS.UserModel;
using NPOI.SS.Util;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using CYQ.Data;
using CYQ.Data.Table;

namespace Aries.Core
{
    /// <summary>
    /// 新版本用的（Excel导入和导出功能）
    /// </summary>
    public static partial class ExcelHelper
    {
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
                MDataTable header = dt.DynamicData as MDataTable;
                HSSFWorkbook export = new HSSFWorkbook();
                ICellStyle style = GetStyle(export, HSSFColor.LightOrange.Index);
                ISheet sheet = export.CreateSheet("Sheet1");//创建内存Excel
                IRow row = sheet.CreateRow(0);//index代表第N行
                row.Height = 500;
                string title = string.Empty;

                int columnCount = dt.Columns.Count;
                ICell cell;
                int ColTitleRowCount = 1;
                if (ExportMulHeader(header, false))
                {
                    header = header.Select("Export=1 ORDER BY MergeIndexed DESC");
                    CreateMulHeadExcel(export, header, out ColTitleRowCount, columnCount);
                }
                else
                {
                    for (int i = 0; i < columnCount; i++)
                    {
                        title = string.IsNullOrEmpty(dt.Columns[i].Description) ? dt.Columns[i].ColumnName : dt.Columns[i].Description;
                        cell = row.CreateCell(i);
                        cell.SetCellValue(title);//设置列头
                        sheet.SetColumnWidth(i, 3000);
                        cell.CellStyle = style;
                    }
                }
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    row = sheet.CreateRow(ColTitleRowCount + i);//index代表第N行0,1
                    for (int j = 0; j < columnCount; j++)
                    {
                        row.CreateCell(j).SetCellValue(dt.Rows[i][j].ToString());
                    }
                }
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
        public static MemoryStream CreateExcelHeader(MDataTable header, Dictionary<string, string[]> validateData)
        {
            MemoryStream ms = new MemoryStream();
            if (header != null && header.Rows.Count > 0)
            {
                MDataTable importHeader = header.FindAll("Import=1");
                try
                {
                    XSSFWorkbook export = new XSSFWorkbook();
                    ICellStyle style = GetStyle(export, HSSFColor.LightOrange.Index);
                    ISheet sheet = export.CreateSheet("Sheet1");//创建内存Excel
                    #region 创建引用
                    int rowStartIndex = 1;
                    CreateValidationSheet(export, validateData, rowStartIndex);
                    #endregion
                    importHeader.Rows.Sort("ORDER BY MergeIndexed DESC");//Hidden=0 AND (Export=1 OR Field LIKE 'mg_%')
                    MDataTable headTable = importHeader.Clone();
                    int ColTitleRowCount = 0;
                    Dictionary<string, int> formatdic = new Dictionary<string, int>();
                    for (int i = importHeader.Rows.Count - 1; i >= 0; i--)//MDataTable 不支持 NOT LIKE 
                    {
                        if (importHeader.Rows[i]["Field"].Value.ToString().IndexOf("mg") > -1)
                        {
                            importHeader.Rows.RemoveAt(i);//非字段列移除
                        }
                    }
                    int colSum = importHeader.Rows.Count;//实际列数
                    importHeader.Rows.Sort("ORDER BY OrderNum ASC");
                    if (!ExportMulHeader(header, true))
                    {

                        IRow row = sheet.CreateRow(0);
                        ICell cell;
                        for (int i = 0; i < colSum; i++)
                        {
                            string title = importHeader.Rows[i]["Title"].Value.ToString();
                            cell = row.CreateCell(i);
                            cell.SetCellValue(title);//设置列头
                            sheet.SetColumnWidth(i, 3000);
                            cell.CellStyle = style;
                        }
                    }
                    else
                    {
                        CreateMulHeadExcel(export, headTable, out ColTitleRowCount, colSum);
                        ColTitleRowCount -= 1;
                    }
                    for (int i = 0; i < importHeader.Rows.Count; i++)
                    {
                        string formater = importHeader.Rows[i].Get<string>("Formatter");
                        if (!string.IsNullOrEmpty(formater) && formater.Length > 1 && !formatdic.ContainsKey(formater))
                        {
                            formatdic.Add(formater, i);//存储列索引
                        }
                    }

                    int maxRow = 50000;//限制最大行数(07之前版本的excel最大行数为65536，但NOPI似乎没有支持到最大行数,这里设置为50000行,到60000行数据有效性失效)
                    XSSFSheet xssfSheet = (XSSFSheet)sheet;
                    XSSFDataValidationHelper dvHelper = new XSSFDataValidationHelper(xssfSheet);

                    for (int i = 0; i < importHeader.Rows.Count; i++)
                    {
                        MDataRow dtRow = importHeader.Rows[i];

                        string formatter = dtRow.Get<string>("Formatter");

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
                            //int maxRow = 65535;
                            if (validateData.ContainsKey(formatter))
                            {
                                regions = new CellRangeAddressList(ColTitleRowCount + 1, maxRow, i, i);
                                string key = formatter.Split('=')[0].Replace("#", "");// "V" + (char)formatter.Length;// formatter.Replace("#", "V");
                                /*03版本api
                                constraint = DVConstraint.CreateFormulaListConstraint(key);//);//validateData[formatter]
                                dataValidate = new HSSFDataValidation(regions, constraint);
                                */
                                constraint = dvHelper.CreateFormulaListConstraint(key);
                                dataValidate = dvHelper.CreateValidation(constraint, regions);
                                sheet.AddValidationData(dataValidate);

                                //regions = new CellRangeAddressList(ColTitleRowCount, maxRow, i, i);
                                //string key = formatter.Split('=')[0].Replace("#", "");// "V" + (char)formatter.Length;// formatter.Replace("#", "V");
                                //constraint = DVConstraint.CreateFormulaListConstraint(key);//);//validateData[formatter]
                                //dataValidate = new HSSFDataValidation(regions, constraint);
                                //sheet.AddValidationData(dataValidate);

                            }
                            //
                            if (formatter.StartsWith("#C"))//级联要接着父级后加数据有效性才行
                            {
                                string Parentformatter = formatter;
                                while (formatdic.ContainsKey(Parentformatter))
                                {
                                    int point = 0;
                                    int parentindex = formatdic[Parentformatter];
                                    formatdic.Remove(Parentformatter);
                                    foreach (var item in formatdic)
                                    {
                                        if (item.Key.IndexOf('=') > -1)
                                        {
                                            string parent = item.Key.Split('=')[1];
                                            parent = parent.Replace(">", "#");
                                            if (parent.Equals(Parentformatter.Split('=')[0]))
                                            {
                                                int selfindex = item.Value;
                                                //int parentindex = formatdic[hereformatter];
                                                string t = IntToMoreChar(parentindex);
                                                for (int im = ColTitleRowCount; im < maxRow; im++)
                                                {
                                                    string func = string.Format("@INDIRECT({0}{1})", t, im + 1);
                                                    regions = new CellRangeAddressList(im, im, selfindex, selfindex);
                                                    constraint = dvHelper.CreateFormulaListConstraint(func);
                                                    dataValidate = dvHelper.CreateValidation(constraint, regions);
                                                    sheet.AddValidationData(dataValidate);
                                                }
                                                //for (int im = ColTitleRowCount; im < maxRow; im++)//1000应为maxRow
                                                //{
                                                //    string func = "INDIRECT(" + t + (im + 1) + ")";//excel2013不能级联，03可以，其他没测过
                                                //    regions = new CellRangeAddressList(ColTitleRowCount, im, selfindex, selfindex);
                                                //    constraint = DVConstraint.CreateFormulaListConstraint(func);
                                                //    dataValidate = new HSSFDataValidation(regions, constraint);
                                                //    sheet.AddValidationData(dataValidate);
                                                //}
                                                Parentformatter = item.Key;
                                                break;
                                            }
                                        }
                                        point += 1;
                                    }
                                    if (point.Equals(formatdic.Count))
                                    {
                                        Parentformatter = string.Empty;
                                    }
                                }
                            }

                        }
                    }
                    export.Write(ms);
                    ms.Flush();
                    ms.Close();
                }
                catch (Exception err)
                {
                    Log.WriteLogToTxt(err);
                }
            }
            return ms;
        }

        /// <summary>
        /// 读取Excel头（特殊点：多级表头会组合名称）
        /// </summary>
        /// <param name="stream"></param>
        /// <returns></returns>
        public static MDataTable ReadExcel(Stream stream = null, string sheetName = null)
        {
            return ReadExcel(false, stream, 0, 0, sheetName);
        }

        public static MDataTable ReadExcel(bool isMergedCellName, Stream stream = null, int startIndex = 0, int headCrossRowNum = 0, string sheetName = null)
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
                //try
                //{
                GC.Collect();//下一行代码会增长太多内存，提前调用，能降低内存。
                workbook = WorkbookFactory.Create(stream);
                //}
                //catch (Exception)
                //{

                //    workbook = new NPOI.XSSF.UserModel.XSSFWorkbook(stream);
                //}
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
                return ReadExcel(workbook, sheetIndex, isMergedCellName, stream, startIndex, headCrossRowNum);
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
        public static MDataTable ReadExcel(IWorkbook workbook, int sheetIndex, bool isMergedCellName, Stream stream = null, int startIndex = 0, int headCrossRowNum = 0)
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
                        dt.Conn = dt.Columns.Count.ToString();//找个变量存储实际的列的长度，在SetError中使用。（dt可能在SetError前列被变更)
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
                        for (int j = 0; j < excelRow.Cells.Count; j++)
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
                    if (!int.TryParse(dt.Conn, out cellCount))
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

        public static void CreateValidationSheet(IWorkbook export, Dictionary<string, string[]> validateData, int rowStartIndex)
        {
            rowStartIndex = 0;
            //  Dictionary<string, string> refDic = new Dictionary<string, string>();    
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
                string title = IntToMoreChar(cellIndex);
                //char c = (char)(cellIndex + 65);
                range.RefersToFormula = string.Format("Sheet2!${0}${1}:${0}${2}", title, rowStartIndex + 1, items.Value.Length + rowStartIndex);
                range.NameName = items.Key.Split('=')[0].Replace("#", "");
                // range.NameName = "V" + c;// items.Key.Replace("#", "V");// "v" + items.Key.GetHashCode();// "aa" + items.Key.Length;// 
                // refDic.Add(items.Key, range.NameName);
                ////处理数据的有效性
                //CellRangeAddressList regions = new CellRangeAddressList(rowStartIndex, items.Value.Length + rowStartIndex, cellIndex, cellIndex);
                //DVConstraint constraint = DVConstraint.CreateFormulaListConstraint(range.NameName);//validateData[formatter]
                //HSSFDataValidation dataValidate = new HSSFDataValidation(regions, constraint);
                //workSheet.AddValidationData(dataValidate);

                cellIndex++;
            }
            // return refDic;
        }

        /// <summary>
        /// 构造excel多级表头
        /// </summary>
        public static void CreateMulHeadExcel(IWorkbook export, MDataTable dtPbGrid, out int ColTitleCount, int colSum)
        {
            ISheet sheet = export.GetSheet("Sheet1");//创建内存Excel
            ICellStyle style = GetStyle(export, HSSFColor.LightOrange.Index);
            //
            //MDataTable dtPbGrid = dt.DynamicData as MDataTable;
            //dtPbGrid.Select("Hidden=0 AND Export=1 ORDER BY MergeIndexed DESC");//Export=1
            ColTitleCount = Convert.ToInt32(dtPbGrid.Rows[0]["MergeIndexed"].Value);//合并行数

            dtPbGrid.Rows.Sort("ORDER BY OrderNum ASC");

            Dictionary<MDataRow, int> dic = FixRowIndex(dtPbGrid);
            IRow r;
            ICell cel;
            for (int c = 0; c < ColTitleCount; c++)
            {
                r = sheet.CreateRow(c);
                for (int d = 0; d < colSum; d++)//dtPbGrid.Rows.Count
                {
                    cel = r.CreateCell(d);
                    cel.CellStyle = style;
                }
            }
            MergedRowAndCol(dtPbGrid, dic, export, ColTitleCount);
        }
        /// <summary>
        /// 修正列名排列索引
        /// </summary>
        /// <param name="dtPbGrid"></param>
        /// <returns></returns>
        public static Dictionary<MDataRow, int> FixRowIndex(MDataTable dtPbGrid)
        {
            Dictionary<MDataRow, int> dic = new Dictionary<MDataRow, int>();
            string FieldVal = string.Empty;
            int Colspan = 0;
            int index = -1;
            for (int i = 0; i < dtPbGrid.Rows.Count; i++)
            {
                FieldVal = dtPbGrid.Rows[i]["Field"].Value.ToString();
                Colspan = Convert.ToInt32(dtPbGrid.Rows[i]["Colspan"].Value);

                if (dic.ContainsKey(dtPbGrid.Rows[i]))
                {
                    continue;
                }
                if (FieldVal.StartsWith("mg") && Colspan > 1)
                {
                    if (!dic.ContainsKey(dtPbGrid.Rows[i]))
                    {
                        index += 1;
                        dic.Add(dtPbGrid.Rows[i], index);//加自身
                    }
                    for (int j = 1; j <= Colspan; j++)
                    {
                        if (dtPbGrid.Rows[i + j]["Field"].Value.ToString().StartsWith("mg"))
                        {
                            if (!dic.ContainsKey(dtPbGrid.Rows[i + j]))
                            {
                                dic.Add(dtPbGrid.Rows[i + j], index);
                            }
                        }
                        else
                        {
                            if (!dic.ContainsKey(dtPbGrid.Rows[i + j]))
                            {
                                dic.Add(dtPbGrid.Rows[i + j], index);
                                break;
                            }

                        }
                    }
                }
                else
                {
                    if (!dic.ContainsKey(dtPbGrid.Rows[i]))
                    {
                        index += 1;
                        dic.Add(dtPbGrid.Rows[i], index);

                    }
                }
            }
            return dic;
        }
        /// <summary>
        /// 合并行列
        /// </summary>
        /// <param name="dtPbGrid"></param>
        /// <param name="dic"></param>
        /// <param name="export"></param>
        /// <param name="maxMerge"></param>
        public static void MergedRowAndCol(MDataTable dtPbGrid, Dictionary<MDataRow, int> dic, IWorkbook export, int maxMerge)
        {
            string title = string.Empty;
            ICellStyle style = GetStyle(export, HSSFColor.LightOrange.Index);
            ISheet sheet = export.GetSheet("Sheet1");
            ICell cell;
            IRow row;
            int cellIndex = 0;
            int colspan = 0, merge = 0;
            int dex = 0;
            for (int i = 0; i < dtPbGrid.Rows.Count; i++)
            {
                title = dtPbGrid.Rows[i]["Title"].Value.ToString();
                colspan = Convert.ToInt32(dtPbGrid.Rows[i]["Colspan"].Value);
                merge = Convert.ToInt32(dtPbGrid.Rows[i]["MergeIndexed"].Value);
                cellIndex = i;
                if (dic.ContainsKey(dtPbGrid.Rows[i]))
                {
                    dex = dic[dtPbGrid.Rows[i]];//取索引
                }
                if (!i.Equals(dex))
                {
                    cellIndex = dex;
                }
                int rf = 0, rl = 0, cf = 0, cl = 0;
                row = sheet.GetRow(merge - 1);
                row.Height = 300;
                if (colspan > 1)//跨列
                {
                    rf = merge - 1; rl = merge - 1; cf = cellIndex; cl = cellIndex + colspan - 1;
                }
                else//跨行
                {
                    rf = merge - 1; rl = maxMerge - 1; cf = cellIndex; cl = cellIndex;
                }
                cell = row.GetCell(cellIndex, MissingCellPolicy.CREATE_NULL_AS_BLANK);
                //cell.CellStyle = style;
                cell.SetCellValue(title);
                sheet.SetColumnWidth(cellIndex, 4000);
                sheet.AddMergedRegion(new CellRangeAddress(rf, rl, cf, cl));
            }
        }
        /// <summary>
        /// 索引转换为excel字母列名
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        private static string IntToMoreChar(int value)
        {
            string rtn = string.Empty;
            List<int> iList = new List<int>();

            value += 1;
            while (value / 26 != 0 || value % 26 != 0)
            {
                iList.Add(value % 26);
                value /= 26;
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

        /// <summary>
        /// 是否导出多级表头
        /// </summary>
        /// <param name="gridDt"></param>
        /// <param name="isExportTemplate"></param>
        /// <returns></returns>
        private static bool ExportMulHeader(MDataTable gridDt, bool isExportTemplate)
        {
            MDataTable dt = gridDt.FindAll(isExportTemplate ? "Import=1" : "Export=1");
            return dt.Max<int>("MergeIndexed") != dt.Min<int>("MergeIndexed");
            #region 原来逻辑
            /*
            bool ifHidden = false, ifImport = false, ifExport = false, ifRowspan = false, ifColspan = false, ifMergeIndexed = false;
            for (int i = 1; i < gridDt.Rows.Count; i++)
            {
                ifHidden = gridDt.Rows[i].Get<bool>("Hidden");
                ifImport = gridDt.Rows[i].Get<bool>("Import");
                ifExport = gridDt.Rows[i].Get<bool>("Export");
                ifRowspan = gridDt.Rows[i].Get<bool>("Rowspan");
                ifColspan = gridDt.Rows[i].Get<bool>("Colspan");
                ifMergeIndexed = gridDt.Rows[i].Get<bool>("MergeIndexed");
                if (isExportTemplate)//导出模版
                {
                    if (ifHidden && !ifImport)
                    {
                        if (ifRowspan && ifColspan && ifMergeIndexed)
                        {
                            continue;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
                else//导出数据
                {
                    if (ifHidden && !ifExport)
                    {
                        if (ifRowspan && ifColspan && ifMergeIndexed)
                        {
                            continue;
                        }
                        else
                        {
                            return false;
                        }
                    }
                }
            }
            return true;
            */
            #endregion
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
