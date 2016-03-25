using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Web.Core;

namespace Web.Core
{
    public abstract partial class LogicBase : IBase
    {
        IBase _IBase;
        public LogicBase(IBase custom)
        {
            _IBase = custom;
        }
        private LogicBase()
        {

        }
        public string GetID
        {
            get { return _IBase.GetID; }
        }

        public string ObjCode
        {
            get
            {
                return _IBase.ObjCode;
            }
        }

        public string Order
        {
            get { return _IBase.Order; }
        }

        public int PageIndex
        {
            get { return _IBase.PageIndex; }
        }

        public int PageSize
        {
            get { return _IBase.PageSize; }
        }
        public T Query<T>(Enum key)
        {
            return _IBase.Query<T>(key);
        }
        public T Query<T>(string key)
        {
            return _IBase.Query<T>(key);
        }

        public T Query<T>(string key, T defaultValue)
        {
            return _IBase.Query<T>(key, defaultValue);
        }
        public void SetKeyValue(Enum key, string value)
        {
            _IBase.SetKeyValue(key, value);
        }
        public void SetKeyValue(string key, string value)
        {
            _IBase.SetKeyValue(key, value);
        }
        public string GetWhereIn(string primaryKey, string requestKey = null)
        {
            return _IBase.GetWhereIn(primaryKey, requestKey);
        }
        public string Sort
        {
            get { return _IBase.Sort; }
        }

        public string TableName
        {
            get { return _IBase.TableName; }
        }


        public object CrossObjName
        {
            get { return _IBase.CrossObjName; }
        }

        public string ObjName
        {
            get { return _IBase.ObjName; }
        }

    }
}
