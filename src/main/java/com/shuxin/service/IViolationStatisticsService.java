package com.shuxin.service;

import java.util.Map;

import com.shuxin.commons.utils.PageInfo;

public interface IViolationStatisticsService  {

	public Object getOrderingData(Map<String, Object> params);
	
	public Object getSHViolationSummary(PageInfo pageInfo);
	
	public Object getSHviolationDetails(PageInfo pageInfo);
	
	public Object getSHWholeviolationDetails(PageInfo pageInfo);
	
}
