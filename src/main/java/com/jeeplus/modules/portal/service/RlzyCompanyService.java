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
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.mapper.RlzyCompanyMapper;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.mapper.RlzyPositionMapper;

/**
 * 企业信息表Service
 * @author 喻昆昆
 * @version 2019-11-15
 */
@Service
@Transactional(readOnly = true)
public class RlzyCompanyService extends CrudService<RlzyCompanyMapper, RlzyCompany> {

	@Autowired
	private RlzyPositionMapper rlzyPositionMapper;
	@Autowired
	private RlzyCompanyMapper rlzyCompanyMapper;
	public RlzyCompany get(String id) {
		RlzyCompany rlzyCompany = super.get(id);
		rlzyCompany.setRlzyPositionList(rlzyPositionMapper.findList(new RlzyPosition(rlzyCompany)));
		return rlzyCompany;
	}
	
	public List<RlzyCompany> findList(RlzyCompany rlzyCompany) {
		return super.findList(rlzyCompany);
	}
	
	public Page<RlzyCompany> findPage(Page<RlzyCompany> page, RlzyCompany rlzyCompany) {
		return super.findPage(page, rlzyCompany);
	}
	
	@Transactional(readOnly = false)
	public void save(RlzyCompany rlzyCompany) {
		super.save(rlzyCompany);
		for (RlzyPosition rlzyPosition : rlzyCompany.getRlzyPositionList()){
			if (rlzyPosition.getId() == null){
				continue;
			}
			if (RlzyPosition.DEL_FLAG_NORMAL.equals(rlzyPosition.getDelFlag())){
				if (StringUtils.isBlank(rlzyPosition.getId())){
					rlzyPosition.preInsert();
					rlzyPositionMapper.insert(rlzyPosition);
				}else{
					rlzyPosition.preUpdate();
					rlzyPositionMapper.update(rlzyPosition);
				}
			}else{
				rlzyPositionMapper.delete(rlzyPosition);
			}
		}
	}
	
	@Transactional(readOnly = false)
	public void delete(RlzyCompany rlzyCompany) {
		super.delete(rlzyCompany);
		rlzyPositionMapper.delete(new RlzyPosition(rlzyCompany));
	}
	
	public RlzyCompany loginPasswordCompare(RlzyCompany rlzyCompany){
		return rlzyCompanyMapper.loginPasswordCompare(rlzyCompany);
	}
	@Transactional(readOnly = false)
	public void updatePayStatus(String companyId, String payStatus) {
		rlzyCompanyMapper.updatePayStatus(companyId,payStatus);
		
	}
	
}