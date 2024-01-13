using System;
using System.Collections.Generic;
using CYQ.Data;
using System.Text;
using Aries.Core.Auth;
using Aries.Core.Extend;
using Gemini.Workflow;
using Aries.Core.Helper;
using System.Web;
using CYQ.Data.Tool;
using System.IO;
using CYQ.Data.Xml;
using System.Text.RegularExpressions;
using Gemini.Workflow.Enums;
using System.Xml.Linq;
using Gemini.Workflow.Entity;
using CYQ.Data.Json;
namespace Workflow.Controllers
{
    /// <summary>
    /// 流程导入导出
    /// </summary>
    public partial class DefinitionController : Aries.Core.Controller
    {

        #region 导出XML，导入XML
        public void DownloadWorkflowXmlFile()
        {

            string xml = WF.Desiger.GetXml(new Guid(GetID));
            WebHelper.SendFile(Query<string>("workflowName") + ".xml", xml);


        }
        //上传导入
        public void ImportWorkflowXmlFile()
        {
            HttpRequest request = HttpContext.Current.Request;
            if (request.Files.Count > 0)
            {
                try
                {

                    HttpPostedFile postFile = request.Files[0];
                    String fileExtension = System.IO.Path.GetExtension(postFile.FileName).ToLower();
                    if (fileExtension.ToLower() != ".xml")
                    {
                        jsonResult = JsonHelper.OutResult(false, "上传的XML文件格式不正确,请重新上传");
                        return;
                    }
                    Stream stream = postFile.InputStream;
                    if (stream != null && stream.Length > 0)
                    {
                        Byte[] bytes = new Byte[stream.Length];
                        stream.Read(bytes, 0, bytes.Length);
                        string xmlContent = System.Text.Encoding.UTF8.GetString(bytes);
                        DeployType deployType = (DeployType)Query<int>("DeployType");
                        string msg;
                        bool success = WF.Deploy.Save(xmlContent, deployType, out msg);
                        jsonResult = JsonHelper.OutResult(success, success ? "导入成功" : msg);

                    }
                }
                catch (Exception ex)
                {
                    jsonResult = JsonHelper.OutResult(false, "导入失败");
                    Log.WriteLogToTxt(ex);
                    return;
                }
            }
            else
            {
                jsonResult = JsonHelper.OutResult(false, "请上传工作流定义Xml文件");
            }
        }
        #endregion


    }
}
