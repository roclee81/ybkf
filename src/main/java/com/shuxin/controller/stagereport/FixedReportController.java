package com.shuxin.controller.stagereport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.utils.PageInfo;
import com.shuxin.service.stagereport.IFixedReportService;

@Controller
@RequestMapping("/fixedreport")
public class FixedReportController {

    @Autowired
    private IFixedReportService fixedSerivce;

    /**
    * @Title: getTotalMonitoring
    * @Description: TODO(总额监控Grid)
    * @param @param syear
    * @param @param smonth
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/totalmonitoring")
    @ResponseBody
    public Object getTotalMonitoring(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
       PageInfo pageInfo  = fixedSerivce.getTotalMonitoring( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: getMedicareCosts
    * @Description: TODO(医保费用)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/medicarecosts")
    @ResponseBody
    public Object getMedicareCosts(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getMedicareCosts( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: getPerformanceIndicators
    * @Description: TODO(绩效指标)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/performanceindicators")
    @ResponseBody
    public Object getPerformanceIndicators(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getPerformanceIndicators( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: personindex
    * @Description: TODO(人次指标)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/personindex")
    @ResponseBody
    public Object personindex(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getPersonIndex( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: getDiseaseManagement
    * @Description: TODO(病种管理)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/diseasemanagement")
    @ResponseBody
    public Object getDiseaseManagement(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getDiseaseManagement( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: getOutpatientSpecial
    * @Description: TODO(门特病管理)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/outpatientspecial")
    @ResponseBody
    public Object getOutpatientSpecial(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getOutpatientSpecial( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: getOutPatient
    * @Description: TODO(超限患者)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/outpatients")
    @ResponseBody
    public Object getOutPatient(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getOutPatient( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    /**
    * @Title: getQuestionDocument
    * @Description: TODO(问题单据)
    * @param @param syear
    * @param @param smonth
    * @param @param ksbm
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @RequestMapping("/questiondocument")
    @ResponseBody
    public Object getQuestionDocument(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
        PageInfo pageInfo  = fixedSerivce.getQuestionDocument( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    
    /**
     * 阶段报表
     * 乙类自付比/自费比
     * @param syear
     * @param smonth
     * @param ksbm
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @RequestMapping("/hosPatInfoGrid")
    @ResponseBody
    public Object getHosPatInfoGrid(String syear ,String smonth ,String ksbm ,Integer page, Integer rows, String sort, String order){
        
       PageInfo pageInfo  = fixedSerivce.getHosPatInfoGrid( syear , smonth ,ksbm, page,  rows,  sort,  order);
        
        
        return pageInfo ;
    }
    
    @RequestMapping("/summaryVioDetailsGrid")
    @ResponseBody
    public Object getSummaryVioDetailsGrid(String flag,String syear ,String smonth ,String ksbm ,String jyfs,String wgzt,
    			Integer page, Integer rows, String sort, String order){
    	
    	PageInfo pageInfo  = fixedSerivce.getSummaryVioDetailsGrid( syear , smonth ,ksbm, jyfs,wgzt,page,  rows,  sort,  order);
    	
    	return pageInfo ;
    }
    
}
