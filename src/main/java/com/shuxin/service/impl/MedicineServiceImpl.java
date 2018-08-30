package com.shuxin.service.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.DepartmentMapper;
import com.shuxin.mapper.MedicinesMapper;
import com.shuxin.model.Department;
import com.shuxin.model.Medicines;

import com.shuxin.service.IMedicineService;

@Service
public class MedicineServiceImpl  extends ServiceImpl<MedicinesMapper,Medicines> implements IMedicineService {
   @Autowired 
   private MedicinesMapper medicinesMapper;
	
	@Override
	public void selectMedicineByCondition(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		 Page<Medicines> page = new Page<Medicines>(pageInfo.getNowpage(), pageInfo.getSize());
//	        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
//	        page.setOrderByField(orderField);
	//        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
	        List<Medicines> list = medicinesMapper.selectMedicineByCondition(page, pageInfo.getCondition());
	        pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());
		
		
	}

	@Override
	public List<Medicines> findMedicineType(String clum) {
		// TODO Auto-generated method stub
		 EntityWrapper<Medicines> wrapper = new EntityWrapper<Medicines>();
		 wrapper.setSqlSelect(" distinct "+clum+"   " );
		 
	       return medicinesMapper.selectList(wrapper);
	}

	@Override
	public List<Medicines> selectByLoginName(Medicines medicine) {
		// TODO Auto-generated method stub
		Medicines  newmedicine = new Medicines();
		newmedicine.setYpmc(medicine.getYpmc());
      newmedicine.setYpdm(medicine.getYpdm());
        EntityWrapper<Medicines> wrapper = new EntityWrapper<Medicines>(newmedicine);
      if (null != newmedicine.getYpdm()) {
            wrapper.where("ypdm != {0}", newmedicine.getYpdm());
        }
        return this.selectList(wrapper);
	}
	@Override
	public List<Medicines> selectBydm(Medicines medicine) {
		// TODO Auto-generated method stub
		Medicines  newmedicine = new Medicines();
	//	newmedicine.setYpmc(medicine.getYpmc());
		newmedicine.setYpdm(medicine.getYpdm());
		EntityWrapper<Medicines> wrapper = new EntityWrapper<Medicines>(newmedicine);
		/*if (null != newmedicine.getYpdm()) {
			wrapper.where("ypdm != {0}", newmedicine.getYpdm());
		}*/
		return this.selectList(wrapper);
	}

	@Override
	public void insertMedicine(Medicines medicine) {
		// TODO Auto-generated method stub
		
		
		this.insert(medicine);
	}

	@Override
	public Medicines selectMedicineById(String id) {
		// TODO Auto-generated method stub
		 return medicinesMapper.selectById(id);
	}

	@Override
	public void updateMedicine(Medicines medicine) {
		// TODO Auto-generated method stub
		 this.updateById(medicine);
	
	}

	@Override
	public void deleteMedicineById(List<String> medicineIds) {
		// TODO Auto-generated method stub
		this.deleteBatchIds(medicineIds);
	}

	@Override
	public List<Medicines> selectByYpdm(String ypdm) {
		// TODO Auto-generated method stub
		Medicines  newmedicine = new Medicines();
		newmedicine.setYpdm(ypdm);
        EntityWrapper<Medicines> wrapper = new EntityWrapper<Medicines>(newmedicine);
   
        
        return this.selectList(wrapper);
	}

	
}
