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
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/iconfont.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/fabuwork.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/haveWork.css">
	</head>
	<body>

		<div class="jobwant-v">

			<div class="title-v">
				<div class="title">
					<div id="title_txt" class="title-txt">
					</div>
					<div class="titlr-bor"></div>
				</div>
			</div>

			<div id="table_v" class="table-v">
				<div class="table-lst">
					<table class="layui-table" lay-data="{id:'inviteTab'}" lay-filter="invite">
						<thead>
							<tr>
								<th lay-data="{field:'jobname',align:'center', width:160}">职位名称</th>
								<th lay-data="{field:'payline',align:'center', width:130}">薪资范围</th>
								<th lay-data="{field:'numman',align:'center', width:100}">招聘人数</th>
								<th lay-data="{field:'workyear',align:'center', width:120}">工作经验</th>
								<th lay-data="{field:'num', sort: true,align:'center', width:120}">投递简历数</th>
								<th lay-data="{fixed: 'right',  align:'center', toolbar: '#barInvite'}">操作</th>
							</tr>
						</thead>
					</table>
					<script type="text/html" id="barInvite">
						<a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
					  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
					</script>
				</div>
			</div>

		</div>
		<div class="tdrdit" style="display: none;">
			<div class="jlpage" style="width: 700px;>
							<div class="infoname">
							<h5><span class="name1">职位发布&emsp;</span>
							<span class="name2"></span>
							</h5>
						
		<form class="layui-form" action="" name="fabuwork">
			<div class="row rowsy">
				<div class="col-lg-6">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>职位类型：</label>
						<div class="layui-input-block">
							<input type="text" name="jobtype" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>工作地点：</label>
						<div class="layui-input-block">
							<select name="sitecity" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>*最高学历：</label>
						<div class="layui-input-block">
							<select name="xueli" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>招聘人数：</label>
						<div class="layui-input-block">
							<select name="num" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系人：</label>
						<div class="layui-input-block">
							<input type="text" name="phone" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="col-lg-6">
						<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>职位名称：</label>
						<div class="layui-input-block">
							<input type="text" name="jobname" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>薪资范围：</label>
						<div class="layui-input-block">
							<select name="payline" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>工作经验：</label>
						<div class="layui-input-block">
							<select name="workyear" lay-verify="required">
								<option value=""></option>
								<option value="0">北京</option>
								<option value="1">上海</option>
								<option value="2">广州</option>
								<option value="3">深圳</option>
								<option value="4">杭州</option>
							</select>
						</div>
					</div>
					
				
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系电话：</label>
						<div class="layui-input-block">
							<input type="text" name="linkphone" required lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="layui-form-item layui-form-text">
						<label class="layui-form-label"><span class="sign">*</span>职位描述：</label>
						<div class="layui-input-block">
							<textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
						</div>
					</div>
				</div>
				<div class="col-lg-12">
					<div class="layui-form-item" style="z-index: 99999;">
						<label class="layui-form-label"><span class="sign">*</span>企业福利：</label>
						<div class="layui-input-block lastfuli">
							<i class="layui-icon layui-icon-rate-solid"></i>
						</div>
							<div class="fuli">
							<ul>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								<li>工资高</li>
								
							</ul>
							<div class="btntt">
								<div class="layui-btn shouq">确定</div>
							</div>
						</div>
						 
					</div>
				</div>
				<div class="col-lg-12">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>是否为急聘岗位：</label>
						<div class="layui-input-block setone">
							<select name="qucikt" lay-verify="required">
								<option value=""></option>
								<option value="0">是</option>
								<option value="1">否</option>
							</select>
						</div>
					</div>
				</div>
			</div>
             <div class="row nutbtn">
             	<div class="layui-form-item">
				   
				      <button class="layui-btn" lay-submit lay-filter="formDemo">发布</button>
				
				  </div>
             </div>
		</form>
		</div>
		</div>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	</body>
</html>
<script src="${ctxStatic }/rlzy/js/Popt.js"></script>
<script src="${ctxStatic }/rlzy/js/cityJson.js"></script>
<script src="${ctxStatic }/rlzy/js/citySet.js"></script>
<%-- <script src="${ctxStatic }/rlzy/js/fabuwork.js"></script>
<script src="${ctxStatic }/rlzy/js/haveWork.js"></script> --%>