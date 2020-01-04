<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>

	<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>求职管理</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/haveWork.css">
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
						<div class="title-x col-activ">已发布职位</div>
					</div>
					<div class="titlr-bor"></div>
				</div>
			</div>

			<div id="table_v" class="table-v">
				<div class="table-lst">
					<table class="layui-table" id="inviteTab";  lay-filter="invite">
						<!--<thead>
							<tr>
								 <th lay-data="{field:'positionname',align:'center'}">职位名称</th>
								<th lay-data="{field:'salaryrange',align:'center'}">薪资范围</th>
								<th lay-data="{field:'recruitnumber',align:'center'}">招聘人数</th>
								<th lay-data="{field:'workingage',align:'center'}">工作经验</th>
								<th lay-data="{field:'num', sort: true,align:'center'}">投递简历数</th>
								<th lay-data="{field:'line', sort: true,align:'center'}">是否上线</th>
								<th lay-data="{fixed: 'right', width:210, align:'center', toolbar: '#barInvite'}">操作</th> 
							</tr>
						</thead>-->
					</table>
					<script type="text/html" id="barInvite">
						<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
						<a class="layui-btn layui-btn-xs layui-btn-danger" lay-event="offline">下线</a>
						<a class="layui-btn layui-btn-xs" lay-event="upline">上线</a>
						<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
					</script>
				</div>
			</div>
		</div>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/haveWork.js"></script>

	</body>
</html>
<script>	
var firmId = "${firmId}";
var url = "${rlzyPath}";
	
	layui.use('table', function() {
		var table = layui.table;
		table.render({
		    elem: '#inviteTab'
		    ,url:url + '/company/offerManageData?firmId=' + firmId
		    ,request:{
		    		page: 'curr' //页码的参数名称，默认：page
		          }
		    ,height : 480
		    ,cols: [[
		        {field:'positionname', title: '职位名称', sort: true}
		        ,{field:'salaryrange', title: '薪资范围'}
		        ,{field:'recruitnumber', title: '招聘人数', sort: true}
		        ,{field:'workingage', title: '工作经验'}
		        ,{field:'num', title: '投递简历数'}
		        ,{field:'line', title: '是否上线', sort: true}
		        ,{field:'right', width:210, title: '操作', sort: true, toolbar: '#barInvite'}
		      ]]
		    ,page: true
		});
	});
</script>
