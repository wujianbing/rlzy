<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>

<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>吴忠人力资源首页</title>
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/lookFor.css" />
</head>

<body>
	<!--首页内容-->
	<div class="humanbox">
		<!--banner图-->
		<div class="banner"></div>
		<div class="selet">
			<div class="sxl">
				<div class="select-container">筛选条件：</div>
				<div class="select-container gz0">
					<span class="layui-icon layui-icon-down"></span> <input data-id="1"
						type="text" readonly="readonly" value="职位薪资"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${salarys }" var="sal">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${sal.value}" href="javascript:;">${sal.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz1">
					<span class="layui-icon layui-icon-down"></span> <input data-id="2"
						type="text" readonly="readonly" value="行业类别"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul class="haqnye">
						<c:forEach items="${industry }" var="ind">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${ind.value}" title="${ind.value}"
								href="javascript:;">${ind.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz3">
					<span class="layui-icon layui-icon-down"></span> <input data-id="3"
						type="text" readonly="readonly" value="所学专业"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul class="haqnye">
						<c:forEach items="${major }" var="major">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${major.value}" href="javascript:;">${major.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz4">
					<span class="layui-icon layui-icon-down"></span> <input data-id="4"
						type="text" readonly="readonly" value="性别"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${sex }" var="sex">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${sex.value}" href="javascript:;">${sex.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz5">
					<span class="layui-icon layui-icon-down"></span> <input data-id="5"
						type="text" readonly="readonly" value="工作性质"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${worknature }" var="worknature">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${worknature.value}" href="javascript:;">${worknature.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz6">
					<span class="layui-icon layui-icon-down"></span> <input data-id="6"
						type="text" readonly="readonly" value="学历要求"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${education }" var="education">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${education.value}" href="javascript:;">${education.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz7">
					<span class="layui-icon layui-icon-down"></span> <input data-id="7"
						type="text" readonly="readonly" value="工作年限"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${workingage }" var="workingage">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${workingage.value}" href="javascript:;">${workingage.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz8">
					<span class="layui-icon layui-icon-down"></span> <input data-id="8"
						type="text" readonly="readonly" value="更新时间"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${updatetime }" var="updatetime">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a data-value="${updatetime.label}">${updatetime.label}天内</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="sxr">
				<span class="lefttj">已选条件：</span>
				<div class="lsp">
					<span data-id="1" class="appendtj  appendt1" style="display: none;">
						<span class="tipts" id="yxgz1"></span> <span
						class="layui-icon layui-icon-close"></span>
					</span> <span data-id="2" class="appendtj appendt2" style="display: none;">
						<span class="tipts" id="yxgz2"></span>&emsp;&emsp; <span
						class="layui-icon layui-icon-close"></span>
					</span> <span data-id="3" class="appendtj appendt4" style="display: none;"><span
						class="tipts" id="yxgz4"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span></span> <span data-id="4"
						class="appendtj appendt5" style="display: none;"><span
						class="tipts" id="yxgz5"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span></span> <span data-id="5"
						class="appendtj appendt6" style="display: none;"><span
						class="tipts" id="yxgz6"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span></span> <span data-id="6"
						class="appendtj appendt7" style="display: none;"><span
						class="tipts" id="yxgz7"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span></span> <span data-id="7"
						class="appendtj appendt8" style="display: none;"><span
						class="tipts" id="yxgz8"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span></span> <span data-id="8"
						class="appendtj appendt3" style="display: none;"> <span
						class="tipts" id="yxgz3"></span>&emsp;&emsp; <span
						class="layui-icon layui-icon-close"></span>
					</span>




				</div>
			</div>
		</div>
		<!--个人信息部分-->
		<div class="yuqbottom2">
			<!--左边简历部分-->
			<div class="yuleft">
				<!--基本信息-->
				<form:form action="" modelAttribute="rlzyUser" method="post">
					<ul class="alljob" id="ul1">
						<c:forEach items="${talentList }" var="rlzyUser">
							<input value="${rlzyUser.id }" hidden="hidden" name="userId"
								id="userId">
							<input value="${companyid}" hidden="hidden" name="companyId"
								id="companyId">
							<input value="${rlzyUser.relationid}" hidden="hidden"
								name="relationid" id="relationid">
							<input value="${rlzyUser.collectionstate}" hidden="hidden"
								name="collection" id="collection">
							<li>
								<div class="infoname">
									<h5>
										<c:if test="${rlzyUser.status=='0' }">
											<span class="lefth5"><span class="nameb"
												onclick="login()">
													${rlzyUser.desiredposition}</span></span>
											<span class="lefth5"> <span onclick="login()">${rlzyUser.name}</span>&emsp;&emsp;
											</span>
										</c:if>
										<c:if test="${rlzyUser.status=='1' }">
											<span class="lefth5"><span class="nameb"
												onclick="alert()">
													${rlzyUser.desiredposition}</span></span>
											<span class="lefth5"> <span onclick="alert()">${rlzyUser.name}</span>&emsp;&emsp;
											</span>
										</c:if>
										<c:if test="${rlzyUser.status!='0' && rlzyUser.status!='1' }">
											<span class="lefth5"><span class="nameb"
												onclick="javascript:window.open('${rlzyPath }/talent/talentDetails?id=${rlzyUser.id }&companyid=${companyid}')">
													${rlzyUser.desiredposition}</span></span>
											<span class="lefth5"> <span
												onclick="javascript:window.open('${rlzyPath }/talent/talentDetails?id=${rlzyUser.id }&companyid=${companyid}')">${rlzyUser.name}</span>&emsp;&emsp;
											</span>
										</c:if>
										<span class="lefth5"> <span>${rlzyUser.liveplace}</span>&emsp;&emsp;
											<!--<span>4-6千/月</span>-->
										</span> <span class="lefth5 righth5"> 发布时间：<span><fmt:formatDate
													value="${rlzyUser.createDate }" pattern="yyyy-MM-dd" /></span></span>
									</h5>
									<div class="bot">
										<div class="imgntitle">
											<c:if test="${rlzyUser.photo != '' && rlzyUser.photo!= null}">
												<img src="${rlzyUser.photo }" />
											</c:if>
											<c:if test="${rlzyUser.photo == '' || rlzyUser.photo == null}">
												<img src="${ctxStatic }/rlzy/img/timg.jpg" />
											</c:if>
										</div>
										<div class="letbot">
											<p class="infopname1">
												<%-- <span title='${rlzyUser.desiredposition}' class="sitename">${rlzyUser.desiredposition}</span> --%>
												<span class="sitename">${fns:getDictLabel(rlzyUser.sex,"sex", defaultValue)}</span>
												<span class="sitename">${rlzyUser.age}<span>岁</span></span>
												<span class="sitename">${fns:getDictLabel(rlzyUser.education,"education", defaultValue)}</span>
												<span class="sitename">${fns:getDictLabel(rlzyUser.workingage,"working_age",defaultValue)}</span>

											</p>
											<p class="infopname1">
												<span class="sitename">${fns:getDictLabel(rlzyUser.currentstate,"current_state", defaultValue)}</span>
												<span class="sitename">${fns:getDictLabel(rlzyUser.worknature,"work_nature",defaultValue)}</span>
												<span class="sitename">${fns:getDictLabel(rlzyUser.salary,"salary",defaultValue)}</span>
												<span title='${fns:getDictLabel(rlzyUser.major,"major", defaultValue)}' class="sitename">${fns:getDictLabel(rlzyUser.major,"major", defaultValue)}</span>
											</p>
											<p class="infopname2">
											<c:if test="${rlzyUser.selfdescription == '' || rlzyUser.selfdescription == null}">
												<span class="sitename2">自我介绍：<span>暂无</span></span>
											</c:if>
											<c:if test="${rlzyUser.selfdescription != '' && rlzyUser.selfdescription != null}">
												<span class="sitename2">自我介绍：<span>${rlzyUser.selfdescription}</span></span>
											</c:if>
											</p>

										</div>
										<div class="rightbot">
											<c:if test="${rlzyUser.status=='0' }">
												<a href="#"><span class="btnlock tdjl ckjl"
													onclick="login()">查看简历</span></a>
											</c:if>
											<c:if test="${rlzyUser.status=='1' }">
												<a href="#"><span class="btnlock tdjl ckjl"
													onclick="alert()">查看简历</span></a>
											</c:if>
											<c:if test="${rlzyUser.status!='0' && rlzyUser.status!='1' }">
												<a href="#"><span class="btnlock tdjl ckjl"
													onclick="javascript:window.open('${rlzyPath }/talent/talentDetails?id=${rlzyUser.id }&companyid=${companyid}')">查看简历</span></a>
											</c:if>
												
											<c:if test="${rlzyUser.status=='0' }">
											<span class="btnlock sqzw sc" id="sc" onclick="login()"
												data-user="${rlzyUser.id }" data-id="${rlzyUser.relationid}"
												data-s="${rlzyUser.collectionstate}"><span
												class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>
											</c:if>
											<c:if test="${rlzyUser.status=='1' }">
												<span class="btnlock sqzw sc" id="sc" onclick="alert2()"
													data-user="${rlzyUser.id }" data-id="${rlzyUser.relationid}"
													data-s="${rlzyUser.collectionstate}"><span
													class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>
											</c:if>
											<c:if test="${rlzyUser.status!='0' && rlzyUser.status!='1' }">
												<span class="btnlock sqzw sc" id="sc" onclick="ac(this)"
												data-user="${rlzyUser.id }" data-id="${rlzyUser.relationid}"
												data-s="${rlzyUser.collectionstate}"><span
												class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>
											</c:if>
										</div>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</form:form>
			</div>

			<div class="paging-v">
				<div id="paging" class="paging"></div>
			</div>
		</div>


		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script type="text/javascript"
			src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
		<script type="text/javascript"
			src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/lookFor.js"></script>

		<script type="text/javascript">
			var urls = "${rlzyPath}/talent/talentListBySelect";
			var url1 = "${rlzyPath}/talent/talentList";
			var count = "${count}";
			var collection = "${rlzyUser.collectionstate}";
			function ac(obj) {
				let that = $(obj);
				console.log(that);
				var companyId = $("#companyId").val();
				let userId = that.attr("data-user");
				if(companyId!=''){
					$.get("${rlzyPath}/talent/keepUser?userid=" + userId + "&companyid=" + companyId, function(data) {
						that.css({
							"color" : "#ff6d86",
							"border" : "1px solid #ff6d86"
						});
						that.attr('data-s', 1);
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
				}else{
					layer.open({
						  type: 1
						  ,offset: 'auto' //具体配置参考：offset参数项
						  ,content: '<div style="padding: 20px 80px;">您还未登陆!</div>'
						  ,btn: '关闭'
						  ,btnAlign: 'c' //按钮居中
						  ,shade: 0 //不显示遮罩
						  ,yes: function(){
						    layer.closeAll();
						    window.location.href = url + "/login/tologin";
						  }
					});
				}
				
			}
		
			function pages(count) {
				layui.use([ 'laypage', 'layer' ], function() {
					var laypage = layui.laypage,
						layer = layui.layer;
		
					//完整功能
					laypage.render({
						elem : 'paging',
						count : count,
						theme : '#1787fb',
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
								type : 'post',
								data : JSON.stringify(rlzyUser),
								url : urls + "?page=" + page + "&pageSize=" + obj.limit,
								contentType : "application/json;charset=utf-8",
								success : function(data) {
									let arr = new Array();
									for (var i = 0; i < data.length; i++) {
										var time = new Date(data[i].createDate).format("yyyy-MM-dd")
										arr.push('<li>');
										arr.push('<div class="infoname">');
										arr.push('<h5>');
										if(data[i].status=='0'){
											arr.push('<span class="lefth5"><span class="nameb" onclick="login()" >' + data[i].desiredposition/* data[i].desiredindustry */ + '</span></span>')
											arr.push('<span class="lefth5">');
											arr.push('<span onclick="login()">' + data[i].name + '</span>&emsp;&emsp;');
											arr.push('</span>');
										}else if(data[i].status=='1'){
											arr.push('<span class="lefth5"><span class="nameb" onclick="alert()" >' + data[i].desiredposition + '</span></span>')
											arr.push('<span class="lefth5">');
											arr.push('<span onclick="alert()">' + data[i].name + '</span>&emsp;&emsp;');
											arr.push('</span>');
										}else if(data[i].status!='0' && data[i].status!='1'){
											arr.push('<span class="lefth5"><span class="nameb" data-id="' + data[i].id + '" data-cid="' + data[i].companyid + '"  onclick="talentDetail(this)">' + data[i].desiredposition + '</span></span>')
											arr.push('<span class="lefth5">');
											arr.push('<span data-id="' + data[i].id + '" data-cid="' + data[i].companyid + '"  onclick="talentDetail(this)">' + data[i].name + '</span>&emsp;&emsp;');
											arr.push('</span>');
										}
										arr.push('<span class="lefth5">');
										arr.push('<span>' + data[i].liveplace + '</span>&emsp;&emsp;');
										arr.push('</span>');
										arr.push('<span class="lefth5 righth5">');
										arr.push('发布时间：<span>' + time + '</span></span></h5>');
										arr.push('<div class="bot">');
										arr.push('<div class="imgntitle">')
										arr.push('<img src='+data[i].photo+' />')
										arr.push('</div>')
										arr.push('<div class="letbot">');
										arr.push('<p class="infopname1">');
										/* arr.push('<span title=' + data[i].desiredposition + ' class="sitename">' + data[i].desiredposition + '</span>'); */
										arr.push('<span class="sitename">' + data[i].sex + '</span>');
										arr.push('<span class="sitename">' + data[i].age + '<span>岁</span></span>');
										arr.push('<span class="sitename">' + data[i].education + '</span>');
										arr.push('<span class="sitename">' + data[i].workingage + '</span>');
										arr.push('</p>');
										arr.push('<p class="infopname1">');
										arr.push('<span class="sitename">' + data[i].currentstate + '</span>');
										arr.push('<span class="sitename">' + data[i].worknature + '</span>');
										arr.push('<span class="sitename">' + data[i].salary + '</span>');
										arr.push('<span title='+ data[i].major + ' class="sitename">' + data[i].major + '</span>');
										arr.push('</p>');
										arr.push('<p class="infopname2">');
										arr.push('<span class="sitename2">自我介绍：<span>' + data[i].selfdescription + '</span></span>');
										arr.push('</p>');
										arr.push('</div>');
										arr.push('<div class="rightbot">');
										if(data[i].status=='0'){
											arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="login()">查看简历</span></a>');
										}else if(data[i].status=='1'){
											arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="alert()">查看简历</span></a>');
										}else if(data[i].status!='0' && data[i].status!='1'){
											arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="javascript:window.open(\'/rlzy/talent/talentDetails?id=' + data[i].id + '\')">查看简历</span></a>');
										}
										if(data[i].status=='0'){
											arr.push('<span class="btnlock sqzw sc" onclick="login()"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');
										}else if(data[i].status=='1'){
											arr.push('<span class="btnlock sqzw sc" onclick="alert2()"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');
										}else if(data[i].status!='0' && data[i].status!='1'){
											arr.push('<span class="btnlock sqzw sc" onclick="ac(this)"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');
										}
										arr.push('</div>');
										arr.push('</div>');
										arr.push('</div>');
										arr.push('</li>');
									}
									let html = arr.join('');
									$("#ul1>li").remove();
									$("#ul1").html(html);
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
					elem : 'paging',
					count : count,
					theme : '#1787fb',
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
							type : 'post',
							data : JSON.stringify(rlzyUser),
							url : urls + "?page=" + page + "&pageSize=" + obj.limit,
							contentType : "application/json;charset=utf-8",
							success : function(data) {
								let arr = new Array();
								for (var i = 0; i < data.length; i++) {
									var time = new Date(data[i].createDate).format("yyyy-MM-dd")
									arr.push('<li>');
									arr.push('<div class="infoname">');
									arr.push('<h5>');
									if(data[i].status=='0'){
										arr.push('<span class="lefth5"><span class="nameb" onclick="login()" >' + data[i].desiredposition + '</span></span>')
										arr.push('<span class="lefth5">');
										arr.push('<span onclick="login()">' + data[i].name + '</span>&emsp;&emsp;');
										arr.push('</span>');
									}else if(data[i].status=='1'){
										arr.push('<span class="lefth5"><span class="nameb" onclick="alert()" >' + data[i].desiredposition + '</span></span>')
										arr.push('<span class="lefth5">');
										arr.push('<span onclick="alert()">' + data[i].name + '</span>&emsp;&emsp;');
										arr.push('</span>');
									}else if(data[i].status!='0' && data[i].status!='1'){
										arr.push('<span class="lefth5"><span class="nameb" data-id="' + data[i].id + '" data-cid="' + data[i].companyid + '"  onclick="talentDetail(this)">' + data[i].desiredposition + '</span></span>')
										arr.push('<span class="lefth5">');
										arr.push('<span data-id="' + data[i].id + '" data-cid="' + data[i].companyid + '"  onclick="talentDetail(this)">' + data[i].name + '</span>&emsp;&emsp;');
										arr.push('</span>');
									}
									arr.push('<span class="lefth5">');
									arr.push('<span>' + data[i].liveplace + '</span>&emsp;&emsp;');
									arr.push('</span>');
									arr.push('<span class="lefth5 righth5">');
									arr.push('发布时间：<span>' + time + '</span></span></h5>');
									arr.push('<div class="bot">');
									arr.push('<div class="imgntitle">')
									arr.push('<img src='+data[i].photo+' />')
									arr.push('</div>')
									arr.push('<div class="letbot">');
									arr.push('<p class="infopname1">');
									/* arr.push('<span title=' + data[i].desiredposition + ' class="sitename">' + data[i].desiredposition + '</span>'); */
									arr.push('<span class="sitename">' + data[i].sex + '</span>');
									arr.push('<span class="sitename">' + data[i].age + '<span>岁</span></span>');
									arr.push('<span class="sitename">' + data[i].education + '</span>');
									arr.push('<span class="sitename">' + data[i].workingage + '</span>');
									arr.push('</p>');
									arr.push('<p class="infopname1">');
									arr.push('<span class="sitename">' + data[i].currentstate + '</span>');
									arr.push('<span class="sitename">' + data[i].worknature + '</span>');
									arr.push('<span class="sitename">' + data[i].salary + '</span>');
									arr.push('<span title=' + data[i].major + ' class="sitename">' + data[i].major + '</span>');
									arr.push('</p>');
									arr.push('<p class="infopname2">');
									arr.push('<span class="sitename2">自我介绍：<span>' + data[i].selfdescription + '</span></span>');
									arr.push('</p>');
									arr.push('</div>');
									arr.push('<div class="rightbot">');
									if(data[i].status=='0'){
										arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="login()">查看简历</span></a>');
									}else if(data[i].status=='1'){
										arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="alert()">查看简历</span></a>');
									}else if(data[i].status!='0' && data[i].status!='1'){
										arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="javascript:window.open(\'/rlzy/talent/talentDetails?id=' + data[i].id + '\')">查看简历</span></a>');
									}
									if(data[i].status=='0'){
										arr.push('<span class="btnlock sqzw sc" onclick="login()"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');
									}else if(data[i].status=='1'){
										arr.push('<span class="btnlock sqzw sc" onclick="alert2()"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');
									}else if(data[i].status!='0' && data[i].status!='1'){
										arr.push('<span class="btnlock sqzw sc" onclick="ac(this)"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');
									}
									arr.push('</div>');
									arr.push('</div>');
									arr.push('</div>');
									arr.push('</li>');
								}
								let html = arr.join('');
								$("#ul1>li").remove();
								$("#ul1").html(html);
							}
						});
					}
				});
			});
			function talentDetail(obj){
				let that = $(obj);
				var companyId = that.attr('data-cid');
				var id  = that.attr('data-id');
				window.open("/rlzy/talent/talentDetails?id="+id+"&companyid="+companyId);
			}
			function login(){
				layer.open({
					  type: 1
					  ,offset: 'auto' //具体配置参考：offset参数项
					  ,content: '<div style="padding: 20px 80px;">您还未登陆!</div>'
					  ,btn: '关闭'
					  ,btnAlign: 'c' //按钮居中
					  ,shade: 0 //不显示遮罩
					  ,yes: function(){
					    layer.closeAll();
					    window.location.href = url + "/login/tologin";
					  }
				});
			}
			function alert(){
				layer.open({
					  type: 1
					  ,offset: 'auto' //具体配置参考：offset参数项
					  ,content: '<div style="padding: 20px 80px;">只有企业才能查看简历详情!</div>'
					  ,btn: '关闭'
					  ,btnAlign: 'c' //按钮居中
					  ,shade: 0 //不显示遮罩
					  ,yes: function(){
					    layer.closeAll();
					  }
				});
			}
			function alert2(){
				layer.open({
					  type: 1
					  ,offset: 'auto' //具体配置参考：offset参数项
					  ,content: '<div style="padding: 20px 80px;">只有企业才能收藏人才!</div>'
					  ,btn: '关闭'
					  ,btnAlign: 'c' //按钮居中
					  ,shade: 0 //不显示遮罩
					  ,yes: function(){
					    layer.closeAll();
					  }
				});
			}
		</script>
</body>

</html>
