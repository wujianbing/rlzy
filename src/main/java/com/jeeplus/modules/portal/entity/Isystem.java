package com.jeeplus.modules.portal.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.jeeplus.core.persistence.DataEntity;

public class Isystem extends DataEntity<Isystem> {

	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String count;		// 访问量
	private String companyCount;
	private String userCount;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createDate; //日期
	
	public Isystem() {
		super();
	}
	public Isystem(String id){
		super(id);
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getCompanyCount() {
		return companyCount;
	}
	public void setCompanyCount(String companyCount) {
		this.companyCount = companyCount;
	}
	public String getUserCount() {
		return userCount;
	}
	public void setUserCount(String userCount) {
		this.userCount = userCount;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}
