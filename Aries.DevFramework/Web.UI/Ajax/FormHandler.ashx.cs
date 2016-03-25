using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using Web.Core;
using CYQ.Data.Table;
using CYQ.Data.Tool;

namespace Web.UI.Ajax
{
    /// <summary>
    /// FormHandler 的摘要说明
    /// </summary>
    public class FormHandler : AjaxBase
    {
        /// <summary>
        /// 获取数据
        /// </summary>
        /// <param name="context"></param>
        public void GetFromList()
        {
            //
            // ObjName
            string tableNames = Query<string>("objName");

            if (string.IsNullOrEmpty(tableNames))
            {
                HttpContext.Current.Response.Write("请输入表名！");
                HttpContext.Current.Response.End();
                return;
            }
            string[] temp = tableNames.Trim(',').Split(',');

            MDataTable dt = new MDataTable();

            foreach (string tableName in temp)
            {
                using (CreateFromConfig config = new CreateFromConfig())
                {
                    dt = config.Select("TbName='" + tableName + "'");

                    if ((dt == null || dt.Rows.Count == 0))
                    {
                        if (!tableName.StartsWith("V_"))
                        {
                            #region 如果没有数据创建文件数据库

                            MDataColumn mdc = CYQ.Data.Tool.DBTool.GetColumns(tableName, null);
                            if (mdc == null || mdc.Count == 0)
                            {
                                continue;
                            }

                            if (dt == null || dt.Rows.Count == 0)
                            {
                                config.Delete("TbName <> '" + tableName + "'");
                                int i = 1;
                                foreach (var item in mdc)
                                {
                                    config.TbName = tableName;
                                    config.Field = item.ColumnName;
                                    config.Title = string.IsNullOrEmpty(item.Description) ? item.ColumnName : item.Description;
                                    if (item.ColumnName.ToLower().Equals("sex") || item.ColumnName.ToLower().Contains("status") || item.ColumnName.ToLower().Contains("type"))
                                    {
                                        config.DescripType = "combox";
                                    }
                                    else
                                    {
                                        config.DescripType = "text";
                                    }
                                    config.IsCanNull = item.IsCanNull;

                                    if (item.ColumnName.ToLower().Equals("createtime") || item.IsAutoIncrement || item.ColumnName.ToLower().Equals("createuser") || item.ColumnName.ToLower().Equals("lastedittime") || item.ColumnName.ToLower().Equals("lastedit") || item.ColumnName.ToLower().Equals("lastedituser"))
                                    {
                                        config.Sortable = true;
                                    }
                                    else
                                    {
                                        config.Sortable = false;
                                    }
                                    config.IsRead = false;

                                    if (item.ColumnName.ToLower().Equals("sex"))
                                    {
                                        config.ViewName = "#性别";
                                    }
                                    else
                                    {
                                        config.ViewName = string.Empty;
                                    }
                                    if (item.ColumnName.ToLower().Equals("email"))
                                    {
                                        config.Validtype = "email";
                                    }
                                    else
                                    {
                                        config.Validtype = string.Empty;
                                    }
                                    if (item.ColumnName.ToLower().Contains("time"))
                                    {
                                        config.Style = "easyui-datetimebox";
                                    }
                                    else if (config.DescripType == "combox")
                                    {
                                        config.Style = string.Empty;
                                    }
                                    else if (item.ColumnName.ToLower().Contains("businesskey") || item.ColumnName.ToLower().Contains("file"))
                                    {
                                        config.Style = "easyui-filebox";
                                    }
                                    else
                                    {
                                        config.Style = "easyui-validatebox";
                                    }

                                    config.OrderNum = i++;
                                    if (config.Exists("Field=" + config.Field + " AND TbName='" + tableName + "'"))
                                        config.Update("Field=" + config.Field + " AND TbName='" + tableName + "'");
                                    else
                                    {
                                        bool res = config.Insert();
                                    }

                                }
                                dt = config.Select("TbName='" + tableName + "'");
                            }
                            #endregion
                        }
                        else
                        {
                            #region  如果有数据将数据表中的数据 保存至文件数据库中

                            dt = GridConfig.GetList(tableName, GridConfig.SelectType.All);
                            int i = 1;
                            foreach (MDataRow dr in dt.Rows)
                            {
                                config.TbName = dr["TableName"].ToString();
                                string field = dr["Field"].ToString();
                                config.Field = field;
                                config.Title = string.IsNullOrEmpty(dr["Title"].ToString()) ? field : dr["Title"].ToString();

                                config.Sortable = Convert.ToBoolean(dr["Hidden"].ToString());

                                if (dr["Formatter"] != null && !string.IsNullOrEmpty(Convert.ToString(dr["Formatter"])) && Convert.ToString(dr["Formatter"]).StartsWith("#"))
                                {
                                    config.DescripType = "combox";
                                }
                                else if (field.ToLower().Equals("sex") || field.ToLower().Contains("status") || field.ToLower().Contains("type"))
                                {
                                    config.DescripType = "combox";
                                }
                                else
                                {
                                    config.DescripType = "text";
                                }
                                if (dr["Formatter"] != null && !string.IsNullOrEmpty(Convert.ToString(dr["Formatter"])) && Convert.ToString(dr["Formatter"]).StartsWith("#"))
                                {
                                    config.ViewName = Convert.ToString(dr["Formatter"]);
                                }
                                else
                                {
                                    config.ViewName = string.Empty;
                                }

                                if (field.ToLower().Equals("email"))
                                {
                                    config.Validtype = "email";
                                }
                                else
                                {
                                    config.Validtype = string.Empty;
                                }
                                if (field.ToLower().Contains("time"))
                                {
                                    config.Style = "easyui-datetimebox";
                                }
                                else
                                {
                                    config.Style = "easyui-validatebox";
                                }

                                config.IsCanNull = true;

                                if (field.ToLower().Equals("createtime"))
                                {
                                    config.Sortable = true;
                                }
                                else
                                {
                                    config.Sortable = false;
                                }
                                config.OrderNum = i++;

                                if (config.Exists("Field=" + config.Field + " AND TbName='" + tableName + "'"))
                                    config.Update("Field=" + config.Field + " AND TbName='" + tableName + "'");
                                else
                                {
                                    bool res = config.Insert();
                                }
                            }

                            dt = config.Select("TbName='" + tableName + "'");

                            #endregion
                        }
                    }
                }

                jsonResult = dt.ToJson();// Write(dt.ToJson());

            }
        }


        public void UpdateFrom()
        {
            using (CreateFromConfig config = new CreateFromConfig())
            {
                config.ID = Query<int>("ID");
                bool result;
                int id = config.ID;

                if (id == 0)
                {
                    string objName = Query<string>("objName");
                    MDataTable dt = config.Select(1, "TbName='" + objName + "' ORDER BY ID DESC");
                    id = Convert.ToInt32(dt.Rows[0]["ID"].ToString());
                    config.ID = id + 1;
                    result = config.Insert(true);
                }
                else
                {
                    result = config.Update("ID=" + id, true);
                }
                if (result)
                    jsonResult =JsonHelper.OutResult(true, (id > 0 ? "修改成功！" : "添加成功！"));
                else
                    jsonResult =JsonHelper.OutResult(false, (id > 0 ? "修改失败！" : "添加失败！"));
            }
        }

        /// <summary>
        /// 生成代码
        /// </summary>
        public void CreateFrom()
        {
            string path = "/Tools/FromDemo.html";
            string url = GetMapPath(path);
            string result = GetRequestPost(url);

            string strWeb = string.Empty;
            if (!string.IsNullOrEmpty(result))
            {
                string startHtml = "<body>";
                string endHtml = "</body>";

                int startIndex = result.IndexOf(startHtml);
                int endIndex = result.IndexOf(endHtml);

                strWeb = result.Substring(startIndex + startHtml.Length, endIndex - startIndex - startHtml.Length);
            }


            CreateFromConfig config = new CreateFromConfig();
            string tableName = Query<string>("objName");
            MDataTable dt = config.Select("TbName='" + tableName + "' ORDER BY OrderNum");

            StringBuilder sb = new StringBuilder();

            #region 主体部位
            int n = -1;
            if (dt != null && dt.Rows.Count > 0)
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    n++;
                    MDataRow dr = dt.Rows[i];
                    if (!Convert.ToBoolean(dr["Sortable"].ToString()))
                    {
                        if (n == 0 || n % 3 == 0)
                        {
                            sb.AppendLine(" <div class=\"line\">");
                        }

                        sb.AppendLine("<div class=\"short\">");
                        sb.AppendLine("  <label>");
                        if (!Convert.ToBoolean(dr["IsCanNull"].ToString()))
                        {
                            sb.Append("<em>*</em>");
                        }
                        sb.Append(dr["Title"].ToString() + "：");
                        sb.Append("</label>");

                        switch (dr["DescripType"].ToString())
                        {
                            case "text":
                                sb.AppendLine("<input name=\"" + dr["Field"].ToString() + "\" id=\"" + dr["Field"].ToString() + "\" missingmessage=\"\"");
                                if (!Convert.ToBoolean(dr["IsCanNull"].ToString()))
                                {
                                    sb.Append("required='true'");
                                }
                                sb.Append("class=\"" + dr["Style"].ToString() + "\"");
                                if (dr["Validtype"] != null && !string.IsNullOrEmpty(dr["Validtype"].ToString()))
                                {
                                    sb.Append("validtype='" + dr["Validtype"] + "'");
                                }
                                sb.Append(" />");
                                break;
                            case "combox":
                                sb.AppendLine("<input name=\"" + dr["Field"].ToString() + "\" id=\"" + dr["Field"].ToString() + "\"");
                                if (dr["ViewName"].ToString().StartsWith("#C_"))
                                {
                                    sb.AppendLine("objname=\"" + dr["ViewName"].ToString().TrimStart('#') + "\" />");
                                }
                                else if (dr["ViewName"].ToString().StartsWith("#"))
                                {
                                    sb.AppendLine("configkey=\"" + dr["ViewName"].ToString().TrimStart('#') + "\"");
                                }
                                sb.Append(" />");
                                break;
                        }
                        sb.AppendLine("</div>");

                        if (n == 0 || n % 3 == 0)
                        {
                            sb.AppendLine(" </div>");
                        }
                    }
                    else
                        n = n - 1;
                }

            }
            #endregion

            strWeb = strWeb.Replace("[##Demo]", sb.ToString());

            System.Web.HttpContext.Current.Response.Write(strWeb);
            System.Web.HttpContext.Current.Response.End();
        }

        public void DeleteFrom()
        {
            using (CreateFromConfig config = new CreateFromConfig())
            {
                config.ID = Query<int>("ID");
                bool result;
                int id = config.ID;
                result = config.Delete("ID=" + id);

                jsonResult = JsonHelper.OutResult(result, (result ? "删除成功！" : "删除失败！"));

            }
        }

        /// <summary>
        /// 获取或者发送请求
        /// </summary>
        /// <param name="url">url</param>
        /// <param name="parameters">参数</param>
        /// <returns>获取到的字符串</returns>
        public static string GetRequestPost(string url)
        {
            return FileExtend.ReadAllText(url);
            //string sRslt = null;
            //WebResponse oWebRps = null;
            //WebRequest oWebRqst = WebRequest.Create(url);
            //oWebRqst.Timeout = 50000;
            //try
            //{
            //    oWebRps = oWebRqst.GetResponse();
            //}
            //catch
            //{ }
            //finally
            //{
            //    if (oWebRps != null)
            //    {
            //        StreamReader oStreamRd = new StreamReader(oWebRps.GetResponseStream(), Encoding.GetEncoding("UTF-8"));
            //        sRslt = oStreamRd.ReadToEnd();
            //        oStreamRd.Close();
            //        oWebRps.Close();
            //    }
            //}
            //return sRslt;
        }



        #region 返回文件路径
        /// <summary>
        /// 返回文件路径
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        private string GetMapPath(string path)
        {
            return HttpContext.Current.Server.MapPath(path);
        }
        #endregion
    }
}