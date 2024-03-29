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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jeeplus.common.utils.Encodes;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.portal.entity.News;
import com.jeeplus.modules.portal.entity.NewsModel;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.entity.RlzyResume;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.entity.Video;
import com.jeeplus.modules.portal.entity.VideoModel;
import com.jeeplus.modules.portal.service.NewsService;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyPositionService;
import com.jeeplus.modules.portal.service.RlzyRelationService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.portal.service.VideoModelService;
import com.jeeplus.modules.portal.service.VideoService;
import com.jeeplus.modules.sys.entity.DictValue;
import com.jeeplus.modules.sys.utils.DictUtils;

@Controller
@RequestMapping("/api")
public class ApiIndexController{

	@Autowired
	private NewsService newsService;
	@Autowired
	private VideoService videoService;
	@Autowired
	private RlzyCompanyService rlzyCompanyService;
	@Autowired
	private RlzyPositionService rlzyPositionService;
	@Autowired
	private VideoModelService videoModelService;
	@Autowired
	private RlzyUserService rlzyUserService;
	@Autowired
	private RlzyRelationService rlzyRelationService;
	/**
	 * 首页
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/index")
	public ReturnJson index(HttpServletResponse response) {
		response.addHeader("Content-Disposition", "inline");
		ReturnJson returnJson = new ReturnJson();
		Page<News> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(10);
		News news =new News();
		//轮播图
		NewsModel newsModel = new NewsModel();		
		newsModel.setId("bff3d13450f54bc880319e0831dfcfcd");
		news.setNewsModel(newsModel);
		List<News> bannerList = newsService.findList(news);
		
		/*//最新要闻
		newsModel.setId("7d4fecb7a48b487cab1e6fd1ab61129d");
		news.setNewsModel(newsModel);
		Page<News> zxywpage = newsService.findPage(page, news);

		//政策导读
		newsModel.setId("5ad717509e9b4cd6b10b608d6d17e709");
		news.setNewsModel(newsModel);
		page.setPageSize(5);
		Page<News> zcddpage = newsService.findPage(page, news);

		//视频
		Video video =new Video();
		Page<Video> videopage = new Page<Video>();
		videopage.setPageNo(1);
		videopage.setPageSize(10);
		videopage = videoService.findPage(videopage, video);
		*/
		//入驻企业
		RlzyCompany rlzyCompany =new RlzyCompany();
		rlzyCompany.setIstop("1");
		rlzyCompany.setReviewstate("0");
		Page<RlzyCompany> companypage = new Page<RlzyCompany>();
		companypage.setPageNo(1);
		companypage.setPageSize(12);
		companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("banner", bannerList);
		/*map.put("zxyw", zxywpage.getList());
		map.put("zcdd", zcddpage.getList());
		map.put("video", videopage.getList());*/
		map.put("company", companypage.getList());
		returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("成功");
		return returnJson;
	}
	
	/**
	 * 新闻列表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/newList")
	public ReturnJson newList(@RequestBody Map<String,String> pages) {
		ReturnJson returnJson = new ReturnJson();
		String pageNo= pages.get("pageNo");
		Page<News> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(10);
		News news =new News();
		NewsModel newsModel = new NewsModel();		
		//最新要闻
		newsModel.setId("7d4fecb7a48b487cab1e6fd1ab61129d");
		news.setNewsModel(newsModel);
		Page<News> zxywpage = newsService.findPage(page, news);

		//政策导读
		newsModel.setId("5ad717509e9b4cd6b10b608d6d17e709");
		news.setNewsModel(newsModel);
		page.setPageNo(Integer.parseInt(pageNo));
		Page<News> zcddpage = newsService.findPage(page, news);
		
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("zxyw", zxywpage.getList());
		map.put("zcdd", zcddpage.getList());
		map.put("count", zcddpage.getCount());
		returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("成功");
		return returnJson;
	}
	
	/**
	 * 新闻详情
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/newDetail")
	public ReturnJson newDetail(HttpServletRequest request,@RequestBody News news) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		if(StringUtils.isNotBlank(news.getId())) {
			news = newsService.get(news.getId());
			String content =Encodes.unescapeHtml(news.getContent());
			news.setContent(content);
			map.put("news", news);
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("查询成功");
		}else {
			returnJson.setStatus(false);
			returnJson.setMessage("参数传值为空");
		}
		return returnJson;
	}
	
	/**
	 * 视频列表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/videostudy")
	public ReturnJson videostudy(@RequestBody Map<String,String> videoList){
		ReturnJson returnJson = new ReturnJson();
		String pageNo =videoList.get("pageNo");
		String videoModeId =videoList.get("videoModeId");
		Video video =new Video();
		VideoModel videoModel = new VideoModel();
		Page<Video> pages = new Page<Video>();
		Page<Video> videoPage = new Page<Video>();
		pages.setPageNo(Integer.parseInt(pageNo));
		pages.setPageSize(10);
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<VideoModel> videoModelList = videoModelService.findList(videoModel);
		for (int i=0; i<videoModelList.size(); i++){
			VideoModel e = videoModelList.get(i);
			if(StringUtils.isBlank(e.getParentId()) || "0".equals(e.getParentId())){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("text", e.getName());
				List<Map<String, Object>> childList = Lists.newArrayList();
				List<VideoModel> childrenlist =videoModelService.getChildren(e.getId());
				for (int j=0; j<childrenlist.size(); j++){
					VideoModel ne = childrenlist.get(j);
					Map<String, Object> VideoModelChild = Maps.newHashMap();
					VideoModelChild.put("id", ne.getId());
					VideoModelChild.put("text", ne.getName());
					childList.add(VideoModelChild);
					List<Map<String, Object>> childListNext = Lists.newArrayList();
					List<VideoModel> childrenListNext =videoModelService.getChildren(ne.getId());
					for (int k=0; k<childrenListNext.size(); k++){
						VideoModel next = childrenListNext.get(k);
						Map<String, Object> VideoModelNewChild = Maps.newHashMap();
						VideoModelNewChild.put("id", next.getId());
						VideoModelNewChild.put("text", next.getName());
						childListNext.add(VideoModelNewChild);
					}
					VideoModelChild.put("VideoModelChildNext", childListNext);
				}
				map.put("VideoModelChild", childList);
				mapList.add(map);
			}
		}
		if(StringUtils.isBlank(videoModeId)) {
			videoModel.setId(videoModelList.get(0).getId());
			video.setVideoModel(videoModel);
			videoPage = videoService.findPage(pages, video);
		}else {
			videoModel.setId(videoModeId);
			video.setVideoModel(videoModel);
			videoPage = videoService.findPage(pages, video);
		}
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("video", videoPage.getList());
		map.put("count", videoPage.getCount());
		map.put("videoModelList", mapList);
		returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("成功");
		return returnJson;
	}
	
	/**
	 * 职位列表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/positionList")
	public ReturnJson positionList(@RequestBody RlzyPosition rlzyPositions) {
		ReturnJson returnJson = new ReturnJson();
		Page<RlzyPosition> page = new Page<>();
		Map<String,Object> map = new HashMap<String, Object>();
		List<DictValue> salary = DictUtils.getDictList("salary");
		List<DictValue> industry = DictUtils.getDictList("desired_industry");
		List<DictValue> companyscale = DictUtils.getDictList("company_scale");
		List<DictValue> companytype = DictUtils.getDictList("company_type");
		List<DictValue> education = DictUtils.getDictList("education");
		List<DictValue> utime = DictUtils.getDictList("u_time");
		page.setPageNo(Integer.parseInt(rlzyPositions.getPageNo()));
		page.setPageSize(10);
		rlzyPositions.setLine("1");
		Page<RlzyPosition> rlzyPositionList = rlzyPositionService.findPages(page, rlzyPositions);
		List<RlzyPosition> positionList = new ArrayList<>();
		for(RlzyPosition rlzyPosition : rlzyPositionList.getList()){
			RlzyCompany rlzyCompany = rlzyCompanyService.get(rlzyPosition.getCompanyid());
			rlzyPosition.setSpe3(rlzyCompany.getLogo());
			rlzyPosition.setPositiontype(DictUtils.getDictLabel(rlzyPosition.getPositiontype(), "work_nature", ""));
			rlzyPosition.setSalaryrange(DictUtils.getDictLabel(rlzyPosition.getSalaryrange(), "salary", ""));
			rlzyPosition.setEducation(DictUtils.getDictLabel(rlzyPosition.getEducation(), "education", ""));
			rlzyPosition.setWorkingage(DictUtils.getDictLabel(rlzyPosition.getWorkingage(), "working_age", ""));
			rlzyPosition.setAgerequirement(DictUtils.getDictLabel(rlzyPosition.getAgerequirement(), "age_range", ""));
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
							builder.append(",");
						}
						
					}
					rlzyPosition.setWelfaretype(builder.toString());
				}
			}
			positionList.add(rlzyPosition);
		}
		map.put("salary", salary);
		map.put("industry", industry);
		map.put("companyscale", companyscale);
		map.put("companytype", companytype);
		map.put("education", education);
		map.put("utime", utime);
		map.put("positionList", positionList);
		map.put("count", rlzyPositionList.getCount());
		returnJson.setMessage("查询成功");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		return returnJson;
	}
	
	/**
	 * 职位详情
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/positionDetail")
	public ReturnJson positionDetail(HttpServletRequest request,@RequestBody RlzyPosition rlzyPosition) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		rlzyPosition = rlzyPositionService.getRlzyPosition(rlzyPosition);
		rlzyPosition.setPositiontype(DictUtils.getDictLabel(rlzyPosition.getPositiontype(), "work_nature", ""));
		rlzyPosition.setSalaryrange(DictUtils.getDictLabel(rlzyPosition.getSalaryrange(), "salary", ""));
		rlzyPosition.setEducation(DictUtils.getDictLabel(rlzyPosition.getEducation(), "education", ""));
		rlzyPosition.setWorkingage(DictUtils.getDictLabel(rlzyPosition.getWorkingage(), "working_age", ""));
		rlzyPosition.setAgerequirement(DictUtils.getDictLabel(rlzyPosition.getAgerequirement(), "age_range", ""));
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
						builder.append(",");
					}
					
				}
				rlzyPosition.setWelfaretype(builder.toString());
			}
		}
    	String accessToken = request.getHeader("accessToken");
    	if(StringUtils.isNotBlank(accessToken)) {
    		String userId = TokenSign.getUserId(accessToken);
    		rlzyPosition.setUserid(userId);
    		int count = rlzyPositionService.findListCount(rlzyPosition);
    		int countsc = rlzyPositionService.findListCounts(rlzyPosition);
    		if(count>0) {
    			rlzyPosition.setCollectionstate("1");
    		}else {
    			rlzyPosition.setCollectionstate("0");
    		}
    		if(countsc>0) {
    			rlzyPosition.setDeliverystate("1");;
    		}else {
    			rlzyPosition.setDeliverystate("0");
    		}
    	}
		map.put("rlzyPosition", rlzyPosition);
		returnJson.setStatus(true);
		returnJson.setMessage("查询成功!");
		returnJson.setResult(map);
		return returnJson;
	}
	
	/**
	 * 职位收藏
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/positionCollect")
	public ReturnJson positionCollect(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyPosition rlzyPosition) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String token=request.getHeader("accessToken");
		String id=TokenSign.getUserId(token);
		rlzyPosition.setUserid(id);
		RlzyRelation rlzyRelation = new RlzyRelation();
		int count = rlzyPositionService.findListCount(rlzyPosition);
		if (count == 0) {
			RlzyUser rlzyUser = rlzyUserService.get(id);
			rlzyPosition = rlzyPositionService.get(rlzyPosition.getId());
			rlzyRelation.setUserid(id);
			rlzyRelation.setPositionid(rlzyPosition.getId());
			rlzyRelation.setCompanyid(rlzyPosition.getCompanyid());
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
			rlzyRelation.setPositionname(rlzyPosition.getPositionname());
			RlzyCompany rlzyCompany = rlzyCompanyService.get(rlzyPosition.getCompanyid());
			rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
			rlzyRelation.setWorkingplace(rlzyCompany.getAddress());
			//准确薪资
			rlzyRelation.setSalary(rlzyPosition.getSalaryrange());
			rlzyRelationService.save(rlzyRelation);
			map.put("flag", 0);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("收藏成功!");
		}else {
			map.put("flag", 1);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("您已收藏!");
		}
		return returnJson;
	}
	
	/**
	 * 职位申请
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/positionApply")
	public ReturnJson positionApply(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyPosition rlzyPosition) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String token=request.getHeader("accessToken");
		String id=TokenSign.getUserId(token);
		rlzyPosition.setUserid(id);
		RlzyRelation rlzyRelation = new RlzyRelation();
		int count = rlzyPositionService.findListCounts(rlzyPosition);
		if (count == 0) {
			RlzyUser rlzyUser = rlzyUserService.get(id);
			rlzyPosition = rlzyPositionService.get(rlzyPosition);
			int i = Integer.parseInt(rlzyPosition.getNum());
			rlzyRelation.setUserid(id);
			rlzyRelation.setCompanyid(rlzyPosition.getCompanyid());
			rlzyRelation.setPositionid(rlzyPosition.getId());
			// 邀请状态
			rlzyRelation.setInvite("2");
			//接受状态
			rlzyRelation.setAccept("1");
			// 投递状态
			rlzyRelation.setDeliverystate("1");
			rlzyRelation.setUsername(rlzyUser.getName());
			rlzyRelation.setPositionname(rlzyPosition.getPositionname());
			RlzyCompany rlzyCompany = rlzyCompanyService.get(rlzyPosition.getCompanyid());
			rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
			rlzyRelation.setWorkingplace(rlzyCompany.getAddress());
			rlzyRelation.setAge(rlzyUser.getAge());
			rlzyRelation.setSex(rlzyUser.getSex());
			rlzyRelation.setWorkingage(rlzyUser.getWorkingage());
			rlzyRelation.setCurrentstate(rlzyUser.getCurrentstate());
			//真实薪资
			rlzyRelation.setSalary(rlzyPosition.getSalaryrange());
			i = i + 1;
			rlzyPosition.setNum(String.valueOf(i));
			rlzyPositionService.save(rlzyPosition);
			rlzyRelationService.save(rlzyRelation);
			map.put("flag", 0);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("申请成功!");
		}else {
			map.put("flag", 1);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("您已申请!");
		}
		return returnJson;
	}
	
	/**
	 * 人才列表
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/talentList")
	public ReturnJson talentList(@RequestBody RlzyUser rlzyUser) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		Page<RlzyUser> page = new Page<>();
		page.setPageNo(Integer.parseInt(rlzyUser.getPageNo()));
		page.setPageSize(10);
		rlzyUser.setIspublic("1");
		List<DictValue> salary = DictUtils.getDictList("salary");
		List<DictValue> industry = DictUtils.getDictList("desired_industry");
		List<DictValue> major =DictUtils.getDictList("major");
		List<DictValue> sex = DictUtils.getDictList("sex");
		List<DictValue> worknature =DictUtils.getDictList("work_nature");
		List<DictValue> education =DictUtils.getDictList("education");
		List<DictValue> workingage =DictUtils.getDictList("working_age");
		List<DictValue> utime =DictUtils.getDictList("u_time");
		Page<RlzyUser>  rlzyUserList = rlzyUserService.findPage(page, rlzyUser);
		List<RlzyUser> list = new ArrayList<RlzyUser>();
		for(RlzyUser rlzyUsers : rlzyUserList.getList()) {
			rlzyUsers.setSex(DictUtils.getDictLabel(rlzyUsers.getSex(), "sex",""));
			rlzyUsers.setEducation(DictUtils.getDictLabel(rlzyUsers.getEducation(), "education",""));
			rlzyUsers.setWorkingage(DictUtils.getDictLabel(rlzyUsers.getWorkingage(), "working_age",""));
			rlzyUsers.setMajor(DictUtils.getDictLabel(rlzyUsers.getMajor(), "major",""));
			rlzyUsers.setCurrentstate(DictUtils.getDictLabel(rlzyUsers.getCurrentstate(), "current_state",""));
			rlzyUsers.setWorknature(DictUtils.getDictLabel(rlzyUsers.getWorknature(), "work_nature",""));
			rlzyUsers.setSalary(DictUtils.getDictLabel(rlzyUsers.getSalary(), "salary",""));
			rlzyUsers.setDesiredindustry(DictUtils.getDictLabel(rlzyUsers.getDesiredindustry(), "desired_industry",""));
			rlzyUsers.setIsmatch(DictUtils.getDictLabel(rlzyUsers.getIsmatch(), "is_match",""));
			rlzyUsers.setIspublic(DictUtils.getDictLabel(rlzyUsers.getIspublic(), "is_public",""));
			list.add(rlzyUsers);
		}
		map.put("salary", salary);
		map.put("industry", industry);
		map.put("major", major);
		map.put("sex", sex);
		map.put("worknature", worknature);
		map.put("education", education);
		map.put("workingage", workingage);
		map.put("utime", utime);
		map.put("rlzyUserList", list);
		map.put("count", rlzyUserList.getCount());
		returnJson.setStatus(true);
		returnJson.setMessage("查询成功!");
		returnJson.setResult(map);
		return returnJson;
	}
		
	/**
	 * 人才详情
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/talentDetail")
	public ReturnJson talentDetail(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyUser rlzyUser) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		List<RlzyPosition> rlzyPositionList =new ArrayList<RlzyPosition>();
		String token=request.getHeader("accessToken");
		if(StringUtils.isNotBlank(token)) {
			String companyid=TokenSign.getUserId(token);
			rlzyPositionList =rlzyPositionService.findPositionListById(companyid);
		}

		rlzyUser = rlzyUserService.getRlzyUser(rlzyUser);
		rlzyUser.setSex(DictUtils.getDictLabel(rlzyUser.getSex(), "sex",""));
		rlzyUser.setEducation(DictUtils.getDictLabel(rlzyUser.getEducation(), "education",""));
		rlzyUser.setWorkingage(DictUtils.getDictLabel(rlzyUser.getWorkingage(), "working_age",""));
		rlzyUser.setMajor(DictUtils.getDictLabel(rlzyUser.getMajor(), "major",""));
		rlzyUser.setCurrentstate(DictUtils.getDictLabel(rlzyUser.getCurrentstate(), "current_state",""));
		rlzyUser.setWorknature(DictUtils.getDictLabel(rlzyUser.getWorknature(), "work_nature",""));
		rlzyUser.setSalary(DictUtils.getDictLabel(rlzyUser.getSalary(), "salary",""));
		rlzyUser.setDesiredindustry(DictUtils.getDictLabel(rlzyUser.getDesiredindustry(), "desired_industry",""));
		rlzyUser.setIsmatch(DictUtils.getDictLabel(rlzyUser.getIsmatch(), "is_match",""));
		rlzyUser.setIspublic(DictUtils.getDictLabel(rlzyUser.getIspublic(), "is_public",""));
		List<RlzyResume> list1 = new ArrayList<RlzyResume>();
		List<RlzyResume> list2 = new ArrayList<RlzyResume>();
		List<RlzyResume> list3 = new ArrayList<RlzyResume>();
		List<RlzyResume> list4 = new ArrayList<RlzyResume>();
		if(rlzyUser.getRlzyResumeList().size() >0) {
			String flag = "0";
			for(RlzyResume rlzyResume :rlzyUser.getRlzyResumeList()) {
				 flag =rlzyResume.getExperiencetype();
				if("1".equals(flag)) {
					rlzyResume.setEducation(DictUtils.getDictLabel(rlzyResume.getEducation(), "education",""));
					list1.add(rlzyResume);
				}else if("2".equals(flag)) {
					list2.add(rlzyResume);
				}else if("3".equals(flag)) {
					list3.add(rlzyResume);
				}else {
					list4.add(rlzyResume);
				}
			}
		}
		String accessToken = request.getHeader("accessToken");
    	if(StringUtils.isNotBlank(accessToken)) {
    		String companyid = TokenSign.getUserId(accessToken);
    		rlzyUser.setCompanyid(companyid);
    		rlzyUser.setUserid(rlzyUser.getId());
    		int count = rlzyUserService.findListCount(rlzyUser);
    		int countyq = rlzyUserService.findListCounts(rlzyUser);
    		if(count>0) {
    			rlzyUser.setCollectionstate("1");
    		}else {
    			rlzyUser.setCollectionstate("0");
    		}
    		if(countyq>0) {
    			rlzyUser.setInvite("1");
    		}else {
    			rlzyUser.setInvite("0");
    		}
    	}
		map.put("rlzyPositionList",rlzyPositionList);
		map.put("rlzyUser",rlzyUser);
		map.put("list1", list1);
		map.put("list2", list2);
		map.put("list3", list3);
		map.put("list4", list4);
	    returnJson.setStatus(true);
	    returnJson.setResult(map);
		returnJson.setMessage("success");
		return returnJson;
	}
	
	/**
	 * 人才收藏
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/talentCollect")
	public ReturnJson talentCollect(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyUser rlzyUser) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String token=request.getHeader("accessToken");
		String id=TokenSign.getUserId(token);
		RlzyRelation rlzyRelation = new RlzyRelation();
		rlzyUser.setUserid(rlzyUser.getId());
		rlzyUser.setCompanyid(id);
		int count = rlzyUserService.findListCount(rlzyUser);
		if(count == 0){
			RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
			rlzyUser =rlzyUserService.get(rlzyUser.getId());
			rlzyRelation.setUserid(rlzyUser.getId());
			rlzyRelation.setCompanyid(id);
			rlzyRelation.setCompanycollectstate("1");
			rlzyRelation.setInvite("2");
			rlzyRelation.setAccept("1");
			rlzyRelation.setCompanydealstate("1");
			rlzyRelation.setUsername(rlzyUser.getName());
			rlzyRelation.setAge(rlzyUser.getAge());
			rlzyRelation.setSex(rlzyUser.getSex());
			rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
			rlzyRelation.setWorkingage(rlzyUser.getWorkingage());
			rlzyRelation.setWorkingplace(rlzyCompany.getAddress());
			rlzyRelation.setDesiredposition(rlzyUser.getDesiredposition());
			rlzyRelation.setCurrentstate(rlzyUser.getCurrentstate());
			//期望薪资
			rlzyRelation.setDesiredsalary(rlzyUser.getSalary());
			rlzyRelationService.save(rlzyRelation);
			map.put("flag", 0);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("收藏成功!");
		}else {
			map.put("flag", 1);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("您已收藏!");
		}
		return returnJson;
	}
	
	
	/**
	 * 人才邀请
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/talentInvite")
	public ReturnJson talentInvite(HttpServletRequest request,HttpServletResponse response,@RequestBody RlzyUser rlzyUser) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String token=request.getHeader("accessToken");
		String id=TokenSign.getUserId(token);
		String positionid=rlzyUser.getPositionid();
		rlzyUser = rlzyUserService.get(rlzyUser.getId());
		RlzyPosition rlzyPosition = rlzyPositionService.get(positionid);
		RlzyRelation rlzyRelation = new RlzyRelation();
		rlzyUser.setUserid(rlzyUser.getId());
		rlzyUser.setCompanyid(id);
		int count = rlzyUserService.findListCounts(rlzyUser);
		if(count == 0){
			RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
			rlzyRelation.setUserid(rlzyUser.getId());
			rlzyRelation.setCompanyid(id);
			rlzyRelation.setInvite("1");
			rlzyRelation.setAccept("1");
			rlzyRelation.setCompanydealstate("1");
			rlzyRelation.setPositionid(rlzyPosition.getId());
			rlzyRelation.setPositionname(rlzyPosition.getPositionname());
			rlzyRelation.setUsername(rlzyUser.getName());
			rlzyRelation.setAge(rlzyUser.getAge());
			rlzyRelation.setSex(rlzyUser.getSex());
			rlzyRelation.setCompanyname(rlzyCompany.getCompanyname());
			rlzyRelation.setWorkingplace(rlzyCompany.getAddress());
			rlzyRelation.setWorkingage(rlzyUser.getWorkingage());
			rlzyRelation.setDesiredposition(rlzyUser.getDesiredposition());
			rlzyRelation.setSalary(rlzyPosition.getSalaryrange());
			//准确薪资
			rlzyRelation.setDesiredsalary(rlzyUser.getSalary());
			rlzyRelation.setCurrentstate(rlzyUser.getCurrentstate());
			rlzyRelationService.save(rlzyRelation);
			map.put("flag", 0);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("邀请成功!");
		}else {
			map.put("flag", 1);
			returnJson.setResult(map);
			returnJson.setStatus(true);
			returnJson.setMessage("您已邀请成功!");
		}
		return returnJson;
	}
	
	/**
	 * 园区服务
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/parkServer")
	public ReturnJson parkServer(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String id = loginmap.get("id");
		String pageNo = loginmap.get("pageNo");
		RlzyCompany rlzyCompany = new RlzyCompany();
		rlzyCompany.setServiceType(id);
		rlzyCompany.setReviewstate("0");
		rlzyCompany.setCompanytype("2");
		rlzyCompany.setIspublic("1");
		Page<RlzyCompany> companypage = new Page<RlzyCompany>();
		companypage.setPageNo(Integer.parseInt(pageNo));
		companypage.setPageSize(10);
		companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);
		for(RlzyCompany RlzyCompany:companypage.getList()){
			String content =Encodes.unescapeHtml(RlzyCompany.getServicerange());
			RlzyCompany.setServicerange(content);
			String pic = RlzyCompany.getCasepic();
			if(pic != null && pic != ""){
			String[] arr = StringUtils.split(pic, "\\|");
			if(arr.length >= 2){
				RlzyCompany.setCasepic(arr[0]);
				RlzyCompany.setSpe3(arr[1]);
			}else if(arr.length == 1){
				RlzyCompany.setCasepic(arr[0]);
				RlzyCompany.setSpe3("");
			}else{
				RlzyCompany.setCasepic("");
				RlzyCompany.setSpe3("");
			}
			}
		}
		map.put("companypage", companypage);
		returnJson.setResult(map);
		returnJson.setStatus(true);
		returnJson.setMessage("success");
		return returnJson;
	}
	

	/**
	 * 服务详情
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/parkSeverDate")
	public ReturnJson parkSeverDate(HttpServletRequest request,HttpServletResponse response,@RequestBody Map<String,String> loginmap) {
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String companyId = loginmap.get("companyId");
		RlzyCompany rlzyCompany = rlzyCompanyService.get(companyId);
		
		String content =Encodes.unescapeHtml(rlzyCompany.getServicerange());
		rlzyCompany.setServicerange(content);
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
        map.put("pic",arrs);
		map.put("rlzyCompany", rlzyCompany);
		returnJson.setStatus(true);
		returnJson.setMessage("success");
		returnJson.setResult(map);
		return returnJson;
	}
	
	/**
	 * app判断token是否为空
	 */
	@ResponseBody
	@RequestMapping(value="checkToken")
	public ReturnJson checkToken(HttpServletRequest request,HttpServletResponse response) {
		String accessToken = request.getHeader("accessToken");
		Map<String,Object> map = new HashMap<String, Object>();
		ReturnJson returnJson = new ReturnJson();
		if(StringUtils.isNotBlank(accessToken)) {
			String userId = TokenSign.getUserId(accessToken);
			RlzyCompany rlzyCompany = new RlzyCompany();
			rlzyCompany.setId(userId);
			List<RlzyCompany> list = rlzyCompanyService.findList(rlzyCompany);
			if(list.size() > 0) {
				map.put("id",list.get(0).getId());
				map.put("name",list.get(0).getCompanyname());
				map.put("logo",list.get(0).getLogo());
				map.put("type",list.get(0).getCpflag());
				map.put("password",list.get(0).getPassword());
				map.put("telphone",list.get(0).getTelephone());
				map.put("accessToken",accessToken);
				RlzyRelation rlzyRelation = new RlzyRelation();
			    rlzyRelation.setCompanyid(list.get(0).getId());
			    rlzyRelation.setCollectionstate("1");
			    int resumenum = rlzyRelationService.companyResume(rlzyRelation);
			    RlzyRelation rlzyRelationResume = new RlzyRelation();
			    rlzyRelationResume.setCompanyid(list.get(0).getId());
			    rlzyRelationResume.setDeliverystate("1");
			    int invitenum = rlzyRelationService.companyInvite(rlzyRelationResume);
			    map.put("resumenum",String.valueOf(resumenum));
			    map.put("invitenum",String.valueOf(invitenum));
			}else {
				RlzyUser rlzyUser = new RlzyUser();
				rlzyUser.setId(userId);
				List<RlzyUser> lists = rlzyUserService.findList(rlzyUser);
				if(lists.size() > 0) {
					map.put("id",lists.get(0).getId());
					map.put("name",lists.get(0).getName());
					map.put("logo",lists.get(0).getPhoto());
					map.put("type",lists.get(0).getCpflag());
					map.put("password",lists.get(0).getPassword());
					map.put("phone",lists.get(0).getPhone());
					map.put("accessToken",accessToken);
					RlzyRelation rlzyRelation = new RlzyRelation();
			        rlzyRelation.setUserid(lists.get(0).getId());
			    	rlzyRelation.setCollectionstate("1");
			    	int collectnum = rlzyRelationService.personalCollect(rlzyRelation);
			    	RlzyRelation rlzyRelationResume = new RlzyRelation();
			    	rlzyRelationResume.setUserid(lists.get(0).getId());
			    	rlzyRelationResume.setDeliverystate("1");
			    	int resumenum = rlzyRelationService.personalResume(rlzyRelationResume);
			    	RlzyRelation rlzyRelationInvite = new RlzyRelation();
			    	rlzyRelationInvite.setUserid(lists.get(0).getId());
			    	rlzyRelationInvite.setCompanydealstate("1");
			    	rlzyRelationInvite.setInvite("1");
			    	int invitenum = rlzyRelationService.personalInvite(rlzyRelationInvite);
			    	map.put("collectnum",String.valueOf(collectnum));
			    	map.put("resumenum",String.valueOf(resumenum));
			    	map.put("invitenum",String.valueOf(invitenum));
				}
			}
			returnJson.setStatus(true);
			returnJson.setResult(map);
			returnJson.setMessage("success");
			return returnJson;
		}
		returnJson.setStatus(false);
		returnJson.setMessage("false");
		return returnJson;
	}
}