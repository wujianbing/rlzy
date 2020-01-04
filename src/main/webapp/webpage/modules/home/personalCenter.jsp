<%@ page contentType="text/html;charset=UTF-8" %>
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
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/myFind.css" />
</head>
<body>
		<!--首页内容-->
		<div class="humanbox">
			<!--个人信息注册部分-->
			<div class="yuqbottom">
				<div class="center">
					<!--左边头像和跳转导航部分-->
					<div class="yuleft">
						<div class="imgtop">
						<c:if test="${rlzyUser.photo==null or rlzyUser.photo=='' }">
							<img src="${ctxStatic }/rlzy/img/tx.jpg" />
						</c:if>
						<c:if test="${rlzyUser.photo!=null and rlzyUser.photo!='' }">
							<img src="${rlzyUser.photo}" />
						</c:if>
							<p class="nameimg"> ${rlzyUser.name}</p>
						</div>
						<div class="navbar-left">
							<ul id="navbar" class="navbar">
								<li data-id="1" class="navbar-active">基础信息</li>
								<li data-id="2">求职管理</li>
								<li data-id="3">收藏职位</li>
								<li data-id="4">账号管理</li>
							</ul>
						</div>
					</div>
					<!-- 右边iframe -->
					<div id="iframe_v" class="yuright">
						<iframe id="iframe" class="iframe" 
						src="myResume?id=${rlzyUser.id}"
						name="myFrame" id="menuFrame" 
						scrolling="no" 
						height="100%"
						></iframe>
					</div>
				</div>
			</div>
		</div>
</body>		
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/myFind.js"></script>
<script>
var url = "${rlzyPath}";
var userId = "${rlzyUser.id}";
</script>
<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
</html>

