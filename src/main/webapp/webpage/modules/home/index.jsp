<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="keywords" content="吴忠人力资源,人力资源,招聘,人才服务,吴忠市,WZRLZY,wuzhongrenliziyuan,黄河金岸,水韵吴忠,滨河回乡,吴忠市,吴忠市人力资源,吴忠招聘网站，吴忠招聘">
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>吴忠人力资源</title>
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/index.css" />
</head>
<body>

	<div class="cont">
		<div class="layui-carousel" id="carousel" lay-filter="carousel">
			<div class="carousel" carousel-item="">
				<c:forEach items="${bannerList}" var="banner">
					<div>
						<img src="${banner.pic }" />
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="service-v">
			<div class="service-f">
				<a id="recruit" data-id="1" class="bg1" href=""><span
					class="nametitled layui-icon layui-icon-friends"></span>&ensp;我要招人</a>
				<a id="throw" data-id="2" class="bg2" href=""><span
					class="nametitled"><img
						src="${ctxStatic }/rlzy/img/gangw3.png"></span>&ensp;我要应聘</a> <a
					class="bg4" href="${rlzyPath}/home/parkServer"><span
					class="nametitled layui-icon layui-icon-list"></span>&ensp;服务机构</a> <a
					class="bg3" href="${rlzyPath}/home/videostudy"><span
					class="nametitled layui-icon layui-icon-video"></span>&ensp;视频课程</a>
			</div>
		</div>
		<div class="index-v">
			<!-- 园区动态 -->
			<div class="index-va">
				<div class="index-cont">
					<ul class="index-ul d-flex">
						<li class="index-lst mar-left0">
							<div class="tit">
								<div>最新要闻</div>
								<div>
									<a class="more" href="${rlzyPath }/home/newsList">更多&gt;</a>
								</div>
							</div>
							<ul class="plate-ul news-dt-v"
								style="overflow-y: hidden; border: 0; max-height: 447px;">
								<c:forEach items="${yqdtlist }" var="yqdt">
									<li class="index-lst">
										<div class="index-lst-tit">
											<span class="tit-o"><i>●</i></span> <a
												href="${rlzyPath}/home/newsData?id=${yqdt.id}"><span
												class="tit-txt">${yqdt.title}</span></a> <span class="tit-data">
												<c:if test="${yqdt.isTop=='1'}">
													<span class="top">顶</span>
												</c:if> <fmt:formatDate value="${yqdt.createDate }"
													pattern="yyyy-MM-dd" />
											</span>
										</div>
										<div class="index-lst-cont">

											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${yqdt.brief}</span>
										</div>
									</li>
								</c:forEach>

							</ul>
						</li>
						<li class="index-lst mar-left2">
							<div class="tit">
								<div>政策导读</div>
								<div>
									<a class="more" href="${rlzyPath }/home/newsList">更多&gt;</a>
								</div>
							</div>
							<ul class="plate-ul news-dt-v "
								style="overflow-y: hidden; border: 0; max-height: 447px;">
								<c:forEach items="${zcddlist }" var="hy">
									<li class="index-lst">
										<div class="index-lst-tit">
											<span class="tit-o"><i>●</i></span> <a
												href="${rlzyPath}/home/newsData?id=${hy.id}"><span
												class="tit-txt">${hy.title}</span></a> <span class="tit-data">
												<c:if test="${hy.isTop=='1'}">
													<span class="top">顶</span>
												</c:if> <fmt:formatDate value="${hy.createDate }"
													pattern="yyyy-MM-dd" />
											</span>
										</div>
										<div class="index-lst-cont">
											<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${hy.brief}</span>
										</div>
									</li>
								</c:forEach>

							</ul>
				</div>
				<%-- <div class="tit">
						<div>最新要闻</div>
						<div><a class="more" href="${rlzyPath }/home/newsList">更多></a></div>
					</div>
					<div class="index-cont">
						<ul class="index-ul yqdt-v">
						<c:forEach items="${yqdtlist }" var="yqnew">
							<li class="index-lst">
								<div class="index-lst-tit">
									<span class="tit-o"><i>●</i></span>
									<a href="${rlzyPath}/home/newsData?id=${yqnew.id}"><span class="tit-txt">${yqnew.title}</span></a>
									<span class="tit-data">
									<c:if test="${yqnew.isTop=='1'}">
										<span class="top">顶</span>
									</c:if>
									<fmt:formatDate value="${yqnew.createDate }" pattern="yyyy-MM-dd" /></span>
								</div>
								<div class="index-lst-cont">

									<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${yqnew.brief}</span>
								</div>
							</li>
						</c:forEach>
						</ul>
					</div> --%>
			</div>
			<!-- 招聘信息 -->
			<div class="index-va">
				<div class="tit">
					<div>招聘信息</div>
					<div>
						<a class="more" href="${rlzyPath}/position/positionList">更多></a>
					</div>
				</div>
				<div class="index-cont">
					<ul class="index-ul d-flex ji-info-v">
						<li class="index-lst">
							<div class="plate-tit">急聘岗位</div>
							<ul class="plate-ul">
								<c:forEach items="${findListHome }" var="findList" begin="0"
									end="5">
									<li class="plate-lst">
										<div class="plate-lst-v">
											<div class="platetit d-flex-c">
												<c:if test="${findList.status=='0' }">
													<div class="zw" onclick="login()">
														<span class="gw">${findList.positionname }</span><span
															class="ji">急聘</span>
													</div>
												</c:if>
												<c:if test="${findList.status!='0' }">
													<div class="zw"
														onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${findList.id }&companyid=${findList.companyid }')">
														<span class="gw">${findList.positionname }</span><span
															class="ji">急聘</span>
													</div>
												</c:if>
												<div class="price">${fns:getDictLabel(findList.salaryrange, "salary", defaultValue)}</div>
											</div>
											<div>${findList.companyname }</div>
											<div>${fns:getDictLabel(findList.education, "education", defaultValue)}<span
													class="shu">|</span>${fns:getDictLabel(findList.workingage, "working_age", defaultValue)}</div>
											<div class="d-flex-c">
												<div class="flex-2">
													<i class="layui-icon layui-icon-location"></i> <span
														title="${findList.workingplace }" class="addres">${findList.workingplace }</span>
												</div>
												<div class="flex-1 text-right">
													<c:if test="${findList.status=='0' }">
														<span class="layui-btn layui-btn-sm layui-btn-normal"
															onclick="login()">我要应聘</span>
													</c:if>
													<c:if test="${findList.status!='0' }">
														<span class="layui-btn layui-btn-sm layui-btn-normal"
															onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${findList.id }&companyid=${findList.companyid }')">我要应聘</span>
													</c:if>
												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</li>
						<li class="index-lst mar-left2">
							<div class="plate-tit">最新岗位</div>
							<ul class="plate-ul">
								<c:forEach items="${findDescsList }" var="findDescs" begin="0"
									end="5">
									<li class="plate-lst">
										<div class="plate-lst-v">
											<div class="platetit d-flex-c">
												<c:if test="${findDescs.status=='0' }">
													<div class="zw" onclick="login()">
														<span class="gw">${findDescs.positionname }</span><span
															class="ji xin">新</span>
													</div>
												</c:if>
												<c:if test="${findDescs.status!='0' }">
													<div class="zw"
														onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${findDescs.id }&companyid=${findDescs.companyid }')">
														<span class="gw">${findDescs.positionname }</span><span
															class="ji xin">新</span>
													</div>
												</c:if>
												<div class="price">${fns:getDictLabel(findDescs.salaryrange, "salary", defaultValue)}</div>
											</div>
											<div>${findDescs.companyname }</div>
											<div>${fns:getDictLabel(findDescs.education, "education", defaultValue)}<span
													class="shu">|</span>${fns:getDictLabel(findDescs.workingage, "working_age", defaultValue)}</div>
											<div class="d-flex-c">
												<div class="flex-2">
													<i class="layui-icon layui-icon-location"></i> <span
														title="${findList.workingplace }" class="addres">${findDescs.workingplace }</span>
												</div>
												<div class="flex-1 text-right">
													<c:if test="${findDescs.status=='0' }">
														<span class="layui-btn layui-btn-sm layui-btn-normal"
															onclick="login()">我要应聘</span>
													</c:if>
													<c:if test="${findDescs.status!='0' }">
														<span class="layui-btn layui-btn-sm layui-btn-normal"
															onclick="javascript:window.open('${rlzyPath }/position/positionDetails?id=${findDescs.id }&companyid=${findDescs.companyid }')">我要应聘</span>
													</c:if>

												</div>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!-- 新闻动态 -->
			<div class="index-va">
				<div class="index-cont">
					<ul class="index-ul d-flex">
						<li class="index-lst mar-left0">
							<div class="tit">
								<div>招聘会</div>
							</div>
							<ul class="plate-ul news-dt-v">
								<c:forEach items="${zphlist }" var="zphnew">
									<li class="index-lst"><a
										href="${rlzyPath}/home/newsData?id=${zphnew.id}">
											<div class="index-lst-tit  index-lst-tit2">
												<div class="imgboxc">
													<img src="${zphnew.pic}" />
												</div>
												<div class="imgboxc">
													<div class='righttitle'>
														<span class="tit-o"><i>●</i></span> <span class="tit-txt"
															title="${zphnew.title}">${zphnew.title}</span> <span
															class="tit-data"> <c:if
																test="${zphnew.isTop=='1'}">
															</c:if>
															<fmt:formatDate value="${zphnew.createDate }"
																pattern="yyyy-MM-dd" />
														</span>
													</div>
													<div class='righttitle'>
														<div class="index-lst-cont">
															<span style='padding-left: 14px'>${zphnew.brief}</span>
														</div>
													</div>
												</div>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</li>
						<li class="index-lst mar-left2">
							<div class="tit">
								<div>视频课程</div>
								<div>
									<a class="more" href="${rlzyPath }/home/videostudy">更多></a>
								</div>
							</div>
							<ul class="plate-ul news-dt-v video-v">

								<c:forEach items="${videolist }" var="video">
									<li class="video-lst"><video class="video"
											poster="${video.pic}" src="${video.path}" controls="controls">
										</video>
										<div class="video-tit">${video.title}</div></li>
								</c:forEach>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!-- 企业入驻 -->
			<div class="index-va">
				<div class="tit">
					<div>企业风采</div>
					<div>
						<a class="more" href="${rlzyPath }/home/companyFeatures">更多&gt;</a> 
					</div>
				</div>
				<div class="index-cont">
					<ul class="index-ul ruzhu-v">
						<c:forEach items="${companylist}" var="company">
							<li class="index-lst"><a
								href="${rlzyPath}/company/companyData?id=${company.id}"> <img
									src="${company.logo}" /> <span class="qycont"> <span
										class="qycont-tit">${company.companyname}</span> <span
										class="qycont-cont">${company.companyprofile}</span>
								</span>
							</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>


	<div class="fafa"
		style="width: 400px; height: 200px; position: fixed; z-index: 999;">
		<c:forEach items="${bannerLists}" var="banners">
			<c:if test="${banners.isTop == '1'}">
				<div id="a"
					style="width: 20px; height: 20px; font-size: 20px; position: absolute; left: 380px; background: transparent; text-align: center; cursor: pointer;">×</div>
				<img src="${banners.pic}" style="width: 400px; height: 100%;"
					border="0"/>
			</c:if>
		</c:forEach>
	</div>

	<div id="bottom" class="bottomEnter">
		<div class="closeBottomBanner indexClose"
			onclick="closeBottomAdv(this)">
			<i class="iconfont font-30 u-f layui-icon layui-icon-close"></i>
		</div>
		<div class="main hAll clearfix">
			<div class="xf-relative hAll lf">
				<img src="${ctxStatic }/rlzy/img/footermove.png" alt="">
			</div>
			<p class="font-22 u-white marLeft60 lf">找工作，聘人才！就上吴忠人力资源！</p>
			<p class="rt index-loginBtn">
				<a href="${rlzyPath}/login/tologin" class="u-white">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="${rlzyPath}/home/register" class="bgff u-blue">注册</a>
			</p>
		</div>
	</div>
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
	<script src="${ctxStatic }/rlzy/js/pages/index.js"></script>
	<script>
		layui.use([ 'carousel', 'form' ], function() {
			var carousel = layui.carousel, form = layui.form;
			//常规轮播
			var ins = carousel.render({
				elem : '#carousel',
				arrow : 'always',
				width : '100%',
				height : '350px',
				interval : '2000'
			});
			//重置轮播
			ins.reload({
				elem : '#carousel',
				arrow : 'always',
				width : '100%',
				height : '350px',
				interval : '2000'
			});
		});
	</script>
</body>
</html>
<script type="text/javascript">
	//后期二维码的js
	//    	$(".code").mouseenter(function(){ 
	//    		$("#ercode").css("display","block")
	//    		})
	//    		
	//    		$(".code").mouseleave(function(){ 
	//    			$("#ercode").css("display","none")
	//    		
	//    		});
</script>
<script type="text/javascript">
	/* !function($dom) {
		var winWidth = window.innerWidth;
		var winHeight = window.innerHeight;
		window.onresize = function() {
			winWidth = window.innerWidth;
			winHeight = window.innerHeight;
		}
		var $left = 0, $top = 0, a = 1, b = 1, speed = 2;

		function goFun(posit, speed) {
			return posit + speed;
		}

		function donghua() {
			$left = goFun($left, speed * a)
			if ($left >= (winWidth - $dom.offsetWidth)) {
				a = -1;
			} else if ($left <= 0) {
				a = 1;
			}
			$top = goFun($top, speed * b)
			if ($top >= (winHeight - $dom.offsetHeight)) {
				b = -1;
			} else if ($top <= 0) {
				b = 1;
			}
			$dom.style.cssText += "left:" + $left + "px;top:" + $top + "px";
		}
		var t = setInterval(donghua, 15)
		$(function() {
			$("#a").click(function() {
				var b = $("#a").parent();
				$(b).remove();
			})
		})
		$(function() {
			$obj = $(".fafa");

			$obj.mouseover(function() {
				clearInterval(t)
			});
			$obj.mouseout(function() {
				t = setInterval(donghua, 15)
			});
		});

	}(document.getElementsByClassName('fafa')[0]); */
	/*关闭登录注册函数  */
	function closeBottomAdv(Obj) {
		console.log(Obj.parentNode);
		Obj.parentNode.parentNode.removeChild(Obj.parentNode);
	}
	function login() {
		layer.open({
			type : 1,
			offset : 'auto' //具体配置参考：offset参数项
			,
			content : '<div style="padding: 20px 80px;">您还未登陆!</div>',
			btn : '关闭',
			btnAlign : 'c' //按钮居中
			,
			shade : 0 //不显示遮罩
			,
			yes : function() {
				layer.closeAll();
				window.location.href = url + "/login/tologin";
			}
		});
	}
</script>
