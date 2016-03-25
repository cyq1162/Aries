using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TY.Data;
using TY.Data.Tool;

namespace TY.Logic
{
    /// <summary>
    /// 公用的扩展业务基类
    /// </summary>
    public abstract partial class LogicBase
    {
        /// <summary>
        /// Creator：梁水
        /// Date:2014-07-16
        /// Description:获取站间距离
        /// </summary>
        public string GetDistanceMeter()
        {
            var slat = Query<string>("slat"); var slon = Query<string>("slon");
            var elat = Query<string>("elat"); var elon = Query<string>("elon");
            var sql = string.Format("SELECT dbo.fn_getDistanceMeter('{0}','{1}','{2}','{3}')", slat, slon, elat, elon);
            var result = string.Empty;
            using (MProc proc = new MProc(sql))
            {
                result = JsonHelper.OutResult(true, proc.ExeScalar<string>());
            }
            return result;
        }
    }
}
