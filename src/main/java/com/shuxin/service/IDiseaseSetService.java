package com.shuxin.service;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;

public interface IDiseaseSetService<DiseaseSetModel> extends IService<DiseaseSetModel>{
	
	public Object changeDiseaseSet(DiseaseSetModel diseaseSetModel);
	
	public void getDiseaseSetDatarid(PageInfo pageInfo);
	
}