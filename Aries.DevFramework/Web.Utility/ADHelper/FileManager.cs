using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;


namespace Web.Utility.ADHelper
{
    /// <summary>
    /// 都是全路径操作，支持域登录，共享登录，普通文件夹
    /// </summary>
    public class FileManager
    {
        public FileManager(IFileIdentity _IFileIdentity)
        {
            CurIFileIdentity = _IFileIdentity;
        }
        public IFileIdentity CurIFileIdentity { set; get; }

        #region 各种文件操作
        /// <summary>
        /// 
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public FileStream ReadFile(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    if (File.Exists(path))
                    {
                        return new FileStream(path, FileMode.Open);
                    }
                    return null;
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 返回文件大小
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public long GetFileSize(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    if (File.Exists(path))
                    {
                        FileInfo file = new FileInfo(path);
                        return file.Length;
                    }
                    return -1;
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 该方法目前用来测试目录是否有权限访问
        /// </summary>
        /// <param name="path"></param>
        public void GetDirectories(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    string[] subFolders = Directory.GetDirectories(path);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 目录是否存在
        /// </summary>
        /// <param name="path"></param>
        public bool FolderExist(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    return Directory.Exists(path);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 判断文件是否存在
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public bool FileExist(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    return File.Exists(path);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 创建文件夹
        /// </summary>
        /// <param name="name"></param>
        /// <param name="parentName"></param>
        public void CreateFolder(string name, string parentName)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    DirectoryInfo di = new DirectoryInfo(parentName);
                    di.CreateSubdirectory(name);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 创建文件夹
        /// </summary>
        /// <param name="name"></param>
        /// <param name="parentName"></param>
        public void CreateFolder(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    Directory.CreateDirectory(path);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="name"></param>
        /// <param name="parentName"></param>
        public void SimpleCreateFolder(string name, string parentName)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    DirectoryInfo di = new DirectoryInfo(parentName);
                    di.CreateSubdirectory(name);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        /// <summary>
        /// 简单的创建文件
        /// </summary>
        /// <param name="file"></param>
        /// <param name="path"></param>
        public void CreateFile(FileStream file, string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    using (FileStream fs = File.Create(path))
                    {
                        file.CopyTo(fs);
                    }
                    //StreamWriter sw = new StreamWriter(file);
                    //file.Write(file.Length, 0, file.Length);

                    //fs.Close();
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }

        }

        /// <summary>
        /// 创建文件
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="path"></param>
        public void CreateFile(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    FileStream fs = File.Create(path);
                    fs.Close();
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }

        }

        /// <summary>
        /// 创建文件
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="path"></param>
        /// <param name="contents"></param>
        public void CreateFile(string path, byte[] contents)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    FileStream fs = File.Create(path);
                    fs.Write(contents, 0, contents.Length);
                    fs.Close();
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 只创建文件，不插入数据库 add by zhoubozhi
        /// </summary>
        /// <param name="path"></param>
        /// <param name="contents"></param>
        public void SimpleCreateFile(string path, byte[] contents)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    FileStream fs = File.Create(path);
                    fs.Write(contents, 0, contents.Length);
                    fs.Close();
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 删除文件夹
        /// </summary>
        /// <param name="path"></param>
        public void DeleteFolder(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    if (Directory.Exists(path))
                    {
                        Directory.Delete(path, true);
                    }
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 删除文件
        /// </summary>
        /// <param name="path"></param>
        public void DeleteFile(string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    if (File.Exists(path))
                    {
                        File.Delete(path);
                    }
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 移动文件
        /// </summary>
        /// <param name="oldPath"></param>
        /// <param name="newPath"></param>
        public void MoveFile(string oldID, string oldPath, string newPath)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    File.Move(oldPath, newPath);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 复制文件
        /// </summary>
        /// <param name="sourcePath"></param>
        /// <param name="destinationPath"></param>
        public void CopyFile(FileStream srcFile, string destinationPath)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    using (FileStream fs = File.Create(destinationPath))
                    {
                        srcFile.CopyTo(fs);
                    }
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

                //InsertFileItem(file);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 复制文件
        /// </summary>
        /// <param name="sourcePath"></param>
        /// <param name="destinationPath"></param>
        public void CopyFile(string sourcePath, string destinationPath)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    File.Copy(sourcePath, destinationPath, true);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 简单的文件复制动作，不涉及到数据库操作
        /// </summary>
        /// <param name="sourcePath"></param>
        /// <param name="destinationPath"></param>
        public void SimpleCopyFile(string sourcePath, string destinationPath)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    File.Copy(sourcePath, destinationPath, true);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        #endregion

        #region 上传下载文件
        /// <summary>
        /// 下载文件
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="path"></param>
        public void DownloadFile(string filename, string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    DownLoadFileForNotIdentity(filename, path);
                }
            }
            catch (Exception ex)
            { }
            finally
            {

            }
            //System.IO.Stream iStream = null;
            //byte[] buffer = new Byte[10000];
            //int length;
            //long dataToRead;

            //try
            //{
            //    if (CurIFileIdentity.Connect(true))
            //    {
            //        iStream = new System.IO.FileStream(path, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
            //        dataToRead = iStream.Length;
            //        HttpContext.Current.Response.ContentType = "application/octet-stream";
            //        HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8));
            //        while (dataToRead > 0)
            //        {
            //            if (HttpContext.Current.Response.IsClientConnected)
            //            {
            //                length = iStream.Read(buffer, 0, 10000);
            //                HttpContext.Current.Response.OutputStream.Write(buffer, 0, length);
            //                HttpContext.Current.Response.Flush();

            //                buffer = new Byte[10000];
            //                dataToRead = dataToRead - length;
            //            }
            //            else
            //            {
            //                dataToRead = -1;
            //            }
            //        }

            //    }
            //}
            //catch (Exception ex)
            //{
            //}
            //finally
            //{
            //    CurIFileIdentity.DisConnect();
            //}
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="file"></param>
        /// <param name="path"></param>
        public void UploadFile(HttpPostedFile file, string path)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    file.SaveAs(path);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 上传并且压缩图片文件
        /// </summary>
        /// <param name="file"></param>
        /// <param name="path"></param>
        /// <param name="compressZize">大小比例</param>
        /// <param name="compressQuality">质量比率</param>
        public long CompressPicFileAndUploadFile(HttpPostedFile file, string path, double compressZize, int compressQuality)
        {
            try
            {
                if (CurIFileIdentity.Connect(true))
                {
                    return CompressPictureAndSave(file.InputStream, path, compressZize, compressQuality);
                }
                else
                {
                    throw new Exception("模拟身份失败!");
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                CurIFileIdentity.DisConnect();
            }
        }

        /// <summary>
        /// 普通下载文件类，不需要验证
        /// </summary>
        /// <param name="filename"></param>
        /// <param name="path"></param>
        public void DownLoadFileForNotIdentity(string filename, string path)
        {
            System.IO.Stream iStream = null;
            byte[] buffer = new Byte[10000];
            int length;
            long dataToRead;

            try
            {
                iStream = new System.IO.FileStream(path, System.IO.FileMode.Open, System.IO.FileAccess.Read, System.IO.FileShare.Read);
                dataToRead = iStream.Length;
                HttpContext.Current.Response.ContentType = "application/octet-stream";

                if (!HttpContext.Current.Request.UserAgent.Contains("Firefox"))
                {
                    filename = HttpUtility.UrlEncode(filename, System.Text.Encoding.UTF8);
                }
                HttpContext.Current.Response.AddHeader("Content-Disposition", "attachment; filename=" + filename);
                while (dataToRead > 0)
                {
                    if (HttpContext.Current.Response.IsClientConnected)
                    {
                        length = iStream.Read(buffer, 0, 10000);
                        HttpContext.Current.Response.OutputStream.Write(buffer, 0, length);
                        HttpContext.Current.Response.Flush();

                        buffer = new Byte[10000];
                        dataToRead = dataToRead - length;
                    }
                    else
                    {
                        dataToRead = -1;
                    }
                }
            }
            catch (Exception ex)
            {
            }
            finally
            {
                if (iStream != null)
                {
                    iStream.Close();
                }
                System.Web.HttpContext.Current.ApplicationInstance.CompleteRequest();
            }
        }
        #endregion

        #region 压缩并且保存图片
        /// <summary>
        /// 压缩并且保存图片
        /// </summary>
        /// <param name="stream"></param>
        /// <param name="savePath"></param>
        /// <param name="compressZize">大小比例</param>
        /// <param name="compressQuality">质量比率</param>
        /// <returns></returns>
        public long CompressPictureAndSave(Stream stream, string savePath, double compressZize, int compressQuality)
        {
            try
            {
                double sizeRate = compressZize / 100;// 大小比率
                int qualityRate = compressQuality;// 品质比率

                using (Image sourceImage = Image.FromStream(stream))
                {
                    //调整图片大小
                    using (Bitmap bmp = new Bitmap(sourceImage, new Size((int)(sourceImage.Width * sizeRate), (int)(sourceImage.Height * sizeRate))))
                    {
                        //压缩图片
                        SaveAsJPEG(bmp, savePath, qualityRate);
                        return GetFileSize(savePath);
                    }
                }
            }
            catch
            {
                return -1;
            }
        }

        /// <summary>
        /// 保存为JPEG格式，支持压缩质量选项
        /// </summary>
        /// <param name="bmp">原始位图</param>
        /// <param name="fileName">新文件地址</param>
        /// <param name="Qty">压缩质量，越大越好，文件也越大(0-100)</param>
        /// <returns>成功标志</returns>
        public static bool SaveAsJPEG(Bitmap bmp, string fileName, int Qty)
        {
            try
            {
                EncoderParameter p;
                EncoderParameters ps;
                ps = new EncoderParameters(1);
                p = new EncoderParameter(System.Drawing.Imaging.Encoder.Quality, Qty);
                ps.Param[0] = p;
                bmp.Save(fileName, GetCodecInfo("image/jpeg"), ps);
                return true;
            }
            catch
            {
                return false;
            }
        }

        /// <summary>
        /// 保存JPG时用
        /// </summary>
        /// <param name="mimeType"></param>
        /// <returns>得到指定mimeType的ImageCodecInfo</returns>
        public static ImageCodecInfo GetCodecInfo(string mimeType)
        {
            ImageCodecInfo[] CodecInfo = ImageCodecInfo.GetImageEncoders();
            foreach (ImageCodecInfo ici in CodecInfo)
            {
                if (ici.MimeType == mimeType) return ici;
            }
            return null;
        }

        /// <summary>
        /// 判断是否是图片文件
        /// </summary>
        /// <param name="file"></param>
        /// <returns></returns>
        public static bool JudgeImageFile(HttpPostedFile file)
        {
            string type = Path.GetExtension(file.FileName).ToLower();
            return JudgeImageFile(type);
        }

        /// <summary>
        /// 判断是否是图片文件
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static bool JudgeImageFile(string type)
        {
            //允许上传的扩展名，可以改成从配置文件中读出
            string[] arrExtension = { ".gif", ".jpg", ".jpeg", ".bmp", ".png", ".ico", ".ilbm", ".lbm", ".iff", ".ppm", ".psd", ".tif", ".tiff" };
            return arrExtension.Contains(type);
        }

        /// <summary>
        /// 判断文件是否是图片文件
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        public static bool JudgeImageFileForName(string fileName)
        {
            string type = Path.GetExtension(fileName).ToLower();
            return JudgeImageFile(type);
        }
        #endregion
    }
}
