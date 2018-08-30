package com.shuxin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.model.Department;
import com.shuxin.model.DoctorGroup;
import com.shuxin.service.IDoctorGroupService;


@Controller
@RequestMapping("/doctorGroup")
public class DoctorGroupController extends BaseController {

	
	@Autowired 
	private IDoctorGroupService  doctorGroupService;
	
	
	
	
	/**
	 *医疗组管理
	 * @param 
	 * @return
	 */
	@RequestMapping("/manager")
	@RequiresPermissions("/doctorGroup/manager")
	public String manager(HttpServletRequest request,  Model model){
	
	     return "zidian/depart";
		
	}
	
	@PostMapping("/findByksbm")
    @ResponseBody
    public Object findByksbm(String ksbm) {
		List<DoctorGroup>  doctorGroup=  doctorGroupService.findByksbm(ksbm);
        String json= JsonUtils.toJson(doctorGroup);
        return json;
    }
	
	@RequestMapping("/show")
	public String show(){
		return "admin/doctorGroup";
	}
	
	@RequestMapping("/add")
	@ResponseBody
	public Object add(DoctorGroup doctorGroup){
    	List<DoctorGroup> doctorGrouplist=doctorGroupService.selectByylzbm(doctorGroup.getYlzbm());

    	 if(doctorGrouplist.size()>0){
    		 return renderError("医疗组编码已存在!");
    	 }
         List<DoctorGroup> list = doctorGroupService.selectByLoginName(doctorGroup);
         if (list != null && !list.isEmpty()) {
             return renderError("医疗组名已存在!");
         }
         
         doctorGroupService.insertDoctorGroup(doctorGroup);
         return renderSuccess("添加成功");
	}
	@RequestMapping("/edit")
	@ResponseBody
	public Object edit(DoctorGroup doctorGroup){
        List<DoctorGroup> list = doctorGroupService.selectByLoginName(doctorGroup);

		if(list.size()>0){
			 return renderError("医疗组名已存在!");
		}
		 doctorGroupService.updateDoctorGroup(doctorGroup);
         return renderSuccess("操作成功");
		
	}
	
	@RequestMapping("/del")
	@ResponseBody
	public Object del(String id){
		try {
			if(doctorGroupService.deleteById(id)){
				return renderSuccess("成功");
			}else{
				return "err";
			}
		} catch (Exception e) {
			return "err";
		}
	}
}
