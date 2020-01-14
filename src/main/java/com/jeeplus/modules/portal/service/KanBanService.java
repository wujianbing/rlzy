package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyKanban;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.mapper.KanBanMapper;

@Service
@Transactional(readOnly = true)
public class KanBanService {
	
	@Autowired
	private KanBanMapper kanBanMapper;

	public Integer findCompanyCount(String createDate) {
		return kanBanMapper.findCompanyCount(createDate);
	}
	
	public Integer findUserCount(String createDate) {
		return kanBanMapper.findUserCount(createDate);
	}
	
	public Integer findPositionCount() {
		return kanBanMapper.findPositionCount();
	}
	
	public Integer findCollectCount() {
		return kanBanMapper.findCollectCount();
	}
	
	public List<RlzyUser> findDesiredPosition(){
		return kanBanMapper.findDesiredPosition();
	}
	
	public List<RlzyCompany> findIndustry(){
		return kanBanMapper.findIndustry();
	}
	
	public List<RlzyPosition> findPositionList(){
		return kanBanMapper.findPositionList();
	}
	
	public Integer findPositionCollect(){
		return kanBanMapper.findPositionCollect();
	}
	public Integer findDeliveryCollect(){
		return kanBanMapper.findDeliveryCollect();
	}
	public Integer findCompanyDeal(){
		return kanBanMapper.findCompanyDeal();
	}
	public Integer findMale(){
		return kanBanMapper.findMale();
	}
	public Integer findFemale(){
		return kanBanMapper.findFemale();
	}
	
	public List<RlzyKanban> findEducation() {
		return kanBanMapper.findEducations();
	}
	
	public List<RlzyUser> userCountCurve(){
		return kanBanMapper.userCountCurve();
	}
	
	public List<RlzyRelation> deliveryCurve(){
		return kanBanMapper.deliveryCurve();
	}
	
	public List<RlzyRelation> companyDealCurve(){
		return kanBanMapper.companyDealCurve();
	}
	
	public List<RlzyCompany> companyCurve(){
		return kanBanMapper.companyCurve();
	}
	
	public List<RlzyPosition> positionCurve(){
		return kanBanMapper.positionCurve();
	}
	public List<RlzyRelation> resumeCurve(){
		return kanBanMapper.resumeCurve();
	}
	public List<RlzyRelation> collectCurve(){
		return kanBanMapper.collectCurve();
	}

	public List<RlzyCompany> findCompanyScale() {
		return kanBanMapper.findCompanyScale();
	}

	public List<RlzyKanban> findSalaryRanges() {
		return kanBanMapper.findSalaryRanges();
	}

	public List<RlzyKanban> findIndustrys() {
		return kanBanMapper.findIndustrys();
	}

	public List<RlzyKanban> salarys() {
		return kanBanMapper.findSalarys();
	}
	
	public List<RlzyKanban> workingAge() {
		return kanBanMapper.findWorkingAge();
	}
	
	public List<RlzyKanban> findAge() {
		return kanBanMapper.findAge();
	}
}
