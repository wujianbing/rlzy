/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;


import com.jeeplus.common.utils.excel.annotation.ExcelField;
import com.jeeplus.core.persistence.DataEntity;

/**
 * 新闻Entity
 * @author 李浩
 * @version 2019-05-21
 */
public class News extends DataEntity<News> {
	
	private static final long serialVersionUID = 1L;
	private NewsModel newsModel;// 新闻模块id 父类
	private String title;		// title
	private String brief;		// 简介
	private String content;		// 正文
	private String isTop;		// 是否置顶 1表示置顶  2表示不置顶
	private String audit;		// 审核状态
	private String amount;		// 浏览量
	private String pic;		    // 图片
	private String spe1;		// 预留1
	private String spe2;		// 预留2s
	public News() {
		super();
	}

	public News(String id){
		super(id);
	}

	public News(NewsModel newsModel){
		this.newsModel = newsModel;
	}

	@ExcelField(title="新闻标题", align=2, sort=1)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@ExcelField(title="新闻简介", align=2, sort=2)
	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}
	
	@ExcelField(title="正文", align=2, sort=3)
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@ExcelField(title="是否置顶", dictType="is_top", align=2, sort=4)
	public String getIsTop() {
		return isTop;
	}

	public void setIsTop(String isTop) {
		this.isTop = isTop;
	}
	
	@ExcelField(title="审核状态", align=2, sort=5)
	public String getAudit() {
		return audit;
	}

	public void setAudit(String audit) {
		this.audit = audit;
	}
	
	@ExcelField(title="浏览量", align=2, sort=6)
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public NewsModel getNewsModel() {
		return newsModel;
	}

	public void setNewsModel(NewsModel newsModel) {
		this.newsModel = newsModel;
	}
	
	@ExcelField(title="新闻图片", align=2, sort=8)
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
	public String getSpe1() {
		return spe1;
	}

	public void setSpe1(String spe1) {
		this.spe1 = spe1;
	}

	@ExcelField(title="预留2", align=2, sort=15)
	public String getSpe2() {
		return spe2;
	}

	public void setSpe2(String spe2) {
		this.spe2 = spe2;
	}

}