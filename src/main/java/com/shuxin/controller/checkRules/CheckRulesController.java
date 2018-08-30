package com.shuxin.controller.checkRules;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @description：
 */
@Controller
@RequestMapping("/checkRules")
public class CheckRulesController {
	
	@RequestMapping("/clinicCheck")
	public String remind(){
		return "checkRules/clinicCheck";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
