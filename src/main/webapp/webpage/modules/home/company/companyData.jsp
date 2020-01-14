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
<title>企业概况</title>
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<style type="text/css">
html, body {
	background: #fff;
	font-family: Arial, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei",
		"WenQuanYi Micro Hei", sans-serif;
}

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
}

.nametitile {
	color: #1787fb;
	padding-left: 20px;
	height: 40px;
	display: flex;
	align-items: center;
	/*justify-content: center;*/
	border-bottom: 1px dashed #ccc;
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
	border-bottom: 1px dashed #ccc;
	font-size: 18px;
	font-weight: 600;
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
	/*justify-content: center;*/
	border-bottom: 1px dashed #ccc;
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
	font-size: 16px;
	-webkit-box-orient: vertical;
}

.left13 {
	padding-top: 20px;
	width: 100%;
	font-size: 16px;
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
	min-height: 240px;
	margin-bottom: 20px;
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
.nameonef {
    white-space: nowrap;
}
.layq {
	margin-bottom: 15px;
	font-size: 16px;
}
.maincontent ol li{
 list-style-type: decimal;
 }
.maincontent  ul li{
 list-style-type: disc;
 }
.maincontent .table-bordered > tbody > tr > td, .table-bordered > tfoot > tr > td {
    border: 1px solid #ddd;
    padding: 8px;
    line-height: 1.42857143;
    vertical-align: top;
}
	table {
    border-spacing: 0;
    border-collapse: collapse;
}
 
.layq:last-child {
	margin-bottom: 0px;
}
.onedit{
    padding: 10px 20px;
    }
.namedit{
	margin-bottom: 20px;
	border-bottom: 1px dotted #b29fca;
	padding-bottom: 20px;}
.namedit:last-child{
	margin-bottom: 0;
	border-bottom:0;
	padding-bottom: 20px;}

</style>
</head>
<body>
	<div class="cont">
		<div id='we_v2' class="we-v2">
			<!--topnbu-->
			<div class="topname">
				<div class="leftone1">您现在的位置 : 企业详情页面</div>
			</div>
			<div class="item">
				<div class="name">
					<i class="layui-icon layui-icon-link"></i>${rlzyCompany.companyname}
				</div>
				<!--企业介绍-->
				<div class="nametitile">基本信息</div>
				<!--公司的介绍-->
				<div class="ve23">
					<div class="left12">
						<div class="layui-row layq">
							<div class="layui-col-md4 nameonef">
								企业性质：<span>${fns:getDictLabel (rlzyCompany.companynature, 'company_nature', defaultValue)}</span>
							</div>
							<div class="layui-col-md4 nameonef">
								企业类型：<span>${fns:getDictLabel (rlzyCompany.companytype, 'company_type', defaultValue)}</span>
							</div>
							<div class="layui-col-md4 nameonef">
								企业规模：<span>${fns:getDictLabel (rlzyCompany.companyscale, 'company_scale', defaultValue)}</span>
							</div>
						</div>
						<div class="layui-row layq">
							<div class="layui-col-md4 nameonef">
								所属行业：<span>${fns:getDictLabel (rlzyCompany.industry, 'desired_industry', defaultValue)}</span>
							</div>
							<div class="layui-col-md4 nameonef">
								注册资金：<span>${rlzyCompany.registeredcapital}</span>万元
							</div>
							<div class="layui-col-md4 nameonef">
								信用代码：<span>${rlzyCompany.creditcode}</span>
							</div>
						</div>
						<div class="layui-row layq">
							<div class="layui-col-md4 nameonef">
								联系人:<span>${rlzyCompany.contacts}</span>
							</div>
							<div class="layui-col-md4 nameonef">
								联系电话：<span>${rlzyCompany.telephone}</span>
							</div>
							<div class="layui-col-md4 nameonef">
								邮箱：<span>${rlzyCompany.email}</span>
							</div>
						</div>
						<div class="layui-row layq">
							<div class="layui-col-md12 nameonef">
								地址：<span>${rlzyCompany.address}</span>
							</div>
						
						</div>
					</div>
					<div class="left23">
						<img src="${rlzyCompany.logo}" />
						<%-- <img src="${ctxStatic }/rlzy/img/sc.jpg" /> --%>
					</div>
				</div>
				<div class="nametitile3">企业简介</div>
				<div class="ve23">
					<div class="left13">
						${rlzyCompany.companyprofile}
						</p>
					</div>
				</div>
				<c:if test="${list != '' && list != null}">
					<div class="nametitile3">产品介绍</div>
					<div class="layui-row layq onedit">
				      <ul>
				      <c:forEach items="${list}" var="rlzyProduct">
				      	<li class='namedit'>
				            <div class='cpname'>产品名称：${rlzyProduct.title}</div>
					        <div class='cpjieshao'>产品简介：${rlzyProduct.intro}</div>
						    <div class='maincontent'>
						    <p>产品详情：</p>
					    ${rlzyProduct.content}
					    </div>
				     </li>
				      </c:forEach>
				      </ul>
					</div>
				</c:if>
				<c:if test="${rlzyCompany.servicerange!=null && rlzyCompany.servicerange!=''}">
				<div class="nametitile3">服务范围</div>
				<div class="ve23">
					<div class="left13">
						${fns:unescapeHtml(rlzyCompany.servicerange)}
						<%-- ${rlzyCompany.servicerange} --%>
						</p>
					</div>
				</div>
				</c:if>
				<c:if test="${str!=null && str!=''}">
				<div class="nametitile3">案例图片</div>
				<div class="veimg">
					<ul>
					<c:forEach items="${arr}" var="arr">
						<li class="imgbox"><img src="${arr}"></li>
					</c:forEach>
					</ul>
				</div>
				</c:if>
			</div>
		</div>
	</div>

	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
</body>
</html>