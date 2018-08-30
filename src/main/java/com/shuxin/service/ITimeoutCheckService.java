package com.shuxin.service;

import java.io.IOException;
import java.sql.SQLException;

import com.shuxin.commons.utils.PageInfo;

public interface ITimeoutCheckService {

	void getTimeoutCheck(PageInfo pageInfo,String sfzhm,String hzxm)throws IOException, SQLException ,Exception;

	void checkDatas(String jzlshs) throws IOException, SQLException;

	void getTimeoutHasCheckedDataGrid(PageInfo pageInfo);

	void getTimeoutDetailsDataGrid(PageInfo pageInfo, String jzlsh);

}
