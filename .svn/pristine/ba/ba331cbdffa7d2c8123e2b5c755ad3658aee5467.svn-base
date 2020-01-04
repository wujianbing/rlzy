package com.jeeplus.modules.home.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.modules.home.utils.MapEntity;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.KanBanService;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.utils.DictUtils;

/**
 * 
 * @author zhaobin
 * @date 2019-12-04
 * 
 **/

@Controller
@RequestMapping("/data")
public class DataKanbanController {


	@Autowired
	private RlzyCompanyService rlzycompanyService;

	@Autowired
	private KanBanService kanBanService;

	/**
	 * 公司列表数据接口
	 */
	@RequestMapping("companyList")
	@ResponseBody
	public String companyList() {
		RlzyCompany rlzyCompany = new RlzyCompany();
	/*	Page<RlzyCompany> rlzycompany = new Page<RlzyCompany>();
		Page<RlzyCompany> rlzycompanyLists = rlzycompanyService.findPage(rlzycompany, rlzyCompany);*/
		List<RlzyCompany> companytList = rlzycompanyService.findList(rlzyCompany);
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+companytList.size()+"\",");
		jsonStr.append("\"data\":[");
		if(companytList.size() > 0) {
			for(int i=0;i<companytList.size();i++) {
				if(companytList.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"companyname\":\""+companytList.get(i).getCompanyname()+"\",");
					jsonStr.append("\"address\":\""+companytList.get(i).getAddress()+"\",");
					jsonStr.append("\"registeredcapital\":\""+companytList.get(i).getRegisteredcapital()+"\",");
					jsonStr.append("\"companyscale\":\""+DictUtils.getDictLabel(companytList.get(i).getCompanyscale(), "company_scale","")+"\",");
					jsonStr.append("\"companynature\":\""+DictUtils.getDictLabel(companytList.get(i).getCompanynature(), "company_nature","")+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"companyname\":\""+companytList.get(i).getCompanyname()+"\",");
					jsonStr.append("\"address\":\""+companytList.get(i).getAddress()+"\",");
					jsonStr.append("\"registeredcapital\":\""+companytList.get(i).getRegisteredcapital()+"\",");
					jsonStr.append("\"companyscale\":\""+DictUtils.getDictLabel(companytList.get(i).getCompanyscale(), "company_scale","")+"\",");
					jsonStr.append("\"companynature\":\""+DictUtils.getDictLabel(companytList.get(i).getCompanynature(), "company_nature","")+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}

	/**
	 * 吴忠人力资源看板
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("index")
	public String index(Model model) {
		Integer companyCount = kanBanService.findCompanyCount();
		Integer userCount = kanBanService.findUserCount();
		Integer positionCount = kanBanService.findPositionCount();
		Integer collectCount = kanBanService.findCollectCount();
		model.addAttribute("companyCount", companyCount);
		model.addAttribute("userCount", userCount);
		model.addAttribute("positionCount", positionCount);
		model.addAttribute("collectCount", collectCount);
		return "rlzykb/index";
	}

	/**
	 * 吴忠人力资源看板
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("numCompany")
	public String numCompany(Model model) {
		return "rlzykb/numCompany";
	}

	/**
	 * 吴忠人力资源看板
	 * 
	 * @param model
	 * @return
	 */
	@RequestMapping("numPerson")
	public String numPerson(Model model) {
		return "rlzykb/numPerson";
	}

	/**
	 * 企业行业分布&企业规模数据
	 * 
	 */
	@RequestMapping("/industryCount")
	@ResponseBody
	public Map<String, Object> industryCount() {
		Map<String, Object> count = new HashMap<String, Object>();
		Integer count1 = kanBanService.findIndustryCount();
		Integer count2 = kanBanService.findIndustryCount1();
		Integer count3 = kanBanService.findIndustryCount2();
		Integer count4 = kanBanService.findIndustryCount3();
		Integer count5 = kanBanService.findOtherIndustryCount();
		Integer count6 = kanBanService.findCompanyScaleCount();
		Integer count7 = kanBanService.findCompanyScaleCount1();
		Integer count8 = kanBanService.findCompanyScaleCount2();
		Integer count9 = kanBanService.findCompanyScaleCount3();
		Integer count10 = kanBanService.findCompanyScaleCount4();
		Integer count11 = kanBanService.findSalaryRange();
		Integer count12 = kanBanService.findSalaryRange1();
		Integer count13 = kanBanService.findSalaryRange2();
		Integer count14 = kanBanService.findSalaryRange3();
		Integer count15 = kanBanService.findSalaryRange4();
		Integer count16 = kanBanService.findSalaryRange5();
		Integer positionCount = kanBanService.findPositionCount();
		Integer positionCollect = kanBanService.findPositionCollect();
		Integer deliveryCollect = kanBanService.findDeliveryCollect();
		Integer companyDeal = kanBanService.findCompanyDeal();
		count.put("count1", count1);
		count.put("count2", count2);
		count.put("count3", count3);
		count.put("count4", count4);
		count.put("count5", count5);
		count.put("count6", count6);
		count.put("count7", count7);
		count.put("count8", count8);
		count.put("count9", count9);
		count.put("count10", count10);
		count.put("count11",count11);
		count.put("count12",count12);
		count.put("count13",count13);
		count.put("count14",count14);
		count.put("count15",count15);
		count.put("count16",count16);
		count.put("positionCount",positionCount);
		count.put("positionCollect", positionCollect);
		count.put("deliveryCollect", deliveryCollect);
		count.put("companyDeal", companyDeal);
		return count;
	}
	
	
	/**
	 * 地图
	 * 
	 * */
	@ResponseBody
	@RequestMapping("/mapPoint")
	public List<MapEntity> getPoint() {
		RlzyCompany rlzyCompany = new RlzyCompany();
		List<RlzyCompany> companys = rlzycompanyService.findList(rlzyCompany);
		List<MapEntity> list = new ArrayList<>();
		for (RlzyCompany company : companys) {
			MapEntity entity = new MapEntity();
			String[] lng = company.getLnglat().split("\\,");
			double[] lngs = new double[2];
			lngs[0] = Double.parseDouble(lng[0]);
			lngs[1] = Double.parseDouble(lng[1]);
			String name = company.getCompanyname();
			entity.setLng(lngs);
			entity.setName(name);
			list.add(entity);
		}
		return list;
	}
	
	
	/**
	 * 期望行业
	 * 
	 * */
	@ResponseBody
	@RequestMapping("/desiredPosition")
	public List<RlzyUser> desiredposition() {
		List<RlzyUser> positionList = kanBanService.findDesiredPosition();
		return positionList;
	}
	
	/**
	 * 求职人员期望行业
	 * 
	 * */
	@ResponseBody
	@RequestMapping("/industry")
	public Map<String, String> industry() {
		List<RlzyCompany> industryList = kanBanService.findIndustry();
		Map<String, String> map = new HashMap<>();
		List<DictValue> lists = DictUtils.getDictList("desired_industry");
		for (RlzyCompany company : industryList){
			for(DictValue dictValue:lists){
				String industry = company.getIndustry();
				String value = dictValue.getValue(); 
				if(industry.equals(value)){
					String count = String.valueOf(company.getCount());
					map.put(dictValue.getLabel(),count);
				}
			}
		}
		return map;
	}
		
		@ResponseBody
		@RequestMapping("/position")
		public Map<String, Object> position() {
			Map<String, Object> map = new HashMap<String, Object>();
			List<RlzyPosition> positionList = kanBanService.findPositionList();
			List<DictValue> lists = DictUtils.getDictList("salary");
			for (RlzyPosition position : positionList){
				for(DictValue dictValue:lists){
					String salary = position.getSalaryrange();
					String value = dictValue.getValue(); 
					if(salary.equals(value)){
						String count = String.valueOf(position.getCount());
						map.put(dictValue.getLabel(),count);
					}
				}
			}
			return map;
		}
		
		/**
		 * 人员页面数据接口
		 * */
		@RequestMapping("/userCount")
		@ResponseBody
		public Map<String, Object> userCount() {
			Map<String, Object> count =new HashMap<>();
			Integer male = kanBanService.findMale();
			Integer female = kanBanService.findFemale();
			Integer salary = kanBanService.salary();
			Integer salary1 = kanBanService.salary1();
			Integer salary2 = kanBanService.salary2();
			Integer salary3 = kanBanService.salary3();
			Integer salary4 = kanBanService.salary4();
			Integer salary5 = kanBanService.salary5();
			Integer education = kanBanService.findEducation();
			Integer education1 = kanBanService.findEducation1();
			Integer education2 = kanBanService.findEducation2();
			Integer education3 = kanBanService.findEducation3();
			Integer education4 = kanBanService.findEducation4();
			Integer education5 = kanBanService.findEducation5();
			count.put("male", male);
			count.put("female", female);
			count.put("salary", salary);
			count.put("salary1", salary1);
			count.put("salary2", salary2);
			count.put("salary3", salary3);
			count.put("salary4", salary4);
			count.put("salary5", salary5);
			count.put("education", education);
			count.put("education1", education1);
			count.put("education2", education2);
			count.put("education3", education3);
			count.put("education4", education4);
			count.put("education5", education5);
			return count; 
		}
		
		/**
		 * 人员页面折线图数据接口
		 * 
		 * */
		@RequestMapping("/userCurve")
		@ResponseBody
		public List<Object> userCurve() {
			List<Object> list =new ArrayList<Object>();
			List<RlzyUser> userList = kanBanService.userCountCurve();
			List<RlzyRelation> deliveryCurve = kanBanService.deliveryCurve();
			List<RlzyRelation> companyDealCurve = kanBanService.companyDealCurve();
			list.add(userList);
			list.add(deliveryCurve);
			list.add(companyDealCurve);
			return list;
		}
	
		
		/**
		 * 主页折线图数据接口
		 * 
		 * */
		@RequestMapping("/indexCurve")
		@ResponseBody
		public List<Object> indexCurve() {
			List<Object> list =new ArrayList<Object>();
			List<RlzyUser> userList = kanBanService.userCountCurve();
			List<RlzyCompany> companyList =kanBanService.companyCurve();
			list.add(userList);
			list.add(companyList);
			return list;
		}
		
		/**
		 * 公司页面折线图数据接口
		 * */
		@RequestMapping("/companyCurve")
		@ResponseBody
		public List<Object> companyCurve() {
			List<Object> list =new ArrayList<Object>();
			List<RlzyPosition> positionList = kanBanService.positionCurve();
			List<RlzyRelation> companyDealCurve = kanBanService.companyDealCurve();
			List<RlzyRelation> collectList = kanBanService.collectCurve();
			list.add(positionList);
			list.add(companyDealCurve);
			list.add(collectList);
			return list;
		}
}
