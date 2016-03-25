using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Core;
using CYQ.Data;

namespace Web.UI.Ajax
{
    /// <summary>
    /// 开发人员请注意改正以下几个问题： （有疑问可以问题其它同事）。
    /// 1：单表操作，没啥特别，不需要重写，直接用SetKeyValue方法对某个值处理即可。
    /// 2：操作数据库的相关操作，移到逻辑层处理。
    /// 3：使用TableNames枚举来处理表和字段，不要用硬编码“PlanNeed“
    /// 4：MAction 切换表用ResetTable(ObjName)，不要内部再New
    /// 5: 每个方法请注明自己的名字。
    /// </summary>
    public class TreegridHandler : AjaxBase
    {
        public void GetTopItem()
        {
            using (MAction maction = new MAction(ObjCode))
            {
                //var parentField = Query<string>("parentField");
                //var value = Query<string>("id");
                jsonResult = maction.Select().ToJson(false, false);
                jsonResult = string.IsNullOrEmpty(jsonResult) ? "[]" : jsonResult;
            }
        }

        public void GetSubItem()
        {
            using (MAction maction = new MAction(ObjCode))
            {
                var parentField = Query<string>("parentField");
                var value = Query<string>("id");
                jsonResult = maction.Select(string.Format("{0}='{1}'",parentField,value)).ToJson(false,false);
                jsonResult = string.IsNullOrEmpty(jsonResult) ? "[]" : jsonResult;
            }
        }
        
    }
}