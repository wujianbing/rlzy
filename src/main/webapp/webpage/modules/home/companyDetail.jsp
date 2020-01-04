<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>企业概况</title>
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />

<style type="text/css">
/* html, body {
	background: #fff;
	font-family: Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei",
		"WenQuanYi Micro Hei", sans-serif;
} */

.cont {
	background: #fff;
	width: 100%;
}

.img-v {
	width: 100%;
	height: 200px;
	z-index: 1;
}

.img-v img {
	width: 100%;
	height: 200px;
	z-index: 1;
}

#we_v2 {
	top: 100px;
	width: 1200px;
	margin: 0 auto;
	color: #666666;
	background: #fff;
	border: 1px solid #dddddd;
	margin-top: 30px;
	z-index: 99;
}

.topname {
	height: 50px;
	padding: 0 20px;
	/* line-height: 40px; */
	background: #b1aeae;
	color: #fff;
	font-size: 14px;
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.name {
	width: 100%;
	/* text-align: center; */
	color: #1787fb;
	font-size: 28px;
	padding-left: 20px;
	font-weight: bold;
	margin: 15px 0;
	text-shadow: 0px 0px 0px #F0F0F0, 1px 1px 0px #bbb5b5, 2px 2px 0px
		#F0F0F0, 3px 3px 0px #F0F0F0, 4px 4px 0px #F0F0F0, 5px 5px 0px #F0F0F0;
}

.name i {
	font-size: 26px;
	margin-right: 10px;
}

.nametitile {
	color: #1787fb;
	padding-left: 20px;
	height: 40px;
	display: flex;
	align-items: center;
	/*justify-content: center;*/
	border-bottom: 1px dotted #ccc;
	font-size: 18px;
    font-weight: 600;
}

.nametitile2 {
	text-align: right;
	color: #1787fb;
	width: 70%;
	display: flex;
	margin-left: 30%;
	height: 40px;
	align-items: center;
	justify-content: center;
	border-bottom: 1px dotted #ccc;

}

.nametitile3 {
	box-sizing: content-box;
	width: calc(100% - 20px);
	width: -moz-calc(100% - 20px);
	width: -webkit-calc(100% - 20px);
	color: #1787fb;
	padding-left: 20px;
	height: 40px;
	display: flex;
	align-items: center;
	border-bottom: 1px dotted #ccc;
	font-size: 18px;
    font-weight: 600;
}

.leftone1 {
	float: left;
}

.leftone2 {
	float: right;
}

.ve23 {
	text-indent: 2em;
	padding: 10px 20px;
	width: calc(100% - 40px);
	width: -moz-calc(100% - 40px);
	width: -webkit-calc(100% - 40px);
	display: flex;
	align-items: center;
}

.left12 {
	width: 70%;
    font-size: 15px;
    line-height: 28px;
}

.left13 {
	padding-top: 20px;
	width: 100%;
	font-size: 15px;
}

.left23 {
	width: 30%;
	text-align: center;
	height: 136px;
}

.left23 img {
	max-width: 200px;
	height: inherit;
	max-height: 200px;
}

.veimg {
	margin-top: 40px;
	width: 100%;
}

.veimg ul li.imgbox {
	width: 540px;
	text-align: center;
	height: 200px;
	padding: 20px 0;
	float: left;
	margin-bottom: 40px;
	background: linear-gradient(#ccc, #ccc) left top,
		linear-gradient(#ccc, #ccc) left top, linear-gradient(#ccc, #ccc)
		right top, linear-gradient(#ccc, #ccc) right top,
		linear-gradient(#ccc, #ccc) left bottom, linear-gradient(#ccc, #ccc)
		left bottom, linear-gradient(#ccc, #ccc) right bottom,
		linear-gradient(#ccc, #ccc) right bottom;
	margin-left: 40px;
	background-repeat: no-repeat;
	background-size: 2px 24px, 24px 2px;
}

.imgbox img {
	max-width: 500px;
    height: inherit;
    max-height: 205px;
}

.veimg2 {
	margin-bottom: 30px;
	padding: 0 53px;
}

.veimg2 ul li {
	margin-top: 20px;
	font-size: 16px;
}
</style>
</head>
<body>

	<div class="cont">
		<div id='we_v2' class="we-v2">
			<!--topnbu-->
			<div class="topname">
				<div class="leftone1">您现在的位置 : 首页 > 企业入驻</div>
			</div>
			<div class="item">
				<div class="name">
					<i class="layui-icon layui-icon-read"></i>${rlzyCompany.companyname}
				</div>
				<!--企业介绍-->
				<div class="nametitile">企业介绍</div>
				<!--公司的介绍-->
				<div class="ve23">
					<div class="left12">
						<p>${rlzyCompany.companyprofile}</p>
					</div>
					<div class="left23">
						<img src="${rlzyCompany.logo}" />
					</div>
				</div>
				<div class="nametitile3">服务范围</div>
				<div class="ve23">
					<div class="left13">
						<p>${rlzyCompany.servicerange}</p>
					</div>
				</div>
				<div class="nametitile3">企业风采</div>
				<div class="veimg">
					<ul>
					<c:forEach items="${photo}" var="photo">
						<li class="imgbox"><img src="${photo}"></li>
					</c:forEach>
					</ul>

				</div>
				<div class="nametitile3">联系我们</div>
				<div class="veimg2">
					<ul class="we-ul">
						<li><span class="linkphone">联系人:</span>${rlzyCompany.contacts}</li>
						<li><span class="linkphone">联系电话：</span>${rlzyCompany.telephone}</li>
						<li><span class="linkphone">联系邮箱：</span>${rlzyCompany.email}</li>
						<li><span class="linkphone">园区地址：</span>${rlzyCompany.address}</li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
	<script type="text/javascript">
		layui.use('layer', function(){
			  var layer = layui.layer;
			}); 
	</script>
</body>
</html>
