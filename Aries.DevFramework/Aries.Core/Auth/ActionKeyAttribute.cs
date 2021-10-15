using System;
using System.Collections.Generic;
using System.Text;

namespace Aries.Core.Auth
{
    [AttributeUsage(AttributeTargets.Method,AllowMultiple = false,Inherited=true)]
    public class ActionKeyAttribute:Attribute
    {
        /// <summary>
        /// 多个用字符串分隔，如:"add,edit"
        /// </summary>
        public string Key { get; set; }
        public ActionKeyAttribute(string key)
        {
            Key = key;
        }
    }
}
