package com.shuxin.service.impl.doorManager;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.mapper.doorManager.HospitalizedMonitorMapper;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;
import com.shuxin.service.doorManager.IHospitalizedMonitorService;

@Service
public class HospitalizedMonitorService extends ServiceImpl<HospitalizedMonitorMapper, Mgquota> implements IHospitalizedMonitorService{
    
        @Autowired
        private HospitalizedMonitorMapper hospitalizedMonitorMapper ;

        @Override
        public List<Map<String, Object>> getExampleNumber(MgquotaVo mVo) {
            
            return hospitalizedMonitorMapper.getExampleNumber(mVo);
        }

        @Override
        public void getInhospatientGrid(PageInfo pageInfo) {
            Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
            String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
            page.setOrderByField(orderField);
            page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
            List<Map<String, Object>> list = hospitalizedMonitorMapper.getInhospatientGrid(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal()); 
        }

        @Override
        public List<Map<String, Object>> getDiagnosisInfo(String zylsh) {
            // TODO Auto-generated method stub
            return hospitalizedMonitorMapper.getDiagnosisInfo(zylsh);
        }

        @Override
        public List<Map<String, Object>> getCostWarning(String zylsh) {
            // TODO Auto-generated method stub
            return hospitalizedMonitorMapper.getCostWarning(zylsh);
        }

        @Override
        public void getAuditViolations(PageInfo pageInfo) {
            Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
            String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
            page.setOrderByField(orderField);
            page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
            List<Map<String, Object>> list = hospitalizedMonitorMapper.getAuditViolations(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal()); 
        }

        @Override
        public void getDischargedMedicine(PageInfo pageInfo) {
            // TODO Auto-generated method stub
            Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
            String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
            page.setOrderByField(orderField);
            page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
            List<Map<String, Object>> list = hospitalizedMonitorMapper.getAuditViolations(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal()); 
        }

        @Override
        public void getOrderDetails(PageInfo pageInfo) {
            // TODO Auto-generated method stub
            Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
            List<Map<String, Object>> list = hospitalizedMonitorMapper.getOrderDetails(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal()); 
        }

        @Override
        public void getChargeDetails(PageInfo pageInfo) {
            // TODO Auto-generated method stub
            Page<Mgquota> page = new Page<Mgquota>(pageInfo.getNowpage(), pageInfo.getSize());
            String orderField = com.baomidou.mybatisplus.toolkit.StringUtils.camelToUnderline(pageInfo.getSort());
            page.setOrderByField(orderField);
            page.setAsc(pageInfo.getOrder().equalsIgnoreCase("asc"));
            List<Map<String, Object>> list = hospitalizedMonitorMapper.getChargeDetails(page, pageInfo.getCondition());
            pageInfo.setRows(list);
            pageInfo.setTotal(page.getTotal()); 
        }
        

}
