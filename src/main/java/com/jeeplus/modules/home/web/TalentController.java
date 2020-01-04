package com.jeeplus.modules.home.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
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
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyResume;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyPositionService;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.utils.DictUtils;


	/**
	 * 	@author 赵斌
	 * 	@date 2019-11-22
	 * 
	 * */

@Controller
@RequestMapping("/talent")
public class TalentController {
	
	@Autowired
	private RlzyUserService rlzyUserService;
	@Autowired
	private RlzyRelationService rlzyRelationService;
	@Autowired
	private RlzyCompanyService rlzyCompanyService;
	@Autowired
	private RlzyPositionService rlzyPositionService;
	
	/**
	 * 初次点击进入招人列表
	 * @param news
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("talentList")
	public String talentList(RlzyUser rlzyUser,Model model,HttpServletRequest request,HttpServletResponse response){
		//查询首页显示10条
		rlzyUser =new RlzyUser();
		Page<RlzyUser> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(10);
		//没有登陆用户
		Page<RlzyUser> talentList = rlzyUserService.findPage(page, rlzyUser);
		List<DictValue> salarys = DictUtils.getDictList("salary");
		List<DictValue> industry = DictUtils.getDictList("desired_industry");
		List<DictValue> major =DictUtils.getDictList("major");
		List<DictValue> sex = DictUtils.getDictList("sex");
		List<DictValue> worknature =DictUtils.getDictList("work_nature");
		List<DictValue> education =DictUtils.getDictList("education");
		List<DictValue> workingage =DictUtils.getDictList("working_age");
		List<DictValue> updatetime =DictUtils.getDictList("u_time");
		String user = CookieUtils.getCookie(request, "user");
		if(StringUtils.isNotBlank(user)) {
			JSONObject jsonObject = JSON.parseObject(user);
			String companyid = (String) jsonObject.get("id");
			model.addAttribute("companyid",companyid );
		}else {
			return "redirect:/login/tologin";
		}
		model.addAttribute("sex",sex );
		model.addAttribute("worknature",worknature );
		model.addAttribute("education",education );
		model.addAttribute("workingage",workingage );
		model.addAttribute("updatetime",updatetime );
		model.addAttribute("major", major);
		model.addAttribute("salarys", salarys);
		model.addAttribute("industry",industry);
		model.addAttribute("talentList", talentList.getList());
		model.addAttribute("count",talentList.getCount());
		return "modules/home/talentList";
	}
	
	/**
	 * 简历详情页面
	 * @param model
	 * @param rlzyUser
	 * @return
	 */
	@RequestMapping("talentDetails")
	public String TalentDetails(String companyid,Model model,@RequestParam String id,RlzyResume rlzyResume, RlzyUser rlzyUser) {
		rlzyUser = rlzyUserService.get(id);
		model.addAttribute("companyid",companyid);
		model.addAttribute("rlzyUser", rlzyUser);
		return "modules/home/talentDetail";
	}
	
	/**
	 * 职位确认页面
	 * @param model
	 * @param rlzyPosition
	 * @return
	 */
	@RequestMapping("confirm")
	public String confirm(String companyid,Model model,@RequestParam String id,RlzyResume rlzyResume, RlzyUser rlzyUser) {
		List<RlzyPosition> rlzyPosition =rlzyPositionService.findPositionListById(companyid);
		model.addAttribute("rlzyPosition", rlzyPosition);
		model.addAttribute("userid",id);
		model.addAttribute("companyid",companyid);
		return "modules/home/company/confirm";
	}
	
	/**
	 * 收藏人才
	 * @param userid
	 * @param companyid
	 * @return 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("keepUser")
	public String keepUser(String userid,HttpServletRequest request) {
		String user = CookieUtils.getCookie(request, "user");
		if (!user.equals("")) {
			JSONObject jsonObject = JSON.parseObject(user);
			System.out.println(jsonObject.get("id"));
			String companyid = (String) jsonObject.get("id");
			RlzyRelation rlzyRelation = new RlzyRelation();
			RlzyUser rlzyUser= new RlzyUser();
			rlzyUser.setUserid(userid);
			rlzyUser.setCompanyid(companyid);
			int count = rlzyUserService.findListCount(rlzyUser);
			if(count == 0){
				rlzyRelation.setUserid(userid);
				rlzyRelation.setCompanyid(companyid);
				rlzyRelation.setCompanycollectstate("1");
				rlzyRelation.setInvite("2");
				rlzyRelation.setAccept("1");
				rlzyRelation.setCompanydealstate("1");
				RlzyUser users =rlzyUserService.get(userid);
				RlzyCompany rlzyCompany = rlzyCompanyService.get(companyid);
				rlzyRelation.setUsername(users.getName());
				rlzyRelation.setAge(users.getAge());
				rlzyRelation.setSex(users.getSex());
				rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
				rlzyRelation.setWorkingage(users.getWorkingage());
				rlzyRelation.setWorkingplace(rlzyCompany.getAddress());
				rlzyRelation.setDesiredposition(users.getDesiredposition());
				rlzyRelation.setCurrentstate(users.getCurrentstate());
				//期望薪资
				rlzyRelation.setDesiredsalary(users.getSalary());
				rlzyRelationService.save(rlzyRelation);
				return "1";
			}else {
				return "2";
			}
		}
		return "2";
	}
	
	
	/**
	 * 邀请面试
	 * @param userid
	 * @param companyid
	 * @return
	 */
	@ResponseBody
	@RequestMapping("inviteUser")
	public String inviteUser(String userid,HttpServletRequest request,String id,String txt) {
		String user = CookieUtils.getCookie(request, "user");
		if (!user.equals("")) {
			JSONObject jsonObject = JSON.parseObject(user);
			System.out.println(jsonObject.get("id"));
			String companyid = (String) jsonObject.get("id");
			RlzyRelation rlzyRelation = new RlzyRelation();
			RlzyUser rlzyUser= new RlzyUser();
			rlzyUser.setUserid(userid);
			rlzyUser.setCompanyid(companyid);
			int count = rlzyUserService.findListCounts(rlzyUser);
			if(count == 0){
				rlzyRelation.setUserid(userid);
				rlzyRelation.setCompanyid(companyid);
				rlzyRelation.setInvite("1");
				rlzyRelation.setAccept("1");
				rlzyRelation.setCompanydealstate("1");
				rlzyRelation.setPositionid(id);
				rlzyRelation.setPositionname(txt);
			    rlzyUser = rlzyUserService.get(userid);
				rlzyRelation.setUsername(rlzyUser.getName());
				rlzyRelation.setAge(rlzyUser.getAge());
				rlzyRelation.setSex(rlzyUser.getSex());
				RlzyCompany rlzyCompany = rlzyCompanyService.get(companyid);
				rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
				rlzyRelation.setWorkingplace(rlzyCompany.getAddress());
				rlzyRelation.setWorkingage(rlzyUser.getWorkingage());
				rlzyRelation.setDesiredposition(rlzyUser.getDesiredposition());
				rlzyRelation.setSalary(rlzyPositionService.get(id).getSalaryrange());
				//准确薪资
				//rlzyRelation.setDesiredsalary(rlzyUser.getSalary());
				rlzyRelation.setCurrentstate(rlzyUser.getCurrentstate());
				rlzyRelationService.save(rlzyRelation);
				return "1";
			}
				return "2";
		}
		return "2";
	}
	/**
	 * 条件查询简历
	 * @param rlzyUser
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("talentListBySelect")
	@ResponseBody
	public List<RlzyUser> talentListBySelect(@RequestBody RlzyUser rlzyUser,Model model,HttpServletRequest request,HttpServletResponse response,@RequestParam(value="page")String page,@RequestParam(value="pageSize")String pageSize){
		//查询首页显示10条
		Page<RlzyUser> pages = new Page<RlzyUser>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		Page<RlzyUser> List = rlzyUserService.findPage(pages,rlzyUser);
		List<RlzyUser> list = new ArrayList<RlzyUser>();
		for(RlzyUser user : List.getList()){
			user.setSpe3(String.valueOf(List.getCount()));
			user.setDesiredindustry(DictUtils.getDictLabel(user.getDesiredindustry(),"desired_industry",""));
			user.setDesiredposition(DictUtils.getDictLabel(user.getDesiredposition(),"desired_position",""));
			user.setEducation(DictUtils.getDictLabel(user.getEducation(),"education",""));
			user.setWorkingage(DictUtils.getDictLabel(user.getWorkingage(),"working_age",""));
			user.setCurrentstate(DictUtils.getDictLabel(user.getCurrentstate(),"current_state",""));
			user.setWorknature(DictUtils.getDictLabel(user.getWorknature(),"work_nature",""));
			user.setMajor(DictUtils.getDictLabel(user.getMajor(),"major",""));
			user.setSex(DictUtils.getDictLabel(user.getSex(),"sex",""));
			user.setSalary(DictUtils.getDictLabel( user.getSalary(),"salary", ""));
			list.add(user);
		}
		return list;
	}
}
