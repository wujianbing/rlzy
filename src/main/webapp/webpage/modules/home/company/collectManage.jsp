<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>收藏职位</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/collectCandidates.css">
		<style>
			.titlr-bor{
				flex: 6;
			}
			.layui-table-page {
			text-align: center;
			}
		</style>
	</head>
	<body>

		<div class="jobwant-v">
			<div class="title-v">
				<div class="title">
					<div id="title_txt" class="title-txt">
						<div class="title-x col-activ">收藏候选人</div>
					</div>
					<div class="titlr-bor"></div>
				</div>
			</div>

			<div id="table_v" class="table-v">
				<div class="table-lst">
					<table class="layui-table" id="inviteTab" lay-filter="invite">
						<!-- <thead>
							<tr>
								<th lay-data="{field:'username',align:'center'}">姓名</th>
								<th lay-data="{field:'age',align:'center',width:60}">年龄</th>
								<th lay-data="{field:'sex',align:'center',width:60}">性别</th>
								<th lay-data="{field:'desiredposition',align:'center'}">期望职位</th>
								<th lay-data="{field:'workingage', align:'center'}">工作年限</th>
								<th lay-data="{field:'currentstate',align:'center'}">工作状态</th>
								<th lay-data="{field:'invite',align:'center'}">是否邀请</th>
								<th lay-data="{field:'accept',align:'center'}">是否接受</th>
								<th lay-data="{fixed: 'right',  align:'center',width:250, toolbar: '#barInvite'}">操作</th>
							</tr>
						</thead> -->
					</table>
					<script type="text/html" id="barInvite">
						<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="view">查看</a>
						<a class="layui-btn layui-btn-xs" lay-event="yq">邀请</a>
						<a class="layui-btn layui-btn-xs" lay-event="sc">取消收藏</a>
						<a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
					</script>
				</div>
			</div>

		</div>

		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/collectCandidates.js"></script>

	</body>
</html>
<script>
var firmId = "${firmId}";
var url = "${rlzyPath}";

layui.use('table', function() {
	var table = layui.table;
	table.render({
	    elem: '#inviteTab'
	    ,url:url + '/company/companyCollect?firmId=' + firmId
	    ,request:{
	    		page: 'curr' //页码的参数名称，默认：page
	          }
	    ,height : 480
	    ,cols: [[
	        {field:'username', title: '姓名',width:100,align:'center'}
	        ,{field:'age', title: '年龄',align:'center'}
	        ,{field:'sex', title: '性别',align:'center'}
	        ,{field:'desiredposition', title: '期望职位', width:180}
	        ,{field:'workingage', title: '工作年限', width:100}
	        ,{field:'currentstate', title: '工作状态', width:90,align:'center'}
	        ,{field:'invite', title: '是否邀请', width:100,align:'center'}
	        ,{field:'accept', title: '是否接受', width:100,align:'center'}
	        ,{field:'right',width:240,align:'center', title: '操作', toolbar: '#barInvite',fixed:'right'}
	      ]]
	    ,page: true
	});
});
</script>