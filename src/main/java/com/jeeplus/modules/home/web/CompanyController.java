package com.jeeplus.modules.home.web;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.utils.CookieUtils;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.portal.entity.News;
import com.jeeplus.modules.portal.entity.NewsModel;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyCooperation;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyProduct;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.entity.RlzyWorker;
import com.jeeplus.modules.portal.service.NewsService;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyCooperationService;
import com.jeeplus.modules.portal.service.RlzyPositionService;
import com.jeeplus.modules.portal.service.RlzyProductService;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.portal.service.RlzyWorkerService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.utils.DictUtils;

/**
 * @author：赵斌
 * @date 2019-11-15
 * 
 * */

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	@Autowired
	RlzyCompanyService rlzyCompanyService;
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	RlzyUserService rlzyUserService;
	
	@Autowired
	RlzyPositionService rlzyPositionService;
	
	@Autowired
	RlzyRelationService rlzyRelationService;
	
	@Autowired
	RlzyProductService rlzyProductService;
	
	@Autowired
	RlzyCooperationService rlzyCooperationService;
	
	@Autowired
	RlzyWorkerService rlzyWorkerService;
	/**
	 * 保存企业注册信息
	 * 
	 * @param request
	 * @param rlzyCompany
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="saveCompany")
    public String saveCompany(RlzyCompany rlzyCompany,HttpServletRequest request){
		rlzyCompany.setCpflag("2");
		rlzyCompany.setPaystatus("0");
		rlzyCompany.setReviewstate("1");
		rlzyCompany.setTrystate("2");
		rlzyCompany.setIstop("2");
		rlzyCompany.setIspublic("2");
		rlzyCompanyService.save(rlzyCompany);
		String id = rlzyCompany.getId();
		return id;
	}
	
	/**
	 * 企业注册页面
	 * @param rlzycompany
	 * @param model
	 * 
	 * */
	@RequestMapping("register")
	public String register(Model model,String type,RlzyCompany rlzyCompany) {
		if(type.equals("1")) {
		  News news= newsService.get("6c88e1c2b4ad4ae093a17282e34ec60b");
		  model.addAttribute("news", news);
		}else {
		  News news= newsService.get("8820d854ebe844b08713f35efe387a88");
		  model.addAttribute("news", news);
		}
		return "modules/home/companyRegister";
	}
	
	/**
	 * 图片上传
	 * 
	 * */
	@RequestMapping("/upload")
	@ResponseBody
	public String upload(MultipartFile file,HttpSession session,String flag) {
		/* String phone = (String)session.getAttribute("tel"); */
	    String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
	    String name = file.getOriginalFilename().substring(0,file.getOriginalFilename().lastIndexOf("."));
	    // 当前app根目录
	    String rootPath = Global.getAttachmentDir();
	    //路径为 ../ files/
	    // 需要上传的相对地址（application.properties中获取）
	    String uploadPath="";
	    if("1".equals(flag)) {
	    	uploadPath = "personal";
	    }else {
	    	uploadPath = "company";
	    }
	    // 文件夹是否存在，不存在就创建
	    String path = name + suffix;
	    Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH )+1;
	    String fileUrl = Global.getAttachmentUrl()+uploadPath+"/"+year+"/"+month+"/"+path;
	    //String url = Global.getAttachmentUrl()+phone+relativePath+ path;
	    File dir = new File(rootPath+File.separator+uploadPath+"/"+year+"/"+month+"/"+path);
	    if (!dir.exists())
			dir.mkdirs();
	    try {
	        file.transferTo(dir);
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "";
	    }
	    return fileUrl.toString();
	}
	
	/**
	 * 企业管理页面
	 * @param rlzycompany
	 * @param model
	 * 
	 * */
	@RequestMapping("/management")
	public String management(Model model,RlzyCompany rlzyCompany,String flag) {
		return "modules/home/companyManagement";
	}
	
	/**
	 * 首次进入
	 * @param model
	 * @param rlzycompany
	 * @param id
	 * @return
	 */
	@RequestMapping("/companydetail")
	public String personal(Model model,RlzyCompany rlzyCompany,HttpServletRequest request) {
		String company=CookieUtils.getCookie(request, "user"); 
		if(!company.equals("")) {
			JSONObject jsonObject= JSON.parseObject(company); 
			System.out.println(jsonObject.get("id"));
			String id=(String) jsonObject.get("id");
			//rlzyCompanyService.get(id);
			model.addAttribute("rlzyCompany",rlzyCompanyService.get(id));
			return "modules/home/companyManagement";
		}else {
			return "redirect:/login/tologin"; 
		}
	}
	
	/**
	 * 职位管理
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping(value="offerManage")
	public String offerManage(String firmId,Model model,HttpSession session) {
			model.addAttribute("firmId", firmId);
		return "/modules/home/company/offerManage";
	}
	
	/**
	 * 职位管理-数据接口
	 * @param firmId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="offerManageData")
	public String offerManageData(String firmId,String page,String limit) {
		RlzyPosition rlzyPosition = new RlzyPosition();
		rlzyPosition.setCompanyid(firmId);
		Page<RlzyPosition> rlzyPositions = new Page<RlzyPosition>();
		rlzyPositions.setPageNo(Integer.parseInt(page));
		rlzyPositions.setPageSize(Integer.parseInt(limit));
		Page<RlzyPosition> rlzyPositionLists = rlzyPositionService.findPage(rlzyPositions, rlzyPosition);
		List<RlzyPosition> rlzyPositionList =rlzyPositionLists.getList();
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+rlzyPositionLists.getCount()+"\",");
		jsonStr.append("\"data\":[");
		if(rlzyPositionList.size() > 0) {
			for(int i=0;i<rlzyPositionList.size();i++) {
				if(rlzyPositionList.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"positionId\":\""+rlzyPositionList.get(i).getId()+"\",");
					jsonStr.append("\"positionname\":\""+rlzyPositionList.get(i).getPositionname()+"\",");
					jsonStr.append("\"salaryrange\":\""+DictUtils.getDictLabel(rlzyPositionList.get(i).getSalaryrange(), "salary","")+"\",");
					jsonStr.append("\"recruitnumber\":\""+rlzyPositionList.get(i).getRecruitnumber()+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(rlzyPositionList.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"num\":\""+rlzyPositionList.get(i).getNum()+"\",");
					jsonStr.append("\"line\":\""+DictUtils.getDictLabel(rlzyPositionList.get(i).getLine(), "line","")+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"positionId\":\""+rlzyPositionList.get(i).getId()+"\",");
					jsonStr.append("\"positionname\":\""+rlzyPositionList.get(i).getPositionname()+"\",");
					jsonStr.append("\"salaryrange\":\""+DictUtils.getDictLabel(rlzyPositionList.get(i).getSalaryrange(), "salary","")+"\",");
					jsonStr.append("\"recruitnumber\":\""+rlzyPositionList.get(i).getRecruitnumber()+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(rlzyPositionList.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"num\":\""+rlzyPositionList.get(i).getNum()+"\",");
					jsonStr.append("\"line\":\""+DictUtils.getDictLabel(rlzyPositionList.get(i).getLine(), "line","")+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}
	
	/**
	 * 职位管理-删除按钮 逻辑删除
	 * @param model
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="offerManageDataDel")
	public String offerManageDataDel(String id) {
		RlzyPosition rlzyPosition = rlzyPositionService.get(id);
		List<RlzyPosition> list = new ArrayList<>();
		list.add(rlzyPosition);
		rlzyPositionService.deleteAllByLogic(list);
		return "1";
	} 
	
	/**
	 * 发布职位
	 * @param firmId
	 * @param rlzyposition
	 * @return
	 */
	@RequestMapping("/publishOffer")
	public String publishOffer(String firmId,RlzyPosition rlzyPosition,Model model) {
		List<DictValue> list = DictUtils.getDictList("company_welfare");
		model.addAttribute("list", list);
		model.addAttribute("firmId", firmId);
		return "/modules/home/company/publishOffer";
	}
	
	/**
	 * 发布职位-修改发布职位
	 * @param firmId
	 * @param rlzyposition
	 * @return
	 */
	@RequestMapping(value="publishOfferEdit")
	public String publishOfferEdit(String id,Model model,String firmId) {
		RlzyPosition rlzyPosition = rlzyPositionService.get(id);
		List<DictValue> list = DictUtils.getDictList("company_welfare");
		String wType = rlzyPosition.getWelfaretype();
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
				rlzyPosition.setWelfaretype(builder.toString());
			}
			model.addAttribute("arr", arr);
		}
		model.addAttribute("firmId", firmId);
		model.addAttribute("list", list);
		model.addAttribute("rlzyPosition", rlzyPosition);
		return "/modules/home/company/editOffer";
	}
	
	/**
	 * 发布职位-修改发布职位-数据接口
	 * @param firmId
	 * @param rlzyposition
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value="offerEditData")
	public String offerEditData(String id,RlzyPosition rlzyPosition) throws Exception {
		if(!rlzyPosition.getIsNewRecord()) {
			RlzyPosition t = rlzyPositionService.get(id);
			MyBeanUtils.copyBeanNotNull2Bean(rlzyPosition, t);
			rlzyPositionService.save(t);
		}
		return "1";
	}
	
	/**
	 * 发布职位-数据接口
	 * @param firmId
	 * @param rlzyposition
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="publishData")
	public String publishData(String firmId,RlzyPosition rlzyPosition) {
		if(rlzyPosition.getWelfaretype().equals("")) {
			rlzyPosition.setWelfaretype("0");
		}
		rlzyPosition.setCompanyid(firmId);
		rlzyPosition.setLine("1");
		rlzyPosition.setNum("0");
		rlzyPosition.setIsTop("1");
		rlzyPositionService.save(rlzyPosition);
		return "1";
	}
	
	/**
	 * 判断手机号是否存在
	 * @param model
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="check")
	public String check(Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String phone = request.getParameter("phone");
		RlzyCompany rlzyCompany = new 	RlzyCompany();
		rlzyCompany.setTelephone(phone);
		List<RlzyCompany> list = rlzyCompanyService.findList(rlzyCompany);
		if(list.size() > 0) {
			session.setAttribute("userId",list.get(0).getId());
			return "2";
		}else {
			return "3";
		}
	}
	
	
	/**
	 * 收藏职位
	 * @param firmId
	 * @param rlzyposition 职位表
	 * @return
	 */
	@RequestMapping(value="collectManage")
	public String collectManage(Model model,String firmId, RlzyPosition rlzyPosition, HttpServletRequest httpServletRequest) {
		model.addAttribute("firmId", firmId);
		return "/modules/home/company/collectManage";
	}
	
	/**
	 * 收藏职位-数据接口
	 * @param firmId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="companyCollect")
	public String companyCollect(String firmId,String page,String limit) {
		RlzyRelation rlzyRelation = new RlzyRelation();
		rlzyRelation.setCompanyid(firmId);
		rlzyRelation.setCompanycollectstate("1");
		rlzyRelation.setInvite("2");
		Page<RlzyRelation> rlzyRelations = new Page<RlzyRelation>();
		rlzyRelations.setPageNo(Integer.parseInt(page));
		rlzyRelations.setPageSize(Integer.parseInt(limit));
		Page<RlzyRelation> relationLists = rlzyRelationService.findPage(rlzyRelations, rlzyRelation);
		List<RlzyRelation> relationList = relationLists.getList();
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+relationLists.getCount()+"\",");
		jsonStr.append("\"data\":[");
		if(relationList.size() > 0) {
			for(int i=0;i<relationList.size();i++) {
				if(relationList.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"relationId\":\""+relationList.get(i).getId()+"\",");
					jsonStr.append("\"username\":\""+relationList.get(i).getUsername()+"\",");
					jsonStr.append("\"age\":\""+relationList.get(i).getAge()+"\",");
					jsonStr.append("\"sex\":\""+DictUtils.getDictLabel(relationList.get(i).getSex(), "sex","")+"\",");
					jsonStr.append("\"desiredposition\":\""+relationList.get(i).getDesiredposition()+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(relationList.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"currentstate\":\""+DictUtils.getDictLabel(relationList.get(i).getCurrentstate(), "current_state","")+"\",");
					jsonStr.append("\"invite\":\""+DictUtils.getDictLabel(relationList.get(i).getInvite(), "invite","")+"\",");
					jsonStr.append("\"invites\":\""+relationList.get(i).getInvite()+"\",");
					jsonStr.append("\"accept\":\""+DictUtils.getDictLabel(relationList.get(i).getAccept(), "accept","")+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"relationId\":\""+relationList.get(i).getId()+"\",");
					jsonStr.append("\"username\":\""+relationList.get(i).getUsername()+"\",");
					jsonStr.append("\"age\":\""+relationList.get(i).getAge()+"\",");
					jsonStr.append("\"sex\":\""+DictUtils.getDictLabel(relationList.get(i).getSex(), "sex","")+"\",");
					jsonStr.append("\"desiredposition\":\""+relationList.get(i).getDesiredposition()+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(relationList.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"currentstate\":\""+DictUtils.getDictLabel(relationList.get(i).getCurrentstate(), "current_state","")+"\",");
					jsonStr.append("\"invite\":\""+DictUtils.getDictLabel(relationList.get(i).getInvite(), "invite","")+"\",");
					jsonStr.append("\"invites\":\""+relationList.get(i).getInvite()+"\",");
					jsonStr.append("\"accept\":\""+DictUtils.getDictLabel(relationList.get(i).getAccept(), "accept","")+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}
	
	/**
	 * 收藏职位-邀请按钮
	 * @param id
	 * @return
	 */
	@RequestMapping(value="collectManageYq")
	public String collectManageYq(String id, Model model) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		String companyId = rlzyRelation.getCompanyid();
		//准确薪资
		String salary = rlzyRelation.getDesiredsalary();
		rlzyRelation.setSalary(salary);
		rlzyRelationService.save(rlzyRelation);
		RlzyPosition rlzyPosition = new RlzyPosition();
		rlzyPosition.setCompanyid(companyId);
		List<RlzyPosition> list = rlzyPositionService.findList(rlzyPosition);
		model.addAttribute("list", list);
		model.addAttribute("id",id);
		return "/modules/home/company/confirmPosition";
	}
	
	/**
	 * 收藏职位-取消收藏按钮
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="collectManageC")
	public String collectManageC(String id) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		rlzyRelation.setCollectionstate("2");
		rlzyRelationService.save(rlzyRelation);
		return "1";
	}
	
	/**
	 * 收藏职位-删除按钮  逻辑删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="collectManageDel")
	public String collectManageDel(String id) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		List<RlzyRelation> list = new ArrayList<>();
		list.add(rlzyRelation);
		rlzyRelationService.deleteAllByLogic(list);
		return "1";
	}
	
	/**
	 * 收到简历
	 * @param firmId
	 * @param rlzyposition
	 * @return
	 */
	@RequestMapping(value="receiveResume")
	public String receiveResume(Model model,String firmId, RlzyPosition rlzyPosition) {
		model.addAttribute("firmId", firmId);
		return "/modules/home/company/receiveResume";
	}
	
	/**
	 * 收到简历-数据查询
	 * @param firmId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="receiveResumeData")
	public String receiveResumeData(String firmId,String page,String limit) {
		RlzyRelation rlzyRelation = new RlzyRelation();
		rlzyRelation.setCompanyid(firmId);
		rlzyRelation.setDeliverystate("1");
		rlzyRelation.setInvite("2");
		Page<RlzyRelation> rlzyRelationss = new Page<RlzyRelation>();
		rlzyRelationss.setPageNo(Integer.parseInt(page));
		rlzyRelationss.setPageSize(Integer.parseInt(limit));
		Page<RlzyRelation> relationListss = rlzyRelationService.findPage(rlzyRelationss, rlzyRelation);
		List<RlzyRelation> relationLists = relationListss.getList();
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+relationListss.getCount()+"\",");
		jsonStr.append("\"data\":[");
		if(relationLists.size() > 0) {
			for(int i=0;i<relationLists.size();i++) {
				if(relationLists.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"relationId\":\""+relationLists.get(i).getId()+"\",");
					jsonStr.append("\"positionname\":\""+relationLists.get(i).getPositionname()+"\",");
					jsonStr.append("\"username\":\""+relationLists.get(i).getUsername()+"\",");
					jsonStr.append("\"age\":\""+relationLists.get(i).getAge()+"\",");
					jsonStr.append("\"sex\":\""+DictUtils.getDictLabel(relationLists.get(i).getSex(), "sex","")+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(relationLists.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"currentstate\":\""+DictUtils.getDictLabel(relationLists.get(i).getCurrentstate(), "current_state","")+"\",");
					jsonStr.append("\"invite\":\""+DictUtils.getDictLabel(relationLists.get(i).getInvite(), "invite","")+"\",");
					jsonStr.append("\"invites\":\""+relationLists.get(i).getInvite()+"\",");
					jsonStr.append("\"accept\":\""+DictUtils.getDictLabel(relationLists.get(i).getAccept(), "accept","")+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"relationId\":\""+relationLists.get(i).getId()+"\",");
					jsonStr.append("\"positionname\":\""+relationLists.get(i).getPositionname()+"\",");
					jsonStr.append("\"username\":\""+relationLists.get(i).getUsername()+"\",");
					jsonStr.append("\"age\":\""+relationLists.get(i).getAge()+"\",");
					jsonStr.append("\"sex\":\""+DictUtils.getDictLabel(relationLists.get(i).getSex(), "sex","")+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(relationLists.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"currentstate\":\""+DictUtils.getDictLabel(relationLists.get(i).getCurrentstate(), "current_state","")+"\",");
					jsonStr.append("\"invite\":\""+DictUtils.getDictLabel(relationLists.get(i).getInvite(), "invite","")+"\",");
					jsonStr.append("\"invites\":\""+relationLists.get(i).getInvite()+"\",");
					jsonStr.append("\"accept\":\""+DictUtils.getDictLabel(relationLists.get(i).getAccept(), "accept","")+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}
	
	
	/**
	 * 收到简历-删除按钮  逻辑删除
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="receiveResumeDataDel")
	public String receiveResumeDataDel(String id) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		List<RlzyRelation> list = new ArrayList<>();
		list.add(rlzyRelation);
		rlzyRelationService.deleteAllByLogic(list);
		return "1";
	}
	
	/**
	 * 收到简历-邀请按钮
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="receiveResumeDataYQ")
	public String receiveResumeDataYQ(String id) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		rlzyRelation.setInvite("1");
		rlzyRelation.setCompanydealstate("1");
		rlzyRelationService.save(rlzyRelation);
		return "1";
	}
	
	/**
	 * 企业信息
	 * @param firmId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="companyInfo")
	public String companyInfo(String firmId,Model model) {
		RlzyCompany rlzyCompany = rlzyCompanyService.get(firmId);
		
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
		model.addAttribute("pic", arrs);
		
		model.addAttribute("rlzyCompany",rlzyCompany);
		model.addAttribute("firmId",firmId);
		return "/modules/home/company/companyInfo";
	}
	
	/**
	 * 企业信息-修改保存
	 * @param firmId
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value="companyInfoData")
	public String companyInfoData(RlzyCompany rlzyCompany,String id) throws Exception {
		if(!rlzyCompany.getIsNewRecord()) {
			RlzyCompany t = rlzyCompanyService.get(id);
			MyBeanUtils.copyBeanNotNull2Bean(rlzyCompany, t);
			rlzyCompanyService.save(t);
		}
		return "1";
	}
	
	/**
	 * 企业账号管理
	 * @param firmId
	 * @param model
	 * @return
	 */
	@RequestMapping(value="companyAccount")
	public String companyAccount(String firmId,Model model) {
		RlzyCompany rlzyCompany = rlzyCompanyService.get(firmId);
		model.addAttribute("rlzyCompany",rlzyCompany);
		model.addAttribute("firmId",firmId);
		return "/modules/home/company/companyAccount";
	}
	
	/**
	 * 企业账号管理-手机号更改
	 * @param id
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="accountPhone")
	public String accountPhone(String id,String phone) {
		RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
		rlzyCompany.setTelephone(phone);
		rlzyCompanyService.save(rlzyCompany);
		return "1";
	}
	
	/**
	 * 企业账号管理-密码修改
	 * @param id
	 * @param pw
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="accountPassword")
	public String accountPassword(String id,String pw) {
		RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
		rlzyCompany.setPassword(pw);
		rlzyCompanyService.save(rlzyCompany);
		return "1";
	}
	
	/**
	 * 查看简历信息
	 * @return
	 */
	@RequestMapping(value="lookJob")
	public String lookJob(String id,Model model) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		String userId = rlzyRelation.getUserid();
		RlzyUser rlzyUser = rlzyUserService.get(userId);
		model.addAttribute("rlzyUser",rlzyUser);
		return "/modules/home/company/lookpersonal";
	}
	
	/**
	 * 查看人员信息
	 * @return
	 */
	@RequestMapping(value="lookCompany")
	public String lookCompany(String id,Model model) {
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		String userId = rlzyRelation.getUserid();
		RlzyUser rlzyUser = rlzyUserService.get(userId);
		model.addAttribute("rlzyUser",rlzyUser);
		return "/modules/home/company/lookpersonal";
	}
	
	/**
	 * 确认职位
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping(value="confirm")
	public String confirm(String id,String txt,String positionId,HttpServletRequest req) throws UnsupportedEncodingException {
		req.setCharacterEncoding("utf-8");
		RlzyRelation rlzyRelation = rlzyRelationService.get(id);
		rlzyRelation.setPositionname(txt);
		rlzyRelation.setPositionid(positionId);
		rlzyRelation.setInvite("1");
		rlzyRelationService.save(rlzyRelation);
		return "1";
	}
	
	/**
	 * 下线职位
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="offline")
	public String offline(String id) {
		RlzyPosition rlzyPosition = rlzyPositionService.get(id);
		rlzyPosition.setLine("2");
		rlzyPositionService.save(rlzyPosition);
		return "1";
	}
	
	/**
	 * 上线职位
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="upline")
	public String upline(String id) {
		RlzyPosition rlzyPosition = rlzyPositionService.get(id);
		rlzyPosition.setLine("1");
		rlzyPositionService.save(rlzyPosition);
		return "1";
	}
	
	/**
	 * 已邀请简历-数据查询
	 * @param firmId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="inviteResumeData")
	public String inviteResumeData(String firmId,String page,String limit) {
		RlzyRelation rlzyRelation = new RlzyRelation();
		rlzyRelation.setCompanyid(firmId);
		rlzyRelation.setInvite("1");
		Page<RlzyRelation> rlzyRelationss = new Page<RlzyRelation>();
		rlzyRelationss.setPageNo(Integer.parseInt(page));
		rlzyRelationss.setPageSize(Integer.parseInt(limit));
		Page<RlzyRelation> relationListss = rlzyRelationService.findPage(rlzyRelationss, rlzyRelation);
		List<RlzyRelation> relationLists = relationListss.getList();
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+relationListss.getCount()+"\",");
		jsonStr.append("\"data\":[");
		if(relationLists.size() > 0) {
			for(int i=0;i<relationLists.size();i++) {
				if(relationLists.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"relationId\":\""+relationLists.get(i).getId()+"\",");
					jsonStr.append("\"positionname\":\""+relationLists.get(i).getPositionname()+"\",");
					jsonStr.append("\"username\":\""+relationLists.get(i).getUsername()+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(relationLists.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"currentstate\":\""+DictUtils.getDictLabel(relationLists.get(i).getCurrentstate(), "current_state","")+"\",");
					jsonStr.append("\"accept\":\""+DictUtils.getDictLabel(relationLists.get(i).getAccept(), "accept","")+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"relationId\":\""+relationLists.get(i).getId()+"\",");
					jsonStr.append("\"positionname\":\""+relationLists.get(i).getPositionname()+"\",");
					jsonStr.append("\"username\":\""+relationLists.get(i).getUsername()+"\",");
					jsonStr.append("\"workingage\":\""+DictUtils.getDictLabel(relationLists.get(i).getWorkingage(), "working_age","")+"\",");
					jsonStr.append("\"currentstate\":\""+DictUtils.getDictLabel(relationLists.get(i).getCurrentstate(), "current_state","")+"\",");
					jsonStr.append("\"accept\":\""+DictUtils.getDictLabel(relationLists.get(i).getAccept(), "accept","")+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}
	

	/**
	 * 公司数据详情
	 * @return
	 */
	@RequestMapping(value="companyData")
	public String companyData(String id,Model model) {
		RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
		String str = rlzyCompany.getCasepic();
		String[] arr = null;
		if(StringUtils.isNotBlank(str)) {
			arr = str.split("\\|");
		}
		model.addAttribute("arr",arr);
		RlzyProduct rlzyProduct = new RlzyProduct();
		rlzyProduct.setCompanyid(id);
		List<RlzyProduct> list = rlzyProductService.findList(rlzyProduct);
		if(list.size() > 0) {
			model.addAttribute("list",list);
		}
		model.addAttribute("rlzyCompany",rlzyCompany);
		return "/modules/home/company/companyData";
	}
	
	/**
	 * 产品页面
	 * @return
	 */
	@RequestMapping(value="productPage")
	public String productPage(String firmId,Model model) {
			model.addAttribute("companyId", firmId);
		return "/modules/home/company/productList";
	}
	
	/**
	 * 产品页面
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="productData")
	public String productData(String id,String page,String limit) {
		RlzyProduct rlzyProduct = new RlzyProduct();
		rlzyProduct.setCompanyid(id);
		Page<RlzyProduct> rlzyRlzyProductss = new Page<RlzyProduct>();
		rlzyRlzyProductss.setPageNo(Integer.parseInt(page));
		rlzyRlzyProductss.setPageSize(Integer.parseInt(limit));
		Page<RlzyProduct> rlzyRlzyProductLists = rlzyProductService.findPage(rlzyRlzyProductss, rlzyProduct);
		List<RlzyProduct> rlzyRlzyProductList = rlzyRlzyProductLists.getList();
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+rlzyRlzyProductLists.getCount()+"\",");
		jsonStr.append("\"data\":[");
		if(rlzyRlzyProductList.size() > 0) {
			for(int i=0;i<rlzyRlzyProductList.size();i++) {
				RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
				if(rlzyRlzyProductList.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"productId\":\""+rlzyRlzyProductList.get(i).getId()+"\",");
					jsonStr.append("\"companyName\":\""+rlzyCompany.getCompanyname()+"\",");
					jsonStr.append("\"title\":\""+rlzyRlzyProductList.get(i).getTitle()+"\",");
					jsonStr.append("\"intro\":\""+rlzyRlzyProductList.get(i).getIntro()+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"productId\":\""+rlzyRlzyProductList.get(i).getId()+"\",");
					jsonStr.append("\"companyName\":\""+rlzyCompany.getCompanyname()+"\",");
					jsonStr.append("\"title\":\""+rlzyRlzyProductList.get(i).getTitle()+"\",");
					jsonStr.append("\"intro\":\""+rlzyRlzyProductList.get(i).getIntro()+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}
	
	/**
	 * 产品页面-新增
	 * @return
	 */
	@RequestMapping(value="publishProduct")
	public String publishProduct(String id,Model model) {
			model.addAttribute("id",id);
		return "/modules/home/company/publishProduct";
	}
	
	/**
	 * 发布产品-保存
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="saveProduct")
	public String saveProduct(RlzyProduct rlzyProduct) {
		rlzyProductService.save(rlzyProduct);
		return "1";
	}
	
	/**
	 * 产品页面-修改
	 * @return
	 */
	@RequestMapping(value="editProduct")
	public String editProduct(String id,Model model) {
			RlzyProduct rlzyProduct = rlzyProductService.get(id);
			model.addAttribute("rlzyProduct",rlzyProduct);
		return "/modules/home/company/editProduct";
	}
	
	/**
	 * 产品页面-修改-保存
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value="editProductSave")
	public String editProductSave(String id,RlzyProduct rlzyProduct) throws Exception {
		if (!rlzyProduct.getIsNewRecord()) {
			RlzyProduct t = rlzyProductService.get(id);
			MyBeanUtils.copyBeanNotNull2Bean(rlzyProduct, t);
			rlzyProductService.save(t);
		}
		return "1";
	}
	
	/**
	 * 产品页面-修改-删除
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value="editProductDel")
	public String editProductDel(String id){
		RlzyProduct rlzyProduct = rlzyProductService.get(id);
		List<RlzyProduct> list = new ArrayList<>();
		list.add(rlzyProduct);
		rlzyProductService.deleteAllByLogic(list);
		return "1";
	}
	
	
	//合作企业
	
	/**
	 * 合作企业页面
	 * @return
	 */
	@RequestMapping(value="cooperationPage")
	public String cooperationPage(String firmId,Model model) {
			model.addAttribute("companyId", firmId);
		return "/modules/home/company/companyslist";
	}
	
	/**
	 * 合作企业页面
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="cooperationData")
	public String cooperationData(String id,String page,String limit) {
		RlzyCooperation rlzyCooperation = new RlzyCooperation();
		rlzyCooperation.setCompanyid(id);
		Page<RlzyCooperation> rlzyCooperations = new Page<RlzyCooperation>();
		rlzyCooperations.setPageNo(Integer.parseInt(page));
		rlzyCooperations.setPageSize(Integer.parseInt(limit));
		Page<RlzyCooperation> rlzyCooperationLists = rlzyCooperationService.findPage(rlzyCooperations, rlzyCooperation);
		List<RlzyCooperation> rlzyCooperationList = rlzyCooperationLists.getList();
		StringBuffer jsonStr = new StringBuffer();
		jsonStr.append("{\"code\":\"0\",");
		jsonStr.append("\"msg\":\"0\",");
		jsonStr.append("\"count\":\""+rlzyCooperationLists.getCount()+"\",");
		jsonStr.append("\"data\":[");
		if(rlzyCooperationList.size() > 0) {
			for(int i=0;i<rlzyCooperationList.size();i++) {
				if(rlzyCooperationList.size()-i==1) {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"cooperationId\":\""+rlzyCooperationList.get(i).getId()+"\",");
					jsonStr.append("\"companyName\":\""+rlzyCooperationList.get(i).getCompanyname()+"\",");
					jsonStr.append("\"address\":\""+rlzyCooperationList.get(i).getAddress()+"\",");
					jsonStr.append("\"contact\":\""+rlzyCooperationList.get(i).getContacts()+"\",");
					jsonStr.append("\"registeredcapital\":\""+rlzyCooperationList.get(i).getRegisteredcapital()+"\",");
					jsonStr.append("\"companyprofile\":\""+rlzyCooperationList.get(i).getCompanyprofile()+"\"");
					jsonStr.append("}");
				}else {
					jsonStr.append("{\"id\":\""+i+"\",");
					jsonStr.append("\"cooperationId\":\""+rlzyCooperationList.get(i).getId()+"\",");
					jsonStr.append("\"companyName\":\""+rlzyCooperationList.get(i).getCompanyname()+"\",");
					jsonStr.append("\"address\":\""+rlzyCooperationList.get(i).getAddress()+"\",");
					jsonStr.append("\"contact\":\""+rlzyCooperationList.get(i).getContacts()+"\",");
					jsonStr.append("\"registeredcapital\":\""+rlzyCooperationList.get(i).getRegisteredcapital()+"\",");
					jsonStr.append("\"companyprofile\":\""+rlzyCooperationList.get(i).getCompanyprofile()+"\"");
					jsonStr.append("},");
				}
			}
		}
		jsonStr.append("]}");
		return jsonStr.toString();
	}
	
	/**
	 * 查看-合作企业信息
	 * @return
	 */
	@RequestMapping(value="lookDetail")
	public String lookDetail(String id,Model model) {
		RlzyCooperation rlzyCooperation = rlzyCooperationService.get(id);
		model.addAttribute("rlzyCooperation",rlzyCooperation);
		return "/modules/home/company/editcompany";
	}
	
	/**
	 * 合作企业页面-新增
	 * @return
	 */
	@RequestMapping(value="publishCooperation")
	public String publishCooperation(String id,Model model) {
			RlzyCooperation rlzyCooperation = new RlzyCooperation();
			model.addAttribute("id",id);
			model.addAttribute("rlzyCooperation",rlzyCooperation);
		return "/modules/home/company/addcompany";
	}
	
	/**
	 * 合作企业-保存
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="saveCooperation")
	public String saveCooperation(RlzyCooperation rlzyCooperation) {
		rlzyCooperationService.save(rlzyCooperation);
		return "1";
	}
	
	
	/**
	 * 合作企业页面-修改-保存
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value="editCooperationSave")
	public String editCooperationSave(String id,RlzyCooperation rlzyCooperation) throws Exception {
		if (!rlzyCooperation.getIsNewRecord()) {
			RlzyCooperation t = rlzyCooperationService.get(id);
			MyBeanUtils.copyBeanNotNull2Bean(rlzyCooperation, t);
			rlzyCooperationService.save(t);
		}
		return "1";
	}
	
	/**
	 * 合作企业页面-修改-删除
	 * @return
	 * @throws Exception 
	 */
	@ResponseBody
	@RequestMapping(value="editCooperationDel")
	public String editCooperationDel(String id){
		RlzyCooperation rlzyCooperation =rlzyCooperationService.get(id);
		List<RlzyCooperation> list = new ArrayList<>();
		list.add(rlzyCooperation);
		rlzyCooperationService.deleteAllByLogic(list);
		return "1";
	}
	
	
	//合作人员
	
		/**
		 * 合作人员页面
		 * @return
		 */
		@RequestMapping(value="workerPage")
		public String workerPage(String firmId,Model model) {
				model.addAttribute("companyId", firmId);
			return "/modules/home/company/personlist";
		}
		
		/**
		 * 合作人员页面
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="workerData")
		public String workerData(String id,String page,String limit) {
			RlzyWorker rlzyWorker =new RlzyWorker();
			rlzyWorker.setCompanyid(id);
			Page<RlzyWorker> rlzyWorkers = new Page<RlzyWorker>();
			rlzyWorkers.setPageNo(Integer.parseInt(page));
			rlzyWorkers.setPageSize(Integer.parseInt(limit));
			Page<RlzyWorker> rlzyWorkeLists = rlzyWorkerService.findPage(rlzyWorkers, rlzyWorker);
			List<RlzyWorker> rlzyWorkerList = rlzyWorkeLists.getList();
			StringBuffer jsonStr = new StringBuffer();
			jsonStr.append("{\"code\":\"0\",");
			jsonStr.append("\"msg\":\"0\",");
			jsonStr.append("\"count\":\""+rlzyWorkeLists.getCount()+"\",");
			jsonStr.append("\"data\":[");
			if(rlzyWorkerList.size() > 0) {
				for(int i=0;i<rlzyWorkerList.size();i++) {
					if(rlzyWorkerList.size()-i==1) {
						jsonStr.append("{\"id\":\""+i+"\",");
						jsonStr.append("\"workerId\":\""+rlzyWorkerList.get(i).getId()+"\",");
						jsonStr.append("\"name\":\""+rlzyWorkerList.get(i).getName()+"\",");
						jsonStr.append("\"age\":\""+rlzyWorkerList.get(i).getAge()+"\",");
						jsonStr.append("\"sex\":\""+DictUtils.getDictLabel(rlzyWorkerList.get(i).getSex(), "sex","")+"\",");
						jsonStr.append("\"liveplace\":\""+rlzyWorkerList.get(i).getLiveplace()+"\",");
						jsonStr.append("\"phone\":\""+rlzyWorkerList.get(i).getPhone()+"\"");
						jsonStr.append("}");
					}else {
						jsonStr.append("{\"id\":\""+i+"\",");
						jsonStr.append("\"workerId\":\""+rlzyWorkerList.get(i).getId()+"\",");
						jsonStr.append("\"name\":\""+rlzyWorkerList.get(i).getName()+"\",");
						jsonStr.append("\"age\":\""+rlzyWorkerList.get(i).getAge()+"\",");
						jsonStr.append("\"sex\":\""+DictUtils.getDictLabel(rlzyWorkerList.get(i).getSex(), "sex","")+"\",");
						jsonStr.append("\"liveplace\":\""+rlzyWorkerList.get(i).getLiveplace()+"\",");
						jsonStr.append("\"phone\":\""+rlzyWorkerList.get(i).getPhone()+"\"");
						jsonStr.append("},");
					}
				}
			}
			jsonStr.append("]}");
			return jsonStr.toString();
		}
		
		/**
		 * 查看-合作企业信息
		 * @return
		 */
		@RequestMapping(value="workerDetail")
		public String workerDetail(String id,Model model) {
			RlzyWorker rlzyWorker =rlzyWorkerService.get(id);
			model.addAttribute("rlzyWorker",rlzyWorker);
			return "/modules/home/company/editperson";
		}
		
		/**
		 * 合作企业页面-新增
		 * @return
		 */
		@RequestMapping(value="publishWorker")
		public String publishWorker(String id,Model model) {
			RlzyWorker rlzyWorker = new RlzyWorker();
				model.addAttribute("id",id);
				model.addAttribute("rlzyWorker",rlzyWorker);
			return "/modules/home/company/addperson";
		}
		
		/**
		 * 发布合作企业-保存
		 * @return
		 */
		@ResponseBody
		@RequestMapping(value="saveWorker")
		public String saveWorker(RlzyWorker rlzyWorker) {
			rlzyWorkerService.save(rlzyWorker);
			return "1";
		}
		
		/**
		 * 合作企业页面-修改-保存
		 * @return
		 * @throws Exception 
		 */
		@ResponseBody
		@RequestMapping(value="editWorkerSave")
		public String editWorkerSave(String id,RlzyWorker rlzyWorker) throws Exception {
			if (!rlzyWorker.getIsNewRecord()) {
				RlzyWorker t =rlzyWorkerService.get(id);
				MyBeanUtils.copyBeanNotNull2Bean(rlzyWorker, t);
				rlzyWorkerService.save(t);
			}
			return "1";
		}
		
		/**
		 * 合作企业页面-修改-删除
		 * @return
		 * @throws Exception 
		 */
		@ResponseBody
		@RequestMapping(value="editWorkerDel")
		public String editWorkerDel(String id){
			RlzyWorker rlzyWorker =rlzyWorkerService.get(id);
			List<RlzyWorker> list = new ArrayList<>();
			list.add(rlzyWorker);
			rlzyWorkerService.deleteAllByLogic(list);
			return "1";
		}
}