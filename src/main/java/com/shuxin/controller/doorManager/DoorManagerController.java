package com.shuxin.controller.doorManager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shuxin.commons.base.BaseController;

/**
 * @description：
 */
@Controller
@RequestMapping("/doorManager")
public class DoorManagerController extends BaseController{
	
	@RequestMapping("/remind")
	public String remind(){
		return "admin/remind";
	}
	@RequestMapping("/doorSummary")
	public String doorSummary(){
		return "admin/doorSummary";
	}
	@RequestMapping("/patientMonitor")
	public String patientMonitor(){
		return "checkRules/patientMonitor";
	}
	@RequestMapping("/violationCount")
	public String violationCount(){
		return "admin/violationCount";
	}
	@RequestMapping("/diseaseLimit")
	public String diseaseLimit(){
		return "admin/diseaseLimit";
	}
	@RequestMapping("/patientRegist")
	public String patientegist(){
		return "admin/patientRegist";
	}
	@RequestMapping("/database")
	public String database(){
		return "admin/filedatabase";
	}
	@RequestMapping("/violation")
	public String violationStatistics(){
		return "checkRules/violationStatistics";
	}
	@RequestMapping("/hospitalReview")
	public String hospitalReview(){
		return "checkRules/hospitalReview";
	}
	@RequestMapping("/timeout")
	public String timeoutReview(){
		return "checkRules/timeout";
	}
	@RequestMapping("/timeoutHasChecked")
	public String timeoutHasChecked(){
		return "checkRules/timeoutHasChecked";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
