<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>我的简历</title>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/js/common/citySet/citySet.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/myFind.css" />
		<style type="text/css">
			body .demo-class .layui-layer-title{background:#c00; color:#fff; border: none;}
		</style>
</head>
<body>
		<div id="app" class="jlpage">
			<!--基本信息-->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">基本信息</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="1" class="layui-btn layui-btn-primary revise" >修改</button>
					</span>
				</div>
				<div id="basic_info" data-id="1" class="info-basic">
					<div data-id="1" class="leftimg">
						<form:form action="" modelAttribute="rlzyUser" method="post" id="form1">
							<input name="id" id="id" type="hidden" value="${rlzyUser.id }">
							<div class="acp">
								<span class="acp-span">姓&nbsp;&nbsp;名：</span>
								<input class="form-control gname" type="text" name="name" value="${rlzyUser.name }" disabled="true" />
							</div>
							<div class="acp">
								<span class="acp-span">性&nbsp;&nbsp;别：</span>
								<form:select class="form-control gname" disabled="true" path="sex">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
							<div class="acp">
								<span class="acp-span">年&nbsp;&nbsp;龄：</span>
								<input class="form-control gname" type="text" name="age" value="${rlzyUser.age }" disabled="true">
							</div>
							<div class="acp">
								<span class="acp-span">婚&nbsp;&nbsp;否：</span>
								<form:select class="form-control gname" disabled="true" path="ismatch">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('is_match')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
							<div class="acp">
								<span class="acp-span">学&nbsp;&nbsp;历： </span>
								<form:select class="form-control gname" disabled="false" path="education">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('education')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
							<div class="acp">
								<span class="acp-span">工作经验：</span>
								<form:select class="form-control gname" disabled="false" path="workingage">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('working_age')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
							<div class="acp">
								<span class="acp-span">居住地：</span>
								<input id="liveplace" type="text" name="liveplace" value="${rlzyUser.liveplace }" class="form-control gname" placeholder="请输入居住地" disabled="true">
							</div>
							
							<div class="acp">
								<span class="acp-span">籍&nbsp;&nbsp;贯：</span>
								<input class="form-control gname" type="text" name="nativeplace" value="${rlzyUser.nativeplace }" disabled="true">
							</div>
							<div class="acp">
								<span class="acp-span">Q&nbsp;Q：</span>
								<input class="form-control gname" type="text" name="qq" value="${rlzyUser.qq }" disabled="true">
							</div>
							<div class="acp">
								<span class="acp-span">微信号：</span>
								<input class="form-control gname" type="text" name="webchat" value="${rlzyUser.webchat }" disabled="true">
							</div>
							<div class="acp">
								<span class="acp-span">手机号：</span>
								<input class="form-control gname" type="text" name="phone" value="${rlzyUser.phone }" disabled="true" >
							</div>
							<div class="acp">
								<span class="acp-span">是否公开：</span>
								<form:select class="form-control gname" disabled="false" path="ispublic">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('is_public')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						
					</div>
					<!--右边头像部分-->
					<div class="rightimg">
						<div id="addCommodityIndex">
							<!--input-group start-->
							<div class="input-group row">
								<div class="big-photo">
									<div id="preview">
									<c:if test="${rlzyUser.photo != '' && rlzyUser.photo!= null}">
										<img border="0" src="${rlzyUser.photo}" width="120" height="140">
									</c:if>
									<c:if test="${rlzyUser.photo == '' || rlzyUser.photo == null}">
										<img id="imghead" border="0" src="${ctxStatic }/rlzy/img/yc.png" width="120" height="140">
									</c:if>
									</div>
									<input type="file" onchange="previewImage(this)" style="display: none;" id="previewImg">
									<input type="text" name="photo" hidden="hidden" id="img" value="${rlzyUser.photo}">
									<!--<input id="uploaderInput" class="uploader__input" style="display: none;" type="file" accept="" multiple="">-->
								</div>
								<div class="">
									<label class="imgnmanee" onclick="$('#previewImg').click();">上传</label>
								</div>
							</div>
							<!--input-group end-->
						</div>
					</div>
				</div>
			</div>
			</form:form>
			<!--求职意向-->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">求职意向</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="2" class="layui-btn layui-btn-primary revise">修改</button>
					</span>
				</div>
				<div id="job_want" class="bacs">
					<form:form action="" method="post" modelAttribute="rlzyUser" id="form2">
						<div class="acp">
							<span class="acp-span">求职状态：</span>
							<form:select class="form-control gname" disabled="true" path="currentstate" name="currentstate">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('current_state')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
						<div class="acp">
							<span class="acp-span">工作性质：</span>
							<form:select class="form-control gname" disabled="true" path="worknature" name="worknature">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('work_nature')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
						<div class="acp">
							<span class="acp-span">工作地区：</span>
							<input id="workplace" type="text" name="workplace" value="${rlzyUser.workplace }" class="form-control gname" placeholder="请输入工作地区" disabled="true">
						</div>
						<div class="acp">
							<span class="acp-span">期望行业：</span>
							<form:select class="form-control gname" disabled="true" path="desiredindustry" name="desiredindustry">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('desired_industry')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
						<div class="acp">
							<span class="acp-span">期望职位：</span>
							 <input type="text" name="desiredposition" disabled="true" required value="${rlzyUser.desiredposition }"
											lay-verify="required" placeholder="请选择期望职业"
											autocomplete="off" class="form-control  gname" id="workchange">
							 <%-- <form:select class="form-control gname" disabled="true" path="desiredposition" name="desiredposition">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('desired_position')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select> --%>
						</div>
						<div class="acp">
							<span class="acp-span">期望薪资：</span>
							<form:select class="form-control gname" disabled="true" path="salary" name="salary">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('salary')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
					</form:form>
				</div>
			</div>
			<!--职位描述-->
			<div class="infoname infolast">
				<div class="info-tit">
					<span class="name1">自我描述</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="3" class="layui-btn layui-btn-primary revise">修改</button>
					</span>
				</div>
				<div class="bacs">
					<div id="decs_txt" class="wordmy1"></div>
					<div class="wordmy" style="display: none;">
						<form:form action="" modelAttribute="rlzyUser" method="post" id="form3">
							<div class="sr">
								<textarea style="width: 670px;" name="selfdescription" class="layui-textarea textarea-sr" placeholder="客观全面的自我评价更容易获得企业的好感，快来完善以获得HR的亲睐！">${rlzyUser.selfdescription }</textarea>
							</div>
							<div class="pe">
								<button id="decs_btn" type="button" class="layui-btn">保存</button>
								<button type="button" class="layui-btn layui-btn-primary">取消</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
			
			<!-- 教育经历 -->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">教育经历</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="4" class="layui-btn layui-btn-primary revise">添加</button>
					</span>
				</div>
				<div class="timeline-v">
					<ul id="timeline_teach" class="layui-timeline">
					  <c:forEach items="${rlzyResumeList }" var="rlzyResume" >
					    <c:if test="${rlzyResume.experiencetype==1 }">
						<li class="layui-timeline-item">
							<i class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text timeline-flex">
								<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1"><fmt:formatDate value="${rlzyResume.startdate }" pattern="yyyy-MM"/></span>至<span class="studyTime2"><fmt:formatDate value="${rlzyResume.enddate }" pattern="yyyy-MM"/></span>【${fns:getComparePrecise(rlzyResume.startdate,rlzyResume.enddate)}】</h3>
								<h3 data-id="${rlzyResume.id}"  class="layui-timeline-title rev-teach2 layui-timeline-mar">${fns:getDictLabel(rlzyResume.education, "education", defaultValue)}</h3>
								<h3 class="layui-timeline-title rev-teach3 layui-timeline-mar">${rlzyResume.name }</h3>
								<h3 class="layui-timeline-title rev-teach4 layui-timeline-mar">${rlzyResume.major }</h3>
								<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.teachRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>
							</div>
						</li>
						</c:if>
					  </c:forEach>
					</ul>
				</div>
				<div class="teach" style="display: none;" class="col-md-12 bacs" id="id" >
					<form:form class="layui-form" lay-filter="teach-from" action="" method="post" modelAttribute="rlzyResume" id="form10" >
					     <input value="1" hidden="hidden" name="experiencetype">
					     <input value="${rlzyUser.id }" hidden="hidden" name="userid">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>学校名称</label>
							<div class="layui-input-block">
								<input type="text" name="name" required lay-verify="required" placeholder="请输入学校名称" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>专业名称</label>
							<div class="layui-input-block">
								<input type="text" name="major" required lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>学历</label>
							<div class="layui-input-block">
								<form:select id="teach_sel" lay-verify="required" path="education">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('education')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>就读时间</label>
							<div class="layui-input-block d-flex width-time">
								<input id="studyTime1" name="startdate" type="text" required lay-verify="required" placeholder="请选择开始时间"
								 autocomplete="off" class="layui-input layui-input-time">
								<span class="to">至</span>
								<input id="studyTime2" name="enddate" type="text" required lay-verify="required" placeholder="请选择结束时间"
								 autocomplete="off" class="layui-input layui-input-time">
							</div>
						</div>
						<div class="layui-form-item" style="display: none;">
							<label class="layui-form-label"><span class="red"></span>主键id</label>
							<div class="layui-input-block">
								<input type="text" name="id" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button id="teach_btn" class="layui-btn" lay-submit lay-filter="formTeach">提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
			
			<!-- 工作经历 -->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">工作经历</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="5" class="layui-btn layui-btn-primary revise">添加</button>
					</span>
				</div>
				<div class="timeline-v">
					<ul id="timeline_job" class="layui-timeline">
					  <c:forEach items="${rlzyResumeList }" var="rlzyResume" >
					    <c:if test="${rlzyResume.experiencetype==2 }">
						<li class="layui-timeline-item">
							<i class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text timeline-flex">
								<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1"><fmt:formatDate value="${rlzyResume.startdate }" pattern="yyyy-MM"/></span>至<span class="studyTime2"><fmt:formatDate value="${rlzyResume.enddate }" pattern="yyyy-MM"/></span>【${fns:getComparePrecise(rlzyResume.startdate,rlzyResume.enddate)}】</h3>
								<h3 data-id="${rlzyResume.id}"  class="layui-timeline-title rev-teach2 layui-timeline-mar">${rlzyResume.major}</h3>
								<h3 class="layui-timeline-title rev-teach3 layui-timeline-mar">${rlzyResume.name }</h3>
								<h3 class="layui-timeline-title rev-teach4 layui-timeline-mar">${rlzyResume.describes }</h3>
								<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.jobRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>
							</div>
						</li>
						</c:if>
					  </c:forEach>
					</ul>
				</div>
				<div class="job" class="col-md-12 bacs" style="display: none;">
					<form class="layui-form" lay-filter="job-from" action="">
					<input value="2" hidden="hidden" name="experiencetype">
					<input value="${rlzyUser.id }" hidden="hidden" name="userid">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>公司名称</label>
							<div class="layui-input-block">
								<input type="text" name="name" required lay-verify="required" placeholder="请输入公司名称" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>职位名称</label>
							<div class="layui-input-block">
								<input type="text" name="major" required lay-verify="required" placeholder="请输入职位名称" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>任职时间</label>
							<div class="layui-input-block d-flex width-time">
								<input id="jobTime1" name="startdate" type="text" required lay-verify="required" placeholder="请选择开始时间"
								 autocomplete="off" class="layui-input layui-input-time">
								<span class="to">至</span>
								<input id="jobTime2" name="enddate" type="text" required lay-verify="required" placeholder="请选择结束时间"
								 autocomplete="off" class="layui-input layui-input-time">
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label"><span class="red">*</span>工作职责</label>
							<div class="layui-input-block width-time">
								<textarea name="describes" required lay-verify="required" placeholder="请输入工作职责" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="layui-form-item" style="display: none;">
							<label class="layui-form-label"><span class="red"></span>主键id</label>
							<div class="layui-input-block">
								<input type="text" name="id" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button id="job_btn" οnclick="submitForm()" class="layui-btn" lay-submit lay-filter="formJob">提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- 培训经历 -->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">培训经历</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="6" class="layui-btn layui-btn-primary revise">添加</button>
					</span>
				</div>
				<div class="timeline-v">
					<ul id="timeline_train" class="layui-timeline">
					  <c:forEach items="${rlzyResumeList }" var="rlzyResume" >
					    <c:if test="${rlzyResume.experiencetype==3 }">
						<li class="layui-timeline-item">
							<i class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text timeline-flex">
								<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1"><fmt:formatDate value="${rlzyResume.startdate }" pattern="yyyy-MM"/></span>至<span class="studyTime2"><fmt:formatDate value="${rlzyResume.enddate }" pattern="yyyy-MM"/></span>【${fns:getComparePrecise(rlzyResume.startdate,rlzyResume.enddate)}】</h3>
								<h3 data-id="${rlzyResume.id}"  class="layui-timeline-title rev-teach2 layui-timeline-mar">${rlzyResume.major}</h3>
								<h3 class="layui-timeline-title rev-teach3 layui-timeline-mar">${rlzyResume.name }</h3>
								<h3 class="layui-timeline-title rev-teach4 layui-timeline-mar">${rlzyResume.describes }</h3>
								<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.trainRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>
							</div>
						</li>
						</c:if>
					  </c:forEach>
					</ul>
				</div>
				<div class="train" class="col-md-12 bacs" style="display: none;">
					<form class="layui-form" lay-filter="train-from" action="">
					<input value="3" hidden="hidden" name="experiencetype">
					<input value="${rlzyUser.id }" hidden="hidden" name="userid">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>培训机构</label>
							<div class="layui-input-block">
								<input type="text" name="name" required lay-verify="required" placeholder="请输入培训机构" autocomplete="off"
								 class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>专业名称</label>
							<div class="layui-input-block">
								<input type="text" name="major" required lay-verify="required" placeholder="请输入专业名称" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>培训时间</label>
							<div class="layui-input-block d-flex width-time">
								<input id="jtrainTime1" name="startdate" type="text" required lay-verify="required" placeholder="请选择开始时间"
								 autocomplete="off" class="layui-input layui-input-time">
								<span class="to">至</span>
								<input id="jtrainTime2" name="enddate" type="text" required lay-verify="required" placeholder="请选择结束时间"
								 autocomplete="off" class="layui-input layui-input-time">
							</div>
						</div>
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label"><span class="red">*</span>培训内容</label>
							<div class="layui-input-block width-time">
								<textarea name="describes" placeholder="请输入培训内容" class="layui-textarea"></textarea>
							</div>
						</div>
						<div class="layui-form-item" style="display: none;">
							<label class="layui-form-label"><span class="red"></span>主键id</label>
							<div class="layui-input-block">
								<input type="text" name="id" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button id="train_btn" class="layui-btn" lay-submit lay-filter="formTrain">提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- 获得证书 -->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">获得证书</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="7" class="layui-btn layui-btn-primary revise">添加</button>
					</span>
				</div>
				<div class="timeline-v">
					<ul id="timeline_certi" class="layui-timeline">
					  <c:forEach items="${rlzyResumeList }" var="rlzyResume" >
					    <c:if test="${rlzyResume.experiencetype==4 }">
						<li class="layui-timeline-item">
							<i class="layui-icon layui-timeline-axis"></i>
							<div class="layui-timeline-content layui-text timeline-flex">
								<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1"><fmt:formatDate value="${rlzyResume.gaindate}" pattern="yyyy-MM"/></span></h3>
								<h3 data-id="${rlzyResume.id}" class="layui-timeline-title rev-teach2 layui-timeline-mar">${rlzyResume.name}</h3>
								<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.certiRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>
							</div>
						</li>
						</c:if>
					  </c:forEach>
					</ul>
				</div>
				<div class="certi" class="col-md-12 bacs" style="display: none;">
					<form class="layui-form" lay-filter="certi-from" action="">
					<input value="4" hidden="hidden" name="experiencetype">
					<input value="${rlzyUser.id }" hidden="hidden" name="userid">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>证书名称</label>
							<div class="layui-input-block">
								<input type="text" name="name" required lay-verify="required" placeholder="请输入培训机构" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="red">*</span>获得时间</label>
							<div class="layui-input-block d-flex width-time">
								<input id="getTime" name="gaindate" type="text" required lay-verify="required" placeholder="请选择获得时间"
								 autocomplete="off" class="layui-input layui-input-time">
							</div>
						</div>
						<div class="layui-form-item" style="display: none;">
							<label class="layui-form-label"><span class="red"></span>主键id</label>
							<div class="layui-input-block">
								<input type="text" name="id" placeholder="" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<div class="layui-input-block">
								<button id="certi_btn" class="layui-btn" lay-submit lay-filter="formCerti">提交</button>
								<button type="reset" class="layui-btn layui-btn-primary">重置</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- 附件简历 -->
			<div class="infoname">
				<div class="info-tit">
					<span class="name1">附件简历</span>
					<span class="name2"></span>
					<span class="name1" onclick="">
						<button data-id="8" class="layui-btn layui-btn-primary revise">添加</button>
					</span>
				</div>
				<div class="timeline-v">
				<c:if test="${rlzyUser != null && rlzyUser.resumedoc != '' && rlzyUser.resumedoc!= null}">
					<div class="flie-v">
						<div class="flie-v1"><fmt:formatDate value="${rlzyUser.updateDate }" pattern="yyyy-MM-dd"/></div>
						<div class="flie-v2"><i class="layui-icon layui-icon-file"></i><span id="wj"><%-- ${fn:substring(.indexOf(""))} --%>我的简历</span></div>
						<div class="flie-v3"><a class="layui-btn layui-btn-sm ayui-btn layui-btn-primary" href="${rlzyUser.resumedoc}">下载</a></div>
					</div>				
				</c:if>
				</div>
				<div class="file" class="bacs" style="display: none;">
					<div class="layui-upload">
						<button type="button" class="layui-btn fat-right" id="testList">选择文件</button>
						<div class="layui-upload-list">
							<table class="layui-table">
								<thead>
									<tr>
										<th>文件名</th>
										<th>大小</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="demoList"></tbody>
							</table>
						</div>
						<button type="button" class="layui-btn fat-right" id="testListAction">开始上传</button>
					</div>
				</div>
			</div>
			<div class="center-btn">
				<button type="button" class="layui-btn layui-btn-lg layui-btn-normal" id="btn1">保存简历</button>
			</div>
		</div>


		<script src="${ctxStatic }/rlzy/js/common/citySet/jquery-1.11.3.min.js"></script>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/myResume.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
		<script src="${ctxStatic}/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/jobtier.js"></script>
		<script src="${ctxStatic }/rlzy/js/workset.js"></script>
		<script type="text/javascript">
			var url = "${rlzyPath}";
			var userId = "${rlzyUser.id}";
			$("#btn1").click(function(){
				var a = $("#form1").serialize();
				var b = $("#form2").serialize();
				var c = $("#form3").serialize();
				var form = (a+"&"+b+"&"+c);
			    $.ajax({
			        type:"POST",
			        url:"${rlzyPath}/user/saveUserInfo",
			        data:form,
			        success:function(data){
			        	if(data == "1"){
			        		layer.open({
								  type: 1
								  ,offset: 'auto' //具体配置参考：offset参数项
								  ,content: '<div style="padding: 20px 80px;">您已成功修改简历信息!</div>'
								  ,btn: '关闭'
								  ,btnAlign: 'c' //按钮居中
								  ,shade: 0 //不显示遮罩
								  ,yes: function(){
									  var index = parent.layer.getFrameIndex(window.name);
										window.parent.location.reload();//刷新父页面
							            //parent.layer.close(index);
								    //layer.closeAll();
								  }
							});
			        	}
			        }
			    });
			})
		</script>
		<script>
			//城市级联
			$("#liveplace,#workplace").click(function(e) {
				SelCity(this, e);
				console.log("inout", $(this).val(), new Date())
			});
		</script>
		<script>
		var arr = new Array();
			//表单
			layui.use('form', function() {

			});
			layui.use('laydate', function() {
				var laydate = layui.laydate;
				//常规用法
				laydate.render({
					elem: '#studyTime1'
				});
				laydate.render({
					elem: '#studyTime2'
				});
				laydate.render({
					elem: '#jobTime1'
				});
				laydate.render({
					elem: '#jobTime2'
				});
				laydate.render({
					elem: '#jtrainTime1'
				});
				laydate.render({
					elem: '#jtrainTime2'
				});
				laydate.render({
					elem: '#getTime'
				});
			});
			//文件上传
			layui.use('upload', function() {
				var $ = layui.jquery,
					upload = layui.upload;
				//多文件列表示例
				var demoListView = $('#demoList'),
					uploadListIns = upload.render({
						elem: '#testList',
						url: '${rlzyPath}/user/moneyUpload',
						accept: 'file',
						acceptMime:'.doc,.docx',
						exts: 'docx|doc',
						number: 1,
						multiple: false,
						auto: false,
						bindAction: '#testListAction',
						choose: function(obj) {
							var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
							//读取本地文件
							obj.preview(function(index, file, result) {
								$("#wj").text(file.name);
								var tr = $(['<tr id="upload-' + index + '">', '<td>' + file.name + '</td>', '<td>' + (file.size / 1014).toFixed(1) + 
									'kb</td>', '<td>等待上传</td>', '<td>',
									'<button class="layui-btn layui-btn-xs demo-reload layui-hide">重传</button>',
									'<button class="layui-btn layui-btn-xs layui-btn-danger demo-delete">删除</button>', '</td>', '</tr>'].join(''));

								//单个重传
								tr.find('.demo-reload').on('click', function() {
									obj.upload(index, file);
								});

								//删除
								tr.find('.demo-delete').on('click', function() {
									delete files[index]; //删除对应的文件
									tr.remove();
									uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
								});

								demoListView.append(tr);
							});
						},
						done: function(res, index, upload) {
							console.log(res);
							arr.push(res.filePath);
							if (res.code == 0) { //上传成功
								var data = arr.join("|");
								var id = $("#id").val();
								$.ajax({
									type : 'POST',
									url : '${rlzyPath}/user/saveUpload',
									data : {"data":data,
											"id":id},
									success : function(data) {
											
									}
								});
								var tr = demoListView.find('tr#upload-' + index),tds = tr.children();
								tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
								tds.eq(3).html(''); //清空操作
								return delete this.files[index]; //删除文件队列已经上传成功的文件
							}
							this.error(index, upload);
						},
						error: function(index, upload) {
							var tr = demoListView.find('tr#upload-' + index),
								tds = tr.children();
							tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
							tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
						}
					});
			});
		</script>
		<script>
			//图片上传预览    IE是用了滤镜。
			function previewImage(file) {
				var MAXWIDTH = 120;
				var MAXHEIGHT = 140;
				var div = document.getElementById('preview');
				if (file.files && file.files[0]) {
					div.innerHTML = '<img id=imghead onclick=$("#previewImg").click()>';
					var img = document.getElementById('imghead');
					img.onload = function() {
						var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
						img.width = rect.width;
						img.height = rect.height;
						//                 img.style.marginLeft = rect.left+'px';
						img.style.marginTop = rect.top + 'px';
					}
					var reader = new FileReader();
					reader.onload = function(evt) {
						img.src = evt.target.result;
						//console.log(evt.target.result);
					}
					//头像上传
					var formData = new FormData();
					formData.append("file", file.files[0]);
					$.ajax({
						type : 'POST',
						url : '${rlzyPath}/company/upload?flag=1',
						data : formData,
						contentType : false,
						processData : false,
						async : true,
						success : function(result) {
							console.log(result);
							$("#img").val(result);
							$("#imghead").attr("src", result);

						}
					});
					reader.readAsDataURL(file.files[0]);
				} else //兼容IE
				{
					var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
					file.select();
					var src = document.selection.createRange().text;
					div.innerHTML = '<img id=imghead>';
					var img = document.getElementById('imghead');
					img.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
					var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, img.offsetWidth, img.offsetHeight);
					status = ('rect:' + rect.top + ',' + rect.left + ',' + rect.width + ',' + rect.height);
					div.innerHTML = "<div id=divhead style='width:" + rect.width + "px;height:" + rect.height + "px;margin-top:" +
						rect.top +
						"px;" + sFilter + src + "\"'></div>";
				}
			}

			function clacImgZoomParam(maxWidth, maxHeight, width, height) {
				var param = {
					top: 0,
					left: 0,
					width: width,
					height: height
				};
				if (width > maxWidth || height > maxHeight) {
					rateWidth = width / maxWidth;
					rateHeight = height / maxHeight;

					if (rateWidth > rateHeight) {
						param.width = maxWidth;
						param.height = Math.round(height / rateWidth);
					} else {
						param.width = Math.round(width / rateHeight);
						param.height = maxHeight;
					}
				}
				param.left = Math.round((maxWidth - param.width) / 2);
				param.top = Math.round((maxHeight - param.height) / 2);
				return param;
			}
			
			$("#workchange").click(function(e) {
				selwork(this, e);
				console.log("inout", $(this).val(), new Date())
			});
			
		</script>
</body>
</html>