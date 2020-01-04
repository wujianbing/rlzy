<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>职位详情</title>
<!-- Bootstrap -->
<!--	<link href="css/bootstrap.css" rel="stylesheet">-->
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/findHuman.css" />
</head>
<body>
	<!--首页内容-->
	<div class="humanbox">
		<!--banner图-->
		<div class="banner">
			<div class="bannerdel">
				<form:form action="" modelAttribute="rlzyPosition" method="post"
					id="form">
					<input value="${rlzyPosition.companyid}" hidden="hidden" name="companyId" id="companyId">
					<p class="findman">
						<span class="leftman renshi">${rlzyPosition.positionname }</span><span
							class="rightman time"><fmt:formatDate
								value="${rlzyPosition.createDate }" pattern="yyyy-MM-dd" /> 发布</span>
					</p>
					<p class="findman">
						<span class="leftman"><span>${fns:getDictLabel(rlzyPosition.salaryrange, "salary", defaultValue)}</span></span>
						<span class="rightman sq btn1 layui-btn layui-btn-normal sqzw-btn" data-id="${rlzyPosition.id }">申请职位</span>
					</p>
					<p class="findman">
						<span class="leftman">${rlzyCompany.companyname }</span>
						<span data-id="${rlzyPosition.id }" class="rightman shoucang">
						<span class="layui-icon layui-icon-rate-solid"></span>&ensp;<span>收藏&ensp;&ensp;&ensp;</span></span>
					</p>
				</form:form>
			</div>
		</div>
		<!--个人信息部分-->
		<div class="yuqbottom">
			<!--左边简历部分-->
			<div class="yuleft">
				<form:form action="" modelAttribute="rlzyPosition" method="post">
				<input value="${rlzyPosition.companyid}" hidden="hidden" name="companyId" id="companyId">
					<!--基本信息-->
					<div class="infoname">
						<h5>基本信息</h5>
						<p class="infopname1">
							<span class="sitename">职位性质：<span>${fns:getDictLabel(rlzyPosition.positiontype, "work_nature", defaultValue)}</span></span>
							<span class="sitename">招聘人数：<span>${rlzyPosition.recruitnumber }</span></span>
						</p>
						<p class="infopname1">
							<span class="sitename">学历要求：<span>${fns:getDictLabel(rlzyPosition.education, "education", defaultValue)}</span></span>
							<span class="sitename">工作经验：<span>${fns:getDictLabel(rlzyPosition.workingage, "working_age", defaultValue)}</span></span>
						</p>
						<p class="infopname1 lastname">
							<span class="sitename">工作地点：<span>${rlzyPosition.workingplace }</span></span>
							<span class="sitename">年龄要求：<span>${fns:getDictLabel(rlzyPosition.agerequirement, "age_range", defaultValue)}</span></span>
						</p>
						<div class=" lastname ful">
							<div class="leftname">企业福利：</div>
							<div class="rightul">
								<ul class="qyfl">
									<c:forEach items="${arr }" var="arr">
									<li>${ fns:getDictLabel (arr, "company_welfare", defaultValue)}</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
					<!--联系方式-->
					<div class="infoname">
						<h5>联系方式</h5>
						<p class="infopname1">
							<span class="sitename">联系人：<span>${rlzyPosition.contacts }</span></span>

						</p>
						<p class="infopname1">
							<span class="sitename">联系电话：<span>${rlzyPosition.phone }</span></span>

						</p>
						<p class="infopname1 lastname">
							<span class="sitename">电子邮箱：<span>${rlzyCompany.email }</span></span>
						</p>
					</div>
					<!--职位描述-->
					<div class="infoname infolast">
						<h5>职位描述</h5>
						<p class="infopname1">岗位要求：</p>
							${rlzyPosition.positiondescription }
					</div>
					<!--按钮-->
					<div class="infopname lastname lastjk">
						<span class="btn btn1 layui-btn layui-btn-normal" data-id="${rlzyPosition.id }">申请职位</span>
					</div>
				</form:form>
			</div>
			<div class="yuright">
				<div class="righttop">
					<form:form action="" modelAttribute="rlzyPosition" method="post">
						<!--公司图片-->
						<div class="imgimg">

							<img src="${rlzyCompany.logo}"/>
						</div>
						<!--公司信息-->
						<div class="imgname">
					       <p class="infopname1">
					        <span class="sitename comnname">${rlzyCompany.companyname }</span>
					
					       </p >
					       <p class="infopname1">
					        <span class="sitename">性质：<span>${fns:getDictLabel(rlzyCompany.companynature, "company_nature", defaultValue)}</span></span>
					
					       </p >
					       <p class="infopname1">
					        <span class="sitename">行业：<span>${ fns:getDictLabel (rlzyCompany.industry, "desired_position", defaultValue)}</span></span>
					
					       </p >
					       <p class="infopname1">
					        <span class="sitename">规模：<span>${ fns:getDictLabel (rlzyCompany.companynature, "company_scale", defaultValue)}</span>人</span>
					       </p >
					       <p class="infopname1 lastname" style="margin-bottom: 20px;">
					        <span class="sitename">地区：<span style="line-height: 14px;">${rlzyCompany.address }</span>
					       </p >
					     </div>
					</form:form>
				</div>
				<div class="rightbottom">
					<p class="infopname1" style="margin-bottom: 9px; margin-top: 4px; " >
				       <span class="sitename liuyan">给我留言</span>
				     </p >
					<div class="textword">
						<textarea name="" rows="12"
							placeholder="请输入你的疑问。比如工作地点，薪 资，福利等等，我会及时给您回复！ 期待与您的合作。"></textarea>
					</div>
					<div class="infosend">
						<span class="btn layui-btn layui-btn-normal">发送</span>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="${ctxStatic }/rlzy/js/bootstrap.js"></script>
</body>
</html>
<script type="text/javascript"
	src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script type="text/javascript"
	src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>
<script type="text/javascript">
	var user = JSON.parse(localStorage.getItem('user'));
	$(function() {
		$(".btn1").click(function() {
			let that = $(this);
			var companyId = $("#companyId").val();
			var positionId  = that.attr('data-id');
			layui.use('layer', function(){
				var layer = layui.layer; 
				if(user != null || user != undefined){
					let type=user.type;
					if(type==='1'){
						$.post("/rlzy/position/applyPosition?positionid=" + positionId + "&companyid=" + companyId, function(data) {
							if(data == 1){
								layer.open({
									  type: 1
									  ,offset: 'auto' //具体配置参考：offset参数项
									  ,content: '<div style="padding: 20px 80px;">投递成功!</div>'
									  ,btn: '关闭'
									  ,btnAlign: 'c' //按钮居中
									  ,shade: 0 //不显示遮罩
									  ,yes: function(){
									    layer.closeAll();
									  }
								});  
							}else{
								layer.open({
									  type: 1
									  ,offset: 'auto' //具体配置参考：offset参数项
									  ,content: '<div style="padding: 20px 80px;text-align: center;">您已投递!</div>'
									  ,btn: '关闭'
									  ,btnAlign: 'c' //按钮居中
									  ,shade: 0 //不显示遮罩
									  ,yes: function(){
									    layer.closeAll();
									  }
								});
							}
						});
					}else if(type==='2'){
						layer.open({
							  type: 1
							  ,offset: 'auto' //具体配置参考：offset参数项
							  ,content: '<div style="padding: 20px 80px;">您是企业账号，不能投递简历!</div>'
							  ,btn: '关闭'
							  ,btnAlign: 'c' //按钮居中
							  ,shade: 0 //不显示遮罩
							  ,yes: function(){
							    layer.closeAll();
							  }
						});
					}
				}else {
					layer.open({
						  type: 1
						  ,offset: 'auto' //具体配置参考：offset参数项
						  ,content: '<div style="padding: 20px 80px;">您还未登陆!</div>'
						  ,btn: '关闭'
						  ,btnAlign: 'c' //按钮居中
						  ,shade: 0 //不显示遮罩
						  ,yes: function(){
						    layer.closeAll();
							window.location.href = url + "/login/quit";
						  }
					});
				}
			});
		});
	});

	$(function() {
		$(".shoucang").click(function() {
			let that = $(this);
			var companyId = $("#companyId").val();
			var positionId  = that.attr('data-id');
			layui.use('layer', function(){
				var layer = layui.layer; 
				if(user != null || user != undefined){
					let type=user.type;
					if(type==='1'){
						$.post("/rlzy/position/keepPosition?companyid=" + companyId + "&positionid=" + positionId, function(data) {
							if(data == 1){
								layer.open({
									  type: 1
									  ,offset: 'auto' //具体配置参考：offset参数项
									  ,content: '<div style="padding: 20px 80px;">收藏成功!</div>'
									  ,btn: '关闭'
									  ,btnAlign: 'c' //按钮居中
									  ,shade: 0 //不显示遮罩
									  ,yes: function(){
									    layer.closeAll();
									  }
								});
							}else{
								layer.open({
									  type: 1
									  ,offset: 'auto' //具体配置参考：offset参数项
									  ,content: '<div style="padding: 20px 80px;">您已收藏!</div>'
									  ,btn: '关闭'
									  ,btnAlign: 'c' //按钮居中
									  ,shade: 0 //不显示遮罩
									  ,yes: function(){
									    layer.closeAll();
									  }
								});
							}
						});
					}else if(type==='2'){
						layer.open({
							  type: 1
							  ,offset: 'auto' //具体配置参考：offset参数项
							  ,content: '<div style="padding: 20px 80px;">您是企业账号不能收藏职位!</div>'
							  ,btn: '关闭'
							  ,btnAlign: 'c' //按钮居中
							  ,shade: 0 //不显示遮罩
							  ,yes: function(){
							    layer.closeAll();
							  }
						});
					}
				}else {
					layer.open({
						  type: 1
						  ,offset: 'auto' //具体配置参考：offset参数项
						  ,content: '<div style="padding: 20px 80px;">您还未登陆!</div>'
						  ,btn: '关闭'
						  ,btnAlign: 'c' //按钮居中
						  ,shade: 0 //不显示遮罩
						  ,yes: function(){
						    layer.closeAll();
							window.location.href = url + "/login/quit";
						  }
					});
				}
			});
		});
	});
</script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
