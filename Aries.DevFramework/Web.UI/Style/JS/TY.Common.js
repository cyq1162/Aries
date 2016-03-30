TY.handler = {
    ajax: ui + '/Ajax/AjaxHandler.ashx'
}
//模块路劲设置
$.extend(TY.handler, {
    excel : ui + '/Ajax/ExcelHandler.ashx',
    sys : ui + '/Ajax/SysHandler.ashx',
    indoor : ui + '/Ajax/IndoorHandler.ashx',
    transfer : ui + '/Ajax/TransferHandler.ashx',
    wideband : ui + '/Ajax/WidebandHandler.ashx',
    gridconfig : ui + '/Web/SysAdmin/GridConfigList.aspx',
    outdoor : ui + '/Ajax/OutdoorHandler.ashx',
    fileupload : ui + '/Ajax/FileUpload.ashx',
    Transfer : ui + '/Ajax/TransferHandler.ashx',
    Station : ui + '/Ajax/StationHandler.ashx',
    LogicStation : ui + '/Ajax/LogicStationHandler.ashx',
    bureauroom : ui + '/Ajax/BureauRoomHandler.ashx',
    monthlyassessment : ui + '/Ajax/MonthlyAssessmentHandler.ashx',
    monthDeduction : ui + '/Ajax/MonthDeductionHandler.ashx',
    analysisTableListHandler : ui + '/Ajax/AnalysisTableListHandler.ashx',
    scheduleDetailHandler : ui + '/Ajax/ScheduleDetailHandler.ashx',
    ydHxHandler : ui + '/Ajax/YdHXHandler.ashx',//移动功能
    tools : ui + '/Ajax/ToolsHandler.ashx'
});

//格式主键模板
var buttons_temp = {
    edit: '<a  class="bj"  title="编辑" op="1"></a>',
    del: '<a  class="sc"   title="删除"></a>',
    detail: '<a class="ckxq" title="查看详情" op="0"></a>',
    picture: '<a  class="cktp" title="查看图片" op="0"></a>',
    download: '<a  class="xz" title="下载" op="0"></a>',
    diary: '<a  class="ckrj" title="查看日记" op="0"></a>',
    map: '<a class="ckdt" title="查看地图" op="0"></a>',
    ckjd: '<a  class="ckjd" title="查看进度"  op="0" ></a>',
    shtg: '<a class="shtg" title="审核通过"   op="0" ></a>',
    dsh: '<a class="dsh"  title="待审核"   op="0" ></a>',
    save: '<a class="bc" title="保存"   op="0"></a>',
    zh: '<a class="zh" title="替换"   op="0"></a>',
    xf: '<a class="xf" title="邮件"   op="0"></a>',
    lc: '<a class="lc" title="流程"   op="0"></a>',
    file: '<a class="wj" title="文件"   op="0"></a>',
    save: '<a class="bc" title="保存"   op="0"></a>',
    paidan: '<a class="zh" title="派单"   op="0"></a>',
    feedback: '<a class="shtg" title="勘察反馈"   op="0"></a>',
    upload: '<a class="bc" title="上传"   op="0"></a>',
    remove: '<a class="sc" title="移除"   op="0"></a>'
}


//打开日志方法
function openDiary(value, row, el) {
    TY.Window.open(StringFormat.execute('{0}/Web/SysAdmin/SearchLogs.aspx?id={1}', ui, value), '操作日志明细', true);
}
