using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace Web.Utility.ADHelper
{
    /// <summary>
    /// 调用ICSharpCode.SharpZipLib组件压缩个解压多个文件
    /// </summary>
    public class SharpZipLibHelper
    {


        // <summary>  
        /// 压缩指定文件生成ZIP文件  
        /// </summary>  
        /// <param name="topDirName">顶层文件夹名称 \Storage Card\PDADataExchange\send\xml\</param>  
        /// <param name="fileNamesToZip">待压缩文件列表  file名 ddd.txt</param>  
        /// <param name="ZipedFileName">ZIP文件  \Storage Card\PDADataExchange\send\zip\version.zip</param>  
        /// <param name="CompressionLevel">压缩比  7</param>  
        /// <param name="password">密码 ""</param>  
        /// <param name="comment">压缩文件注释文字  ""</param>  
        public static void ZipFileByWinRar(string topDirName, string[] fileNamesToZip, string ZipedFileName)
        {
            if (fileNamesToZip.Length > 0)
            {
                string argsFormae = "a -ep1 {0} {1} -y";
                for (int i = 0; i < fileNamesToZip.Length; i++)
                {
                    fileNamesToZip[i] = Path.Combine(topDirName, fileNamesToZip[i]);
                }

                string appPath = FileHelper.Instance.GetSystemRarSoftPath();
                Process pc = new Process();
                ProcessStartInfo psi = new ProcessStartInfo(appPath, string.Join(" ", string.Format(argsFormae, ZipedFileName, string.Join(" ", fileNamesToZip))));
                try
                {
                    pc.StartInfo = psi;
                    pc.Start();
                    pc.WaitForExit();
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (pc != null)
                        pc.Close();
                }
            }
        }

        /// <summary>
        /// 压缩指定文件生成ZIP文件  
        /// </summary>
        /// <param name="fileNamesToZip">文件名全路径</param>
        /// <param name="zipedFileName">压缩文件全路径</param>
        public static void ZipFileByWinRar(string[] fileNamesToZip, string zipedFileName)
        {
            if (fileNamesToZip.Length > 0)
            {
                string folder = null;
                string args = string.Empty;
                if (fileNamesToZip.Length > 20)
                {
                    //移以文件夹，处理
                    folder = Path.GetDirectoryName(zipedFileName)+"\\"+Guid.NewGuid()+"\\";
                    System.IO.Directory.CreateDirectory(folder);
                    foreach (string item in fileNamesToZip)
                    {
                        File.Copy(item, folder + Path.GetFileName(item),true);
                    }
                    args = " a -ep {0} {1} -df -y";
                    args = string.Format(args, zipedFileName, folder);
                }
                else
                {
                    args = " a -ep1 {0} {1} -y";
                    args =string.Format(args, zipedFileName, string.Join(" ", fileNamesToZip));
                }

                string appPath = FileHelper.Instance.GetSystemRarSoftPath();
                Process pc = new Process();
                ProcessStartInfo psi = new ProcessStartInfo(appPath, args);
                try
                {
                    pc.StartInfo = psi;
                    pc.Start();
                    pc.WaitForExit();
                }
                catch
                {
                    throw;
                }
                finally
                {
                    if (folder != null)
                    {
                        System.IO.Directory.Delete(folder);
                    }
                    if (pc != null)
                        pc.Close();
                }
            }
        }
    }
}

#region 会乱码
/*
        // <summary>  
        /// 压缩指定文件生成ZIP文件  
        /// </summary>  
        /// <param name="topDirName">顶层文件夹名称 \Storage Card\PDADataExchange\send\xml\</param>  
        /// <param name="fileNamesToZip">待压缩文件列表  file名 ddd.txt</param>  
        /// <param name="ZipedFileName">ZIP文件  \Storage Card\PDADataExchange\send\zip\version.zip</param>  
        /// <param name="CompressionLevel">压缩比  7</param>  
        /// <param name="password">密码 ""</param>  
        /// <param name="comment">压缩文件注释文字  ""</param>  
        public static void ZipFile(string topDirName, string[] fileNamesToZip, string ZipedFileName, int CompressionLevel, string password, string comment)
        {
            using (ZipOutputStream s = new ZipOutputStream(System.IO.File.Open(ZipedFileName, FileMode.Create)))
            {
                if (password != null && password.Length > 0)
                    s.Password = password;

                if (comment != null && comment.Length > 0)
                    s.SetComment(comment);

                s.SetLevel(CompressionLevel); // 0 - means store only to 9 - means best compression  
                string tmp = string.Empty;
                foreach (string file in fileNamesToZip)
                {
                    tmp = System.Text.UTF8Encoding.UTF8.GetString(System.Text.UTF8Encoding.UTF8.GetBytes(file));
                    using (FileStream fs = File.OpenRead(Path.Combine(topDirName, tmp)))   //打开待压缩文件  
                    {
                        byte[] buffer = new byte[fs.Length];
                        fs.Read(buffer, 0, buffer.Length);      //读取文件流  
                        ZipEntry entry = new ZipEntry(tmp);    //新建实例  
                        entry.IsUnicodeText = true;
                        entry.DateTime = DateTime.Now;
                        entry.Size = fs.Length;
                        fs.Close();
                        s.PutNextEntry(entry);
                        s.Write(buffer, 0, buffer.Length);
                    }
                }
                s.Finish();
                s.Close();
            }
        }

        /// <summary>  
        /// 解压缩ZIP文件到指定文件夹  
        /// </summary>  
        /// <param name="zipfileName">ZIP文件</param>  
        /// <param name="UnZipDir">解压文件夹</param>  
        /// <param name="password">压缩文件密码</param>  
        public static void UnZipFile(string zipfileName, string UnZipDir, string password)
        {
            //zipfileName=@"\Storage Card\PDADataExchange\receive\zip\test.zip";
            //UnZipDir= @"\Storage Card\PDADataExchange\receive\xml\";
            //password="";

            ZipInputStream s = new ZipInputStream(File.OpenRead(zipfileName));
            if (password != null && password.Length > 0)
                s.Password = password;
            try
            {
                ZipEntry theEntry;
                while ((theEntry = s.GetNextEntry()) != null)
                {
                    string directoryName = Path.GetDirectoryName(UnZipDir);
                    string pathname = Path.GetDirectoryName(theEntry.Name);
                    string fileName = Path.GetFileName(theEntry.Name);

                    //生成解压目录   
                    pathname = pathname.Replace(":", "$");//处理压缩时带有盘符的问题  
                    directoryName = directoryName + "\\" + pathname;
                    Directory.CreateDirectory(directoryName);

                    if (fileName != String.Empty)
                    {
                        //解压文件到指定的目录  
                        FileStream streamWriter = File.Create(directoryName + "\\" + fileName);
                        int size = 2048;
                        byte[] data = new byte[2048];
                        while (true)
                        {
                            size = s.Read(data, 0, data.Length);
                            if (size > 0)
                            {
                                streamWriter.Write(data, 0, size);
                            }

                            else
                            {
                                break;
                            }

                        }
                        streamWriter.Close();
                    }
                }
                s.Close();
            }
            catch (Exception eu)
            {
                throw eu;
            }

            finally
            {
                s.Close();
            }
        }
        */

#endregion