/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.mapper;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.portal.entity.RlzyResume;
import com.jeeplus.modules.portal.entity.RlzyUser;

/**
 * 个人简历表MAPPER接口
 * @author 喻昆昆
 * @version 2019-11-15
 */
@MyBatisMapper
public interface RlzyResumeMapper extends BaseMapper<RlzyResume> {
	
	int insert(RlzyResume rlzyResume);
	
	int update(RlzyResume rlzyResume);
	
	int delete(String id);
}