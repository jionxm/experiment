//后台的接口地址
var API_PROXY = '';
// 后台的接口列表
var APIS = {
		/**
	     * 匿名登录
	     */
		
	    loginAn: {
	        url: '/loginAn'
	    },
	    login: {
	        url: '/login'
	    },
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
	/**
	 * 获取服务器
	 */
	frmServerList:{
		query:{
			 url: '/api/query',
	         needLogin: true,
	         tokenKey: 'OnLoad__frmServerList_j2'
		},
	},		
};