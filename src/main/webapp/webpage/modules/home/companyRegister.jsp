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
<title>吴忠人力资源企业注册流程</title>
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel='stylesheet' href='${ctxStatic }/rlzy/css/iconfont.css' />
<link rel='stylesheet'
	href='${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css' />
<link rel='stylesheet'
	href='${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css' />
<link rel='stylesheet'
	href='${ctxStatic }/rlzy/css/Registeredcomment.css' />
<link rel='stylesheet' href='${ctxStatic }/rlzy/css/RegisteredFind.css' />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/main1119.css" />
		<!-- <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=ca98cd2bcafcacd654a33e4cf5e42dd9&plugin=AMap.Geocoder"></script>--> 
		<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=0250860ccb5953fa5d655e8acf40ebb7&plugin=AMap.Geocoder"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/addToolbar.js"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/main2.js"></script>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/my-modal.css" />
<style>
<style type="text/css">

	#yzm {
	    display: inline-block;
	    width: 7rem;
	    margin-left: 2rem;
	    text-align: center;
	       height: 40px;
    line-height:40px;
	    border-radius: 5px;
	    color: #4b96cf;
	    font-weight: normal;
	    border: 1px solid #4b96cf;
        font-size: 14px;
        cursor: pointer;
	}	

.leftnum {
    width: 5rem;
}
.worduser2 {
    text-decoration: underline;
    text-align: center;
    font-size: 14px;
    color: #9999;
    padding-left: 2rem;
    margin-top: 1rem;
    margin-bottom: 4rem;
}

.m3{
	cursor: pointer;
	color: #4b96cf;
}
p.textarea-numberbar {
    width: auto;
    height: 19px;
    /* background: #fff; */
    /* float: right; */
    margin-top: -10px;
    /* z-index: 999; */
    /* overflow: visible; */
    position: absolute;
    right: 162px;
    bottom: 2px;
}
		.name1 {
    color: #4b96cf;
}
.titleTop {
    padding: 23px 0;
    background: #fff;
}
.yuqbottom {
    width: 1200px;
    padding: 27 0;
    /* min-height: 66%; */
    background: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 999;
}
.wenb textarea {
    width: 85%;
}
.tpone {
    padding: 0;
}
.test-span {
    font-size: 16px;
    color: red;
    position: absolute;
}
</style>
</head>
<body>
	<!--首页内容-->
	<div id ="body" class="humanbox">
		<div class="yuqbottom">
			<!--里面注册部分-->
			<div class="asp">
				<h5>企业注册流程</h5>
				<!--流程数字显示-->
				<div class="processReg">
					<span class="ringnum activeRing">1</span>
					<!--线条-->
					<span class="lineSpan"></span> <span class="ringnum ring2">2</span>
					<span class="lineSpan"></span> <span class="ringnum ring3">3</span>
				</div>

				<!--中间的注册第一 步:输入手机号，验证验证码-->
				<div class="regnum" style="margin-top: 2px;">
					<form action="">
						<p class="formname">
							<span class="leftnum">手机号：</span><input type="text" id="num"
								value=""  maxlength="11"
								placeholder="请输入手机号码" />
						</p>
						<p class="formname">
							<span class="leftnum">验证码：</span><input type="text"
								placeholder="" maxlength="4" id="yzcode" /><label
								id="yzm" >获取验证码</label>
						</p>
					</form>
					<p class="btnone">
						<input type="button" class="ljzc" value="立即注册"
							onclick="phonenum()" />
					</p>
					<p class="worduser2">
						点击立即注册即表示您同意<a target="_blank" href="${rlzyPath}/user/agreement" class='m3'>《用户使用协议》</a>
					</p>
				</div>

				<!--中间的注册第二步:填写个人信息-->
				<div class="regnum2" style="display: none;">
					<form:form modelAttribute="rlzyCompany" action="" method="post"
						class="forminfo layui-form" enctype="multipart/form-data"
						id="form">
						<form action="" method="post" class="forminfo layui-form">
							<!-- 标题 -->
							<div class="biaot">
								<span class="name1">基本信息&emsp;</span> <span class="name2"></span>
							</div>
							<!-- 基本信息 -->
							<div class="topone">
								<!-- 左边的div -->
								<div class="divs">
									<div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>企业名称：</label>
										<div class="layui-input-block">
											<input type="text" name="companyname" required
												lay-verify="required" placeholder="请输入企业名称"
												autocomplete="off" class="layui-input">
										</div>
									</div>
									<%-- <div class="layui-form-item">
										<label class="layui-form-label"><span class="sign">*</span>企业性质：</label>
										<div class="layui-input-block">
											<form:select class="form-control" path="companynature"
												name="companynature">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('company_nature')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select>
										</div>
									</div> --%>
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
								<!-- 左边的div -->
								<div class="divs">
									<div class="layui-form-item big-photo">
										<label class="layui-form-label"><span class="sign">*</span>企业logo：</label>
										<div class="layui-input-block">
											<div id="preview">
												<img id="imghead" class="imglogo" border="0"
													src="${ctxStatic }/rlzy/img/sc.jpg"
													onclick="$('#certiimg').click();">
											</div>
											<input type="file" style="display: none;" id="certiimg" accept=".jpeg,.jpg,.png" />
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
											<input type="file" style="display: none;" id="license" accept=".jpeg,.jpg,.png" />
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
								<!-- 文本输入框 -->
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


							<div class="biaot">
								<span class="name1">联系方式&emsp;</span> <span class="name2"></span>
							</div>
							<!--联系人  -->
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
											autocomplete="off" class="layui-input" onblur="geocoder();">
									</div>
								</div>
								
								</div>

								
								<input id="lnglat" name="lnglat" value="" hidden="hidden">

							</div>
							<div class="biaot">
								<span class="name1">账号信息&emsp;</span> <span class="name2"></span>
							</div>
							<!-- 用户名 -->
							<div class="tpone">
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>用户名：</label>
									<div class="layui-input-block">
										<input type="text" name="nickName" required
											lay-verify="required" placeholder="请输入用户名" autocomplete="off"
											class="layui-input">
									</div>
								</div>
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>设置密码：</label>
									<div class="layui-input-block">
										<input type="password" id="psw" name="password" required
											lay-verify="required" placeholder="请输入密码" autocomplete="off"
											class="layui-input">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>确认密码：</label>
									<div class="layui-input-block">
										<input type="password" id="psw_ag" name="title" required
											lay-verify="required" placeholder="请确认密码" autocomplete="off"
											class="layui-input">
									</div>
								</div>

							</div>
							<div class="biaot">
								<span class="name1">入驻信息&emsp;</span> <span class="name2"></span>
							</div>
							<!-- 入住账户信息 -->
							<div class="tpone">
								<!-- 入驻类型 -->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>入驻类型：</label>
									<div class="layui-input-block">
										<form:select class="form-control" path="companytype"
											name="companytype" lay-verify="required">
											<form:options items="${fns:getDictList('company_type')}"
												itemLabel="label" itemValue="value" htmlEscape="false" />
										</form:select>
									</div>
								</div>
								<!-- <div class="layui-form-item" style="margin-top: 20px;">
									<label class="layui-form-label"><span class="sign">*</span>入驻缴费：</label>
									<div class="layui-input-block wenb web2">

										<p class="pnamew">信息填写完成后需缴纳1,000￥平台入驻费，点击注册跳转至支付流程，我们会在1-3个工作日内完成入驻审核，
											若审核不通过会退还您的入驻费用。</p>
									</div>
								</div> -->
							</div>
							<div class="layui-form-item cys">
								<button class="layui-btn btn" id="btn1" lay-submit
									lay-filter="formDemo">提交审核</button>
							</div>
						</form>
					</form:form>
					
					<div id="container" style="display: none;"></div>
					<div id="panel" style="display: none;"></div>
				
				</div>
				<!--注册成功-->
				<div class="regnum3" style="display: none;">
					<div class="btnq">
						<span class="iconfont icon-zhengpinbaozhangduigou"></span>
					</div>
					<div class="btnq">注册成功</div>
					<p class="p1">马上完善求职信息</p>
					<p class="p2" id="p2">
						<span class="tztime">3</span>s后自动跳转到简历完善页面
					</p>

				</div>
			</div>
		</div>
	</div>
	<!--下面的角色选择-->
	<div class="m-modal" style="display: none;">
		<div class="m-modal-dialog">
			<div class="m-top">
				<h4 class="m-modal-title">
				 温馨提示
			</h4>
				<span class="m-modal-close">&times;</span>
			</div>
			<!--模态框的简历基本信息-->
			<div class="m-middle">
				${fns:unescapeHtml(news.content)}
			</div>
		</div>
	</div>
	<input id="companyId" value="" hidden="hidden">
</body>

<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
<script src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/logophoto.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/yyphoto.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>
<script src="${ctxStatic }/rlzy/js/registerunti.js"></script>
<script src="${ctxStatic }/rlzy/js/register.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var m1 = new MyModal.modal(function() {
		});
		m1.show()
	});
	/* 手机号验证 */
	/* var bools = true;
	function checkPhone() {
		var _phone = document.getElementById("num").value; //获取手机号 
		if (!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test(_phone))) {
			layer.msg('您的手机号不正确，请重新输入！');
			return false;
		}
		//验证手机号是否已注册 TODO
		$.ajax({
	        type: "POST",
	        url: "${rlzyPath}/company/check",
	        data: {"phone":_phone},
	        success: function(data){
	        	if(data == "2"){
	        		layer.msg('该手机号已经注册过，请登录！');
	        		bools = false;
	        		return false;
	        	}else{
	        		bools = true;
	        	}
	    	}
	       
	    });
	}; */
	/* 短信验证码到倒计时 */
	/* var bool = true;
	function count() {
		var phone = document.getElementById("num").value; //获取手机号
		//验证码获取 TODO
		if(!bools){
			layer.msg('该手机号已经注册过，请登录！');
			return false;
		}
		$.get("${rlzyPath}/home/sendSms?phone="+phone);
		if(bool == true) {
		if (bool == true) {
			var lab = document.getElementById('yzm');
			var count = 60;
			var time = setInterval(function() {
				bool = false;
				count--;
				lab.innerHTML = count + "秒";
				if (count == 0) {
					clearInterval(time);
					lab.innerHTML = '重新获验证码';
					bool = true;
				}
				;
			}, 1000);
		}
		if (bool == false) {
			return false;
		}
	}
}; */

	//禁止返回
	var status = localStorage.getItem("status");
	if (status == "1") {
		$('.regnum').css("display", "none");
		$('.regnum2').css("display", "block");
		$('.regnum3').css("display", "none");
		$('.ringnum').addClass('activeRing').siblings().removeClass('activeRing');
		$('.ring2').addClass('activeRing');
	} else if (status == "2") {
		$('.regnum').css("display", "none");
		$('.regnum2').css("display", "none");
		$('.regnum3').css("display", "block");
		$('.ringnum').addClass('activeRing').siblings().removeClass('activeRing');
		$('.ring3').addClass('activeRing');
		Load();
	}
	//验证码和手机号都验证完毕点击立即注册后出现填写详细信息页面的函数
	function phonenum() {
		
		//获取验证码
		var code = document.getElementById("yzcode").value;
		var phone = document.getElementById("num").value; //获取手机号
		if(code!=""&& phone!=""){
			$.ajax({
				type : "POST",
				url : "${rlzyPath}/home/checkSms",
				data : {
					"code" : code
				},
				success : function(data) {
					if (data[0] == "0") {
						layer.msg("验证码错误，请重新输入");
						return false;
					} else {
						localStorage.setItem("status", "1");
						$('.regnum').css("display", "none");
						$('.regnum2').css("display", "block");
						$('.regnum3').css("display", "none");
						$('.ringnum').addClass('activeRing').siblings().removeClass('activeRing');
						$('.ring2').addClass('activeRing');
						var phone = document.getElementById("num").value; //获取手机号
						$("#zd").val(phone);
						$(".yuqbottom").css("height","auto");
						$(".asp").css("paddingTop","0");
					}
				}
			});
		}else{
			layer.msg("请输入手机号或验证码!");
			return false;
		}
	}

	//填写详细信息页面毕点击提交后出现页面的函数
	function zczg() {
		localStorage.setItem("status", "2");
		$('.regnum').css("display", "none");
		$('.regnum2').css("display", "none");
		$('.regnum3').css("display", "block");
		$('.ringnum').addClass('activeRing').siblings().removeClass('activeRing');
		$('.ring3').addClass('activeRing');
		Load();
	}
	var secs = 3; //倒计时的秒数
	var companyId = $("#companyId").val();
	var URL = '${rlzyPath}/home/index';
	//var URL = '${rlzyPath}/pay/payMethod?companyId='+companyId;
	function Load() {
		for (var i = secs; i >= 0; i--) {
			window.setTimeout('doUpdate(' + i + ')', (secs - i) * 1000);
		}
	}

	function doUpdate(num) {
		document.getElementById('p2').innerHTML = '将在' + num + '秒后自动跳转到支付页面';
		if (num == 0) {
			window.location = URL;
		}
	}

	layui.use('form', function() {
		var form = layui.form;
		//监听表单提交非空验证
		form.on('submit(formDemo)', function(data) {
			var logo = $("#logo").val();
			var logo2 = $("#businesslicense").val();
			if(logo =="" || logo == null || logo2 == "" || logo2 == null){
				layer.open({
					  type: 1
					  ,offset: 'auto' //具体配置参考：offset参数项
					  ,content: '<div style="padding: 20px 80px;">请上传logo和营业执照!</div>'
					  ,btn: '关闭'
					  ,btnAlign: 'c' //按钮居中
					  ,shade: 0 //不显示遮罩
					  ,yes: function(){
					    layer.closeAll();
					  }
				});
			}else{
				$.ajax({
					cache : true,
					type : "POST",
					url : "${rlzyPath}/company/saveCompany",
					data : $("#form").serialize(),
					success : function(data) {
						if (data != "") {
							layer.msg("注册信息填写成功!");
							$("#companyId").val(data);
							zczg();
							localStorage.removeItem("status");
						}
					}
				});
			}
			return false;
		});
	});

	$("#city").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
	//验证两次输入的密码是否一致
	$(function() {
		$("#psw_ag").blur(function() {
			if ($("#psw").val() != $("#psw_ag").val()) {
				layer.msg('两次输入的密码不一致');
			}
		})

	})
	$(function() {
		var bnav = $("#tail").outerHeight(true);
		var h = $(document).outerHeight(true);
		var topnav = $("#topbase").outerHeight(true);
		var topnav2 = $(".bar").outerHeight(true);
		$(".yuqbottom").css("height", h - topnav - bnav-topnav2); //这里改成你想要的高度就可以了~
	/* 	$("#tail").css("marginTop","140px"); //这里改成你想要的高度就可以了~ */
		$("#tail").insertAfter(".yuqbottom");

	});
</script>

<script type="text/javascript">
	//logo文件上传
	$('#certiimg').on('change', function() {
		var formData = new FormData();
		var file = document.getElementById("certiimg").files[0];
		
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
</script>
<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
<script type="text/javascript">
var $addressBox = document.getElementById('map');
//创建地图
var map = new AMap.Map("container", {
	mapStyle: 'amap://styles/fresh',
	resizeEnable: true,
	zooms: [3, 20],
	/*center: [116.397428, 39.90923],*/
	zoom: 10
});
var marker
//添加标注
function addMarker(point) {
	marker = new AMap.Marker({
		map: map,
		position: [point.getLng(), point.getLat()],
	});
}
var lnglat = [];
function geocoder() {
	map.clearMap();
	var myGeo = new AMap.Geocoder();
	//地理编码,返回地理编码结果
	myGeo.getLocation($addressBox.value, function(status, result) {
		if(status === 'complete' && result.info === 'OK') {
			//地址解析成功
			geocoder_CallBack(result);
		} else {
			alert("获取经纬度失败");
		}
	});
}
//地理编码返回结果展示
function geocoder_CallBack(data) {
	var geocode = data.geocodes;
	addMarker(geocode[0].location);
	map.setFitView();
	var lng = geocode[0].location.getLng();
	var lat = geocode[0].location.getLat();
	lnglat.push(lng);
	lnglat.push(lat);
	var n = lnglat.length;
	if(n > 2) {
		lnglat.splice(0, lnglat.length - 2);
	}
	AMap.plugin('AMap.Geocoder', function() {
		var geocoder = new AMap.Geocoder({
			// city 指定进行编码查询的城市，支持传入城市名、adcode 和 citycode
			city: '010'
		})
		geocoder.getAddress(lnglat, function(status, result) {
			if(status === 'complete' && result.info === 'OK') {
				// result为对应的地理位置详细信息
				var address = result.regeocode.formattedAddress; //返回地址描述
				console.log("地址:"+address);
				console.log("经纬度:"+lnglat);
				$("#lnglat").val(lnglat);
			}
			var infoWindow = new AMap.InfoWindow({
				offset: new AMap.Pixel(0, -20)
			});
		})
	})
}
</script>
</html>