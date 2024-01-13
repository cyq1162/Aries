﻿using Aries.Core.Config;
using Aries.Core.Extend;
using CYQ.Data;
using CYQ.Data.Json;
using CYQ.Data.Table;
using CYQ.Data.Tool;
using System;
using System.Collections.Generic;
using System.Text;

namespace Aries.Controllers
{
    public class DemoController : Aries.Core.Controller
    {
        public string Upload() {
            if (context.Request.Files.Count > 0)
            {
                return JsonHelper.OutResult(true, "文件成功上传");
            }
            else
            {
                return JsonHelper.OutResult(true, "文件上传失败");
            }
        }
        protected override MDataRow GetOne()
        {
            switch (ObjName)
            {
                case "V_Test"://处理Demo中文本数据库
                    if (AppConfig.DB.DefaultDataBaseType == DataBaseType.Txt)
                    {
                        return Select(GridConfig.SelectType.Show).Rows[0];
                    }
                    break;
            }
            return base.GetOne();
        }
        protected override MDataTable Select(GridConfig.SelectType st)
        {
            switch (ObjName)
            {
                case "V_Test"://处理Demo中文本数据库
                    MDataTable dt = null;
                    using (MAction action = new MAction("Demo_TestA"))
                    {
                        dt = action.Select();
                    }
                    dt.JoinOnName = "id";
                    MDataTable joinDt = dt.Join("Demo_TestB", "id");
                    return joinDt.Select(PageIndex, PageSize, GetWhere() + GetOrderBy("id"), GridConfig.GetSelectColumns(ObjName, st));
            }
            return base.Select(st);
        }
    }
}
