package com.shuxin.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.ExcelImportUtil;
import com.shuxin.commons.utils.ExcelUploadUtil;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.DepartmentMapper;
import com.shuxin.mapper.DepartmentPlanMapper;
import com.shuxin.model.DepartmentPlan;
import com.shuxin.model.vo.DepartPlanModelVo;
import com.shuxin.service.IDepartmentPlanService;

@Service
public class DepartmentPlanServiceImpl  extends ServiceImpl<DepartmentPlanMapper,DepartmentPlan>   implements IDepartmentPlanService {
 
	@Autowired
	private DepartmentPlanMapper planMapper;
	@Autowired
	private DepartmentMapper departmentMapper;

	@Override
	public void selectDepartmentPlanDatagrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<DepartmentPlan> page = new Page<DepartmentPlan>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = planMapper.selectDepartmentPlanDatagrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
		
	}

	@Transactional
	@Override
	public Object insertDepartmentPlan(DepartmentPlan departmentPlan,List<DepartPlanModelVo> vos) {
		
		// 非城乡居民  无需设置区域
		if (!departmentPlan.getCblxbm().equals("390")) {
			departmentPlan.setQy(null);
		}
		
		if(StringUtils.isNotBlank(departmentPlan.getId())){
			this.updateById(departmentPlan);
			
			insert_updDepPlan(vos, departmentPlan.getId());
			
			return "修改成功";
		}else{
			Map<String, Object> columnMap = new HashMap<>();
			columnMap.put("syear", departmentPlan.getSyear());
			columnMap.put("cblxbm", departmentPlan.getCblxbm());
			columnMap.put("ksbm", departmentPlan.getKsbm());
			columnMap.put("qy", departmentPlan.getQy());
			List<DepartmentPlan> list = this.selectByMap(columnMap);
			if(list.size()>0){
				return "该科室已登记";
			}else{
				this.insert(departmentPlan);
				
				// 获取插入数据的id
				List<DepartmentPlan> plans = this.selectByMap(columnMap);
				String id = plans.get(0).getId();
				
				insert_updDepPlan(vos, id);
				return "添加成功";
			}
		}
		
	}
	
	/**
	 * 执行科室费用详情的新增、修改操作
	 * @param vos 科室费用详情  
	 * @param id	
	 */
	private void insert_updDepPlan(List<DepartPlanModelVo> vos,String id ){
		for (DepartPlanModelVo vo : vos) {
			if(vo!=null){
				vo.setId(id);
				vo.setKsfptype(getKsfptypeBm(vo.getKsfptype()));
				// vo 控费时间方式  1表示按照月度   2表示按照季度
				if(vo.getKfsjfs().equals("1")){
					//selectDepPlanOfMonth(vo).size() 如果存在就进行修改 否则新增
					if(planMapper.selectDepPlanOfMonth(vo).size()>0){
						planMapper.updateDepPlanOfMonth(vo);
					}else{
						planMapper.insertDepPlanOfMonth(vo);
					}
					
				}else if(vo.getKfsjfs().equals("2")){
					if(planMapper.selectDepPlanOfMonth(vo).size()>0){
						planMapper.updateDepPlanOfSeason(vo);
					}else{
						planMapper.insertDepPlanOfSeason(vo);
					}
				}
			}
		}
	}

	@Override
	public void getDepartmentDatagrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<DepartmentPlan> page = new Page<DepartmentPlan>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = planMapper.selectDepartmentPlanDatagrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
		
	}

	@Override
	public int updateDepPlanOfMonth(DepartPlanModelVo vo) {
		int num = 0;
		List<String> list = planMapper.selectDepPlanOfMonth(vo);
		if(list.size()>0){
			num = planMapper.updateDepPlanOfMonth(vo);	
		}else{
			num = planMapper.insertDepPlanOfMonth(vo);
		}
		return num;
	}

	/**
	 * 查询月度和季度定额详情，若有则返回；若无则不做显示
	 */
	@Override
	public Object getDataOfMonth(Map<String, Object> params) {
		
		Map<String, Object> map  = null;
		
		if(planMapper.getDataOfMonth(params)!=null){
			// 月度查询
			map = planMapper.getDataOfMonth(params);
			map.put("type", "month");
		}else{
			map = planMapper.getDataOfSeason(params);
			if(map!=null){
				// 季度查询
				map.put("type", "season");
			}else{
				map = new HashMap<>();
				map.put("type", "none");
			}
		}
		return map;
	}

	@Override
	public int updateDepPlanOfSeason(DepartPlanModelVo vo) {
		int num = 0;
		List<String> list = planMapper.selectDepPlanOfSeason(vo);
		if(list.size()>0){
			num = planMapper.updateDepPlanOfSeason(vo);	
		}else{
			num = planMapper.insertDepPlanOfSeason(vo);
		}
		return num;
	}
	
	private String getKsfptypeBm(String ksfptype){
		if(ksfptype.equals("医疗总费用定额设定")||ksfptype.equals("ylzfyxe")){
			return "ylf";
		}else if(ksfptype.equals("住院人次定额设定")||ksfptype.equals("zyrc")){
			return "zyrc";
		}else if(ksfptype.equals("基金限额设定")||ksfptype.equals("jjxe")){
			return "jjxe";
		}
		return null;
	}

	@Transactional
	@Override
	public String deleteByids(String ids) {
		List<String> idsList = StringUtils.strTurnList(ids);
		
		boolean flag1 = this.deleteBatchIds(idsList);
		
		boolean flag2 = planMapper.deletePlanOfMonthByids(idsList);
		
		boolean flag3 = planMapper.deletePlanOfSeasonByids(idsList);
		
		if(flag1&&flag2&&flag3){
			return "删除成功";
		}else{
			return "删除失败";
		}
		
	}

	@Transactional
	@Override
	public void delDepPlanByid(String id) {

		planMapper.delDepPlanOfMonthByid(id);
		
		planMapper.delDepPlanOfSeasonByid(id);
	}

	@Override
	public String uploadDePlans(HttpServletRequest request, HttpServletResponse response,String path) {
		List<DepartmentPlan> dPlans;
		Map<String, Object> condition = new HashMap<>();
		List<Map<String, Object>> sbzds = departmentMapper.getSbInfo();
		//  上传导入文件到指定地址
		ExcelUploadUtil.upload(request, response,path,condition);
		String cblxbm = (String)condition.get("cblxbm");
		String syear = (String)condition.get("syear");
		String qy = (String)condition.get("qy");
		if(hasData(condition,syear,cblxbm,qy)){
			String cblx = cblxbm.equals("390")?"城乡居民":(cblxbm.equals("391")?"城镇职工":"省直医保");
			return "已存在数据,请清空当前数据重新导入！";
		};
		try {
			dPlans = ExcelImportUtil.loadScoreInfo(path,cblxbm,syear,qy);
			// 城镇职工以及历城区居民数据导入
			if(dPlans!=null){
				for (DepartmentPlan departmentPlan : dPlans) {
					this.insert(departmentPlan);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "导入失败！";
		}
		return "导入成功";
	}
	
	/**
	 * 判断是否存在当前年份相同参保类型的数据(城乡居民区域相同)
	 * @param condition
	 * @param syear
	 * @param cblxbm
	 * @return
	 */
	public boolean hasData(Map<String, Object> condition,String syear,String cblxbm,String qy){
		List<Map<String, Object>> list = planMapper.selectDepartmentPlanDatagrid( new Page<DepartmentPlan>(), condition);
		if(list.size()>0){
			return true;
		}
		return false;
	}

}
