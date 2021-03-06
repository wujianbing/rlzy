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
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/haveMan.css">
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
						<div class="title-x col-activ">已收到的简历</div>
						<span class="verti">|</span>
						<div class="title-x">已邀请的简历</div>
					</div>
					<div class="titlr-bor"></div>
				</div>
			</div>

			<div id="table_v" class="table-v">
				<div class="table-lst">
					<table class="layui-table" id="inviteTab" lay-filter="invite">
						<!-- <thead>
							<tr>
								<th lay-data="{field:'positionname',align:'center'}">投递职位</th>
								<th lay-data="{field:'username',align:'center'}">姓名</th>
								<th lay-data="{field:'age',align:'center', width:60}">年龄</th>
								<th lay-data="{field:'sex',align:'center', width:60}">性别</th>
								<th lay-data="{field:'workingage', sort: true,align:'center'}">工作年限</th>
								<th lay-data="{field:'currentstate',align:'center'}">求职状态</th>
								<th lay-data="{field:'invite',align:'center'}">是否邀请</th>
								<th lay-data="{field:'accept',align:'center'}">是否接受</th>
								<th lay-data="{fixed: 'right',  align:'center', width:180, toolbar: '#barInvite'}">操作</th>
							</tr>
						</thead> -->
					</table>
					<script type="text/html" id="barInvite">
						<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="view">查看</a>
						<a class="layui-btn layui-btn-xs" lay-event="yq">邀请</a>
						<a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
					</script>
				</div>
				<div class="table-lst" style="display: none;">
					<table class="layui-table" id="recordTab" lay-filter="record">
						<!-- <thead>
							<tr>
								<th lay-data="{field:'positionname',align:'center'}">职位名称</th>
								<th lay-data="{field:'companyname',align:'center'}">公司名称</th>
								<th lay-data="{field:'workingplace',align:'center'}">工作地点</th>
								<th lay-data="{field:'salary',align:'center'}">薪资</th>
								<th lay-data="{field:'updateDate', sort: true,align:'center'}">邀请时间</th>
								<th lay-data="{field:'invite', sort: true,width:120,align:'center'}">状态</th>
							</tr>
						</thead> -->
					</table>
					<script type="text/html" id="barInvite1">
						<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="view">查看</a>
					</script>
				</div>
			</div>

		</div>

		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/haveMan.js"></script>

	</body>
</html>
<script>
var firmId = "${firmId}";
var url = "${rlzyPath}";

layui.use('table', function() {
	var table = layui.table;
	table.render({
	    elem: '#inviteTab'
	    ,url:url + '/company/receiveResumeData?firmId=' + firmId
	    ,request:{
	    		page: 'curr' //页码的参数名称，默认：page
	          }
	    ,height : 480
	    ,cols: [[
			{field:'positionname', title: '投递职位', sort: true,width:180}
	        ,{field:'username', title: '姓名', sort: true,width:100}
	        ,{field:'age', title: '年龄', width:60}
	        ,{field:'sex', title: '性别', sort: true,width:80}
	        ,{field:'workingage', title: '工作年限', width:100}
	        ,{field:'currentstate', title: '工作状态', sort: true, width:120}
	        ,{field:'invite', title: '是否邀请', sort: true, width:120}
	        ,{field:'accept', title: '是否接受', sort: true, width:120}
	        ,{field:'right', width:180, title: '操作', sort: true, toolbar: '#barInvite',fixed:'right'}
	      ]]
	    ,page: true
	});
	
	table.render({
	    elem: '#recordTab'
	    ,url:url + '/company/inviteResumeData?firmId=' + firmId
	    ,request:{
	    		page: 'curr' //页码的参数名称，默认：page
	          }
	    ,height : 480
	    ,cols: [[
	        {field:'positionname', title: '职位名称', sort: true}
	        ,{field:'username', title: '姓名'}
	        ,{field:'workingage', title: '工作年限'}
	        ,{field:'currentstate', title: '工作状态'}
	        ,{field:'accept', title: '是否接受', sort: true}
	        ,{field:'right', width:80, title: '操作', sort: true, toolbar: '#barInvite1'}
	      ]]
	    ,page: true
	});
});
</script>