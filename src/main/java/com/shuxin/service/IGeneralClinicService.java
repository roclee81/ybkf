package com.shuxin.service;

import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Mgquota;
import com.shuxin.model.vo.MgquotaVo;

public interface IGeneralClinicService extends IService<Mgquota> {
    
    List<Map<String, Object>> mzquotadepartZB(MgquotaVo mgquotaVo);

    void selectmzquotaDataGrid(PageInfo pageInfo);

    void mzViolationsDocuments(PageInfo pageInfo);

    void wholeDocument(PageInfo pageInfo);

    boolean getWholeDocument(String mzlsh);

    void mzViolationdetails(PageInfo pageInfo);

    void mzwgdepartOrderTable(PageInfo pageInfo);

    void mzwgDoctorOrderTable(PageInfo pageInfo);

    void mzwggzOrderTable(PageInfo pageInfo);

    void getwholedocumentdetails(PageInfo pageInfo);

    void getmzquotaKeyIndexGrid(PageInfo pageInfo);


}
