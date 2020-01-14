/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.mapper.RlzyRelationMapper;

/**
 * 企业个人信息关联Service
 * @author 喻昆昆
 * @version 2019-11-15
 */
@Service
@Transactional(readOnly = true)
public class RlzyRelationService extends CrudService<RlzyRelationMapper, RlzyRelation> {
	@Autowired
	RlzyRelationMapper rlzyRelationMapper;
	
	public RlzyRelation get(String id) {
		return super.get(id);
	}
	
	public List<RlzyRelation> findList(RlzyRelation rlzyRelation) {
		return super.findList(rlzyRelation);
	}
	
	public Page<RlzyRelation> findPage(Page<RlzyRelation> page, RlzyRelation rlzyRelation) {
		return super.findPage(page, rlzyRelation);
	}
	
	@Transactional(readOnly = false)
	public void save(RlzyRelation rlzyRelation) {
		super.save(rlzyRelation);
	}
	
	@Transactional(readOnly = false)
	public void delete(RlzyRelation rlzyRelation) {
		super.delete(rlzyRelation);
	}
	
	/**
	 * 个人收藏职位
	 * @return
	 */
	public Integer personalCollect(RlzyRelation rlzyRelation){
		return rlzyRelationMapper.personalCollect(rlzyRelation);
	}
	
	/**
	 * 个人邀请面试
	 * @return
	 */
	public Integer personalInvite(RlzyRelation rlzyRelation){
		return rlzyRelationMapper.personalInvite(rlzyRelation);
	}
	
	/**
	 * 个人投递简历
	 * @return
	 */
	public Integer personalResume(RlzyRelation rlzyRelation){
		return rlzyRelationMapper.personalResume(rlzyRelation);
	}
	
	/**
	 * 企业收到简历
	 * @return
	 */
	public Integer companyResume(RlzyRelation rlzyRelation){
		return rlzyRelationMapper.companyResume(rlzyRelation);
	}
	/**
	 * 企业邀请面试
	 * @return
	 */
	public Integer companyInvite(RlzyRelation rlzyRelation){
		return rlzyRelationMapper.companyInvite(rlzyRelation);
	}
}