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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.common.collect.Lists;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.json.AjaxJson;
import com.jeeplus.core.persistence.Page;
import com.jeeplus.core.web.BaseController;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.modules.portal.entity.RlzyCooperation;
import com.jeeplus.modules.portal.service.RlzyCooperationService;

/**
 * 合作企业Controller
 * @author 喻昆昆
 * @version 2019-12-23
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/rlzyCooperation")
public class RlzyCooperationController extends BaseController {

	@Autowired
	private RlzyCooperationService rlzyCooperationService;
	
	@ModelAttribute
	public RlzyCooperation get(@RequestParam(required=false) String id) {
		RlzyCooperation entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = rlzyCooperationService.get(id);
		}
		if (entity == null){
			entity = new RlzyCooperation();
		}
		return entity;
	}
	
	/**
	 * 合作企业信息列表页面
	 */
	@RequiresPermissions("portal:rlzyCooperation:list")
	@RequestMapping(value = {"list", ""})
	public String list(RlzyCooperation rlzyCooperation, Model model) {
		model.addAttribute("rlzyCooperation", rlzyCooperation);
		return "modules/portal/rlzyCooperationList";
	}
	
		/**
	 * 合作企业信息列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyCooperation:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(RlzyCooperation rlzyCooperation, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RlzyCooperation> page = rlzyCooperationService.findPage(new Page<RlzyCooperation>(request, response), rlzyCooperation); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑合作企业信息表单页面
	 */
	@RequiresPermissions(value={"portal:rlzyCooperation:view","portal:rlzyCooperation:add","portal:rlzyCooperation:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(RlzyCooperation rlzyCooperation, Model model) {
		model.addAttribute("rlzyCooperation", rlzyCooperation);
		return "modules/portal/rlzyCooperationForm";
	}

	/**
	 * 保存合作企业信息
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:rlzyCooperation:add","portal:rlzyCooperation:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(RlzyCooperation rlzyCooperation, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(rlzyCooperation);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		rlzyCooperationService.save(rlzyCooperation);//保存
		j.setSuccess(true);
		j.setMsg("保存合作企业信息成功");
		return j;
	}
	
	/**
	 * 删除合作企业信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyCooperation:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(RlzyCooperation rlzyCooperation) {
		AjaxJson j = new AjaxJson();
		rlzyCooperationService.delete(rlzyCooperation);
		j.setMsg("删除合作企业信息成功");
		return j;
	}
	
	/**
	 * 批量删除合作企业信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyCooperation:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			rlzyCooperationService.delete(rlzyCooperationService.get(id));
		}
		j.setMsg("删除合作企业信息成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyCooperation:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(RlzyCooperation rlzyCooperation, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "合作企业信息"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<RlzyCooperation> page = rlzyCooperationService.findPage(new Page<RlzyCooperation>(request, response, -1), rlzyCooperation);
    		new ExportExcel("合作企业信息", RlzyCooperation.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出合作企业信息记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyCooperation:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<RlzyCooperation> list = ei.getDataList(RlzyCooperation.class);
			for (RlzyCooperation rlzyCooperation : list){
				try{
					rlzyCooperationService.save(rlzyCooperation);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条合作企业信息记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条合作企业信息记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入合作企业信息失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入合作企业信息数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyCooperation:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "合作企业信息数据导入模板.xlsx";
    		List<RlzyCooperation> list = Lists.newArrayList(); 
    		new ExportExcel("合作企业信息数据", RlzyCooperation.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}