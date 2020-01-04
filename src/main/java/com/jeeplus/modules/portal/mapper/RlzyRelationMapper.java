/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.mapper;

import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.portal.entity.RlzyRelation;

/**
 * 企业个人信息关联MAPPER接口
 * @author 喻昆昆
 * @version 2019-11-15
 */
@MyBatisMapper
public interface RlzyRelationMapper extends BaseMapper<RlzyRelation> {
	//面试邀请-
	List<RlzyRelation> deliverList(RlzyRelation rlzyRelation);
	//收藏列表
	List<RlzyRelation> collectList(RlzyRelation rlzyRelation);
	
	//企业查询收到的简历
	List<RlzyRelation> companyList(RlzyRelation rlzyRelation);
	
	//企业查询收藏的候选人
	List<RlzyRelation> companyCollectList(RlzyRelation rlzyRelation);
	
	//求职列表
	List<RlzyRelation> applyList(RlzyRelation rlzyRelation);
}