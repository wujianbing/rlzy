<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>

<!DOCTYPE html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<title>吴忠市人力资源看板</title>
		<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzykb/css/nav.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzykb/css/index.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzykb/css/numCompany.css">
	</head>
	<body>
		
		<div id="app" class="v">
			<div class="c">
				<div class="left">
					<div class="left-v left-v1">
						<div class="pack-v">
							<div class="bo-v">
								<span class="i-bo i-bo1"></span>
								<span class="i-bo i-bo2"></span>
								<span class="i-bo i-bo3"></span>
								<span class="i-bo i-bo4"></span>
							</div>
							<!-- 上1 -->
							<div id="pie1" class="ec-v"></div>
						</div>
					</div>
					<div class="left-v left-v2">
						<div class="pack-v">
							<div class="bo-v">
								<span class="i-bo i-bo1"></span>
								<span class="i-bo i-bo2"></span>
								<span class="i-bo i-bo3"></span>
								<span class="i-bo i-bo4"></span>
							</div>
							<!-- 下1 -->
							<div id="pie3" class="ec-v"></div>
						</div>
					</div>
				</div>
			
				<div class="center">
					<div class="center-v center-v1">
						<div class="pack-v">
							<div class="border-v">
								<span class="i-bo i-bo1"></span>
								<span class="i-bo i-bo2"></span>
								<span class="i-bo i-bo3"></span>
								<span class="i-bo i-bo4"></span>
							</div>
							<!-- 条形图 -->
							<div id="line1" class="ec-v"></div>
						</div>
					</div>
					
					<div id="tab" class="center-v center-v2">
						<div class="pack-v pack-v1">
							<div class="border-v">
								<span class="i-bo i-bo1"></span>
								<span class="i-bo i-bo2"></span>
								<span class="i-bo i-bo3"></span>
								<span class="i-bo i-bo4"></span>
							</div>
							
							<div class="table-lst">
								<table class="layui-table" lay-data="{id:'inviteTab'}" lay-filter="invite">
									<thead>
										<tr>
											<th lay-data="{field:'companyname',align:'center'}">企业名称</th>
											<th lay-data="{field:'address',align:'center'}">地址</th>
											<th lay-data="{field:'registeredcapital',align:'center'}">注册资金</th>
											<th lay-data="{field:'companyscale',align:'center'}">企业规模</th>
											<th lay-data="{field:'companynature', sort: true,align:'center'}">企业性质</th>
											</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			
				<div class="right">
					<div class="right-v right-v1">
						<div class="pack-v">
							<div class="border-v">
								<span class="i-bo i-bo1"></span>
								<span class="i-bo i-bo2"></span>
								<span class="i-bo i-bo3"></span>
								<span class="i-bo i-bo4"></span>
							</div>
							<!-- 右饼2 -->
							<div id="pie2" class="ec-v"></div>
						</div>
					</div>
					<div class="right-v right-v2">
						<div class="pack-v">
							<div class="border-v">
								<span class="i-bo i-bo1"></span>
								<span class="i-bo i-bo2"></span>
								<span class="i-bo i-bo3"></span>
								<span class="i-bo i-bo4"></span>
							</div>
							<!-- 柱形图 -->
							<div id="bar1" class="ec-v"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		
		
		
		
		<div class="stars"></div>

		<script src="${ctxStatic }/rlzykb/js/lib/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzykb/js/nav.js"></script>
		<script src="${ctxStatic }/rlzykb/js/lib/echarts-4.0.2/echarts.min.js"></script>
		<script src="${ctxStatic }/rlzykb/js/numCompany.js"></script>
	</body>
</html>
