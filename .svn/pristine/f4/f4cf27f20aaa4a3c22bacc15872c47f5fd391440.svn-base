<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>吴忠人力资源</title>
		<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/index.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/parkService.css" />
		<style>
			.ser-v{
				width: 900px;
			    margin: 0 auto;
			    background: #fff;
			    margin-top: 20px;
			    border-radius: 3px;
			    position: relative;
			}
			.s-cont{
				padding: 0 80px;
			}
			.s-data{
				position: absolute;
			    right: 99px;
			    bottom: 0;
			}
		</style>
	</head>
	<body>
		<div class="img-v" style="margin-bottom: -50px;"><img src="/rlzy/static/rlzy/img/jnts.png"> </div>
		<!-- 服务详情 -->
		<div id="ser_v" class="ser-v">
			<div class="service-data-v">
				<div class="s-tit">
					<div class="s-tit-l">${news.title }</div>
					<div class="s-data">发布时间:<fmt:formatDate value="${news.createDate }" pattern="yyyy-MM-dd" /></div>
				</div>
				<div class="s-cont">
					<p class="s-cont-lst">${fns:unescapeHtml(news.content)}</p>
				</div>
			</div>
		</div>
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>	
	<script src="${ctxStatic }/rlzy/js/unti.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/parkServiceData.js"></script>

	</body>
</html>
