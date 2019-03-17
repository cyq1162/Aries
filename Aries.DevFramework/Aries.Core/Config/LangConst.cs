using Aries.Core.Auth;
using CYQ.Data;
using CYQ.Data.Table;
using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;

namespace Aries.Core.Config
{
    /// <summary>
    /// 中文常量 (使用静态变量，是考虑到多做多语言时，可以在运行时拦截，动态修改文字为英文版本)
    /// </summary>
    public static partial class LangConst
    {
        public static string Language = "zh_CN";

        //UserAuth.cs
        public static string PasswordExpired = "账号密码已过期！";
        public static string PasswordError = "用户名或密码错误！";
        public static string UserNotExists = "账号不存在！";
        public static string Admin = "普通管理员";
        public static string SuperAdmin = "超级管理员";

        //Controller.cs
        public static string AddSuccess = "添加成功！";
        public static string AddError = "添加失败！";
        public static string DeleteSuccess = "删除成功！";
        public static string DeleteError = "删除失败！";
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

        //WebHelper.cs
        public static string KeyB = "Aries.lic.result";
    }

    public static partial class LangConst
    {
        private static FileSystemWatcher fyw = new FileSystemWatcher();
        static LangConst()
        {

            fyw.Changed += fyw_Changed;
            fyw.NotifyFilter = NotifyFilters.CreationTime | NotifyFilters.LastWrite | NotifyFilters.Size;
            InitKeyValue();
        }

        static void fyw_Changed(object sender, FileSystemEventArgs e)
        {
            fyw.EnableRaisingEvents = false;
            InitKeyValue();
        }

        public static Dictionary<string, string> csLangs = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        public static Dictionary<string, string> htmlLangs = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        private static void getConfig(out string theme, out string language)
        {
            theme = "default";
            language = "zh_CN";
            MDataTable dt = KeyValueConfig.KeyValueTable.Select("ConfigKey='SysConfig'");
            if (dt != null && dt.Rows.Count > 0)
            {
                MDataRow themeRow = dt.FindRow("ConfigName='Theme'");
                if (themeRow != null) { theme = themeRow.Get<string>("ConfigValue"); }

                MDataRow langRow = dt.FindRow("ConfigName='Language'");
                if (langRow != null) { language = langRow.Get<string>("ConfigValue"); }

            }
            //检测样式主题是否存在：
            if (!Directory.Exists(AppConfig.WebRootPath + "Style/Theme/Aries/" + theme))
            {
                theme = "default";
                //更新配置设置回Aries默认样式
                KeyValueConfig.SetVallue("SysConfig", "Theme", theme);
            }
            if (language != "zh_CN" && language != "en")
            {
                language = "zh_CN";
                KeyValueConfig.SetVallue("SysConfig", "Language", language);
            }
            //SetCookie
            UserAuth.SetCookie("theme", theme, 48);
            UserAuth.SetCookie("language", language, 48);
        }
        /// <summary>
        /// 初始化多语言
        /// </summary>
        public static void InitKeyValue()
        {

            string theme, language;
            getConfig(out theme, out language);

            string pathTemp = AppConfig.WebRootPath + "Style/Theme/Aries/{0}/locale/{1}.Lang-{2}.js";

            //---处理前端
            string path = string.Format(pathTemp, theme, "Html", language);
            if (theme != "default" && !File.Exists(path))
            {
                theme = "default";//切换到默认语言
                path = string.Format(pathTemp, theme, "Html", language);
            }
            InitLangDic(htmlLangs, path, "Html.Lang.");

            //---处理后端
            path = string.Format(pathTemp, theme, "CS", language);

            InitLangDic(csLangs, path, "CS.Lang.");

            if (Language != language)
            {
                #region 处理后端代码的中英文：替换值
                Type t = typeof(LangConst);//将中文设置为英文字段名
                FieldInfo[] fields = t.GetFields(BindingFlags.Static | BindingFlags.Public);
                if (fields != null && fields.Length > 0)
                {
                    foreach (FieldInfo item in fields)
                    {
                        if (item.FieldType.Name == "String")
                        {
                            if (csLangs.ContainsKey(item.Name))
                            {
                                string itemOldValue = item.GetValue(null).ToString();
                                item.SetValue(null, csLangs[item.Name]);
                                csLangs[item.Name] = itemOldValue;//切换语言，以便下次还原。

                            }
                            else //第一次
                            {
                                if (!csLangs.ContainsKey(item.Name))
                                {
                                    csLangs.Add(item.Name, item.GetValue(null).ToString());//存档中文，以便下次还原。
                                }
                                item.SetValue(null, item.Name);
                            }
                        }
                    }
                }
                #endregion

                Language = language;//将字段值还原。
            }



            fyw.Path = AppConfig.WebRootPath + "Style/Theme/Aries/" + theme + "/locale";
            fyw.EnableRaisingEvents = true;
        }
        private static void InitLangDic(Dictionary<string, string> dic, string path, string replaceKey)
        {
            if (File.Exists(path))
            {
                dic.Clear();
                #region 处理前端页面的中英文：读取配置的语言（Html.Lang)

                string[] items = File.ReadAllLines(path);
                if (items != null && items.Length > 0)
                {
                    string key, value;
                    foreach (string item in items)
                    {
                        if (item.IndexOf(replaceKey) > -1)
                        {
                            string[] kv = item.Split('=');
                            if (kv.Length > 1)
                            {
                                key = kv[0].Replace(replaceKey, "").Trim();
                                value = kv[1].Trim(' ', ';', '"', '\'');
                                if (!dic.ContainsKey(key))
                                {
                                    dic.Add(key, value);
                                }
                            }
                        }
                    }
                }
                #endregion
            }
        }
        /// <summary>
        /// 替换页面标签
        /// </summary>
        public static string ReplateHtmlLanguage(string html)
        {
            MatchCollection matchs = Regex.Matches(html, @"\$\{([\S\s]*?)\}", RegexOptions.Compiled | RegexOptions.IgnoreCase);
            if (matchs != null && matchs.Count > 0)
            {
                foreach (Match match in matchs)
                {
                    if (match.Groups.Count > 1)
                    {
                        string value = match.Groups[0].Value;
                        string key = match.Groups[1].Value;
                        string replace = "";
                        if (htmlLangs.ContainsKey(key))
                        {
                            replace = htmlLangs[key];
                        }
                        html = html.Replace(value, replace);
                    }
                }

            }
            matchs = null;
            return html;
        }

    }
}
