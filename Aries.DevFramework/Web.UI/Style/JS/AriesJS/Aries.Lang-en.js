//english  在需要时引入，修改下面的中文为英文即可
window.AR || (window.AR = {});
(function ($Core) {
	$Core.Lang || ($Core.Lang = {});
	$Core.Lang.langKey = "en";

	//Aries.Global.js
	$Core.Lang.edit = 'Edit';
	$Core.Lang.del = 'Delete';
	$Core.Lang.detail = 'Detail';
	$Core.Lang.cancel = 'Cancel';
	$Core.Lang.save = 'Save';

	//Aries.Combobox.js
	$Core.Lang.select = 'please';// '请选择';
	$Core.Lang.selectFirst = 'select one please';// '请先选中数据';
	$Core.Lang.selectData = 'select data please';// '选择数据';
	//$Core.Lang.cancel = '取消';
	//$Core.Lang.save = '保存';
	
	//Aries.Common.js
	//$Core.Lang.select = '请选择';
	$Core.Lang.config = 'Config'; //'配置';
	$Core.Lang.add = 'Add';// '添加';
	$Core.Lang.addSameLevel = 'Add Same Level';//'添加同级';
	$Core.Lang.addChild = 'Add Child';// '添加子级';
	//$Core.Lang.cancel = '取消';
	//$Core.Lang.save = '保存';
	//$Core.Lang.edit = '编辑';
	//$Core.Lang.del = '删除';
	$Core.Lang.batchDel = 'Batch Delete';// '批量删除';
	$Core.Lang.opration = 'Operation';// '操作';
	$Core.Lang.empty = 'Empty';//'空';
	//$Core.Lang.save = '保存';
	$Core.Lang.exportTemplate = 'Export Template';// '导出模板';

	//Aries.DataGrid.js
	//$Core.Lang.edit = '编辑';
	//$Core.Lang.add = '添加';
	$Core.Lang.addSuccess = 'Add Suceess';// '添加成功';
	$Core.Lang.isDel = 'Confirm Delete?';// '确认删除操作吗？';
	$Core.Lang.delSuccess = 'Delete Success';// '删除成功';
	$Core.Lang.selectDelData = 'select data please';// '请选择要删除的数据!';
	$Core.Lang.delError = 'Delete Fail';//'删除失败';
	$Core.Lang.errorInfo = 'Error Detail';// '错误详情';
	$Core.Lang.msg = 'Message Tip';// '消息提示';
	$Core.Lang.importTip = 'Waiting for importing data...';// '正在导入数据，请稍候...';
	$Core.Lang.importError = 'Import Error';// '数据异常，导入失败！';
	$Core.Lang.uploadExtendName = 'file extend name eroor';//'文件扩展名必须是：';
	$Core.Lang.beforePageText = 'Page';
	$Core.Lang.afterPageText = 'of {pages}';
	$Core.Lang.displayMsg = 'Displaying {from} to {to} of {total} items';
	$Core.Lang.loadMsg = 'Loading...';

	//Aries.Form.js
	//$Core.Lang.select = '请选择';
	$Core.Lang.operationSuccess = 'Success';// '操作成功';
	$Core.Lang.fillTheBlank = 'Fill the blank first';// '请填写或选择（*）项';

	//Aries.EasyUIExtend.js
	$Core.Lang.root = 'Root';//'根目录';
	$Core.Lang.isChinese = 'Must be chinese';// '请输入汉字';
	$Core.Lang.isSamePwd = 'Must be the same password';// '密码不一致';
	$Core.Lang.isMobile = 'Must be mobile';//'手机号码不正确';
	$Core.Lang.isTelePhone = 'Must be telephone';// '电话号码不正确';
	$Core.Lang.isUserName = 'Username rule error';//'登录名称只允许汉字、英文字母、数字及下划线。';
	$Core.Lang.isPwd = 'Password rule error';//'密码由字母和数字组成，至少6位';
	$Core.Lang.isNumber = 'Must be Number';//'请输入数字';
	$Core.Lang.isID = 'Must be identification';//'请输入正确的身份证号码';
	$Core.Lang.isMobileOrTelePhone = 'Must be mobile or telephone';//'请输入正确的手机或电话号码';
	$Core.Lang.isDateTime = 'Must be datetime';//'输入的日期格式不正确';
	$Core.Lang.isYear = 'Must be year';//'请输入有效年份';
	$Core.Lang.isEmail = 'Must be email';//'请输入正确Email地址';
	//$Core.Lang.select = '';//'请选择';
	//$Core.Lang.selectData = '';// '请选择下拉值';
	$Core.Lang.dataExists = 'Data exists';//'该数据已存在！';
	$Core.Lang.requestFail = 'Request Fail';//'远程请求失败！';
	$Core.Lang.ruleError = 'Rule Error';//"验证规则错误";
	$Core.Lang.isLength = 'Length must be between {0} and {1}';//'字符长度必须在{0}~{1}之间.';

    //Aries.Utility.js
	$Core.Lang.configRulesError = "Config Header's [Rules] to json error";//'配置表头的（格式规则）配置错误（冒号后面数据转Json失败）'
})(window.AR)