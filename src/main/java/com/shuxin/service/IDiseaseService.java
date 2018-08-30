package com.shuxin.service;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;
import com.shuxin.commons.utils.PageInfo;
import com.shuxin.model.Disease;
import com.shuxin.model.vo.DiseaseVo;

/**
*
* 病种表数据服务层接口
*
*/
public interface IDiseaseService extends IService<Disease>{
	
	/**
	 * 查询病种信息列表
	 * @param pageInfo
	 */
	public void selectDisease(PageInfo pageInfo);
	
	/**
	 * 查询病种类型
	 * @return
	 */
	public List<Map<String, String>> selectDiseaseType();
	
	/**
	 * 查询病种序列
	 * @return
	 */
	public List<Map<String, String>> selectDiseaseNum();
	
	/**
	 * 查询病种名称
	 * @return
	 */
	public List<Map<String, String>> selectDiseaseName();
	
	/**
	 * 删除病种信息
	 * @param list
	 */
	public void deleteDisease(List<String> list);
	
		
	/**
	 * 查询病种是否存在
	 * @param diseaseVo
	 * @return
	 */
	public int selectExistDisease(DiseaseVo diseaseVo);
	
	/**
	 * 编辑病种信息
	 * @param diseaseVo
	 */
	public void editDisease(DiseaseVo diseaseVo);
	
	/**
	 * 查询需要编辑的信息
	 * @param id
	 * @return
	 */
	public DiseaseVo selectEditDisease(String id);
	
	/**
	 * 查询病种名字和治疗方式
	 * @return
	 */
	public List<Map<String, String>> selectDiseaseWay();

}
