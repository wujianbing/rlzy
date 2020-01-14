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
<title>用人信息查看页面</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/qiyegongsiimg.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/companyinfo.css" />
<style type="text/css">
.layui-input {
	border: none;
	color: #666;
}
html,body{
background:#fff;
}
.layui-input-block.wenb.wenb2 {
	margin-left: 54px;
	width: 80%;
}

.gname {
	border: 0;
}

.layui-input-block.wenb.web3 {
	width: 80%;
	margin-left: 57px;
}

img#imghead {
	width: 105px;
	max-height: 140px;
	height: 140px;
	margin-bottom: 20px;
}

.divs:nth-of-type(3) {
	width: 120px;
	text-align: right;
	height: 100%;
	margin-left: 25px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

img#demo1 {
	width: 105px;
	max-height: 140px;
}

.layui-upload-list {
	margin: 0 auto 5px;
}

div#test1 {
	width: 100%;
}

.layui-disabled, .layui-disabled:hover {
	color: #666 !important;
	cursor: not-allowed !important;
}

.layui-unselect.layui-form-select {
	display: none;
}

.cys {
	display: none;
}

.flie-v {
	display: flex;
	justify-content: space-around;
	height: 38px;
	align-items: center;
}

#pdfg {
	display: none;
}

#test1 {
	display: none;
}
</style>
</head>

<body>

	<div class="infobox" id="app">

		<!--中间的注册第二步:填写个人信息-->
		<div class="regnum2">
			<div class="biaot">
				<span class="name1">基本信息&emsp;</span> <span class="name2"></span>
				<button class="layui-btn layui-btn-sm acd" id="editd">修改</button>
			</div>
			<form:form modelAttribute="rlzyWorker" action="" method="post"
				class="forminfo layui-form" enctype="multipart/form-data" id="form">

				<div class="tpone tpone">
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>姓名：</label>
							<div class="layui-input-block gname">
								<input type="text" id="name" title="${rlzyWorker.name}"
									name="name" disabled value="${rlzyWorker.name}" required
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>婚否：</label>
							<div class="layui-input-block">
								<input type="text" disabled
									value="${fns:getDictLabel (rlzyWorker.ismatch, 'is_match', defaultValue)}"
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect">
								<form:select class="form-control gname" path="ismatch"
									name="ismatch">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('is_match')}"
										itemLabel="label" itemValue="value" />
								</form:select>
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>专业：</label>
							<div class="layui-input-block">
								<input type="text" disabled
									value="${fns:getDictLabel (rlzyWorker.major, 'major', defaultValue)}"
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect">
								<form:select class="form-control gname" path="major"
									name="major">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('major')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
					</div>
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>年龄：</label>
							<div class="layui-input-block gname">
								<input type="text" id="age" title="${rlzyWorker.age}" name="age"
									disabled value="${rlzyWorker.age}" required
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>学历：</label>
							<div class="layui-input-block">
								<input type="text" disabled
									value="${fns:getDictLabel (rlzyWorker.education, 'education', defaultValue)}"
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect">
								<form:select class="form-control gname" path="education"
									name="education">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('education')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>性别：</label>
							<div class="layui-input-block">
								<input type="text" disabled
									value="${fns:getDictLabel (rlzyWorker.sex, 'sex', defaultValue)}"
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect">
								<form:select class="form-control gname" path="sex" name="sex">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('sex')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
					</div>
<!-- 					<div class="divs">
						<div id="addCommodityIndex">

							<div class="layui-upload layui-uploadimg-img">
								<div class="layui-upload-list">
									<img class="layui-upload-img" src="img/yc.png" id="demo1">
									<p id="demoText"></p>
								</div>
								<div class="layui-btn" id="test1">上传头像</div>
							</div>

						</div>
					</div> -->
				</div>
				<div class="biaot">
					<span class="name1">职位状况&emsp;</span> <span class="name2"></span>
				</div>
				<div class="syt tpone " style="display:flex">
					<div class="divs" >
						<div class="layui-form-item">
							<label class="layui-form-label">手机号：</label>
							<div class="layui-input-block">
								<input type="text" name="phone" disabled value="${rlzyWorker.phone}"
								required lay-verify="required" placeholder="请输入联系电话"
								autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>所在地区：</label>
							<div class="layui-input-block">
								<input type="text" id="city" name="liveplace" value="${rlzyWorker.liveplace}"  required lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>派遣状态：</label>
							<div class="layui-input-block">
								<input type="text" name="title" disabled value="1-50人" required
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect"> <select name="city"
									lay-verify="required" class="layui-input">
									<option value="0">已派遣</option>
								</select>
							</div>
						</div>

					</div>
					<div class="divs" >
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>qq：</label>
							<div class="layui-input-block">
									<input type="text" name="qq" disabled value="${rlzyWorker.qq}"
								autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">微信号：</label>
							<div class="layui-input-block">
									<input type="text" name="webchat" disabled value="${rlzyWorker.webchat}"
								autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>期望职位：</label>
							<div class="layui-input-block">
								<input type="text" disabled
									value="${fns:getDictLabel (rlzyWorker.desiredindustry, 'desired_industry', defaultValue)}"
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect">
								<form:select class="form-control gname" path="desiredindustry"
									name="desiredindustry">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('desired_industry')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>期望薪资：</label>
							<div class="layui-input-block">
								<input type="text" disabled
									value="${fns:getDictLabel (rlzyWorker.salary, 'salary', defaultValue)}"
									lay-verify="required" autocomplete="off"
									class="layui-input  setselect">
								<form:select class="form-control gname" path="salary"
									name="salary">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('salary')}"
										itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>

					</div>
				</div>
 				<div class="fuqua">
					<!-- <div class="biaot">
						<span class="name1">附件简历&emsp;</span> <span class="name2"></span>
					</div>
					<div id="pdfword">

						<div class="flie-v">
							<div class="flie-v1">2019-01-01</div>
							<div class="flie-v2">
								<i class="layui-icon layui-icon-file"></i><span>a.txt</span>
							</div>
							<div class="flie-v3">
								<a class="layui-btn layui-btn-sm ayui-btn layui-btn-primary"
									href="##">下载</a>
							</div>
						</div>

						<input id="pdfg" type="file" accept=".doc,.docx,.pdf" name="file">
					</div> -->


				</div> 
				<div class="cys">
					<div class="layui-btn btn" id="sc" style="background: #4b96cf;"
						type="text" lay-submit lay-filter="formDemo">提交审核</div>
				</div>
				</form:form>
		</div>

	</div>
	<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
	<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
	<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
	<script type="text/javascript" src="${ctxStatic }/rlzy/js/personinfo.js" ></script>
</body>

</html>
<script type="text/javascript">
var url = "${rlzyPath}";
var id = "${rlzyWorker.id}";

	layui.use([ 'form', 'upload' ], function() {
		var form = layui.form;
		var $ = layui.jquery,
			upload = layui.upload;
		var uploadInst = upload.render({
			elem : '#test1',
			url : '/upload/',
			before : function(obj) {
				//预读本地文件示例，不支持ie8
				obj.preview(function(index, file, result) {
					$('#demo1').attr('src', result); //图片链接（base64）
				});
			},
			done : function(res) {
				//如果上传失败
				if (res.code > 0) {
					return layer.msg('上传失败');
				}
			//上传成功
			},
			error : function() {
				//演示失败状态，并实现重传
				var demoText = $('#demoText');
				demoText.html(
					'<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
				demoText.find('.demo-reload').on('click', function() {
					uploadInst.upload();
				});
			}
		});

	});
	//城市级联
	$("#city").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
/* 	$(function() {

		$("#editd").click(function() {

			$(".layui-input").removeAttr("disabled");
			$("#pdfg").removeAttr("disabled");
			$(".layui-input").css('border', '1px solid #eee');
			$(".setselect").css('display', 'none');
			$(".layui-unselect.layui-form-select ").css('display', 'block');
			$(".cys").css('display', 'block');
			$(".flie-v ").css('display', 'none');
			$("#pdfg").css('display', 'block');
			$("#test1").css('display', 'block');

		})
	}); */
</script>