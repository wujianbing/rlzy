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
<title>吴忠人力资源首页</title>
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/findInfo.css" />
</head>
<body>
	<!--首页内容-->
	<div class="humanbox">
		<!--banner图-->
		<div class="banner"></div>
		<div class="selet">
			<div class="sxl">
				<div class="select-container">筛选条件：</div>
				<input name="postflag" id="postflag" type="hidden" value="1" />
				<div class="select-container gz">
					<span class="layui-icon layui-icon-down"></span> <input data-id="1"
						type="text" readonly="readonly" value="职位薪资"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${salarys }" var="sal">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a href="javascript:;" data-value="${sal.value}">${sal.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz1">
					<span class="layui-icon layui-icon-down"></span> <input data-id="2"
						type="text" readonly="readonly" value="所属行业"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul class="haqnye">
						<c:forEach items="${industry }" var="ind">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a href="javascript:;" data-value="${ind.value}">${ind.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz2">
					<span class="layui-icon layui-icon-down"></span> <input data-id="3"
						type="text" readonly="readonly" value="企业规模"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${scale }" var="sca">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a href="javascript:;" data-value="${sca.value}">${sca.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz3">
					<span class="layui-icon layui-icon-down"></span> <input data-id="4"
						type="text" readonly="readonly" value="工作性质"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${nature }" var="nat">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a href="javascript:;" data-value="${nat.value}">${nat.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz4">
					<span class="layui-icon layui-icon-down"></span> <input data-id="5"
						type="text" readonly="readonly" value="学历要求"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${education }" var="edu">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a href="javascript:;" data-value="${edu.value}">${edu.label}</a>
							</li>
						</c:forEach>
					</ul>
				</div>
				<div class="select-container gz5">
					<span class="layui-icon layui-icon-down"></span> <input data-id="6"
						type="text" readonly="readonly" value="更新时间"
						onfocus="this.nextSibling.nextSibling.style.display='block';"
						onblur="var t=this;setTimeout(()=>{t.nextSibling.nextSibling.style.display='none';},150);" />
					<ul>
						<c:forEach items="${uTime }" var="time">
							<li
								onclick="this.parentNode.previousSibling.previousSibling.value=this.innerText;">
								<a href="javascript:;" data-value="${time.label}">${time.label}天内</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
			<div class="sxr">
				<span class="lefttj">已筛选条件：</span>
				<div class="lsp">
					<span data-id="1" class="appendtj  appendt1" style="display: none;">
						<span class="tipts" id="yxgz1"></span> <span
						class="layui-icon layui-icon-close"></span>
					</span> <span data-id="2" class="appendtj appendt2" style="display: none;">
						<span class="tipts" id="yxgz2"></span>&emsp;&emsp; <span
						class="layui-icon layui-icon-close"></span>
					</span> <span data-id="3" class="appendtj appendt3" style="display: none;">
						<span class="tipts" id="yxgz3"></span>&emsp;&emsp; <span
						class="layui-icon layui-icon-close"></span>
					</span> <span data-id="4" class="appendtj appendt4" style="display: none;"><span
						class="tipts" id="yxgz4"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span> </span> <span data-id="5"
						class="appendtj appendt5" style="display: none;"><span
						class="tipts" id="yxgz5"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span> </span> <span data-id="6"
						class="appendtj appendt6" style="display: none;"><span
						class="tipts" id="yxgz6"></span>&emsp;&emsp;<span
						class="layui-icon layui-icon-close"></span> </span>
				</div>
			</div>
		</div>

		<!--所有职位-->
		<div class="titlebg">
			<div class="leftbtn">
				<button class="btns btnjob btnactive all">普通职位</button>
				<button class="btns btnjob fast">急聘职位</button>
			</div>
			<div class="rightbtn">最新职位</div>
		</div>
		<!--个人信息部分-->
		<div class="yuqbottom2">
			<!--左边简历部分-->
			<div class="yuleft">
				<!--基本信息-->
				<form:form action="" modelAttribute="rlzyPosition" method="post">
					<ul class="alljob" id="ul1">
						<c:forEach items="${rlzyPositionListPt }" var="rlzyPosition">
							<li>
								<div class="infoname">
									<h5>
										<span class="lefth5"><span class="nameb" data-id="${rlzyPosition.id }" data-cid="${rlzyPosition.companyid }"
											onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${rlzyPosition.id }&companyid=${rlzyPosition.companyid }')">${rlzyPosition.positionname }</span></span>
										<span class="lefth5"> <span
											onclick="javascript:window.open('${rlzyPath}/company/companyData?id=${rlzyPosition.companyid}')">${rlzyPosition.companyname }</span>&emsp;&emsp;
											<span>${fns:getDictLabel(rlzyPosition.salaryrange, "salary", defaultValue)}</span>
										</span> <span class="lefth5 righth5"> 发布时间：<span><fmt:formatDate
													value="${rlzyPosition.createDate }" pattern="yyyy-MM-dd" /></span></span>
									</h5>
									<div class="bot">
										<div class="letbot">
											<p class="infopname1">
												<span class="sitename tpo">学历：<span>${fns:getDictLabel(rlzyPosition.education, "education", defaultValue)}</span></span>
												<span class="sitename tpo">经验：<span>${fns:getDictLabel(rlzyPosition.workingage, "working_age", defaultValue)}</span></span>
												<span class="sitename tpo">职位性质：<span>${fns:getDictLabel(rlzyPosition.positiontype, "work_nature", defaultValue)}</span>
												</span> <span class="sitename tpo">地点：<span>${rlzyPosition.workingplace }</span></span>
											</p>
											<div class="infopname1 wordpj">
												<div class="namei">企业福利：</div>
												<div class="namei2">
													${rlzyPosition.welfaretype}</div>
											</div>
										</div>
										<div class="rightbot">
											<span data-id="${rlzyPosition.id }" data-cid="${rlzyPosition.companyid }" class="btnlock tdjl tdzw1" onclick="td1(this)">投递简历</span>
											<span data-id="${rlzyPosition.id }" data-cid="${rlzyPosition.companyid }" class="btnlock sqzw sczw1" onclick="sc1(this)"><span class="layui-icon layui-icon-rate-solid"></span>&ensp;<span>收藏职位</span></span>
										</div>
									</div>
								</div></li>
						</c:forEach>
					</ul>
					<ul class="fastjob" id="ul2">
						<c:forEach items="${rlzyPositionListJp }" var="rlzyPosition">
							<li>
								<div class="infoname">
									<h5>
										<span class="lefth5"><span class="nameb" data-id="${rlzyPosition.id }" data-cid="${rlzyPosition.companyid }"
											onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${rlzyPosition.id }&companyid=${rlzyPosition.companyid }')">${rlzyPosition.positionname }</span>
											<sup>急聘</sup></span> <span class="lefth5"> <span
											onclick="javascript:window.open('${rlzyPath}/company/companyData?id=${rlzyPosition.companyid}')">${rlzyPosition.companyname }</span>&emsp;&emsp;
											<span>${fns:getDictLabel(rlzyPosition.salaryrange, "salary", defaultValue)}</span>
										</span> <span class="lefth5 righth5"> 发布时间：<span><fmt:formatDate
													value="${rlzyPosition.createDate }" pattern="yyyy-MM-dd" /></span></span>
									</h5>
									<div class="bot">
										<div class="letbot">
											<p class="infopname1">
												<span class="sitename tpo">学历：<span>${fns:getDictLabel(rlzyPosition.education, "education", defaultValue)}</span></span>
												<span class="sitename tpo">经验：<span>${fns:getDictLabel(rlzyPosition.workingage, "working_age", defaultValue)}</span></span>
												<span class="sitename tpo">职位性质：<span>${fns:getDictLabel(rlzyPosition.positiontype, "work_nature", defaultValue)}</span>
												</span> <span class="sitename tpo">地点：<span>${rlzyPosition.workingplace }</span></span>
											</p>
											<div class="infopname1 wordpj">
												<div class="namei">企业福利：</div>
												<div class="namei2">
													${rlzyPosition.welfaretype}</div>
											</div>
										</div>
										<div class="rightbot">
											<span data-id="${rlzyPosition.id }" data-cid="${rlzyPosition.companyid }" class="btnlock tdjl tdzw2" onclick="td2(this)">投递简历</span>
											<span data-id="${rlzyPosition.id }" data-cid="${rlzyPosition.companyid }" class="btnlock sqzw sczw2" onclick="sc2(this)"><span class="layui-icon layui-icon-rate-solid"></span>&ensp;<span>收藏职位</span></span>
										</div>
									</div>
								</div></li>
						</c:forEach>
					</ul>
				</form:form>
				<!-- 分页 -->
				<div class="fy">
					<div id="test1" class="test1"></div>
					<div id="test2" class="test2" style="display: none;"></div>
				</div>
			</div>

			<div class="yuright">
				<form:form action="" modelAttribute="rlzyPosition" method="post">
					<ul>
						<c:forEach items="${findDescList }" var="findDesc" begin="0"
							end="4">
							<li><input value="${findDesc.id }" hidden="hidden"
								name="positionid" id="positionId"> <input
								value="${findDesc.companyid }" hidden="hidden" name="companyid"
								id="companyId">
								<div class="infoname namegc">
									<h5>
										<span class="lefth5 nameb" data-id="${findDesc.id }" data-cid="${findDesc.companyid }"
											onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${findDesc.id }&companyid=${findDesc.companyid }')"><span>${findDesc.positionname }</span>
											<sup>急聘</sup></span> <span class="lefth5"><span>${fns:getDictLabel(findDesc.salaryrange, "salary", defaultValue)}</span></span>
									</h5>
									<div class="bot">
										<div class="letbot lefttyt">
											<p class="infopname1 info4">
												<span class="sitename nasei"
													title="${findDesc.companyname }"
													onclick="javascript:window.open('${findDesc.companywebsite }')">${findDesc.companyname }</span>
											</p>
											<p class="infopname1 info4">
												<span class="sitename">${findDesc.workingplace }</span>
											</p>

										</div>
										<div class="rightbot righttyt">
											<span class="btnlock ypsj wyyp" data-id="${findDesc.id }" data-cid="${findDesc.companyid }"
												onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${findDesc.id }&companyid=${findDesc.companyid }')">我要应聘</span>
										</div>
									</div>
								</div></li>
						</c:forEach>
					</ul>
				</form:form>
			</div>
		</div>
	</div>

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script type="text/javascript">
	  var user = JSON.parse(localStorage.getItem('user'));
	 </script>
	<script type="text/javascript"
		src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script type="text/javascript" src="${ctxStatic }/rlzy/js/findinfo.js"></script>
	<script type="text/javascript" src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
	<script type="text/javascript">
	layui.use(['laypage', 'layer'], function(){
	  var laypage = layui.laypage
	  ,layer = layui.layer;
	  //完整功能-普通职位
	  laypage.render({
	    elem: 'test1'
	    ,count: ${count1}
	    ,theme:'#1787fb'
	    ,layout: ['count', 'prev', 'page', 'next', 'limit']
	    ,jump: function(obj,first){
	      console.log(obj)
	      var page = "1";
	     if(obj.curr != undefined){
	     	page = obj.curr;
	     }
	     if(first){
	     	return false;
	     }
	     $.ajax({
			type: 'post',
			data : JSON.stringify(rlzyPosition),
			url: "/rlzy/position/pageListPt?page="+page+"&pageSize="+obj.limit,
			contentType: "application/json;charset=utf-8",
			success:function(data){
				let arr = new Array();
		 			for(var i=0;i<data.length;i++){
		 				var time = new Date(data[i].createDate).format("yyyy-MM-dd")
		 				arr.push('<li>');
		 				arr.push('<div class="infoname">');
		 				arr.push('<h5><span class="lefth5"><span class="nameb" onclick="javascript:window.open(/rlzy/position/positionDetails?id='+data[i].id+'&companyid='+data[i].companyid+')">'+data[i].positionname+'</span></span>');
		 				arr.push('<span class="lefth5">');
		 				arr.push('<span onclick="javascript:window.open(/rlzy/company/companyData?id='+data[i].companyid+')">'+data[i].companyname+'</span>&emsp;&emsp;');
		 				arr.push('<span>'+data[i].salaryrange+'</span>');
		 				arr.push('</span>');
		 				arr.push('<span class="lefth5 righth5">');
		 				arr.push('发布时间：<span>'+time+'</span></span></h5>');
		 				arr.push('<div class="bot">');
		 				arr.push('<div class="letbot">');
		 				arr.push('<p class="infopname1">');
		 				arr.push('<span class="sitename tpo">学历：<span>'+data[i].education+'</span></span>');
		 				arr.push('<span class="sitename tpo">经验：<span>'+data[i].workingage+'</span></span>');
		 				arr.push('<span class="sitename tpo">职位性质：<span>'+data[i].positiontype+'</span></span>');
		 				arr.push('<span class="sitename tpo">地点：<span>'+data[i].workingplace+'</span></span>');
		 				arr.push('</p>');
					    arr.push('<div class="infopname1 wordpj">');
					    arr.push('<div class="namei">');
					    arr.push('企业福利：');
					    arr.push('</div>');
					    arr.push('<div class="namei2">'+data[i].welfaretype+'</div>');
					    arr.push('</div>');
		 				arr.push('</div>');
		 				arr.push('<div class="rightbot">');
		 				arr.push('<span data-id="'+data[i].id+'" data-cid="'+data[i].companyid+'" class="btnlock tdjl tdzw1" onclick="td1(this)">投递简历</span>');
		 				arr.push('<span data-id="'+data[i].id+'" data-cid="'+data[i].companyid+'" class="btnlock sqzw sczw1" onclick="sc1(this)"><span class="layui-icon layui-icon-rate-solid"></span>&ensp;<span>收藏职位</span></span>');
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
		  //完整功能-急聘职位
		  laypage.render({
		    elem: 'test2'
		    ,count: ${count}
		    ,theme:'#1787fb'
		    ,layout: ['count', 'prev', 'page', 'next', 'limit']
		    ,jump: function(obj,first){
		      console.log(obj)
		      var page = "1";
	      if(obj.curr != undefined){
	      	page = obj.curr;
	      }
	      if(first){
	      	return false;
	      }
	      $.ajax({
				type: 'post',
				data : JSON.stringify(rlzyPosition),
				url: "/rlzy/position/pageListJp?page="+page+"&pageSize="+obj.limit,
				contentType: "application/json;charset=utf-8",
				success:function(data){
					let arr = new Array();
		 			for(var i=0;i<data.length;i++){
		 				var time = new Date(data[i].createDate).format("yyyy-MM-dd")
		 				arr.push('<li>');
		 				arr.push('<div class="infoname">');
		 				arr.push('<h5><span class="lefth5"><span class="nameb" onclick="javascript:window.open(/rlzy/position/positionDetails?id='+data[i].id+'&companyid='+data[i].companyid+')">'+data[i].positionname+'</span> <sup>急聘</sup></span>');
		 				arr.push('<span class="lefth5">');
		 				arr.push('<span onclick="javascript:window.open(/rlzy/company/companyData?id='+data[i].companyid+')">'+data[i].companyname+'</span>&emsp;&emsp;');
		 				arr.push('<span>'+data[i].salaryrange+'</span>');
		 				arr.push('</span>');
		 				arr.push('<span class="lefth5 righth5">');
		 				arr.push('发布时间：<span>'+time+'</span></span></h5>');
		 				arr.push('<div class="bot">');
		 				arr.push('<div class="letbot">');
		 				arr.push('<p class="infopname1">');
		 				arr.push('<span class="sitename tpo">学历：<span>'+data[i].education+'</span></span>');
		 				arr.push('<span class="sitename tpo">经验：<span>'+data[i].workingage+'</span></span>');
		 				arr.push('<span class="sitename tpo">职位性质：<span>'+data[i].positiontype+'</span></span>');
		 				arr.push('<span class="sitename tpo">地点：<span>'+data[i].workingplace+'</span></span>');
		 				arr.push('</p>');
					    arr.push('<div class="infopname1 wordpj">');
					    arr.push('<div class="namei">');
					    arr.push('企业福利：');
					    arr.push('</div>');
					    arr.push('<div class="namei2">'+data[i].welfaretype+'</div>');
					    arr.push('</div>');
		 				arr.push('</div>');
		 				arr.push('<div class="rightbot">');
		 				arr.push('<span data-id="'+data[i].id+'" data-cid="'+data[i].companyid+'" class="btnlock tdjl tdzw2" onclick="td2(this)">投递简历</span>');
		 				arr.push('<span data-id="'+data[i].id+'" data-cid="'+data[i].companyid+'" class="btnlock sqzw sczw2" onclick="sc2(this)"><span class="layui-icon layui-icon-rate-solid"></span>&ensp;<span>收藏职位</span></span>');
		 				arr.push('</div>');
		 				arr.push('</div>');
		 				arr.push('</div>');
		 				arr.push('</li>');
		 			} 
		 			let html = arr.join('');
		 			$("#ul2>li").remove();
		 			$("#ul2").html(html);    	
					}
				});
			}
		});
	});
	
	//收藏简历-分页
	function sc1(obj) {
		let that = $(obj);
		var companyId = that.attr('data-cid');
		var positionId  = that.attr('data-id');
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
				    window.location.href = url + "/login/tologin";
				  }
			});
		}
	}
	function sc2(obj) {
		let that = $(obj);
		var companyId = that.attr('data-cid');
		var positionId  = that.attr('data-id');
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
				    window.location.href = url + "/login/tologin";
				  }
			});
		}
	}
	
	//投递简历-分页
	function td1(obj) {
		let that = $(obj);
		var companyId = that.attr('data-cid');
		var positionId  = that.attr('data-id');
		if(user != null || user != undefined){
			let type=user.type;
			if(type==='1'){
				$.post("/rlzy/position/applyPosition?positionid=" + positionId + "&companyid=" + companyId, function(data) {
					if(data == 1){
						layer.open({
							  skin: 'demo-class',
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
							  ,content: '<div style="padding: 20px 80px;">您已投递!</div>'
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
				    window.location.href = url + "/login/tologin";
				  }
			});
		}
	}
	function td2(obj) {
		let that = $(obj);
		var companyId = that.attr('data-cid');
		var positionId  = that.attr('data-id');
		if(user != null || user != undefined){
			let type=user.type;
			if(type==='1'){
				$.post("/rlzy/position/applyPosition?positionid=" + positionId + "&companyid=" + companyId, function(data) {
					if(data == 1){
						layer.open({
							  skin: 'demo-class',
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
							  ,content: '<div style="padding: 20px 80px;">您已投递!</div>'
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
				    window.location.href = url + "/login/tologin";
				  }
			});
		}
	}


		</script>
</body>
</html>