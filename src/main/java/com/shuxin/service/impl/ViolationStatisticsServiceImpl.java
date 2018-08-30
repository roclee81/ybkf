package com.shuxin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.ReflexUtils;
import com.shuxin.mapper.ViolationStatisticsMapper;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IViolationStatisticsService;

@Service
public class ViolationStatisticsServiceImpl    implements IViolationStatisticsService {

	@Autowired
	ViolationStatisticsMapper violationStatisticsMapper;
	
	@Override
	public Object getOrderingData(Map<String, Object> params) 
	{
		List<Map<String, String>> list = null;
		if(params.get("lx").equals("rule"))
		{
			list = violationStatisticsMapper.getRuleOrderingData(params);
		}
		if(params.get("lx").equals("doctor"))
		{
			list = violationStatisticsMapper.getDoctorOrderingData(params);
		}
		if(params.get("lx").equals("department"))
		{
			list = violationStatisticsMapper.getDepartmentOrderingData(params);
		}
		
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		
		if(list!=null)
		{
			ReflexUtils.wrapperMap2(map, list, "order");
		}
		return map;
	}

	@Override
	public Object getSHViolationSummary(PageInfo pageInfo) {
		Page<MgquotaVo> page = new Page<MgquotaVo>(pageInfo.getNowpage(), pageInfo.getSize());
		List<Map<String, Object>> list = violationStatisticsMapper.getSHViolationSummary(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
		return pageInfo;
	}
	
	@Override
	public Object getSHviolationDetails(PageInfo pageInfo) {
		Page<MgquotaVo> page = new Page<MgquotaVo>(pageInfo.getNowpage(), pageInfo.getSize());
		List<Map<String, Object>> list = violationStatisticsMapper.getSHviolationDetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
		return pageInfo;
	}
	
	@Override
	public Object getSHWholeviolationDetails(PageInfo pageInfo) {
		Page<MgquotaVo> page = new Page<MgquotaVo>(pageInfo.getNowpage(), pageInfo.getSize());
		List<Map<String, Object>> list = violationStatisticsMapper.getSHWholeviolationDetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
		return pageInfo;
	}
	
	
	
	
	


}
