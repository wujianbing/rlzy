/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.web;

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

import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.portal.entity.Isystem;
import com.jeeplus.modules.portal.service.IsystemService;

/**
 *Controller
 * @author 喻昆昆
 * @version 2019-06-03
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/isystem")
public class IsystemController extends BaseController {

	@Autowired
	private IsystemService isystemService;
	
	@ModelAttribute
	public Isystem get(@RequestParam(required=false) String id) {
		Isystem entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = isystemService.get(id);
		}
		if (entity == null){
			entity = new Isystem();
		}
		return entity;
	}
	
	/**
	 * 列表页面
	 */
	@RequiresPermissions("portal:isystem:list")
	@RequestMapping(value = {"list", ""})
	public String list(Isystem isystem, Model model) {
		model.addAttribute("isystem", isystem);
		return "modules/portal/isystemList";
	}
	
		/**
	 * 列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:isystem:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(Isystem isystem, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Isystem> page = isystemService.findPage(new Page<Isystem>(request, response), isystem); 
		return getBootstrapData(page);
	}
}