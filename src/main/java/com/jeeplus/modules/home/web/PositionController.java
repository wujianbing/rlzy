package com.jeeplus.modules.home.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jeeplus.common.utils.CookieUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyPositionService;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.utils.DictUtils;

/**
 * Position投递简历控制层
 * 
 * @author 胡林斐
 * @Date 2019-11-21 14:46:34
 */
@Controller
@RequestMapping("/position")
public class PositionController {

	@Autowired
	RlzyUserService rlzyUserService;

	@Autowired
	RlzyCompanyService rlzyCompanyService;

	@Autowired
	RlzyPositionService rlzyPositionService;

	@Autowired
	RlzyRelationService rlzyRelationService;

	/**
	 * 职位展示页面
	 * 
	 * @param model
	 * @param rlzyPosition
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/positionList")
	public String PositionList(HttpServletRequest request,Model model, RlzyUser rlzyUser, RlzyPosition rlzyPosition) {
		String user = CookieUtils.getCookie(request, "user");
		String id="";
		String type="";
		if(StringUtils.isNotBlank(user)) {
			JSONObject object = (JSONObject) JSONObject.parse(user);
			id = object.getString("id");
			type = object.getString("type");
		}
		// 分页显示查询首页10条
		Page<RlzyPosition> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(10);
		// 查询急聘职位
		rlzyPosition.setPostflag("1");
		rlzyPosition.setLine("1");
		Page<RlzyPosition> rlzyPositionListJp = rlzyPositionService.findPages(page, rlzyPosition);
		List<RlzyPosition> positionList = new ArrayList<>();
		for(RlzyPosition postion : rlzyPositionListJp.getList()){
			String wType = postion.getWelfaretype();
			if(StringUtils.isBlank(user)) {
				postion.setStatus("0");
			}
			if(!id.equals(postion.getCompanyid())) {
				postion.setFlag("3");
			}
			if(wType != null){
				String[] arr = StringUtils.split(wType, "\\,");
				StringBuilder builder = new StringBuilder();
				if(arr.length >0){
					for(int i=0;i<arr.length;i++){
						if(i==arr.length-1){
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
						}else{
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							builder.append(" | ");
						}
						
					}
					postion.setWelfaretype(builder.toString());
				}
			}
			positionList.add(postion);
		}
		model.addAttribute("rlzyPositionListJp", positionList);
		model.addAttribute("count", rlzyPositionListJp.getCount());
		// 查询普通职位
		rlzyPosition.setPostflag("0");
		rlzyPosition.setLine("1");
		Page<RlzyPosition> rlzyPositionListPt = rlzyPositionService.findPages(page, rlzyPosition);
		List<RlzyPosition> positionListFast = new ArrayList<>();
		for(RlzyPosition postion : rlzyPositionListPt.getList()){
			String wType = postion.getWelfaretype();
			if(StringUtils.isBlank(user)) {
				postion.setStatus("0");;
			}
			if(!id.equals(postion.getCompanyid())) {
				postion.setFlag("3");
			}
			if(wType != null){
				String[] arr = StringUtils.split(wType, "\\,");
				StringBuilder builder = new StringBuilder();
				if(arr.length >0){
					for(int i=0;i<arr.length;i++){
						if(i==arr.length-1){
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
						}else{
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							builder.append(" | ");
						}
					}
					postion.setWelfaretype(builder.toString());
				}
			}
			positionListFast.add(postion);
		}
		model.addAttribute("rlzyPositionListPt", positionListFast);
		model.addAttribute("count1", rlzyPositionListPt.getCount());
		// 查询急聘职位并按照发布时间降序排列
		List<RlzyPosition> findDescListnew = rlzyPositionService.findDescList(rlzyPosition);
		List<RlzyPosition> findDescList = new ArrayList<>();
		for(RlzyPosition postion : findDescListnew){
			if(StringUtils.isBlank(user)) {
				postion.setStatus("0");
			}
			if(!id.equals(postion.getCompanyid())) {
				postion.setFlag("3");
			}
			findDescList.add(postion);
		}
		model.addAttribute("findDescList", findDescList);
		// 字典查询筛选的条件 下拉框
		List<DictValue> salarys = DictUtils.getDictList("salary");
		List<DictValue> industry = DictUtils.getDictList("desired_industry");
		List<DictValue> scale = DictUtils.getDictList("company_scale");
		List<DictValue> nature = DictUtils.getDictList("work_nature");
		List<DictValue> education = DictUtils.getDictList("education");
		List<DictValue> uTime = DictUtils.getDictList("u_time");
		model.addAttribute("salarys", salarys);
		model.addAttribute("industry", industry);
		model.addAttribute("scale", scale);
		model.addAttribute("nature", nature);
		model.addAttribute("education", education);
		model.addAttribute("uTime", uTime);
		model.addAttribute("type", type);
		return "modules/home/findInfo";
	}

	/**
	 * 根据页码显示职位-急聘
	 * 
	 * @param id
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pageListJp")
	public List<RlzyPosition> pageListJp(HttpServletRequest request,String page, String pageSize) {
		String user = CookieUtils.getCookie(request, "user");
		List<RlzyPosition> list = new ArrayList<RlzyPosition>();
		String id="";
		String type="";
		if(StringUtils.isNotBlank(user)) {
			JSONObject object = (JSONObject) JSONObject.parse(user);
			id = object.getString("id");
			type = object.getString("type");
		}
		RlzyPosition rlzyPosition = new RlzyPosition();
		Page<RlzyPosition> pages = new Page<>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		// 是否急聘  1是
		rlzyPosition.setPostflag("1");
		rlzyPosition.setLine("1");
		Page<RlzyPosition> positionList = rlzyPositionService.findPages(pages, rlzyPosition);
		for (RlzyPosition position : positionList.getList()) {
			position.setSalaryrange(DictUtils.getDictLabel(position.getSalaryrange(), "salary", ""));
			position.setEducation(DictUtils.getDictLabel(position.getEducation(), "education", ""));
			position.setWorkingage(DictUtils.getDictLabel(position.getWorkingage(), "working_age", ""));
			position.setPositiontype(DictUtils.getDictLabel(position.getPositiontype(), "work_nature", ""));
			if(StringUtils.isBlank(user)) {
				position.setStatus("0");
			}
			if(!id.equals(position.getCompanyid())) {
				position.setFlag("3");
			}
			position.setSpe3(type);
			String wType = position.getWelfaretype();
			if(wType != null){
				String[] arr = StringUtils.split(wType, "\\,");
				StringBuilder builder = new StringBuilder();
				if(arr.length >0){
					for(int i=0;i<arr.length;i++){
						if(i==arr.length-1){
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
						}else{
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							builder.append(" | ");
						}
						
					}
					position.setWelfaretype(builder.toString());
				}
			}
			list.add(position);
		}
		return list;
	}
	
	/**
	 * 根据页码显示职位-普通
	 * 
	 * @param id
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pageListPt")
	public List<RlzyPosition> pageListPt(HttpServletRequest request, String page, String pageSize) {
		String user = CookieUtils.getCookie(request, "user");
		List<RlzyPosition> list = new ArrayList<RlzyPosition>();
		String  id="";
		String  type="";
		if(StringUtils.isNotBlank(user)) {
			JSONObject object = (JSONObject) JSONObject.parse(user);
			id = object.getString("id");
			type = object.getString("type");
		}
		RlzyPosition rlzyPosition = new RlzyPosition();
		Page<RlzyPosition> pages = new Page<>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		// 是否急聘  0否
		rlzyPosition.setPostflag("0");
		rlzyPosition.setLine("1");
		Page<RlzyPosition> positionList = rlzyPositionService.findPages(pages, rlzyPosition);
		for (RlzyPosition position : positionList.getList()) {
			position.setSalaryrange(DictUtils.getDictLabel(position.getSalaryrange(), "salary", ""));
			position.setEducation(DictUtils.getDictLabel(position.getEducation(), "education", ""));
			position.setWorkingage(DictUtils.getDictLabel(position.getWorkingage(), "working_age", ""));
			position.setPositiontype(DictUtils.getDictLabel(position.getPositiontype(), "work_nature", ""));
			if(StringUtils.isBlank(user)) {
				position.setStatus("0");
			}
			if(!id.equals(position.getCompanyid())) {
				position.setFlag("3");
			}
			position.setSpe3(type);
			String wType = position.getWelfaretype();
			if(wType != null){
				String[] arr = StringUtils.split(wType, "\\,");
				StringBuilder builder = new StringBuilder();
				if(arr.length >0){
					for(int i=0;i<arr.length;i++){
						if(i==arr.length-1){
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
						}else{
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							builder.append(" | ");
						}
						
					}
					position.setWelfaretype(builder.toString());
				}
			}
			list.add(position);
		}
		return list;
	}

	/**
	 * 职位详情页面
	 * 
	 * @param model
	 * @param id
	 * @param userid
	 * @return
	 */
	@RequestMapping("positionDetails")
	public String PositionDetails(Model model, String id, String userid) {
		RlzyPosition rlzyPositions = rlzyPositionService.get(id);
		RlzyCompany rlzyCompanys = rlzyCompanyService.get(rlzyPositions.getCompanyid());
		if (rlzyPositions != null && rlzyPositions.getWelfaretype() != null && rlzyPositions.getWelfaretype() != "") {
			String[] arr = rlzyPositions.getWelfaretype().split("\\,");
			model.addAttribute("arr", arr);
		}
		model.addAttribute("userid", userid);
		model.addAttribute("rlzyPosition", rlzyPositions);
		model.addAttribute("rlzyCompany", rlzyCompanys);
		return "modules/home/findHuman";
		
	}

	/**
	 * 申请职位
	 * 
	 * @param userid
	 * @param companyid
	 * @param positionid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/applyPosition")
	public String applyPosition(String companyid, String positionid,HttpServletRequest request) {
		String user = CookieUtils.getCookie(request, "user");
		if (StringUtils.isNotBlank(user)) {
			JSONObject jsonObject = JSON.parseObject(user);
			System.out.println(jsonObject.get("id"));
			String userid = (String) jsonObject.get("id");
			RlzyRelation rlzyRelation = new RlzyRelation();
			RlzyPosition rlzyPosition = new RlzyPosition();
			rlzyPosition.setUserid(userid);
			rlzyPosition.setCompanyid(companyid);
			rlzyPosition.setId(positionid);
			RlzyUser rlzyUser = rlzyUserService.get(userid);
			RlzyCompany rlzyCompany = rlzyCompanyService.get(companyid);
			RlzyPosition rlzyPosition1 = rlzyPositionService.get(positionid);
			int count = rlzyPositionService.findListCounts(rlzyPosition);
			if (count == 0) {
				int i = Integer.parseInt(rlzyPosition1.getNum());
				rlzyRelation.setUserid(userid);
				rlzyRelation.setPositionid(positionid);
				rlzyRelation.setCompanyid(companyid);
				// 邀请状态
				rlzyRelation.setInvite("2");
				//接受状态
				rlzyRelation.setAccept("1");
				// 投递状态
				rlzyRelation.setDeliverystate("1");
				rlzyRelation.setUsername(rlzyUser.getName());
				rlzyRelation.setPositionname(rlzyPosition1.getPositionname());
				rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
				rlzyRelation.setWorkingplace(rlzyPosition1.getWorkingplace());
				rlzyRelation.setAge(rlzyUser.getAge());
				rlzyRelation.setSex(rlzyUser.getSex());
				rlzyRelation.setWorkingage(rlzyUser.getWorkingage());
				rlzyRelation.setCurrentstate(rlzyUser.getCurrentstate());
				//真实薪资
				rlzyRelation.setSalary(rlzyPosition1.getSalaryrange());
				i = i + 1;
				rlzyPosition1.setNum(String.valueOf(i));
				rlzyPositionService.save(rlzyPosition1);
				rlzyRelationService.save(rlzyRelation);
				return "1";
			}
			return "2";
		}
		return "success";
	}

	/**
	 * 收藏职位
	 * 
	 * @param userid
	 * @param companyid
	 * @param positionid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/keepPosition")
	public String keepPosition(String companyid, String positionid,HttpServletRequest request, HttpServletResponse response) {
		String user = CookieUtils.getCookie(request, "user");
		if (StringUtils.isNotBlank(user)) {
			JSONObject jsonObject = JSON.parseObject(user);
			System.out.println(jsonObject.get("id"));
			String userid = (String) jsonObject.get("id");
			RlzyRelation rlzyRelation = new RlzyRelation();
			RlzyPosition rlzyPosition = new RlzyPosition();
			rlzyPosition.setUserid(userid);
			rlzyPosition.setCompanyid(companyid);
			rlzyPosition.setId(positionid);
			RlzyUser rlzyUser = rlzyUserService.get(userid);
			RlzyCompany rlzyCompany = rlzyCompanyService.get(companyid);
			RlzyPosition rlzyPosition1 = rlzyPositionService.get(positionid);
			int count = rlzyPositionService.findListCount(rlzyPosition);
			if (count == 0) {
				rlzyRelation.setUserid(userid);
				rlzyRelation.setPositionid(positionid);
				rlzyRelation.setCompanyid(companyid);
				// 邀请状态
				rlzyRelation.setInvite("2");
				//接受状态
				rlzyRelation.setAccept("1");
				//申请状态
				rlzyRelation.setApply("2");
				// 收藏状态
				rlzyRelation.setCollectionstate("1");
				rlzyRelation.setDeliverystate("2");
				rlzyRelation.setUsername(rlzyUser.getName());
				rlzyRelation.setAge(rlzyUser.getAge());
				rlzyRelation.setSex(rlzyUser.getSex());
				rlzyRelation.setWorkingage(rlzyUser.getWorkingage());
				rlzyRelation.setCurrentstate(rlzyUser.getCurrentstate());
				rlzyRelation.setPositionname(rlzyPosition1.getPositionname());
				rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
				rlzyRelation.setWorkingplace(rlzyPosition1.getWorkingplace());
				//准确薪资
				rlzyRelation.setSalary(rlzyPosition1.getSalaryrange());
				rlzyRelationService.save(rlzyRelation);
				return "1";
			}
			return "2";
		}
		return "success";
	}

	/**
	 * 条件查询职位-急聘
	 * 
	 * @param rlzyPosition
	 * @param model
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("positionListBySelectJp")
	public List<RlzyPosition> positionListBySelectJp(@RequestBody RlzyPosition rlzyPosition, Model model,HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "page") String page,@RequestParam(value = "pageSize") String pageSize) {
		String user = CookieUtils.getCookie(request, "user");
		List<RlzyPosition> list = new ArrayList<RlzyPosition>();
		String id="";
		String type="";
		if(StringUtils.isNotBlank(user)) {
			JSONObject jsonObject = JSON.parseObject(user);
			id = (String) jsonObject.get("id");
			type = (String) jsonObject.get("type");
		}
		Page<RlzyPosition> pages = new Page<RlzyPosition>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		// 是否急聘  1是
		rlzyPosition.setPostflag("1");
		rlzyPosition.setLine("1");
		Page<RlzyPosition> List = rlzyPositionService.findPositionPages(pages, rlzyPosition);
		for (RlzyPosition position : List.getList()) {
			position.setSpe3(String.valueOf(List.getCount()));
			position.setSalaryrange(DictUtils.getDictLabel(position.getSalaryrange(), "salary", ""));
			position.setIndustry(DictUtils.getDictLabel(position.getIndustry(), "desired_industry", ""));
			position.setCompanyscale(DictUtils.getDictLabel(position.getCompanyscale(), "company_scale", ""));
			position.setPositiontype(DictUtils.getDictLabel(position.getPositiontype(), "work_nature", ""));
			position.setEducation(DictUtils.getDictLabel(position.getEducation(), "education", ""));
			position.setWorkingage(DictUtils.getDictLabel(position.getWorkingage(), "working_age", ""));
			if(StringUtils.isBlank(user)) {
				position.setStatus("0");
			}
			if(!id.equals(position.getCompanyid())) {
				position.setFlag("3");
			}
			position.setSpe3(type);
			String wType = position.getWelfaretype();
			if(wType != null){
				String[] arr = StringUtils.split(wType, "\\,");
				StringBuilder builder = new StringBuilder();
				if(arr.length >0){
					for(int i=0;i<arr.length;i++){
						if(i==arr.length-1){
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
						}else{
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							builder.append(" | ");
						}
						
					}
					position.setWelfaretype(builder.toString());
				}
			}
			list.add(position);
		}
		return list;
	}
	
	/**
	 * 条件查询职位-普通
	 * 
	 * @param rlzyPosition
	 * @param model
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("positionListBySelectPt")
	public List<RlzyPosition> positionListBySelectPt(@RequestBody RlzyPosition rlzyPosition, Model model,HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "page") String page,@RequestParam(value = "pageSize") String pageSize) {
		String user = CookieUtils.getCookie(request, "user");
		List<RlzyPosition> list = new ArrayList<RlzyPosition>();
		String type="";
		String id="";
		if(StringUtils.isNotBlank(user)) {
			JSONObject jsonObject = JSON.parseObject(user);
			id = (String) jsonObject.get("id");
			type = (String) jsonObject.get("type");
		}
		Page<RlzyPosition> pages = new Page<RlzyPosition>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		// 是否急聘  0否
		rlzyPosition.setPostflag("0");
		rlzyPosition.setLine("1");
		Page<RlzyPosition> List = rlzyPositionService.findPositionPages(pages, rlzyPosition);
		for (RlzyPosition position : List.getList()) {
			position.setSpe3(String.valueOf(List.getCount()));
			position.setSalaryrange(DictUtils.getDictLabel(position.getSalaryrange(), "salary", ""));
			position.setIndustry(DictUtils.getDictLabel(position.getIndustry(), "desired_industry", ""));
			position.setCompanyscale(DictUtils.getDictLabel(position.getCompanyscale(), "company_scale", ""));
			position.setPositiontype(DictUtils.getDictLabel(position.getPositiontype(), "work_nature", ""));
			position.setEducation(DictUtils.getDictLabel(position.getEducation(), "education", ""));
			position.setWorkingage(DictUtils.getDictLabel(position.getWorkingage(), "working_age", ""));
			if(StringUtils.isBlank(user)) {
				position.setStatus("0");
			}
			if(!id.equals(position.getCompanyid())) {
				position.setFlag("3");
			}
			position.setSpe3(type);
			String wType = position.getWelfaretype();
			if(wType != null){
				String[] arr = StringUtils.split(wType, "\\,");
				StringBuilder builder = new StringBuilder();
				if(arr.length >0){
					for(int i=0;i<arr.length;i++){
						if(i==arr.length-1){
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
						}else{
							builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							builder.append(" | ");
						}
						
					}
					position.setWelfaretype(builder.toString());
				}
			}
			list.add(position);
		}
		return list;
	}
}
