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
	
	//个人收藏职位
	Integer personalCollect(RlzyRelation rlzyRelation);
	//个人投递简历
	Integer personalResume(RlzyRelation rlzyRelation);
	//企业收到简历
	Integer companyResume(RlzyRelation rlzyRelation);
	//企业面试邀请
	Integer companyInvite(RlzyRelation rlzyRelation);
	//个人面试邀请
	Integer personalInvite(RlzyRelation rlzyRelation);
}