package com.shuxin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.DiseaseSetMapper;
import com.shuxin.model.DiseaseSetModel;
import com.shuxin.service.IDiseaseSetService;

@Service
public class DiseaseSetServiceImpl  extends ServiceImpl<DiseaseSetMapper,DiseaseSetModel>   implements IDiseaseSetService<DiseaseSetModel> {
 
	@Autowired
	DiseaseSetMapper diseaseSetMapper;
	
	/**
	 * 执行 DiseaseSetModel 新增修改操作
	 */
	@Override
	public Object changeDiseaseSet(DiseaseSetModel diseaseSetModel){
		
		String idString = diseaseSetModel.getId();
		
		// 判断是否为新增
		if(StringUtils.isNotBlank(idString))
		{
			//修改
			Boolean flag = this.updateById(diseaseSetModel);
			if(flag)
			{
				return "修改成功";
			}
			return "修改失败";
		}else
		{
			// 执行新增操作
			Boolean flag = this.insert(diseaseSetModel);
			if(flag)
			{
				return "添加成功";
			}
			return "添加失败";
		}
		
	}



	@Override
	public void getDiseaseSetDatarid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<DiseaseSetModel> page = new Page<DiseaseSetModel>(pageInfo.getNowpage(), pageInfo.getSize());
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = diseaseSetMapper.getDiseaseSetDatarid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
}
