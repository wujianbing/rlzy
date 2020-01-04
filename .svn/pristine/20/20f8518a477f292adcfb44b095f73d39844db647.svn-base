/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Lists;
import com.jeeplus.common.json.AjaxJson;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.portal.entity.Video;
import com.jeeplus.modules.portal.service.VideoModelService;
import com.jeeplus.modules.portal.service.VideoService;

/**
 * 视频Controller
 * @author 李浩
 * @version 2019-05-27
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/video")
public class VideoController extends BaseController {

	@Autowired
	private VideoService videoService;
	
	@Autowired
	private VideoModelService videoModelService;
	
	@ModelAttribute
	public Video get(@RequestParam(required=false) String id) {
		Video entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = videoService.get(id);
		}
		if (entity == null){
			entity = new Video();
		}
		return entity;
	}
	
	/**
	 * 视频列表页面
	 */
	@RequiresPermissions("portal:video:list")
	@RequestMapping(value = {"list", ""})
	public String list(Video video, Model model) {
		model.addAttribute("video", video);
		return "modules/portal/videoList";
	}
	
		/**
	 * 视频列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:video:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(Video video, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Video> page = videoService.findPage(new Page<Video>(request, response), video); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑视频表单页面   form模式
	 */
	@RequiresPermissions(value={"portal:video:view","portal:video:add","portal:video:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, Video video, Model model) {
		if(!video.getVideoModel().getId().equals("")) {
			video.setVideoModel(videoModelService.get(video.getVideoModel()));
		}
		model.addAttribute("video", video);
		model.addAttribute("mode", mode);
		return "modules/portal/videoForm";
	}
	
	/**
	 * 查看，增加，编辑视频表单页面   dialog模式
	 */
	@RequiresPermissions(value={"portal:video:view","portal:video:add","portal:video:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(Video video, Model model) {
		if(!video.getVideoModel().getId().equals("")) {
			video.setVideoModel(videoModelService.get(video.getVideoModel()));
		}
		model.addAttribute("video", video);
		return "modules/portal/videoDialogForm";
	}

	/**
	 * 保存视频
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:video:add","portal:video:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(Video video, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(video);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		videoService.save(video);//保存
		j.setSuccess(true);
		j.setMsg("保存视频成功");
		return j;
	}
	
	/**
	 * 删除视频
	 */
	@ResponseBody
	@RequiresPermissions("portal:video:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(Video video) {
		AjaxJson j = new AjaxJson();
		videoService.delete(video);
		j.setMsg("删除视频成功");
		return j;
	}
	
	/**
	 * 批量删除视频
	 */
	@ResponseBody
	@RequiresPermissions("portal:video:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			videoService.delete(videoService.get(id));
		}
		j.setMsg("删除视频成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:video:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(Video video, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "视频"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<Video> page = videoService.findPage(new Page<Video>(request, response, -1), video);
    		new ExportExcel("视频", Video.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出视频记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:video:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<Video> list = ei.getDataList(Video.class);
			for (Video video : list){
				try{
					videoService.save(video);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条视频记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条视频记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入视频失败！失败信息："+e.getMessage());
		}
		return j;
    }

	/**
	 * 下载导入视频数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:video:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "视频数据导入模板.xlsx";
    		List<Video> list = Lists.newArrayList();
    		new ExportExcel("视频数据", Video.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }


}