using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Web.Core;
using CYQ.Data;
using CYQ.Data.Table;
using Web.Utility.ADHelper;
using Web.Utility;
using System.Threading;
using CYQ.Data.Tool;


namespace Web.UI.Ajax
{
    /// <summary>
    /// FileUpload 的摘要说明
    /// </summary>
    public class FileUpload : AjaxBase
    {
        /// <summary>
        /// 传过来的加密参数
        /// </summary>
        protected string _Params;
        public string Params
        {
            get
            {
                if (_Params == null)
                {
                    _Params = HttpContext.Current.Request["Params"] ?? string.Empty;
                    if (!string.IsNullOrWhiteSpace(_Params))
                    {
                        _Params = EncrpytHelper.Decrypt(_Params);
                    }
                }
                return _Params;
            }
        }

        /// <summary>
        /// 每个文件上传时父页面调用js方法返回的数据
        /// </summary>
        public string UploadFileID
        {
            get
            {
                return HttpContext.Current.Request["fielID"] ?? string.Empty;
            }
        }
        /// <summary>
        /// 获取文件id
        /// </summary>
        /// <returns></returns>
        public string GetFileID()
        {
            string fileId = UploadFileID;
            if (string.IsNullOrWhiteSpace(fileId))
                fileId = Guid.NewGuid().ToString();
            return fileId;
        }

        public void FileDelete()
        {
            MDataTable tb = null;
            using (MAction action = new MAction(ObjCode))
            {
                var primarykey = action.Data.PrimaryCell.ColumnName;
                string where = string.IsNullOrEmpty(GetID) ? GetWhere() : string.Format("{0} in ({1})", primarykey, GetID.ToString());
                action.SetSelectColumns("FilePath");
                tb = action.Select(where);
                if (tb.Rows.Count > 0)
                {
                    foreach (MDataRow row in tb.Rows)
                    {
                        string filePath=row.Get<string>("FilePath");
                        try
                        {
                            string path = Path.Combine(FileHelper.Instance.ShareRootPath, filePath);
                            if (FileIdentityFactory.GetCurFileManager().FileExist(path))
                            {
                                FileIdentityFactory.GetCurFileManager().DeleteFile(path);
                            }
                            if (FileManager.JudgeImageFileForName(path))
                            {
                                //删除缩略图
                                string _thumbPath = Path.Combine(Path.GetDirectoryName(filePath), "thumb/") + Path.GetFileName(filePath);
                                path = Path.Combine(FileHelper.Instance.ShareRootPath, _thumbPath);
                                if (FileIdentityFactory.GetCurFileManager().FileExist(path))
                                {
                                    FileIdentityFactory.GetCurFileManager().DeleteFile(path);
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            where = where.Replace(filePath, "");
                            continue;
                        }
                    }
                }
                if (action.Delete(where))
                {
                    jsonResult = JsonHelper.OutResult(true, "删除成功！");
                }
                else
                {
                    if (AppDebug.OpenDebugInfo)
                    {
                        Log.WriteLogToTxt(action.DebugInfo);
                    }
                    jsonResult = JsonHelper.OutResult(false, "删除失败！");
                }
            }
        }

        /// <summary>
        /// 下载文件
        /// </summary>
        public void DownLoadFiles()
        {
            var ids = Query<string>("ids");
            string[] ids_Arr = ids.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
            if (ids_Arr.Length == 1)
            {
                string filePath = null, fileName = null;
                using (MAction action = new MAction("PB_File"))
                {
                    if (action.Fill(string.Format("FileID = {0}", ids)))
                    {
                        filePath = Path.Combine(FileHelper.Instance.ShareRootPath, action.Get("FilePath", string.Empty));
                        fileName = action.Get("FileName", string.Empty);
                    }
                }
                if (File.Exists(filePath))
                {
                    FileIdentityFactory.GetCurFileManager().DownloadFile(fileName, filePath);
                }
                else
                {
                    string result = "<script>alert('下载失败，服务器文件已丢失...')</script>";
                    //string result = JsonHelper.OutResult(false, "文件不存在！");
                    System.Web.HttpContext.Current.Response.Write(result);
                }
            }
            else //多个则打包下载
            {
                List<string> listFilePath = new List<string>();
                MDataTable tb = null;
                using (MAction action = new MAction("PB_File"))
                {
                    tb = action.Select(string.Format("FileID in ({0})", ids));
                }
                if (tb.Rows.Count > 0)
                {
                    string filePath = string.Empty;
                    foreach (MDataRow row in tb.Rows)
                    {
                        try
                        {
                            filePath = Path.Combine(FileHelper.Instance.ShareRootPath, row["FilePath"].ToString().Replace(" ", @"\ "));
                            
                        }
                        catch
                        {
                           filePath =Path.Combine(HttpContext.Current.Server.MapPath(FileHelper.Instance.ShareRootPath), row["FilePath"].ToString().Replace(" ", @"\ "));
                        }
                        if (File.Exists(filePath))
                        {
                            listFilePath.Add(filePath);
                        }
                    }
                }
                if (listFilePath.Count > 0)
                {
                    DateTime now = DateTime.Now;
                    string rarDirectory = Path.Combine(HttpContext.Current.Server.MapPath(FileHelper.Instance.GetWebTempPath()), now.ToString("yyyyMM"));
                    if (!Directory.Exists(rarDirectory))
                    {
                        Directory.CreateDirectory(rarDirectory);
                    }
                    string rarFilePath = Path.Combine(rarDirectory, now.ToString("yyyyMMddHHmmssfff") + ".zip");
                    SharpZipLibHelper.ZipFileByWinRar(listFilePath.ToArray(), rarFilePath);
                    FileIdentityFactory.GetCurFileManager().DownLoadFileForNotIdentity(Path.GetFileName(rarFilePath), rarFilePath);
                    File.Delete(rarFilePath);
                }
                else
                {
                    string result = "<script>alert('下载失败，服务器文件已丢失...')</script>";
                    System.Web.HttpContext.Current.Response.Write(result);
                }
            }
            System.Web.HttpContext.Current.Response.End();
        }
        /// <summary>
        /// 上传文件
        /// </summary>
        public void UploadFiles()
        {
            try
            {
                var businesskey = Query<string>("BusinessKey");
                if (string.IsNullOrWhiteSpace(businesskey))
                {
                    JsonHelper jh = new JsonHelper();
                    jh.Add("errCode", "uploadError");
                    jh.Add("errDes", "业务主键为空，文件上传失败！");
                    jsonResult = jh.ToString();
                    return;
                }
                //全部返回正确，这样才能自定义错误信息
                HttpPostedFile uploadFile = HttpContext.Current.Request.Files["Filedata"];
                string fileName = uploadFile.FileName;
                string msg = null;
                var Response = HttpContext.Current.Response;
                using (MAction action = new MAction("PB_File"))
                {
                    string saveFileName = Path.GetFileName(fileName.Replace(" ", ""));
                    //RelaPath=站点文件/专业/工期/分公司/逻辑站点ID_站点名称/文件类型
                    string FullFileName = Path.Combine(Query<string>("RelaPath"), (Path.GetFileNameWithoutExtension(saveFileName) + "_" + DateTime.Now.ToString("yyMMddHHmmssfff") + Path.GetExtension(fileName)));//存的是相对路径
                    if (FullFileName.StartsWith("\\") || FullFileName.StartsWith("/"))
                        FullFileName = FullFileName.Substring(1);
                    //FullFileName=站点文件/专业/工期/分公司/逻辑站点ID_站点名称/文件类型\yumi_131228152405578.ico  
                    var fileSize = (uploadFile.ContentLength / 1024);
                    #region 设置属性
                    action.AllowInsertID = true;
                    action.Set("FileID", GetFileID());
                    action.Set("FileName", saveFileName);
                    action.Set("FilePath", FullFileName);
                    action.Set("FileSize", fileSize);
                    action.Set("FileTypeID", Query<string>("ddlSub"));
                    action.Set("BusinessKey", businesskey);
                    //action.Set("WFCode", WFCode);
                    //action.Set("StepID", StepID);
                    action.Set("Creator", UserAuth.UserID);
                    action.Set("CreatorName", UserAuth.UserName);
                    action.Set("CreatTime", DateTime.Now);
                    action.Set("FileNote", "");
                    #endregion

                    var isCompressPic = Query<string>("isCompressPic") == "1";
                    try
                    {
                        string savePathName = Path.Combine(FileHelper.Instance.ShareRootPath, FullFileName);
                        string savePath = Path.GetDirectoryName(savePathName);
                        bool exit = FileHelper.CurFileManager.FolderExist(savePath);
                        if (!exit)
                            FileHelper.CurFileManager.CreateFolder(savePath);
                        //压缩图片
                        if (isCompressPic)
                        {
                            if (IsNeedCompressFile(uploadFile))
                            {
                                long c_fileSize = FileHelper.CurFileManager.CompressPicFileAndUploadFile(uploadFile, savePathName, FileHelper.Instance.GetCompressZize(), FileHelper.Instance.GetCompressQuality());
                                fileSize = Convert.ToInt32(c_fileSize / 1024);
                            }
                            else
                                FileHelper.CurFileManager.UploadFile(uploadFile, savePathName);
                        }
                        else
                        {
                            FileHelper.CurFileManager.UploadFile(uploadFile, savePathName);
                        }
                        //如果需要生成缩略图
                        if (FileManager.JudgeImageFile(uploadFile))
                        {
                            Thread t = new Thread(obj =>
                            {
                                string fromPath = obj as string;
                                string thumbPath = Path.Combine(Path.GetDirectoryName(fromPath), "thumb/") + Path.GetFileName(fromPath);
                                string path = Path.GetDirectoryName(thumbPath);
                                if (!FileHelper.CurFileManager.FolderExist(path))
                                    FileHelper.CurFileManager.CreateFolder(path);
                                bool flag = FileIdentityFactory.GetCurFileManager().CurIFileIdentity.Connect(false);
                                if (flag)
                                {
                                    try
                                    {
                                        ImageHelper.GenThumbnail(savePathName, thumbPath, 120, 120);
                                    }
                                    catch (Exception ex)
                                    {
                                        throw ex;
                                    }
                                    finally
                                    {
                                        FileIdentityFactory.GetCurFileManager().CurIFileIdentity.DisConnect();
                                    }
                                }
                            });
                            t.Start(savePathName);
                        }
                        bool result = action.Insert();//没有异常的情况下才插入数据库
                        jsonResult = JsonHelper.OutResult(result, result ? "成功" : action.DebugInfo);
                    }
                    catch (Exception ex)
                    {
                        throw ex;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        #region 上传url,根据参数创建上传的URL路劲
        /// <summary>
        ///返回格式 /Web/Common/Pages/Ty_UploadFiles.aspx?Params=str  ；
        /// </summary>
        /// <param name="displayMode">1: 上传查看模式；2: 查看模式 ；3：上传模式 到时可能还会增加，以Ty_UploadFiles.aspx的后台文件为准</param>
        /// <param name="relaPath">传过来的相对路径，如：站点文件/专业/工期/分公司/逻辑站点ID_站点名称/文件类型</param>
        /// <param name="subFileType">文件类型：配置表读</param>
        /// <param name="businessKey">关联的业务主键</param>
        /// <param name="iframeID">嵌套的IframeID</param>        
        /// <param name="defaultQuery">默认的参数条件</param>
        /// <param name="toBusinessKey">审核的业务主键</param>
        /// <param name="WFCode">流程实例id</param>
        /// <param name="stepID">流程实例步骤</param>
        /// <param name="showDel">是否显示删除按钮；1显示，0不显示；默认显示</param>
        /// <param name="hideCols">要隐藏的列索引；0,1,2,3</param>
        /// <param name="fileData">文件的数据</param>
        /// <param name="theFileData">文件中间表的数据</param>
        /// <param name="allCompleteFunc">当所有文件上传完触发</param>
        /// <param name="oneStartUpload">每个文件上传前触发</param>
        /// <param name="oneEndUpload">每个文件上传完触发</param>
        /// <param name="deleteFunc">删除文件之后触发</param>
        /// <returns></returns>
        public void CreateUploadFileUrl(int displayMode, string relaPath, string subFileType, string businessKey, string iframeID,
            string defaultQuery = null, string toBusinessKey = null, string WFCode = null, string stepID = null, string createID = null, int? showDel = null, string hideCols = null,
            string fileData = null, string theFileData = null, string allCompleteFunc = null, string oneStartUpload = null,
            string oneEndUpload = null, string deleteFunc = null, string reviewComplete = null)
        {
            if (displayMode == 1 || displayMode == 3)
            {
                if (string.IsNullOrWhiteSpace(relaPath) || string.IsNullOrWhiteSpace(subFileType) || string.IsNullOrWhiteSpace(businessKey))
                {
                    throw new Exception("前四个参数必填");
                }
            }
            else
            {
                if (string.IsNullOrWhiteSpace(businessKey))
                {
                    businessKey = Guid.Empty.ToString();
                    //throw new Exception("业务主键必须有");
                }
            }
            var Server = HttpContext.Current.Server;
            StringBuilder sb = new StringBuilder();
            if (showDel != 0)
                showDel = 1;
            //
            #region 拼装QueryString
            sb.Append("DisplayMode=" + displayMode.ToString() + "&RelaPath=" + Server.UrlEncode(relaPath) + "&SubFileType=" + Server.UrlEncode(subFileType) + "&BusinessKey=" + Server.UrlEncode(businessKey) + "&ShowDel=" + Server.UrlEncode(showDel.Value.ToString()) + "");
            if (!string.IsNullOrWhiteSpace(WFCode))
                sb.AppendFormat("&WFCode={0}", Server.UrlEncode(WFCode));
            if (!string.IsNullOrWhiteSpace(stepID))
                sb.AppendFormat("&stepID={0}", Server.UrlEncode(stepID));
            if (!string.IsNullOrWhiteSpace(stepID))
                sb.AppendFormat("&createID={0}", Server.UrlEncode(createID));
            if (!string.IsNullOrWhiteSpace(iframeID))
                sb.AppendFormat("&iframeID={0}", Server.UrlEncode(iframeID));
            if (!string.IsNullOrWhiteSpace(hideCols))
                sb.AppendFormat("&hideCols={0}", Server.UrlEncode(hideCols));
            if (!string.IsNullOrWhiteSpace(fileData))
                sb.AppendFormat("&fileData={0}", Server.UrlEncode(fileData));
            if (!string.IsNullOrWhiteSpace(theFileData))
                sb.AppendFormat("&theFileData={0}", Server.UrlEncode(theFileData));
            if (!string.IsNullOrWhiteSpace(allCompleteFunc))
                sb.AppendFormat("&AllCompleteFunc={0}", Server.UrlEncode(allCompleteFunc));
            if (!string.IsNullOrWhiteSpace(oneStartUpload))
                sb.AppendFormat("&oneStartUpload={0}", Server.UrlEncode(oneStartUpload));
            if (!string.IsNullOrWhiteSpace(oneEndUpload))
                sb.AppendFormat("&oneEndUpload={0}", Server.UrlEncode(oneEndUpload));
            if (!string.IsNullOrWhiteSpace(deleteFunc))
                sb.AppendFormat("&deleteFunc={0}", Server.UrlEncode(deleteFunc));
            if (!string.IsNullOrWhiteSpace(defaultQuery))
                sb.AppendFormat("&defaultQuery={0}", Server.UrlEncode(defaultQuery));
            if (!string.IsNullOrWhiteSpace(toBusinessKey))
                sb.AppendFormat("&toBusinessKey={0}", Server.UrlEncode(toBusinessKey));
            if (!string.IsNullOrWhiteSpace(reviewComplete))
                sb.AppendFormat("&reviewComplete={0}", Server.UrlEncode(reviewComplete));

            #endregion

            if (!string.IsNullOrWhiteSpace(defaultQuery))
            {
                sb.Append(defaultQuery);
            }
            string par = EncrpytHelper.Encrypt(sb.ToString());
            par = HttpUtility.UrlEncode(par);
            jsonResult = "/Web/Common/Pages/Ty_UploadFiles.aspx?Params=" + par;
        }
        #endregion

        /// <summary>
        /// 是否需要压缩文件
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public bool IsNeedCompressFile(HttpPostedFile file)
        {
            if (FileManager.JudgeImageFile(file)) //图片文件
            {
                if (file.ContentLength / 1024 > FileHelper.Instance.GetCompressPicUp())
                    return true;
            }
            return false;
        }
        /// <summary>
        /// 获取图片
        /// </summary>
        public void GetImage()
        {
            try
            {
                string fileId = HttpContext.Current.Server.UrlDecode(HttpContext.Current.Request["fileId"]);
                if (!string.IsNullOrWhiteSpace(fileId))
                {
                    string imgPath = string.Empty;
                    using (MAction fileAction = new MAction("PB_File"))
                    {
                        if (fileAction.Fill(string.Format("FileID='{0}'", fileId)))
                        {
                            imgPath = fileAction.Data.Get<string>("FilePath");
                        }
                    }
                    if (string.IsNullOrWhiteSpace(imgPath))
                    {
                        imgPath = HttpContext.Current.Server.MapPath("~/Style/Images/notFound.gif");
                    }
                    //if (isThumb)
                    //{
                    //    //找不到缩略图则返回原图
                    //    string startPath = imgPath.Substring(0, imgPath.IndexOf("\\"));
                    //    string endPath = imgPath.Substring(imgPath.IndexOf("\\"));
                    //    string imgThumb = string.Format("{0}/{1}{2}", startPath, "thumb", endPath);
                    //    string imgThumbPath = Path.Combine(FileHelper.Instance.ShareRootPath, imgThumb);
                    //    if (File.Exists(imgThumbPath)) imgPath = imgThumb;
                    //}

                    if (FileManager.JudgeImageFile(Path.GetExtension(imgPath).ToLower()))
                    {
                        imgPath = Path.Combine(FileHelper.Instance.ShareRootPath, imgPath);
                        using (var fs = FileHelper.CurFileManager.ReadFile(imgPath))
                        {
                            if (fs != null)
                            {
                                WebHelper.ResponceImage(fs);
                            }

                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log.WriteLogToTxt(ex);
            }
            HttpContext.Current.Response.End();
        }
    }
}