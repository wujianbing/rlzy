/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.Logical;
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
import com.jeeplus.modules.sys.entity.SysPostion;
import com.jeeplus.modules.sys.service.SysPostionService;

/**
 * 职业类型Controller
 * @author yukk
 * @version 2019-11-13
 */
@Controller
@RequestMapping(value = "${adminPath}/sys/sysPostion")
public class SysPostionController extends BaseController {

	@Autowired
	private SysPostionService sysPostionService;
	
	@ModelAttribute
	public SysPostion get(@RequestParam(required=false) String id) {
		SysPostion entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = sysPostionService.get(id);
		}
		if (entity == null){
			entity = new SysPostion();
		}
		return entity;
	}
	
	/**
	 * 职业信息列表页面
	 */
	@RequiresPermissions("sys:sysPostion:list")
	@RequestMapping(value = {"list", ""})
	public String list(SysPostion sysPostion,  HttpServletRequest request, HttpServletResponse response, Model model) {
		model.addAttribute("sysPostion", sysPostion);
		return "modules/sys/position/sysPostionList";
	}

	/**
	 * 查看，增加，编辑职业信息表单页面
	 */
	@RequiresPermissions(value={"sys:sysPostion:view","sys:sysPostion:add","sys:sysPostion:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(SysPostion sysPostion, Model model) {
		if (sysPostion.getParent()!=null && StringUtils.isNotBlank(sysPostion.getParent().getId())){
			sysPostion.setParent(sysPostionService.get(sysPostion.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(sysPostion.getId())){
				SysPostion sysPostionChild = new SysPostion();
				sysPostionChild.setParent(new SysPostion(sysPostion.getParent().getId()));
				List<SysPostion> list = sysPostionService.findList(sysPostion); 
				if (list.size() > 0){
					sysPostion.setSort(list.get(list.size()-1).getSort());
					if (sysPostion.getSort() != null){
						sysPostion.setSort(sysPostion.getSort() + 30);
					}
				}
			}
		}
		if (sysPostion.getSort() == null){
			sysPostion.setSort(30);
		}
		model.addAttribute("sysPostion", sysPostion);
		return "modules/sys/position/sysPostionForm";
	}

	/**
	 * 保存职业信息
	 */
	@ResponseBody
	@RequiresPermissions(value={"sys:sysPostion:add","sys:sysPostion:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(SysPostion sysPostion, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(sysPostion);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}

		//新增或编辑表单保存
		sysPostionService.save(sysPostion);//保存
		j.setSuccess(true);
		j.put("sysPostion", sysPostion);
		j.setMsg("保存职业信息成功");
		return j;
	}
	
	@ResponseBody
	@RequestMapping(value = "getChildren")
	public List<SysPostion> getChildren(String parentId){
		if("-1".equals(parentId)){//如果是-1，没指定任何父节点，就从根节点开始查找
			parentId = "0";
		}
		return sysPostionService.getChildren(parentId);
	}
	
	/**
	 * 删除职业信息
	 */
	@ResponseBody
	@RequiresPermissions("sys:sysPostion:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(SysPostion sysPostion) {
		AjaxJson j = new AjaxJson();
		sysPostionService.delete(sysPostion);
		j.setSuccess(true);
		j.setMsg("删除职业信息成功");
		return j;
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<SysPostion> list = sysPostionService.findList(new SysPostion());
		for (int i=0; i<list.size(); i++){
			SysPostion e = list.get(i);
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