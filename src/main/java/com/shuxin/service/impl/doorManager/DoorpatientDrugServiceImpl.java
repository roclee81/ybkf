package com.shuxin.service.impl.doorManager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.mapper.doorManager.DoorpatientDrugMapper;
import com.shuxin.model.DoorPatient;
import com.shuxin.model.DoorpatientDrug;
import com.shuxin.model.MgLimit;
import com.shuxin.service.doorManager.IDoorpatientDrugService;

@Service
public class DoorpatientDrugServiceImpl extends ServiceImpl<DoorpatientDrugMapper,DoorpatientDrug>   implements IDoorpatientDrugService{
   @Autowired
	private DoorpatientDrugMapper doorpatientDrugMapper;

@Override
public void deletebySFZHM(String sfzhm) {
	// TODO Auto-generated method stub
	DoorpatientDrug  doorpatientDrug=new DoorpatientDrug();
	doorpatientDrug.setSfzhm(sfzhm);
	  EntityWrapper<DoorpatientDrug> wrapper = new EntityWrapper<DoorpatientDrug>(doorpatientDrug);
	doorpatientDrugMapper.delete(wrapper);
}

@Override
public void insertdoorpatientDrug(DoorpatientDrug doorpatientDrug) {
	// TODO Auto-generated method stub
	this.insert(doorpatientDrug);
}

@Override
public void deletedoorpatientDrug(String ids, ShiroUser user) {
	// TODO Auto-generated method stub

	DoorpatientDrug  newPatient  = new DoorpatientDrug();
    EntityWrapper<DoorpatientDrug> wrapper = new EntityWrapper<DoorpatientDrug>(newPatient);
  
    	  if(ids!=null){
 	       	 wrapper.where("sfzhm ={0}", ids);
 			}
	this.delete(wrapper);
}

@Override
public String getZdmcByZdbm(String sfzhm, String zdbm) {
	// TODO Auto-generated method stub
	String zdmc = doorpatientDrugMapper.getZdmcByZdbm(sfzhm,zdbm);
	return zdmc;
}

@Override
public List<DoorpatientDrug> getPatientDrugBySFZHM(String sfzhm) {
	// TODO Auto-generated method stub
	List<DoorpatientDrug> list = doorpatientDrugMapper.getPatientDrugBySFZHM(sfzhm);
	return list;
}
	
}
