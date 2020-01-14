<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>用人信息</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/qiyegongsiimg.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/companyinfo.css" />
		<style type="text/css">
			.layui-input {
				border: 1px solid rgb(204, 204, 204);
				color: #666;
			}
			
			.layui-input-block.wenb.wenb2 {
				margin-left: 54px;
				width: 80%;
			}
			html,body{
				background:#fff;
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
				margin-left: 15px;
				display: flex;
				flex-direction: column;
				align-items: center;
			}
			
			.divs:nth-of-type(2) {
				margin-left: 0px;
			}
			
			.tpone {
				padding: 0;
				width: 100%;
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
		</style>
	</head>

	<body>

		<div class="infobox" id="app">

			<!--中间的注册第二步:填写个人信息-->
			<div class="regnum2">
				<div class="biaot">
					<span class="name1">基本信息&emsp;</span>
					<span class="name2"></span>
				</div>
				<form:form modelAttribute="rlzyWorker" action="" method="post"
				class="forminfo layui-form" enctype="multipart/form-data"
						id="form">

					<div class="tpone tpone">
						<div class="divs">
							<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>企业名称：</label>
										<div class="layui-input-block">
											<input type="text" name="name" required
												lay-verify="required" placeholder="请输入人员姓名"
												autocomplete="off" class="layui-input">
										</div>
									</div>

							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>婚否：</label>
								<div class="layui-input-block">
								<form:select class="form-control gname"  path="ismatch" name="ismatch">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('is_match')}" itemLabel="label" itemValue="value"  />
								</form:select>
							</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>专业：</label>
								<div class="layui-input-block">
								<form:select class="form-control gname" path="major" name ="major">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('major')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
							</div>

						</div>
						<div class="divs">
							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>年龄：</label>
											<div class="layui-input-block">
											<input type="text" name="age" required
												lay-verify="required" 
												autocomplete="off" class="layui-input">
										</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>学历：</label>
								<div class="layui-input-block">
								<form:select class="form-control gname"  path="education" name="education">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('education')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
							</div>

							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>性别：</label>
								<div class="layui-input-block">
								<form:select class="form-control gname"  path="sex" name="sex">
									<form:option value="" label=""/>
									<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
								</div>
							</div>
						</div>
<!-- 						<div class="divs">
							<div id="addCommodityIndex">

								<div class="layui-upload layui-uploadimg-img">
									<div class="layui-upload-list">
										<img class="layui-upload-img" src="" id="demo1">
										<input id = "demo2" hidden="hidden" name="photo" value=""/>
										<p id="demoText"></p>
									</div>
									<div class="layui-btn" id="photo">上传头像</div>
								</div>

							</div>
							
						</div>
					</div> -->
					<div class="biaot">
						<span class="name1">其他信息&emsp;</span>
						<span class="name2"></span>
					</div>
					<div class="syt tpone " style="display:flex">
						<div class="divs">
							<div class="layui-form-item">
								<label class="layui-form-label">手机号：</label>
								<div class="layui-input-block">
											<input type="text" name="phone" required
												lay-verify="required" 
												autocomplete="off" class="layui-input">
										</div>
							</div>

				
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>所在地区：</label>
									<div class="layui-input-block">
											<input type="text" id="city" name="liveplace"
												lay-verify="required" required lay-verify="required"
												autocomplete="off" placeholder="请输入所在地区" class="layui-input">
										</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>派遣状态：</label>
							<div class="layui-input-block">

								<select name="dispatchstate"  id="dispatchstate" lay-verify="required">
									<option value=""></option>
									<option value="0">已派遣</option>
									<option value="1">未派遣</option>

								</select>
							</div>
						</div>

					</div>
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>qq：</label>
							<div class="layui-input-block">
											<input type="text" name="qq" required
												lay-verify="required" 
												autocomplete="off" class="layui-input">
										</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">微信号：</label>
							<div class="layui-input-block">
											<input type="text" name="webchat" required
												lay-verify="required" 
												autocomplete="off" class="layui-input">
										</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>期望行业：</label>
							<div class="layui-input-block">
							<form:select class="form-control gname"  path="desiredindustry" name="desiredindustry">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('desired_industry')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>期望薪资：</label>
							<div class="layui-input-block">
						<form:select class="form-control gname"  path="salary" name="salary">
								<form:option value="" label=""/>
								<form:options items="${fns:getDictList('salary')}" itemLabel="label" itemValue="value" htmlEscape="false" />
							</form:select>
						</div>
						</div>
					</div>
			</div>
<!-- 			<div class="fuqua">
				<div class="biaot">
					<span class="name1">附件简历&emsp;</span>
					<span class="name2"></span>
				</div>
				<div id="pdfword">
					<input id="pdfg"  type="file" accept=".doc,.docx,.pdf" name="file">
				</div>

			</div> -->
			<div class="cys">
				<div class="layui-btn btn" id="btn1" style="background: #4b96cf;" type="text" lay-submit lay-filter="formDemo" >提交审核</div>
			</div>
			</form:form>

		</div>
				<input id="" name="companyid" hidden="hidden" value="${id}"/>	
		</div>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
	</body>

</html>
<script type="text/javascript">
	
	layui.use('form', function() {
		var form = layui.form;
		//监听表单提交非空验证
		form.on('submit(formDemo)', function(data) {
			$.ajax({
				cache : true,
				type : "POST",
				url : "${rlzyPath}/company/saveWorker",
				data : $("#form").serialize(),
				success : function(data) {
					if (data != "") {
						layer.msg("注册信息填写成功!");
						$("#companyId").val(data);
						var index = parent.layer.getFrameIndex(window.name);
            			parent.layer.close(index);
            			self.location.reload();
					}
				}
			});
			return false;
		});
	});
    
     layui.use(['form', 'upload'], function() {
		var form = layui.form;
		var $ = layui.jquery,
			upload = layui.upload;
		var uploadInst = upload.render({
			elem: '#photo',
			url:'',
			before: function(obj) {
				//预读本地文件示例，不支持ie8
				console.log(obj);
				obj.preview(function(index, file, result) {
				console.log(file);								
						var formData = new FormData();
						formData.append("file", file);
						$.ajax({
							type : 'POST',
							url : '${rlzyPath}/company/upload?flag=2',
							data : formData,
							contentType : false,
							processData : false,
							async : true,
							success : function(result) {
								console.log(result);
								$('#demo1').attr('src', result); //图片链接（base64）
								$('#demo2').val(result);
							}
						});
				});
			},
		});

	}); 
	
	
	$('#pdfg').onclick=function() {
		var formData = new FormData();
		var file = document.getElementById("pdfg").files[0];
		formData.append("file", file);
		$.ajax({
			type : 'POST',
			url : '${rlzyPath}/company/upload?flag=2',
			data : formData,
			contentType : false,
			processData : false,
			async : true,
			success : function(result) {
			console.log(result);
				$("#businesslicense").val(result);
				$("#imghead2").attr("src", result);

			}
		});
	};
    
		//城市级联
	$("#city").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
</script>

