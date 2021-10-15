using CYQ.Data.Tool;
using Gemini.Workflow;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Gemini.Workflow.Models;
using Aries.Core.Config;
using CYQ.Data.Table;
using CYQ.Data;
namespace Gemini.Controllers
{
    public class WorkController : Aries.Core.Controller
    {
        protected override MDataTable Select(GridConfig.SelectType st)
        {
            if (ObjName == "V_WF_Task")
            {
                TaskInstance task = WF.Table.TaskInstance;
                if (task.BaseInfo.DataBaseType == DataBaseType.Txt || task.BaseInfo.DataBaseType == DataBaseType.Xml)
                {
                    MDataTable dt;
                    string where = GetWhere();
                    string orderBy = GetOrderBy(task.BaseInfo.MDataColumn.FirstPrimary.ColumnName);
                    dt = task.Select<MDataRow>();
                    dt.JoinOnName = "InstanceID";
                    dt = dt.Join("WF_Instance", "InstanceID", "SheetID,InstanceTitle,InstanceState,StartTime,CreatorID,CreatorFullName");
                    dt.JoinOnName = "AppID";
                    dt = dt.Join("WF_App", "AppID", "AppName");
                    return dt.Select(PageIndex, PageSize, GetWhere() + orderBy, GridConfig.GetSelectColumns(ObjName, st));
                }
            }
            return base.Select(st);
        }
        /// <summary>
        /// 获取发起工单列表
        /// </summary>
        public void GetStartAppList()
        {
            string where = "AllowRoleIDs is null or AllowRoleIDs=''";
            string likeOr = GetWhereLikeOr("AllowRoleIDs", WF.User.Current.RoleIDs);
            if (!string.IsNullOrEmpty(likeOr))
            {
                where += " or " + likeOr;
            }
            MDataTable dt = WF.Table.App.Select<MDataRow>(where);
            jsonResult = dt.Select("IsEnable=1 order by AppID asc").ToJson(false, false, RowOp.None, true);
        }
    }
}
