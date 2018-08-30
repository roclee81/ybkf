package com.shuxin.service;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.model.DoctorGroup;

public interface IDoctorGroupService extends IService<DoctorGroup> {

 public	List<DoctorGroup> findByksbm(String ksbm);

public List<DoctorGroup> selectByylzbm(String ylzbm);

public boolean add(String ylzmc,String ssksbm,String ylzbm);

public boolean edit(String ylzmc,String ssksbm,String ylzbm,String id);

public List<DoctorGroup> selectByLoginName(DoctorGroup doctorGroup);

public void insertDoctorGroup(DoctorGroup doctorGroup);

public void updateDoctorGroup(DoctorGroup doctorGroup);


	
}
