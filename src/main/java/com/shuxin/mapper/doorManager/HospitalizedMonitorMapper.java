package com.shuxin.mapper.doorManager;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface HospitalizedMonitorMapper extends BaseMapper<Mgquota>{

    List<Map<String, Object>> getExampleNumber(MgquotaVo mVo);

    List<Map<String, Object>> getInhospatientGrid(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getDiagnosisInfo(String zylsh);

    List<Map<String, Object>> getCostWarning(String zylsh);

    List<Map<String, Object>> getAuditViolations(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getOrderDetails(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getChargeDetails(Page<Mgquota> page, Map<String, Object> condition);

}
