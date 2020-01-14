/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.Isystem;
import com.jeeplus.modules.portal.mapper.IsystemMapper;

/**
 * 友情链接Service
 * @author 李浩
 * @version 2019-06-03
 */
@Service
@Transactional(readOnly = true)
public class IsystemService extends CrudService<IsystemMapper, Isystem> {

	
	@Autowired
	private IsystemMapper isystemMapper;

	public Isystem get(String id) {
		return super.get(id);
	}
	
	public Isystem getIsystem(Date date) {
		return isystemMapper.getIsystem(date);
	}
	
	public List<Isystem> findList(Isystem isystem) {
		return super.findList(isystem);
	}
	
	public Page<Isystem> findPage(Page<Isystem> page, Isystem isystem) {
		return super.findPage(page, isystem);
	}	
	@Transactional(readOnly = false)
	public void save(Isystem isystem) {
		super.save(isystem);
	}
}