package com.jeeplus.modules.home.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.common.utils.CookieUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.modules.home.utils.SmsCodeUtil;
import com.jeeplus.modules.home.web.exception.SmsException;
import com.jeeplus.modules.portal.entity.News;
import com.jeeplus.modules.portal.entity.NewsModel;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyPosition;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.entity.Video;
import com.jeeplus.modules.portal.entity.VideoModel;
import com.jeeplus.modules.portal.service.NewsModelService;
import com.jeeplus.modules.portal.service.NewsService;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyPositionService;
import com.jeeplus.modules.portal.service.RlzyUserService;
import com.jeeplus.modules.portal.service.VideoModelService;
import com.jeeplus.modules.portal.service.VideoService;

/**
 * home首页控制层
 * 
 * @author 胡林斐
 * @Date 2019-11-12 14:25:17    
 */
@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	NewsService newsService;
	
	@Autowired
	NewsModelService newsModelService;
	
	@Autowired
	private RlzyUserService rlzyUserService;
	
	@Autowired
	private RlzyCompanyService rlzyCompanyService;
	
	@Autowired
	private VideoService videoService;
	
	@Autowired
	private VideoModelService videoModelService;
	
	@Autowired
	private RlzyPositionService rlzyPositionService;
	
	/**
	 * 新闻查询
	 * @param model
	 * @param news
	 * @return
	 */
	@RequestMapping("/index")
	public String getList(Model model,News news,HttpServletRequest request,RlzyPosition rlzyPosition) {
		String users = CookieUtils.getCookie(request, "user");
		Page<News> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(10);
		//轮播图
		NewsModel newsModel = new NewsModel();		
		newsModel.setId("bff3d13450f54bc880319e0831dfcfcd");
		news.setNewsModel(newsModel);
		List<News> bannerList = newsService.findList(news);
		//首页飘窗
	    newsModel.setId("98b0c7274b404103937b6072392db651");
	    news.setNewsModel(newsModel);
	    List<News> bannerLists = newsService.findList(news);
		//园区动态
		newsModel.setId("5ad717509e9b4cd6b10b608d6d17e709");
		news.setNewsModel(newsModel);
		List<News> yqdtlist= newsService.findPage(page, news).getList();

		//政策导读
		newsModel.setId("7d4fecb7a48b487cab1e6fd1ab61129d");
		news.setNewsModel(newsModel);
		List<News> zcddlist= newsService.findPage(page, news).getList();

		//视频
		Video video =new Video();
		Page<Video> videopage = new Page<Video>();
		videopage.setPageNo(1);
		videopage.setPageSize(10);
		videopage = videoService.findPage(videopage, video);
		
		/*//入驻企业
		RlzyCompany rlzyCompany =new RlzyCompany();
		Page<RlzyCompany> companypage = new Page<RlzyCompany>();
		companypage.setPageNo(1);
		companypage.setPageSize(8);
		companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);*/
		//入驻企业
	    RlzyCompany rlzyCompany =new RlzyCompany();
	    rlzyCompany.setIstop("1");
	    rlzyCompany.setReviewstate("0");
	    Page<RlzyCompany> companypage = new Page<RlzyCompany>();
	    companypage.setPageNo(1);
	    companypage.setPageSize(8);
	    companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);
		
		//急聘岗位
		rlzyPosition.setPostflag("1");
		rlzyPosition.setLine("1");
		List<RlzyPosition> findList = rlzyPositionService.findListHome(rlzyPosition);
		List<RlzyPosition> findListHome = new ArrayList<RlzyPosition>();
		for (RlzyPosition position : findList) {
			if(StringUtils.isBlank(users)) {
				position.setStatus("0");
			}
			findListHome.add(position);
		}
		//最新岗位
		List<RlzyPosition> findDescsnewList = rlzyPositionService.findDescsList(rlzyPosition);
		List<RlzyPosition> findDescsList = new ArrayList<RlzyPosition>();
		for (RlzyPosition position : findDescsnewList) {
			if(StringUtils.isBlank(users)) {
				position.setStatus("0");
			}
			findDescsList.add(position);
		}
		//招聘会
		newsModel.setId("100f08b3c8ac4455a7950d12d409e65c");
		news.setNewsModel(newsModel);
		news.setIsTop("1");
		List<News> zphlist = newsService.findPage(page, news).getList();
		
		model.addAttribute("bannerList", bannerList);
		model.addAttribute("bannerLists", bannerLists);
		model.addAttribute("yqdtlist", yqdtlist);
		model.addAttribute("zcddlist", zcddlist);
		model.addAttribute("videolist", videopage.getList());
		model.addAttribute("companylist", companypage.getList());
		model.addAttribute("findListHome",findListHome);
		model.addAttribute("findDescsList",findDescsList);
		model.addAttribute("zphlist",zphlist);
		return "modules/home/index";
		
	}
	
	/**
	 * 注册
	 * @param model
	 * @param news
	 * @return
	 */
	@RequestMapping("/register")
	 public String register(Model model,News news) {
//	  NewsModel newsModel = new NewsModel();  
//	  newsModel.setId("eb552e9a00294d01a3c27514601c96e4");
//	  news.setNewsModel(newsModel);
//	  List<News> parkSurveyList = newsService.findList(news);
//	  model.addAttribute("news", parkSurveyList.get(0));
	  return "modules/home/register";
	 }
	/**
	 * 退出
	 * @return
	 */
	@RequestMapping("/quit")
	public String quit(Model model,HttpServletRequest request,HttpServletResponse response) {
		String json=CookieUtils.getCookie(request, "user");
		CookieUtils.setCookie(response,"user",json,0);
		return "redirect:/login/tologin";
	}
	
	/**
	 * 服务详情
	 * @return
	 */
	@RequestMapping("/parkSeverDate")
	public String parkSeverDate(Model model,HttpServletRequest request,HttpServletResponse response,String id) {
		RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
		model.addAttribute("rlzyCompany", rlzyCompany);
		return "modules/home/parkServiceData";
	}
	
	/**
	 * 企业入驻流程
	 * @return
	 */
/*	@RequestMapping("/companyGarrison")
	public String companyGarrison(Model model,News news) {
		NewsModel newsModel = new NewsModel();		
		newsModel.setId("2e61c1ac87dd4c3eb49809afa8bdcee7");
		news.setNewsModel(newsModel);
		List<News> companyContext = newsService.findList(news);
		model.addAttribute("company", companyContext.get(0));
		return "modules/home/companyGarrison";
	}*/

	/**
	 * 企业列表
	 * @return
	 */
	/*@RequestMapping("/companyList")
	public String companyGarrisonList(Model model,RlzyCompany rlzyCompany) {
		Page<RlzyCompany> companypage = new Page<RlzyCompany>();
		companypage.setPageNo(1);
		companypage.setPageSize(10);
		companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);
		return "modules/home/companyList";
	}*/
	
	/**
	 * 企业详情
	 * @return
	 */
	@RequestMapping("/companyDetail")
	public String companyDetail(Model model,String id) {
	  RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
	  String[] arr = (rlzyCompany.getCasepic()).split("\\|");
	  model.addAttribute("photo", arr);
	  model.addAttribute("rlzyCompany",rlzyCompany);
	  return "modules/home/companyDetail";
	}
	
	/**
	  * 园区服务
	  * @return
	  */
	 @RequestMapping("/parkServer")
	 public String parkServer(Model model,RlzyCompany rlzyCompany) {
	  rlzyCompany.setReviewstate("0");
	  rlzyCompany.setServiceType("1");
	  rlzyCompany.setCompanytype("2");
	  rlzyCompany.setIspublic("1");
	  Page<RlzyCompany> companypage = new Page<RlzyCompany>();
	  companypage.setPageNo(1);
	  companypage.setPageSize(10);
	  companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);
	  for(RlzyCompany RlzyCompany:companypage.getList()){
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
	  model.addAttribute("companypage",companypage);
	  return "modules/home/parkServer";
	 }
	 
	 @ResponseBody
	 @RequestMapping("/parkList")
	 public Page<RlzyCompany> parkList(String id,String page,String pageSize){
	  RlzyCompany rlzyCompany = new RlzyCompany();
	  rlzyCompany.setServiceType(id);
	  rlzyCompany.setReviewstate("0");
	  rlzyCompany.setCompanytype("2");
	  rlzyCompany.setIspublic("1");
	  Page<RlzyCompany> companypage = new Page<RlzyCompany>();
	  companypage.setPageNo(1);
	  companypage.setPageSize(10);
	  companypage =rlzyCompanyService.findPage(companypage, rlzyCompany);
	  for(RlzyCompany RlzyCompany:companypage.getList()){
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
	  return companypage;
	 }
	
	
	/**
	 * 园区概况
	 * @param model
	 * @param news
	 * @return
	 */
	@RequestMapping("/parkSurvey")
	public String parkSurvey(Model model,News news) {
		NewsModel newsModel = new NewsModel();		
		newsModel.setId("c7ff777826904acd91c6265d199c5807");
		news.setNewsModel(newsModel);
		List<News> parkSurveyList = newsService.findList(news);
		model.addAttribute("news", parkSurveyList.get(0));
		return "modules/home/parkSurvey";
	}
	
	/**
	 * 关于我们
	 * @param model
	 * @param news
	 * @return
	 */
	@RequestMapping("/aboutUs")
	public String aboutUs(Model model,News news) {
		NewsModel newsModel = new NewsModel();		
		newsModel.setId("acab751345e54471b06e43218513139b");
		news.setNewsModel(newsModel);
		List<News> parkSurveyList = newsService.findList(news);
		model.addAttribute("news", parkSurveyList.get(0));
		return "modules/home/aboutUs";
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
		RlzyUser rlzyUser = new RlzyUser();
		rlzyUser.setPhone(phone);
		List<RlzyUser> list = rlzyUserService.findList(rlzyUser);
		if(list.size() > 0) {
			session.setAttribute("userId",list.get(0).getId());
			return "2";
		}else {
			RlzyCompany rlzyCompany =new RlzyCompany();
			rlzyCompany.setTelephone(phone);
			List<RlzyCompany> rlzyCompanyList = rlzyCompanyService.findList(rlzyCompany);
			if(rlzyCompanyList.size()>0) {
				session.setAttribute("companyId",rlzyCompanyList.get(0).getId());
				return "2";
			}
			return "3";
		}
	}
	
	/**
	 * 发送验证码
	 * @param phone
	 * @param model
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="sendSms")
	public String sendSms(String phone,Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		//缓存存储手机号
		session.setAttribute("tel", phone);
		// 4位验证码
		String smsCode = SmsCodeUtil.createRandomVcode();
		// SmsCodeUtil
		try {
			// 发送验证码
			SmsCodeUtil.sendCode(smsCode, phone, session);
		} catch (SmsException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		return "";
	}

	/**
	 * 有效验证码
	 * @param model
	 * @param session
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkSms")
	public String[] checkSms(Model model, HttpSession session, HttpServletRequest request,HttpServletResponse response) {
		String phone = (String) session.getAttribute("tel");
		String smsCode = request.getParameter("code");
		
		String[] flag = new String[2];
		try {
			SmsCodeUtil.validateCode(phone, smsCode, session);
		} catch (SmsException e) {
			flag[0] = "0";
			flag[1] = e.getMessage();
			return flag;
		}
		flag[0] = "1";
		SmsCodeUtil.consumeCode(session);
		return flag;
	}
	
	
	/**
	 * 初次点击进入新闻列表
	 * @param news
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("newsList")
	public String newsList(News news,Model model,HttpServletRequest request,HttpServletResponse response){
		//先传递列表总数，或者自定义查询条数语句，放在分页后面会被分页拦截，默认查10条
		NewsModel newsModel = new NewsModel();
		//查询首页显示10条
		newsModel.setId("5ad717509e9b4cd6b10b608d6d17e709");
		news.setNewsModel(newsModel);
		Page<News> page = new Page<>();
		page.setPageNo(1);
		page.setPageSize(10);
		Page<News> newsList = newsService.findPage(page, news);
		model.addAttribute("newsList", newsList.getList());
		model.addAttribute("count",newsList.getCount());
		
		newsModel.setId("7d4fecb7a48b487cab1e6fd1ab61129d");
		news.setNewsModel(newsModel);
		Page<News> busNewsList = newsService.findPage(page, news);
		model.addAttribute("counts",busNewsList.getCount());
		model.addAttribute("busNewsList", busNewsList.getList());
		return "modules/home/news";
	}
	/**
	 * 根据页码显示新闻
	 * @param id
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("pageList")
	public List<News> pageList(String id,String page,String pageSize){
		News news = new News();
		NewsModel newsModel = new NewsModel();
		newsModel.setId(id);
		news.setNewsModel(newsModel);
		Page<News> pages = new Page<>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		Page<News> newsList = newsService.findPage(pages, news);
		return newsList.getList();
	}
	/**
	 * 技能提升，视频学习
	 * @return
	 */
	@RequestMapping("videostudy")
	public String videoStudy(Model model,HttpServletRequest request,HttpServletResponse response,VideoModel videoModel,Video video){
	
		Page<Video> pages = new Page<Video>();
		pages.setPageNo(1);
		pages.setPageSize(10);
		Page<Video> videoList = videoService.findPage(pages, video);
		List<VideoModel> videoModelList = videoModelService.findList(videoModel);
		for(int i = 0;i<videoModelList.size();i++){
			VideoModel v = videoModelList.get(i);
			String count = videoService.getRow(v.getId());
			v.setSpe1(count);
		}
		model.addAttribute("videoModelList", videoModelList);
		model.addAttribute("videoList", videoList.getList());
		model.addAttribute("count", videoList.getCount());
		return "modules/home/videostudy";
	}
	
	/**
	 * 根据页码显示视频
	 * @param id
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@ResponseBody
	@RequestMapping("videoList")
	public Page<Video> videoList(String id,String page,String pageSize){
		Video video = new Video();
		VideoModel videoModel = new VideoModel();
		videoModel.setId(id);
		video.setVideoModel(videoModel);
		Page<Video> pages = new Page<Video>();
		pages.setPageNo(Integer.parseInt(page));
		pages.setPageSize(Integer.parseInt(pageSize));
		Page<Video> videoList = videoService.findPage(pages, video);
		return videoList;
	}
	 /**
	  * 新闻动态
	  * @param id
	  * @return
	  */
	 @RequestMapping("newsData")
	 public String newsData(String id,Model model) {
	  News news = newsService.get(id);
	  model.addAttribute("news", news);
	  return "modules/home/newsData";
	 }
	 
	 /**
		 * 技能提升，视频学习
		 * @return
		 */
		@RequestMapping("serviceWindow")
		public String serviceWindow(Model model,HttpServletRequest request,HttpServletResponse response,NewsModel newsModel,News news){
		
			Page<News> pages = new Page<News>();
			pages.setPageNo(1);
			pages.setPageSize(10);
			newsModel.setParentIds("e7fc80af8cce472fb720a336f56cac43");
			List<NewsModel> newsModelList = newsModelService.findList(newsModel);
			news.setNewsModel(newsModelList.get(0));
			Page<News> serviceList = newsService.findPage(pages, news);
			for(int i = 0;i<newsModelList.size();i++){
				NewsModel v = newsModelList.get(i);
				String count = videoService.getRow(v.getId());
				v.setSpe1(count);
			}
			model.addAttribute("newsModelList", newsModelList);
			model.addAttribute("serviceList", serviceList.getList());
			model.addAttribute("count", serviceList.getCount());
			return "modules/home/serviceWindow";
		}
		
		/**
		 * 根据页码显示视频
		 * @param page
		 * @param pageSize
		 * @return
		 */
		@ResponseBody
		@RequestMapping("serviceList")
		public Page<News> serviceList(String id,String page,String pageSize){
			News news = new News();
			NewsModel newsModel = new NewsModel();
			newsModel.setId(id);
			news.setNewsModel(newsModel);
			Page<News> pages = new Page<News>();
			pages.setPageNo(Integer.parseInt(page));
			pages.setPageSize(Integer.parseInt(pageSize));
			Page<News> serviceList = newsService.findPage(pages, news);
			return serviceList;
		}
		/**
		   * 企业风采
		   * @return
		   */
		  @RequestMapping(value="companyFeatures")
		  public String companyFeatures(Model model,HttpServletRequest request,HttpServletResponse response,RlzyCompany rlzyCompany){
		   Page<RlzyCompany> pages = new Page<RlzyCompany>();
		   pages.setPageNo(1);
		   pages.setPageSize(10);
		   Page<RlzyCompany> rlzyCompanyList = rlzyCompanyService.findPage(pages, rlzyCompany);
		   model.addAttribute("rlzyCompanyList", rlzyCompanyList.getList());
		   model.addAttribute("count", rlzyCompanyList.getCount());
		   return "modules/home/companyFeatures";
		  }
		  
		  /**
		   * 根据页码显示企业风采
		   * @param id
		   * @param page
		   * @param pageSize
		   * @return
		   */
		  @ResponseBody
		  @RequestMapping("rlzycompanypage")
		  public List<RlzyCompany> rlzycompanypage(String page,String pageSize){
		   RlzyCompany rlzyCompany = new RlzyCompany();
		   Page<RlzyCompany> pages = new Page<>();
		   pages.setPageNo(Integer.parseInt(page));
		   pages.setPageSize(Integer.parseInt(pageSize));
		   Page<RlzyCompany> companyList = rlzyCompanyService.findPage(pages, rlzyCompany);
		   return companyList.getList();
		  }
		  
		  
		  
		  /**
		   * 根据页码显示企业风采
		   * @param name
		   * @param page
		   * @param pageSize
		   * @return
		   */
		  @ResponseBody
		  @RequestMapping("rlzyCompanyListBySelect")
		  public List<RlzyCompany> rlzyCompanyListBySelect(String name,String page,String pageSize){
		   RlzyCompany rlzyCompany = new RlzyCompany();
		   rlzyCompany.setCompanyname(name);
		   Page<RlzyCompany> pages = new Page<>();
		   pages.setPageNo(Integer.parseInt(page));
		   pages.setPageSize(Integer.parseInt(pageSize));
		   Page<RlzyCompany> companyList = rlzyCompanyService.findPage(pages, rlzyCompany);
		   List<RlzyCompany> list = new ArrayList<RlzyCompany>();
		   for(RlzyCompany rlzyCompanys : companyList.getList()){
		    rlzyCompanys.setSpe3(String.valueOf(companyList.getCount()));
		    list.add(rlzyCompanys);
		   }
		   return list;
		  }
	
}
