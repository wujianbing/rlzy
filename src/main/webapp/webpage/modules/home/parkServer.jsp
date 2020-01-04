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
<title>园区服务</title>
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/pages/parkService.css" />

</head>
<body>
	<div class="img-v" style="margin-bottom: -50px;"><img src="/rlzy/static/rlzy/img/jnts.png"> </div>
	<div id="cont" class="cont park-server">
		<div class="service-v">
			<div class="service-tab service-f">
				<div data-id="1" class="bg1">法律服务</div>
				<div data-id="3" class="bg2">财务服务</div>
				<div data-id="2" class="bg3">保险服务</div>
				<div data-id="4" class="bg4">其他服务</div>
			</div>
		</div>
		<div class="service-cont">
			<div class="service-c">
				<div id="service_tit" class="bg1-h">法律服务</div>
				<!-- 服务列表 -->
				<div class="service-c-v">
					<ul class="service-ul">
						<c:forEach items="${companypage.list}" var="serve">
							<li data-cid="${serve.id}" class="service-lst">
								<div class="service-c-right">
									<div class="name-top">
										<div class="name-img-v">
											<img class="name-img" src="${serve.logo}" />
										</div>
										<div>
											<div class="name-tit">${serve.companyname}</div>
											<div class="name-deta">
												<fmt:formatDate value="${serve.createDate }"
													pattern="yyyy-MM-dd" />
												入驻
											</div>
										</div>
									</div>
								  <div class="name-cont">${serve.companyprofile}</div>
								</div>
								<div class="service-c-left">
									<div>
										<img src="${serve.casepic}" />
									</div>
									<div>
										<img src="${serve.spe3}" />
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
					<div class="pages-v">
						<div id="pages"></div>
					</div>
				</div>

				<iframe src="" id="iframe" class="iframe" scrolling="no"
					height="100%" style="display: none;"></iframe>
				</div>
		</div>
	</div>
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
	<script src="${ctxStatic }/rlzy/js/unti.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/parkService.js"></script>
	<script>
		function page(id,count) {
			layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer;
	
			//完整功能
			laypage.render({
				elem : 'pages',
				count :count,
				layout : [ 'count', 'prev', 'page', 'next', 'limit' ],
				jump : function(obj, first) {
					console.log(obj)
					var page = "1";
					if (obj.curr != undefined) {
						page = obj.curr;
					}
					if (first) {
						return false;
					}
					$.ajax({
						url : url+"/home/parkList?id=" + id + "&page=" + page + "&pageSize=" + obj.limit,
						type : "get",
						success : function(data) {
							let list = data.list;
							if(list == undefined){
								return false;
							}
							
							let arrs = new Array();
							for (var i = 0; i < list.length; i++) {
								var time = new Date(list[i].createDate).format("yyyy-MM-dd")
								arrs.push('<li data-cid="'+list[i].id+'" class="service-lst">');
								arrs.push('<div class="service-c-right">');
								arrs.push('<div class="name-top">');
								arrs.push('<div class="name-img-v"><img class="name-img" src="'+list[i].logo+'"/></div>');
								arrs.push('<div>');
								arrs.push('<div class="name-tit">'+list[i].companyname+'</div>');
								arrs.push('<div class="name-deta">'+time+' 入驻</div>');
								arrs.push('</div>');
								arrs.push('</div>');
								arrs.push('<div class="name-cont">');
								arrs.push(''+list[i].companyprofile+'');
								arrs.push('</div>');
								arrs.push('</div>');
								arrs.push('<div class="service-c-left">');
								arrs.push('<div><img src="' + list[i].casepic + '"/></div>');
								arrs.push('<div><img src="' + list[i].spe3 + '"/></div>');
								arrs.push('</div>');
								arrs.push('</li>');
							}
							let html = arrs.join('');
							$(".service-ul>li").remove();
							$(".service-ul").html(html);
						}
					});
				}
			});
		});
		}
		layui.use([ 'laypage', 'layer' ], function() {
			var laypage = layui.laypage,
				layer = layui.layer;
	
			//完整功能
			laypage.render({
				elem : 'pages',
				count : ${companypage.count},
				layout : [ 'count', 'prev', 'page', 'next', 'limit' ],
				jump : function(obj, first) {
					console.log(obj)
					var page = "1";
					if (obj.curr != undefined) {
						page = obj.curr;
					}
					if (first) {
						return false;
					}
					$.ajax({
						url : url+"/home/parkList?id=" + id + "&page=" + page + "&pageSize=" + obj.limit,
						type : "get",
						success : function(data) {
							let list = data.list;
							let arrs = new Array();
							for (var i = 0; i < list.length; i++) {
								var time = new Date(list[i].createDate).format("yyyy-MM-dd")
								arrs.push('<li data-cid="'+list[i].id+'" class="service-lst">');
								arrs.push('<div class="service-c-right">');
								arrs.push('<div class="name-top">');
								arrs.push('<div class="name-img-v"><img class="name-img" src="'+list[i].logo+'"/></div>');
								arrs.push('<div>');
								arrs.push('<div class="name-tit">'+list[i].companyname+'</div>');
								arrs.push('<div class="name-deta">'+time+' 入驻</div>');
								arrs.push('</div>');
								arrs.push('</div>');
								arrs.push('<div class="name-cont">');
								arrs.push(''+list[i].companyprofile+'');
								arrs.push('</div>');
								arrs.push('</div>');
								arrs.push('<div class="service-c-left">');
								arrs.push('<div><img src="' + list[i].casepic + '"/></div>');
								arrs.push('<div><img src="' + list[i].spe3 + '"/></div>');
								arrs.push('</div>');
								arrs.push('</li>');
							}
							let html = arrs.join('');
							$(".service-ul>li").remove();
							$(".service-ul").html(html);
						}
					});
				}
			});
		});
	</script>
</body>
</html>
