package com.shuxin.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.DepartmentMapper;
import com.shuxin.model.Department;
import com.shuxin.service.IDepartmentService;

@Service
public class DepartmentServiceImpl  extends ServiceImpl<DepartmentMapper,Department>   implements IDepartmentService {
 
	@Autowired
	private DepartmentMapper departmentMapper;
	 
	
	@Override
	public List<Department> selectAll(PageInfo pageInfo) {
		
		  EntityWrapper<Department> wrapper = new EntityWrapper<Department>();
	      wrapper.orderBy("id");
	      return departmentMapper.selectList(wrapper);
	}

	@Override
	public List<Department> findDepartType(String clum,String ksbm,String kslx) {
		// TODO Auto-generated method stub
		 EntityWrapper<Department> wrapper = new EntityWrapper<Department>();
		 if(ksbm==null){
			 wrapper.setSqlSelect(" distinct   "+clum+"   " );
		 
		 }else{
		
			 wrapper.setSqlSelect(" distinct  ksdm  , "+clum+"   " );
			 wrapper.orderBy("ksdm");
			 
		 }
		 //"0000","0"代表全院，查询所有科室
		 if(StringUtils.isNotBlank(ksbm) && !"0000".equals(ksbm)&& !"0".equals(ksbm))
		 {
			 String[] arrKsbm = ksbm.split(",");
			 if(arrKsbm.length==1){
				 wrapper.where("ksdm={0}", ksbm);
			 }else{
				 for(int i=0;i<arrKsbm.length;i++){
					 wrapper.or("ksdm="+arrKsbm[i]); 
				 }
			 }
		 }
		 if(StringUtils.isNotBlank(kslx))
		 {			 
			 if(kslx.equals("qysy")){//  选择门诊和住院的所有科室
				 wrapper.where("mzsy=1").or("zysy=1");
			 }else{
				 wrapper.where(kslx+"='1'"); 
			 }
			 
		 }
	        return departmentMapper.selectList(wrapper);
	}

	@Override
	public void selectDepartByCondition(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		 Page<Department> page = new Page<Department>(pageInfo.getNowpage(), pageInfo.getSize());
	        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
	        page.setOrderByField(orderField);
	        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
	        List<Department> list = departmentMapper.selectDepartByCondition(page, pageInfo.getCondition());
	        pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public List<Department> selectByLoginName(Department depart) {
		Department  newdepart = new Department();
		newdepart.setKsmc(depart.getKsmc());
        EntityWrapper<Department> wrapper = new EntityWrapper<Department>(newdepart);
        if (null != depart.getKsdm()) {
            wrapper.where("ksdm != {0}", depart.getKsdm());
        }
        return this.selectList(wrapper);
	}

	@Override
	public void insertDepart(Department depart) {
		// TODO Auto-generated method stub
		
	        this.insert(depart);
	}

	@Override
	public Department selectdepartById(String id) {
		 return departmentMapper.selectdepartByID(id);
	}

	@Override
	public void updateDepart(Department depart) {
        this.updateById(depart);
	}

	@Override
	public void deleteDepartById(List<String> departIds) {
		this.deleteBatchIds(departIds);
	}

	@Override
	public List<Department> selectByksbm(String ksbm) {
		Department  newdepart;
		EntityWrapper<Department> wrapper ;
		List<Department> list = new ArrayList<Department>();
		String[] arrKsbm = ksbm.split(",");
		if(arrKsbm.length==1){
			newdepart = new Department();
			newdepart.setKsdm(ksbm);
			wrapper = new EntityWrapper<Department>(newdepart);
			list = this.selectList(wrapper);
		}else{
			for(int i=0;i<arrKsbm.length;i++){
				newdepart = new Department();
				newdepart.setKsdm(arrKsbm[i]);
				wrapper = new EntityWrapper<Department>(newdepart);
				list.add(this.selectList(wrapper).get(0));
			}
		}
        return list;
	}

	@Override
	public List<Department> findDepartType2(String clum, String ksbm) {
		// TODO Auto-generated method stub
				EntityWrapper<Department> wrapper = new EntityWrapper<Department>();
				 if(ksbm==null){
					 wrapper.setSqlSelect(" distinct   "+clum+"   " );
				 
				 }else{
				
					 wrapper.setSqlSelect(" distinct  ksbm  , "+clum+"   " );
					 wrapper.where("ksbm!={0}", "0000");
					 wrapper.orderBy("ksbm");
				 }
				 //"0000"代表全院，查询所有科室
				 if(StringUtils.isNotBlank(ksbm) && !"0000".equals(ksbm))
				 {
					 wrapper.where("ksbm={0}", ksbm);
				 }
				 
				
			        return departmentMapper.selectList(wrapper);
	}

	@Override
	public List<Map<String, Object>> getdoctorByksbm(String ksbm) {
		List<Map<String, Object>> list=departmentMapper.getdoctorByksbm(ksbm);
		Map<String, Object> map = new HashMap<>();
		map.put("gh", "0000");
		map.put("xm", "全部");
		list.add(0, map);
		return list;
	}

	public Map<String, String> getDoctorByysgh(String ysgh){
		Map<String, String> docInfo = departmentMapper.getDoctorByysgh(ysgh);
		return docInfo;
	}

	@Override
	public List<Map<String, Object>> getSbInfo() {
		List<Map<String, Object>> list = departmentMapper.getSbInfo();
		// 将社保字典中的历城区排序放在第一位
		// 遍历list集合是不能够直接修改list集合
		int num = 0 ;
		for (Map<String, Object> map : list) {
			if(map.get("ID").equals("370112")){
				num = list.indexOf(map);
			};
		}
		if(num!=0){
			list.add(0, list.get(num));
			list.remove(num+1);
		}
		return list;
	}
	
}
