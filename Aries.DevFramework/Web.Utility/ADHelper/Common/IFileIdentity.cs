using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Web.Utility.ADHelper
{
    public interface IFileIdentity
    {
        bool Connect(bool Disconnect);
        void DisConnect();
    }
}
