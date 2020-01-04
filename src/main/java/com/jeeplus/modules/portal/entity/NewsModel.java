/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;

import java.util.List;

import com.google.common.collect.Lists;
import com.jeeplus.core.persistence.TreeEntity;

/**
 * 新闻模块管理Entity
 * @author 李浩
 * @version 2019-05-21
 */
public class NewsModel extends TreeEntity<NewsModel> {
	
	private static final long serialVersionUID = 1L;
	private String status;		// 模块状态
	private String type;		// 类型
	private String isNav;		// 是否是导航菜单
	private String grade;		// 模块级别
	private String spe1;		// 预留1
	private String spe2;		// 预留2
	
	private List<News> newsList = Lists.newArrayList();		// 子表列表
	
	public NewsModel() {
		super();
	}

	public NewsModel(String id){
		super(id);
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getIsNav() {
		return isNav;
	}

	public void setIsNav(String isNav) {
		this.isNav = isNav;
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	
	public String getSpe1() {
		return spe1;
	}

	public void setSpe1(String spe1) {
		this.spe1 = spe1;
	}
	
	public String getSpe2() {
		return spe2;
	}

	public void setSpe2(String spe2) {
		this.spe2 = spe2;
	}
	
	public  NewsModel getParent() {
			return parent;
	}
	
	@Override
	public void setParent(NewsModel parent) {
		this.parent = parent;
		
	}
	
	public List<News> getNewsList() {
		return newsList;
	}

	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	public String getParentId() {
		return parent != null && parent.getId() != null ? parent.getId() : "0";
	}
}