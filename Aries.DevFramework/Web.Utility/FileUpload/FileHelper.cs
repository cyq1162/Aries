using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web;
using CYQ.Data;
using CYQ.Data.Cache;
using System.Collections;
using System.Xml.Linq;
using Web.Utility.ADHelper;
using System.IO;

namespace Web.Utility
{
    public class FileHelper
    {
        private static object _lock = new object();
        #region[构造函数]
        public static FileHelper Instance
        {
            get
            {
                lock (_lock)
                {
                    if (_Instance == null)
                        _Instance = new FileHelper();
                    return _Instance;
                }                
            }
        }
        private static FileHelper _Instance;
		/// <summary>
		/// 文件io操作类
		/// </summary>
		private static FileManager _CurFileManager;
		public static  FileManager CurFileManager
		{
			get
			{
				if (_CurFileManager == null)
					_CurFileManager = FileIdentityFactory.GetCurFileManager();
				return _CurFileManager;
			}
		}

		/// <summary>
		/// 远程共享的路径
		/// </summary>
		private string _SharePath;
		public string ShareRootPath
		{
			get
			{
				if (_SharePath == null)
				{
					_SharePath = this.GetShareRootPath();
				}
				return _SharePath;
			}
		}
        #endregion

        

        #region 文件共享设置
        #region 上传方式
        public string GetUploadType()
        {
            return GetConfigByKeyAndName("文件服务器信息", "上传方式")["ConfigValue"].ToString();
        }
        #endregion

        #region 远程共享配置
        /// <summary>
        /// 获取远程共享目录
        /// </summary>
        /// <returns></returns>
        public string GetSharePath()
        {
            return GetConfigByKeyAndName("文件服务器信息", "共享路径")["ConfigValue"].ToString();
        }

        /// <summary>
        /// 获取共享的用户名
        /// </summary>
        /// <returns></returns>
        public string GetShareUserId()
        {
            return GetConfigByKeyAndName("文件服务器信息", "共享用户名")["ConfigValue"].ToString();
        }

        /// <summary>
        /// 获取共享的用户密码
        /// </summary>
        /// <returns></returns>
        //public string GetSharePwd()
        //{
        //    var password = GetConfigByKeyAndName("文件服务器信息", "共享密码")["ConfigValue"].ToString();
        //    return EncrpytHelper.Decrypt(password);
        //}
        #endregion

        #region 获取域信息
        /// <summary>
        /// 获取域名
        /// </summary>
        /// <returns></returns>
        public string GetDomainImpersonation()
        {
            //return GetConfigByKeyAndName("文件服务器信息", "域名称").ConfigValue;
            return GetConfigByKeyAndName("文件服务器信息", "域名称")["ConfigValue"].ToString();
        }

        /// <summary>
        /// 获取域根目录
        /// </summary>
        /// <returns></returns>
        public string GetDomainRootFolder()
        {
            //return GetConfigByKeyAndName("文件服务器信息", "域路径").ConfigValue;
            return GetConfigByKeyAndName("文件服务器信息", "域路径")["ConfigValue"].ToString();
        }

        /// <summary>
        /// 获取域用户
        /// </summary>
        /// <returns></returns>
        public string GetDomainImpersonationUser()
        {
            //return GetConfigByKeyAndName("文件服务器信息", "域用户名").ConfigValue;
            return GetConfigByKeyAndName("文件服务器信息", "域用户名")["ConfigValue"].ToString();
        }

        /// <summary>
        /// 获取域密码
        /// </summary>
        /// <returns></returns>
        public string GetDomainImpersonationPass()
        {
            //EncrpytUtility encrpyt = new EncrpytUtility();
            //return encrpyt.Decrypt3DES(GetConfigByKeyAndName("文件服务器信息", "域密码").ConfigValue);
            return GetConfigByKeyAndName("文件服务器信息", "域密码")["ConfigValue"].ToString();
        }
        #endregion

        #region 本地目录
        /// <summary>
        /// 本地上传的目录
        /// </summary>
        /// <returns></returns>
        public string GetLocalPath()
        {
            return  HttpContext.Current.Server.MapPath(GetConfigByKeyAndName("文件服务器信息", "本地路径")["ConfigValue"].ToString());
        }
        #endregion

        #region 网站配置信息
        /// <summary>
        /// 服务器压缩软件路径
        /// </summary>
        /// <returns></returns>
        public string GetWebTempPath()
        {
            return GetConfigByKeyAndName("网站信息", "临时目录")["ConfigValue"].ToString();
        }

        /// <summary>
        /// 图片压缩大小
        /// </summary>
        /// <returns></returns>
        public double GetCompressZize()
        {
            return Convert.ToInt32(GetConfigByKeyAndName("网站信息", "图片压缩大小")["ConfigValue"]);
        }

        /// <summary>
        /// 图片压缩质量
        /// </summary>
        /// <returns></returns>
        public int GetCompressQuality()
        {
            return Convert.ToInt32(GetConfigByKeyAndName("网站信息", "图片压缩质量")["ConfigValue"]);
        }

        /// <summary>
        /// 图片需要压缩的上限
        /// </summary>
        /// <returns></returns>
        public int GetCompressPicUp()
        {
            return Convert.ToInt32(GetConfigByKeyAndName("网站信息", "图片压缩上限")["ConfigValue"]);
        }

        //public IList<Config> GetFirstZhuanYe()
        //{
        //    string sql = string.Format("select * from PB_config where ConfigKey='{0}'and ConfigValue={1}", "专业类别", 1);
        //    IList<Config> model = base.GetList(sql, null, false);
        //    return model;
        //}
        #endregion

		#region 虚拟目录
		/// <summary>
		/// 虚拟目录路径
		/// </summary>
		/// <returns></returns>
		public string GetVirtualDirePath()
		{
            return  HttpContext.Current.Server.MapPath(GetConfigByKeyAndName("文件服务器信息", "虚拟目录路径")["ConfigValue"].ToString());
		}
		#endregion

        #region 系统信息
        /// <summary>
        /// 服务器压缩软件路径
        /// </summary>
        /// <returns></returns>
        public string GetSystemRarSoftPath()
        {
            return GetConfigByKeyAndName("系统信息", "Rar路径")["ConfigValue"].ToString();
        }
        #endregion

        #region 获取共享路径
        /// <summary>
        /// 获取共享的根目录
        /// </summary>
        /// <returns></returns>
        public string GetShareRootPath()
        {
            string _SharePath = null;
            string identityType = GetUploadType();
            //GetConfigByKeyAndName("文件服务器信息", "上传方式").ConfigValue;
            if (identityType == "1")
            {
                _SharePath = GetSharePath();
            }
            else if (identityType == "2")
                _SharePath = GetDomainRootFolder();
			else if (identityType == "4")
				_SharePath = GetVirtualDirePath();
            else
                _SharePath = GetLocalPath();
            return _SharePath;
        }
        #endregion
        #endregion

        private const string CACH_KEY = "PB_ConfigDALList";

        private DataTable TableSource
        {
            get
            {
                var configSource = CacheManage.Instance.Get(CACH_KEY);
                if (configSource == null)
                {
                    using (MAction action = new MAction("PB_Config"))
                    {
                        return action.Select().ToDataTable();
                    }
                }
                else
                {
                    return configSource as DataTable;
                }
            }
        }

        private DataRow GetConfigByKeyAndName(string configKey,string configName)
        {
            return TableSource.Select(string.Format(" ConfigKey = '{0}' AND ConfigName = '{1}'",configKey,configName))[0];
        }

    }
}

