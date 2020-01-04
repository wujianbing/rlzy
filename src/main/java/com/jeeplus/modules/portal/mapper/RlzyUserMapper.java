/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.mapper;

import java.util.List;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.portal.entity.RlzyUser;

/**
 * 个人信息表MAPPER接口
 * @author 喻昆昆
 * @version 2019-11-15
 */
@MyBatisMapper
public interface RlzyUserMapper extends BaseMapper<RlzyUser> {
	RlzyUser loginPasswordCompare(RlzyUser rlzyUser);
	
	public int findListCount(RlzyUser rlzyUser );
	
	public int findListCounts(RlzyUser rlzyUser );
	
	public RlzyUser getRlzyUser(RlzyUser rlzyUser );
	
}