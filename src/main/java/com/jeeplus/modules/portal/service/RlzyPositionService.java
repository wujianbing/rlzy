package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.service.CrudService;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.mapper.RlzyPositionMapper;

/**
 * 职位信息表service
 * @author 赵斌
 * @version 2019-11-19
 * 
 * */

@Service
@Transactional(readOnly = true)
public class RlzyPositionService extends CrudService<RlzyPositionMapper, RlzyPosition>{
	
	@Autowired
	RlzyPositionMapper rlzyPositionMapper;

	public Page<RlzyPosition> findPages(Page<RlzyPosition> page, RlzyPosition rlzyPosition) {
		dataRuleFilter(rlzyPosition);
		rlzyPosition.setPage(page);
		List<RlzyPosition> list=rlzyPositionMapper.findNewList(rlzyPosition);
		page.setList(list);
		return page;
	}
	public Page<RlzyPosition> findPositionPages(Page<RlzyPosition> page, RlzyPosition rlzyPosition) {
		dataRuleFilter(rlzyPosition);
		rlzyPosition.setPage(page);
		List<RlzyPosition> list=rlzyPositionMapper.findNewList(rlzyPosition);
		page.setList(list);
		return page;
	}
	
	public List<RlzyPosition> findDescList(RlzyPosition rlzyPosition){
		return rlzyPositionMapper.findDescList(rlzyPosition);
	}
	
	public RlzyPosition getRlzyPosition(RlzyPosition rlzyPosition){
		return rlzyPositionMapper.getRlzyPosition(rlzyPosition);
	}
	
	public int findListCount(RlzyPosition rlzyPosition) {
		return rlzyPositionMapper.findListCount(rlzyPosition);
	}
	
	public int findListCounts(RlzyPosition rlzyPosition) {
		return rlzyPositionMapper.findListCounts(rlzyPosition);
	}
	
	public List<RlzyPosition> findListHome(RlzyPosition rlzyPosition){
		return rlzyPositionMapper.findNewList(rlzyPosition);
	}
	
	public List<RlzyPosition> findDescsList(RlzyPosition rlzyPosition){
		return rlzyPositionMapper.findDescsList(rlzyPosition);
	}
	
	public List<RlzyPosition> findPositionListById(String companyid){
		return rlzyPositionMapper.findPositionListById(companyid);
	}
	
	
}
