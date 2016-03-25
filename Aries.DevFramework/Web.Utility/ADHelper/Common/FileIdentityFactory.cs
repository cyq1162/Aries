using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.Utility.ADHelper
{
    public class FileIdentityFactory
    {
        /// <summary>
		/// 1、是共享信息；2是域信息；3是本地信息；4是虚拟目录
        /// </summary>
        /// <param name="identityType"></param>
        /// <returns></returns>
        public static IFileIdentity GetCurIFileIdentity(string identityType)
        {
            IFileIdentity identity = null;           

            switch (identityType)
            {
                //case "1":
                //    string sharePath = FileHelper.Instance.GetSharePath();
                //    string localPath = null;
                //    string shareUserId = FileHelper.Instance.GetShareUserId();
                //    string sharePwd = FileHelper.Instance.GetSharePwd();
                //    identity = new ShareRemoteIdentity(sharePath, localPath, shareUserId, sharePwd);
                //    break;
                case "2":
                    string strImpersonationDomain = FileHelper.Instance.GetDomainImpersonation();
                    string strRootFolder = FileHelper.Instance.GetDomainRootFolder();
                    string strImpersonationUser = FileHelper.Instance.GetDomainImpersonationUser();
                    string strImpersonationPass = FileHelper.Instance.GetDomainImpersonationPass();
                    identity = new ShareDomainIdentity(strImpersonationDomain, strRootFolder, strImpersonationUser, strImpersonationPass);
                    break;
                case "3":
                    identity = new ShareCommonIdentity();
					break;
				case "4":
					identity = new ShareCommonIdentity();
                    break;
            }
            return identity;
        }

        /// <summary>
        /// 获取本系统的文件服务器操作类
        /// </summary>
        /// <returns></returns>
        public static FileManager GetCurFileManager()
        {
            string identityType = FileHelper.Instance.GetUploadType();
            IFileIdentity ifile = GetCurIFileIdentity(identityType);
            return new FileManager(ifile);
        }
    }
}
