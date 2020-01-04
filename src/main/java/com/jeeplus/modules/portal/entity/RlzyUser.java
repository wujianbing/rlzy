/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.google.common.collect.Lists;

import com.jeeplus.core.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 个人信息表Entity
 * @author 喻昆昆
 * @version 2019-11-15
 */
public class RlzyUser extends DataEntity<RlzyUser> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 姓名
	private String sex;		// 性别
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthday;		// 出生年月
	private String age;		// 年龄
	private String photo;		// 照片
	private String nickName;	//昵称
	private String password;	//密码
	private String ismatch;		// 是否婚配
	private String nativeplace;		// 籍贯
	private String liveplace;		// 居住地区
	private String education;		// 学历
	private String workingage;		// 工作年限
	private String email;		// 邮箱
	private String qq;		// QQ
	private String phone;		// 手机号
	private String webchat;		// 微信
	private String currentstate;		// 工作状态
	private String worknature;		// 工作性质
	private String desiredindustry;		// 期望行业
	private String desiredposition;		// 期望职位
	private String salary;		// 期望薪资
	private String selfdescription;		// 自我描述
	private String workplace;		// 工作地区
	private String ispublic;		// 是否公开
	private String deliverytimes;		// 投递次数
	private String resumedoc;		// 简历
	private String cpflag;         //企业或个人标识
	private String major;		// 专业
	private String spe2;		// 预留2
	private String spe3;		// 预留3
	private String utime;
	private String industry;
	private String collectionstate;
	private String userid;
	private String companyid;
	private String relationid;
	private String date;
	private String pageNo;
	private String count;
	private String positionname; //职位名称
	private List<RlzyResume> rlzyResumeList = Lists.newArrayList();		// 子表列表
	
	public RlzyUser() {
		super();
	}

	public RlzyUser(String id){
		super(id);
	}

	@ExcelField(title="姓名", align=2, sort=1)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@ExcelField(title="性别", align=2, sort=2,dictType="sex")
	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	@JsonFormat(pattern = "yyyy-MM HH:mm")
	@ExcelField(title="出生年月", align=2, sort=3)
	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@ExcelField(title="年龄", align=2, sort=4)
	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	@ExcelField(title="是否婚配", align=2, sort=6,dictType="is_match")
	public String getIsmatch() {
		return ismatch;
	}

	public void setIsmatch(String ismatch) {
		this.ismatch = ismatch;
	}
	
	@ExcelField(title="籍贯", align=2, sort=7)
	public String getNativeplace() {
		return nativeplace;
	}

	public void setNativeplace(String nativeplace) {
		this.nativeplace = nativeplace;
	}
	
	@ExcelField(title="居住地区", align=2, sort=8)
	public String getLiveplace() {
		return liveplace;
	}

	public void setLiveplace(String liveplace) {
		this.liveplace = liveplace;
	}
	
	@ExcelField(title="工作地区", align=2, sort=9)
	public String getWorkplace() {
		return workplace;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public void setWorkplace(String workplace) {
		this.workplace = workplace;
	}

	@ExcelField(title="学历", align=2, sort=11,dictType="education")
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	@ExcelField(title="工作年限", align=2, sort=12,dictType="working_age")
	public String getWorkingage() {
		return workingage;
	}

	public void setWorkingage(String workingage) {
		this.workingage = workingage;
	}
	
	@ExcelField(title="邮箱", align=2, sort=13)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}
	
	@ExcelField(title="手机号", align=2, sort=14)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getWebchat() {
		return webchat;
	}

	public void setWebchat(String webchat) {
		this.webchat = webchat;
	}
	
	@ExcelField(title="工作状态", align=2, sort=15,dictType="current_state")
	public String getCurrentstate() {
		return currentstate;
	}

	public void setCurrentstate(String currentstate) {
		this.currentstate = currentstate;
	}
	
	@ExcelField(title="工作性质", align=2, sort=16,dictType="work_nature")
	public String getWorknature() {
		return worknature;
	}

	public void setWorknature(String worknature) {
		this.worknature = worknature;
	}
	
	@ExcelField(title="期望行业", align=2, sort=17,dictType="desired_industry")
	public String getDesiredindustry() {
		return desiredindustry;
	}

	public void setDesiredindustry(String desiredindustry) {
		this.desiredindustry = desiredindustry;
	}
	
	@ExcelField(title="期望职位", align=2, sort=19)
	public String getDesiredposition() {
		return desiredposition;
	}

	public void setDesiredposition(String desiredposition) {
		this.desiredposition = desiredposition;
	}
	
	@ExcelField(title="期望薪资", align=2, sort=20,dictType="salary")
	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	@ExcelField(title="自我描述", align=2, sort=21)
	public String getSelfdescription() {
		return selfdescription;
	}

	public void setSelfdescription(String selfdescription) {
		this.selfdescription = selfdescription;
	}
	
	@ExcelField(title="是否公开", align=2, sort=22,dictType="desired_position")
	public String getIspublic() {
		return ispublic;
	}

	public void setIspublic(String ispublic) {
		this.ispublic = ispublic;
	}
	
	@ExcelField(title="投递次数", align=2, sort=22)
	public String getDeliverytimes() {
		return deliverytimes;
	}

	public void setDeliverytimes(String deliverytimes) {
		this.deliverytimes = deliverytimes;
	}
	
	public String getResumedoc() {
		return resumedoc;
	}

	public void setResumedoc(String resumedoc) {
		this.resumedoc = resumedoc;
	}
	
	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getCpflag() {
		return cpflag;
	}

	public void setCpflag(String cpflag) {
		this.cpflag = cpflag;
	}

	
	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getSpe2() {
		return spe2;
	}
	public void setSpe2(String spe2) {
		this.spe2 = spe2;
	}
	public String getSpe3() {
		return spe3;
	}

	public void setSpe3(String spe3) {
		this.spe3 = spe3;
	}
	
	public List<RlzyResume> getRlzyResumeList() {
		return rlzyResumeList;
	}

	public void setRlzyResumeList(List<RlzyResume> rlzyResumeList) {
		this.rlzyResumeList = rlzyResumeList;
	}

	public String getUtime() {
		return utime;
	}

	public void setUtime(String utime) {
		this.utime = utime;
	}

	public String getCollectionstate() {
		return collectionstate;
	}

	public void setCollectionstate(String collectionstate) {
		this.collectionstate = collectionstate;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	public String getRelationid() {
		return relationid;
	}

	public void setRelationid(String relationid) {
		this.relationid = relationid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getPositionname() {
		return positionname;
	}

	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}
	
}