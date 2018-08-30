package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface IMgquotaService extends IService<Mgquota> {

 public	void selectmgquotaDataGrid(PageInfo pageInfo);

 public List<Map<String, Object>> mgquotadepartZB(MgquotaVo  mgquotaVo);
 
 public List<Map<String, Object>> mzquotadepartZB(MgquotaVo  mgquotaVo);
 
 public	void selectmzquotaDataGrid(PageInfo pageInfo);
 
 public	void mzViolationsDocuments(PageInfo pageInfo);
 
 public	void mgViolationsDocuments(PageInfo pageInfo);
 
 public	void mgViolationsDocumentsDepart(PageInfo pageInfo);
 
 public	void mzViolationdetails(PageInfo pageInfo);
 
 public	void mgViolationdetails(PageInfo pageInfo);
 
 public	void mzwggzOrderTable(PageInfo pageInfo);
 
 public	void mzwgdepartOrderTable(PageInfo pageInfo);
 
 public	void mzwgDoctorOrderTable(PageInfo pageInfo);
 
 public	void mgwgDoctorOrderTable(PageInfo pageInfo);
 
 public	void mzwgdjDocuments(PageInfo pageInfo);
 
 public	void mzwgdjDocuments_dapart(PageInfo pageInfo);
 
 public	void mzmgdetails(PageInfo pageInfo);
 
 public	void wholemgdetails(PageInfo pageInfo);
 
 public	void mzmgdetails_depart(PageInfo pageInfo);
 
 public	void getmzpatientDataGrid(PageInfo pageInfo);
 
 public	void wggzOrderTable(PageInfo pageInfo);
 
 public	void wgdepartOrderTable(PageInfo pageInfo);

 public String cumulativeMonthly(MgquotaVo  mgquotaVo);
 
 public String cumulativeYear(MgquotaVo  mgquotaVo);
 
 public Map<String, Object> analysisIndicators(MgquotaVo  mgquotaVo);

 public void getMzquotaKeyDataGrid(PageInfo pageInfo);
 
 public PageInfo queryConditions(MgquotaVo  mgquotaVo, Integer page, Integer rows, String sort, String orde);

public List<Map<String, Object>> selectPatient(MgquotaVo mgquotaVo);

public void selectmzKeyDataGrid(PageInfo pageInfo);

public String getGzbmByMzlsh(String mzlsh);

public void wholeDocument(PageInfo pageInfo);

public boolean getWholeDocument(String mzlsh);

public void mzViolationdetailsDoc(PageInfo pageInfo);

public void mgViolationsDocumentsBZ(PageInfo pageInfo);

}
