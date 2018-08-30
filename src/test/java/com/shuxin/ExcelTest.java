package com.shuxin;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-config.xml")
public class ExcelTest {
//	@Resource
//	InHospitalMonitoringMapper inHospitalMonitoringMapper;
//	@Resource
//	IDepartmentPlanService dplanService;
	
	@Test
	public void test1() throws Exception {
//		List<DepartmentPlan> entityList = ExcelImportUtil.loadScoreInfo("e://居民科室预算指标.xls");
//		dplanService.insertBatch(entityList);
	}
}
