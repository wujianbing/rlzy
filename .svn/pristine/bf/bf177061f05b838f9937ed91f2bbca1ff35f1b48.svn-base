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
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.modules.portal.entity.Link;
import com.jeeplus.modules.portal.service.LinkService;

/**
 * 友情链接Controller
 * @author 李浩
 * @version 2019-06-03
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/link")
public class LinkController extends BaseController {

	@Autowired
	private LinkService linkService;
	
	@ModelAttribute
	public Link get(@RequestParam(required=false) String id) {
		Link entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = linkService.get(id);
		}
		if (entity == null){
			entity = new Link();
		}
		return entity;
	}
	
	/**
	 * 友情链接列表页面
	 */
	@RequiresPermissions("portal:link:list")
	@RequestMapping(value = {"list", ""})
	public String list(Link link, Model model) {
		model.addAttribute("link", link);
		return "modules/portal/linkList";
	}
	
		/**
	 * 友情链接列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:link:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(Link link, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Link> page = linkService.findPage(new Page<Link>(request, response), link); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑友情链接表单页面   form风格
	 */
	@RequiresPermissions(value={"portal:link:view","portal:link:add","portal:link:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, Link link, Model model) {
		// 获取排序号，最末节点排序号+30
		if (StringUtils.isBlank(link.getId())){
			List<Link> list = linkService.findList(link); 
			if (list.size() > 0){
				link.setSort(list.get(list.size()-1).getSort());
				if (link.getSort() != null){
					link.setSort(link.getSort() + 30);
				}
			}
		}
		model.addAttribute("link", link);
		model.addAttribute("mode", mode);
		return "modules/portal/linkForm";
	}
	
	/**
	 * 查看，增加，编辑友情链接表单页面   dialog风格
	 */
	@RequiresPermissions(value={"portal:link:view","portal:link:add","portal:link:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(Link link, Model model) {
		// 获取排序号，最末节点排序号+30
		if (StringUtils.isBlank(link.getId())){
			List<Link> list = linkService.findList(link); 
			if (list.size() > 0){
				link.setSort(list.get(list.size()-1).getSort());
				if (link.getSort() != null){
					link.setSort(link.getSort() + 30);
				}
			}
		}
		model.addAttribute("link", link);
		return "modules/portal/linkDialogForm";
	}

	/**
	 * 保存友情链接
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:link:add","portal:link:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(Link link, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		
		String errMsg = beanValidator(link);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		linkService.save(link);//保存
		j.setSuccess(true);
		j.setMsg("保存友情链接成功");
		return j;
	}
	
	/**
	 * 删除友情链接
	 */
	@ResponseBody
	@RequiresPermissions("portal:link:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(Link link) {
		AjaxJson j = new AjaxJson();
		linkService.delete(link);
		j.setMsg("删除友情链接成功");
		return j;
	}
	
	/**
	 * 批量删除友情链接
	 */
	@ResponseBody
	@RequiresPermissions("portal:link:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			linkService.delete(linkService.get(id));
		}
		j.setMsg("删除友情链接成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:link:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(Link link, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "友情链接"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<Link> page = linkService.findPage(new Page<Link>(request, response, -1), link);
    		new ExportExcel("友情链接", Link.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出友情链接记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:link:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<Link> list = ei.getDataList(Link.class);
			for (Link link : list){
				try{
					linkService.save(link);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条友情链接记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条友情链接记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入友情链接失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入友情链接数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:link:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "友情链接数据导入模板.xlsx";
    		List<Link> list = Lists.newArrayList(); 
    		new ExportExcel("友情链接数据", Link.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}