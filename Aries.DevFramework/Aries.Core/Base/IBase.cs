using System;
namespace Aries.Core
{
    public interface IBase : ICommon
    {
        bool IsUseUISite { get; }
        string GetID { get; }
        string ObjCode { get; }
        string TableName { get; }
        string ObjName { get; }
        void SetKeyValue(Enum key, string value);
        void SetKeyValue(string key, string value);
        string GetWhere();
        string GetOrderBy(string defaultSort);
        string GetWhereIn(string primaryKey, string requestKey = null, string[] values = null);
    }
}
