package com.shuxin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.mapper.DoctorGroupMapper;
import com.shuxin.model.Department;
import com.shuxin.model.DoctorGroup;
import com.shuxin.service.IDoctorGroupService;

@Service
public class DoctorGroupServiceImpl  extends ServiceImpl<DoctorGroupMapper,DoctorGroup>   implements IDoctorGroupService {

	@Autowired
	private  DoctorGroupMapper doctorGroupMapper;

	@Override
	public List<DoctorGroup> findByksbm(String ksbm) {
		 EntityWrapper<DoctorGroup> wrapper = new EntityWrapper<DoctorGroup>();

		// wrapper.setSqlSelect(" distinct  ylzbm " );

		 if(ksbm !=null){

			 wrapper.where("ssksbm={0}", ksbm);
		 }
		 wrapper.orderBy("ylzbm");
		return doctorGroupMapper.selectList(wrapper);
	}

	@Override
	public List<DoctorGroup> selectByylzbm(String ylzbm) {
		// TODO Auto-generated method stub
		DoctorGroup  newdepart = new DoctorGroup();
		newdepart.setYlzbm(ylzbm);
        EntityWrapper<DoctorGroup> wrapper = new EntityWrapper<DoctorGroup>(newdepart);
       
        return this.selectList(wrapper);
	}
	
	
	public boolean add(String ylzmc,String ssksbm,String ylzbm){
		DoctorGroup doctorGroup=new DoctorGroup();
		doctorGroup.setSsksbm(ssksbm);
		doctorGroup.setYlzmc(ylzmc);
		doctorGroup.setYlzbm(ylzbm);
		doctorGroup.setYlzqybz("1");
		return insert(doctorGroup);
	}
	public boolean edit(String ylzmc,String ssksbm,String ylzbm,String id){
		DoctorGroup doctorGroup=new DoctorGroup();
		doctorGroup.setSsksbm(ssksbm);
		doctorGroup.setYlzmc(ylzmc);
		doctorGroup.setYlzbm(ylzbm);
		doctorGroup.setYlzqybz("1");
		doctorGroup.setId(id);
		return updateById(doctorGroup);
	}

	@Override
	public List<DoctorGroup> selectByLoginName(DoctorGroup doctorGroup) {
		// TODO Auto-generated method stub
		DoctorGroup  newdoctorGroup=new DoctorGroup();
		newdoctorGroup.setYlzmc(doctorGroup.getYlzmc());
        EntityWrapper<DoctorGroup> wrapper = new EntityWrapper<DoctorGroup>(newdoctorGroup);
        if (null != doctorGroup.getId()) {
            wrapper.where("id != {0}", doctorGroup.getId());
        }
        return this.selectList(wrapper);
	}

	@Override
	public void insertDoctorGroup(DoctorGroup doctorGroup) {
		// TODO Auto-generated method stub
	//	doctorGroup.setYlzqybz("1");
		this.insert(doctorGroup);
	}

	@Override
	public void updateDoctorGroup(DoctorGroup doctorGroup) {
		// TODO Auto-generated method stub
	//	doctorGroup.setYlzqybz("1");
		this.updateById(doctorGroup);
	}
	
	
	
}
