package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.vo.MgquotaVo;

/**
 *
 * @description 数据监控--出院评价、数据监控--住院患者查询  数据服务层
 *
 */
public interface IInHospitalMonitoringService extends IService<MgquotaVo> {

	public List<Map<String, Object>> monitorBudget(MgquotaVo mgquotaVo);
	
	public Object evaluationIndex(MgquotaVo mgquotaVo);
	
	public List<Map<String, Object>> costtSatistics(MgquotaVo mgquotaVo);
	
	public List<Map<String, Object>> monthlyTrend(MgquotaVo mgquotaVo);
				
	public void physicianPerformance(PageInfo pageInfo);
	
	public List<Map<String, Object>> monthlyTrendControl(MgquotaVo mgquotaVo);
	
	public List<Map<String, Object>> trendPerCapitaExpenditure(MgquotaVo mgquotaVo);
	
	public List<Map<String, Object>> controlProjectSet(MgquotaVo mgquotaVo);
	
	public List<Map<String, Object>> overhospitalization(MgquotaVo mgquotaVo);
	
	public List<Map<String, Object>> hospitalStay(MgquotaVo mgquotaVo);
	
	public void inpatientEnquiry(PageInfo pageInfo);
	
	public void zywgTable(PageInfo pageInfo);
	
	public void illegalDocuments(PageInfo pageInfo);
	
	public void getHospitalizedDataGrid(PageInfo pageInfo);

	Page<Map<String, Object>> selectMapsPage(Page page, Wrapper<MgquotaVo> wrapper);
	
	public void getzyViolationDetails(PageInfo pageInfo);

	public void zyzxksxmmxGrid(PageInfo pageInfo);

}