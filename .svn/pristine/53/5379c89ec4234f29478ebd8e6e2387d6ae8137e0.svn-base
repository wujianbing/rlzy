<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>吴忠人力支付方式</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/payway.css" />
<title></title>
</head>
<body onload="Load()">
	<div class="box">
		<!--支付图标-->
		<div class="zhifu">
			<div class="lrf">
				<img src="${ctxStatic }/rlzy/img/logo.png" />
			</div>
			<div class="rightp">我的收银台</div>
		</div>
		<!--支付提示-->
		<div class="tisway">
			正在使用即时到账交易，支付交易将在<span class="time" id="p2">1000</span>s后关闭，请及时支付！
		</div>
		<div class="tisway" style="margin-bottom: 20px;">
			收款方：<span class="payname">吴忠市人力资源服务产业园</span>
		</div>
		<div class="paycode">
			<div class="paynamew">
				<div class="pay1">扫一扫付款（元）</div>
				<div class="pay2">￥1000</div>
				<div class="pay3">
					<input id="text" hidden="hidden" type="text" value="${code_url}" style="width:80%" /><br />
					<div id="qrcode" style="width:100px; height:100px; margin-top:15px;"></div>
				</div>
			</div>

		</div>

	</div>


</body>

<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script type="text/javascript" src="//static.runoob.com/assets/qrcode/qrcode.min.js"></script>
<script type="text/javascript">
	var secs = 1000; //倒计时的秒数 
	var URL = '#';
	function Load() {
		for (var i = secs; i >= 0; i--) {
			window.setTimeout('doUpdate(' + i + ')', (secs - i) * 1000);
		}
	}
	function doUpdate(num) {
		document.getElementById('p2').innerHTML = num ;
		if (num == 0) {
			window.location = URL;
		}
	}
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				width : 100,
				height : 100
				});
			
			function makeCode () {
				var elText = document.getElementById("text");
				qrcode.makeCode(elText.value);
			}
			
			makeCode();
</script>
<script type="text/javascript">
	$().ready(function(){
		var interval = setInterval(function() {
							$.get("/rlzy/pay/affrimPay?companyId="+${companyId},function(req){
								if(res == '1'){
									window.location.href="/rlzy/pay/paysuccess"
								}else{
									return;
								}
							});
						}, 1000);
	});
</script>
</html>