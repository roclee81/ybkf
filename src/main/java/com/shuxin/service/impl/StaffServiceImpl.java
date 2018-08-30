package com.shuxin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.support.json.JSONParser;
import com.alibaba.druid.support.json.JSONUtils;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.StaffMapper;
import com.shuxin.model.Role;
import com.shuxin.model.Staff;
import com.shuxin.service.IStaffService;

@Service
public class StaffServiceImpl extends ServiceImpl<StaffMapper, Staff> implements IStaffService{
	@Autowired
	private StaffMapper staffMapper;
	
	@Override
    public void selectDataGrid(PageInfo pageInfo,Staff staff) {
        Page<Staff> page = new Page<Staff>(pageInfo.getNowpage(), pageInfo.getSize());  
        EntityWrapper<Staff> wrapper = new EntityWrapper<Staff>();
        if(staff.getRybh()!=null){
        	wrapper.like("rybh", staff.getRybh());
        }
        if(staff.getXm()!=null){
        	wrapper.like("xm", staff.getXm());
        }
        if(staff.getRylb()!=null){
        	wrapper.like("rylb", staff.getRylb());
        }
        if(staff.getKsbm()!=null){
        	wrapper.like("ksbm", staff.getKsbm());
        }
        wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
        selectPage(page, wrapper);
        pageInfo.setRows(page.getRecords());
        pageInfo.setTotal(page.getTotal());
    }
	//联想动态查询效果，方案被否。
//	@Override
//    public void selectDataGrid(PageInfo pageInfo,String filterRules) {
//        Page<Staff> page = new Page<Staff>(pageInfo.getNowpage(), pageInfo.getSize());
//        
//        EntityWrapper<Staff> wrapper = new EntityWrapper<Staff>();
//        wrapper.orderBy(pageInfo.getSort(), pageInfo.getOrder().equalsIgnoreCase("ASC"));
//        List<HashMap<String, Object>> filter= JsonUtils.parse(filterRules, ArrayList.class);
//        for (HashMap<String, Object> map : filter) {
//        	//如果有姓名这个条件
//			if(map.get("field").toString().equals("xm")){
//				wrapper.like("xm", map.get("value").toString());
//			}
//			if(map.get("field").toString().equals("ksbm")){
//				wrapper.like("ksbm", map.get("value").toString());
//			}
//			if(map.get("field").toString().equals("rybh")){
//				wrapper.like("rybh", map.get("value").toString());
//			}
//			if(map.get("field").toString().equals("rylb")){
//				wrapper.like("rylb", map.get("value").toString());
//			}
//		}
//        
//        selectPage(page, wrapper);        
//        pageInfo.setRows(page.getRecords());
//        pageInfo.setTotal(page.getTotal());
//    }

	@Override
	public List<Map<String, Object>> selectrylb() {
		// TODO Auto-generated method stub
		return staffMapper.selectrylb();
	}
}
