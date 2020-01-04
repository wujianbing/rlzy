/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.jeeplus.common.json.AjaxJson;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.portal.entity.VideoModel;
import com.jeeplus.modules.portal.service.VideoModelService;

/**
 * 视频管理Controller
 * @author 李浩
 * @version 2019-05-27
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/videoModel")
public class VideoModelController extends BaseController {

	@Autowired
	private VideoModelService videoModelService;
	
	@ModelAttribute
	public VideoModel get(@RequestParam(required=false) String id) {
		VideoModel entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = videoModelService.get(id);
		}
		if (entity == null){
			entity = new VideoModel();
		}
		return entity;
	}
	
	/**
	 * 视频列表页面
	 */
	@RequestMapping(value = {"list", ""})
	public String list(VideoModel videoModel,  HttpServletRequest request, HttpServletResponse response, Model model) {
		
		return "modules/portal/videoModelList";
	}

	/**
	 * 查看，增加，编辑视频表单页面
	 */
	@RequestMapping(value = "form")
	public String form(VideoModel videoModel, Model model) {
		if (videoModel.getParent()!=null && StringUtils.isNotBlank(videoModel.getParent().getId())){
			videoModel.setParent(videoModelService.get(videoModel.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(videoModel.getId())){
				VideoModel videoModelChild = new VideoModel();
				videoModelChild.setParent(new VideoModel(videoModel.getParent().getId()));
				List<VideoModel> list = videoModelService.findList(videoModel); 
				if (list.size() > 0){
					videoModel.setSort(list.get(list.size()-1).getSort());
					if (videoModel.getSort() != null){
						videoModel.setSort(videoModel.getSort() + 30);
					}
				}
			}
		}
		if (videoModel.getSort() == null){
			videoModel.setSort(30);
		}
		model.addAttribute("videoModel", videoModel);
		return "modules/portal/videoModelForm";
	}

	/**
	 * 保存视频
	 */
	@ResponseBody
	@RequestMapping(value = "save")
	public AjaxJson save(VideoModel videoModel, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(videoModel);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}

		//新增或编辑表单保存
		videoModelService.save(videoModel);//保存
		j.setSuccess(true);
		j.put("videoModel", videoModel);
		j.setMsg("保存视频成功");
		return j;
	}
	
	@ResponseBody
	@RequestMapping(value = "getChildren")
	public List<VideoModel> getChildren(String parentId){
		if("-1".equals(parentId)){//如果是-1，没指定任何父节点，就从根节点开始查找
			parentId = "0";
		}
		return videoModelService.getChildren(parentId);
	}
	
	/**
	 * 删除视频
	 */
	@ResponseBody
	@RequestMapping(value = "delete")
	public AjaxJson delete(VideoModel videoModel) {
		AjaxJson j = new AjaxJson();
		videoModelService.delete(videoModel);
		j.setSuccess(true);
		j.setMsg("删除视频成功");
		return j;
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<VideoModel> list = videoModelService.findList(new VideoModel());
		for (int i=0; i<list.size(); i++){
			VideoModel e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("text", e.getName());
				if(StringUtils.isBlank(e.getParentId()) || "0".equals(e.getParentId())){
					map.put("parent", "#");
					Map<String, Object> state = Maps.newHashMap();
					state.put("opened", true);
					map.put("state", state);
				}else{
					map.put("parent", e.getParentId());
				}
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}