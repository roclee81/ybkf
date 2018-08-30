package com.shuxin.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shuxin.commons.enums.WholeDocument;
import com.shuxin.commons.utils.ExcelUtil;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.model.Department;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.SysUser;
import com.shuxin.model.vo.CostStructVo;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IDepartmentService;
import com.shuxin.service.IExcelExportService;

import net.sf.json.JSONObject;

/**
 * 数据导出的控制层
 * @author admin
 *
 */
@Controller
@RequestMapping("/excel")
public class ExcelExportController {

	@Autowired
	private HttpServletResponse response;
	
	@Autowired
	private IExcelExportService excelExportService;
	
	@Autowired 
	private IDepartmentService departmentService;
	
	/**
	 * 科室预算分配导入模板
	 */
	@ResponseBody
	@RequestMapping("/exportDepartPlanTemp")
	public void exportDepartPlanTemp(){
		ExcelUtil.exportExcel(response, "DepartPlanTempExcel", "科室预算分配导入模板", new HashMap<String,Object>());
	}
	
	/**
	 * 系统用户导出信息
	 * @param sysUser
	 */
	@ResponseBody
	@RequestMapping("/exportSysUser")
	public void excelExport(SysUser sysUser){
		String tempFileName = "sysUserExcel";
		String exportFileName = "系统用户信息";
		Map<String, Object> map = new HashMap<String,Object>();
		List<Map<String, Object>> sysUserInfo = excelExportService.getSysUserInfo(sysUser);
		map.put("list", sysUserInfo);
		ExcelUtil.exportExcel(response, tempFileName, exportFileName, map);
	}
	
	/**
	 * 科室预算分配导出信息
	 * @param departmentPlan
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/exportDepartPlan")
    public void selectDepartmentPlan( DepartmentPlan departmentPlan) {
		String tempFileName = "departmentPlanExcel";
		String exportFileName = "科室预算分配信息";
		Map<String, Object> map = new HashMap<String,Object>();
		List<Map<String, Object>> sysUserInfo = excelExportService.getDepartPlanInfo(departmentPlan);
		map.put("list", sysUserInfo);
		ExcelUtil.exportExcel(response, tempFileName, exportFileName, map);		  
    }
	
	/**
	 * 门规病种统计导出信息  （全院概览）
	 * @param mgquotaVo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/exportWholeHosOfMg")
    public void selectWholeHosOfMg(MgquotaVo mgquotaVo) {
		Map<String, Object> condition = getCondition(mgquotaVo);
		
		List<Map<String, Object>> mgInfo = excelExportService.getWholeHosOfMg(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "wholeHosOfMgExcel", "门规病种统计信息", map);		  
    }
	
	/**
	 * 普通门诊关键指标导出信息  （全院概览）
	 * @param mgquotaVo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/exportWholeHosOfMz")
    public void selectWholeHosOfMz(MgquotaVo mgquotaVo) {
		Map<String, Object> condition = getCondition(mgquotaVo);

		List<Map<String, Object>> mgInfo = excelExportService.getWholeHosOfMz(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "WholeHosOfMzExcel", "普通门诊关键指标统计信息", map);		  
    }
	
	/**
	 * 在院患者导出信息  （全院概览）
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/exportInHosPatients")
    public void selectInHosPatients(MgquotaVo mgquotaVo) {
		Map<String, Object> condition = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(mgquotaVo.getSyearmonth())){
			condition.put("syearmonth",mgquotaVo.getSyearmonth());
		}
		condition.put("ksbm",mgquotaVo.getKsbm());
		condition.put("ysgh",mgquotaVo.getYsgh());
		condition.put("cblxbm",mgquotaVo.getCblxbm());
		condition.put("jyfs",mgquotaVo.getJyfs());

		List<Map<String, Object>> mgInfo = excelExportService.getInHosPatients(condition);
		
			Map<String, Object> map = new HashMap<String,Object>();	
			
			map.put("list", mgInfo);
			
			ExcelUtil.exportExcel(response, "InHosPatientsExcel", "在院患者统计信息", map);		  
    }
	
	/**
	 * 医师绩效统 导出信息
	 * @param mgquotaVo
	 * @param flag
	 */
	@ResponseBody
	@RequestMapping("/exportDocPerformance")
    public void selectDocPerformance(MgquotaVo mgquotaVo,String flag) {
		Map<String, Object> condition = getCondition(mgquotaVo);

		List<Map<String, Object>> mgInfo = excelExportService.getDocPerformance(condition,flag);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		String tempName = null;
		String excelName = null;
		switch (flag) {
		case "lj":
			tempName = "DocPerformanceOfLjExcel";
			excelName = "医师绩效累计指标信息";
			break;
		case "rj":
			tempName = "DocPerformanceOfRjExcel";
			excelName = "医师绩效人均指标信息";
			break;
		case "zb":
			tempName = "DocPerformanceOfZbExcel";
			excelName = "医师绩效占比指标信息";
			break;
		}
		ExcelUtil.exportExcel(response, tempName, excelName, map);		  
    }
	
	/**
	 * 门诊患者查询统计信息
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/mzPatient")
    public void getmzPatients(MgquotaVo mgquotaVo) {
		Map<String, Object> condition = getCondition(mgquotaVo);

		List<Map<String, Object>> mgInfo = excelExportService.getmzPatients(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mzPatientsExcel", "门诊患者统计信息", map);		  
    }
	
	/**
	 * 出院患者查询统计信息
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/hospitents")
    public void getHospitents(MgquotaVo mgquotaVo,String ldate,String hdate) {
		Map<String, Object> condition = getCondition(mgquotaVo);
		
		if(StringUtils.isNotBlank(ldate)){
			condition.put("ldate", ldate);
		}
		if(StringUtils.isNotBlank(hdate)){
			condition.put("hdate", hdate);
		}

		List<Map<String, Object>> mgInfo = excelExportService.getHospitents(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		if(null != mgTitle.get(0).get("data")){
			String data = (String)mgTitle.get(0).get("data");
			String data2 = data.replace("就诊", "出院");	
			mgTitle.get(0).put("data", data2);
		}
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mzHospitentsExcel", "出院患者统计信息", map);		  
    }
	
	/**
	 * 门规病种统计信息
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/mgbzInfo")
    public void getMgbzInfo(MgquotaVo mgquotaVo) {
		Map<String, Object> condition = getCondition(mgquotaVo);

		List<Map<String, Object>> mgInfo = excelExportService.getMgbzInfo(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mgbzInfoExcel", "门规病种统计信息", map);		  
    }
	
	/**
	 * 门规患者统计信息
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/mghzInfo")
    public void getMghzInfo(MgquotaVo mgquotaVo) {
		mgquotaVo.setKsbm(null);
		mgquotaVo.setYsgh(null);
		
		Map<String, Object> condition = getCondition(mgquotaVo);
		
		List<Map<String, Object>> mgInfo = excelExportService.getMghzInfo(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mghzInfoExcel", "门规患者统计信息", map);		  
    }
	
	/**
	 * 门规患者就诊详情
	 * @param lsh
	 */
	@ResponseBody
	@RequestMapping("/mgjzInfo")
    public void getMgjzInfo(String lsh) {
		Map<String, Object> infos = excelExportService.getMgjzDetailsInfos(lsh);
		ExcelUtil.exportExcel(response, "mghzDetailsExcel", "门规患者一次就诊详情", infos);		  
    }
	
	/**
	 * 门诊审核患者查询
	 * @param costStructVo
	 */
	@ResponseBody
	@RequestMapping("/mzshInfo")
    public void getMzshInfo(CostStructVo costStructVo,String flag) {
		
		Map<String, Object> condition = getStructCondition(costStructVo);
		
		List<Map<String, Object>> mgInfo = excelExportService.getMzshInfo(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mzshInfoExcel", "门诊审核统计信息", map);	  
		
    }
	
	/**
	 * 门诊审核患者就诊信息：处方明细与收费明细
	 * @param lsh
	 */
	@ResponseBody
	@RequestMapping("/mzshDetails")
    public void getMzshDetails(String lsh,String flag) {
		
		Map<String, Object> mgInfo = excelExportService.getMzshDetails(lsh);
		
		// 患者 信息
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> mgTitle = (List<Map<String, Object>>) mgInfo.get("patient");
		
		// 处方信息
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> cfmx = (List<Map<String, Object>>) mgInfo.get("cfmx");
		
		// 收费明细
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> sfmx = (List<Map<String, Object>>) mgInfo.get("sfmx");
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("cfmx", cfmx);
		map.put("sfmx", sfmx);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mzshDetailsExcel", "门诊审核患者就诊明细", map);	  
		
    }
	
	/**
	 * 住院审核患者查询
	 * @param costStructVo
	 */
	@ResponseBody
	@RequestMapping("/zyshInfo")
    public void getZyshInfo(CostStructVo costStructVo,String flag) {
		
		Map<String, Object> condition = getStructCondition(costStructVo);
		
		List<Map<String, Object>> mgInfo = excelExportService.getMzshInfo(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "zyshInfoExcel", "住院审核统计信息", map);
		
    }
	
	/**
	 * 住院审核患者住院详情：医嘱明细以及费用明细
	 * @param lsh
	 */
	@ResponseBody
	@RequestMapping("/zyshDetails")
    public void getZyshDetails(String lsh,String flag) {
		
		Map<String, Object> mgInfo = excelExportService.getZyshDetails(lsh);
		
		// 患者 信息
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> mgTitle = (List<Map<String, Object>>) mgInfo.get("patient");
		String head = String.format("身份证 :%s"+"  "+"患者姓名 : %s"+"  "+"入院日期: %s",
				mgTitle.get(0).get("SFZHM_JZ"),mgTitle.get(0).get("CBR_JZ"),mgTitle.get(0).get("RYRQ_JZ"));
		
		
		// 处方信息
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> cfmx = (List<Map<String, Object>>) mgInfo.get("cfmx");
		
		// 收费明细
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> sfmx = (List<Map<String, Object>>) mgInfo.get("sfmx");
		
		Map<String, List<Map<String, Object>>> map = new HashMap<>();	
		
		map.put("cfmx", cfmx);
		map.put("sfmx", sfmx);
		
		List<String> listSheetNames = new ArrayList<>(); 
		List<String> objectNames = new ArrayList<>();
		List<String[]> titles = new ArrayList<>();
		List<String[]> infos = new ArrayList<>(); 
		
		listSheetNames.add("医嘱明细");
		listSheetNames.add("费用明细");
		
		String[] title1 = {"项目时间","项目编码","项目名称","科室","医师","用法","用量","规格",
				"单位","单价(元)","数量","金额(元)","医保内金额(元)"};
		String[] title2 = {"项目编码","医院项目名称","数量","金额(元)","医保内金额(元)","执行科室"};
		titles.add(title1);
		titles.add(title2);
		
		String[] info1 = {"XMSJ","XMBM","XMMC","KS","YS","YF","YL","GG","DW","DJ","SL","JE","YBNJE"};
		String[] info2 = {"XMBM","XMMC","SL","JE","YBNJE","KS"};
		infos.add(info1);
		infos.add(info2);
		
		objectNames.add("cfmx");
		objectNames.add("sfmx");
		
		
		ExcelUtil.exportExcelWithSheets(response,head, "住院审核患者住院详情", 
				listSheetNames, titles, infos, map, objectNames,false);
    }
	
	
	/**
	 * 出院评价违规汇总：违规汇总信息详情
	 */
	@ResponseBody
	@RequestMapping("/cypj_wghz")
	public void getcypj_wghz(String exportData) {
		// 获取前端的json字符串
		JSONObject obj = JSONObject.fromObject(exportData);
		
		String lx = (String)obj.get("lx");
		String data = (String)obj.get("data");
		
		// 查询数据的封装
		Map<String, Object> condition = new HashMap<>();
		condition.put("syear", (String)obj.get("syear"));
		condition.put("smonth", (String)obj.get("smonth"));
		condition.put("cblxbm", (String)obj.get("cblxbm"));
		condition.put("ksbm", (String)obj.get("ksbm"));
		
		// 根据类型确定是哪一种 违规汇总：科室，医师，还是违反规则
		if(lx.equals("order")){
    		condition.put("gzbm", data);
    	}else if(lx.equals("depart")){
    		condition.put("ksbm", data);
    	}else if(lx.equals("doctor")){
    		condition.put("ysgh", data);
    	}

		List<Map<String, Object>> mgInfo = excelExportService.getcypj_wghz(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "cypj_wgdjhz_zdExcel", "出院评价违规统计信息", map);
		
	}
	
	
	/**
	 * 出院评价违规汇总：违规详情
	 */
	@ResponseBody
	@RequestMapping("/cypj_wghzDetails")
	public void getcypj_wghzDetails(String exportData_details) {
		// 获取前端的json字符串
		JSONObject obj = JSONObject.fromObject(exportData_details);
		// 封装查询数据
		Map<String, Object> condition = new HashMap<>();
		String lx = obj.getString("lx");
		String data = obj.getString("data");
		
		if(lx.equals("order")){
    		condition.put("gzbm", data);
    	}
		condition.put("lx", lx);
		condition.put("zyh", (String)obj.get("zyh"));
		condition.put("syear", (String)obj.get("syear"));
		condition.put("smonth", (String)obj.get("smonth"));
		condition.put("cblxbm", (String)obj.get("cblxbm"));
		condition.put("ksbm", (String)obj.get("ksbm"));
		
		List<Map<String, Object>> mgInfo = excelExportService.getcypj_wghzDetails(condition);
		List<Map<String, Object>> mgTitle = new ArrayList<>();
		List<Map<String, Object>> list = excelExportService.getPatINFO((String)obj.get("zyh"),"ptzy");
		if(list.size()>0){
			mgInfo.add(list.get(0));
		}
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "wghz_wgmxExcel", "出院评价违规详情统计信息", map);
		
	}
	/**
	 * 门规病种违规汇总：违规汇总信息详情
	 */
	@ResponseBody
	@RequestMapping("/mgbz_wghz")
	public void getmgbz_wghz(String exportData) {
		// 获取前端的json字符串
		JSONObject obj = JSONObject.fromObject(exportData);
		
		// 查询数据的封装
		Map<String, Object> condition = new HashMap<>();
		condition.put("syear", (String)obj.get("syear"));
		condition.put("smonth", (String)obj.get("smonth"));
		condition.put("cblxbm", (String)obj.get("cblxbm"));
		condition.put("ksbm", (String)obj.get("ksbm"));
		if(obj.containsKey("ysgh")){
			condition.put("ysgh", (String)obj.getString("ysgh"));
		}
		if(obj.containsKey("gzbm")){
			condition.put("gzbm", (String)obj.getString("gzbm"));
		}
		List<Map<String, Object>> mgInfo = null;
		
		String templeteName = null;
		if(obj.containsKey("gzbm")){
			// 规则违规
			mgInfo = excelExportService.getmgbz_wghz_order(condition);
			templeteName = "mgbz_wgdjhzExcel";
		}else{
			// 医师、科室违规
			mgInfo = excelExportService.getmgbz_wghz(condition);
			templeteName = "mgbz_wgdjhz_zdExcel";
		}
		 
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, templeteName, "门规病种违规统计信息", map);
		
	}
	
	
	/**
	 * 门规病种违规汇总：违规详情
	 */
	@ResponseBody
	@RequestMapping("/mgbz_wghzDetails")
	public void getmgbz_wghzDetails(String exportData_details) {
		// 获取前端的json字符串
		JSONObject obj = JSONObject.fromObject(exportData_details);
		
		// 封装查询数据
		Map<String, Object> condition = new HashMap<>();
		String mzlsh = obj.getString("mzlsh");
		condition.put("mzlsh", mzlsh);
		String enumValue = null;
		if(obj.containsKey("gzbm")){
			enumValue = WholeDocument.getEnumValue(obj.getString("gzbm"));
		}
		
		List<Map<String, Object>> mgInfo = null;
		
		if (enumValue ==null && StringUtils.isBlank(enumValue)) {
		    //非整单
		    mgInfo = excelExportService.getmgbz_wghzDetails(condition);
		 }else{
		    //整单违规
		    mgInfo = excelExportService.getmgbz_wghzDetails_zd(condition);
		 }
		List<Map<String, Object>> mgTitle = new ArrayList<>();
		List<Map<String, Object>> list = excelExportService.getPatINFO(mzlsh,"mgbz");
		if(list.size()>0){
			mgTitle.add(list.get(0));
		}
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mgbz_wghz_wgmxExcel", "门规病种违规详情统计信息", map);
		
	}
	
	/**
	 * 普通门诊违规汇总：违规汇总信息详情
	 */
	@ResponseBody
	@RequestMapping("/ptmz_wghz")
	public void getptmz_wghz(String exportData) {
		// 获取前端的json字符串
		JSONObject obj = JSONObject.fromObject(exportData);
		
		// 查询数据的封装
		Map<String, Object> condition = new HashMap<>();
		condition.put("syear", (String)obj.get("syear"));
		condition.put("smonth", (String)obj.get("smonth"));
		condition.put("cblxbm", (String)obj.get("cblxbm"));
		condition.put("ksbm", (String)obj.get("ksbm"));
		if(obj.containsKey("ysgh")){
			condition.put("ysgh", (String)obj.getString("ysgh"));
		}
		if(obj.containsKey("gzbm")){
			condition.put("gzbm", (String)obj.getString("gzbm"));
		}
		List<Map<String, Object>> mgInfo = excelExportService.getptmz_wghz_order(condition);
		
		String templeteName = null;
		if(obj.containsKey("gzbm")){
			// 规则违规
			templeteName = "ptmz_wgdjhzExcel";
		}else{
			// 医师、科室违规
			templeteName = "ptmz_wgdjhz_zdExcel";
		}
		
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, templeteName, "普通门诊违规统计信息", map);
		
	}
	
	
	/**
	 * 门统门诊违规汇总：违规详情
	 */
	@ResponseBody
	@RequestMapping("/ptmz_wghzDetails")
	public void getptmz_wghzDetails(String exportData_details) {
		// 获取前端的json字符串
		JSONObject obj = JSONObject.fromObject(exportData_details);
		
		// 封装查询数据
		Map<String, Object> condition = new HashMap<>();
		String mzlsh = obj.getString("mzlsh");
		condition.put("mzlsh", mzlsh);
		condition.put("cblxbm", obj.getString("cblxbm"));
		if(obj.containsKey("gzbm")){
			condition.put("gzbm", obj.getString("gzbm"));
		}
		if(obj.containsKey("ksbm")){
			condition.put("ksbm", obj.getString("ksbm"));
		}
		List<Map<String, Object>> mgInfo = excelExportService.getptmz_wghzDetails(condition);
		
		List<Map<String, Object>> mgTitle = new ArrayList<>();
		List<Map<String, Object>> list = excelExportService.getPatINFO(mzlsh,"ptmz");
		if(list.size()>0){
			mgTitle.add(list.get(0));
		}
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", mgInfo);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "mgbz_wghz_wgmxExcel", "普通门诊违规详情统计信息", map);
		
	}
	
	
	/**
	 * 普通住院违规汇总：违规汇总信息
	 */
	@ResponseBody
	@RequestMapping("/exportZy_wghz")
	public void getZy_wghz(MgquotaVo mgquotaVo,String flag) {
		Map<String, Object> condition = getCondition(mgquotaVo);
		//List<Map<String, Object>> mgTitle = getTitleList(condition);
		
		Map<String, Object> info = excelExportService.getZy_wghz(condition,flag);
		// 违规统计 信息
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> wgInfo = (List<Map<String, Object>>) info.get("wgInfo");
		
		switch ((String)condition.get("cblxbm")) {
		case "000":
			condition.put("cblxbm","全部");
			break;
		case "390":
			condition.put("cblxbm","城乡居民");
			break;
		case "391":
			condition.put("cblxbm","城镇职工");
			break;
		case "392":
			condition.put("cblxbm","省直医保");
			break;
		}
		
		String head = String.format("%s月"+"  "+"%s月"+"  "+"参保类型: %s",
				condition.get("syear"),condition.get("smonth"),condition.get("cblxbm"));
		
		
		// 对应科室的违规项目数目
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> wgxmNum = (List<Map<String, Object>>) info.get("wgxmNum");
		
		Map<String, List<Map<String, Object>>> map = new HashMap<>();	
		
		map.put("wgInfo", wgInfo);
		map.put("num", wgxmNum);
		
		List<String> listSheetNames = new ArrayList<>(); 
		List<String> objectNames = new ArrayList<>();
		List<String[]> titles = new ArrayList<>();
		List<String[]> infos = new ArrayList<>(); 
		
		listSheetNames.add("违规统计信息");
		
		String[] title1 = {"科室名称","违规项目名称","违规单据数"};
		titles.add(title1);
		
		String[] info1 = {"CYKS","GZMC","WGDJS"};
		infos.add(info1);
		
		objectNames.add("wgInfo");
		
		String exportName = "";
		if(flag.equals("ptzy")){
			exportName = "普通住院各科室违规统计";
		}else if(flag.equals("mgbz")){
			exportName = "门规病种各科室违规统计";
		}else if(flag.equals("ptmz")){
			exportName = "普通门诊各科室违规统计";
		}
		
		ExcelUtil.exportExcelWithSheets(response,head, exportName, 
				listSheetNames, titles, infos, map, objectNames,true);
		
	}
	
	/**
	 * 阶段报表：
	 * 乙类自付/自费比
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/classB")
	public void getClassBInfo(MgquotaVo mgquotaVo) {
		System.out.println(mgquotaVo);
		Map<String, Object> condition = getCondition(mgquotaVo);
		System.out.println(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		System.out.println(mgTitle);
		List<Map<String, Object>> info = excelExportService.getClassBInfo(condition);
		System.out.println(info);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		map.put("list", info);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "classBInfoExcel", "乙类自付比和自费比统计信息", map);
		
	}
	
	@ResponseBody
	@RequestMapping("/sumViolation")
	public void getSumViolation(MgquotaVo mgquotaVo,String flag,String wgzt) {
		Map<String, Object> condition = getCondition(mgquotaVo);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		String djzt = wgzt.equals("0")?"全部":(wgzt.equals("1")?"违规":"可疑");
		
		condition.put("jyfs", mgquotaVo.getJyfs());
		condition.put("wgzt", wgzt);
		List<Map<String, Object>> info = excelExportService.getSumViolation(condition);
		
		Map<String, Object> map = new HashMap<String,Object>();	
		
		mgTitle.get(0).put("wgzt", djzt);
		map.put("list", info);
		map.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "SumViolationDetailsExcel", "各科室违规详情统计信息", map);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	/**
	 * 导出数据  变 参保类型编码为参保类型
	 * 封装表头信息
	 * @param condition
	 * @return
	 */
	private List<Map<String, Object>> getTitleList(Map<String, Object> condition){
		if(condition.get("cblxbm") != null){
			switch ((String)condition.get("cblxbm")) {
			case "000":
				condition.put("cblxbm","全部");
				break;
			case "390":
				condition.put("cblxbm","城乡居民");
				break;
			case "391":
				condition.put("cblxbm","城镇职工");
				break;
			case "392":
				condition.put("cblxbm","省直医保");
				break;
			case "0":
				condition.put("cblxbm","全部");
				break;
			case "1":
				condition.put("cblxbm","城乡居民");
				break;
			case "2":
				condition.put("cblxbm","城镇职工");
				break;
			case "3":
				condition.put("cblxbm","省直医保");
				break;
			}
		}
		
		if (condition.get("ksbm")!=null) {
			List<Department> list = departmentService.selectByksbm((String)condition.get("ksbm"));
			condition.put("ksmc", list.get(0).getKsmc());
		}
		if (condition.get("ysgh")!=null) {
			if(condition.get("ysgh").equals("0000")){
				condition.put("ysxm", "全部");
			}else{
				Map<String, String> map = departmentService.getDoctorByysgh((String)condition.get("ysgh"));
				condition.put("ysxm", map.get("xm"));
			}
		}
		if(condition.get("jyfs")!=null){
			if(condition.get("jyfs").equals("13")){
				condition.put("jyfs","门规");
			}else if(condition.get("jyfs").equals("11")){
				condition.put("jyfs","门统");
			}else if(condition.get("jyfs").equals("21")){
				condition.put("jyfs","普通住院");
			}else if(condition.get("jyfs").equals("22")){
				condition.put("jyfs","单病种");
			}else{
				condition.put("jyfs", "全部");
			}
		}
		if(condition.get("ldate")!=null || condition.get("hdate")!=null){
			String s = "";
			if(condition.get("hdate")!=null){
				if(condition.get("ldate")!=null){
					s = String.format("就诊日期 :%s%s",condition.get("ldate"), "至"+condition.get("hdate"));
				}else{
					s = String.format("就诊日期 :%s","至"+condition.get("hdate"));
				}
			}else{
				s = String.format("就诊日期 :%s",condition.get("ldate"));
			}
			condition.put("data",s);
		}
		if (condition.get("zyzt")!=null&&!condition.get("zyzt").equals("0")) {
			if(condition.get("zyzt").equals("zy")){
				condition.put("zyzt","住院状态：在院患者");
			}else{
				condition.put("zyzt","住院状态：出院患者");
			}
		}
		
		List<Map<String, Object>> mgTitle = new ArrayList<>();
		mgTitle.add(condition);
		return mgTitle;
	}
	
	/**
	 * 封装查询数据
	 * @param mgquotaVo
	 * @return
	 */
	private Map<String, Object> getCondition(MgquotaVo mgquotaVo){
		Map<String, Object> condition = new HashMap<>();
		
		
		if(StringUtils.isNotBlank(mgquotaVo.getSyear())){
			condition.put("syear",mgquotaVo.getSyear());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getSmonth())){
			condition.put("smonth",mgquotaVo.getSmonth());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getCblxbm())){
			condition.put("cblxbm",mgquotaVo.getCblxbm());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getKsbm())){
			condition.put("ksbm",mgquotaVo.getKsbm());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getYsgh())){
			condition.put("ysgh",mgquotaVo.getYsgh());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getSfzhm())){
			condition.put("sfzhm",mgquotaVo.getSfzhm());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getHzxm())){
			condition.put("hzxm",mgquotaVo.getHzxm());
		}
		if(StringUtils.isNotBlank(mgquotaVo.getJyfs())){
			condition.put("jyfs",mgquotaVo.getJyfs());
		}
		return condition;
	}
	
	private Map<String, Object> getStructCondition(CostStructVo costStructVo){
		Map<String, Object> condition = new HashMap<>();
		condition.put("ksbm", costStructVo.getKsbm());
		condition.put("ysgh", costStructVo.getYsgh());
		condition.put("cblxbm", costStructVo.getCblxbm());
		condition.put("jyfs", costStructVo.getJyfs());
		condition.put("shzt", costStructVo.getShzt());
		condition.put("zlfs", costStructVo.getZlfs());
		condition.put("zyzt", costStructVo.getZyzt());
		
		if (StringUtils.isNotBlank(costStructVo.getSfzhm())) {
			condition.put("sfzhm", costStructVo.getSfzhm());
		}
		if (StringUtils.isNotBlank(costStructVo.getHzxm())) {
			condition.put("hzxm", costStructVo.getHzxm());
		}
		if (StringUtils.isNotBlank(costStructVo.getLdate())) {
            condition.put("ldate", costStructVo.getLdate());
        }
		if (StringUtils.isNotBlank(costStructVo.getHdate())) {
            condition.put("hdate", costStructVo.getHdate());
        }
		if (StringUtils.isNotBlank(costStructVo.getMzjbmc())) {
            condition.put("mzjbmc", costStructVo.getMzjbmc());
        }
		if (StringUtils.isNotBlank(costStructVo.getRyzd())) {
            condition.put("ryzd", costStructVo.getRyzd());
        }
		return condition;
	}
	
	/**
	 * 住院执行科室项目明细
	 * @param mgquotaVo
	 */
	@ResponseBody
	@RequestMapping("/zyzxksxmmxExport")
    public void zyzxksxmmxExport(MgquotaVo mgquotaVo,String ldate,String hdate) {
		Map<String, Object> condition = getCondition(mgquotaVo);
		
		if(StringUtils.isNotBlank(ldate)){
			condition.put("ldate", ldate);
		}
		if(StringUtils.isNotBlank(hdate)){
			condition.put("hdate", hdate);
		}

		List<Map<String, Object>> mgInfo = excelExportService.zyzxksxmmxExport(condition);
		List<Map<String, Object>> mgTitle = getTitleList(condition);
		if(null != mgTitle.get(0).get("data")){
			String data = (String)mgTitle.get(0).get("data");
			String data2 = data.replace("就诊", "出院");	
			mgTitle.get(0).put("data", data2);
		}
		
        for (Iterator<Map<String, Object>> iterator = mgInfo.iterator(); iterator.hasNext();) {
			Map<String, Object> map = (Map<String, Object>) iterator.next();
			map.put("BRXB", map.get("BRXB").equals("1") ? "男":"女");
			
			Float fyje = Float.parseFloat(map.get("FYJE").toString());	//总费用金额
			Float seflpay = Float.parseFloat(map.get("SEFLPAY").toString());	//自费金额
			Float ypf = Float.parseFloat(map.get("YPF").toString());	//药品费
			Float jyf = Float.parseFloat(map.get("JYF").toString());	//检查检验费
			Float zlf = Float.parseFloat(map.get("ZLF").toString());	//诊疗费
			Float clf = Float.parseFloat(map.get("CLF").toString());	//材料费
			DecimalFormat df = new DecimalFormat("##.##%");
			
			map.put("ZFZB", fyje<0.000001 ? 0 : df.format(seflpay/fyje));	//自费占比
			map.put("YZB", fyje<0.000001 ? 0 : df.format(ypf/fyje));	//药占比
			map.put("JCJYFZB", fyje<0.000001 ? 0 : df.format(jyf/fyje));//检查检验占比
			map.put("ZLFZB", fyje<0.000001 ? 0 : df.format(zlf/fyje));	//诊疗占比
			map.put("CLFZB", fyje<0.000001 ? 0 : df.format(clf/fyje));	//材料占比
        }
		
		Map<String, Object> expMap = new HashMap<String,Object>();
		
		expMap.put("list", mgInfo);
		expMap.put("title", mgTitle);
		
		ExcelUtil.exportExcel(response, "zyzxksxmmxExpTemp", "住院执行科室项目明细", expMap);		  
    }
	
    /**
     * 导出住院执行科室项目明细数量
     */
	@RequestMapping("/zyzxksxmmxCount")
    @ResponseBody
	public Integer zyzxksxmmxCount(String ldate,String hdate,String cblxbm,String ysgh,String sfzhm,String ksbm,String hzxm,String jyfs){
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("ldate", ldate);
		map.put("hdate", hdate);
		map.put("cblxbm", cblxbm);
		map.put("ysgh", ysgh);
		map.put("sfzhm", sfzhm);
		map.put("ksbm", ksbm);
		map.put("hzxm", hzxm);
		map.put("jyfs", jyfs);
		Integer count = excelExportService.zyzxksxmmxCount(map);
		return count;
	}
}
