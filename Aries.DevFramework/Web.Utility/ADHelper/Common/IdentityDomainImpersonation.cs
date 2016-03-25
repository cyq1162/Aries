using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Principal;
using System.Runtime.InteropServices;
using System.Collections;

namespace Web.Utility.ADHelper
{
    public class IdentityDomainImpersonation
    {
        [DllImport("advapi32.dll", SetLastError = true)]
        public static extern int LogonUser(String lpszUsername, String lpszDomain, String lpszPassword, int dwLogonType, int dwLogonProvider, ref IntPtr phToken);

        [DllImport("advapi32.dll", CharSet = CharSet.Auto, SetLastError = true)]
        public extern static int DuplicateToken(IntPtr ExistingTokenHandle, int SECURITY_IMPERSONATION_LEVEL, ref IntPtr DuplicateTokenHandle);

        [DllImport("kernel32.dll", CharSet = CharSet.Auto)]
        public extern static bool CloseHandle(IntPtr handle);

        // 要模拟的用户的用户名、密码、域(机器名)
        private String _sImperUsername;
        private String _sImperPassword;
        private String _sImperDomain;

        // 记录模拟上下文
        private WindowsImpersonationContext _imperContext;
        private IntPtr _adminToken;
        private IntPtr _dupeToken;

        // 是否已停止模拟
        private Boolean _bClosed;

        ///构造函数
        ///所要模拟的用户的用户名 
        ///所要模拟的用户的密码 
        ///所要模拟的用户所在的域 
        public IdentityDomainImpersonation(String impersonationUsername, String impersonationPassword, String impersonationDomain)
        {
            _sImperUsername = impersonationUsername;
            _sImperPassword = impersonationPassword;
            _sImperDomain = impersonationDomain;

            _adminToken = IntPtr.Zero;
            _dupeToken = IntPtr.Zero;
            _bClosed = true;
        }

        ///析构函数
        ~IdentityDomainImpersonation()
        {
            if (!_bClosed)
            {
                StopImpersonate();
            }
        }

        ///开始身份角色模拟。
        public Boolean BeginImpersonate()
        {
            int bLogined = LogonUser(_sImperUsername, _sImperDomain, _sImperPassword, 9, 0, ref _adminToken);
            if (bLogined == 0)
            {
                return false;
            }

            int bDuped = DuplicateToken(_adminToken, 2, ref _dupeToken);
            if (bDuped == 0)
            {
                return false;
            }

            WindowsIdentity fakeId = new WindowsIdentity(_dupeToken);
            _imperContext = fakeId.Impersonate();

            _bClosed = false;

            return true;
        }

        ///停止身分角色模拟。
        public void StopImpersonate()
        {
            if (!_bClosed)
            {
                _imperContext.Undo();
                CloseHandle(_dupeToken);
                CloseHandle(_adminToken);
                _bClosed = true;
            }
        }
    }
}
