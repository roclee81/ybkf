package com.shuxin.service.impl.decisionAnalysis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.enums.CostStructEnum;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.ReflexUtils;
import com.shuxin.mapper.decisionAnalysis.CostStructMapper;
import com.shuxin.model.CommonModel;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.service.decisionAnalysis.ICostStructService;

@Service
public class CostStructServiceImpl extends ServiceImpl<CostStructMapper,CommonModel> implements ICostStructService {


	@Autowired
	private CostStructMapper costStructMapper;
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, List<String>> selectEcharsData(CostStructVo costStructVo) throws Exception {
		System.out.println(costStructVo);
		String echarsFlags[] = costStructVo.getMethodFlag().split(",");
		String methodName=null;
		List<Map<String, String>> list = null;
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		for(String echarsFlag : echarsFlags)
		{
			methodName = CostStructEnum.getEnumValue(echarsFlag);
			list = (List<Map<String, String>>)ReflexUtils.methodInvoke(costStructMapper, methodName, costStructVo);			
			ReflexUtils.wrapperMap2(map,list,echarsFlag);
		}
		
		return map;
	}

	@Override
	public void SelectCostStructVoPage(PageInfo pageInfo,String tableFlag)throws Exception {
		Page<CostStructVo> page = new Page<CostStructVo>(pageInfo.getNowpage(), pageInfo.getSize());
        //String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(pageInfo.getSort());
        page.setAsc("asc".equalsIgnoreCase(pageInfo.getOrder()));
        String methodName=CostStructEnum.getEnumValue(tableFlag);;
        Class[] paramType = {Page.class,Map.class};
    	Object[] parameters ={page,pageInfo.getCondition()};
    	@SuppressWarnings("unchecked")
		List<Map<String,Object>> list = (List<Map<String, Object>>)ReflexUtils.methodInvoke(costStructMapper, methodName, paramType, parameters);
    	pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

}
