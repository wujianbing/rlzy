/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.RlzyProduct;
import com.jeeplus.modules.portal.mapper.RlzyProductMapper;

/**
 * 产品信息Service
 * @author 喻昆昆
 * @version 2019-12-05
 */
@Service
@Transactional(readOnly = true)
public class RlzyProductService extends CrudService<RlzyProductMapper, RlzyProduct> {

	public RlzyProduct get(String id) {
		return super.get(id);
	}
	
	public List<RlzyProduct> findList(RlzyProduct rlzyProduct) {
		return super.findList(rlzyProduct);
	}
	
	public Page<RlzyProduct> findPage(Page<RlzyProduct> page, RlzyProduct rlzyProduct) {
		return super.findPage(page, rlzyProduct);
	}
	
	@Transactional(readOnly = false)
	public void save(RlzyProduct rlzyProduct) {
		super.save(rlzyProduct);
	}
	
	@Transactional(readOnly = false)
	public void delete(RlzyProduct rlzyProduct) {
		super.delete(rlzyProduct);
	}
	
}