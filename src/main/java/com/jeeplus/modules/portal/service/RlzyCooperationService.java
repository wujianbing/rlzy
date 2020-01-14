/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.RlzyCooperation;
import com.jeeplus.modules.portal.mapper.RlzyCooperationMapper;

/**
 * 合作企业Service
 * @author 喻昆昆
 * @version 2019-12-23
 */
@Service
@Transactional(readOnly = true)
public class RlzyCooperationService extends CrudService<RlzyCooperationMapper, RlzyCooperation> {

	public RlzyCooperation get(String id) {
		return super.get(id);
	}
	
	public List<RlzyCooperation> findList(RlzyCooperation rlzyCooperation) {
		return super.findList(rlzyCooperation);
	}
	
	public Page<RlzyCooperation> findPage(Page<RlzyCooperation> page, RlzyCooperation rlzyCooperation) {
		return super.findPage(page, rlzyCooperation);
	}
	
	@Transactional(readOnly = false)
	public void save(RlzyCooperation rlzyCooperation) {
		super.save(rlzyCooperation);
	}
	
	@Transactional(readOnly = false)
	public void delete(RlzyCooperation rlzyCooperation) {
		super.delete(rlzyCooperation);
	}
	
}