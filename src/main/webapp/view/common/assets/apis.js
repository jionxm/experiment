//后台的接口地址
var API_PROXY = '';
// 后台的接口列表
var APIS = {

	/**
	 * 保存实验报告
	 */
	frmStudentRecord : {
		save : {
			url : '/api/save',
			needLogin : true,
			tokenKey : 'OnClick_pButton_save_frmStudentRecord_jssave'
		},
	},
};