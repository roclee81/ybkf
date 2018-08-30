package com.shuxin.service.impl.decisionAnalysis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.enums.InsuranceViolationEnums;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.ReflexUtils;
import com.shuxin.mapper.decisionAnalysis.InsuranceViolationMappe;
import com.shuxin.model.CommonModel;
import com.shuxin.model.vo.InsuranceViolationVo;
import com.shuxin.service.decisionAnalysis.IInsuranceViolationService;

@Service
public class InsuranceViolationServiceImpl extends ServiceImpl<InsuranceViolationMappe,CommonModel> implements IInsuranceViolationService {

	@Autowired
	private InsuranceViolationMappe insuranceViolationMappe;

	@Override
	public Map<String, List<String>> selectEcharsData(InsuranceViolationVo insuranceViolationVo) throws Exception {
		String echarsFlags[] = insuranceViolationVo.getMethodFlag().split(",");
		String methodName=null;
		List<Map<String, String>> list = null;
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		for(String echarsFlag : echarsFlags)
		{
			methodName = InsuranceViolationEnums.getEnumValue(echarsFlag);
			list = (List<Map<String, String>>)ReflexUtils.methodInvoke(insuranceViolationMappe, methodName, insuranceViolationVo);
			
			ReflexUtils.wrapperMap2(map,list,echarsFlag);
		}
		
		return map;
	}

	@Override
	public void SelectInsuranceViolationVoPage(PageInfo pageInfo,String tableFlag)throws Exception {
		Page<InsuranceViolationVo> page = new Page<InsuranceViolationVo>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc("asc".equalsIgnoreCase(pageInfo.getOrder()));
        String methodName=InsuranceViolationEnums.getEnumValue(tableFlag);;
        Class[] paramType = {Page.class,Map.class};
    	Object[] parameters ={page,pageInfo.getCondition()};

    	List<Map<String,Object>> list = (List<Map<String, Object>>)ReflexUtils.methodInvoke(insuranceViolationMappe, methodName, paramType, parameters);
    	
    	pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

}
