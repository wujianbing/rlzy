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
import com.jeeplus.modules.portal.entity.RlzyProduct;
import com.jeeplus.modules.portal.service.RlzyProductService;

/**
 * 产品信息Controller
 * @author 喻昆昆
 * @version 2019-12-05
 */
@Controller
@RequestMapping(value = "${adminPath}/portal/rlzyProduct")
public class RlzyProductController extends BaseController {

	@Autowired
	private RlzyProductService rlzyProductService;
	
	@ModelAttribute
	public RlzyProduct get(@RequestParam(required=false) String id) {
		RlzyProduct entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = rlzyProductService.get(id);
		}
		if (entity == null){
			entity = new RlzyProduct();
		}
		return entity;
	}
	
	/**
	 * 产品信息列表页面
	 */
	@RequiresPermissions("portal:rlzyProduct:list")
	@RequestMapping(value = {"list", ""})
	public String list(RlzyProduct rlzyProduct, Model model) {
		model.addAttribute("rlzyProduct", rlzyProduct);
		return "modules/portal/rlzyProductList";
	}
	
		/**
	 * 产品信息列表数据
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyProduct:list")
	@RequestMapping(value = "data")
	public Map<String, Object> data(RlzyProduct rlzyProduct, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<RlzyProduct> page = rlzyProductService.findPage(new Page<RlzyProduct>(request, response), rlzyProduct); 
		return getBootstrapData(page);
	}

	/**
	 * 查看，增加，编辑产品信息表单页面
	 */
	@RequiresPermissions(value={"portal:rlzyProduct:view","portal:rlzyProduct:add","portal:rlzyProduct:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(RlzyProduct rlzyProduct, Model model) {
		model.addAttribute("rlzyProduct", rlzyProduct);
		return "modules/portal/rlzyProductForm";
	}

	/**
	 * 保存产品信息
	 */
	@ResponseBody
	@RequiresPermissions(value={"portal:rlzyProduct:add","portal:rlzyProduct:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public AjaxJson save(RlzyProduct rlzyProduct, Model model) throws Exception{
		AjaxJson j = new AjaxJson();
		/**
		 * 后台hibernate-validation插件校验
		 */
		String errMsg = beanValidator(rlzyProduct);
		if (StringUtils.isNotBlank(errMsg)){
			j.setSuccess(false);
			j.setMsg(errMsg);
			return j;
		}
		//新增或编辑表单保存
		rlzyProductService.save(rlzyProduct);//保存
		j.setSuccess(true);
		j.setMsg("保存产品信息成功");
		return j;
	}
	
	/**
	 * 删除产品信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyProduct:del")
	@RequestMapping(value = "delete")
	public AjaxJson delete(RlzyProduct rlzyProduct) {
		AjaxJson j = new AjaxJson();
		rlzyProductService.delete(rlzyProduct);
		j.setMsg("删除产品信息成功");
		return j;
	}
	
	/**
	 * 批量删除产品信息
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyProduct:del")
	@RequestMapping(value = "deleteAll")
	public AjaxJson deleteAll(String ids) {
		AjaxJson j = new AjaxJson();
		String idArray[] =ids.split(",");
		for(String id : idArray){
			rlzyProductService.delete(rlzyProductService.get(id));
		}
		j.setMsg("删除产品信息成功");
		return j;
	}
	
	/**
	 * 导出excel文件
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyProduct:export")
    @RequestMapping(value = "export")
    public AjaxJson exportFile(RlzyProduct rlzyProduct, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "产品信息"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<RlzyProduct> page = rlzyProductService.findPage(new Page<RlzyProduct>(request, response, -1), rlzyProduct);
    		new ExportExcel("产品信息", RlzyProduct.class).setDataList(page.getList()).write(response, fileName).dispose();
    		j.setSuccess(true);
    		j.setMsg("导出成功！");
    		return j;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导出产品信息记录失败！失败信息："+e.getMessage());
		}
			return j;
    }

	/**
	 * 导入Excel数据

	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyProduct:import")
    @RequestMapping(value = "import")
   	public AjaxJson importFile(@RequestParam("file")MultipartFile file, HttpServletResponse response, HttpServletRequest request) {
		AjaxJson j = new AjaxJson();
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<RlzyProduct> list = ei.getDataList(RlzyProduct.class);
			for (RlzyProduct rlzyProduct : list){
				try{
					rlzyProductService.save(rlzyProduct);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条产品信息记录。");
			}
			j.setMsg( "已成功导入 "+successNum+" 条产品信息记录"+failureMsg);
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg("导入产品信息失败！失败信息："+e.getMessage());
		}
		return j;
    }
	
	/**
	 * 下载导入产品信息数据模板
	 */
	@ResponseBody
	@RequiresPermissions("portal:rlzyProduct:import")
    @RequestMapping(value = "import/template")
     public AjaxJson importFileTemplate(HttpServletResponse response) {
		AjaxJson j = new AjaxJson();
		try {
            String fileName = "产品信息数据导入模板.xlsx";
    		List<RlzyProduct> list = Lists.newArrayList(); 
    		new ExportExcel("产品信息数据", RlzyProduct.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			j.setSuccess(false);
			j.setMsg( "导入模板下载失败！失败信息："+e.getMessage());
		}
		return j;
    }

}