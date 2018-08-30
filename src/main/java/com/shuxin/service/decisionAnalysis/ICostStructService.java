package com.shuxin.service.decisionAnalysis;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.CommonModel;
import com.shuxin.model.vo.CostStructVo;

public interface ICostStructService extends IService<CommonModel>{

	/**
	 * 为echars图表查询数据
	 * @param singleDiseaseVo
	 * @return
	 */
	public Map<String, List<String>> selectEcharsData(CostStructVo costStructVo) throws Exception;
	
	public void SelectCostStructVoPage(PageInfo pageInfo,String tableFlag)throws Exception;
	

}
