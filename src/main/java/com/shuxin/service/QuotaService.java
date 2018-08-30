package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.vo.QuotaVo;

public interface QuotaService extends IService<QuotaVo> {

    PageInfo selectPageInfo(QuotaVo quotaVo, Integer page, Integer rows, String sort, String order);
    
    List<Map<String, Object>> getKeyIndexZY(QuotaVo quotaVo);
    
    List<Map<String, Object>> getKeyIndexBZ(QuotaVo quotaVo);
    
    List<Map<String, Object>> getKeyIndexZL(QuotaVo quotaVo);

}
