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
<title>用户协议页面</title>
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<title></title>
<style type="text/css">
.yuqbottom {
	display: block;
	color: #666;
	font-size: 16px;
}
.word {
	padding: 0px 64px 40px;
    line-height: 30px;
    text-align: justify;
}
h6 {
	color: #696969;
	font-weight: bold;
	font-size: 18px;
}
font{
	margin-top: 10px;
    display: inline-block;
}
</style>
</head>
<body>
	<!--用户协议-->
	<div class="yuqbottom">
		<h6 style="text-align: center; font-size: 22px;">${news.title }</h6>
		<br />
		<div class="word">
			${fns:unescapeHtml(news.content)}
		</div>
	</div>
</body>
<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
</html>
