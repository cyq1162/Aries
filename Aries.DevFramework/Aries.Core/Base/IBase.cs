using System;
namespace Aries.Core
{
    public interface IBase
    {
        string GetID { get; }
        string ObjCode { get; }
        object CrossObjName { get; }
        string ObjName { get; }
        string Order { get; }
        int PageIndex { get; }
        int PageSize { get; }
        T Query<T>(Enum key);
        T Query<T>(string key);
        T Query<T>(string key, T defaultValue);
        void SetKeyValue(Enum key, string value);
        void SetKeyValue(string key, string value);
        string Sort { get; }
        string TableName { get; }
        string GetWhereIn(string primaryKey, string requestKey = null);
    }
}
