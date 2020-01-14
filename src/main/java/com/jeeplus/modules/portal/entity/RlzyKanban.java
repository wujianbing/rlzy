package com.jeeplus.modules.portal.entity;

import java.util.Date;

import com.jeeplus.core.persistence.DataEntity;

@SuppressWarnings("serial")
public class RlzyKanban extends DataEntity<RlzyKanban>{
	
	private String name;
	
	private String value;
	
	private Date createDate;
	
	public Date getCreateDate() {
		return createDate;
	}
	
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	
}
