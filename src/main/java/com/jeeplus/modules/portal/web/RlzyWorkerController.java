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
import com.jeeplus.modules.portal.entity.RlzyWorker;
import com.jeeplus.modules.portal.service.RlzyWorkerService;

/**
 * 用人信息Controller
 * @author 喻昆昆
 * @version 2019-12-23
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/rlzyWorker")
public class RlzyWorkerController extends BaseController {

	@Autowired
	private RlzyWorkerService rlzyWorkerService;
	
	@ModelAttribute
	public RlzyWorker get(@RequestParam(required=false) String id) {
		RlzyWorker entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = rlzyWorkerService.get(id);
		}
		if (entity == null){
			entity = new RlzyWorker();
		}
		return entity;
	}
	
	/**
	 * 用人信息列表页面
	 */
	@RequiresPermissions("portal:rlzyWorker:list")
	@RequestMapping(value = {"list", ""})
	public String list(RlzyWorker rlzyWorker, Model model) {
		model.addAttribute("rlzyWorker", rlzyWorker);
		return "modules/portal/rlzyWorkerList";
	}
	
		/**
	 * 用人信息列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyWorker:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(RlzyWorker rlzyWorker, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RlzyWorker> page = rlzyWorkerService.findPage(new Page<RlzyWorker>(request, response), rlzyWorker); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑用人信息表单页面
	 */
	@RequiresPermissions(value={"portal:rlzyWorker:view","portal:rlzyWorker:add","portal:rlzyWorker:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(RlzyWorker rlzyWorker, Model model) {
		model.addAttribute("rlzyWorker", rlzyWorker);
		return "modules/portal/rlzyWorkerForm";
	}

	/**
	 * 保存用人信息
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:rlzyWorker:add","portal:rlzyWorker:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(RlzyWorker rlzyWorker, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(rlzyWorker);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		rlzyWorkerService.save(rlzyWorker);//保存
		j.setSuccess(true);
		j.setMsg("保存用人信息成功");
		return j;
	}
	
	/**
	 * 删除用人信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyWorker:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(RlzyWorker rlzyWorker) {
		AjaxJson j = new AjaxJson();
		rlzyWorkerService.delete(rlzyWorker);
		j.setMsg("删除用人信息成功");
		return j;
	}
	
	/**
	 * 批量删除用人信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyWorker:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			rlzyWorkerService.delete(rlzyWorkerService.get(id));
		}
		j.setMsg("删除用人信息成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyWorker:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(RlzyWorker rlzyWorker, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "用人信息"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<RlzyWorker> page = rlzyWorkerService.findPage(new Page<RlzyWorker>(request, response, -1), rlzyWorker);
    		new ExportExcel("用人信息", RlzyWorker.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出用人信息记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyWorker:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<RlzyWorker> list = ei.getDataList(RlzyWorker.class);
			for (RlzyWorker rlzyWorker : list){
				try{
					rlzyWorkerService.save(rlzyWorker);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条用人信息记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条用人信息记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入用人信息失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入用人信息数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyWorker:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "用人信息数据导入模板.xlsx";
    		List<RlzyWorker> list = Lists.newArrayList(); 
    		new ExportExcel("用人信息数据", RlzyWorker.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}