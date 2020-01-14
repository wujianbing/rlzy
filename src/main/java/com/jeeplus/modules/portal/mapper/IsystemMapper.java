/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.mapper;

import java.util.Date;

import com.jeeplus.core.persistence.BaseMapper;
import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.portal.entity.Isystem;

/**
 * 友情链接MAPPER接口
 * @author 李浩
 * @version 2019-06-03
 */
@MyBatisMapper
public interface IsystemMapper extends BaseMapper<Isystem> {
	
	Isystem getIsystem(Date date);
}