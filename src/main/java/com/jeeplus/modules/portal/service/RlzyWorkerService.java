/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.RlzyWorker;
import com.jeeplus.modules.portal.mapper.RlzyWorkerMapper;

/**
 * 用人信息Service
 * @author 喻昆昆
 * @version 2019-12-23
 */
@Service
@Transactional(readOnly = true)
public class RlzyWorkerService extends CrudService<RlzyWorkerMapper, RlzyWorker> {

	public RlzyWorker get(String id) {
		return super.get(id);
	}
	
	public List<RlzyWorker> findList(RlzyWorker rlzyWorker) {
		return super.findList(rlzyWorker);
	}
	
	public Page<RlzyWorker> findPage(Page<RlzyWorker> page, RlzyWorker rlzyWorker) {
		return super.findPage(page, rlzyWorker);
	}
	
	@Transactional(readOnly = false)
	public void save(RlzyWorker rlzyWorker) {
		super.save(rlzyWorker);
	}
	
	@Transactional(readOnly = false)
	public void delete(RlzyWorker rlzyWorker) {
		super.delete(rlzyWorker);
	}
	
}