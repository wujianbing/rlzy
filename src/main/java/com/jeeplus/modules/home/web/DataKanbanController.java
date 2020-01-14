package com.jeeplus.modules.home.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.modules.home.utils.MapEntity;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyKanban;
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
		Integer companyCount = kanBanService.findCompanyCount(null);
		Integer userCount = kanBanService.findUserCount(null);
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
		List<RlzyCompany> companyscale = new ArrayList<RlzyCompany>();
		companyscale = kanBanService.findCompanyScale();
		count.put("companyscale", companyscale);
		List<RlzyKanban> salaryrange = new ArrayList<RlzyKanban>();
		salaryrange = kanBanService.findSalaryRanges();
		count.put("salaryRange", salaryrange);
		List<RlzyKanban> industry = new ArrayList<RlzyKanban>();
		industry = kanBanService.findIndustrys();
		count.put("industry", industry);
		Integer positionCount = kanBanService.findPositionCount();
		Integer positionCollect = kanBanService.findPositionCollect();
		Integer deliveryCollect = kanBanService.findDeliveryCollect();
		Integer companyDeal = kanBanService.findCompanyDeal();
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
			if(StringUtils.isNotBlank(company.getLnglat())) {
				String[] lng = company.getLnglat().split("\\,");
				double[] lngs = new double[2];
				lngs[0] = Double.parseDouble(lng[0]);
				lngs[1] = Double.parseDouble(lng[1]);
				String name = company.getCompanyname();
				entity.setLng(lngs);
				entity.setName(name);
				list.add(entity);	
			}
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
			List<RlzyKanban> salarys = new ArrayList<RlzyKanban>();
			salarys = kanBanService.salarys();
			count.put("salarys", salarys);
			List<RlzyKanban> education = kanBanService.findEducation();
			count.put("education", education);
			List<RlzyKanban> workingage = kanBanService.workingAge();
			count.put("workingage", workingage);
			List<RlzyKanban> userage =kanBanService.findAge();
			count.put("userage", userage);
			count.put("male", male);
			count.put("female", female);
			count.put("education", education);
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
