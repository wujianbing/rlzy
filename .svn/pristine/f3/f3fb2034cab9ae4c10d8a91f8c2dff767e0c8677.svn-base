/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;


import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 视频Entity
 * @author 李浩
 * @version 2019-05-27
 */
public class Video extends DataEntity<Video> {
	
	private static final long serialVersionUID = 1L;
	private String title;		// 标题
	private String brief;		// 简介
	private String content;		// 正文
	private String isTop;		// 是否置顶
	private String audit;		// 审核状态
	private String amount;		// 浏览量
	private VideoModel videoModel;		// 模块id 父类
	private String pic;		// 视频缩略图
	private String path;		// 视频路径
	private String duration;		// 视频时长
	private String source;		// 所属企业
	private String spe2;		// 预留2
	
	public Video() {
		super();
	}

	public Video(String id){
		super(id);
	}

	public Video(VideoModel videoModel){
		this.videoModel = videoModel;
	}

	@ExcelField(title="标题", align=2, sort=1)
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@ExcelField(title="简介", align=2, sort=2)
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
	
	public VideoModel getVideoModel() {
		return videoModel;
	}

	public void setVideoModel(VideoModel videoModel) {
		this.videoModel = videoModel;
	}
	
	@ExcelField(title="视频缩略图", align=2, sort=8)
	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}
	
	@ExcelField(title="视频路径", align=2, sort=9)
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	@ExcelField(title="视频时长", align=2, sort=10)
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}
	
	@ExcelField(title="所属企业", align=2, sort=16)
	public String getSource() {
		return source;
	}

	public void setSource(String spe1) {
		this.source = spe1;
	}
	
	@ExcelField(title="预留2", align=2, sort=17)
	public String getSpe2() {
		return spe2;
	}

	public void setSpe2(String spe2) {
		this.spe2 = spe2;
	}
	
}