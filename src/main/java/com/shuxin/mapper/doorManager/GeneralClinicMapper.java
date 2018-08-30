package com.shuxin.mapper.doorManager;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface GeneralClinicMapper extends BaseMapper<Mgquota> {

    List<Map<String, Object>> mzquotadepartZB(MgquotaVo mgquotaVo);

    List<Map<String, Object>> selectmzquotaDataGrid(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> mzViolationsDocuments(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> mzwgdepartOrderTable(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> mzwgDoctorOrderTable(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> wholeDocument(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getWholeDocument(String mzlsh);

    List<Map<String, Object>> mzwggzOrderTable(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> mzViolationdetails(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getwholedocumentdetails(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getmzquotaKeyIndexGrid(Page<Mgquota> page, Map<String, Object> condition);


}
