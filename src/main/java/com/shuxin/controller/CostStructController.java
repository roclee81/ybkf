package com.shuxin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.base.BaseController;
import com.shuxin.commons.dataSource.DataSourceContextHolder;
import com.shuxin.commons.utils.JsonUtils;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.service.decisionAnalysis.ICostStructService;

@Controller
@RequestMapping("/costStruct")
public class CostStructController extends BaseController{
	
	@Autowired
	private ICostStructService costStructService;
	
	@PostMapping("/selectEcharsData")
    @ResponseBody
	public Object selectEcharsData(CostStructVo costStructVo,String flag)
	{
		try {
			Map<String, List<String>> map=costStructService.selectEcharsData(costStructVo);
			String jsonStr = JsonUtils.toJson(map);
			return jsonStr;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			return renderError("服务器异常!");
		}
	}
	
	@PostMapping("/SelectCostStruct")
    @ResponseBody
	public Object SelectCostStructVoPage(CostStructVo costStructVo,Integer page, Integer rows, String sort, String order,String flag)
	{
		
		PageInfo pageInfo = new PageInfo(page, rows, sort, order);
		
		Map<String, Object> condition = new HashMap<String, Object>();
	
		if (StringUtils.isNotBlank(costStructVo.getKsbm())) {
			condition.put("ksbm", costStructVo.getKsbm());
		}
		if (StringUtils.isNotBlank(costStructVo.getCblxbm())) {
			condition.put("cblxbm", costStructVo.getCblxbm());
		}	
		if (StringUtils.isNotBlank(costStructVo.getOrderType())) {
            condition.put("orderType", costStructVo.getOrderType());
        }
		if(costStructVo.getSyearmonthday()!=null && StringUtils.isNotBlank(costStructVo.getSyearmonthday())){
		   	 condition.put("syearMonthDay", costStructVo.getSyearmonthday());
		}
		if (StringUtils.isNotBlank(costStructVo.getSyear())) {
			condition.put("syear", costStructVo.getSyear());
		}
		if (StringUtils.isNotBlank(costStructVo.getSmonth())) {
			condition.put("smonth", costStructVo.getSmonth());
		}
		if (StringUtils.isNotBlank(costStructVo.getOrderType())) {
			condition.put("ysgh", costStructVo.getYsgh());
		}
		if (StringUtils.isNotBlank(costStructVo.getSfzhm())) {
			condition.put("sfzhm", costStructVo.getSfzhm());
		}
		if (StringUtils.isNotBlank(costStructVo.getYsxm())) {
			condition.put("ysxm", costStructVo.getYsxm());
		}
		if (StringUtils.isNotBlank(costStructVo.getBah())) {
			condition.put("bah", costStructVo.getBah());
		}
		if (StringUtils.isNotBlank(costStructVo.getShzt())) {
			condition.put("shzt", costStructVo.getShzt());
		}
		if (StringUtils.isNotBlank(costStructVo.getGzxh())) {
			condition.put("gzxh", costStructVo.getGzxh());
		}
		if (StringUtils.isNotBlank(costStructVo.getBzxh())) {
			condition.put("bzxh", costStructVo.getBzxh());
		}
		if (StringUtils.isNotBlank(costStructVo.getHzxm())) {
			condition.put("hzxm", costStructVo.getHzxm());
		}
		if (StringUtils.isNotBlank(costStructVo.getQybm())) {
			condition.put("qybm", costStructVo.getQybm());
		}
		if (StringUtils.isNotBlank(costStructVo.getLdate())) {
            condition.put("ldate", costStructVo.getLdate());
        }
		if (StringUtils.isNotBlank(costStructVo.getHdate())) {
            condition.put("hdate", costStructVo.getHdate());
        }
		if (StringUtils.isNotBlank(costStructVo.getJyfs())) {
            condition.put("jyfs", costStructVo.getJyfs());
        }
		if (StringUtils.isNotBlank(costStructVo.getMzjbmc())) {
            condition.put("mzjbmc", costStructVo.getMzjbmc());
        }
		if (StringUtils.isNotBlank(costStructVo.getLsh())) {
            condition.put("lsh", costStructVo.getLsh());
        }
		if (StringUtils.isNotBlank(costStructVo.getZyzt())) {
            condition.put("zyzt", costStructVo.getZyzt());
        }
		if (StringUtils.isNotBlank(costStructVo.getRyzd())) {
            condition.put("ryzd", costStructVo.getRyzd());
        }
		if (StringUtils.isNotBlank(costStructVo.getCyzd())) {
			condition.put("cyzd", costStructVo.getCyzd());
		}
		if (StringUtils.isNotBlank(costStructVo.getZlfs())) {
            condition.put("zlfs", costStructVo.getZlfs());
        }
		if (StringUtils.isNotBlank(costStructVo.getLcyrq())) {
			condition.put("lcyrq", costStructVo.getLcyrq());
		}
		if (StringUtils.isNotBlank(costStructVo.getHcyrq())) {
			condition.put("hcyrq", costStructVo.getHcyrq());
		}
		pageInfo.setCondition(condition);
		try {
			costStructService.SelectCostStructVoPage(pageInfo,costStructVo.getMethodFlag());
		} catch (Exception e) {			
			e.printStackTrace();
			logger.error(e.getMessage());
		} 
		return pageInfo;
	}
	
	@PostMapping("/medicalInformation")
    @ResponseBody
	public Object medicalInformation(CostStructVo costStructVo)
	{
		System.out.println(costStructVo);						
		Map<String, Object> condition = new HashMap<String, Object>();
	
		if (StringUtils.isNotBlank(costStructVo.getKsbm())) {
			condition.put("ksbm", costStructVo.getKsbm());
		}
		if (StringUtils.isNotBlank(costStructVo.getCblxbm())) {
			condition.put("cblxbm", costStructVo.getCblxbm());
		}	
		if (StringUtils.isNotBlank(costStructVo.getOrderType())) {
			condition.put("ysgh", costStructVo.getYsgh());
		}
		if (StringUtils.isNotBlank(costStructVo.getSfzhm())) {
			condition.put("sfzhm", costStructVo.getSfzhm());
		}
		if (StringUtils.isNotBlank(costStructVo.getYsxm())) {
			condition.put("ysxm", costStructVo.getYsxm());
		}
		if (StringUtils.isNotBlank(costStructVo.getShzt())) {
			condition.put("shzt", costStructVo.getShzt());
		}
		if (StringUtils.isNotBlank(costStructVo.getMzjbmc())) {
			condition.put("mzjbmc", costStructVo.getMzjbmc());
		}
		if (StringUtils.isNotBlank(costStructVo.getLdate())) {
            condition.put("ldate", costStructVo.getLdate());
        }
		if (StringUtils.isNotBlank(costStructVo.getHdate())) {
            condition.put("hdate", costStructVo.getHdate());
        }
		if (StringUtils.isNotBlank(costStructVo.getJyfs())) {
            condition.put("jyfs", costStructVo.getJyfs());
        }
		if (StringUtils.isNotBlank(costStructVo.getMzjbmc())) {
            condition.put("mzjbmc", costStructVo.getMzjbmc());
        }
		try {
			
		} catch (Exception e) {			
			e.printStackTrace();
			logger.error(e.getMessage());
		}
		return null;
	}
	
	@RequiresPermissions("/costStruct/allDrugAnalysis")
	@RequestMapping("/allDrugAnalysis")
	public String allDrugAnalysis(HttpServletRequest request,  Model model)
	{
		  getMenuId(request, model);
		return "decisionAnalysis/allDrugAnalysis";
	}
	
	@RequiresPermissions("/costStruct/allDrugAnalysis")
	@RequestMapping("/drugTypeAnalysis")
	public String drugTypeAnalysis(HttpServletRequest request,  Model model)
	{
		getMenuId(request, model);
		return "decisionAnalysis/drugTypeAnalysis";
	}
	
	@RequiresPermissions("/costStruct/allDrugAnalysis")
	@RequestMapping("/drugClassAnalysis")
	public String drugClassAnalysis(HttpServletRequest request,  Model model)
	{
		  getMenuId(request, model);
		return "decisionAnalysis/drugClassAnalysis";
	}
	
	@RequiresPermissions("/costStruct/allCheckProjectAnalysis")
	@RequestMapping("/allCheckProjectAnalysis")
	public String allCheckProjectAnalysis(HttpServletRequest request,  Model model)
	{
		  getMenuId(request, model);
		return "decisionAnalysis/allCheckProjectAnalysis";
	}
	

	@RequiresPermissions("/costStruct/allCheckProjectAnalysis")
	@RequestMapping("/checkProjectDistribution")
	public String checkProjectDistribution(HttpServletRequest request,  Model model)
	{
		  getMenuId(request, model);
		return "decisionAnalysis/checkProjectDistribution";
	}
	
	@RequiresPermissions("/costStruct/allCheckProjectAnalysis")
	@RequestMapping("/focusCheckProject")
	public String focusCheckProject(HttpServletRequest request,  Model model)
	{
		getMenuId(request, model);
		return "decisionAnalysis/focusCheckProject";
	}

	
}
