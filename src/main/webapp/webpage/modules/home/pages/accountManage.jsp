<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<title>账号管理</title>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/iconfont.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/accountInformation.css" />
	</head>

	<body>
		<div class="jlpage">
			<div class="infoname">
				<h5>		<span class="name1">账号信息&emsp;</span>
							<span class="name2"></span>
				</h5>
				<!--表格数据-->
			
				<div class="row layui-form">
					<div class="layui-form-item">
						<label class="layui-form-label">手机号码：</label>
						<div class="layui-input-inline">
							<input id="oldphone" type="text" value="${rlzyUser.phone}" disabled="disabled" autocomplete="off" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux UntyinPhone">解绑手机</div>
					</div>
					<div class="box2 layui-form"   id="sign_v" style="display:none;">
					        <div class="layui-form-item">
							<label class="layui-form-label">新手机号码：</label>
							<div class="layui-input-inline" style="width: 190px;">
								<input type="text" id="phone" value="" required autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux qxjb" onclick="qyxjibang()">取消解绑</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">验证码：</label>
							<div class="layui-input-inline" style="width: 82px;">
								<input id="yzcode2" type="text" autocomplete="off" value="" required class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux checkcode"  id="yzm_bnt" onclick="count('#yzm_bnt')">获取验证码</div>
						</div>
						 <div class="layui-form-item">
						    <div class="layui-input-block" style="margin-left: 187px;">
						    <input type="text" hidden="hidden" value="${rlzyUser.id}"  id="inp2">
						      <div class="layui-btn" id="t2">提交</div>
						    </div>
						  </div>
					        </div>
			
					<div class="layui-form-item">
						<label class="layui-form-label">用户名：</label>
						<div class="layui-input-inline">
							<input type="text" autocomplete="off" style="background: #b0afb9;;" value="${rlzyUser.name}" disabled="disabled" class="layui-input">
						</div>
						<div class="layui-form-mid layui-word-aux ChangePassword" onclick="xgma()">修改密码</div>
					</div>
							<div class="box3" style="display: none;" >
					          	  <div class="layui-form-item">
							<label class="layui-form-label">旧密码：</label>
							<div class="layui-input-inline" style="width: 190px;">
								<input type="password" value="${rlzyUser.password}" disabled="disabled"  autocomplete="off" class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux qxma" onclick="qxma()">取消密码修改</div>
						</div>
					        <div class="layui-form-item">
							<label class="layui-form-label">新密码：</label>
							<div class="layui-input-inline" style="width: 190px;">
								<input type="password" value="" id="psw"  required  lay-verify="required"   autocomplete="off" class="layui-input">
							</div>
						</div>
					        <div class="layui-form-item">
							<label class="layui-form-label">确认密码：</label>
							<div class="layui-input-inline" style="width: 190px;">
								<input type="password" value=""  id="psw_ag"   autocomplete="off" class="layui-input">
							</div>
						</div>
						 <div class="layui-form-item">
						    <div class="layui-input-block" style="margin-left: 187px;">
						    	<input type="text" hidden="hidden" value="${rlzyUser.id}"  id="inp">
						        <div class="layui-btn" id="t1">提交</div>
						    </div>
						  </div>
					 </div>
				</div>
			</div>
			</div>
		<div class="m-modal">
				<div class="m-modal-dialog">
					<div class="m-top">
						<h4 class="m-modal-title"></h4>
						<span class="m-modal-close">&times;</span>
					</div>
					<!--模态框的简历基本信息-->
					<div class="m-middle">
					        <form class="box1 layui-form">
					        <div class="layui-form-item">
							<label class="layui-form-label">手机号码：</label>
							<div class="layui-input-inline" style="width: 202px;">
								<input type="text" id="newphone" value=""  disabled="disabled" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">验证码：</label>
							<div class="layui-input-inline" style="width: 100px;">
								<input  id="yzcode" type="text" required autocomplete="off" value=""  class="layui-input">
							</div>
							<div class="layui-form-mid layui-word-aux checkcode"   id="yzm2" onclick="count('#yzm2')">获取验证码</div>
						</div>
						 <div class="layui-form-item">
						    <div class="layui-input-block">
						      <div class="layui-btn" onclick="xgphone()">提交</div>
						    </div>
						  </div>
					   </form>
					</div>
				</div>
			</div>
</html>
<script>
var url = "${rlzyPath}";
</script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.my-modal.1.1.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/personalAccount.js" ></script>
