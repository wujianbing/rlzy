/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.mapper;

import org.apache.ibatis.annotations.Param;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.portal.entity.RlzyCompany;

/**
 * 企业信息表MAPPER接口
 * @author 喻昆昆
 * @version 2019-11-15
 */
@MyBatisMapper
public interface RlzyCompanyMapper extends BaseMapper<RlzyCompany> {

	RlzyCompany loginPasswordCompare(RlzyCompany rlzyCompany);

	void updatePayStatus(String companyId, String payStatus);
	
	void updateCheck(@Param("reviewstate") String reviewstate,@Param("check")String check,@Param("id")String id);
}