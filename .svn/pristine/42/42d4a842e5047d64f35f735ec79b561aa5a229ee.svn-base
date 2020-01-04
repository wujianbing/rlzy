package com.jeeplus.modules.api;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyProduct;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyResume;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyResumeService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.entity.SysPostion;
import com.jeeplus.modules.sys.service.SysPostionService;
import com.jeeplus.modules.sys.utils.DictUtils;
import com.mysql.fabric.xmlrpc.base.Array;

@Controller
@RequestMapping("/api")
public class ApiPersonController {
	  
	@Autowired
	RlzyUserService rlzyUserService;
	@Autowired
	private SysPostionService sysPostionService;
	@Autowired
	RlzyResumeService rlzyResumeService;
	
	@Autowired
	RlzyRelationService rlzyRelationService;
	  /**
	   * 个人信息保存
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping("/personSave")
	  public ReturnJson personSave(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyUser rlzyUser) {
		  rlzyUser.setIspublic("2");
	      Date birth =rlzyUser.getBirthday();
	      Calendar now = Calendar.getInstance();
	      Calendar born = Calendar.getInstance();
	      now.setTime(new Date());
	      born.setTime(birth);
	      if(born.after(now)){
	           throw new IllegalArgumentException("Can't be born in the future"); 
	      }
	           int age = now.get(Calendar.YEAR)-born.get(Calendar.YEAR);
	           if(now.get(Calendar.DAY_OF_YEAR) < born.get(Calendar.DAY_OF_YEAR)) {
	        	   age -= 1;
	           }
	      rlzyUser.setAge(String.valueOf(age));
	      rlzyUser.setCpflag("1");
	      rlzyUserService.save(rlzyUser);
		  ReturnJson returnJson = new ReturnJson();
		  returnJson.setStatus(true);
		  returnJson.setMessage("success");
		  return returnJson;
	  }
	  
	  /**
	   *个人注册
	   * @param request
	   * @param response
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping(value="personRegister")
	  public ReturnJson personSave(HttpServletRequest request,HttpServletResponse response) {
		List<DictValue> eList = DictUtils.getDictList("education");
		List<DictValue> sList = DictUtils.getDictList("sex");
		List<DictValue> waList = DictUtils.getDictList("working_age");
		List<DictValue> csList = DictUtils.getDictList("current_state");
		List<DictValue> diList = DictUtils.getDictList("desired_industry");
		List<DictValue> ssList = DictUtils.getDictList("salary");
		List<DictValue> wnList = DictUtils.getDictList("work_nature");
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<SysPostion> list = sysPostionService.findList(new SysPostion());
		for (int i=0; i<list.size(); i++){
			SysPostion e = list.get(i);
			if(StringUtils.isBlank(e.getParentId()) || "0".equals(e.getParentId())){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("text", e.getName());
				List<Map<String, Object>> childList = Lists.newArrayList();
				List<SysPostion> childrenlist =sysPostionService.getChildren(e.getId());
				for (int j=0; j<childrenlist.size(); j++){
				    SysPostion ne = childrenlist.get(j);
					Map<String, Object> postionChild = Maps.newHashMap();
					postionChild.put("id", ne.getId());
					postionChild.put("text", ne.getName());
					childList.add(postionChild);
				}
				map.put("postionChildList", childList);
				mapList.add(map);
			}
		}
		
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("education", eList);
		map.put("sex", sList);
		map.put("workingage", waList);
		map.put("currentstate", csList);
		map.put("desiredindustry", diList);
		map.put("salary", ssList);
		map.put("worknature", wnList);
		map.put("position", mapList);
	    returnJson.setStatus(true);
	    returnJson.setResult(map);
		returnJson.setMessage("success");
		return returnJson;
	  }
	  
	  /**
	   * 个人信息
	   * @param request
	   * @param response
	   * @param loginmapt
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping(value="personInfo")
	  public ReturnJson personInfo(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		//String accessToken = request.getHeader("accessToken");
		//String userId = TokenSign.getUserId(accessToken);
		String userId = loginmap.get("userId");
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
       	List<DictValue> eList = DictUtils.getDictList("education");
		List<DictValue> sList = DictUtils.getDictList("sex");
		List<DictValue> waList = DictUtils.getDictList("working_age");
		List<DictValue> csList = DictUtils.getDictList("current_state");
		List<DictValue> diList = DictUtils.getDictList("desired_industry");
		List<DictValue> ssList = DictUtils.getDictList("salary");
		List<DictValue> wnList = DictUtils.getDictList("work_nature");
		List<DictValue> imList = DictUtils.getDictList("is_match");
		List<DictValue> ipList = DictUtils.getDictList("is_public");
		RlzyUser rlzyUser = rlzyUserService.get(userId);
		rlzyUser.setSex(DictUtils.getDictLabel(rlzyUser.getSex(), "sex",""));
		rlzyUser.setEducation(DictUtils.getDictLabel(rlzyUser.getEducation(), "education",""));
		rlzyUser.setWorkingage(DictUtils.getDictLabel(rlzyUser.getWorkingage(), "working_age",""));
		//rlzyUser.setMajor(DictUtils.getDictLabel(rlzyUser.getMajor(), "major",""));
		rlzyUser.setCurrentstate(DictUtils.getDictLabel(rlzyUser.getCurrentstate(), "current_state",""));
		rlzyUser.setWorknature(DictUtils.getDictLabel(rlzyUser.getWorknature(), "work_nature",""));
		rlzyUser.setSalary(DictUtils.getDictLabel(rlzyUser.getSalary(), "salary",""));
		rlzyUser.setDesiredindustry(DictUtils.getDictLabel(rlzyUser.getDesiredindustry(), "desired_industry",""));
		rlzyUser.setIsmatch(DictUtils.getDictLabel(rlzyUser.getIsmatch(), "is_match",""));
		rlzyUser.setIspublic(DictUtils.getDictLabel(rlzyUser.getIspublic(), "is_public",""));
		List<RlzyResume> list = new ArrayList<RlzyResume>();
		if(rlzyUser.getRlzyResumeList().size() >0) {
			for(RlzyResume rlzyResume :rlzyUser.getRlzyResumeList()) {
				if(rlzyResume.getExperiencetype().equals("1")) {
					rlzyResume.setEducation(DictUtils.getDictLabel(rlzyResume.getEducation(), "education",""));
				}
				list.add(rlzyResume);
			}
		}
		map.put("rlzyUser",rlzyUser);
		map.put("education",eList);
		map.put("sex",sList);
		map.put("workingage",waList);
		map.put("currentstate",csList);
		map.put("industry",diList);
		map.put("salary",ssList);
		map.put("worknature",wnList);
		map.put("ismatch",imList);
		map.put("ispublic",ipList);
		map.put("rlzyResume", list);
	    returnJson.setStatus(true);
	    returnJson.setResult(map);
		returnJson.setMessage("success");
		return returnJson;
	  }
	  
	  /**
	        *  个人信息-修改保存
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping(value="saveUserInfo")
	  public ReturnJson saveUserInfo(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyUser rlzyUser) {
		  ReturnJson returnJson = new ReturnJson();
			if(!rlzyUser.getIsNewRecord()) {
				RlzyUser t = rlzyUserService.get(rlzyUser.getId());
				try {
					MyBeanUtils.copyBeanNotNull2Bean(rlzyUser, t);
				} catch (Exception e) {
					returnJson.setStatus(false);
					returnJson.setMessage("修改个人信息未成功");
				}
				rlzyUserService.save(t);
				returnJson.setStatus(true);
				returnJson.setMessage("success");
			}else {
				returnJson.setStatus(false);
				returnJson.setMessage("需要传递用户id");
			}
		return returnJson;
	  }
	  
	  /**
	       *简历相关
	  * @param request
	  * @param response
	  * @return
	  */
	 @ResponseBody
	 @RequestMapping(value="resumeSave")
	 public ReturnJson resumeSave(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyResume rlzyResume) {
		String accessToken = request.getHeader("accessToken");
		String userId = TokenSign.getUserId(accessToken);
		rlzyResume.setUserid(userId);
		rlzyResume.setIspublic("2");
		rlzyResumeService.save(rlzyResume);
		ReturnJson returnJson = new ReturnJson();
		returnJson.setStatus(true);
		returnJson.setMessage("success");
		return returnJson;
	 }
	 
	  /**
	      *  简历相关-修改保存
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="resumeEditSave")
	public ReturnJson resumeEditSave(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyResume rlzyResume) {
		  ReturnJson returnJson = new ReturnJson();
			if(!rlzyResume.getIsNewRecord()) {
				RlzyResume t = rlzyResumeService.get(rlzyResume.getId());
				try {
					MyBeanUtils.copyBeanNotNull2Bean(rlzyResume, t);
				} catch (Exception e) {
					returnJson.setStatus(false);
					returnJson.setMessage("修改简历相关信息未成功");
				}
				rlzyResumeService.save(t);
				returnJson.setStatus(true);
				returnJson.setMessage("success");
			}else {
				returnJson.setStatus(false);
				returnJson.setMessage("需要传递当前id");
			}
		return returnJson;
	}
	
	/**
	 * 求职管理-面试邀请
	 * @return
	 */
    @ResponseBody
	@RequestMapping(value="interview")
	public ReturnJson interview(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
	    String accessToken = request.getHeader("accessToken");
		String userId = TokenSign.getUserId(accessToken);
    	String pageNo = loginmap.get("pageNo");
    	//String userId = loginmap.get("userId");
    	ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		RlzyRelation rlzyRelation = new RlzyRelation();
		rlzyRelation.setUserid(userId);
		rlzyRelation.setInvite("1");;
		rlzyRelation.setCompanydealstate("1");
		Page<RlzyRelation> rlzyRelations = new Page<RlzyRelation>();
		rlzyRelations.setPageNo(Integer.parseInt(pageNo));
		rlzyRelations.setPageSize(10);
		Page<RlzyRelation> relationLists = rlzyRelationService.findPage(rlzyRelations, rlzyRelation);
		List<RlzyRelation> relationList = new ArrayList<RlzyRelation>();
		for(RlzyRelation rlzyRelationss : relationLists.getList()) {
			rlzyRelationss.setWorkingage(DictUtils.getDictLabel(rlzyRelationss.getWorkingage(), "working_age",""));
			rlzyRelationss.setSalary(DictUtils.getDictLabel(rlzyRelationss.getSalary(), "salary",""));
			//rlzyRelationss.setAccept(DictUtils.getDictLabel(rlzyRelationss.getAccept(), "accept",""));
			relationList.add(rlzyRelationss);
		}
		long count = relationLists.getCount();
		map.put("interview",relationList);
		map.put("count", count);
		returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("success");
		return returnJson;
    }
	
    /**
	 * 求职管理-面试邀请-邀请
	 * @return
	 */
    @ResponseBody
	@RequestMapping(value="accept")
	public ReturnJson accept(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		ReturnJson returnJson = new ReturnJson();
		String id= loginmap.get("id");
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		rlzyRelation.setUserdealstate("1");
		rlzyRelation.setAccept("2");
		rlzyRelationService.save(rlzyRelation);
		returnJson.setStatus(true);
		returnJson.setMessage("success");
		return returnJson;
	}
    
    /**
   	 * 求职管理-面试邀请-拒绝
   	 * @return
   	 */
       @ResponseBody
   	@RequestMapping(value="refuse")
   	public ReturnJson refuse(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
   		ReturnJson returnJson = new ReturnJson();
   		String id= loginmap.get("id");
   		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
   		rlzyRelation.setAccept("3");
		rlzyRelation.setCompanydealstate("3");
   		rlzyRelationService.save(rlzyRelation);
   		returnJson.setStatus(true);
   		returnJson.setMessage("success");
   		return returnJson;
   	}
    
       /**
   	 * 求职管理-面试邀请
   	 * @return
   	 */
       @ResponseBody
   	@RequestMapping(value="applyFor")
   	public ReturnJson applyFor(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
   	    String accessToken = request.getHeader("accessToken");
   		String userId = TokenSign.getUserId(accessToken);
       	String pageNo = loginmap.get("pageNo");
       	//String userId = loginmap.get("userId");
       	ReturnJson returnJson = new ReturnJson();
   		Map<String,Object> map = new HashMap<String, Object>();
   		RlzyRelation rlzyRelation = new RlzyRelation();
   		rlzyRelation.setUserid(userId);
   		rlzyRelation.setInvite("1");;
   		rlzyRelation.setCompanydealstate("1");
   		Page<RlzyRelation> rlzyRelations = new Page<RlzyRelation>();
   		rlzyRelations.setPageNo(Integer.parseInt(pageNo));
   		rlzyRelations.setPageSize(10);
   		Page<RlzyRelation> relationLists = rlzyRelationService.findPage(rlzyRelations, rlzyRelation);
   		List<RlzyRelation> relationList = new ArrayList<RlzyRelation>();
   		for(RlzyRelation rlzyRelationss : relationLists.getList()) {
   			rlzyRelationss.setWorkingage(DictUtils.getDictLabel(rlzyRelationss.getWorkingage(), "working_age",""));
   			rlzyRelationss.setSalary(DictUtils.getDictLabel(rlzyRelationss.getSalary(), "salary",""));
   			//rlzyRelationss.setAccept(DictUtils.getDictLabel(rlzyRelationss.getAccept(), "accept",""));
   			relationList.add(rlzyRelationss);
   		}
   		long count = relationLists.getCount();
   		map.put("interview",relationList);
   		map.put("count", count);
   		returnJson.setCode("200");
   		returnJson.setStatus(true);
   		returnJson.setResult(map);
   		returnJson.setMessage("success");
   		return returnJson;
       }   
}
