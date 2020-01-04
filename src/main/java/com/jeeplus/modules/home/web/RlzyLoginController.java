package com.jeeplus.modules.home.web;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.jeeplus.common.utils.CookieUtils;
import com.jeeplus.modules.home.utils.CommUtils;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyUserService;

@Controller
@RequestMapping("/login")
public class RlzyLoginController {
	@Autowired
	private RlzyUserService rlzyUserService;
	@Autowired
	private RlzyCompanyService rlzyCompanyService;
	/**
	 * 前往登录页
	 * @return
	 */
	@RequestMapping("tologin")
	public String toLogin(){
		return "modules/home/login";
	}
	/**
	 * 密码登录验证密码是否正确
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loginPasswordCompare")
	public String loginPasswordCompare(String user,String password,HttpServletResponse response,HttpServletRequest request,HttpSession session){
		RlzyUser rlzyUser = new RlzyUser();
		rlzyUser.setPassword(password);
		if(CommUtils.isInteger(user)){
			rlzyUser.setPhone(user);
		}else{
			rlzyUser.setName(user);
		}
		RlzyUser userinfo = rlzyUserService.loginPasswordCompare(rlzyUser);
		if(userinfo ==null || userinfo.getId()==null || userinfo.getId()==""){
			RlzyCompany rlzyCompany = new RlzyCompany();
			rlzyCompany.setPassword(password);
			if(CommUtils.isInteger(user)){
				rlzyCompany.setTelephone(user);
			}else{
				rlzyCompany.setCompanyname(user);
			}
			RlzyCompany compayInfo = rlzyCompanyService.loginPasswordCompare(rlzyCompany);
			if(compayInfo ==null || compayInfo.getId()==null || compayInfo.getId()==""){
				return "3";
			}else{
				if("1".equals(compayInfo.getPaystatus())) {
					return compayInfo.getId();
				}else {
					//添加cookie
			        Map<String,String> map=new HashMap<>();
			        map.put("name",compayInfo.getCompanyname());
			        map.put("id", compayInfo.getId());
			        map.put("type", "2");
			        String json= JSON.toJSONString(map); 
					CookieUtils.setCookie(response,"user",json,60*60*24);
					return "2";
				}
			}
		}else{
			//添加cookie
	        Map<String,String> map=new HashMap<>();
	        map.put("name",userinfo.getName());
	        map.put("id", userinfo.getId());
	        map.put("type", "1");
	        String json= JSON.toJSONString(map);    
			CookieUtils.setCookie(response,"user",json,60*60*24);
			return "1";
		}
	}
	
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("quit")
	public String quit(HttpServletResponse response){
		CookieUtils.setCookie(response,"user","",0);
		return "redirect:/home/index";
	}
	
	/**
	 * 验证码登录正确
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="loginCode")
	public String loginCode(String phone,HttpServletResponse response,HttpServletRequest request){
		RlzyUser rlzyUser = new RlzyUser();
		rlzyUser.setPhone(phone);
		List<RlzyUser> userList = rlzyUserService.findList(rlzyUser);
		if(userList.size() > 0) {
			//添加cookie
	        Map<String,String> map=new HashMap<>();
	        map.put("name",userList.get(0).getName());
	        map.put("id", userList.get(0).getId());
	        map.put("type", "1");
	        String json= JSON.toJSONString(map);    
			CookieUtils.setCookie(response,"user",json,24 * 60 * 60 * 30);
			System.out.println(json);
			return "1";
		}else {
			RlzyCompany rlzyCompany = new RlzyCompany();
			rlzyCompany.setTelephone(phone);
			List<RlzyCompany> companyList = rlzyCompanyService.findList(rlzyCompany);
			if(companyList.size() > 0) {
				if("1".equals(companyList.get(0).getPaystatus())) {
					return companyList.get(0).getId();
				}else {
					//添加cookie
			        Map<String,String> map=new HashMap<>();
			        map.put("name",companyList.get(0).getCompanyname());
			        map.put("id", companyList.get(0).getId());
			        map.put("type", "2");
			        String json= JSON.toJSONString(map);
					CookieUtils.setCookie(response,"user",json,24 * 60 * 60 * 30);
					return "2";
				}
			}
		}
		return "3";
	}
}
