<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title>吴忠市人力资源看板</title>
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="stylesheet" href="${ctxStatic }/rlzykb/css/nav.css">
<link rel="stylesheet" href="${ctxStatic }/rlzykb/css/index.css">
</head>
<body>

	<div id="app" class="v">

		<div class="c">
			<div class="left">
				<div class="left-v left-v1">
					<div class="pack-v">
						<div class="bo-v">
							<span class="i-bo i-bo1"></span> <span class="i-bo i-bo2"></span>
							<span class="i-bo i-bo3"></span> <span class="i-bo i-bo4"></span>
						</div>
						<!-- 左边上 -->
						<div id="pie1" class="ec-v"></div>
					</div>
				</div>
				<div class="left-v left-v2">
					<div class="pack-v">
						<div class="bo-v">
							<span class="i-bo i-bo1"></span> <span class="i-bo i-bo2"></span>
							<span class="i-bo i-bo3"></span> <span class="i-bo i-bo4"></span>
						</div>
						<!-- 左边下 -->
						<div id="pie2" class="ec-v"></div>
					</div>
				</div>
			</div>

			<div class="center">
				<div class="center-v center-v1">
					<div class="pack-v">
						<div class="border-v">
							<span class="i-bo i-bo1"></span> <span class="i-bo i-bo2"></span>
							<span class="i-bo i-bo3"></span> <span class="i-bo i-bo4"></span>
						</div>
						<div class="ec-v">
							<div class="com-v">
								<div class="com-lst">
									<div class="com-tit">入驻企业数量</div>
									<div class="com-num">${companyCount}家</div>
								</div>
								<div class="com-lst">
									<div class="com-tit">已注册人数</div>
									<div class="com-num">${userCount}人</div>
								</div>
								<div class="com-lst">
									<div class="com-tit">已发布职位</div>
									<div class="com-num">${positionCount}个</div>
								</div>
								<div class="com-lst">
									<div class="com-tit">职位收藏次数</div>
									<div class="com-num">${collectCount}次</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="center-v center-v2">
					<div class="pack-v">
						<div class="border-v">
							<span class="i-bo i-bo1"></span> <span class="i-bo i-bo2"></span>
							<span class="i-bo i-bo3"></span> <span class="i-bo i-bo4"></span>
						</div>
						<div id="container" class="ec-v"></div>
					</div>
				</div>

				<div class="center-v center-v3">
					<div class="pack-v">
						<div class="border-v">
							<span class="i-bo i-bo1"></span> <span class="i-bo i-bo2"></span>
							<span class="i-bo i-bo3"></span> <span class="i-bo i-bo4"></span>
						</div>
						<!-- 中间下 -->
						<div id="line1" class="ec-v"></div>
					</div>
				</div>
			</div>

			<div class="right">

				<div class="right-v right-v1">
					<div class="pack-v">
						<div class="border-v">
							<span class="i-bo i-bo1"></span> <span class="i-bo i-bo2"></span>
							<span class="i-bo i-bo3"></span> <span class="i-bo i-bo4"></span>
						</div>
						<!-- 右边 -->
						<div id="bar1" class="ec-v"></div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="stars"></div>
</body>
<script src="${ctxStatic }/rlzy/scripts/jquery.min.js"></script>
<script src="${ctxStatic }/rlzykb/js/nav.js"></script>
<script src="${ctxStatic }/rlzykb/js/lib/echarts-4.0.2/echarts.min.js"></script>
<script
	src="https://webapi.amap.com/maps?v=2.0&key=0250860ccb5953fa5d655e8acf40ebb7&plugin=AMap.Geocoder"></script>
<script src="${ctxStatic }/rlzykb/js/index.js"></script>
<script type="text/javascript">
	//创建地图
	var map = new AMap.Map("container", {
		icon : '//vdata.amap.com/icons/b18/1/2.png',
		resizeEnable : true,
		zooms : [ 3, 20 ],
		/*center: [116.397428, 39.90923],*/
		zoom : 5,
	});

	//添加标注
	function addMarker(point, name) {
		var marker = new AMap.Marker({
			map : map,
			position : point,
			title : name
		});
		console.log(marker);
	}
	var lnglat = [];
	function biaozhu(res) {

		for (var i = 0; i < res.length; i++) {
			let point = [ {
				lnt : [ res[i].lng[0], res[i].lng[1] ],
				name : res[i].name
			} ];
			addMarker(point[0].lnt, point[0].name);
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {

		$.ajax({
			url : '/rlzy/data/mapPoint',
			type : 'post',
			success : function(data) {
				biaozhu(data);
			}

		});
	})
</script>
</html>

