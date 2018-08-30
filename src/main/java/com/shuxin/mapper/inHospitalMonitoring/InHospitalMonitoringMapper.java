package com.shuxin.mapper.inHospitalMonitoring;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface InHospitalMonitoringMapper extends BaseMapper<MgquotaVo> {

    Map<String, Object> monitorBudget(MgquotaVo mgquotaVo);
    
    Map<String, Object> evaluationIndex(MgquotaVo mgquotaVo);
    
    Map<String, Object> sharecost(MgquotaVo mgquotaVo);
    
    Map<String, Object> costtSatistics(MgquotaVo mgquotaVo);
    
    List<Map<String, Object>> zywggzOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> zywgdepartOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> zywgDoctorOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> illegalDocuments(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> physicianPerformanceLJ(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> physicianPerformanceRJ(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> physicianPerformanceZB(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> inpatientEnquiry(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> getHospitalizedDataGrid(Page<Mgquota> page, 
    		Map<String, Object> condition);
    
    List<Map<String, Object>> getzyViolationDetails(Page<Mgquota> page,
			Map<String, Object> condition);

    List<Map<String, Object>> getzyWholeViolationDetails(Page<Mgquota> page,
			Map<String, Object> condition);
    
    List<Map<String, Object>> zyzxksxmmxGrid(Page<Mgquota> page, 
    		Map<String, Object> condition);
    
    Integer zyzxksxmmxCount(Map<String, Object> condition);
}
