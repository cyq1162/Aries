using CYQ.Data.Xml;
using System;
using System.Web;
namespace Aries.Core
{
    public interface ICommon
    {
        int PageIndex { get; }
        int PageSize { get; }
        string Sort { get; }
        string Order { get; }
        T Query<T>(Enum key);
        T Query<T>(string key);
        T Query<T>(string key, T defaultValue);
        HttpContext Context { get; }
        bool IsHttpGet { get; }
        bool IsHttpPost { get; }
    }
}
