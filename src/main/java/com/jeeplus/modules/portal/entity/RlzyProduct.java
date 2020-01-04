/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 产品信息Entity
 * @author 喻昆昆
 * @version 2019-12-05
 */
public class RlzyProduct extends DataEntity<RlzyProduct> {
	
	private static final long serialVersionUID = 1L;
	private String companyid;		// 企业id
	private String title;		// 产品名称
	private String intro;
	private String content;		// 产品内容
	
	public RlzyProduct() {
		super();
	}

	public RlzyProduct(String id){
		super(id);
	}

	@ExcelField(title="企业id", align=2, sort=1)
	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	
	@ExcelField(title="产品名称", align=2, sort=2)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@ExcelField(title="产品内容", align=2, sort=3)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@ExcelField(title="产品简介", align=2, sort=4)
	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
	
}