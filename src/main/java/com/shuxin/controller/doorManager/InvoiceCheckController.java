package com.shuxin.controller.doorManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.shiro.ShiroUser;
import com.shuxin.commons.utils.ExcelUtil;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.FormsModel;
import com.shuxin.model.checkManager.ChargeInvoiceDetail;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.service.checkManager.IInvoiceCheckService;

@Controller
@RequestMapping("/invoiceCheck")
public class InvoiceCheckController {
	@Autowired
	private IInvoiceCheckService service;
	
	@RequestMapping("/show")
	public String show(){
		return "checkManager/InvoiceCheck";
	}
	
	@RequestMapping("/selectByLsh")
	@ResponseBody
	public Object selectByLsh(String mzlsh,String flag){
		return JsonUtils.toJson(service.selectByLsh(mzlsh));
	}
	
	@RequestMapping("/warningInfoDataGrid")
	@ResponseBody
	public Object warningInfoDataGrid(String lsh){
		return JsonUtils.toJson(service.warningInfoDataGrid(lsh));
	}

	@RequestMapping("/selectBreakingRule")
	@ResponseBody
	public Object selectBreakingRule(String lsh){
		return JsonUtils.toJson(service.selectBreakingRule(lsh));
	}
	
	@RequestMapping("/changeCheckStatu")
	@ResponseBody
	public Object changeCheckStatu(Integer shzt,String mzlsh,String shyj,String flag){
		ShiroUser user=(ShiroUser) SecurityUtils.getSubject().getPrincipal();
		String shryhm= user.getName();
		String ksdm = user.getDepartmentId();
		service.changeCheckStatu(shzt, shryhm, ksdm, mzlsh, shyj);
		return "success";
	}
	
	

	/**
	 * 异地就医患者表
	 * @param formsModel
	 * @param page
	 * @param rows
	 * @param sort
	 * @param order
	 * @return
	 */
    @RequestMapping("/invoiceExport")
    @ResponseBody
    public void invoiceExport(HttpServletRequest request,
			HttpServletResponse response,ChargeInvoiceDetail  chargeInvoiceDetail ) {
    	
    	HashMap<String, Object> map=new HashMap<String, Object>();
       List<Map<String, Object>> dataList=    service.invoiceExport(chargeInvoiceDetail);
    
     
       map.put("dataList", dataList);
   	ExcelUtil.exportExcel(response, "chargeCheckTemp", "违规单据", map);
    }
    /**
     * 异地就医患者表
     * @param formsModel
     * @param page
     * @param rows
     * @param sort
     * @param order
     * @return
     */
    @RequestMapping("/selectMonthandYear")
    @ResponseBody
    public Object selectMonthandYear(HttpServletRequest request,
    		HttpServletResponse response,String sfzhm   ) {
    	
    //	HashMap<String, Object> map=new HashMap<String, Object>();
    //	List<Map<String, Object>> dataList=    service.invoiceExport(chargeInvoiceDetail);
  	
    //	map.put("dataList", dataList);
    //	ExcelUtil.exportExcel(response, "chargeCheckTemp", "违规单据", map);
    	List<Map<String, Object>>	list= service.selectMonthandYear( sfzhm);
    	String json= JsonUtils.toJson(list);
    	return json;
    }
	
    /**
     * 门诊审核
     * 判断单据是否为待审单据
     * @param mzlsh
     * @param jyfs
     * @return
     */
    @RequestMapping("/judgeSuspicious")
    @ResponseBody
    public Object judgeSuspicious(String mzlsh,String flag ) {
    	return service.judgeSuspicious(mzlsh);
    }
    
    /**
     * 住院审核-就诊信息
     * @param zyh
     * @return
     */
    @RequestMapping("/medicalInfor")
    @ResponseBody
    public Object medicalInformation(String zyh ,String flag) {
    	Map<String, Object> map = service.medicalInformation(zyh);
    	return map;
    }
    
    /**
     * 住院审核-费用指标预警
     * @return
     */
    @RequestMapping("/costIndicator")
    @ResponseBody
    public Object costIndicator(String zyh,String flag ) {
    	Map<String, Object> map = service.costIndicator(zyh);
    	return map;
    }
    
    
}
