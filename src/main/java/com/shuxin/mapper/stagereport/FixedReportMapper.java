package com.shuxin.mapper.stagereport;

import java.util.List;
import java.util.Map;
import org.apache.poi.ss.formula.functions.T;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;

public interface FixedReportMapper extends BaseMapper<T>{

    List<Map<String, Object>> getTotalMonitoring(Page<?> page, Map<String, Object> condition);

    List<Map<String, Object>> getMedicareCosts(Page<?> pageObj, Map<String, Object> condition);

    List<Map<String, Object>> getPerformanceIndicators(Page<?> pageObj, Map<String, Object> condition);

    List<Map<String, Object>> getPersonIndex(Page<?> pageObj, Map<String, Object> condition);

    List<Map<String, Object>> getDiseaseManagement(Page<?> pageObj, Map<String, Object> condition);

    List<Map<String, Object>> getOutpatientSpecial(Page<?> pageObj, Map<String, Object> condition);

    List<Map<String, Object>> getOutPatient(Page<?> pageObj, Map<String, Object> condition);

    List<Map<String, Object>> getQuestionDocument(Page<?> pageObj, Map<String, Object> condition);

	List<Map<String, Object>> getHosPatInfoGrid(Page<?> pageObj, Map<String, Object> condition);

	List<Map<String, Object>> getSummaryVioDetailsGrid(Page<?> pageObj, Map<String, Object> condition);

    
}
