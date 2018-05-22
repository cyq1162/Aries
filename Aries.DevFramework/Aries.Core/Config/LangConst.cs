using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aries.Core.Config
{
    /// <summary>
    /// 中文常量 (使用静态变量，是考虑到多做多语言时，可以在运行时拦截，动态修改文字为英文版本)
    /// </summary>
    public partial class LangConst
    {
        //UserAuth.cs
        public static string PwdExpired = "账号密码已过期！";
        public static string PwdError = "用户名或密码错误！";
        public static string UserNotExists = "账号不存在！";
        public static string Admin = "普通管理员";
        public static string SuperAdmin = "超级管理员";

        //Controller.cs
        public static string AddSuccess = "添加成功！";
        public static string AddError = "添加失败！";
        public static string DelSuccess = "删除成功！";
        public static string DelError = "删除失败！";
        public static string UpdateSuccess = "更新成功！";
        public static string UpdateError = "更新失败！";
        public static string SaveSuccess = "保存成功！";
        public static string SaveError = "保存失败！";
        public static string ImportSuccess = "导入成功！";
        public static string ImportError = "导入失败！";
        public static string ImportTemplateNotMatch = "（PS：可能模板不匹配）";
        public static string ImportCheckErrorInfo = "(请查看输出的Excel错误信息)";
        public static string ImportCheckTemplateIsRight = "（请检测是否模板错误）";
        public static string ErrorInfo = "错误信息";

        //ExcelConfig.cs
        public static string CantBeEmpty = "不允许为空。";
        public static string SizeOver = "长度超过";
        public static string DataTypeError = "数据类型错误";
        public static string The = "第";
        public static string Row = "行数据";
        public static string NoNewColumn = "未发现有新增列";

        //GridConfig.cs
        public static string IsYesNo = "是否";
        //KeyValueConfig.cs
        public static string TableDescription = "表名描述";
        public static string NoMatchItem = "找不到对应项";

        //SQLCode.cs
        public static string Exist = "已存在！";
        public static string HasFiles = "该文件夹下存在文件！";

        //ExcelHelper.cs
        public static string ColumnNameIsEmpty = "该列头为空";
    }
}
