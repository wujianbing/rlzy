/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.entity;


import com.jeeplus.common.utils.excel.annotation.ExcelField;
import com.jeeplus.core.persistence.DataEntity;

/**
 * 职位表Entity
 * @author 喻昆昆
 * @version 2019-11-15
 */
public class RlzyPosition extends DataEntity<RlzyPosition> {
	
	private static final long serialVersionUID = 1L;
	private String companyid;		// 企业id
	private String positiontype;		// 工作性质
	private String positionname;		// 职业名称
	private String workingplace;		// 工作地点
	private String salaryrange;		// 薪资范围
	private String education;		// 学历
	private String workingage;		// 工作经验
	private String recruitnumber;		// 招聘人数
	private String welfaretype;		// 福利
	private String contacts;		// 联系人
	private String phone;		// 联系电话
	private String positiondescription;		// 职位描述
	private String postflag;		// 是否急聘  0否 1是
	private String agerequirement;		// 年龄要求
	private String num;		// 更新时间 3天7天15天
	private String isTop;		// 是否置顶
	private String spe3; //保留字段3
	private RlzyCompany rlzyCompany;
	private String companyname;
	private String companywebsite;
	private String industry;
	private String companyscale;
	private String collectionstate;
	private String deliverystate;
	private String userid;
	private String line;  //是否上线   1上线  2下线
	private String count;
	private String date;
	private String email;
	private String pageNo;
	private String utime;
	private String status;//登录状态
	private String flag;
	
	public RlzyPosition(RlzyCompany rlzyCompany){
		this.rlzyCompany = rlzyCompany;
	}
	public RlzyCompany getRlzyCompany() {
		return rlzyCompany;
	}

	public void setRlzyCompany(RlzyCompany rlzyCompany) {
		this.rlzyCompany = rlzyCompany;
	}

	public RlzyPosition() {
		super();
	}

	public RlzyPosition(String id){
		super(id);
	}

	@ExcelField(title="企业id", align=2, sort=1)
	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	
	@ExcelField(title="职业类型", align=2, sort=2)
	public String getPositiontype() {
		return positiontype;
	}

	public void setPositiontype(String positiontype) {
		this.positiontype = positiontype;
	}
	
	@ExcelField(title="职业名称", align=2, sort=3)
	public String getPositionname() {
		return positionname;
	}

	public void setPositionname(String positionname) {
		this.positionname = positionname;
	}
	
	public String getWorkingplace() {
		return workingplace;
	}
	public void setWorkingplace(String workingplace) {
		this.workingplace = workingplace;
	}
	@ExcelField(title="薪资范围", align=2, sort=7)
	public String getSalaryrange() {
		return salaryrange;
	}

	public void setSalaryrange(String salaryrange) {
		this.salaryrange = salaryrange;
	}
	
	@ExcelField(title="学历", align=2, sort=8)
	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}
	
	@ExcelField(title="工作经验", align=2, sort=9)
	public String getWorkingage() {
		return workingage;
	}

	public void setWorkingage(String workingage) {
		this.workingage = workingage;
	}
	
	@ExcelField(title="招聘人数", align=2, sort=10)
	public String getRecruitnumber() {
		return recruitnumber;
	}

	public void setRecruitnumber(String recruitnumber) {
		this.recruitnumber = recruitnumber;
	}
	
	@ExcelField(title="福利", align=2, sort=11)
	public String getWelfaretype() {
		return welfaretype;
	}

	public void setWelfaretype(String welfaretype) {
		this.welfaretype = welfaretype;
	}
	
	@ExcelField(title="联系人", align=2, sort=12)
	public String getContacts() {
		return contacts;
	}

	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	
	@ExcelField(title="联系电话", align=2, sort=13)
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@ExcelField(title="职位描述", align=2, sort=14)
	public String getPositiondescription() {
		return positiondescription;
	}

	public void setPositiondescription(String positiondescription) {
		this.positiondescription = positiondescription;
	}
	
	@ExcelField(title="是否急聘", align=2, sort=15)
	public String getPostflag() {
		return postflag;
	}
	public void setPostflag(String postflag) {
		this.postflag = postflag;
	}
	
	public String getAgerequirement() {
		return agerequirement;
	}
	
	public void setAgerequirement(String agerequirement) {
		this.agerequirement = agerequirement;
	}
	
	@ExcelField(title="次数", align=2, sort=18)
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	
	public String getIsTop() {
		return isTop;
	}
	public void setIsTop(String isTop) {
		this.isTop = isTop;
	}
	
	public String getCompanyname() {
		return companyname;
	}
	
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	
	public String getCompanywebsite() {
		return companywebsite;
	}
	
	public void setCompanywebsite(String companywebsite) {
		this.companywebsite = companywebsite;
	}
	
	public String getIndustry() {
		return industry;
	}
	
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	
	public String getCompanyscale() {
		return companyscale;
	}
	
	public void setCompanyscale(String companyscale) {
		this.companyscale = companyscale;
	}
	
	public String getCollectionstate() {
		return collectionstate;
	}
	
	public void setCollectionstate(String collectionstate) {
		this.collectionstate = collectionstate;
	}
	
	public String getDeliverystate() {
		return deliverystate;
	}
	
	public void setDeliverystate(String deliverystate) {
		this.deliverystate = deliverystate;
	}
	
	public String getUserid() {
		return userid;
	}
	
	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getSpe3() {
		return spe3;
	}
	
	public void setSpe3(String spe3) {
		this.spe3 = spe3;
	}
	public String getLine() {
		return line;
	}
	public void setLine(String line) {
		this.line = line;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getUtime() {
		return utime;
	}
	public void setUtime(String utime) {
		this.utime = utime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	
	
}