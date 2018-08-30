package com.shuxin.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.FormsMapper;
import com.shuxin.model.FormsModel;
import com.shuxin.model.MTDrgsCheck;
import com.shuxin.service.IFormsService;
@Service
public class FormsServiceImpl extends ServiceImpl<FormsMapper, FormsModel> implements IFormsService{
	
	@Autowired
  private  FormsMapper formsMapper;

	@Override
	public List<Map<String, Object>> defineFormsDataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		
		 Page<FormsModel> page = new Page<FormsModel>(pageInfo.getNowpage(), pageInfo.getSize());
		    // String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
		     page.setOrderByField(pageInfo.getSort());
		     page.setAsc("asc".equalsIgnoreCase(pageInfo.getOrder()));
		     List<Map<String, Object>> list = formsMapper.defineFormsDataGrid(page, pageInfo.getCondition());
		     pageInfo.setRows(list);
		     pageInfo.setTotal(page.getTotal());
		return list;
		
	}

	@Override
	public List<Map<String, Object>> defineFormseExport(FormsModel formsModel) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=formsMapper.defineFormseExport(formsModel);
		return list;
	}	
	
	
	
}
