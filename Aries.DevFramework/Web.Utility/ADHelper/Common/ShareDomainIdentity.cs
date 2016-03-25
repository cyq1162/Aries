using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.Utility.ADHelper
{
    public class ShareDomainIdentity : IFileIdentity
    {
        private IdentityDomainImpersonation impersonation = null;

        public ShareDomainIdentity(string strImpersonationDomain, string strRootFolder, string strImpersonationUser, string strImpersonationPass)
        {
            ImpersonationDomain = strImpersonationDomain;
            RootFolder = strRootFolder;
            ImpersonationUser = strImpersonationUser;
            ImpersonationPass = strImpersonationPass;
        }

        #region 相关属性
        public string ImpersonationDomain { get; set; }
        public string RootFolder { get; set; }
        public string ImpersonationUser { get; set; }
        public string ImpersonationPass { get; set; }
        #endregion

        #region 实现接口
        public bool Connect(bool autoDisConnect)
        {
            if (impersonation != null)
            {
                impersonation.StopImpersonate();
                impersonation = null;
            }
            impersonation = new IdentityDomainImpersonation(ImpersonationUser, ImpersonationPass, ImpersonationDomain);
            return impersonation.BeginImpersonate();
        }

        public void DisConnect()
        {
            if (impersonation != null)
            {
                impersonation.StopImpersonate();
                impersonation = null;
            }
        } 
        #endregion
    }
}
