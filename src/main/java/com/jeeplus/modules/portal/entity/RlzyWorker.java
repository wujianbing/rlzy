/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 用人信息Entity
 * @author 喻昆昆
 * @version 2019-12-23
 */
public class RlzyWorker extends DataEntity<RlzyWorker> {
	
	private static final long serialVersionUID = 1L;
	private String companyid;		// 合作企业id
	private String parentid;		// 父级企业id
	private String name;		// 姓名
	private String sex;		// 性别
	private Date birthday;		// 出生年月
	private String age;		// 年龄
	private String photo;		// 头像
	private String liveplace;		// 居住区
	private String qq;		// QQ
	private String phone;		// 手机号
	private String webchat;		// 微信
	private String selfdescription;		// 自我描述
	private String resumedoc;		// 简历
	private String dispatchstate;		// 派遣状态
	private String ismatch;
	private String education;
	private String major;
	private String desiredindustry;
	private String salary;
	
	public RlzyWorker() {
		super();
	}

	public RlzyWorker(String id){
		super(id);
	}

	@ExcelField(title="合作企业id", align=2, sort=1)
	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	
	@ExcelField(title="父级企业id", align=2, sort=2)
	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}
	
	@ExcelField(title="姓名", align=2, sort=3)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ExcelField(title="性别", align=2, sort=4)
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="出生年月", align=2, sort=5)
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@ExcelField(title="年龄", align=2, sort=6)
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	@ExcelField(title="头像", align=2, sort=7)
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@ExcelField(title="居住区", align=2, sort=8)
	public String getLiveplace() {
		return liveplace;
	}

	public void setLiveplace(String liveplace) {
		this.liveplace = liveplace;
	}
	
	@ExcelField(title="QQ", align=2, sort=9)
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@ExcelField(title="手机号", align=2, sort=10)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@ExcelField(title="微信", align=2, sort=11)
	public String getWebchat() {
		return webchat;
	}

	public void setWebchat(String webchat) {
		this.webchat = webchat;
	}
	
	@ExcelField(title="自我描述", align=2, sort=12)
	public String getSelfdescription() {
		return selfdescription;
	}

	public void setSelfdescription(String selfdescription) {
		this.selfdescription = selfdescription;
	}
	
	@ExcelField(title="简历", align=2, sort=13)
	public String getResumedoc() {
		return resumedoc;
	}

	public void setResumedoc(String resumedoc) {
		this.resumedoc = resumedoc;
	}
	
	@ExcelField(title="派遣状态", align=2, sort=14)
	public String getDispatchstate() {
		return dispatchstate;
	}

	public void setDispatchstate(String dispatchstate) {
		this.dispatchstate = dispatchstate;
	}

	public String getIsmatch() {
		return ismatch;
	}

	public void setIsmatch(String ismatch) {
		this.ismatch = ismatch;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getDesiredindustry() {
		return desiredindustry;
	}

	public void setDesiredindustry(String desiredindustry) {
		this.desiredindustry = desiredindustry;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}