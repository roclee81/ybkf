package com.shuxin.service.stagereport;

import org.apache.poi.ss.formula.functions.T;
import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;

public interface IFixedReportService extends IService<T>{

    PageInfo getTotalMonitoring(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort, String order);

    PageInfo getMedicareCosts(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

    PageInfo getPerformanceIndicators(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

    PageInfo getPersonIndex(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

    PageInfo getDiseaseManagement(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

    PageInfo getOutpatientSpecial(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

    PageInfo getOutPatient(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

    PageInfo getQuestionDocument(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order);

	PageInfo getHosPatInfoGrid(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
			String order);

	PageInfo getSummaryVioDetailsGrid(String syear, String smonth, String ksbm,String jyfs,
			String wgzt, Integer page, Integer rows, String sort,String order);

}
