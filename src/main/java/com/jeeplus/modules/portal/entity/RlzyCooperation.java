/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 合作企业Entity
 * @author 喻昆昆
 * @version 2019-12-23
 */
public class RlzyCooperation extends DataEntity<RlzyCooperation> {
	
	private static final long serialVersionUID = 1L;
	private String companyid;		// 父级企业id
	private String companyname;		// 企业名称
	private String companyscale;		// 企业规模
	private String companynature;		// 企业性质
	private String registeredcapital;		// 注册资金
	private String localplace;		  //所在地区
	private String companywebsite;		// 企业网址
	private String industry;		// 所属行业
	private String companyprofile;		// 企业简
	private String businesslicense;		// 营业执照
	private String contacts;		// 联系人
	private String phone;			//座机
	private String telephone;		// 联系电话
	private String email;		// 邮箱
	private String qq;		// QQ
	private String webchat;		// 微信
	private String logo;		// 企业logo
	private String address;		// 联系地址
	private String creditcode;  //信用代码
	
	public RlzyCooperation() {
		super();
	}

	public RlzyCooperation(String id){
		super(id);
	}

	@ExcelField(title="父级企业id", align=2, sort=1)
	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	
	@ExcelField(title="企业名称", align=2, sort=2)
	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	
	@ExcelField(title="企业logo", align=2, sort=3)
	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}
	
	@ExcelField(title="注册资金", align=2, sort=4)
	public String getRegisteredcapital() {
		return registeredcapital;
	}

	public void setRegisteredcapital(String registeredcapital) {
		this.registeredcapital = registeredcapital;
	}
	
	@ExcelField(title="所在地区", align=2, sort=5)
	public String getLocalplace() {
		return localplace;
	}

	public void setLocalplace(String localplace) {
		this.localplace = localplace;
	}
	
	@ExcelField(title="所属行业", align=2, sort=6)
	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	@ExcelField(title="企业简介", align=2, sort=7)
	public String getCompanyprofile() {
		return companyprofile;
	}

	public void setCompanyprofile(String companyprofile) {
		this.companyprofile = companyprofile;
	}
	
	@ExcelField(title="联系人", align=2, sort=8)
	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	
	@ExcelField(title="座机", align=2, sort=9)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@ExcelField(title="联系电话", align=2, sort=10)
	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	@ExcelField(title="QQ", align=2, sort=11)
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@ExcelField(title="微信", align=2, sort=12)
	public String getWebchat() {
		return webchat;
	}

	public void setWebchat(String webchat) {
		this.webchat = webchat;
	}
	
	@ExcelField(title="联系地址", align=2, sort=13)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCompanyscale() {
		return companyscale;
	}

	public void setCompanyscale(String companyscale) {
		this.companyscale = companyscale;
	}

	public String getCompanynature() {
		return companynature;
	}

	public void setCompanynature(String companynature) {
		this.companynature = companynature;
	}

	public String getCompanywebsite() {
		return companywebsite;
	}

	public void setCompanywebsite(String companywebsite) {
		this.companywebsite = companywebsite;
	}

	public String getBusinesslicense() {
		return businesslicense;
	}

	public void setBusinesslicense(String businesslicense) {
		this.businesslicense = businesslicense;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getCreditcode() {
		return creditcode;
	}

	public void setCreditcode(String creditcode) {
		this.creditcode = creditcode;
	}
	
}