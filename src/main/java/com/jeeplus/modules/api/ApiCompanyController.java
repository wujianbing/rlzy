package com.jeeplus.modules.api;

import java.util.ArrayList;
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
import com.alibaba.fastjson.JSONObject;
import com.jeeplus.common.utils.Encodes;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyProduct;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyPositionService;
import com.jeeplus.modules.portal.service.RlzyProductService;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.utils.DictUtils;
@Controller
@RequestMapping("/api")
public class ApiCompanyController {
  	  
@Autowired
RlzyCompanyService rlzyCompanyService;

	 
@Autowired
RlzyPositionService rlzyPositionService;

@Autowired
RlzyRelationService rlzyRelationService;

@Autowired
RlzyProductService rlzyProductService;

@Autowired
RlzyUserService rlzyUserService;
  /**
   * 企业信息保存
   * @return
   */
  @ResponseBody
  @RequestMapping("/companySave")
  public ReturnJson companySave(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyCompany rlzyCompany) {
	  rlzyCompany.setCpflag("2");
	  rlzyCompany.setPaystatus("0");
	  rlzyCompany.setReviewstate("1");
      rlzyCompany.setTrystate("2");
	  rlzyCompanyService.save(rlzyCompany);
	  ReturnJson returnJson = new ReturnJson();
	  returnJson.setStatus(true);
	  returnJson.setMessage("success");
	  return returnJson;
  }
  
  
    /**
	 * 发布职位-数据字典列表
	 * @param rlzyposition
	 * @return
	 */
    @ResponseBody
	@RequestMapping("/publishOffer")
	public ReturnJson publishOffer(HttpServletRequest request,HttpServletResponse response) {
		List<DictValue> flList = DictUtils.getDictList("company_welfare");
		List<DictValue> zwList = DictUtils.getDictList("work_nature");
		List<DictValue> xlList = DictUtils.getDictList("education");
		List<DictValue> nlList = DictUtils.getDictList("age_range");
		List<DictValue> xzList = DictUtils.getDictList("salary");
		List<DictValue> waList = DictUtils.getDictList("working_age");
		List<DictValue> ipList = DictUtils.getDictList("is_post");
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		/*List<Map<String, Object>> flmapList = Lists.newArrayList();
		for(int i=0;i<flList.size();i++) {
			DictValue e=flList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			flmapList.add(emap);
		}
		List<Map<String, Object>> zwmapList = Lists.newArrayList();
		for(int i=0;i<zwList.size();i++) {
			DictValue e=zwList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			zwmapList.add(emap);
		}
		List<Map<String, Object>> xlmapList = Lists.newArrayList();
		for(int i=0;i<xlList.size();i++) {
			DictValue e=xlList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			xlmapList.add(emap);
		}
		List<Map<String, Object>> nlmapList = Lists.newArrayList();
		for(int i=0;i<nlList.size();i++) {
			DictValue e=nlList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			nlmapList.add(emap);
		}
		List<Map<String, Object>> xzmapList = Lists.newArrayList();
		for(int i=0;i<xzList.size();i++) {
			DictValue e=xzList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			xzmapList.add(emap);
		}
		List<Map<String, Object>> wamapList = Lists.newArrayList();
		for(int i=0;i<waList.size();i++) {
			DictValue e=waList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			wamapList.add(emap);
		}
		List<Map<String, Object>> ipmapList = Lists.newArrayList();
		for(int i=0;i<ipList.size();i++) {
			DictValue e=ipList.get(i);
			Map<String, Object> emap = Maps.newHashMap();
			emap.put("id", e.getValue());
			emap.put("name", e.getLabel());
			ipmapList.add(emap);
		}*/
		map.put("welfaretype", flList);
		map.put("positiontype", zwList);
		map.put("education", xlList);
		map.put("agerequirement", nlList);
		map.put("salaryrange", xzList);
		map.put("workingage", waList);
		map.put("postflag", ipList);
		returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("success");
		return returnJson;
	}
    
    /**
	 * 发布职位-保存
	 * @param rlzyposition
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="publishData")
	public ReturnJson publishData(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyPosition rlzyPosition) {
		String accessToken = request.getHeader("accessToken");
		String companyId = TokenSign.getUserId(accessToken);
		rlzyPosition.setCompanyid(companyId);
		rlzyPosition.setLine("1");
		rlzyPosition.setNum("0");
		rlzyPosition.setIsTop("1");
		rlzyPositionService.save(rlzyPosition);
		ReturnJson returnJson = new ReturnJson();
		returnJson.setStatus(true);
		returnJson.setMessage("success");
		return returnJson;
	} 
	
	 /**
		 * 修改职位-保存
		 * @param rlzyposition
		 * @return
		 * @throws Exception 
		 */
		@ResponseBody
		@RequestMapping(value="offerEditData")
		public ReturnJson offerEditData(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyPosition rlzyPosition) {
			ReturnJson returnJson = new ReturnJson();
				if(!rlzyPosition.getIsNewRecord()) {
					RlzyPosition t = rlzyPositionService.get(rlzyPosition.getId());
					try {
						MyBeanUtils.copyBeanNotNull2Bean(rlzyPosition, t);
					} catch (Exception e) {
						returnJson.setStatus(false);
						returnJson.setMessage("修改职位未成功");
					}
					rlzyPositionService.save(t);
					returnJson.setStatus(true);
					returnJson.setMessage("success");
				}else {
				returnJson.setStatus(false);
				returnJson.setMessage("需要传递当前职位id");
			}
			return returnJson;
		}
		
		/**
		 * 企业注册-数据字典列表
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="companyRegister")
		public ReturnJson companyRegister(HttpServletRequest request,HttpServletResponse response) {
			List<DictValue> cnList = DictUtils.getDictList("company_nature");
			List<DictValue> csList = DictUtils.getDictList("company_scale");
			List<DictValue> diList = DictUtils.getDictList("desired_industry");
			List<DictValue> ctList = DictUtils.getDictList("company_type");
			ReturnJson returnJson = new ReturnJson();
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("companynature", cnList);
			map.put("companyscale", csList);
			map.put("industry", diList);
			map.put("companytype", ctList);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
		}
	    
	    /**
		 * 职位管理-数据列表
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="offerManageData")
		public ReturnJson offerManageData(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmapt) {
	    	String accessToken = request.getHeader("accessToken");
			String rlzyCompanyId = TokenSign.getUserId(accessToken);
			String rlzyCompanyName =TokenSign.getUsername(accessToken);
	    	//String rlzyCompanyId= loginmapt.get("rlzyCompanyId");
		    String pageNo= loginmapt.get("pageNo");
		    int limit = 10;
	    	ReturnJson returnJson = new ReturnJson();
			Map<String,Object> map = new HashMap<String, Object>();
	    	RlzyPosition rlzyPosition = new RlzyPosition();
			rlzyPosition.setCompanyid(rlzyCompanyId);
			Page<RlzyPosition> rlzyPositions = new Page<RlzyPosition>();
			rlzyPositions.setPageNo(Integer.parseInt(pageNo));
			rlzyPositions.setPageSize(limit);
			Page<RlzyPosition> rlzyPositionLists = rlzyPositionService.findPage(rlzyPositions, rlzyPosition);
			List<RlzyPosition> rlzyPositionList = new ArrayList<RlzyPosition>();
			for(RlzyPosition rlzyPositionss : rlzyPositionLists.getList()) {
				rlzyPositionss.setSalaryrange(DictUtils.getDictLabel(rlzyPositionss.getSalaryrange(), "salary",""));
				rlzyPositionss.setPositiontype(DictUtils.getDictLabel(rlzyPositionss.getPositiontype(), "work_nature",""));
				rlzyPositionss.setWorkingage(DictUtils.getDictLabel(rlzyPositionss.getWorkingage(), "working_age",""));
				rlzyPositionss.setLine(DictUtils.getDictLabel(rlzyPositionss.getLine(), "line",""));
				rlzyPositionss.setEducation(DictUtils.getDictLabel(rlzyPositionss.getEducation(), "education",""));
				//rlzyPositionss.setPostflag(DictUtils.getDictLabel(rlzyPositionss.getPostflag(), "is_post",""));
				String wType = rlzyPositionss.getWelfaretype();
				if(wType != null){
					String[] arr = StringUtils.split(wType, "\\,");
					StringBuilder builder = new StringBuilder();
					if(arr.length >0){
						for(int i=0;i<arr.length;i++){
							if(i==arr.length-1){
								builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
							}else{
								builder.append(DictUtils.getDictLabel(arr[i], "company_welfare", ""));
								builder.append(",");
							}
							
						}
						rlzyPositionss.setWelfaretype(builder.toString());
					}
				}
				rlzyPositionss.setCompanyname(rlzyCompanyName);
				rlzyPositionList.add(rlzyPositionss);
			}
			long count = rlzyPositionLists.getCount();
			map.put("offerManageData",rlzyPositionList);
			map.put("count", count);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
	    }
	    
	    /**
		 * 职位管理-删除按钮 逻辑删除
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="offerManageDataDel")
		public ReturnJson offerManageDataDel(HttpServletRequest request,HttpServletResponse response,@RequestBody String jsondata) {
			JSONObject obje= JSON.parseObject(jsondata);
			String rlzyPositionId = obje.getString("rlzyPositionId");
			RlzyPosition rlzyPosition = rlzyPositionService.get(rlzyPositionId);
			ReturnJson returnJson = new ReturnJson();
			List<RlzyPosition> list = new ArrayList<>();
			list.add(rlzyPosition);
			rlzyPositionService.deleteAllByLogic(list);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
				
		/**
		 * 收藏候选人-数据接口
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="collectCandidate")
		public ReturnJson collectCandidate(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmapt) {
	    	String accessToken = request.getHeader("accessToken");
	    	String rlzyCompanyId = TokenSign.getUserId(accessToken);
	    	String pageNo= loginmapt.get("pageNo");
		    //String rlzyCompanyId= loginmapt.get("rlzyCompanyId");
		    int limit = 10;
	    	ReturnJson returnJson = new ReturnJson();
			Map<String,Object> map = new HashMap<String, Object>();
			List<RlzyPosition> positionList = rlzyPositionService.findPositionListById(rlzyCompanyId);
			RlzyRelation rlzyRelation = new RlzyRelation();
			rlzyRelation.setCompanyid(rlzyCompanyId);
			rlzyRelation.setCompanycollectstate("1");
			rlzyRelation.setInvite("2");
			Page<RlzyRelation> rlzyRelations = new Page<RlzyRelation>();
			rlzyRelations.setPageNo(Integer.parseInt(pageNo));
			rlzyRelations.setPageSize(limit);
			Page<RlzyRelation> relationLists = rlzyRelationService.findPage(rlzyRelations, rlzyRelation);
			List<RlzyRelation> relationList = new ArrayList<RlzyRelation>();
			for(RlzyRelation rlzyRelationss : relationLists.getList()) {
				rlzyRelationss.setSex(DictUtils.getDictLabel(rlzyRelationss.getSex(), "sex",""));
				rlzyRelationss.setWorkingage(DictUtils.getDictLabel(rlzyRelationss.getWorkingage(), "working_age",""));
				rlzyRelationss.setCurrentstate(DictUtils.getDictLabel(rlzyRelationss.getCurrentstate(), "current_state",""));
				rlzyRelationss.setDesiredsalary(DictUtils.getDictLabel(rlzyRelationss.getDesiredsalary(), "salary",""));
				rlzyRelationss.setDescription(rlzyUserService.get(rlzyRelationss.getUserid()).getSelfdescription());
				rlzyRelationss.setEducation(DictUtils.getDictLabel(rlzyUserService.get(rlzyRelationss.getUserid()).getEducation(), "education",""));
				relationList.add(rlzyRelationss);
			}
			long count = relationLists.getCount();
			map.put("collectCandidate",relationList);
			map.put("count",count);
			map.put("positionList", positionList);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			System.out.println(positionList.size());
			return returnJson;
		   
	    }
	    
	    /**
		 * 收藏候选人-邀请按钮
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="collectCandidateYQ")
		public ReturnJson collectCandidateYQ(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			ReturnJson returnJson = new ReturnJson();
			String id= loginmap.get("id");
			RlzyRelation rlzyRelation = rlzyRelationService.get(id);
			//准确薪资
			String salary = rlzyRelation.getDesiredsalary();
			rlzyRelation.setSalary(salary);
			rlzyRelationService.save(rlzyRelation);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
	    
	    /**
		 * 收藏职位-邀请按钮-确认职位
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="confirm")
		public ReturnJson confirm(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap){
			ReturnJson returnJson = new ReturnJson();
			String id = loginmap.get("id");
			String positionId = loginmap.get("positionId");
			RlzyPosition rlzyPosition = rlzyPositionService.get(positionId);
			RlzyRelation rlzyRelation = rlzyRelationService.get(id);
			rlzyRelation.setPositionname(rlzyPosition.getPositionname());
			rlzyRelation.setPositionid(positionId);
			rlzyRelation.setInvite("1");
			rlzyRelationService.save(rlzyRelation);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 收藏职位-取消收藏按钮
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="collectManageQx")
		public ReturnJson collectManageQx(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap){
			ReturnJson returnJson = new ReturnJson();
			String id = loginmap.get("id");
			RlzyRelation rlzyRelation = rlzyRelationService.get(id);
			rlzyRelation.setCollectionstate("2");
			rlzyRelation.setCompanycollectstate("2");
			rlzyRelationService.save(rlzyRelation);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 收藏职位-删除按钮
		 * @return
	     * @throws Exception 
		 */
		@ResponseBody
		@RequestMapping(value="collectManageDel")
		public ReturnJson collectManageDel(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap){
			ReturnJson returnJson = new ReturnJson();
			String id = loginmap.get("id");
			RlzyRelation rlzyRelation = rlzyRelationService.get(id);
			List<RlzyRelation> list = new ArrayList<>();
			list.add(rlzyRelation);
			rlzyRelationService.deleteAllByLogic(list);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 收到简历-数据接口
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="receiveResumeData")
		public ReturnJson receiveResumeData(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		    String accessToken = request.getHeader("accessToken");
			String rlzyCompanyId = TokenSign.getUserId(accessToken);
	    	String pageNo = loginmap.get("pageNo");
	    	//String rlzyCompanyId = loginmap.get("rlzyCompanyId");
	    	int limit = 10;
	    	ReturnJson returnJson = new ReturnJson();
			Map<String,Object> map = new HashMap<String, Object>();
			RlzyRelation rlzyRelation = new RlzyRelation();
			rlzyRelation.setCompanyid(rlzyCompanyId);
			rlzyRelation.setDeliverystate("1");
			rlzyRelation.setInvite("2");
			Page<RlzyRelation> rlzyRelations = new Page<RlzyRelation>();
			rlzyRelations.setPageNo(Integer.parseInt(pageNo));
			rlzyRelations.setPageSize(limit);
			Page<RlzyRelation> relationLists = rlzyRelationService.findPage(rlzyRelations, rlzyRelation);
			List<RlzyRelation> relationList = new ArrayList<RlzyRelation>();
			for(RlzyRelation rlzyRelationss : relationLists.getList()) {
				rlzyRelationss.setWorkingage(DictUtils.getDictLabel(rlzyRelationss.getWorkingage(), "working_age",""));
				rlzyRelationss.setCurrentstate(DictUtils.getDictLabel(rlzyRelationss.getCurrentstate(), "current_state",""));
				rlzyRelationss.setSalary(DictUtils.getDictLabel(rlzyRelationss.getSalary(), "salary",""));
				rlzyRelationss.setDescription(rlzyUserService.get(rlzyRelationss.getUserid()).getSelfdescription());
				rlzyRelationss.setEducation(DictUtils.getDictLabel(rlzyUserService.get(rlzyRelationss.getUserid()).getEducation(), "education",""));
				relationList.add(rlzyRelationss);
			}
			long count = relationLists.getCount();
			map.put("receiveResume",relationList);
			map.put("count", count);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
	    }
	    
	    /**
		 * 收到简历-删除按钮  逻辑删除
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="receiveResumeDataDel")
		public ReturnJson receiveResumeDataDel(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String id = loginmap.get("id");
	    	ReturnJson returnJson = new ReturnJson();
			RlzyRelation rlzyRelation = rlzyRelationService.get(id);
			List<RlzyRelation> list = new ArrayList<>();
			list.add(rlzyRelation);
			rlzyRelationService.deleteAllByLogic(list);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		 /**
		 * 收到简历-邀请按钮
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="receiveResumeDataYQ")
		public ReturnJson receiveResumeDataYQ(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String id = loginmap.get("id");
	    	ReturnJson returnJson = new ReturnJson();
	    	RlzyRelation rlzyRelation = rlzyRelationService.get(id);
			rlzyRelation.setInvite("1");
			rlzyRelation.setCompanydealstate("1");
			rlzyRelationService.save(rlzyRelation);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		 /**
		 * 企业信息
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="companyInfo")
		public ReturnJson companyInfo(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String accessToken = request.getHeader("accessToken");
			String rlzyCompanyid = TokenSign.getUserId(accessToken);
			//String rlzyCompanyid = loginmap.get("rlzyCompanyid");
	    	ReturnJson returnJson = new ReturnJson();
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	RlzyCompany rlzyCompany = rlzyCompanyService.get(rlzyCompanyid);
	    	String[] arrs=new String[4];
	        if(rlzyCompany !=null && rlzyCompany.getCasepic() != "" && rlzyCompany.getCasepic() != null) {
				String pics = rlzyCompany.getCasepic();
				String[] arr = StringUtils.split(pics, "|");
				for (int i = 0; i < arr.length; i++) {
					arrs[i]= arr[i];
				}
	        }
	        for(int i = 0; i < arrs.length; i++) {
	        	if(arrs[i] == null) {
	        		arrs[i] = "";
	        	}
	        }
	        List<DictValue> cnList = DictUtils.getDictList("company_nature");
			List<DictValue> csList = DictUtils.getDictList("company_scale");
			List<DictValue> diList = DictUtils.getDictList("desired_industry");
			List<DictValue> ctList = DictUtils.getDictList("company_type");
			List<DictValue> stList = DictUtils.getDictList("service_type");
	        rlzyCompany.setCompanynature(DictUtils.getDictLabel(rlzyCompany.getCompanynature(), "company_nature",""));
	        rlzyCompany.setCompanyscale(DictUtils.getDictLabel(rlzyCompany.getCompanyscale(), "company_scale",""));
	        rlzyCompany.setIndustry(DictUtils.getDictLabel(rlzyCompany.getIndustry(), "desired_industry",""));
	        rlzyCompany.setCompanytype(DictUtils.getDictLabel(rlzyCompany.getCompanytype(), "company_type",""));
	        rlzyCompany.setServiceType(DictUtils.getDictLabel(rlzyCompany.getServiceType(), "service_type",""));
	        map.put("pic",arrs );
	        map.put("rlzyCompany",rlzyCompany);
	        map.put("companynature", cnList);
	        map.put("companyscale", csList);
	        map.put("industry", diList);
	        map.put("companytype", ctList);
	        map.put("servicetype", stList);
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 企业账号管理-手机号更改
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="accountPhone")
		public ReturnJson accountPhone(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String accessToken = request.getHeader("accessToken");
			String rlzyCompanyid = TokenSign.getUserId(accessToken);
			//String rlzyCompanyid = loginmap.get("rlzyCompanyid");
			String phone = loginmap.get("phone");
			String status = loginmap.get("status");
			ReturnJson returnJson = new ReturnJson();
			//status 1为公司操作
			if("2".equals(status)) {
				RlzyCompany rlzyCompany = rlzyCompanyService.get(rlzyCompanyid);
				rlzyCompany.setTelephone(phone);
				rlzyCompanyService.save(rlzyCompany);
			//status 2为公司操作
			}else{
				RlzyUser rlzyUser = rlzyUserService.get(rlzyCompanyid);
		    	rlzyUser.setPhone(phone);
				rlzyUserService.save(rlzyUser);
			}
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 企业账号管理-密码修改
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="accountPassword")
		public ReturnJson accountPassword(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String accessToken = request.getHeader("accessToken");
			String rlzyCompanyid = TokenSign.getUserId(accessToken);
			//String rlzyCompanyid = loginmap.get("rlzyCompanyid");
			String password = loginmap.get("password");
			String status = loginmap.get("status");
	    	ReturnJson returnJson = new ReturnJson();
	    	//status 1为公司操作
	    	if("2".equals(status)) {
	    		RlzyCompany rlzyCompany = rlzyCompanyService.get(rlzyCompanyid);
				rlzyCompany.setPassword(password);
				rlzyCompanyService.save(rlzyCompany);
	    	}else {
	    		RlzyUser rlzyUser = rlzyUserService.get(rlzyCompanyid);
				rlzyUser.setPassword(password);
				rlzyUserService.save(rlzyUser);
	    	}
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 产品列表-数据接口
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="productData")
		public ReturnJson productData(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
	    	String accessToken = request.getHeader("accessToken");
			String rlzyCompanyId = TokenSign.getUserId(accessToken);
	    	String page = loginmap.get("page");
	    	int limit = 10;
	    	ReturnJson returnJson = new ReturnJson();
			Map<String,Object> map = new HashMap<String, Object>();
			RlzyProduct rlzyProduct = new RlzyProduct();
			rlzyProduct.setCompanyid(rlzyCompanyId);
			Page<RlzyProduct> rlzyRlzyProductss = new Page<RlzyProduct>();
			rlzyRlzyProductss.setPageNo(Integer.parseInt(page));
			rlzyRlzyProductss.setPageSize(limit);
			Page<RlzyProduct> rlzyRlzyProductLists = rlzyProductService.findPage(rlzyRlzyProductss, rlzyProduct);
			List<RlzyProduct> rlzyRlzyProductList = rlzyRlzyProductLists.getList();
			long count = rlzyRlzyProductLists.getCount();
			map.put("rlzyProduct",rlzyRlzyProductList);
			map.put("count", count);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
	    }
	    
	    /**
		 * 产品页面-新增按钮
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="saveProduct")
		public ReturnJson saveProduct(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyProduct rlzyProduct) {
			ReturnJson returnJson = new ReturnJson();
			String accessToken = request.getHeader("accessToken");
			String rlzyCompanyid = TokenSign.getUserId(accessToken);
			rlzyProduct.setCompanyid(rlzyCompanyid);
			rlzyProductService.save(rlzyProduct);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 产品页面-修改
		 * @param rlzyposition
		 * @return
		 * @throws Exception 
		 */
		@ResponseBody
		@RequestMapping(value="editProduct")
		public ReturnJson editProduct(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyProduct rlzyProduct) {
			ReturnJson returnJson = new ReturnJson();
				if(!rlzyProduct.getIsNewRecord()) {
					RlzyProduct t = rlzyProductService.get(rlzyProduct.getId());
					try {
						MyBeanUtils.copyBeanNotNull2Bean(rlzyProduct, t);
					} catch (Exception e) {
						returnJson.setStatus(false);
						returnJson.setMessage("修改产品未成功");
					}
					rlzyProductService.save(t);
					returnJson.setStatus(true);
					returnJson.setMessage("success");
				}else {
					returnJson.setStatus(false);
					returnJson.setMessage("需要传递当前产品id");
				}
			return returnJson;
		}
		
		/**
		 * 产品-删除按钮  逻辑删除
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="editProductDel")
		public ReturnJson editProductDel(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String rlzyProductId = loginmap.get("rlzyProductId");
			RlzyProduct rlzyProduct = rlzyProductService.get(rlzyProductId);
	    	ReturnJson returnJson = new ReturnJson();
	    	List<RlzyProduct> list = new ArrayList<>();
			list.add(rlzyProduct);
			rlzyProductService.deleteAllByLogic(list);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		
		/**
		 * 首页-企业入驻
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="indexCompanyInfo")
		public ReturnJson indexCompanyInfo(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			String id = loginmap.get("id");
	    	ReturnJson returnJson = new ReturnJson();
	    	Map<String,Object> map = new HashMap<String, Object>();
	    	RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
	    	String[] arrs=new String[4];
	        if(rlzyCompany !=null && rlzyCompany.getCasepic() != "" && rlzyCompany.getCasepic() != null) {
				String pics = rlzyCompany.getCasepic();
				String[] arr = StringUtils.split(pics, "|");
				for (int i = 0; i < arr.length; i++) {
					arrs[i]= arr[i];
				}
	        }
	        for(int i = 0; i < arrs.length; i++) {
	        	if(arrs[i] == null) {
	        		arrs[i] = "";
	        	}
	        }
	        rlzyCompany.setCompanynature(DictUtils.getDictLabel(rlzyCompany.getCompanynature(), "company_nature",""));
	        rlzyCompany.setCompanyscale(DictUtils.getDictLabel(rlzyCompany.getCompanyscale(), "company_scale",""));
	        rlzyCompany.setIndustry(DictUtils.getDictLabel(rlzyCompany.getIndustry(), "desired_industry",""));
	        rlzyCompany.setCompanytype(DictUtils.getDictLabel(rlzyCompany.getCompanytype(), "company_type",""));
	        String content =Encodes.unescapeHtml(rlzyCompany.getServicerange());
	        if(StringUtils.isNotBlank(content)) {
		        rlzyCompany.setServicerange(content);
	        }else{
	        	rlzyCompany.setServicerange("");
	        }
	        RlzyProduct rlzyProduct = new RlzyProduct();
	        rlzyProduct.setCompanyid(id);
	        List<RlzyProduct> productList = rlzyProductService.findList(rlzyProduct);
	        map.put("pic",arrs );
	        map.put("rlzyCompany",rlzyCompany);
	        map.put("rlzyProduct", productList);
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 企业邀请面试
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="companyInvite")
		public ReturnJson companyInvite(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			//String userId = loginmap.get("userId");
			Map<String,Object> map = new HashMap<String, Object>();
			String accessToken = request.getHeader("accessToken");
			String userId = TokenSign.getUserId(accessToken);
	    	ReturnJson returnJson = new ReturnJson();
	    	RlzyRelation rlzyRelation = new RlzyRelation();
	    	rlzyRelation.setCompanyid(userId);
	    	rlzyRelation.setCompanydealstate("1");
	    	rlzyRelation.setInvite("1");
	    	int num = rlzyRelationService.companyInvite(rlzyRelation);
	    	map.put("num", num);
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 企业收到简历数
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="companyResume")
		public ReturnJson companyResume(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
			//String userId = loginmap.get("userId");
			Map<String,Object> map = new HashMap<String, Object>();
			String accessToken = request.getHeader("accessToken");
			String userId = TokenSign.getUserId(accessToken);
	    	ReturnJson returnJson = new ReturnJson();
	    	RlzyRelation rlzyRelation = new RlzyRelation();
	    	rlzyRelation.setCompanyid(userId);
	    	rlzyRelation.setDeliverystate("1");
	    	int num = rlzyRelationService.companyResume(rlzyRelation);
	    	map.put("num", num);
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 已邀请的简历-数据接口
		 * @return
		 */
	    @ResponseBody
		@RequestMapping(value="inviteResumeData")
		public ReturnJson inviteResumeData(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		    String accessToken = request.getHeader("accessToken");
			String rlzyCompanyId = TokenSign.getUserId(accessToken);
	    	String pageNo = loginmap.get("pageNo");
	    	//String rlzyCompanyId = loginmap.get("rlzyCompanyId");
	    	int limit = 10;
	    	ReturnJson returnJson = new ReturnJson();
			Map<String,Object> map = new HashMap<String, Object>();
			RlzyRelation rlzyRelation = new RlzyRelation();
			rlzyRelation.setCompanyid(rlzyCompanyId);
			rlzyRelation.setInvite("1");
			Page<RlzyRelation> rlzyRelations = new Page<RlzyRelation>();
			rlzyRelations.setPageNo(Integer.parseInt(pageNo));
			rlzyRelations.setPageSize(limit);
			Page<RlzyRelation> relationLists = rlzyRelationService.findPage(rlzyRelations, rlzyRelation);
			List<RlzyRelation> relationList = new ArrayList<RlzyRelation>();
			for(RlzyRelation rlzyRelationss : relationLists.getList()) {
				rlzyRelationss.setWorkingage(DictUtils.getDictLabel(rlzyRelationss.getWorkingage(), "working_age",""));
				rlzyRelationss.setCurrentstate(DictUtils.getDictLabel(rlzyRelationss.getCurrentstate(), "current_state",""));
				rlzyRelationss.setSalary(DictUtils.getDictLabel(rlzyRelationss.getSalary(), "salary",""));
				rlzyRelationss.setAccept(DictUtils.getDictLabel(rlzyRelationss.getAccept(), "accept",""));
				rlzyRelationss.setDescription(rlzyUserService.get(rlzyRelationss.getUserid()).getSelfdescription());
				rlzyRelationss.setEducation(DictUtils.getDictLabel(rlzyUserService.get(rlzyRelationss.getUserid()).getEducation(), "education",""));
				relationList.add(rlzyRelationss);
			}
			long count = relationLists.getCount();
			map.put("inviteResumeData",relationList);
			map.put("count", count);
			returnJson.setCode("200");
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
	    }
	    
	    /**
	        *  企业信息-修改保存
	   * @return
	   */
	  @ResponseBody
	  @RequestMapping(value="saveCompanyInfo")
	  public ReturnJson saveCompanyInfo(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyCompany rlzyCompany) {
		  ReturnJson returnJson = new ReturnJson();
			if(!rlzyCompany.getIsNewRecord()) {
				RlzyCompany t = rlzyCompanyService.get(rlzyCompany.getId());
				try {
					MyBeanUtils.copyBeanNotNull2Bean(rlzyCompany, t);
				} catch (Exception e) {
					returnJson.setStatus(false);
					returnJson.setMessage("修改企业信息未成功");
				}
				rlzyCompanyService.save(t);
				returnJson.setStatus(true);
				returnJson.setMessage("success");
			}else {
				returnJson.setStatus(false);
				returnJson.setMessage("需要传递当前企业id");
			}
		return returnJson;
	  }
	  
		/**
		 * 下线职位
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="offline")
		public ReturnJson offline(@RequestBody Map<String,String> map) {
			ReturnJson returnJson = new ReturnJson();
		    String id= map.get("id");
			RlzyPosition rlzyPosition = rlzyPositionService.get(id);
			rlzyPosition.setLine("2");
			rlzyPositionService.save(rlzyPosition);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
		
		/**
		 * 上线职位
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="upline")
		public ReturnJson upline(@RequestBody Map<String,String> map) {
			ReturnJson returnJson = new ReturnJson();
			String id= map.get("id");
			RlzyPosition rlzyPosition = rlzyPositionService.get(id);
			rlzyPosition.setLine("1");
			rlzyPositionService.save(rlzyPosition);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
			return returnJson;
		}
}
