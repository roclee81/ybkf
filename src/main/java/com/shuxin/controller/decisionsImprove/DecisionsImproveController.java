package com.shuxin.controller.decisionsImprove;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shuxin.commons.base.BaseController;

@Controller
@RequestMapping("/decisions")
public class DecisionsImproveController extends BaseController{
	
    @RequestMapping("/diseaseConstitute")
	public String diseaseConstitute(){
		return "decisionsImprove/diseaseConstitute";
	}
    
    @RequestMapping("/drugAnalysis")
	public String drugAnalysis(){
		return "decisionsImprove/drugAnalysis";
	}
    
    @RequestMapping("/feeStructure")
	public String feeStructure(){
		return "decisionsImprove/feeStructure";
	}
    
    @RequestMapping("/inspectionAnalysis")
	public String inspectionAnalysis(){
		return "decisionsImprove/inspectionAnalysis";
	}
    
    @RequestMapping("/treatmentAnalysis")
	public String treatmentAnalysis(){
		return "decisionsImprove/treatmentAnalysis";
	}
    
    @RequestMapping("/materialAnalysis")
	public String materialAnalysis(){
		return "decisionsImprove/materialAnalysis";
	}
    
    @RequestMapping("/distanceTreatment")
	public String distanceTreatment(){
		return "decisionsImprove/distanceTreatment";
	}
    
    @RequestMapping("/largeMedicalAnalysis")
	public String largeMedicalAnalysis(){
		return "decisionsImprove/largeMedicalAnalysis";
	}
	
	
}
