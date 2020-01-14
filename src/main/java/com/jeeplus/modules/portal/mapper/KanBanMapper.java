package com.jeeplus.modules.portal.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jeeplus.core.persistence.annotation.MyBatisMapper;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyKanban;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;

@MyBatisMapper
public interface KanBanMapper {

	Integer findCompanyCount(@Param(value="createDate") String createDate);

	Integer findUserCount(@Param(value="createDate") String createDate);

	Integer findPositionCount();

	Integer findCollectCount();

	// 查询企业行业分布数量
	List<RlzyUser> findDesiredPosition();

	List<RlzyCompany> findIndustry();

	List<RlzyPosition> findPositionList();

	Integer findPositionCollect();

	Integer findDeliveryCollect();

	Integer findCompanyDeal();

	Integer findFemale();

	Integer findMale();

	List<RlzyUser> userCountCurve();

	List<RlzyRelation> deliveryCurve();

	List<RlzyRelation> companyDealCurve();

	List<RlzyCompany> companyCurve();

	List<RlzyPosition> positionCurve();

	List<RlzyRelation> resumeCurve();

	List<RlzyRelation> collectCurve();

	List<RlzyCompany> findCompanyScale();

	List<RlzyKanban> findSalaryRanges();

	List<RlzyKanban> findIndustrys();

	List<RlzyKanban> findSalarys();

	List<RlzyKanban> findEducations();

	List<RlzyKanban> findWorkingAge();

	List<RlzyKanban> findAge();
}
