package com.shuxin.service.impl.stagereport;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.stagereport.FixedReportMapper;
import com.shuxin.service.stagereport.IFixedReportService;

@Service
public class FixedReportServiceImpl extends ServiceImpl<FixedReportMapper, T> implements IFixedReportService {

    @Autowired
    private FixedReportMapper mapper;

    @Override
    public PageInfo getTotalMonitoring(String syear, String smonth, String ksbm, Integer page, Integer rows,
            String sort, String order) {

        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);

        List<Map<String, Object>> list = mapper.getTotalMonitoring(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    @Override
    public PageInfo getMedicareCosts(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order) {

        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getMedicareCosts(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    @Override
    public PageInfo getPerformanceIndicators(String syear, String smonth, String ksbm, Integer page, Integer rows,
            String sort, String order) {

        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getPerformanceIndicators(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    @Override
    public PageInfo getPersonIndex(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order) {

        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getPersonIndex(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    @Override
    public PageInfo getDiseaseManagement(String syear, String smonth, String ksbm, Integer page, Integer rows,
            String sort, String order) {

        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getDiseaseManagement(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    @Override
    public PageInfo getOutpatientSpecial(String syear, String smonth, String ksbm, Integer page, Integer rows,
            String sort, String order) {

        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getOutpatientSpecial(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    @Override
    public PageInfo getOutPatient(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order) {
        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getOutPatient(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }
    
    @Override
    public PageInfo getQuestionDocument(String syear, String smonth, String ksbm, Integer page, Integer rows,
            String sort, String order) {
        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);
        List<Map<String, Object>> list = mapper.getQuestionDocument(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
    }

    private PageInfo getPageInfo(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
            String order) {
        
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();

        condition.put("syear", syear);
        condition.put("smonth", smonth);
        condition.put("ksbm", ksbm);

        pageInfo.setCondition(condition);

        return pageInfo;
    }

    private Page<?> getPage(PageInfo pageInfo) {

        Page<?> page = new Page<>(pageInfo.getNowpage(), pageInfo.getSize());

        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));

        return page;
    }

	@Override
	public PageInfo getHosPatInfoGrid(String syear, String smonth, String ksbm, Integer page, Integer rows, String sort,
			String order) {
        PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);

        Page<?> pageObj = getPage(pageInfo);

        List<Map<String, Object>> list = mapper.getHosPatInfoGrid(pageObj, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(pageObj.getTotal());

        return pageInfo;
	}
 
	@Override
	public PageInfo getSummaryVioDetailsGrid(String syear, String smonth, String ksbm, String jyfs,String wgzt,
			Integer page, Integer rows, String sort,String order) {
		PageInfo pageInfo = getPageInfo(syear, smonth, ksbm, page, rows, sort, order);
		pageInfo.getCondition().put("jyfs", jyfs);
		pageInfo.getCondition().put("wgzt", wgzt);
		
		Page<?> pageObj = getPage(pageInfo);
		
		List<Map<String, Object>> list = mapper.getSummaryVioDetailsGrid(pageObj, pageInfo.getCondition());
		pageInfo.setRows(list);
		pageInfo.setTotal(pageObj.getTotal());
		
		return pageInfo;
	}
	
}
