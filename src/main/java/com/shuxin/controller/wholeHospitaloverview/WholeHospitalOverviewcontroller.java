package com.shuxin.controller.wholeHospitaloverview;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shuxin.commons.result.Result;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.ListUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.model.vo.QuotaVo;
import com.shuxin.model.vo.SummaryInformation;
import com.shuxin.service.IMgquotaService;
import com.shuxin.service.ISummaryInformationService;
import com.shuxin.service.QuotaService;

/**
 * 描述:   全院概览
 * 详细:  
 * 类名:   WholeHospitalOverview
 * 所属包: com.shuxin.controller.wholeHospitalOverview
 * 作者:   Administrator
 * 版本:   1.0
 * 日期 :   2017年10月16日 上午10:32:00
 */
@RequestMapping("/wholeHospitalOverview")
@Controller
public class WholeHospitalOverviewcontroller {

  

    @Autowired
    private QuotaService quotaService;

    @Autowired
    private IMgquotaService mgquotaService;

    @Autowired
    private ISummaryInformationService sumInfoService;

    /*********************************普通住院************************************************/
    
    /**
     * 描述:  预览监控月使用额度和年累计额度
     * 名称:  MonthlyQuota
     * 作者 :  Administrator
     * 时间 :  2017年10月16日 下午1:58:26  
     * 参数:  @param selectDate 查询月份
     * 参数:  @param typeOfInsurance 参保类型
     * 参数:  @return     
     */
    @RequestMapping("/monthlyquota")
    @ResponseBody
    public Object MonthlyQuota(String selectDate, String typeOfInsurance) {
        Result result = new Result();
        result.setSuccess(true);
        result.setObj(222222);
        result.setMsg("查询成功");

        return result;
    }

    /**
     * 描述:  各个科室额度分页操作
     * 名称:  QuoatgKJrid
     * 作者 :  ThinkPad
     * 时间 :  2017年10月23日 下午6:08:03  
     * 参数:  @param quotaVo
     * 参数:  @param page
     * 参数:  @param rows
     * 参数:  @param sort
     * 参数:  @param order
     * 参数:  @return     
     */
    @RequestMapping("/quoatgrid")
    @ResponseBody
    public Object quoatgrid(QuotaVo quotaVo, Integer page, Integer rows, String sort, String order) {

        PageInfo pageInfo = quotaService.selectPageInfo(quotaVo, page, rows, sort, order);

        return pageInfo;

    }
    
    @RequestMapping("/keyIndexZY")
    @ResponseBody
    public Object getKeyInexZY(QuotaVo quotaVo) {

    	List<Map<String, Object>> list = quotaService.getKeyIndexZY(quotaVo);

        return list;

    }
    
    /*********************************住院病种************************************************/
    /**
     * 病种汇总
     * @param quotaVo
     * @return
     */
    @RequestMapping("/keyIndexBZ")
    @ResponseBody
    public Object getKeyInexBZ(QuotaVo quotaVo) {

    	List<Map<String, Object>> list = quotaService.getKeyIndexBZ(quotaVo);

        return list;

    }
    
    /**
     * 介入治疗汇总
     * @param quotaVo
     * @return
     */
    @RequestMapping("/keyIndexZL")
    @ResponseBody
    public Object getKeyIndexZL(QuotaVo quotaVo) {

    	List<Map<String, Object>> list = quotaService.getKeyIndexZL(quotaVo);

        return list;

    }
    
    
    
    

    /*********************************普通门诊****************************************************************/

    /**
     * 描述:  门诊汇总信息
     * 名称:  outpatientSummaryInformation
     * 作者 :  ThinkPad
     * 时间 :  2017年10月26日 上午10:22:25  
     * 参数:  @param mgquotaVo
     * 参数:  @param request
     * 参数:  @param response
     * 参数:  @return     
     */
    @PostMapping("/outpatientSummaryInformation")
    @ResponseBody
    public Object outpatientSummaryInformation(MgquotaVo mgquotaVo, HttpServletRequest request,
            HttpServletResponse response) {
        System.out.println(mgquotaVo);

        List<Map<String, Object>> hospitalMonitordepartZB = mgquotaService.mzquotadepartZB(mgquotaVo);

        String json = JsonUtils.toJson(hospitalMonitordepartZB);
        System.out.println(json);
        return json;
    }

    /**
     * 描述:  全院概览-普通门诊-关键指标Grid
     * 名称:  mzquotaKeyDataGrid
     * 作者 :  ThinkPad
     * 时间 :  2017年10月26日 上午10:24:42  
     * 参数:  @param mgquotaVo
     * 参数:  @param page
     * 参数:  @param rows
     * 参数:  @param sort
     * 参数:  @param order
     * 参数:  @return     
     */
    @PostMapping("/mzquotaKeyDataGrid")
    @ResponseBody
    public Object mzquotaKeyDataGrid(MgquotaVo mgquotaVo, Integer page, Integer rows, String sort, String order) {
        System.out.println(mgquotaVo);
        
        PageInfo pageInfo = mgquotaService.queryConditions(mgquotaVo, page, rows, sort, order);
        //mgquotaService.getMzquotaKeyDataGrid(pageInfo);
        
        
//        mgquotaService.selectmzquotaDataGrid(pageInfo); 
        mgquotaService.selectmzKeyDataGrid(pageInfo); 
        
        
        return pageInfo;

    }

    /**
     * 描述:  普通门诊-关键指标-7个k图的Data
     * 名称:  getMzLineChart
     * 作者 :  ThinkPad
     * 时间 :  2017年10月25日 下午6:03:24  
     * 参数:  @param mgquotaVo
     * 参数:  @return     
     */
    @PostMapping("/mzlinechart")
    @ResponseBody
    public Object getMzLineChart(String syear, String cblxbm) {

        Map<String, List<Object>> lineData = new HashMap<>();

        List<SummaryInformation> dataList = sumInfoService.getListByYear(syear, cblxbm);

        Field[] fields = SummaryInformation.class.getDeclaredFields();

            for (Field field : fields) {
               
                
                List filedList = ListUtils.getFiledList(dataList, field.getName());
                
                lineData.put(field.getName(), filedList);
                
            }
            
       
        return lineData;
    }

    
    
    
    /**
     * 描述:  违规汇总 - 汇总规则排序
     * 名称:  getSummaryViolation
     * 作者 :  LiuYang
     * 时间 :  2017年10月27日 上午9:47:45  
     * 参数:  @param syear
     * 参数:  @param cblxbm
     * 参数:  @return     
     */
    @PostMapping("/summaryviolation")
    @ResponseBody
    public Object getSummaryViolation(String syear, String cblxbm) {
        
        return null; 
        
    }
    
    /**
    * @Title: findmonthcostofMg
    * @Description: TODO(门规病种-统计-6k线图)
    * @param @param syear
    * @param @param cblxbm
    * @param @param ksbm
    * @param @param ysgh
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/findmonthcostofMg")
    @ResponseBody
    public Object findmonthcostofMg(String syear, String cblxbm ,String ksbm ,String ysgh) {
        
        Map<String, List<Object>> lineData = new HashMap<>();

        List<SummaryInformation> dataList = sumInfoService.findmonthcostofMg(syear,cblxbm,ksbm,ysgh);

        Field[] fields = SummaryInformation.class.getDeclaredFields();

            for (Field field : fields) {
               
                
                List filedList = ListUtils.getFiledList(dataList, field.getName());
                
                lineData.put(field.getName(), filedList);
                
            }
            
       
        return lineData;
        
    }
    
    
}
