package com.shuxin.service.impl.doorManager;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.commons.utils.StringUtils;
import com.shuxin.mapper.doorManager.MgquotaMapper;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IMgquotaService;
@ Service
public class MgquotaServiceImpl  extends ServiceImpl<MgquotaMapper,Mgquota>   implements IMgquotaService{

	
	@Autowired
	private MgquotaMapper mgquotaMapper;

	@Override
	public void selectmgquotaDataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		 Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
	        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
	        page.setOrderByField(orderField);
	        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
	        List<Map<String, Object>> list = mgquotaMapper.selectmgquotaDataGrid(page, pageInfo.getCondition());
	        pageInfo.setRows(list);
	        pageInfo.setTotal(page.getTotal());	
	}

	@Override
	public List<Map<String, Object>> mgquotadepartZB(MgquotaVo  mgquotaVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=mgquotaMapper.mgquotadepartZB(mgquotaVo);
		return list;
	}

	@Override
	public List<Map<String, Object>> mzquotadepartZB(MgquotaVo mgquotaVo) {
		List<Map<String, Object>> list=mgquotaMapper.mzquotadepartZB(mgquotaVo);
		MgquotaVo newmgquotaVo = new MgquotaVo();
		
		if ("01".equals(mgquotaVo.getSmonth())) {
		    newmgquotaVo.setSyear(Integer.parseInt(mgquotaVo.getSyear())-1+"");
		    newmgquotaVo.setSmonth("12");
        }else{
            newmgquotaVo.setSyear(mgquotaVo.getSyear());
            newmgquotaVo.setSmonth(mgquotaVo.getLmonth());
        }
		
		
		newmgquotaVo.setCblxbm(mgquotaVo.getCblxbm());
		newmgquotaVo.setKsbm(mgquotaVo.getKsbm());
		List<Map<String, Object>> list1=mgquotaMapper.mzquotadepartZB(newmgquotaVo);
		
		if (list1!=null && !list1.isEmpty()&&list1.size()>0) {
		    list.add(list1.get(0));
        }
		
		return list;
	}

	@Override
	public void selectmzquotaDataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.selectmzquotaDataGrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
	}

	@Override
	public void mzViolationsDocuments(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzViolationsDocuments(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
	}
	
	@Override
	public void mgViolationsDocuments(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mgViolationsDocuments(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
	}
	
	@Override
	public void mgViolationsDocumentsDepart(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mgViolationsDocumentsDepart(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
	}

	@Override
	public void mzViolationdetails(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzViolationdetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mgViolationdetails(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mgViolationdetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public void mzwggzOrderTable(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzwggzOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void wggzOrderTable(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.wggzOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mzwgdepartOrderTable(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzwgdepartOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mzwgDoctorOrderTable(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzwgDoctorOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mgwgDoctorOrderTable(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mgwgDoctorOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void wgdepartOrderTable(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.wgdepartOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public void mzwgdjDocuments(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzwgdjDocuments(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mzwgdjDocuments_dapart(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzwgdjDocuments_dapart(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mzmgdetails(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzmgdetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void wholemgdetails(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.wholemgdetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void mzmgdetails_depart(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzmgdetails_depart(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}
	
	@Override
	public void getmzpatientDataGrid(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.getmzpatientDataGrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
	}

	@Override
	public String cumulativeMonthly(MgquotaVo  mgquotaVo) {
		// TODO Auto-generated method stub
		String accumulate=mgquotaMapper.cumulativeMonthly(mgquotaVo);
		return accumulate;
	}

	@Override
	public String cumulativeYear(MgquotaVo  mgquotaVo) {
		// TODO Auto-generated method stub
		String accumulate=mgquotaMapper.cumulativeYear(mgquotaVo);
		return accumulate;
	}

	@Override
	public Map<String, Object> analysisIndicators(MgquotaVo  mgquotaVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list=mgquotaMapper.analysisIndicators(mgquotaVo);
		Map<String,Object> map=list.get(0);
		return map;
	}

    @Override
    public void getMzquotaKeyDataGrid(PageInfo pageInfo) {
     // TODO Auto-generated method stub
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.getMzquotaKeyDataGrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        
    }

    public PageInfo queryConditions(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String order){
        PageInfo pageInfo = new PageInfo(page, rows, "", "");
        Map<String, Object> condition = new HashMap<String, Object>();
        
        if(mgquotaVo.getKsbm()!=null && StringUtils.isNotBlank(mgquotaVo.getKsbm())){
           condition.put("ksbm", mgquotaVo.getKsbm());
        }
        if(mgquotaVo.getSyear()!=null && StringUtils.isNotBlank(mgquotaVo.getSyear())){
           condition.put("syear", mgquotaVo.getSyear());
        }
        if(mgquotaVo.getSmonth()!=null && StringUtils.isNotBlank(mgquotaVo.getSmonth())){
               condition.put("smonth", mgquotaVo.getSmonth());
            }   
        if(mgquotaVo.getCblxbm()!=null && StringUtils.isNotBlank(mgquotaVo.getCblxbm())){
            
            condition.put("cblxbm", mgquotaVo.getCblxbm());
        }
        if(mgquotaVo.getQybm()!=null && StringUtils.isNotBlank(mgquotaVo.getQybm())){
            
            condition.put("qybm", mgquotaVo.getQybm());
        }
        if(mgquotaVo.getYsgh()!=null && StringUtils.isNotBlank(mgquotaVo.getYsgh())){
            
            condition.put("ysgh", mgquotaVo.getYsgh());
        }
        if(mgquotaVo.getBzxh()!=null && StringUtils.isNotBlank(mgquotaVo.getBzxh())){
            
            condition.put("bzxh", mgquotaVo.getBzxh());
        }   
        if(mgquotaVo.getGzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getGzbm())){
        
        condition.put("gzbm", mgquotaVo.getGzbm());
        }
        if(mgquotaVo.getMzlsh()!=null && StringUtils.isNotBlank(mgquotaVo.getMzlsh())){
            
        condition.put("mzlsh", mgquotaVo.getMzlsh());
        }
        if(mgquotaVo.getBzmc()!=null && StringUtils.isNotBlank(mgquotaVo.getBzmc())){
            
        condition.put("bzmc", mgquotaVo.getBzmc());
        }
        if(mgquotaVo.getBzbm()!=null && StringUtils.isNotBlank(mgquotaVo.getBzbm())){
                    
        condition.put("bzbm", mgquotaVo.getBzbm());
        }if(mgquotaVo.getSfzhm()!=null && StringUtils.isNotBlank(mgquotaVo.getSfzhm())){
            
        condition.put("sfzhm", mgquotaVo.getSfzhm());
        }
            pageInfo.setCondition(condition);
            return pageInfo;
    }

    /* (非 Javadoc)
    * 
    *  
    * @param pageInfo
    * @see com.shuxin.service.IMgquotaService#selectmzKeyDataGrid(com.shuxin.commons.utils.PageInfo)
    */
    @Override
    public void selectmzKeyDataGrid(PageInfo pageInfo) {
        
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        
        List<Map<String, Object>> list = mgquotaMapper.selectmzksDataGrid(page, pageInfo.getCondition());
        
        
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal()); 
        
    }

	@Override
	public List<Map<String, Object>> selectPatient(MgquotaVo mgquotaVo) {
		// TODO Auto-generated method stub
		List<Map<String, Object>> list = mgquotaMapper.selectPatient(mgquotaVo);
		return list;
	}


	public String getGzbmByMzlsh(String mzlsh) {
		// TODO Auto-generated method stub
		String gzbm = mgquotaMapper.getGzbmByMzlsh(mzlsh);
		return gzbm;
	}

    @Override
    public void wholeDocument(PageInfo pageInfo) {
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.wholeDocument(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        
    }

    @Override
    public boolean getWholeDocument(String mzlsh) {
        
        List<Map<String, Object>> list  =  mgquotaMapper.getWholeDocument(mzlsh);
        if (list !=null &&!list.isEmpty()) {
            return  true ;
        }else{
            return false;
        }

    }

    @Override
    public void mzViolationdetailsDoc(PageInfo pageInfo) {
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mzViolationdetailsDoc(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        
    }

    @Override
	public void mgViolationsDocumentsBZ(PageInfo pageInfo) {
		// TODO Auto-generated method stub
		Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = mgquotaMapper.mgViolationsDocumentsBZ(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());	
	}
	
}