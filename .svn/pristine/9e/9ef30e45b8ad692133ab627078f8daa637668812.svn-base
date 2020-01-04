/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.sys.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;

import com.jeeplus.core.persistence.TreeEntity;

/**
 * 职业类型Entity
 * @author yukk
 * @version 2019-11-13
 */
public class SysPostion extends TreeEntity<SysPostion> {
	
	private static final long serialVersionUID = 1L;
	private String code;		// 职位编码
	private String type;		// 行业类型
	
	
	public SysPostion() {
		super();
	}

	public SysPostion(String id){
		super(id);
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public  SysPostion getParent() {
			return parent;
	}
	
	@Override
	public void setParent(SysPostion parent) {
		this.parent = parent;
		
	}
	
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}