package com.jeeplus.modules.api;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.utils.CookieUtils;
import com.jeeplus.common.utils.Encodes;
import com.jeeplus.common.utils.FileUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.home.utils.SmsCodeUtil;
import com.jeeplus.modules.home.web.exception.SmsException;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyCompanyService;
import com.jeeplus.modules.portal.service.RlzyUserService;
@Controller
@RequestMapping("/api")
public class CommonController {
	
	@Autowired
	RlzyUserService rlzyUserService;
	
	@Autowired
	RlzyCompanyService rlzyCompanyService;
	 /**
	   * 获取用户唯一标识 OpenID 和 会话密钥 session_key
	   * @return
	 */
	 @ResponseBody
	 @RequestMapping("/code2Session")
	 public ReturnJson code2Session(Map<String,String> opencode) {
		 String code =opencode.get("code");
		 ReturnJson returnJson =new ReturnJson();
		 String open= Utils.getOpenId(code);
		 if(StringUtils.isNotBlank(open)) {
			 Map<String,Object> map = new HashMap<String, Object>();
			 map.put("open", open);
			 returnJson.setResult(map);
			 returnJson.setCode("200");
			 returnJson.setStatus(true);
		 }else {
			 returnJson.setMessage("授权失败!");
			 returnJson.setStatus(false);
		 }
		 return returnJson;
	 }
	
	/**
	 * 图片上传
	 * 
	 * */
	@ResponseBody
	@RequestMapping("/upload")
	public ReturnJson upload(MultipartFile file,String flag,String base64) {
		ReturnJson returnJson = new ReturnJson();		  		 		 
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
    	    File dir = new File(rootPath+File.separator+uploadPath+"/"+year+"/"+month+"/"+path);
    	    if (!dir.exists())
    			dir.mkdirs();
    	    try {
    	        file.transferTo(dir);
    	    } catch (Exception e) {
    	        e.printStackTrace();
    	    }
    	    Map<String,Object> map = new HashMap<String, Object>();
    	    returnJson.setStatus(true);
    	    map.put("fileUrl", fileUrl);
    	    returnJson.setResult(map);
    	    returnJson.setMessage("success");
    	    return returnJson;
	}
	
	/**
	 * 发送验证码
	 * @param phone
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="sendSms")
	public ReturnJson sendSms(@RequestBody String jsondata, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		JSONObject obje= JSON.parseObject(jsondata);
		String phone = obje.getString("phone");
		ReturnJson returnJson = new ReturnJson();
		//缓存存储手机号
		session.setAttribute("tel", phone);
		// 4位验证码
		String smsCode = SmsCodeUtil.createRandomVcode();
		// SmsCodeUtil
		try {
			// 发送验证码
			SmsCodeUtil.sendCode(smsCode, phone, session);
			returnJson.setStatus(true);
			returnJson.setMessage("success");
		} catch (SmsException e) {
			// TODO Auto-generated catch block
			e.getMessage();
			returnJson.setStatus(false);
			returnJson.setMessage("error");
		}
		return returnJson;
	}

	/**
	 * 效验验证码
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="checkSms")
	public ReturnJson checkSms(@RequestBody String jsondata ,HttpSession session, HttpServletRequest request,HttpServletResponse response) {
		System.out.println(session);
		JSONObject obje= JSON.parseObject(jsondata);
		String smsCode = obje.getString("code");
		String phone = obje.getString("phone");
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
/*		String phone = (String) session.getAttribute("tel");
*/		String[] flag = new String[2];
		try {
			SmsCodeUtil.validateCode(phone, smsCode, session);
		} catch (SmsException e) {
			flag[0] = "0";
			flag[1] = e.getMessage();
			map.put("flag", flag);
			returnJson.setStatus(false);
			returnJson.setResult(map);
			returnJson.setMessage("验证码错误，请重新输入!");
			return returnJson;
		}
		flag[0] = "1";
		SmsCodeUtil.consumeCode(session);
		map.put("flag", flag);
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("success");
		return returnJson;
	}
	

	/**
	 * 效验手机号是否存在
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="check")
	public ReturnJson check(@RequestBody Map<String,String> loginmap, HttpServletRequest request,HttpServletResponse response) {
		String phone = loginmap.get("phone");
		ReturnJson returnJson = new ReturnJson();
		RlzyUser rlzyUser = new RlzyUser();
		rlzyUser.setPhone(phone);
		List<RlzyUser> list = rlzyUserService.findList(rlzyUser);
		if(list.size() > 0) {
			returnJson.setStatus(false);
			returnJson.setMessage("该手机号已注册为人才账户！");
			return returnJson;
		}else {
			RlzyCompany rlzyCompany = new RlzyCompany();
			rlzyCompany.setTelephone(phone);
			List<RlzyCompany> companylist = rlzyCompanyService.findList(rlzyCompany);
			if(companylist.size() >0) {
				returnJson.setStatus(false);
				returnJson.setMessage("该手机号已注册为公司账户！");
				return returnJson;
			}
		}
		returnJson.setStatus(true);
		returnJson.setMessage("未注册过");
		return returnJson;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="base64upload",method=RequestMethod.POST,produces="application/json")
	public static ReturnJson base64upload(@RequestBody Map<String,String> loginmap,HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("UTF-8");
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<String, Object>();
		String rootPath = Global.getAttachmentDir();
		String base64 = loginmap.get("base64");
		String flag = loginmap.get("flag");
  	    String uploadPath="";
  	    if("1".equals(flag)) {
  	    	uploadPath = "personal";
  	    }else {
  	    	uploadPath = "company";
  	    }
		Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH )+1;
		// 根目录
		File imgeFile = new File(rootPath+"/"+uploadPath+"/"+year+"/"+month);
		System.out.println(imgeFile);
		if (!imgeFile.exists()) {
			imgeFile.mkdirs();
		}
		//File imgeFiles = new File(rootPath+"/"+uploadPath+"/"+year+"/"+month+"/"+"qq.png");
		String[] arr = base64.split("\\,");
		//String a = "data:image/png;base64,"; 
		//List<String> list = new ArrayList<String>(Arrays.asList(arr)); 
		for(int i = 0;i < arr.length;i++)
			{
			File imgeFiles = new File(rootPath+"/"+uploadPath+"/"+year+"/"+month+"/"+System.currentTimeMillis()+".png");
			// 网络地址
			String fileUrl = Global.getAttachmentUrl()+uploadPath+"/"+year+"/"+month+"/"+System.currentTimeMillis()+".png";
				//String str = list.get(i);
				//String strs =str.replaceAll(" ","+");
				//System.out.println(strs);
				// 对base64进行解码
				byte[] result = Encodes.decodeBase64(arr[i]);
				 for (int j = 0; j < result.length; j++) {
		                if (result[j] < 0) {// 调整异常数据
		                	result[j] += 256;
		                }
		            }
				System.out.println(result);
				// 使用Apache提供的工具类将图片写到指定路径下
				FileUtils.writeByteArrayToFile(imgeFiles, result);
				map.put("fileUrl"+i, fileUrl);
			}
		returnJson.setStatus(true);
	    returnJson.setResult(map);
	    returnJson.setMessage("success");
	    return returnJson;
	}
	
	@ResponseBody
	@RequestMapping(value="editPhoto")
	public ReturnJson editPhoto(@RequestBody Map<String,String> loginmap,HttpServletRequest request, HttpServletResponse response){
		ReturnJson returnJson = new ReturnJson();
		String token = request.getHeader("accessToken");
		String id = TokenSign.getUserId(token);
		String photo = loginmap.get("photo");
		String flag = loginmap.get("flag");
		if("1".equals(flag)) {
			RlzyUser rlzyUser = rlzyUserService.get(id);
			rlzyUser.setPhoto(photo);
			rlzyUserService.save(rlzyUser);
			returnJson.setStatus(true);
			returnJson.setMessage("个人头像修改成功！");
			return returnJson;
		}else if("2".equals(flag)){
			RlzyCompany rlzyCompany = rlzyCompanyService.get(id);
			rlzyCompany.setLogo(photo);
			rlzyCompanyService.save(rlzyCompany);
			returnJson.setStatus(true);
			returnJson.setMessage("公司logo修改成功！");
			return returnJson;
		}
		returnJson.setStatus(false);
	    returnJson.setMessage("修改失败！");
	    return returnJson;
	}
	
}
