package com.jeeplus.modules.api;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.jeeplus.common.utils.CookieUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.home.utils.CommUtils;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyUserService;


@Controller
@RequestMapping("/api")
public class ApiLoginController extends BaseController{
	  
	@Autowired
	private RlzyUserService rlzyUserService;
	@Autowired
	private RlzyCompanyService rlzyCompanyService;
	@Autowired
	private RlzyRelationService rlzyRelationService;
	  /**
	   * 登录
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping("/login")
	  public ReturnJson login(HttpServletRequest request, HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		  ReturnJson returnJson =new ReturnJson();
	      Map<String,Object> map=new HashMap<>();
	      Map<String, String> usermap=new HashMap<String, String>();
		  String user= loginmap.get("user");
		  String password= loginmap.get("password");
		  RlzyUser rlzyUser = new RlzyUser();
			rlzyUser.setPassword(password);
			if(CommUtils.isInteger(user)){
				rlzyUser.setPhone(user);
			}else{
				rlzyUser.setName(user);
			}
			RlzyUser userinfo = rlzyUserService.loginPasswordCompare(rlzyUser);
	        String token="";
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
					returnJson.setMessage("账户或密码错误!");
			        returnJson.setStatus(false);
				}else{
					if("1".equals(compayInfo.getPaystatus())) {
						returnJson.setMessage("用户未支付!");
				        returnJson.setStatus(false);
					}else {
				        token=TokenSign.getToken(compayInfo.getCompanyname(), compayInfo.getId());
				        usermap.put("name",compayInfo.getCompanyname());
				        usermap.put("nickName", compayInfo.getNickName());
				        usermap.put("id",compayInfo.getId());
				        usermap.put("type",compayInfo.getCpflag());
				        usermap.put("pic",compayInfo.getLogo());
				        usermap.put("telphone",compayInfo.getTelephone());
				        usermap.put("accessToken",token);
				        RlzyRelation rlzyRelation = new RlzyRelation();
				        rlzyRelation.setCompanyid(compayInfo.getId());
				    	rlzyRelation.setCollectionstate("1");
				    	int resumenum = rlzyRelationService.companyResume(rlzyRelation);
				    	RlzyRelation rlzyRelationResume = new RlzyRelation();
				    	rlzyRelationResume.setCompanyid(compayInfo.getId());
				    	rlzyRelationResume.setDeliverystate("1");
				    	int invitenum = rlzyRelationService.companyInvite(rlzyRelationResume);
				    	usermap.put("resumenum",String.valueOf(resumenum));
				    	usermap.put("invitenum",String.valueOf(invitenum));
				        map.put("user",usermap);
						returnJson.setMessage("登录成功!");
				        returnJson.setResult(map);
				        returnJson.setStatus(true);
					}
				}
			}else{
		        token=TokenSign.getToken(userinfo.getName(), userinfo.getId());
		        usermap.put("name",userinfo.getName());
		        usermap.put("nickName", userinfo.getNickName());
		        usermap.put("id",userinfo.getId());
		        usermap.put("phone",userinfo.getPhone());
		        usermap.put("type",userinfo.getCpflag());
		        usermap.put("pic",userinfo.getPhoto());
		        usermap.put("accessToken",token);
		        map.put("user",usermap);
				//String accessToken=request.getHeader("accessToken");
				//String id=TokenSign.getUserId(accessToken);
		        RlzyRelation rlzyRelation = new RlzyRelation();
		        rlzyRelation.setUserid(userinfo.getId());
		    	rlzyRelation.setCollectionstate("1");
		    	int collectnum = rlzyRelationService.personalCollect(rlzyRelation);
		    	RlzyRelation rlzyRelationResume = new RlzyRelation();
		    	rlzyRelationResume.setUserid(userinfo.getId());
		    	rlzyRelationResume.setDeliverystate("1");
		    	int resumenum = rlzyRelationService.personalResume(rlzyRelationResume);
		    	RlzyRelation rlzyRelationInvite = new RlzyRelation();
		    	rlzyRelationInvite.setUserid(userinfo.getId());
		    	rlzyRelationInvite.setCompanydealstate("1");
		    	rlzyRelationInvite.setInvite("1");
		    	int invitenum = rlzyRelationService.personalInvite(rlzyRelationInvite);
		    	usermap.put("collectnum",String.valueOf(collectnum));
		    	usermap.put("resumenum",String.valueOf(resumenum));
		    	usermap.put("invitenum",String.valueOf(invitenum));
				returnJson.setMessage("登录成功!");
				returnJson.setStatus(true);
		        returnJson.setResult(map);
			}
		  return returnJson;
	  }
	/**
	 * 验证码登录正确
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="loginCode")
	public ReturnJson ReturnJson(HttpServletRequest request, HttpServletResponse response,@RequestBody Map<String,String> loginmap){
		ReturnJson returnJson =new ReturnJson();
		Map<String,Object> userMap=new HashMap<>();
        Map<String,String> map=new HashMap<>();
		String phone= loginmap.get("phone");
		RlzyUser rlzyUser = new RlzyUser();
		rlzyUser.setPhone(phone);
		List<RlzyUser> userList = rlzyUserService.findList(rlzyUser);
        String token="";
		if(userList.size() > 0) {
			token=TokenSign.getToken(userList.get(0).getName(), userList.get(0).getId());
	        map.put("name",userList.get(0).getName());
	        map.put("nickName",userList.get(0).getNickName());
	        map.put("id", userList.get(0).getId());
	        map.put("type", "1");
	        map.put("pic", userList.get(0).getPhoto());
			map.put("phone",userList.get(0).getPhone());
	        map.put("accessToken",token);
	    	RlzyRelation rlzyRelation = new RlzyRelation();
	        rlzyRelation.setUserid(userList.get(0).getId());
	    	rlzyRelation.setCollectionstate("1");
	    	int collectnum = rlzyRelationService.personalCollect(rlzyRelation);
	    	RlzyRelation rlzyRelationResume = new RlzyRelation();
	    	rlzyRelationResume.setUserid(userList.get(0).getId());
	    	rlzyRelationResume.setDeliverystate("1");
	    	int resumenum = rlzyRelationService.personalResume(rlzyRelationResume);
	    	RlzyRelation rlzyRelationInvite = new RlzyRelation();
	    	rlzyRelationInvite.setUserid(userList.get(0).getId());
	    	rlzyRelationInvite.setCompanydealstate("1");
	    	rlzyRelationInvite.setInvite("1");
	    	int invitenum = rlzyRelationService.personalInvite(rlzyRelationInvite);
	    	map.put("collectnum",String.valueOf(collectnum));
		    map.put("resumenum",String.valueOf(resumenum));
		    map.put("invitenum",String.valueOf(invitenum));
	        userMap.put("user",map);
			returnJson.setMessage("登录成功!");
			returnJson.setStatus(true);
	        returnJson.setResult(userMap);
	        return returnJson;
		}else {
			RlzyCompany rlzyCompany = new RlzyCompany();
			rlzyCompany.setTelephone(phone);
			List<RlzyCompany> companyList = rlzyCompanyService.findList(rlzyCompany);
			if(companyList.size() > 0) {
				if("1".equals(companyList.get(0).getPaystatus())) {
					returnJson.setMessage("公司还未支付,请前去支付!");
			        returnJson.setStatus(false);
			        return returnJson;
				}else {
			        token=TokenSign.getToken(companyList.get(0).getCompanyname(), companyList.get(0).getId());
			        map.put("name",companyList.get(0).getCompanyname());
			        map.put("nickName",companyList.get(0).getNickName());
			        map.put("id", companyList.get(0).getId());
			        map.put("type", "2");
			        map.put("pic", companyList.get(0).getLogo());
			        map.put("telphone",companyList.get(0).getTelephone());
			        map.put("accessToken",token);
			        RlzyRelation rlzyRelation = new RlzyRelation();
			        rlzyRelation.setCompanyid(companyList.get(0).getId());
			    	rlzyRelation.setCollectionstate("1");
			    	int resumenum = rlzyRelationService.companyResume(rlzyRelation);
			    	RlzyRelation rlzyRelationResume = new RlzyRelation();
			    	rlzyRelationResume.setCompanyid(companyList.get(0).getId());
			    	rlzyRelationResume.setDeliverystate("1");
			    	int invitenum = rlzyRelationService.companyInvite(rlzyRelationResume);
			    	map.put("resumenum",String.valueOf(resumenum));
					map.put("invitenum",String.valueOf(invitenum));
			        userMap.put("user",map);
					returnJson.setMessage("登录成功!");
			        returnJson.setResult(userMap);
			        returnJson.setStatus(true);
			        return returnJson;
				}
			}
		}
		returnJson.setMessage("用户不存在,请注册!");
        returnJson.setStatus(false);
        return returnJson;
	}
}
