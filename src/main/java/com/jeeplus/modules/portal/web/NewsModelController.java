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
import com.jeeplus.modules.portal.entity.NewsModel;
import com.jeeplus.modules.portal.service.NewsModelService;

/**
 * 新闻模块管理Controller
 * @author 李浩
 * @version 2019-05-21
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/newsModel")
public class NewsModelController extends BaseController {

	@Autowired
	private NewsModelService newsModelService;
	
	@ModelAttribute
	public NewsModel get(@RequestParam(required=false) String id) {
		NewsModel entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = newsModelService.get(id);
		}
		if (entity == null){
			entity = new NewsModel();
		}
		return entity;
	}
	
	/**
	 * 新闻模块列表页面
	 */
	@RequestMapping(value = {"list", ""})
	public String list(NewsModel newsModel,  HttpServletRequest request, HttpServletResponse response, Model model) {
		return "modules/portal/newsModelList";
	}

	/**
	 * 查看，增加，编辑新闻模块表单页面
	 */
	@RequestMapping(value = "form")
	public String form(NewsModel newsModel, Model model) {
		if (newsModel.getParent()!=null && StringUtils.isNotBlank(newsModel.getParent().getId())){
			newsModel.setParent(newsModelService.get(newsModel.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(newsModel.getId())){
				NewsModel newsModelChild = new NewsModel();
				newsModelChild.setParent(new NewsModel(newsModel.getParent().getId()));
				List<NewsModel> list = newsModelService.findList(newsModel); 
				if (list.size() > 0){
					newsModel.setSort(list.get(list.size()-1).getSort());
					if (newsModel.getSort() != null){
						newsModel.setSort(newsModel.getSort() + 30);
					}
				}
			}
		}
		if (newsModel.getSort() == null){
			newsModel.setSort(30);
		}
		model.addAttribute("newsModel", newsModel);
		return "modules/portal/newsModelForm";
	}

	/**
	 * 保存新闻模块
	 */
	@ResponseBody
	@RequestMapping(value = "save")
	public AjaxJson save(NewsModel newsModel, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		String errMsg = beanValidator(newsModel);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}

		//新增或编辑表单保存
		newsModelService.save(newsModel);//保存
		j.setSuccess(true);
		j.put("newsModel", newsModel);
		j.setMsg("保存模块成功");
		return j;
	}
	
	@ResponseBody
	@RequestMapping(value = "getChildren")
	public List<NewsModel> getChildren(String parentId){
		if("-1".equals(parentId)){//如果是-1，没指定任何父节点，就从根节点开始查找
			parentId = "0";
		}
		return newsModelService.getChildren(parentId);
	}
	
	/**
	 * 删除新闻模块
	 */
	@ResponseBody
	@RequestMapping(value = "delete")
	public AjaxJson delete(NewsModel newsModel) {
		AjaxJson j = new AjaxJson();
		newsModelService.delete(newsModel);
		j.setSuccess(true);
		j.setMsg("删除模块成功");
		return j;
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<NewsModel> list = newsModelService.findList(new NewsModel());
		for (int i=0; i<list.size(); i++){
			NewsModel e = list.get(i);
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