<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>合作企业信息</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/qiyegongsiimg.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/companyinfo.css" />
		<style type="text/css">
			.layui-input{
			      border: 1px solid rgb(204, 204, 204);
			   color: #666;
			}
	   
		
		.layui-input-block.wenb.wenb2 {
				    margin-left: 54px;
				    width: 80%;
		}
		.layui-input-block.wenb.web3 {
		    width: 80%;
		    margin-left: 57px;
		}
	
		</style>
	</head>

	<body>

		<div class="infobox" id="app">

			<!--中间的注册第二步:填写个人信息-->
			<form:form modelAttribute="rlzyCooperation" action="" method="post"
				class="forminfo layui-form" enctype="multipart/form-data"
						id="form">
			<div class="regnum2">
					<div class="biaot">
						<span class="name1">基本信息&emsp;</span>
						<span class="name2"></span>
					</div>
					
					<div class="tpone tpone">
						
								<div class="divs">
									<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>企业名称：</label>
										<div class="layui-input-block">
											<input type="text" name="companyname" required
												lay-verify="required" placeholder="请输入企业名称"
												autocomplete="off" class="layui-input">
										</div>
									</div>

									<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>企业性质：</label>
										<div class="layui-input-block">
											<form:select class="form-control" path="companynature"
												name="companynature">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('company_nature')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select>
										</div>
									</div>
									
							<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>企业规模：</label>
										<div class="layui-input-block">
											<form:select class="form-control" path="companyscale"
												name="companyscale">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('company_scale')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select>
										</div>
									</div>
									
									<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>所属行业：</label>
										<div class="layui-input-block">
											<form:select class="form-control" path="industry"
												name="industry">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('desired_industry')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select>
										</div>
									</div>
									
							<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>所在地区：</label>
										<div class="layui-input-block">
											<input type="text" id="city" name="localplace"
												lay-verify="required" required lay-verify="required"
												autocomplete="off" placeholder="请输入所在地区" class="layui-input">
										</div>
									</div>
									
							<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>信用代码：</label>
										<div class="layui-input-block">
											<input type="text" name="creditcode" required
												lay-verify="required" placeholder="请输入社会统一信用代码"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									
								
						</div>
						
						<div class="divs">
									<div class="layui-form-item big-photo">
										<label class="layui-form-label"><span class="sign">*</span>企业logo：</label>
										<div class="layui-input-block">
											<div id="preview">
												<img id="imghead" class="imglogo" border="0"
													src="${ctxStatic }/rlzy/img/sc.jpg"
													onclick="$('#certiimg').click();">
											</div>
											<input type="file" style="display: none;" id="certiimg">
											<input type="text" value="" name="logo" hidden="hidden"
												id="logo">
										</div>
									</div>
									
									<div class="layui-form-item big-photo">
										<label class="layui-form-label"><span class="sign">*</span>企业营业执照：</label>
										<div class="layui-input-block">
											<div id="preview2">
												<img id="imghead2" class="imglogo" border="0"
													src="${ctxStatic }/rlzy/img/sc.jpg"
													onclick="$('#license').click();">
											</div>
											<input type="file" style="display: none;" id="license">
											<input type="text" value="" name="businesslicense"
												hidden="hidden" id="businesslicense">
										</div>
									</div>
									
									<div class="layui-form-item">
										<label class="layui-form-label">注册资金：</label>
										<div class="layui-input-block layui-input-inline"
											style='margin-left: 5px'>
											<input type="text" name="registeredcapital"
												placeholder="请输入注册资金" autocomplete="off" class="layui-input">
										</div>
										<div class="layui-form-mid layui-word-aux">万</div>
									</div>
									
									<div class="layui-form-item">
										<label class="layui-form-label">企业网址：</label>
										<div class="layui-input-block">
											<input type="text" name="companywebsite"
												placeholder="请输入企业网址" autocomplete="off" class="layui-input">
										</div>
									</div>
		
					</div>
					</div>
					
					
					<div class="biaot">
						<span class="name1">联系方式&emsp;</span>
						<span class="name2"></span>
					</div>
							<div class="tpone">
								<div class='divs'>
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>联系人：</label>
									<div class="layui-input-block">
										<input type="text" name="contacts" required
											lay-verify="required" placeholder="请输入联系人姓名"
											autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>联系电话：</label>
									<div class="layui-input-block">
										<input id="zd" type="text" name="telephone" required
											lay-verify="required" placeholder="请输入联系电话" 
											autocomplete="off" class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>联系邮箱：</label>
									<div class="layui-input-block">
										<input type="email" name="email" required
											lay-verify="required" placeholder="请输入联系邮箱"
											autocomplete="off" class="layui-input">
									</div>
								</div>
								</div>
                                 
                                 <div class='divs'>
                                 	<div class="layui-form-item">
									<label class="layui-form-label">QQ：</label>
									<div class="layui-input-block">
										<input type="text" name="qq" placeholder="请输入QQ号"
											autocomplete="off" class="layui-input">
									</div>
								</div>


								<div class="layui-form-item">
									<label class="layui-form-label">微信：</label>
									<div class="layui-input-block">
										<input type="email" name="webchat" placeholder="请输入微信号"
											autocomplete="off" class="layui-input">
									</div>
								</div>
								
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>联系地址：</label>
									<div class="layui-input-block wenb">
										<input id="map" type="text" name="address" required
											lay-verify="required" placeholder="请输入联系地址"
											autocomplete="off" class="layui-input" >
									</div>
								</div>
                                 
                                 </div>
						
								
									</div>
							

						
						<div class="fuqua">
						<div class="biaot">
						<span class="name1">企业介绍&emsp;</span>
						<span class="name2"></span>
					</div>
						<!--<p class="word2">
									
						</p>-->
					<div class="tpone service"onblur="geocoder();" >
							<div class="layui-form-item layui-form-text">
									<label class="layui-form-label" style="width: 122px;"><span
										class="sign">*</span>企业介绍:</label>
									<div class="layui-input-block wenb">
										<textarea id="123d" name="companyprofile" placeholder="请输入企业介绍"
											class="layui-textarea textarea" onKeyUp="Huitextarealength(this)"></textarea>
											<p class="textarea-numberbar"><em class="textarea-length">0</em>/<am>1000</am></p>
									</div>
								</div>
					</div>
				</div>
				<div class="layui-form-item cys">
								<button class="layui-btn btn" id="btn1" lay-submit
									lay-filter="formDemo">提交审核</button>
							</div>
							
								</div>
								</div>
				<input id="" name="companyid" hidden="hidden" value="${id}"/>	
			</form:form>
			</div>

		</div>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/logophoto1.js"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/yyphoto1.js"></script>
	</body>

</html>
<script type="text/javascript">
	layui.use('form', function() {
		var form = layui.form;
	});
	
	
	layui.use('form', function() {
		var form = layui.form;
		//监听表单提交非空验证
		form.on('submit(formDemo)', function(data) {
			$.ajax({
				cache : true,
				type : "POST",
				url : "${rlzyPath}/company/saveCooperation",
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
	</script>
    
    
    <script type="text/javascript">
	//logo文件上传
	$('#certiimg').on('change', function() {
		var formData = new FormData();
		var file = document.getElementById("certiimg").files[0];
		// 检测文件大小 1024*1024=1048576(1M)
		/* if (file.size >= 1048576) {
			alert("上传图片大小不得超过1M")
			return false;
		} */
		console.log(file);
		formData.append("file", file);
		$.ajax({
			type : 'POST',
			url : '${rlzyPath}/company/upload?flag=2',
			data : formData,
			contentType : false,
			processData : false,
			async : true,
			success : function(result) {
				$("#logo").val(result);
				$("#imghead").attr("src", result);

			}
		});
	})
	//营业执照上传
	$('#license').on('change', function() {
		var formData = new FormData();
		var file = document.getElementById("license").files[0];
		formData.append("file", file);
		$.ajax({
			type : 'POST',
			url : '${rlzyPath}/company/upload?flag=2',
			data : formData,
			contentType : false,
			processData : false,
			async : true,
			success : function(result) {
				$("#businesslicense").val(result);
				$("#imghead2").attr("src", result);

			}
		});
	});
	

	//文本框的字数限制以及自动调整高度
		var Huitextarealength = function (obj){
			
	    var html = $(obj).parent();
	    var tatal = html.find('am').html();
	    var sets = $(obj).val().length;
	   
	    if(sets*1>tatal*1){
	        var str = '<div style="width: auto;position: absolute; right: 4%;color: red;">内容超出限制</div>';
	        $(obj).after(str);
	        html.find('em').css({color:'red'});
	    }else {
	        $(obj).parent().find('div').remove();
	        html.find('em').css({color:'black'});
	   		$("#123d").autoHeight();
	   	
	    }
	    //设置已输入数量
	    html.find('em').html(sets);
	}

	$.fn.autoHeight = function(){
		
		function autoHeight(elem){
			elem.style.height = 'auto';
			elem.scrollTop = 0; //防抖动
			elem.style.height = elem.scrollHeight + 'px';
			
		}
		
		this.each(function(){
			autoHeight(this);
			$(this).on('keyup', function(){
				autoHeight(this);
				
			});
		});

	}
		//城市级联
	$("#city").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
</script>

