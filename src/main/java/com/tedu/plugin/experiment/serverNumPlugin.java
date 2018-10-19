package com.tedu.plugin.experiment;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.tedu.base.common.error.ErrorCode;
import com.tedu.base.common.error.ValidException;
import com.tedu.base.engine.aspect.ILogicPlugin;
import com.tedu.base.engine.dao.FormMapper;
import com.tedu.base.engine.model.FormEngineRequest;
import com.tedu.base.engine.model.FormEngineResponse;
import com.tedu.base.engine.model.FormModel;
import com.tedu.base.engine.service.FormService;
import com.tedu.base.task.SpringUtils;

@Service("serverNumPlugin")
public class serverNumPlugin implements ILogicPlugin {
	@Resource
	FormService formService;
	FormMapper formMapper = SpringUtils.getBean("simpleDao");
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public Object doBefore(FormEngineRequest requestObj, FormModel formModel) {
		Map<String, Object> data = formModel.getData();
		List<Map<String, Object>> list = (List<Map<String, Object>>) data.get("meetDis");
		log.info("list-->"+list);
		for (Map<String, Object> map : list) {
			log.info("map-->"+map);
			int size = map.size();
			String serverNum = map.get("serverNum").toString();
			log.info("serverNum-->"+serverNum);
			if(StringUtils.isEmpty(serverNum)) {
				throw new ValidException(ErrorCode.INVALIDATE_FORM_DATA, "镜像校验", "镜像数量不能为空！" );	
			}else if(Integer.parseInt(serverNum)<=0) {
				throw new ValidException(ErrorCode.INVALIDATE_FORM_DATA, "镜像校验", "镜像数量不能小于等于零！" );
			}
		}
		return formModel;
	}

	@Override
	public void doAfter(FormEngineRequest requestObj, FormModel formModel, Object beforeResult,
			FormEngineResponse responseObj) {
	}

}
