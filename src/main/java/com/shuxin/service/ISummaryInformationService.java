package com.shuxin.service;

import java.util.List;
import com.baomidou.mybatisplus.service.IService;
import com.shuxin.model.vo.SummaryInformation;

public interface ISummaryInformationService extends IService<SummaryInformation>{

    List<SummaryInformation> getListByYear(String syear, String cblxbm);

    List<SummaryInformation> findmonthcostofMg(String syear, String cblxbm, String ksbm, String ysgh);

}
