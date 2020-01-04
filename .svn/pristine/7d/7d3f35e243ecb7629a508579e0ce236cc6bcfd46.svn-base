package com.jeeplus.modules.portal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.RlzyResume;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.mapper.RlzyResumeMapper;

/**
 * 
 * 
 * @author 胡林斐
 * @Date 2019-11-16 16:47:24    
 */
@Service
public class RlzyResumeService extends CrudService<RlzyResumeMapper, RlzyResume> {
	
	public RlzyResume get(String id) {
		RlzyResume rlzyResume = super.get(id);
		return rlzyResume;
	}
	
	@Transactional(readOnly = false)
	public void delete(RlzyResume rlzyResume) {
		super.delete(rlzyResume);
	}
}
