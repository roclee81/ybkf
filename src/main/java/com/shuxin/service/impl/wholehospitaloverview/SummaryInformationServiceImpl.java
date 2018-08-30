package com.shuxin.service.impl.wholehospitaloverview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.mapper.wholeHospitaloverview.SummaryInformationMapper;
import com.shuxin.model.vo.SummaryInformation;
import com.shuxin.service.ISummaryInformationService;

/**
 * 描述:   全院概览服务类
 * 详细:  
 * 类名:   SummaryInformationServiceImpl
 * 所属包: com.shuxin.service.impl.wholehospitaloverview
 * 作者:   ThinkPad
 * 版本:   1.0
 * 日期 :   2017年10月26日 上午11:17:43
 */
@Service
public class SummaryInformationServiceImpl extends ServiceImpl<SummaryInformationMapper, SummaryInformation>
        implements ISummaryInformationService {
    
    @Autowired
    private SummaryInformationMapper sumInfoMapper; 

    /** 
     * 描述: 全院概览-普通门诊-关键指标-月度变化k线图Data 
     * 重写: getListByYear
     * 作者: ThinkPad
     * 时间: 2017年10月26日 上午11:17:56
     * @param syear
     * @param cblxbm
     * @return
     */
    @Override
    public List<SummaryInformation> getListByYear(String syear, String cblxbm) {
        
        Map<String, Object> params = new HashMap<>(); 
        params.put("syear", syear);
        params.put("cblxbm", cblxbm);
        
        List<SummaryInformation> list = sumInfoMapper.getListByYear(params);
        
        return list;
    }

    @Override
    public List<SummaryInformation> findmonthcostofMg(String syear, String cblxbm, String ksbm, String ysgh) {
        
        
        Map<String, Object> params = new HashMap<>(); 
        params.put("syear", syear);
        params.put("cblxbm", cblxbm);
        params.put("ksbm", ksbm);
        params.put("ysgh", ysgh);
        
        List<SummaryInformation> list = sumInfoMapper.findmonthcostofMg(params);
        return list;
    }
    
    
    
    

}
