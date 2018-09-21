
package com.tedu.ftl.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tedu.base.auth.login.service.LoginService;
import com.tedu.base.engine.dao.FormMapper;
import com.tedu.base.engine.service.FormService;
import com.tedu.base.engine.service.FormTokenService;
import com.tedu.base.task.SpringUtils;

/**
 * 登录类
 *
 * @author 朱小猛
 */
@Controller
public class ExpDetailController {

	@Resource
	private LoginService loginService;
	@Resource
	private FormTokenService formTokenService;
	@Resource
	private FormService formService;
	FormMapper formMapper = SpringUtils.getBean("simpleDao");
	// 日志记录器
	public final Logger log = Logger.getLogger(this.getClass());

	@RequestMapping("/experiment-detail")
	public String uc(Model model, HttpServletRequest request) {
		return "h5/experiment-detail";
	}


}
