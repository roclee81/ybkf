package com.shuxin.controller.diseasesChargesController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.utils.JsonUtils;


/**
* @ClassName: diseasesChargesController
* @Description: TODO(病种收费控制跳转)
* @date 2017年11月15日
*
*/
@Controller
public class diseasesChargesController {
	/**
	 * @ClassName: diseasesChargesController
	 * @Description: TODO(病种收费控制跳转)
	 * @date 2017年11月15日
	 * @return
	 */
	@RequestMapping("/diseasesCharges")
	public String wholeHospitalOverview(){
		return "diseasesCharges/diseasesCharges";
	}

}
