package com.shuxin.service.doorManager;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.model.DoorpatientDrug;

public interface IDoorpatientDrugService  extends IService<DoorpatientDrug>{

	public void deletebySFZHM(String sfzhm);

	public void insertdoorpatientDrug(DoorpatientDrug doorpatientDrug);

	public void deletedoorpatientDrug(String ids, ShiroUser user);

	public String getZdmcByZdbm(String sfzhm,String zdbm);
	
	public List<DoorpatientDrug> getPatientDrugBySFZHM(String sfzhm);
	
}
