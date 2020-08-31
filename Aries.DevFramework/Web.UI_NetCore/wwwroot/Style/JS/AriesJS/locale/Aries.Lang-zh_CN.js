
window.AR || (window.AR = {});
(function ($Core) {
	$Core.Lang || ($Core.Lang = {});
	$Core.Lang.langKey = "zh_CN";

	//Aries.Global.js
	$Core.Lang.edit = '编辑';
	$Core.Lang.del = '删除';
	$Core.Lang.detail = '查看详情';
	$Core.Lang.cancel = '取消';
	$Core.Lang.save = '保存';

	//Aries.Combobox.js
	$Core.Lang.select = '请选择';
	$Core.Lang.selectFirst = '请先选中数据';
	$Core.Lang.selectData = '选择数据';
	//$Core.Lang.cancel = '取消';
	$Core.Lang.ok = '确定';
	
    //Aries.Common.js
	//$Core.Lang.select = '请选择';
	$Core.Lang.config = '配置';
	$Core.Lang.add = '添加';
	$Core.Lang.addSameLevel = '添加同级';
	$Core.Lang.addChild = '添加子级';
	//$Core.Lang.cancel = '取消';
	//$Core.Lang.save = '保存';
	//$Core.Lang.edit = '编辑';
	//$Core.Lang.del = '删除';
	$Core.Lang.batchDel = '批量删除';
	$Core.Lang.opration = '操作';
	$Core.Lang.empty = '空';
	//$Core.Lang.save = '保存';
	$Core.Lang.exportTemplate = '导出模板';


    //Aries.DataGrid.js
	//$Core.Lang.edit = '编辑';
	$Core.Lang.pkTitle = '操作';
	$Core.Lang.addSuccess = '添加成功';

	$Core.Lang.isDel = '确认删除操作吗？';
	$Core.Lang.delSuccess = '删除成功';
	$Core.Lang.selectDelData = '请选择要删除的数据!';

	$Core.Lang.delError = '删除失败';
	$Core.Lang.errorInfo = '错误详情';
	$Core.Lang.msg = '消息提示';
	$Core.Lang.importTip = '正在导入数据，请稍候...';
	$Core.Lang.importError = '数据异常，导入失败！';
	$Core.Lang.uploadExtendName = '文件扩展名必须是：';

	$Core.Lang.beforePageText = '第';
	$Core.Lang.afterPageText = '页    共 {pages} 页';
	$Core.Lang.displayMsg = '当前显示 {from} - {to} 条记录   共 {total} 条记录';

	$Core.Lang.loadMsg = '正在加载中...';
	

	//Aries.Form.js
	$Core.Lang.operationSuccess = '操作成功';
	$Core.Lang.fillTheBlank = '请填写或选择（*）项';

	//Aries.EasyUIExtend.js
	$Core.Lang.root = '根目录';
	$Core.Lang.isChinese = '请输入汉字';
	$Core.Lang.isSamePwd = '密码不一致';
	$Core.Lang.isMobile = '手机号码不正确';
	$Core.Lang.isTelePhone = '电话号码不正确';
	$Core.Lang.isUserName = '登录名称只允许汉字、英文字母、数字及下划线。';
	$Core.Lang.isPwd = '密码必须由[数字、字母、符号]组成的6~20位字符';
	$Core.Lang.isNumber = '请输入数字';
	$Core.Lang.isid = '请输入正确的身份证号码';
	$Core.Lang.isMobileOrTelePhone = '请输入正确的手机或电话号码';
	$Core.Lang.isDateTime = '输入的日期格式不正确';
	$Core.Lang.isYear = '请输入有效年份';
	$Core.Lang.isEmail = '请输入正确Email地址';
	//$Core.Lang.select = '请选择';
	//$Core.Lang.selectData = '请选择下拉值';
	$Core.Lang.dataExists = '该数据已存在！';
	$Core.Lang.requestFail = '远程请求失败！';
	$Core.Lang.ruleError = "验证规则错误";
	$Core.Lang.isLength = '字符长度必须在{0}~{1}之间.';

    //Aries.Utility.js
	$Core.Lang.configRulesError = '配置表头的（格式规则）配置错误（冒号后面数据转Json失败）';
})(window.AR)