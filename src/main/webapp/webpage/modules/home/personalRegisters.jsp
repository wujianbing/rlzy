<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html lang="zh-CN">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>吴忠人力资源首页</title>
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/iconfont.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/RegisteredOne.css" />
<style type="text/css">
.asp {
		    margin-top: 3rem;
		}
		#yzm {
		    display: inline-block;
		    width: 7rem;
		    margin-left: 2rem;
		    text-align: center;
		    height: 40px;
		    line-height: 40px;
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
}
.m3{
	cursor: pointer;
	    color: #4b96cf;
}

.rowTop {
    align-items: center;
}
.titleTop {
    padding: 14px 0;
    background: #fff;
}
.regnum {
    display:block;
    align-items: center;
    justify-content: center;
    width: 446px;
    border-radius: 4px;
    height: 425px;
    margin: 0 auto;
    margin-top: 10px;
    /* background: #D6E9C6; */
    /* box-shadow: 10px 10px 20px 10px rgba(255,255,0,0.5), -10px 10px 10px 10px rgba(255,255,255,0.5); */
}
.formname input {
    width: 19rem;
    height: 42px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 8px;
    text-indent: 2rem;
    outline: none;
}
#yzcode {
    width: 10rem!important;
    font-size: 16px;
    /* cursor: pointer; */
}
#yzm {
    display: inline-block;
    width: 7rem;
    margin-left: 2rem;
    text-align: center;
    height: 40px;
    line-height: 40px;
    border-radius: 5px;
    color: #4b96cf;
    font-weight: normal;
    border: 1px solid #4b96cf;
    font-size: 14px;
    cursor: pointer;
}
.ljzc {
    height: 40px;
    width: 8rem!important;
    line-height: 40px;
    margin-top: 2rem;
    margin-left: 0rem!important;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 8px;
    outline: none;
    background: #4b96cf;
    border: 1px solid #4b96cf;
    outline: none;
    color: #fff;
    margin-bottom: 1rem;
    cursor: pointer;
}
.yuqbottom {

    padding: 27px 0;
    min-height: 0;

}
</style>

</head>

<body>
	<!--首页内容-->
	<div class="humanbox">
		<!--个人信息注册部分-->
		<div class="yuqbottom">
			<!--里面注册部分-->
			<div class="asp">
				<h5>个人注册流程</h5>
				<!--流程数字显示-->
				<div class="processReg">
					<span class="ringnum activeRing">1</span>
					<!--线条-->
					<span class="lineSpan"></span> <span class="ringnum ring2">2</span>
					<span class="lineSpan"></span> <span class="ringnum ring3">3</span>
				</div>
				<!--中间的注册第一 步:输入手机号，验证验证码-->
				<div class="regnum">
					<form action="" method="post">
						<p class="formname">
							<span class="leftnum">手机号：</span><input type="text" id="num"
								value="" onblur="checkPhone()" maxlength="11"
								placeholder="" />
						</p>
						<p class="formname">
							<span class="leftnum">验证码：</span><input type="text"
								placeholder="" maxlength="4" id="yzcode" /><label
								id="yzm" onclick="count()">获取验证码</label>
						</p>
					</form>
					<p class="btnone">
						<input id="sign" type="button" class="ljzc" value="立即注册"
							onclick="phonenum()" />
					</p>
					<p class="worduser2">
						点击立即注册即表示您同意<a target="_blank" href="${rlzyPath}/user/agreement"  class='m3'>《用户使用协议》</a>
					</p>
				</div>

				<!--中间的注册第二步:填写个人信息-->
				<div class="regnum2" style="display: none;">
					<form:form modelAttribute="rlzyUser" action="" method="post"
						class="forminfo layui-form" id="form">
						<div class="biaot">
							<span class="name1">基本信息&emsp;</span> <span class="name2"></span>
						</div>
						<div class="topone">
							<div class="toplef">
								<!--姓名输入框-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>姓名：</label>
									<div class="layui-input-block">
										<input type="text" name="name" required lay-verify="required"
											placeholder="请输入姓名" autocomplete="off" class="layui-input">
									</div>
								</div>
								<!--时间选择框-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>出生年月：</label>
									<div class="layui-input-block" style="cursor: pointer">
										<input type="text" name="birthday" required
											lay-verify="required" placeholder="请输入出生年月"
											autocomplete="off" class="layui-input" id="test1">
									</div>
								</div>

								<!--学历选择框-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>学历选择：</label>
									<div class="layui-input-block" style="cursor: pointer">
										<form:select class="form-control" path="education"
											name="education">
											<form:option value="" label="" />
											<form:options items="${fns:getDictList('education')}"
												itemLabel="label" itemValue="value" htmlEscape="false" />
										</form:select>
									</div>
								</div>

								<!--手机号-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>手机号：</label>
									<div class="layui-input-block">
										<input id="zd" type="text" name="phone" required
											lay-verify="required" readonly="readonly" autocomplete="off"
											class="layui-input">
									</div>
								</div>
							</div>
							<div class="toplef">
								<!--性别选择-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>性别：</label>
									<div class="layui-input-block">
										<input type="radio" name="sex" value="1" title="男"> <input
											type="radio" name="sex" value="2" title="女" checked>
									</div>
								</div>

								<!--时间选择框-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>所在地区：</label>
									<div class="layui-input-block" style="cursor: pointer">
										<input type="text" name="liveplace" style="cursor: pointer"
											required lay-verify="required" placeholder="请选择所在地区"
											autocomplete="off" class="layui-input" id="city">
									</div>
								</div>

								<!--年龄-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>工作年限：</label>
									<div class="layui-input-block">
										<form:select class="form-control" path="workingage"
											name="workingage">
											<form:option value="" label="" />
											<form:options items="${fns:getDictList('working_age')}"
												itemLabel="label" itemValue="value" htmlEscape="false" />
										</form:select>
									</div>
								</div>
							</div>
						</div>
						<div class="biaot">
							<span class="name1">求职意向&emsp;</span> <span class="name2"></span>
						</div>
						<div class="topone">
							<div class="toplef">

								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>目前状态：</label>
									<div class="layui-input-block">
										<form:select class="form-control" path="currentstate"
											name="currentstate">
											<form:option value="" label="" />
											<form:options items="${fns:getDictList('current_state')}"
												itemLabel="label" itemValue="value" htmlEscape="false" />
										</form:select>
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>期望行业：</label>
									<div class="layui-input-block">
										<form:select class="form-control" path="desiredindustry"
											name="desiredindustry">
											<form:option value="" label="" />
											<form:options items="${fns:getDictList('desired_industry')}"
												itemLabel="label" itemValue="value" htmlEscape="false" />
										</form:select>
									</div>
								</div>

								<!--工作选择框-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>工作地区：</label>
									<div class="layui-input-block">
										<input type="text" name="workplace" required
											lay-verify="required" placeholder="请选择工作地区"
											autocomplete="off" class="layui-input" id="city2">
									</div>
								</div>

							</div>
							<div class="toplef">
								<!--工作性质-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>工作性质：</label>
									<div class="layui-input-block">
										<input type="radio" name="worknature" value="2" title="兼职">
										<input type="radio" name="worknature" value="1" title="全职"
											checked> <input type="radio" name="worknature"
											value="3" title="实习">
									</div>
								</div>

								<!--期望职业-->
								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>期望职业：</label>
									<div class="layui-input-block">
										<input type="text" name="desiredposition" required
											lay-verify="required" placeholder="请选择期望职业"
											autocomplete="off" class="layui-input" id="workchange">
									</div>
								</div>

								<div class="layui-form-item">
									<label class="layui-form-label"><span class="sign">*</span>期望薪资：</label>
									<div class="layui-input-block">
										<form:select path="salary" class="form-control" name="salary">
											<form:option value="" label="" />
											<form:options items="${fns:getDictList('salary')}"
												itemLabel="label" itemValue="value" htmlEscape="false" />
										</form:select>
									</div>
								</div>

							</div>
						</div>

						<div class="biaot">
							<span class="name1">账号信息&emsp;</span> <span class="name2"></span>
						</div>
						<div class="topwe">
							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>昵称：</label>
								<div class="layui-input-block">
									<input type="text" name="nickName" required
										lay-verify="required" placeholder="请输入用户名" autocomplete="off"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>设置密码：</label>
								<div class="layui-input-block">
									<input type="password" id="psw2" name="password" required
										lay-verify="required" placeholder="请输入确认密码" autocomplete="off"
										class="layui-input">
								</div>
							</div>
							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>确认密码：</label>
								<div class="layui-input-block">
									<input type="password" id="psw_ag2" name="title" required
										lay-verify="required" placeholder="请输入确认密码" autocomplete="off"
										class="layui-input">
								</div>
							</div>
						</div>
						<div class="layui-form-item rowtj">
							<div class="layui-input-block">
								<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
							</div>
						</div>
					</form:form>

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
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->

<%-- 	<div class="m-modal">
		<div class="m-modal-dialog">
			<div class="m-top">
				<h4 class="m-modal-title"></h4>
				<span class="m-modal-close">&times;</span>
			</div>
			<!--模态框的简历基本信息-->
			<div class="m-middle">${fns:unescapeHtml(news.content)}</div>

		</div>
	</div> --%>
</body>
</html>
<script type="text/javascript"
	src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>
<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script src="${ctxStatic }/rlzy/js/Popt.js"></script>
<script src="${ctxStatic }/rlzy/js/cityJson.js"></script>
<script src="${ctxStatic }/rlzy/js/citySet.js"></script>
<script src="${ctxStatic }/rlzy/js/jobtier.js"></script>
<script src="${ctxStatic }/rlzy/js/workset.js"></script>
<script type="text/javascript">
	var bools = true;
	$("#workchange").click(function(e) {
		selwork(this, e);
		console.log("inout", $(this).val(), new Date())
	});

	/* 手机号验证 */
	function checkPhone() {
		var _phone = document.getElementById("num").value; //获取手机号 
		if (!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test(_phone))) {
			layer.msg('您的手机号不正确，请重新输入！');
			return false;
		}
		//验证手机号是否已注册 TODO
		$.ajax({
			type : "POST",
			url : "${rlzyPath}/home/check",
			data : {
				"phone" : _phone
			},
			success : function(data) {
				if (data == "2") {
					layer.msg('该手机号已经注册过，请登录！');
					bools = false;
					return false;
				} else {
					bools = true;
				}
			}

		});
	};
	/* 短信验证码到倒计时 */
	var bool = true;
	function count() {
		var phone = document.getElementById("num").value; //获取手机号
		if (!bools) {
			layer.msg('该手机号已经注册过，请登录！');
			return false;
		}
		//验证码获取 TODO
		$.get("${rlzyPath}/home/sendSms?phone=" + phone);
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

	};
	//点击出现用户协议

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
		;
		//获取验证码
		var code = document.getElementById("yzcode").value;
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
				}
			}
		});
	};

	//填写详细信息页面毕点击提交后出现页面的函数
	function zczg() {
		localStorage.setItem("status", "2");
		$('.regnum').css("display", "none");
		$('.regnum2').css("display", "none");
		$('.regnum3').css("display", "block");
		$('.ringnum').addClass('activeRing').siblings().removeClass(
				'activeRing');
		$('.ring3').addClass('activeRing');
		Load();
	}

	var secs = 3; //倒计时的秒数 
	var URL = '${rlzyPath}/home/index';
	function Load() {
		for (var i = secs; i >= 0; i--) {
			window.setTimeout('doUpdate(' + i + ')', (secs - i) * 1000);
		}
	}
	function doUpdate(num) {
		document.getElementById('p2').innerHTML = '将在' + num + '秒后自动跳转到主页';
		if (num == 0) {
			window.location = URL;
		}
	}

	$("#city").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
	$("#city2").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
	layui.use('laydate', function() {
		var laydate = layui.laydate;

		//执行一个laydate实例
		laydate.render({
			elem : '#test1' //指定元素
		});
	});

	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(formDemo)', function(data) {
			//提交注册信息
			var phone = document.getElementById("num").value; //获取手机号
			$.ajax({
				cache : true,
				type : "POST",
				url : "${rlzyPath}/user/saveUser",
				data : $("#form").serialize(),
				success : function(data) {
					if ("1" == data) {
						layer.msg("注册信息填写成功!");
						zczg();
						localStorage.removeItem("status");
					}
				}
			});
			return false;
		});
	});
	//验证两次输入的密码是否一致
	$(function() {
		$("#psw_ag2").blur(function() {
			if ($("#psw2").val() != $("#psw_ag2").val()) {
				layer.msg('两次输入的密码不一致');
			}
		})
	})
	
	$(function(){
		  var bnav=$("#tail").outerHeight(true) ;                                                      
		  var h=$(document).outerHeight(true) ; 
		   var topnav=$("#nav").outerHeight(true) ;  
	    $(".yuqbottom").css("height",h-topnav-bnav-238); //这里改成你想要的高度就可以了~
	    
	});

</script>
<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>