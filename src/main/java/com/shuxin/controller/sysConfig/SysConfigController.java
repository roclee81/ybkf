package com.shuxin.controller.sysConfig;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuxin.commons.base.BaseController;

/**
 * @description：
 */
@Controller
@RequestMapping("/sysConfig")
public class SysConfigController extends BaseController{
	
	@RequestMapping("/doorPatientTypeSet")
	public String doorPatientTypeSet(){
		System.out.println("doorPatientTypeSet");
		return "sysConfig/doorPatientTypeSet";
	}
	@RequestMapping("/doorPatientRegister")
	public String doorPatientRegister (){
		System.out.println("doorPatientRegister");
		return "sysConfig/doorPatientRegister";
	}
	@RequestMapping("/userManage")
	public String userManage(){
		return "sysConfig/userManage";
	}
	@RequestMapping("/roleManage")
	public String roleManage(){
		return "sysConfig/roleManage";
	}
	@RequestMapping("/departmentBudgetAllocation")
	public String DepartmentBudgetAllocation(){
		return "sysConfig/departmentBudgetAllocation";
	}
	@RequestMapping("/perCapitaAllocation")
	public String perCapitaAllocation(){
		return "sysConfig/perCapitaAllocation";
	}
	@RequestMapping("/settingDiseaseIndicators")
	public String settingDiseaseIndicators(){
		return "sysConfig/settingDiseaseIndicators";
	}
	@RequestMapping("/reviewRules")
	public String reviewRules(){
		return "sysConfig/reviewRules";
	}
	@RequestMapping("/healthInsuranceDatabase")
	public String healthInsuranceDatabase(){
		return "sysConfig/healthInsuranceDatabase";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
