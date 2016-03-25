using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.Utility.ADHelper
{
    /// <summary>
    /// 普通验证类，如网站本地文件夹
    /// </summary>
     public class ShareCommonIdentity : IFileIdentity
    {
         public bool Connect(bool autoDisConnect)
        {
            return true;
        }

        public void DisConnect()
        {
            //不需要
        }
    }
}
