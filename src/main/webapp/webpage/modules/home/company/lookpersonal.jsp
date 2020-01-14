<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>人才详情页面</title>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/onedetile.css" />
		<style type="text/css">
			.rightp img {
		    border-radius: 62%;
		    margin-right: -21px;
		}
 .lay3{
 	color:#ff6501;
 }
 .infopname1 .sitename:nth-of-type(2n) {
    text-align: left;
    white-space: nowrap;
    overflow: hidden;
    /* padding-right: 2px; */
    text-overflow: ellipsis;
}
.infopname1 .sitename {
    display: inline-block;
    flex: 1;
    font-size: 16px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}
		</style>
	</head>

	<body>
		<!--首页内容-->
		<div class="humanbox">
	
			<!--个人信息部分-->
			<div class="yuqbottom">
				<!--左边简历部分-->
				<div class="yuleft">
						<!--模态框的简历基本信息-->
					<div class="infoname">
					<h5 style="padding: 0; margin: 0;"><span class="uptim">更新于：<span><fmt:formatDate
									value="${rlzyUser.createDate }" pattern="yyyy-MM-dd" /></span></span></h5>	
					 <div class="tio">
					 	<div class="rightp">
							<img src="${rlzyUser.photo}" />
						</div>
					 		<div class="leftp">
							<p class="infopname1 info" style="margin-bottom: 0;">
							<span class="site2">${rlzyUser.name}</span>
							</p>
							<p class="infopname1 info" style="height: 2rem; line-height: 2rem;margin-bottom: 0;">
							<span class="site">${fns:getDictLabel(rlzyUser.sex,"sex",defaultValue)}</span>
							<span class="site">${rlzyUser.age}岁</span>
							<span class="site">${fns:getDictLabel(rlzyUser.education,"education",defaultValue)}</span>
							<span class="site">${rlzyUser.major}</span>
							<span class="site">${fns:getDictLabel(rlzyUser.currentstate,"current_state", defaultValue)}</span>
							</p>
							<p class="infopname1 info" style="margin-bottom: 0;">
							<span class="site1">工作经验：<span>${fns:getDictLabel(rlzyUser.workingage,"working_age",defaultValue)}</span></span>
							<span class="site1">籍贯：<span>${rlzyUser.nativeplace}</span></span>
							<span class="site1">居住地：<span>${rlzyUser.liveplace}</span></span>
							</p>
						</div>
						
					 </div>
					</div>
					<!--求职意向-->
					<div class="infoname">
						<h5><i class="layui-icon  layui-icon-note lay2 " style=""></i> 求职意向</h5>
						<p class="infopname1">
							<span class="sitename">期望职位：<span>${rlzyUser.desiredposition}</span></span>
						<span class="sitename">期望行业：<span>${fns:getDictLabel(rlzyUser.desiredindustry,"desired_industry",defaultValue)}</span></span>
						<span class="sitename">期望薪资：<span>${fns:getDictLabel(rlzyUser.salary,"salary",defaultValue)}</span></span>
						</p>
						<p class="infopname1">
							
							<span class="sitename">工作性质：<span>${fns:getDictLabel(rlzyUser.worknature,"work_nature",defaultValue)}</span></span>
						<span class="sitename">工作地区：<span>${rlzyUser.workplace}</span></span>
						<span class="sitename">籍贯：<span>${rlzyUser.nativeplace}</span></span>

						</p>
                         <p class="infopname1 lastname">
							<span class="sitename"><i class="layui-icon  layui-icon-cellphone lay3 " style=""></i> 手机号：<span class="ds">${rlzyUser.phone}</span></span>
							<span class="sitename"><i class="layui-icon  layui-icon-login-qq lay3 " style=""></i> QQ:<span class="ds">${rlzyUser.qq}</span></span>
							<span class="sitename"><i class="layui-icon  layui-icon-login-wechat lay3 " style=""></i> 微信号：<span class="ds">${rlzyUser.webchat}</span></span>
						</p>
					</div>
					<!--职位描述-->
					<div class="infoname infolast">
						<h5><i class="layui-icon  layui-icon-note lay2 " style=""></i> 自我描述</h5>
						<c:if test="">
						<p class="wordmy">${rlzyUser.selfdescription}</p>
					</c:if>

					</div>
					<div class="infoname">
						<h5><i class="layui-icon  layui-icon-note lay2 " style=""></i> 教育经历</h5>
						<ul  class="layui-timeline">
							<c:forEach items="${rlzyUser.rlzyResumeList}" var="rlzyResume">
							<c:if test="${rlzyResume.experiencetype==1 }">
								<li class="layui-timeline-item"><i
									class="layui-icon layui-timeline-axis"></i>

									<div class="layui-timeline-content layui-text timeline-flex">
										<span
											class="layui-timeline-title rev-teach1 layui-timeline-title1"><span
											class="studyTime1"><fmt:formatDate
													value="${rlzyResume.startdate }" pattern="yyyy-MM" /></span>至<span
											class="studyTime2"><fmt:formatDate
													value="${rlzyResume.enddate }" pattern="yyyy-MM" /></span>【${fns:getComparePrecise(rlzyResume.startdate,rlzyResume.enddate)}】</span>
										<span
											class="layui-timeline-title rev-teach2 layui-timeline-mar tety" style='overflow: visible;'>学历：<span >${fns:getDictLabel(rlzyResume.education,"education",defaultValue) }</span></span>
										<span
											class="layui-timeline-title rev-teach3 tety layui-timeline-mar">学校名称：<span
											title="${rlzyResume.name }">${rlzyResume.name }</span></span> <span
											class="layui-timeline-title rev-teach4 layui-timeline-mar tety">专业：<span
											title="${rlzyResume.major}">${rlzyResume.major}</span></span>
									</div></li>
							</c:if>
						</c:forEach>
							
				
						</ul>
					</div>
					<div class="infoname">
						<h5><i class="layui-icon  layui-icon-note lay2 " style=""></i> 工作经历</h5>
						<div class="timeline-v">
						<ul class="layui-timeline">
							<c:forEach items="${rlzyUser.rlzyResumeList}" var="rlzyResume">
							<c:if test="${rlzyResume.experiencetype==2 }">
									<li class="layui-timeline-item"><i
										class="layui-icon layui-timeline-axis"></i>
										<div class="layui-timeline-content layui-text timeline-flex">
											<span
												class="layui-timeline-title rev-teach1 layui-timeline-title1"><span
												class="studyTime1"><fmt:formatDate
														value="${rlzyResume.startdate }" pattern="yyyy-MM" /></span>至<span
												class="studyTime2"><fmt:formatDate
														value="${rlzyResume.enddate }" pattern="yyyy-MM" /></span>【${fns:getComparePrecise(rlzyResume.startdate,rlzyResume.enddate)}】</span>
											<span
												class="layui-timeline-title rev-teach2 layui-timeline-mar tety"><span>职位:</span>${rlzyResume.major}</span>
											<span
												class="layui-timeline-title rev-teach3 tety layui-timeline-mar"
												style="overflow: visible;"><span>公司名称：</span>${rlzyResume.name }</span>
										</div></li>
									</c:if>
								</c:forEach>
							</ul>
						</div>

					</div>
					<div class="infoname">
						<h5><i class="layui-icon  layui-icon-note lay2 " style=""></i> 培训经历</h5>
				
                           	<c:forEach items="${rlzyUser.rlzyResumeList}" var="rlzyResume">
						<c:if test="${rlzyResume.experiencetype==3 }">
							<ul class="layui-timeline">
								<li class="layui-timeline-item"><i
									class="layui-icon layui-timeline-axis"></i>

									<div class="layui-timeline-content layui-text timeline-flex"
										style="word-wrap: break-word; word-break: normal;">
										<span
											class="layui-timeline-title rev-teach1 layui-timeline-title1"><span
											class="studyTime1"><fmt:formatDate
													value="${rlzyResume.startdate }" pattern="yyyy-MM" /></span>至<span
											class="studyTime2"><fmt:formatDate
													value="${rlzyResume.enddate }" pattern="yyyy-MM" /></span>【${fns:getComparePrecise(rlzyResume.startdate,rlzyResume.enddate)}】</span>
										<span
											class="layui-timeline-title rev-teach2 layui-timeline-mar tety">专业：<span
											title="${rlzyResume.major }">${rlzyResume.major }</span></span> <span
											class="layui-timeline-title rev-teach3 tety layui-timeline-mar">培训机构：<span
											title="${rlzyResume.name }"> ${rlzyResume.name }</span></span>

									</div>
									<div class="pad">
										<i class="layui-icon layui-icon-edit lay8"></i> 培训内容：<span
											title="${rlzyResume.describes }">${rlzyResume.describes }</span></span>
									</div></li>
							</ul>
						</c:if>
					</c:forEach>
					</div>
					<div class="infoname">
						<h5><i class="layui-icon  layui-icon-note lay2 " style=""></i> 获得证书</h5>
						 <ul class="layui-timeline">
						 <c:forEach items="${rlzyUser.rlzyResumeList}" var="rlzyResume">
						 <c:if test="${rlzyResume.experiencetype==4 }">
								<li class="layui-timeline-item"><i
									class="layui-icon layui-timeline-axis"></i>
									<div class="layui-timeline-content layui-text timeline-flex">
										<span class="layui-timeline-title rev-teach1 layui-timeline-title1">
										获得时间：
										<span class="studyTime1"><fmt:formatDate value="${rlzyResume.gaindate }" pattern="yyyy-MM" />
										</span>
										</span> 
										<span class="layui-timeline-title rev-teach2 layui-timeline-mar" style="overflow: visible;"><span>证书名称：</span>${rlzyResume.name }</span>
									</div>
								</li>
						</c:if>
						</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
		<script src="js/jquery.min.js"></script>
		<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
		<script src="js/bootstrap.js"></script>
	</body>
</html>
<script type="text/javascript" src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>