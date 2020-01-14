<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">

		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>吴忠人力资源首页</title>
		<!-- Bootstrap -->
		<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/companyFind.css" />
	</head>

	<body>
		<!--首页内容-->
		<div id="app" class="humanbox">
		
			<!--个人信息注册部分-->
			<div class="yuqbottom">
				<div class="center">
					<!--左边头像和跳转导航部分-->
					<div class="yuleft">
						<div class="imgtop">
							<img src="${rlzyCompany.logo}" />
							<p class="nameimg">${rlzyCompany.companyname}</p>
						</div>
						<div class="navbar-left">
							<ul id="navbar" class="navbar">
								<li data-id="1" class="navbar-active">基础信息</li>
								<li data-id="2">职位管理</li>
								<li data-id="3">职位发布</li>
								<li data-id="4">收藏人才</li>
								<li data-id="5">简历管理</li>
								<li data-id="6">账号管理</li>
								<c:if test="${rlzyCompany.companytype == '2'}">
								<li data-id="7">产品信息</li>
								<li data-id="8">合作企业</li>
								<li data-id="9">合作人员</li>
								</c:if>
							</ul>
						</div>
					</div>

					<div id="iframe_v"  class="yuright">
					
						<iframe id="iframe" class="iframe" 
						src="${rlzyPath }/company/companyInfo?firmId=${rlzyCompany.id}"
						name="myFrame" id="menuFrame" 
						scrolling="no" 
						height="100%"
						></iframe>
					</div>

				</div>
			</div>
		</div>
		</div>
		<script>
		var firmId = "${rlzyCompany.id}";
		var url = "${rlzyPath}";
		</script>
		<!--外部连接跳转-->
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/companyFind.js"></script>
	</body>
</html>

