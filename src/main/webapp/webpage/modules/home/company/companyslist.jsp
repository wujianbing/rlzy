<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>合作企业列表</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/haveMan.css">
		<style>
			.titlr-bor {
				flex: 6;
			}
			.addbtn{
				width:30px;
				height: 30px;
				border: 1px dotted #999;
				border-radius: 2px;
				text-align: center;
				line-height: 30px;
				background: transparent;
			}
		.addbtn	i.layui-icon{
			color: #333;
		}
		</style>
	</head>

	<body>

		<div class="jobwant-v">
			<div class="title-v">
				<div class="title">
					<div id="title_txt" class="title-txt">
						<div class="title-x col-activ">合作企业&emsp;</div>
					</div>
					<div class="titlr-bor"></div>
				</div>
			</div>

			
				<div id="table_v" class="table-v">
				<div class="table-lst">
					<table class="layui-table" id="inviteTab" lay-filter="invite">
						<!-- <thead>
							<tr>
								<th lay-data="{field:'jobname',align:'left'}">企业名称</th>
								<th lay-data="{field:'name',align:'center'}">企业性质</th>
								<th lay-data="{field:'age',align:'center', width:70}">类型</th>
								<th lay-data="{field:'sex',align:'center', width:70}">规模</th>
								<th lay-data="{field:'type',align:'center',}">信用代码</th>
								<th lay-data="{field:'pay',align:'center',}">所在地区</th>
								<th lay-data="{field:'time',align:'center'}">联系电话</th>
								
								<th lay-data="{fixed: 'right',  align:'center', width:150, toolbar: '#barInvite'}">操作</th>
							</tr>
						</thead> -->
					</table>
					<script type="text/html" id="barInvite">
						<a class="layui-btn layui-btn-xs" lay-event="ck">查看</a>
						<a class="layui-btn layui-btn-xs" lay-event="del">删除</a>
					</script>
					
				<script type="text/html" id="toolbarDemo">
				  <div class="layui-btn-container">
				    <button class="addbtn" lay-event="add"><i class="layui-icon">&#xe654;</i>  </button>
				  </div>
				</script>
				</div>
			</div>


		

		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/companyslist.js"></script>

	</body>

</html>
<script>
var url = "${rlzyPath}";
var id = "${companyId}";

layui.use('table', function() {
	var table = layui.table;
	table.render({
	    elem: '#inviteTab'
	    ,url:url+'/company/cooperationData?id='+id
	    ,request:{
	    		page: 'curr' //页码的参数名称，默认：page
	          }
	    ,height : 480
	    ,cols: [[
	        {field:'companyName', title: '公司名称',width:150, sort: true}
	        ,{field:'address', title: '公司地址', width:250,}
	        ,{field:'contact', title: '联系人'}
	        ,{field:'registeredcapital', title: '注册资金'}
	        ,{field:'companyprofile', title: '公司简介'}
	        ,{field:'right', width:150, title: '操作', sort: true, toolbar: '#barInvite'}
	      ]]
	    ,page: true
	    ,toolbar: '#toolbarDemo'
	    ,defaultToolbar: ['', '', '']
	    ,done: function(res, curr, count) {
			//如果是异步请求数据方式，res即为你接口返回的信息。
			//如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
			console.log(res);
			//得到当前页码
			console.log(curr);
			//得到数据总量
			console.log(count);
		}
	});
});
</script>