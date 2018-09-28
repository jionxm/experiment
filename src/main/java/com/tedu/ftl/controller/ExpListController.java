
package com.tedu.ftl.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.googlecode.aviator.AviatorEvaluator;
import com.tedu.base.auth.login.model.UserModel;
import com.tedu.base.auth.login.service.LoginService;
import com.tedu.base.common.page.QueryPage;
import com.tedu.base.common.utils.ConstantUtil;
import com.tedu.base.common.utils.DateUtils;
import com.tedu.base.common.utils.SessionUtils;
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
public class ExpListController {
	@Resource
	private LoginService loginService;
	@Value("${base.image.logImg}")
	private String logImg;
	@Value("${base.image.loginImg}")
	private String loginImg;
	@Value("${base.image.sysName}")
	private String sysName;
	@Value("${base.image.loginLogo}")
	private String loginLogo;

	@Value("${base.notice}")
	private String notice;

	@Value("${base.title}")
	private String baseTitle;
	@Value("${base.copyright}")
	private String copyRight;

	@Value("${base.app}")
	private String app;

	@Value("${base.ver}")
	private String ver;

	@Value("${ui.dialog.size.small}")
	private String small;
	@Value("${ui.dialog.size.medium}")
	private String medium;
	@Value("${ui.dialog.size.large}")
	private String large;

	@Value("${base.image.favicon.png}")
	private String faviconPng;

	@Value("${base.image.favicon.ico}")
	private String faviconIco;

	private String cid;
	@Resource
	private FormTokenService formTokenService;
	@Resource
	private FormService formService;
	FormMapper formMapper = SpringUtils.getBean("simpleDao");
	@Value("${uc.index}")
	private String ucIndex;
	// 日志记录器
	public final Logger log = Logger.getLogger(this.getClass());

	public List<Map<String, Object>> getParam(String url, Map<String, Object> map) {
		QueryPage queryPage = new QueryPage();
		queryPage.setParamsByMap(map);
		queryPage.setQueryParam(url);
		// 查询人员并替换新旧表单相关人员信息(姓名)
		List<Map<String, Object>> list = formService.queryBySqlId(queryPage);
		return list;
	}

	public List<Map<String, Object>> getParams(String url, String eq, String param) {
		QueryPage queryPage = new QueryPage();
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put(eq, param);
		queryPage.setParamsByMap(mapParam);
		queryPage.setQueryParam(url);
		// 查询人员并替换新旧表单相关人员信息(姓名)
		List<Map<String, Object>> list = formService.queryBySqlId(queryPage);
		return list;
	}

	public List<Map<String, Object>> getParams2(String url, String eq1, String param1, String eq2, String param2) {
		QueryPage queryPage = new QueryPage();
		Map<String, Object> mapParam = new HashMap<>();
		mapParam.put(eq1, param1);
		mapParam.put(eq2, param2);
		queryPage.setParamsByMap(mapParam);
		queryPage.setQueryParam(url);
		// 查询人员并替换新旧表单相关人员信息(姓名)
		List<Map<String, Object>> list = formService.queryBySqlId(queryPage);
		return list;
	}

	@RequestMapping("/experiment")
	public String experiment(Model model, HttpServletRequest request) {
		model.addAttribute("loginImg", loginImg);
		model.addAttribute("loginLogo", loginLogo);
		model.addAttribute("cid", AviatorEvaluator.execute("Guid()").toString());
		model.addAttribute("app", app);
		model.addAttribute("ver", ver);
		model.addAttribute("notice", notice);
		model.addAttribute("baseTitle", baseTitle);
		model.addAttribute("copyRight", copyRight);
		model.addAttribute("faviconPng", faviconPng);
		model.addAttribute("faviconIco", faviconIco);
		model.addAttribute("ucIndex", ucIndex);
		model.addAttribute("date", DateUtils.getDateToStr("yyyyMMdd", new Date()));
		String token = request.getParameter("token");
		log.info("token:" + token);
		log.info("请求验证中。。。");
		model.addAttribute("ucToken", token);
		return "pc/experiment-login";
	}

	@RequestMapping("/experiment-list")
	public String experimentList(Model model, HttpServletRequest request) {
		UserModel userModel = (UserModel) SessionUtils.getAttrbute(ConstantUtil.USER_INFO);
		if (userModel != null) {
			List<Map<String, Object>> list = getParams("experiment/QryScheduleAi", "1", "1");
			List<Map<String, Object>> list2 = getParams("experiment/QryScheduleAi2", "1", "1");
			// 绑定sql语句
			// 添加数据
			if (!list.isEmpty() && list.size() > 0) {
				model.addAttribute("aiList", list);
				model.addAttribute("aiList2", list2);
			} else {
				Map<String, Object> map = null;
				model.addAttribute("aiList", list);
			}
			list = getParams("experiment/QryScheduleOt", "1", "1");
			if (!list.isEmpty() && list.size() > 0) {
				model.addAttribute("otherList", list);
			} else {
				Map<String, Object> map = null;
				model.addAttribute("otherList", list);
			}
			return "pc/ExperimentList";
		} else {
			model.addAttribute("baseTitle", baseTitle);
	        model.addAttribute("loginImg", loginImg);
	        model.addAttribute("loginLogo", loginLogo);
	        model.addAttribute("notice", notice);
	        model.addAttribute("copyRight", copyRight);
	        model.addAttribute("faviconPng", faviconPng);
	        model.addAttribute("faviconIco", faviconIco);
			return "login";
		}
	}

	@RequestMapping("/experiment-process")
	public String experimentProcess(Model model, HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		UserModel userModel = (UserModel) SessionUtils.getAttrbute(ConstantUtil.USER_INFO);
		model.addAttribute("baseTitle", baseTitle);
        model.addAttribute("loginImg", loginImg);
        model.addAttribute("loginLogo", loginLogo);
        model.addAttribute("notice", notice);
        model.addAttribute("copyRight", copyRight);
        model.addAttribute("faviconPng", faviconPng);
        model.addAttribute("faviconIco", faviconIco);
		if (userModel != null) {
			String id = request.getParameter("exp");
			if (StringUtils.isNotEmpty(id)) {
				model.addAttribute("expId", id);
				String egId = null;
				String studentId = String.valueOf(SessionUtils.getUserInfo().getUserId());
				model.addAttribute("studentId", studentId);
				List<Map<String, Object>> expScheduleList = getParams("experiment/QrySchedule", "eq_id", id);
				model.addAttribute("expScheduleList", expScheduleList);
				for (int i = 0; i < expScheduleList.size(); i++) {
					Map<String, Object> exp = expScheduleList.get(i);
					egId = String.valueOf(exp.get("egId"));
					String countDown = exp.get("countDown").toString();
					String endTime = exp.get("endTime").toString();
					Calendar calendar = Calendar.getInstance();
					calendar.add(Calendar.HOUR_OF_DAY, Integer.parseInt(countDown));
					Date time = calendar.getTime();
					String count = DateUtils.getDateToStr(DateUtils.YYMMDD_HHMMSS_24, time);
					exp.put("countDown", count);
				}
				List<Map<String, Object>> expSoftwareList = getParams("experiment/QryExpSoftware", "eq_egId", egId);
				model.addAttribute("expSoftwareList", expSoftwareList);
				List<Map<String, Object>> expOperateList = getParams("experiment/QryOperateEnvironment", "eq_egId",
						egId);
				model.addAttribute("expOperateList", expOperateList);
				List<Map<String, Object>> expDisList = getParams("experiment/QryExpDis", "eq_egId", egId);
				model.addAttribute("expDisList", expDisList);
				List<Map<String, Object>> expFileList = getParams("experiment/QryExpFile", "eq_egId", egId);
				model.addAttribute("expFileList", expFileList);
				List<Map<String, Object>> studentRecordList = getParams2("experiment/QryStuRecord", "eq_scheduleId", id,
						"eq_studentId", studentId);
				log.info(studentRecordList);
				if (!studentRecordList.isEmpty() && studentRecordList.size() > 0) {
					Map<String, Object> map = studentRecordList.get(0);
					model.addAttribute("studentRecord", map);
				} else {
					Map<String, Object> map = null;
					model.addAttribute("studentRecord", map);
				}
				return "pc/ExperimentProcess";
			} else {
				return "login";
			}
		} else {
			return "login";
		}

	}

	@RequestMapping("/electronic-reporting-page")
	public String electronicReportingPage(Model model, HttpServletRequest request) {
		model.addAttribute("baseTitle", baseTitle);
        model.addAttribute("loginImg", loginImg);
        model.addAttribute("loginLogo", loginLogo);
        model.addAttribute("notice", notice);
        model.addAttribute("copyRight", copyRight);
        model.addAttribute("faviconPng", faviconPng);
        model.addAttribute("faviconIco", faviconIco);
		ModelAndView modelAndView = new ModelAndView();
		UserModel userModel = (UserModel) SessionUtils.getAttrbute(ConstantUtil.USER_INFO);
		if (userModel != null) {
			String expId = request.getParameter("exp");
			if (StringUtils.isNotEmpty(expId)) {
				log.info(expId);
				model.addAttribute("expId", expId);
				String egId = null;
				String studentId = String.valueOf(SessionUtils.getUserInfo().getUserId());
				model.addAttribute("studentId", studentId);
				List<Map<String, Object>> expScheduleList = getParams("experiment/QrySchedule", "eq_id", expId);
				for (int i = 0; i < expScheduleList.size(); i++) {
					egId = String.valueOf(expScheduleList.get(i).get("egId"));
					for (Entry<String, Object> entry : expScheduleList.get(i).entrySet()) { 
//						  System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue()); 
						  String replacebr=String.valueOf(entry.getValue());
						  replacebr=replacebr.replace("\r\n", "<br>");
						  expScheduleList.get(i).put(entry.getKey(), replacebr);
						  System.err.println(expScheduleList.get(i));
						}
				}
				model.addAttribute("expScheduleList", expScheduleList);
				List<Map<String, Object>> expSoftwareList = getParams("experiment/QryExpSoftware", "eq_egId", egId);
				model.addAttribute("expSoftwareList", expSoftwareList);
				List<Map<String, Object>> expOperateList = getParams("experiment/QryOperateEnvironment", "eq_egId",
						egId);
				model.addAttribute("expOperateList", expOperateList);
				List<Map<String, Object>> expDisList = getParams("experiment/QryExpDis", "eq_egId", egId);
				model.addAttribute("expDisList", expDisList);
				List<Map<String, Object>> studentRecordList = getParams2("experiment/QryStuRecord", "eq_scheduleId",
						expId, "eq_studentId", studentId);
				log.info(studentRecordList);
				if (!studentRecordList.isEmpty() && studentRecordList.size() > 0) {
					Map<String, Object> map = studentRecordList.get(0);
					model.addAttribute("studentRecord", map);
					log.info(map);
				} else {
					Map<String, Object> map = null;
					model.addAttribute("studentRecord", map);
				}

				return "pc/ElectronicReportingPage";
			} else {
				return "login";
			}
		} else {
			return "login";
		}
	}

	@RequestMapping("/evaluation-achievement")
	public String evaluationAchievement(Model model, HttpServletRequest request) {
		model.addAttribute("baseTitle", baseTitle);
        model.addAttribute("loginImg", loginImg);
        model.addAttribute("loginLogo", loginLogo);
        model.addAttribute("notice", notice);
        model.addAttribute("copyRight", copyRight);
        model.addAttribute("faviconPng", faviconPng);
        model.addAttribute("faviconIco", faviconIco);
		ModelAndView modelAndView = new ModelAndView();
		UserModel userModel = (UserModel) SessionUtils.getAttrbute(ConstantUtil.USER_INFO);
		if (userModel != null) {
			String expId = request.getParameter("exp");
			log.info(expId);
			if (StringUtils.isNotEmpty(expId)) {
				model.addAttribute("expId", expId);
				String studentId = String.valueOf(SessionUtils.getUserInfo().getUserId());
				model.addAttribute("studentId", studentId);
				List<Map<String, Object>> studentRecordList = getParams2("experiment/QryStuRecord", "eq_scheduleId",
						expId, "eq_studentId", studentId);
				if (!studentRecordList.isEmpty() && studentRecordList.size() > 0) {
					Map<String, Object> map = studentRecordList.get(0);
					model.addAttribute("studentRecord", map);
				}
				return "pc/EvaluationAchievement";
			} else {
				return "login";
			}
		} else {
			return "login";
		}
	}

}
