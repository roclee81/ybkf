package com.shuxin.mapper.decisionAnalysis;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.CommonModel;

import com.shuxin.model.vo.CostStructVo;
import com.shuxin.model.vo.MgquotaVo;

public interface CostStructMapper extends BaseMapper<CommonModel>{
	public List<Map<String, String>> mgDoctorDataGrid(Page<CostStructVo> page,
			Map<String, Object> condition);	
	public List<Map<String, String>> mgPatientDataGrid(Page<CostStructVo> page,
			Map<String, Object> condition);	
	public List<Map<String, String>> mgdjDataGrid(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, String>> mzdjDataGrid(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getFYMXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getYZMXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	
	public List<Map<String, Object>> getZFTXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getWGXXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>>  selectBigmoneycheck(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, String>> medicalRecords(Page<CostStructVo> page,
			Map<String, Object> condition);	
/*	public List<Map<String, String>> mgDoctorDataGrid(Page<CostStructVo> page,
			Map<String, Object> condition);	
	public List<Map<String, String>> aaa(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, String>> getSHWGGridByDoctor(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, String>> getSHWGGridByDepart(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, String>> getSHWGGroupByRule(CostStructVo costStructVo);
	public List<Map<String, String>> getSHWGGroupByDepart(CostStructVo costStructVo);
	public List<Map<String, String>> selectConsumableByDepart(CostStructVo costStructVo);
	public List<Map<String, String>> selectConsumableByMonth(CostStructVo costStructVo);
	public List<Map<String, String>> selectConsumablePie(CostStructVo costStructVo);
	public List<Map<String, String>> selectOperationInfoByDepart(CostStructVo costStructVo);
	public List<Map<String, String>> selectOperationInfoBySSDJ(CostStructVo costStructVo);
	public List<Map<String, String>> getTreatmentByDepart(CostStructVo costStructVo);
	public List<Map<String, String>> getJYJCByDepart(CostStructVo costStructVo);
	public List<Map<String, String>> getJCJYLineByCondition(CostStructVo costStructVo);
	
	public List<Map<String, String>> getLineGroupByDepartment(CostStructVo costStructVo);
	public List<Map<String, String>> getLineByDrugCodeAndYear(CostStructVo costStructVo);
	public List<Map<String, String>> getYPFXByDateAndKSBM(CostStructVo costStructVo);
	public List<Map<String, Object>> getFYMXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getYZMXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getLJBYByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getZFTXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> getWGXXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	
	public List<Map<String, Object>> getPatientInfo(Page<CostStructVo> page,
				Map<String, Object> condition);
	public List<Map<String, Object>> selectDoctorAdviceByLsh(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>> selectCostDetailByLsh(Page<CostStructVo> page,
			Map<String, Object> condition);

	public List<Map<String, Object>> getInvoiceByCondition(Page<CostStructVo> page,
			Map<String, Object> condition);
	
	public List<Map<String, Object>>  singleDiseaseSearch(Page<CostStructVo> page,
			Map<String, Object> condition);
	
	public List<Map<String, Object>>  getOutHospital(Page<CostStructVo> page,
			Map<String, Object> condition);
	public List<Map<String, Object>>  getCFINFO(Page<CostStructVo> page,
			Map<String, Object> condition);

	public List<Map<String, String>> SelectAddressPopulation(CostStructVo costStructVo);
	
	public List<Map<String, String>> singleProjectDoctSort(CostStructVo costStructVo);
	public List<Map<String, String>> SelectCostFlagofMonth(CostStructVo costStructVo);
	public List<Map<String, String>> SelectFundUseOfdepart(CostStructVo costStructVo);*/
	public List<Map<String, String>> searchbzrcECharts(CostStructVo costStructVo);
	public List<Map<String, String>> searchbzxeECharts(CostStructVo costStructVo);
	public List<Map<String, String>> findmonthcostofMg(CostStructVo costStructVo);
	public List<Map<String, String>> monthlyIndicatorTrend(CostStructVo costStructVo);
	public List<Map<String, String>> wgdepartOrder(CostStructVo costStructVo);
	public List<Map<String, String>> mzwgdepartOrder(CostStructVo costStructVo);
	public List<Map<String, String>> mzwgDoctorOrder(CostStructVo costStructVo);
	public List<Map<String, String>> mgwgDoctorOrder(CostStructVo costStructVo);
	public List<Map<String, String>> wggzOrder(CostStructVo costStructVo);
	public List<Map<String, String>> mzwggzOrder(CostStructVo costStructVo);
	public List<Map<String, String>> selectByLsh(CostStructVo costStructVo);
	public List<Map<String, String>> getFYZBYJByLSH(CostStructVo costStructVo);
	public List<Map<String, String>> checkState(CostStructVo costStructVo);
	public List<Map<String, String>> mzTable(CostStructVo costStructVo);
	public List<Map<String, String>> mzViolationsDocuments(CostStructVo costStructVo);
	public List<Map<String, String>> mzViolationdetails(CostStructVo costStructVo);
	public List<Map<String, String>> patientEnquiry(CostStructVo costStructVo);
	public List<Map<String, String>> findquota(CostStructVo costStructVo);
	public List<Map<String, String>> keypatientsChart(CostStructVo costStructVo);

	public List<Map<String, String>> mzlinechart(CostStructVo costStructVo);

	//出院评价-费用统计-月度变化趋势
	public List<Map<String, String>> monthlyTrendCost(CostStructVo costStructVo);  
	//出院评价-违规汇总-规则  
	public List<Map<String, String>> zywggzOrder(CostStructVo costStructVo);
	//出院评价-违规汇总-科室
	public List<Map<String, String>> zywgdepartOrder(CostStructVo costStructVo);
	//出院评价-违规汇总-医师
	public List<Map<String, String>> zywgDoctorOrder(CostStructVo costStructVo);
	//出院评价-重点监控-住院费用超额
	public List<Map<String, String>> overhospitalization(CostStructVo costStructVo);
	//出院评价-重点监控-住院时间超长
	public List<Map<String, String>> hospitalStay(CostStructVo costStructVo);
	//全院概览-普通住院-月度变化趋势
	public List<Map<String, String>> monthlyTrendPTZY(CostStructVo costStructVo);
	//全院概览-住院病种-月度变化趋势
	public List<Map<String, String>> monthlyTrendZYBZ(CostStructVo costStructVo);
	
	//门诊审核-处方明细 
	public List<Map<String, String>> getCFMXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	//门诊审核-收费明细 
	public List<Map<String, String>> getSFMXByLSH(Page<CostStructVo> page,
			Map<String, Object> condition);
	
	//可疑单据查询
	public List<Map<String, String>> mzkydjDataGrid(Page<CostStructVo> page,
			Map<String, Object> condition);

	// 住院审核-医嘱明细
	public List<Map<String, String>> docDetail(Page<CostStructVo> page, Map<String, Object> condition);

	// 住院审核-费用明细
	public List<Map<String, String>> costDetail(Page<CostStructVo> page, Map<String, Object> condition);
	
	// 违规统计-违规规则排序
	public List<Map<String, String>> ruleOrderingTable(Page<CostStructVo> page, Map<String, Object> condition);
	
	// 违规统计-违规科室排序
	public List<Map<String, String>> departOrderingTable(Page<CostStructVo> page, Map<String, Object> condition);
	
	// 违规统计-违规医师排序
	public List<Map<String, String>> doctorOrderingTable(Page<CostStructVo> page, Map<String, Object> condition);

}
