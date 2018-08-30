package com.shuxin.service.doorManager;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface IHospitalizedMonitorService extends IService<Mgquota>{

    List<Map<String, Object>> getExampleNumber(MgquotaVo mVo);

    void getInhospatientGrid(PageInfo pageInfo);

    List<Map<String, Object>> getDiagnosisInfo(String zylsh);

    List<Map<String, Object>> getCostWarning(String zylsh);

    void getAuditViolations(PageInfo pageInfo);

    void getDischargedMedicine(PageInfo pageInfo);

    void getOrderDetails(PageInfo pageInfo);

    void getChargeDetails(PageInfo pageInfo);

}
