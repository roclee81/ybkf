package com.shuxin.service.impl.doorManager;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.doorManager.DoorPatientMapper;
import com.shuxin.model.Department;
import com.shuxin.model.DoorPatient;
import com.shuxin.model.MgLimit;
import com.shuxin.model.vo.DoorPatientVo;
import com.shuxin.service.doorManager.IPatientRegistService;

@Service
public class PatientRegistServiceImpl extends ServiceImpl<DoorPatientMapper,DoorPatient>   implements IPatientRegistService{
    @Autowired
	private  DoorPatientMapper doorPatientMapper;

	@Override
	public void deleteMg(String ids, ShiroUser user) {
		// TODO Auto-generated method stub
		
		
		DoorPatient  newPatient  = new DoorPatient();
        EntityWrapper<DoorPatient> wrapper = new EntityWrapper<DoorPatient>(newPatient);
      
        	  if(ids!=null){
     	       	 wrapper.where("sfzhm ={0}", ids);
     			}
		this.delete(wrapper);	
		
	}

	@Override
	public void updateMg(DoorPatient doorPatient) {
		// TODO Auto-generated method stub
		if(doorPatient.getId()!=null&&StringUtils.isNotBlank(doorPatient.getId())){
			System.out.println("update");
			System.out.println(doorPatient);
			this.updateById(doorPatient);
		}else{
			System.out.println("insert");
			this.insert(doorPatient);
		}
		
	}

	@Override
	public void selectpatientregislistdataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		 Page<DoorPatientVo> page = new Page<DoorPatientVo>(pageInfo.getNowpage(), pageInfo.getSize());
	        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
	        page.setOrderByField(orderField);
	        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
	        List<Map<String, Object>> list = doorPatientMapper.selectpatientregislistdataGrid(page, pageInfo.getCondition());
	        pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<DoorPatient> selectByVo(DoorPatient doorPatient) {
		// TODO Auto-generated method stub
		  EntityWrapper<DoorPatient> wrapper = new EntityWrapper<DoorPatient>(doorPatient);
	        if(doorPatient.getId()!=null&&StringUtils.isNotBlank(doorPatient.getId())){
	       	 wrapper.where("id != {0}", doorPatient.getId());
			}
	        return doorPatientMapper.selectList(wrapper);
	}
	@Override
	  public List<DoorPatient> selectBysfh(DoorPatientVo doorPatientvo) {
		DoorPatient  newPatient  = new DoorPatient();
		newPatient.setSfzhm(doorPatientvo.getSfzhm());
        EntityWrapper<DoorPatient> wrapper = new EntityWrapper<DoorPatient>(newPatient);
        if(doorPatientvo.getId()!=null&&StringUtils.isNotBlank(doorPatientvo.getId())){
	       	 wrapper.where("id != {0}", doorPatientvo.getId());
			}
      return this.selectList(wrapper);
  	}
	
}
