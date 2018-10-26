
package com.tedu.ftl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tedu.base.common.page.QueryPage;
import com.tedu.base.engine.dao.FormMapper;
import com.tedu.base.engine.service.FormService;
import com.tedu.base.engine.service.FormTokenService;
import com.tedu.base.task.SpringUtils;

/**
 * 任务监控
 *
 * @author 陈俊
 */
@Controller
public class TaskMonitoring {

	@Resource
	private FormTokenService formTokenService;
	@Resource
	private FormService formService;
	FormMapper formMapper = SpringUtils.getBean("simpleDao");
	// 日志记录器
	public final Logger log = Logger.getLogger(this.getClass());

	@RequestMapping("/task")
	public String resourceList(Model model, HttpServletRequest request) {
				return "pc/TaskList";
	}

	public List<Map<String, Object>> getParam(String url, Map<String, Object> map) {
		QueryPage queryPage = new QueryPage();
		queryPage.setParamsByMap(map);
		queryPage.setQueryParam(url);
		// 查询人员并替换新旧表单相关人员信息(姓名)
		List<Map<String, Object>> list = formService.queryBySqlId(queryPage);
		return list;
	}

}
