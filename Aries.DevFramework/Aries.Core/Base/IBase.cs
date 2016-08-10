using System;
namespace Aries.Core
{
    public interface IBase : ICommon
    {
        bool IsUseUISite { get; }
        string GetID { get; }
        string ObjCode { get; }
        object CrossObjName { get; }
        string ObjName { get; }
        void SetKeyValue(Enum key, string value);
        void SetKeyValue(string key, string value);
        string TableName { get; }
        string GetWhereIn(string primaryKey, string requestKey = null);
    }
}
