package com.shuxin.service.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.condition.ParamsRequestCondition;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Role;
import com.shuxin.service.IDataGridService;

public class DataGridServiceImpl<T> extends ServiceImpl<BaseMapper<T>, T> implements IDataGridService<T>{
	
	@Override
	public void getListByCondition(EntityWrapper<T> wrapper,PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Map<String, Object> conditions= pageInfo.getCondition();
//		int flag=0;
//		for (String key : conditions.keySet()) {
//			if(flag==0){
//				wrapper.where(key, conditions.get(key));
//				flag++;
//				continue;
//			}
//			wrapper.and(key, conditions.get(key));
//		}
		Page<T> page = new Page<T>(pageInfo.getNowpage(), pageInfo.getSize());
        wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
		selectPage(page, wrapper);
        pageInfo.setRows(page.getRecords());
        pageInfo.setTotal(page.getTotal());
	}
}
