package com.shuxin.controller.dataMonitoring;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shuxin.commons.utils.JsonUtils;

/**
* @ClassName: dataMonitoringController
* @Description: TODO(数据监控控制跳转)
* @author LiuYang
* @date 2017年11月1日
*
*/
@Controller
@RequestMapping("/dataMonitoring")
public class dataMonitoringController {

    /**
     * 描述:  跳转到全院概览页面
     * 名称:  wholeHospitalOverview
     * 作者 :  Administrator
     * 时间 :  2017年10月12日 下午3:16:27  
     * 参数:  @return     
     */
    @RequestMapping("/wholeHospitalOverview")
    public String wholeHospitalOverview() {

        return "dataMonitoring/wholeHospitalOverview";
    }

    /**
     * 描述:  普通门诊
     * 名称:  generaClinic
     * 作者 :  LiuYang
     * 时间 :  2017年10月31日 上午11:04:23  
     * 参数:  @return     
     */
    @RequestMapping("/generaClinic")
    public String generaClinic() {
        return "dataMonitoring/generaClinic";
    }

    /**
     * 描述:  门规病种
     * 名称:  DoorRules
     * 作者 :  LiuYang
     * 时间 :  2017年10月31日 上午11:04:53  
     * 参数:  @return     
     */
    @RequestMapping("/DoorRules")
    public String DoorRules() {

        return "dataMonitoring/DoorRules";
    }

    /**
     * 描述:  门诊患者查询
     * 名称:  PatientEnquiry
     * 作者 :  LiuYang
     * 时间 :  2017年10月31日 上午11:05:05  
     * 参数:  @return     
     */
    @RequestMapping("/PatientEnquiry")
    public String PatientEnquiry() {
        System.out.println("PatientEnquiry");
        return "dataMonitoring/PatientEnquiry";
    }

    @RequestMapping("test")
    @ResponseBody
    public String test(String year, String month, String section, String type) {
        System.out.println("test");
        System.out.println(year + "  " + month + "  " + section + "   " + type);
        String json = JsonUtils.toJson("123");
        return json;
    }

    /**
     * 描述:  住院患者情况
     * 名称:  hospitalized
     * 作者 :  LiuYang
     * 时间 :  2017年10月31日 下午1:46:58  
     * 参数:  @return     
     */
    @RequestMapping("/hospitalized")
    public String hospitalized() {

        return "dataMonitoring/hospitalized";
    }

    /**
    * @Title: inhospital
    * @Description: TODO(在院监控)
    * @param @return    参数
    * @return String    返回类型
    * @throws
    */
    @RequestMapping("/inhospital")
    public String inhospital() {

        return "dataMonitoring/inhospital";
    }
    /**
    * @Title: Discharged
    * @Description: TODO(出院评价)
    * @param @return    参数
    * @return String    返回类型
    * @throws
    */
    @RequestMapping("/discharged")
    public String discharged() {
        
        return "dataMonitoring/discharged";
    }

}
