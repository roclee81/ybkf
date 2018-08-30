package com.shuxin.service.impl.doorManager;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.doorManager.GeneralClinicMapper;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.IGeneralClinicService;

@Service
public class GeneralClinicServiceImpl extends ServiceImpl<GeneralClinicMapper,Mgquota>   implements IGeneralClinicService{
    
    @Autowired
    private GeneralClinicMapper generalClinicMappermapper ;

    @Override
    public List<Map<String, Object>> mzquotadepartZB(MgquotaVo mgquotaVo) {
        
        List<Map<String, Object>> list=generalClinicMappermapper.mzquotadepartZB(mgquotaVo);
        
        if (list ==null || list.size()<1) {
            Map<String, Object> params = new HashMap<>();
            params.put("wgdjs",0);
            params.put("ybtczf",0);
            params.put("ylf",0);
            params.put("jzrc",0);
            params.put("cjfy",0);
            params.put("cjjcjyf",0);
            params.put("cjyf",0);
            list.add(params);
            
        }
        
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
        List<Map<String, Object>> list1=generalClinicMappermapper.mzquotadepartZB(newmgquotaVo);
        
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
        List<Map<String, Object>> list = generalClinicMappermapper.selectmzquotaDataGrid(page, pageInfo.getCondition());
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
        List<Map<String, Object>> list = generalClinicMappermapper.mzViolationsDocuments(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal()); 
    }
    @Override
    public void wholeDocument(PageInfo pageInfo) {
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = generalClinicMappermapper.wholeDocument(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        
    }

    @Override
    public boolean getWholeDocument(String mzlsh) {
        
        List<Map<String, Object>> list  =  generalClinicMappermapper.getWholeDocument(mzlsh);
        
        if (list !=null &&!list.isEmpty()) {
            return  true ;
        }else{
            return false;
        }

    }

    @Override
    public void mzViolationdetails(PageInfo pageInfo) {
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = generalClinicMappermapper.mzViolationdetails(page, pageInfo.getCondition());
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
        List<Map<String, Object>> list = generalClinicMappermapper.mzwgdepartOrderTable(page, pageInfo.getCondition());
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
        List<Map<String, Object>> list = generalClinicMappermapper.mzwgDoctorOrderTable(page, pageInfo.getCondition());
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
        List<Map<String, Object>> list = generalClinicMappermapper.mzwggzOrderTable(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public void getwholedocumentdetails(PageInfo pageInfo) {
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = generalClinicMappermapper.getwholedocumentdetails(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
        
    }

    @Override
    public void getmzquotaKeyIndexGrid(PageInfo pageInfo) {
        Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
        String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
        page.setOrderByField(orderField);
        page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
        List<Map<String, Object>> list = generalClinicMappermapper.getmzquotaKeyIndexGrid(page, pageInfo.getCondition());
        pageInfo.setRows(list);
        pageInfo.setTotal(page.getTotal());
    }


    
}
