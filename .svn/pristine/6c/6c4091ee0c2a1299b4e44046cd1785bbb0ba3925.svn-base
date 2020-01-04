/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.service.TreeService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.sys.entity.SysPostion;
import com.jeeplus.modules.sys.mapper.SysPostionMapper;

/**
 * 职业类型Service
 * @author yukk
 * @version 2019-11-13
 */
@Service
@Transactional(readOnly = true)
public class SysPostionService extends TreeService<SysPostionMapper, SysPostion> {

	public SysPostion get(String id) {
		return super.get(id);
	}
	
	public List<SysPostion> findList(SysPostion sysPostion) {
		if (StringUtils.isNotBlank(sysPostion.getParentIds())){
			sysPostion.setParentIds(","+sysPostion.getParentIds()+",");
		}
		return super.findList(sysPostion);
	}
	
	@Transactional(readOnly = false)
	public void save(SysPostion sysPostion) {
		super.save(sysPostion);
	}
	
	@Transactional(readOnly = false)
	public void delete(SysPostion sysPostion) {
		super.delete(sysPostion);
	}
	
}