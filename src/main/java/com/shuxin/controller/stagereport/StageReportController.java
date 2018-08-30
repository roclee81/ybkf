package com.shuxin.controller.stagereport;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.shuxin.commons.base.BaseController;

@Controller
@RequestMapping("/stagereport")
public class StageReportController extends BaseController{

    @RequestMapping("/fixedreport")
    public String fixedreportPage(){
        
        return "stagereport/classBPayment";
    }
    
    @RequestMapping("/customReport")
    public String customReport(){
        
        return "stagereport/summaryViolationDetails";
    }
    
    /**
     * 住院执行科室项目明细
     * @return
     */
    @RequestMapping("/zyzxksxmmx")
    public String zyzxksxmmx(){
        return "stagereport/zyzxksxmmx";
    }

}
