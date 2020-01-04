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
import com.jeeplus.modules.portal.entity.RlzyUser;
import com.jeeplus.modules.portal.service.RlzyUserService;

/**
 * 个人信息表Controller
 * @author 喻昆昆
 * @version 2019-11-15
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/rlzyUser")
public class RlzyUserController extends BaseController {

	@Autowired
	private RlzyUserService rlzyUserService;
	
	@ModelAttribute
	public RlzyUser get(@RequestParam(required=false) String id) {
		RlzyUser entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = rlzyUserService.get(id);
		}
		if (entity == null){
			entity = new RlzyUser();
		}
		return entity;
	}
	
	/**
	 * 个人信息列表页面
	 */
	@RequiresPermissions("portal:rlzyUser:list")
	@RequestMapping(value = {"list", ""})
	public String list(RlzyUser rlzyUser, Model model) {
		model.addAttribute("rlzyUser", rlzyUser);
		return "modules/portal/rlzyUserList";
	}
	
		/**
	 * 个人信息列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyUser:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(RlzyUser rlzyUser, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RlzyUser> page = rlzyUserService.findPage(new Page<RlzyUser>(request, response), rlzyUser); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑个人信息表单页面
	 */
	@RequiresPermissions(value={"portal:rlzyUser:view","portal:rlzyUser:add","portal:rlzyUser:edit"},logical=Logical.OR)
	@RequestMapping(value = "form/{mode}")
	public String form(@PathVariable String mode,RlzyUser rlzyUser, Model model) {
		model.addAttribute("rlzyUser", rlzyUser);
		model.addAttribute("mode", mode);
		return "modules/portal/rlzyUserForm";
	}

	/**
	 * 保存个人信息
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:rlzyUser:add","portal:rlzyUser:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(RlzyUser rlzyUser, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(rlzyUser);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		rlzyUserService.save(rlzyUser);//保存
		j.setSuccess(true);
		j.setMsg("保存个人信息成功");
		return j;
	}
	
	/**
	 * 删除个人信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyUser:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(RlzyUser rlzyUser) {
		AjaxJson j = new AjaxJson();
		rlzyUserService.delete(rlzyUser);
		j.setMsg("删除个人信息成功");
		return j;
	}
	
	/**
	 * 批量删除个人信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyUser:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			rlzyUserService.delete(rlzyUserService.get(id));
		}
		j.setMsg("删除个人信息成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyUser:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(RlzyUser rlzyUser, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "个人信息"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<RlzyUser> page = rlzyUserService.findPage(new Page<RlzyUser>(request, response, -1), rlzyUser);
    		new ExportExcel("个人信息", RlzyUser.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出个人信息记录失败！失败信息："+e.getMessage());
		}
			return j;
    }
    
    @ResponseBody
    @RequestMapping(value = "detail")
	public RlzyUser detail(String id) {
		return rlzyUserService.get(id);
	}
	

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyUser:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<RlzyUser> list = ei.getDataList(RlzyUser.class);
			for (RlzyUser rlzyUser : list){
				try{
					rlzyUserService.save(rlzyUser);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条个人信息记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条个人信息记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入个人信息失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入个人信息数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyUser:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "个人信息数据导入模板.xlsx";
    		List<RlzyUser> list = Lists.newArrayList(); 
    		new ExportExcel("个人信息数据", RlzyUser.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }
	

}