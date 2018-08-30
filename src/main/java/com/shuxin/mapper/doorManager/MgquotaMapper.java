package com.shuxin.mapper.doorManager;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface MgquotaMapper extends BaseMapper<Mgquota>{

	List<Map<String, Object>> selectmgquotaDataGrid(Page<Mgquota> page,
			Map<String, Object> condition);

	List<Map<String, Object>> mgquotadepartZB(MgquotaVo  mgquotaVo);

	List<Map<String, Object>> mzquotadepartZB(MgquotaVo  mgquotaVo);
	
	List<Map<String, Object>> selectmzquotaDataGrid(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzViolationsDocuments(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mgViolationsDocuments(Page<Mgquota> page,
			Map<String, Object> condition);
	List<Map<String, Object>> mgViolationsDocumentsAll(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mgViolationsDocumentsDepart(Page<Mgquota> page,
			Map<String, Object> condition);
			
	List<Map<String, Object>> mzViolationdetails(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mgViolationdetails(Page<Mgquota> page,
			Map<String, Object> condition);
			
	List<Map<String, Object>> mzwggzOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzwgdepartOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzwgDoctorOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mgwgDoctorOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzwgdjDocuments(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzwgdjDocuments_dapart(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzmgdetails(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> wholemgdetails(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> mzmgdetails_depart(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> wggzOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> getmzpatientDataGrid(Page<Mgquota> page,
			Map<String, Object> condition);
	
	List<Map<String, Object>> wgdepartOrderTable(Page<Mgquota> page,
			Map<String, Object> condition);
	
	String cumulativeMonthly(MgquotaVo  mgquotaVo);
	String cumulativeYear(MgquotaVo  mgquotaVo);
	
	List<Map<String, Object>> analysisIndicators(MgquotaVo  mgquotaVo);

    List<Map<String, Object>> getMzquotaKeyDataGrid(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> selectmzksDataGrid(Page<Mgquota> page, Map<String, Object> condition);
    
    List<Map<String, Object>> selectPatient(MgquotaVo mgquotaVo);

    List<Map<String, Object>> wholeDocument(Page<Mgquota> page, Map<String, Object> condition);

    List<Map<String, Object>> getWholeDocument(String mzlsh);

    List<Map<String, Object>> mzViolationdetailsDoc(Page<Mgquota> page, Map<String, Object> condition);

	String getGzbmByMzlsh(String mzlsh);
	
	List<Map<String, Object>> mgViolationsDocumentsBZ(Page<Mgquota> page,
			Map<String, Object> condition);
	
    
}
