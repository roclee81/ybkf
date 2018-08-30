package com.shuxin.mapper.wholeHospitaloverview;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.shuxin.model.vo.SummaryInformation;

public interface SummaryInformationMapper extends BaseMapper<SummaryInformation> {

    List<SummaryInformation> getListByYear(Map<String, Object> params);

    List<SummaryInformation> findmonthcostofMg(Map<String, Object> params);

}
