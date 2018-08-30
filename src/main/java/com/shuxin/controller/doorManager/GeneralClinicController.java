package com.shuxin.controller.doorManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.enums.WholeDocument;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IGeneralClinicService;

/**
* @ClassName: GeneralClinicController
* @Description: TODO(普通门诊控制层)
* @author LiuYang
* @date 2017年11月17日
*
*/
@RequestMapping("/generalclinic")
@Controller
public class GeneralClinicController extends BaseController {
    
    @Autowired
    private IGeneralClinicService generService;
    
    
    /**
     * 门诊关键指标
     * @return
     */
    @PostMapping("/mzquotadepartZB")
    @ResponseBody
    public Object mzquotadepartZB(MgquotaVo  mgquotaVo,HttpServletRequest request,HttpServletResponse response)
    {
        System.out.println(mgquotaVo);
        
        List<Map<String, Object>> hospitalMonitordepartZB=generService.mzquotadepartZB(mgquotaVo);
        
        String json= JsonUtils.toJson(hospitalMonitordepartZB);
        System.out.println(json);
        return json;
    }
    

    /**
    * @Title: mzquotaDataGrid
    * @Description: TODO(关键指标医师grid)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/mzquotaDataGrid")
    @ResponseBody
    public Object mzquotaDataGrid( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        generService.selectmzquotaDataGrid(pageInfo);  
        return pageInfo;
        
    }
    
   
    
    /**
    * @Title: mzViolationdetails
    * @Description: TODO(违规单据详情grid)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/mzViolationdetails")
    @ResponseBody
    public Object mzViolationdetails( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        System.out.println(mgquotaVo);
      
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        
        generService.mzViolationdetails(pageInfo);  
        
        
       
        return pageInfo;
    }
    /**
    * @Title: mzwgdepartOrderTable
    * @Description: TODO(违规汇总>>科室违规情况)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/mzwgdepartOrderTable")
    @ResponseBody
    public Object mzwgdepartOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        System.out.println(mgquotaVo);
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        generService.mzwgdepartOrderTable(pageInfo);  
        return pageInfo;
        
    }
    
    /**
    * @Title: mzwgDoctorOrderTable
    * @Description: TODO(违规汇总>>医师汇总情况grid)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/mzwgDoctorOrderTable")
    @ResponseBody
    public Object mzwgDoctorOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        System.out.println(mgquotaVo);
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        generService.mzwgDoctorOrderTable(pageInfo);  
        return pageInfo;
    }
    
    
    
    /**
    * @Title: mzwggzOrderTable
    * @Description: TODO(违规汇总>>违规规则排序grid)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/mzwggzOrderTable")
    @ResponseBody
    public Object mzwggzOrderTable( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        generService.mzwggzOrderTable(pageInfo);  
        return pageInfo;
    }
    
    /**
    * @Title: mzViolationsDocuments
    * @Description: TODO(违规单据汇总)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @param lx
    * @param @return    参数
    * @return Object    返回类型
    * @throws
    */
    @PostMapping("/mzViolationsDocuments")
    @ResponseBody
    public Object mzViolationsDocuments( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order,String lx) {
        PageInfo pageInfo = queryConditions(mgquotaVo,page,rows,sort,order);
        

        /*String enumValue = WholeDocument.getEnumValue(mgquotaVo.getGzbm());
        
        if (enumValue ==null && StringUtils.isBlank(enumValue)) {
            //非整单
           */           
        generService.mzViolationsDocuments(pageInfo); 
            
       /* }else{
            //整单违规
            generService.wholeDocument(pageInfo);
        }*/
        
        return pageInfo;
    }
    
    /**
    * @Title: queryConditions
    * @Description: TODO(分页查询条件解析)
    * @param @param mgquotaVo
    * @param @param page
    * @param @param rows
    * @param @param sort
    * @param @param order
    * @param @return    参数
    * @return PageInfo    返回类型
    * @throws
    */
    public PageInfo queryConditions(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order){
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();
        
        if(mgquotaVo.getKsbm()!=null && StringUtils.isNotBlank(mgquotaVo.getKsbm())){
           condition.put("ksbm", mgquotaVo.getKsbm());
        }
        if(mgquotaVo.getSyear()!=null && StringUtils.isNotBlank(mgquotaVo.getSyear())){
           condition.put("syear", mgquotaVo.getSyear());
        }
        if(mgquotaVo.getSmonth()!=null && StringUtils.isNotBlank(mgquotaVo.getSmonth())){
               condition.put("smonth", mgquotaVo.getSmonth());
            }   
        if(mgquotaVo.getCblxbm()!=null && StringUtils.isNotBlank(mgquotaVo.getCblxbm())){
            
            condition.put("cblxbm", mgquotaVo.getCblxbm());
        }
        if(mgquotaVo.getQybm()!=null && StringUtils.isNotBlank(mgquotaVo.getQybm())){
            
            condition.put("qybm", mgquotaVo.getQybm());
        }
        if(mgquotaVo.getYsgh()!=null && StringUtils.isNotBlank(mgquotaVo.getYsgh())){
            
            condition.put("ysgh", mgquotaVo.getYsgh());
        }
        if(mgquotaVo.getBzxh()!=null && StringUtils.isNotBlank(mgquotaVo.getBzxh())){
            
            condition.put("bzxh", mgquotaVo.getBzxh());
        }   
        if(mgquotaVo.getGzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getGzbm())){
        
        condition.put("gzbm", mgquotaVo.getGzbm());
        }
        if(mgquotaVo.getMzlsh()!=null && StringUtils.isNotBlank(mgquotaVo.getMzlsh())){
            
        condition.put("mzlsh", mgquotaVo.getMzlsh());
        }
        if(mgquotaVo.getBzmc()!=null && StringUtils.isNotBlank(mgquotaVo.getBzmc())){
            
        condition.put("bzmc", mgquotaVo.getBzmc());
        }
        if(mgquotaVo.getBzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getBzbm())){
                    
        condition.put("bzbm", mgquotaVo.getBzbm());
        }
        if(mgquotaVo.getSfzhm()!=null && StringUtils.isNotBlank(mgquotaVo.getSfzhm())){
            
        condition.put("sfzhm", mgquotaVo.getSfzhm());
        }if(mgquotaVo.getLx()!=null && StringUtils.isNotBlank(mgquotaVo.getLx())){
            
        condition.put("lx", mgquotaVo.getLx());
        }if(mgquotaVo.getJzrq()!=null && StringUtils.isNotBlank(mgquotaVo.getJzrq())){
            
        condition.put("jzrq", mgquotaVo.getJzrq());
        }
            pageInfo.setCondition(condition);
            return pageInfo;
    }
    @PostMapping("/getwholedocumentdetails")
    @ResponseBody
    public Object getwholedocumentdetails( MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        
        //判断是否是整单违规
        boolean flag = generService.getWholeDocument(mgquotaVo.getMzlsh());
        
        if (flag) {
            
            generService.getwholedocumentdetails(pageInfo);  
            
        }else {
            
            generService.mzViolationdetails(pageInfo);
            
        }
       
        return pageInfo;
    }
    
    
    @RequestMapping("/mzquotaKeyIndexGrid")
    @ResponseBody
    public Object getmzquotaKeyIndexGrid(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order) {
        
        PageInfo pageInfo = queryConditions(mgquotaVo, page, rows, sort, order);
        generService.getmzquotaKeyIndexGrid(pageInfo);  
        return pageInfo;
    }

}
