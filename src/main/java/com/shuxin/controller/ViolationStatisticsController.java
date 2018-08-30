package com.shuxin.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IViolationStatisticsService;

@Controller
@RequestMapping("/violationStatistic")
public class ViolationStatisticsController extends BaseController{
	
	@Autowired
	IViolationStatisticsService ViolationStatisticsService ;
	
	@RequestMapping("/Ordering")
	@ResponseBody
	public Object getOrderingData(MgquotaVo mgquotaVo,String flag){
		return JsonUtils.toJson(ViolationStatisticsService.getOrderingData(getParams(mgquotaVo)));
	}
	
	@RequestMapping("/violationSummary")
	@ResponseBody
	public Object getSHViolationSummary(MgquotaVo mgquotaVo,String data,Integer page, Integer rows,String flag){
		
		PageInfo pageInfo = new PageInfo(page, rows, "", "");
		
		String dataType = mgquotaVo.getLx();
		Map<String, Object> map = getParams(mgquotaVo);
		if(dataType.equals("gzbm"))
		{
			map.put("gzbm", data);
		}
		if(dataType.equals("ksbm"))
		{
			map.put("ksbm", data);
		}
		if(dataType.equals("ysgh"))
		{
			map.put("ysgh", data);
		}
		pageInfo.setCondition(map);
		
		return JsonUtils.toJson(ViolationStatisticsService.getSHViolationSummary(pageInfo));
	}
	
	/**
	 * 获取违规详情，其中规则违规中整单违规需显示所有费用信息
	 * 其余情况显示违规信息
	 * @param mgquotaVo
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/violationDetails")
	@ResponseBody
	public Object getSHviolationDetails(MgquotaVo mgquotaVo,Integer page, Integer rows,String flag){
		
		PageInfo pageInfo = new PageInfo(page, rows, "", "");
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("jzlsh", mgquotaVo.getMzlsh());
		pageInfo.setCondition(map);
		Object object = null;
		if(mgquotaVo.getLx().equals("rule")&&!mgquotaVo.getGzbm().equals("-"))
		{
			//  规则违规  且为整单违规
			object= ViolationStatisticsService.getSHWholeviolationDetails(pageInfo);
		}else 
		{
			//    非整单违规
			object = ViolationStatisticsService.getSHviolationDetails(pageInfo);
		}
		
		return JsonUtils.toJson(object);
	}
	
	
	
	public Map<String, Object> getParams(MgquotaVo mgquotaVo){
		Map<String, Object> params = new HashMap<String,Object>();
		params.put("syear", mgquotaVo.getSyear());
		params.put("smonth", mgquotaVo.getSmonth());
		params.put("cblxbm", mgquotaVo.getCblxbm());
		params.put("ksbm", mgquotaVo.getKsbm());
		params.put("lx", mgquotaVo.getLx());
		return params;
	}

	
}
