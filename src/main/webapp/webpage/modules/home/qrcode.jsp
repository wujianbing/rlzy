<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<title>QRCODE</title>
		<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
		<script type="text/javascript" src="//cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
		<script type="text/javascript" src="//static.runoob.com/assets/qrcode/qrcode.min.js"></script>
	</head>
	<body>	
	<input id="text" type="text" value="" style="width:80%" /><br />
	<div id="qrcode" style="width:100px; height:100px; margin-top:15px;"></div>
	<div id="qrcode"></div>
	</body>
	<script type="text/javascript">
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				width : 100,
				height : 100
				});
			
			function makeCode () {		
				var elText = document.getElementById("text");
				
				/* if (!elText.value) {
					alert("Input a text");
					elText.focus();
					return;
				} */
				
				qrcode.makeCode(elText.value);
			}
			
			makeCode();
			
			$("#text").
				on("blur", function () {
					makeCode();
				}).
				on("keydown", function (e) {
					if (e.keyCode == 13) {
						makeCode();
					}
				});
</script>
</html>
