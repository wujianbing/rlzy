<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>人才详情页面</title>
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/maininfo.css" />
<style>
.rightp img {
	border-radius: 62%;
	margin-right: -21px;
}
.lay3 {
	color: #ff6501;
}
.sitename-span{
	display: flex !important;
}
.sitename-span1{
	flex: 1;
}
.sitename-span2{
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    display: inline-block;
    flex: 2;
}
.nametitle{
	margin: 0 0 18px 0;
    padding: 0 39px;
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
					<input value="${rlzyUser.id }" hidden="hidden" name="userId"
						id="userId"> <input value="${companyid}" hidden="hidden"
						name="companyId" id="companyId"> <input value=""
						hidden="hidden" name="" id="id">
					<h5 style="padding: 0; margin: 0;">
						<span class="uptim">更新于：<span><fmt:formatDate
									value="${rlzyUser.createDate }" pattern="yyyy-MM-dd" /></span></span>
					</h5>
					<div class="tio">
						<div class="rightp">

							<img src="${rlzyUser.photo}" />
						</div>
						<div>
							<p class="leftp nametitle">
								<span class="site2">${rlzyUser.name} </span>
							</p>
							<p class="infopname1 info"
								style="height: 2rem; line-height: 2rem; margin-bottom: 0; padding-bottom: 15px">
								<span class="site">${fns:getDictLabel(rlzyUser.sex,"sex",defaultValue)}</span>
								<span class="site">${rlzyUser.age}<span>岁</span></span> <span
									class="site">${fns:getDictLabel(rlzyUser.education,"education",defaultValue)}</span>
								<span class="site">${rlzyUser.major}</span> <span class="site">${fns:getDictLabel(rlzyUser.currentstate,"current_state", defaultValue)}</span>
							</p>
							<p class="infopname1"
								style="margin-bottom: 0; padding-bottom: 15px">
								<span class="site1">工作经验：<span>${fns:getDictLabel(rlzyUser.workingage,"working_age",defaultValue)}</span></span>
								<span class="site1">籍贯：<span>${rlzyUser.nativeplace}</span></span>
								<span class="site1">居住地：<span>${rlzyUser.liveplace}</span></span>
							</p>
						</div>

					</div>
				</div>
				<!--求职意向-->
				<div class="infoname">
					<h5>
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 求职意向
					</h5>
					<p class="infopname1">
						<span class="sitename">期望职位：<span>${rlzyUser.desiredposition}</span></span>
						<span class="sitename sitename-span"><span class="sitename-span1">期望行业：</span><span class="sitename-span2">${fns:getDictLabel(rlzyUser.desiredindustry,"desired_industry",defaultValue)}</span></span>
						<span class="sitename">期望薪资：<span>${fns:getDictLabel(rlzyUser.salary,"salary",defaultValue)}</span></span>

					</p>
					<p class="infopname1">

						<span class="sitename">工作性质：<span>${fns:getDictLabel(rlzyUser.worknature,"work_nature",defaultValue)}</span></span>
						<span class="sitename sitename-span"><span class="sitename-span1">工作地区：</span><span title="${rlzyUser.workplace}" class="sitename-span2">${rlzyUser.workplace}</span></span>
						<span class="sitename">籍贯：<span>${rlzyUser.nativeplace}</span></span>


					</p>
					<p class="infopname1 lastname">
						<span class="sitename"><i
							class="layui-icon  layui-icon-cellphone lay3 " style=""></i> 手机号：<span>${rlzyUser.phone}</span></span>
						<span class="sitename"><i
							class="layui-icon  layui-icon-login-qq lay3 " style=""></i> QQ:<span>${rlzyUser.qq}</span></span>
						<span class="sitename"><i
							class="layui-icon  layui-icon-login-wechat lay3 " style=""></i>
							微信号：<span>${rlzyUser.webchat}</span></span>
					</p>
				</div>
				<!--职位描述-->
				<c:if test="${rlzyUser.selfdescription != null && rlzyUser.selfdescription != ''}">
				<div class="infoname infolast">
					<h5>
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 自我描述
					</h5>
					
						<p class="wordmy">${rlzyUser.selfdescription}</p>
				</div>
				</c:if>
				<c:if test="${list1 !=null && fn:length(list1) > 0}">
					<div class="infoname">
					<h5>
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 教育经历
					</h5>
					<ul class="layui-timeline">
						<c:forEach items="${list1}" var="rlzyResume">
							<%-- <c:if test="${rlzyResume.experiencetype==1 }"> --%>
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
											class="layui-timeline-title rev-teach2 layui-timeline-mar tety">学历：<span>${fns:getDictLabel(rlzyResume.education,"education",defaultValue) }</span></span>
										<span
											class="layui-timeline-title rev-teach3 tety layui-timeline-mar">学校名称：<span
											title="${rlzyResume.name }">${rlzyResume.name }</span></span> <span
											class="layui-timeline-title rev-teach4 layui-timeline-mar tety">专业：<span
											title="${rlzyResume.major}">${rlzyResume.major}</span></span>
									</div></li>
							<%-- </c:if> --%>
						</c:forEach>

					</ul>
				</div>
				</c:if>
				<c:if test="${list2 !=null && fn:length(list2) > 0}">
				<div class="infoname">
					<h5>
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 工作经历
					</h5>
					<div class="timeline-v">
						<c:forEach items="${list2}" var="rlzyResume">
							<%-- <c:if test="${rlzyResume.experiencetype==2 }"> --%>
								<ul class="layui-timeline">
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
							<%-- </c:if> --%>
						</c:forEach>
						</ul>
					</div>
				</div>
				</c:if>
				<c:if test="${list3 !=null && fn:length(list3) > 0}">
				<div class="infoname">
					<h5>
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 培训经历
					</h5>
					<c:forEach items="${list3}" var="rlzyResume">
						<%-- <c:if test="${rlzyResume.experiencetype==3 }"> --%>
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
						<%-- </c:if> --%>
					</c:forEach>
				</div>
				</c:if>
				<c:if test="${list4 !=null && fn:length(list4) > 0}">
				<div class="infoname">
					<h5>
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 获得证书
					</h5>
					<c:forEach items="${list4}" var="rlzyResume">
						<%-- <c:if test="${rlzyResume.experiencetype==4 }"> --%>
							<ul class="layui-timeline">
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
						<%-- </c:if> --%>
					</c:forEach>
					</ul>
				</div>
				</c:if>
				<c:if test="${rlzyUser.resumedoc != null && rlzyUser.resumedoc != ''}">
				<div class="infoname">
					<h5 style="margin-bottom: 0px;">
						<i class="layui-icon  layui-icon-note lay2 " style=""></i> 附件简历
					</h5>
					<div class="h5img">
						<div class="imgimg1">
							<img class="imgtitle" src="${ctxStatic }/rlzy/img/fuj.png" />
						</div>
						<div class="imgimg2">
							<span class="namej"> ${rlzyUser.name }的简历</span> <span
								class="namejtime">上传于：<span></span>
							<fmt:formatDate value="${rlzyUser.createDate }"
									pattern="yyyy-MM-dd" />
							</span>
						</div>
						<div class="imgimg3">
							<a href="${rlzyUser.resumedoc}"><input value="下载简历"
								disabled="disabled" /></a>
						</div>
					</div>
				</div>
				</c:if>
				<div class="infopname lastname lastjk">
					<button><span class="btn btn1" data-user="${rlzyUser.id }" onclick="jump()">邀请面试</span></button>
					<span class="yx sc" id="sc" data-user="${rlzyUser.id }">
					<i class="layui-icon layui-icon-rate-solid"></i>&ensp;<span class="named">收藏</span></span>
				</div>
			</div>

		</div>
	</div>
</body>

</html>

<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script src="${ctxStatic }/rlzy/js/bootstrap.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
<script type="text/javascript"
	src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script type="text/javascript"
	src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>
<script type="text/javascript">
	layui.use([ 'laypage', 'layer' ], function() {
					var laypage = layui.laypage,
						layer = layui.layer;
						});
				function jump(){
					layer.open({
			  		type: 2,
				      skin: 'layui-layer-lan', //加上边框
				      title: "职位信息", //不显示标题
				//    offset: ['800px', '50px'],
				      area: ['600px', '350px'], //宽高
			  		content: '/rlzy/talent/confirm?id=${rlzyUser.id }&companyid=${companyid}', //这里content是一个普通的String
					});
				}

	/* $(function() {
		var companyId = $("#companyId").val();
		$(".btn1").click(
				function() {
					let that = $(this);
					let collection = $(this).attr("data-s");
					let userId = $(this).attr("data-user");
					// 1收藏 2取消
					console.log(userId);
					$.get("${rlzyPath}/talent/inviteUser?userid=" + userId
							+ "&companyid=" + companyId, function(data) {
						that.attr('data-s', 1);
						if (data == 1) {
							layer.open({
								  type: 1
								  ,offset: 'auto' //具体配置参考：offset参数项
								  ,content: '<div style="padding: 20px 80px;">您邀请成功</div>'
								  ,btn: '关闭'
								  ,btnAlign: 'c' //按钮居中
								  ,shade: 0 //不显示遮罩
								  ,yes: function(){
								    layer.closeAll();
								  }
							});
						} else {
							layer.open({
								  type: 1
								  ,offset: 'auto' //具体配置参考：offset参数项
								  ,content: '<div style="padding: 20px 80px;">您已邀请过了!</div>'
								  ,btn: '关闭'
								  ,btnAlign: 'c' //按钮居中
								  ,shade: 0 //不显示遮罩
								  ,yes: function(){
								    layer.closeAll();
								  }
							});
						}
					});
				});
	}) */
	$(function() {
		var companyId = $("#companyId").val();
		$(".sc").click(
		function() {
			let that = $(this);
			let collection = $(this).attr("data-s");
			let userId = $(this).attr("data-user");
			// 1收藏 2取消
			$.get("${rlzyPath}/talent/keepUser?userid=" + userId
					+ "&companyid=" + companyId, function(data) {
				that.css("color", "red");
				that.attr('data-s', 1);
				console.log(data);
				if (data == 1) {
					layer.open({
						  type: 1
						  ,offset: 'auto' //具体配置参考：offset参数项
						  ,content: '<div style="padding: 20px 80px;">您收藏成功!</div>'
						  ,btn: '关闭'
						  ,btnAlign: 'c' //按钮居中
						  ,shade: 0 //不显示遮罩
						  ,yes: function(){
						    layer.closeAll();
						  }
					});
				} else {
					layer.open({
						  type: 1
						  ,offset: 'auto' //具体配置参考：offset参数项
						  ,content: '<div style="padding: 20px 80px;">您已收藏成功!</div>'
						  ,btn: '关闭'
						  ,btnAlign: 'c' //按钮居中
						  ,shade: 0 //不显示遮罩
						  ,yes: function(){
						    layer.closeAll();
						  }
					});
				}
			});
		})
	})
</script>