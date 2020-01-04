/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;


import com.jeeplus.common.utils.excel.annotation.ExcelField;
import com.jeeplus.core.persistence.DataEntity;

/**
 * 友情链接Entity
 * @author 李浩
 * @version 2019-06-03
 */
public class Link extends DataEntity<Link> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 公司名称
	private String url;		// 公司地址
	private String pic;		// 图片
	private Integer sort;
	private String status;		// 状态
	private String phone;		// 联系电话
	private String emile;		// 邮箱
	
	public Link() {
		super();
	}

	public Link(String id){
		super(id);
	}

	@ExcelField(title="公司名称", align=2, sort=1)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ExcelField(title="公司地址", align=2, sort=2)
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
	@ExcelField(title="图片", align=2, sort=3)
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
	@ExcelField(title="状态", dictType="status_type", align=2, sort=5)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@ExcelField(title="联系电话", align=2, sort=11)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@ExcelField(title="电子邮箱", align=2, sort=12)
	public String getEmile() {
		return emile;
	}

	public void setEmile(String emile) {
		this.emile = emile;
	}

	@ExcelField(title="排序", align=2, sort=4)
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
}