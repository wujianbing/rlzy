<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>求职管理</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/myJobwant.css">
		<style type="text/css">
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
						<div class="title-x col-activ">面试邀请</div>
						<span class="verti">|</span>
						<div class="title-x">申请记录</div>
					</div>
					<div class="titlr-bor"></div>
				</div>
			</div>

			<div id="table_v" class="table-v">
				<div class="table-lst">
					<table class="layui-table" id="inviteTab" lay-filter="invite">
						<!-- <thead>
							<tr>
								<th lay-data="{field:'desiredposition',align:'center'}">职位名称</th>
								<th lay-data="{field:'companyname',align:'center'}">公司名称</th>
								<th lay-data="{field:'workingplace',align:'center'}">工作地点</th>
								<th lay-data="{field:'desiredsalary',align:'center'}">期望薪资</th>
								<th lay-data="{field:'accept',align:'center'}">是否接受</th>
								<th lay-data="{field:'updateDate', sort: true,align:'center'}">操作时间</th>
								<th lay-data="{fixed: 'right', width:180, align:'center', toolbar: '#barInvite'}"></th>
							</tr>
						</thead> -->
					</table>
					<script type="text/html" id="barInvite">
						<a class="layui-btn layui-btn-xs" lay-event="edit">接受</a>
						<a class="layui-btn layui-btn-xs" lay-event="view">查看</a>
					    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">拒绝</a>
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
				</div>
			</div>

		</div>

		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/myJobwant.js"></script>
</body>
</html>
<script>
var url = "${rlzyPath}";
var userId = "${userId}";

layui.use('table', function() {
	var table = layui.table;
	table.render({
	    elem: '#inviteTab'
	    ,url: url + '/user/interview?userId=' + userId
	    ,request:{
	    		page: 'curr' //页码的参数名称，默认：page
	          }
	    ,height : 480
	    ,cols: [[
	        {field:'desiredposition', title: '职位名称', sort: true}
	        ,{field:'companyname', title: '公司名称'}
	        ,{field:'workingplace', title: '工作地点', sort: true}
	        ,{field:'salary', title: '薪资'}
	        ,{field:'accept', title: '是否接受'}
	        ,{field:'updateDate', title: '操作时间', sort: true}
	        ,{field:'right', width:180, title: '操作', sort: true, toolbar: '#barInvite'}
	      ]]
	    ,page: true
	});
	
	table.render({
	    elem: '#recordTab'
	    ,url:url + '/user/applyFor?userId=' + userId
	    ,request:{
	    		page: 'curr' //页码的参数名称，默认：page
	          }
	    ,height : 480
	    ,cols: [[
	        {field:'positionname', title: '职位名称', sort: true}
	        ,{field:'companyname', title: '公司名称'}
	        ,{field:'workingplace', title: '工作地点'}
	        ,{field:'salary', title: '薪资'}
	        ,{field:'updateDate', title: '邀请时间', sort: true}
	        ,{field:'invite', width:120, title: '状态'}
	      ]]
	    ,page: true
	});
});
</script>