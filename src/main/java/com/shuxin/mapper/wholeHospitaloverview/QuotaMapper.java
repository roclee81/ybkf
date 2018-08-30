package com.shuxin.mapper.wholeHospitaloverview;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Department;
import com.shuxin.model.vo.QuotaVo;

public interface QuotaMapper extends BaseMapper<Department> {

    List<Map<String, Object>> getQuotaGrid(Page<QuotaVo> page, Map<String, Object> condition);
    
    Map<String, Object> getKeyIndexZY(QuotaVo quotaVo);
    
    Map<String, Object> getKeyIndexBZ(QuotaVo quotaVo);
    
    Map<String, Object> getKeyIndexZL(QuotaVo quotaVo);
}
