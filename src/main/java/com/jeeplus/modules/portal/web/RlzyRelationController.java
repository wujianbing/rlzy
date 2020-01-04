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
import com.jeeplus.modules.portal.entity.RlzyRelation;
import com.jeeplus.modules.portal.service.RlzyRelationService;

/**
 * 企业个人信息关联Controller
 * @author 喻昆昆
 * @version 2019-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/rlzyRelation")
public class RlzyRelationController extends BaseController {

	@Autowired
	private RlzyRelationService rlzyRelationService;
	
	@ModelAttribute
	public RlzyRelation get(@RequestParam(required=false) String id) {
		RlzyRelation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = rlzyRelationService.get(id);
		}
		if (entity == null){
			entity = new RlzyRelation();
		}
		return entity;
	}
	
	/**
	 * 关联信息列表页面
	 */
	@RequiresPermissions("portal:rlzyRelation:list")
	@RequestMapping(value = {"list", ""})
	public String list(RlzyRelation rlzyRelation, Model model) {
		model.addAttribute("rlzyRelation", rlzyRelation);
		return "modules/portal/rlzyRelationList";
	}
	
		/**
	 * 关联信息列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyRelation:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(RlzyRelation rlzyRelation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RlzyRelation> page = rlzyRelationService.findPage(new Page<RlzyRelation>(request, response), rlzyRelation); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑关联信息表单页面
	 */
	@RequiresPermissions(value={"portal:rlzyRelation:view","portal:rlzyRelation:add","portal:rlzyRelation:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode, RlzyRelation rlzyRelation, Model model) {
		model.addAttribute("rlzyRelation", rlzyRelation);
		model.addAttribute("mode", mode);
		return "modules/portal/rlzyRelationForm";
	}

	/**
	 * 保存关联信息
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:rlzyRelation:add","portal:rlzyRelation:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(RlzyRelation rlzyRelation, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(rlzyRelation);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		rlzyRelationService.save(rlzyRelation);//保存
		j.setSuccess(true);
		j.setMsg("保存关联信息成功");
		return j;
	}
	
	/**
	 * 删除关联信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyRelation:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(RlzyRelation rlzyRelation) {
		AjaxJson j = new AjaxJson();
		rlzyRelationService.delete(rlzyRelation);
		j.setMsg("删除关联信息成功");
		return j;
	}
	
	/**
	 * 批量删除关联信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyRelation:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			rlzyRelationService.delete(rlzyRelationService.get(id));
		}
		j.setMsg("删除关联信息成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyRelation:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(RlzyRelation rlzyRelation, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "关联信息"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<RlzyRelation> page = rlzyRelationService.findPage(new Page<RlzyRelation>(request, response, -1), rlzyRelation);
    		new ExportExcel("关联信息", RlzyRelation.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出关联信息记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyRelation:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<RlzyRelation> list = ei.getDataList(RlzyRelation.class);
			for (RlzyRelation rlzyRelation : list){
				try{
					rlzyRelationService.save(rlzyRelation);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条关联信息记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条关联信息记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入关联信息失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入关联信息数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyRelation:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "关联信息数据导入模板.xlsx";
    		List<RlzyRelation> list = Lists.newArrayList(); 
    		new ExportExcel("关联信息数据", RlzyRelation.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}