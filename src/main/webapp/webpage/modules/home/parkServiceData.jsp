<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>园区服务</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/parkService.css" />
		<style type="text/css">
			li {
			    color: #4e4e4e;
			}
		</style>
	</head>
	<body>
		<!-- 服务详情 -->
		<div id="ser_v" class="ser-v">
			<div class="service-data-v">
				<div class="s-tit">
					<div class="s-tit-l">${rlzyCompany.companyname}</div>
					<div class="s-data"><fmt:formatDate value="${rlzyCompany.createDate }" pattern="yyyy-MM-dd" />入驻</div>
				</div>
				<div class="s-cont">
					<p class="s-cont-lst">${rlzyCompany.companyprofile }</p>
					<p class="s-cont-tit">【服务范围】</p>
					<p class="s-cont-lst">${fns:unescapeHtml(rlzyCompany.servicerange)}<%-- ${rlzyCompany.servicerange } --%></p>
				</div>
			</div>
		</div>	
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/parkServiceData.js"></script>

	</body>
</html>
