using System;
using System.Collections.Generic;
using System.Text;
using Aries.Core;
using System.Web;
using CYQ.Data.Xml;
using CYQ.Data;

namespace Aries.Core
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

        #region _ICommon
        public string Order
        {
            get { return _IBase.Order; }
        }
        public string Sort
        {
            get { return _IBase.Sort; }
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
        public HttpContext Context
        {
            get
            {
                return _IBase.Context;
            }
        }

        public bool IsHttpGet
        {
            get { return _IBase.IsHttpGet; }
        }

        public bool IsHttpPost
        {
            get { return _IBase.IsHttpPost; }
        }

        #endregion

        public string Getid
        {
            get { return _IBase.Getid; }
        }

        public string ObjCode
        {
            get
            {
                return _IBase.ObjCode;
            }
        }

        public void SetKeyValue(Enum key, string value)
        {
            _IBase.SetKeyValue(key, value);
        }
        public void SetKeyValue(string key, string value)
        {
            _IBase.SetKeyValue(key, value);
        }
        public string GetWhereIn(string primaryKey, string requestKey = null, string[] values = null)
        {
            return _IBase.GetWhereIn(primaryKey, requestKey, values);
        }

        public object CrossTableName
        {
            get { return _IBase.CrossTableName; }
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

        public bool IsUseUISite
        {
            get
            {
                return _IBase.IsUseUISite;
            }
        }


        public string GetWhere()
        {
            return _IBase.GetWhere();
        }

        public string GetOrderBy(string defaultSort)
        {
            return _IBase.GetOrderBy(defaultSort);
        }



    }
}
