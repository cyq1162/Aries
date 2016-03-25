using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;

namespace Web.Utility.ADHelper
{
    /// <summary>
    /// 远程共享认证类
    /// </summary>
    public class ShareRemoteIdentity : IFileIdentity
    {
        #region 构造函数
        public ShareRemoteIdentity(string sharePath, string localPath, string shareUserId, string sharePwd)
        {
            SharePath = sharePath;
            LocalPath = localPath;
            ShareUserId = shareUserId;
            SharePwd = sharePwd;
        }
        #endregion

        #region 相关属性
        /// <summary>
        /// 共享的路径:@"\\192.168.0.2\test"
        /// </summary>
        public string SharePath { set; get; }

        /// <summary>
        /// 本地映射的共享路径名:MM
        /// </summary>
        public string LocalPath { set; get; }

        /// <summary>
        /// 共享登录名
        /// </summary>
        public string ShareUserId { set; get; }

        /// <summary>
        /// 共享登录密码
        /// </summary>
        public string SharePwd { set; get; }
        #endregion

        #region 接口
        public bool Connect(bool isAutoDisconnect)
        {
            return ShareRemoteIdentity.Connect(SharePath, LocalPath, ShareUserId, SharePwd, isAutoDisconnect) == 0;
        }

        public void DisConnect()
        {
            //不需要执行，在connect的时候已经执行
            // ShareManageUtility.Disconnect(SharePath);
        }
        #endregion

        #region 静态方法
        #region 方式一
        [System.Runtime.InteropServices.DllImport("mpr.dll")]
        public static extern int WNetAddConnection2A(NETRESOURCE[] lpNetResource, string lpPassword, string lpUserName, int dwFlags);

        [DllImport("mpr.dll")]
        public static extern int WNetCancelConnection2A(string sharename, int dwFlags, int fForce);


        public static int Connect(string remotePath, string localPath, string username, string password, bool autoDisconnect = true)
        {
            Disconnect(localPath);
            NETRESOURCE[] share_driver = new NETRESOURCE[1];
            share_driver[0].dwScope = RESOURCE_SCOPE.RESOURCE_GLOBALNET;
            share_driver[0].dwType = RESOURCE_TYPE.RESOURCETYPE_DISK;
            share_driver[0].dwDisplayType = RESOURCE_DISPLAYTYPE.RESOURCEDISPLAYTYPE_SHARE;
            share_driver[0].dwUsage = RESOURCE_USAGE.RESOURCEUSAGE_CONNECTABLE;
            share_driver[0].lpLocalName = localPath;
            share_driver[0].lpRemoteName = remotePath;
            //if (autoDisconnect)
            //    Disconnect(remotePath);
            int ret = WNetAddConnection2A(share_driver, password, username, 1);

            return ret;
        }

        public static int Disconnect(string localpath)
        {
            int result = WNetCancelConnection2A(localpath, 1, 1);
            return result;
        }

        #region 例子
        //调用方式：
        /*
        public static void TestNetWorkConnection()
        {
            string localpath = null;
            try
            {
                //int status = NetworkConnection.Connect(@"//192.168.0.2/test", localpath, @"test", "test");
                int status = ShareManageUtility.Connect("////192.168.0.2//test", localpath, @"test", "test");
                if (status == (int)ERROR_ID.ERROR_SUCCESS)
                {
                    FileStream fs = new FileStream(localpath + @"//123.txt", FileMode.OpenOrCreate);
                    using (StreamWriter stream = new StreamWriter(fs))
                    {
                        stream.WriteLine("你好呀，成功了");
                        stream.Flush();
                        stream.Close();
                    }
                    fs.Close();
                }
                else
                {
                    Console.WriteLine(status);
                }
            }
            finally
            {
                ShareManageUtility.Disconnect(localpath);
            }
        }
        */

        #endregion

        #endregion

        #region 另一种方式

        public static bool ConnectState(string path, string userName, string passWord)
        {
            bool Flag = false;
            Process proc = new Process();
            try
            {
                proc.StartInfo.FileName = "cmd.exe";
                proc.StartInfo.UseShellExecute = false;
                proc.StartInfo.RedirectStandardInput = true;
                proc.StartInfo.RedirectStandardOutput = true;
                proc.StartInfo.RedirectStandardError = true;
                proc.StartInfo.CreateNoWindow = true;
                proc.Start();
                string dosLine = @"net use " + path + " /User:" + userName + " " + passWord + " /PERSISTENT:YES";
                proc.StandardInput.WriteLine(dosLine);
                proc.StandardInput.WriteLine("exit");
                while (!proc.HasExited)
                {
                    proc.WaitForExit(1000);
                }
                string errormsg = proc.StandardError.ReadToEnd();
                proc.StandardError.Close();
                if (string.IsNullOrEmpty(errormsg))
                {
                    Flag = true;
                }
                else
                {
                    throw new Exception(errormsg);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                proc.Close();
                proc.Dispose();
            }
            return Flag;
        }

        #region 例子
        //read file
        //public static void ReadFiles(string path)
        //{
        //    try
        //    {
        //        // Create an instance of StreamReader to read from a file.
        //        // The using statement also closes the StreamReader.
        //        using (StreamReader sr = new StreamReader(path))
        //        {
        //            String line;
        //            // Read and display lines from the file until the end of 
        //            // the file is reached.
        //            while ((line = sr.ReadLine()) != null)
        //            {
        //                Console.WriteLine(line);

        //            }
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        // Let the user know what went wrong.
        //        Console.WriteLine("The file could not be read:");
        //        Console.WriteLine(e.Message);
        //    }

        //}

        ////write file
        //public static void WriteFiles(string path)
        //{
        //    try
        //    {
        //        // Create an instance of StreamWriter to write text to a file.
        //        // The using statement also closes the StreamWriter.
        //        using (StreamWriter sw = new StreamWriter(path))
        //        {
        //            // Add some text to the file.
        //            sw.Write("This is the ");
        //            sw.WriteLine("header for the file.");
        //            sw.WriteLine("-------------------");
        //            // Arbitrary objects can also be written to the file.
        //            sw.Write("The date is: ");
        //            sw.WriteLine(DateTime.Now);
        //        }
        //    }
        //    catch (Exception e)
        //    {
        //        // Let the user know what went wrong.
        //        Console.WriteLine("The file could not be read:");
        //        Console.WriteLine(e.Message);
        //    }
        //}    

        #endregion

        #endregion
        #endregion
    }

    #region 枚举
    public enum ERROR_ID
    {
        ERROR_SUCCESS = 0, // Success
        ERROR_BUSY = 170,
        ERROR_MORE_DATA = 234,
        ERROR_NO_BROWSER_SERVERS_FOUND = 6118,
        ERROR_INVALID_LEVEL = 124,
        ERROR_ACCESS_DENIED = 5,
        ERROR_INVALID_PASSWORD = 86,
        ERROR_INVALID_PARAMETER = 87,
        ERROR_BAD_DEV_TYPE = 66,
        ERROR_NOT_ENOUGH_MEMORY = 8,
        ERROR_NETWORK_BUSY = 54,
        ERROR_BAD_NETPATH = 53,
        ERROR_NO_NETWORK = 1222,
        ERROR_INVALID_HANDLE_STATE = 1609,
        ERROR_EXTENDED_ERROR = 1208,
        ERROR_DEVICE_ALREADY_REMEMBERED = 1202,
        ERROR_NO_NET_OR_BAD_PATH = 1203
    }

    public enum RESOURCE_SCOPE
    {
        RESOURCE_CONNECTED = 1,
        RESOURCE_GLOBALNET = 2,
        RESOURCE_REMEMBERED = 3,
        RESOURCE_RECENT = 4,
        RESOURCE_CONTEXT = 5
    }

    public enum RESOURCE_TYPE
    {
        RESOURCETYPE_ANY = 0,
        RESOURCETYPE_DISK = 1,
        RESOURCETYPE_PRINT = 2,
        RESOURCETYPE_RESERVED = 8,
    }

    public enum RESOURCE_USAGE
    {
        RESOURCEUSAGE_CONNECTABLE = 1,
        RESOURCEUSAGE_CONTAINER = 2,
        RESOURCEUSAGE_NOLOCALDEVICE = 4,
        RESOURCEUSAGE_SIBLING = 8,
        RESOURCEUSAGE_ATTACHED = 16,
        RESOURCEUSAGE_ALL = (RESOURCEUSAGE_CONNECTABLE | RESOURCEUSAGE_CONTAINER | RESOURCEUSAGE_ATTACHED),
    }

    public enum RESOURCE_DISPLAYTYPE
    {
        RESOURCEDISPLAYTYPE_GENERIC = 0,
        RESOURCEDISPLAYTYPE_DOMAIN = 1,
        RESOURCEDISPLAYTYPE_SERVER = 2,
        RESOURCEDISPLAYTYPE_SHARE = 3,
        RESOURCEDISPLAYTYPE_FILE = 4,
        RESOURCEDISPLAYTYPE_GROUP = 5,
        RESOURCEDISPLAYTYPE_NETWORK = 6,
        RESOURCEDISPLAYTYPE_ROOT = 7,
        RESOURCEDISPLAYTYPE_SHAREADMIN = 8,
        RESOURCEDISPLAYTYPE_DIRECTORY = 9,
        RESOURCEDISPLAYTYPE_TREE = 10,
        RESOURCEDISPLAYTYPE_NDSCONTAINER = 11
    }

    [StructLayout(LayoutKind.Sequential)]
    public struct NETRESOURCE
    {
        public RESOURCE_SCOPE dwScope;
        public RESOURCE_TYPE dwType;
        public RESOURCE_DISPLAYTYPE dwDisplayType;
        public RESOURCE_USAGE dwUsage;

        [MarshalAs(UnmanagedType.LPStr)]
        public string lpLocalName;

        [MarshalAs(UnmanagedType.LPStr)]
        public string lpRemoteName;

        [MarshalAs(UnmanagedType.LPStr)]
        public string lpComment;

        [MarshalAs(UnmanagedType.LPStr)]
        public string lpProvider;
    }
    #endregion
}
