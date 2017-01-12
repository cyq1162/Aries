using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Aries.Core.Config
{
    /// <summary>
    /// 中文常量
    /// </summary>
    internal partial class LangConst
    {
        //UserAuth.cs
        public const string PwdExpired = "账号密码已过期！";
        public const string PwdError = "用户名或密码错误！";
        public const string UserNotExists = "账号不存在！";
        public const string Admin = "普通管理员";
        public const string SuperAdmin = "超级管理员";

        //Controller.cs
        public const string AddError = "添加失败！";
        public const string DelSuccess = "删除成功！";
        public const string DelError = "删除失败！";
        public const string UpdateSuccess = "更新成功！";
        public const string UpdateError = "更新失败！";
        public const string SaveSuccess = "保存成功！";
        public const string SaveError = "保存失败！";
        public const string ImportSuccess = "导入成功！";
        public const string ImportError = "导入失败！";
        public const string ImportTemplateNotMatch = "（PS：可能模板不匹配）";
        public const string ImportCheckErrorInfo = "(请查看输出的Excel错误信息)";
        public const string ImportCheckTemplateIsRight = "（请检测是否模板错误）";
        public const string ErrorInfo = "错误信息";

        //ExcelConfig.cs
        public const string CantBeEmpty = "不允许为空。";
        public const string SizeOver = "长度超过";
        public const string DataTypeError = "数据类型错误";
        public const string The = "第";
        public const string Row = "行数据";

        //GridConfig.cs
        public const string IsYesNo = "是否";
        //KeyValueConfig.cs
        public const string TableDescription = "表名描述";
        public const string NoMatchItem = "找不到对应项";

        //SQLCode.cs
        public const string Exist = "已存在！";

        //ExcelHelper.cs
        public const string ColumnNameIsEmpty = "该列头为空";
    }
}
