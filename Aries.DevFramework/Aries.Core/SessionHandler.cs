using CYQ.Data;
using System;
using System.IO;
using System.Web;
using System.Web.SessionState;

namespace Aries.Core
{
    /// <summary>
    /// 实现IHttpModule中使用Session
    /// </summary>
    internal class SessionHandler : IHttpHandler, IRequiresSessionState
    {
        internal static readonly SessionHandler Instance = new SessionHandler();
        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public void ProcessRequest(HttpContext context)
        {
           
        }
    }
}
