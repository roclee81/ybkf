package com.shuxin.service.doorManager;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.DoorPatient;
import com.shuxin.model.MgLimit;
import com.shuxin.model.vo.DoorPatientVo;

public interface IPatientRegistService extends IService<DoorPatient> {

	 public void deleteMg(String ids, ShiroUser user);

	public void updateMg(DoorPatient doorPatient);

	public void selectpatientregislistdataGrid(PageInfo pageInfo);

	public List<DoorPatient> selectByVo(DoorPatient doorPatient);

	List<DoorPatient> selectBysfh(DoorPatientVo doorPatientvo);
	
	
	

}
