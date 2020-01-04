/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.Link;
import com.jeeplus.modules.portal.mapper.LinkMapper;

/**
 * 友情链接Service
 * @author 李浩
 * @version 2019-06-03
 */
@Service
@Transactional(readOnly = true)
public class LinkService extends CrudService<LinkMapper, Link> {

	public Link get(String id) {
		return super.get(id);
	}
	
	public List<Link> findList(Link link) {
		return super.findList(link);
	}
	
	public Page<Link> findPage(Page<Link> page, Link link) {
		return super.findPage(page, link);
	}
	
	@Transactional(readOnly = false)
	public void save(Link link) {
		super.save(link);
	}
	
	@Transactional(readOnly = false)
	public void delete(Link link) {
		super.delete(link);
	}
	
}