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
<title>企业信息</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/qiyegongsiimg.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/companyinfo.css" />
<!--富文本引用******************************************************************************  -->
<link rel="stylesheet" type="text/css" href="${ctxStatic }/rlzy/styles/simditor.css" />
<script src="${ctxStatic }/rlzy/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/scripts/module.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/scripts/hotkeys.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/scripts/simditor.min.js"></script>
<!--*************************************************************************************  -->
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/main1119.css" />
<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.3&key=0250860ccb5953fa5d655e8acf40ebb7&plugin=AMap.Geocoder"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/addToolbar.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/main2.js"></script>
<style type="text/css">
.layui-input {
	border: none;
	color: #666;
}
/*.editinput{
				
			}*/
.gname {
	border: 0;
}

.layui-unselect.layui-form-select {
	display: none;
}

.layui-upload img{
	width:150px;
}
.layui-input-block.wenb.wenb2 {
    margin-left: 54px;
    width: 80%;
}
.layui-input-block.wenb.web3 {
    width: 84.5%;
    margin-left:12px;
}
.biaot {
    margin: 1rem 0;
}
.layui-textarea {
    min-height: 100px;
    height: auto;
    line-height: 20px;
    padding: 5px 1px;
    resize: vertical;
}
.layui-input-block.wenb.webp {
    margin-left: 123px;
        width: 66.5%;
}
/******************富文本css************************  */
/* 选择有序列表的样式 */
.simditor-body ol li {
    list-style: decimal;
        color: #666;
        font-size:16px;
}
/* 选择无序列表的样式 */
.simditor-body ul li {
    list-style: disc;
    color: #666;
    font-size:16px;
}
/* 输入框的文本样式 */
.simditor-body p{
  color: #666!important;
    font-size:16px;
}
/* 文本输入框的宽度 */
.layui-input-block.laytextarea {
    width: 632px;
}
/* 文本工具栏 */
.simditor .simditor-toolbar {
    border-bottom: 1px solid #e6e6e6;
    background: #ffffff;
    width: 100%;
}
/*文本输入框的边框线条  */
.simditor {
    position: relative;
    border: 1px solid #e6e6e6;
}
/******************************************  */
.layui-form-item .layui-input-inline.zijin {
    float: left;
    min-width: 40px;
    max-width:134px;
    margin-right: 10px;
    margin-left: 2px;
}

.layui-form-mid {
    font-size: 16px;
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
			
			<form:form modelAttribute="rlzyCompany" action="" method="post" class="forminfo layui-form" enctype="multipart/form-data" id="form">

				<div class="tpone tpone">
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>企业名称：</label>
							<div class="layui-input-block gname">
								<input type="text"  id="name" title="${rlzyCompany.companyname}" name="companyname" disabled value="${rlzyCompany.companyname}" required
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>企业性质：</label>
							<div class="layui-input-block">
							<input type="text" disabled value="${fns:getDictLabel (rlzyCompany.companynature, 'company_nature', defaultValue)}"lay-verify="required" autocomplete="off" class="layui-input  setselect">
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
							<input type="text" disabled value="${fns:getDictLabel (rlzyCompany.companyscale, 'company_scale', defaultValue)}" required lay-verify="required" autocomplete="off" class="layui-input  setselect">
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
							<input type="text" disabled value="${fns:getDictLabel (rlzyCompany.industry, 'desired_industry', defaultValue)}" required lay-verify="required" autocomplete="off" class="layui-input  setselect">
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
								<input type="text" id="city" name="localplace" value="${rlzyCompany.localplace}"  required lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>信用代码：</label>
							<div class="layui-input-block">
								<input type="text" name="creditcode" value="${rlzyCompany.creditcode}" disabled required
									lay-verify="required" placeholder="请输入社会统一信用代码"
									autocomplete="off" class="layui-input">
							</div>
						</div>
						<c:if test="${rlzyCompany.companytype == '2'}">
							<div class="layui-form-item">
								<label class="layui-form-label"><span class="sign">*</span>服务类型：</label>
								<div class="layui-input-block">
								<input type="text" disabled value="${fns:getDictLabel (rlzyCompany.serviceType, 'service_type', defaultValue)}" autocomplete="off" class="layui-input  setselect">
									<form:select class="form-control" path="serviceType" name="serviceType">
										<form:option value="" label="" />
										<form:options items="${fns:getDictList('service_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
									</form:select>
								</div>
							</div>
						</c:if>
					</div>
					<div id="divs" class="divs">
						<div class="layui-form-item big-photo">
							<label class="layui-form-label"><span class="sign">*</span>企业logo：</label>
							<div class="layui-input-block">
								<div id="preview">
									<c:if test="${rlzyCompany.logo == '' || rlzyCompany.logo == null}">
									<img id="imghead" class="imglogo" border="0" src="${ctxStatic }/rlzy/img/sc.jpg" onclick="$('#previewImg').click();">
									</c:if>
									<c:if test="${rlzyCompany.logo != '' && rlzyCompany.logo != null}">
										<img id="imghead" class="imglogo" border="0" src="${rlzyCompany.logo}" onclick="$('#previewImg').click();">
									</c:if>
								</div>
								<input type="file" disabled onchange="previewImage(this)" style="display: none;" id="previewImg" class="layui-input">
								<input type="text" value="${rlzyCompany.logo}" name="logo" hidden="hidden" id="logo">
							</div>
						</div>
						<div class="layui-form-item big-photo">
							<label class="layui-form-label"><span class="sign">*</span>营业执照：</label>
							<div class="layui-input-block">
								<div id="preview2">
									<c:if test="${rlzyCompany.businesslicense == '' || rlzyCompany.businesslicense == null}">
										<img id="imghead2" class="imglogo" border="0" src="${ctxStatic }/rlzy/img/sc.jpg" onclick="$('#previewImg2').click();">
									</c:if>
									<c:if test="${rlzyCompany.businesslicense != '' && rlzyCompany.businesslicense != null}">
										<img id="imghead2" class="imglogo" border="0" src="${rlzyCompany.businesslicense}" onclick="$('#previewImg2').click();">
									</c:if>
								</div>
								<input type="file" disabled onchange="previewImage2(this)" style="display: none;" id="previewImg2" class="layui-input">
								<input type="text" value="${rlzyCompany.businesslicense}" name="businesslicense" hidden="hidden" id="businesslicense">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">注册资金：</label>
							<div class="layui-input-block layui-input-inline zijin">
								<input type="text" name="registeredcapital" value="${rlzyCompany.registeredcapital}" disabled
									placeholder="请输入注册资金" autocomplete="off" class="layui-input">
							</div>
							  <div class="layui-form-mid layui-word-aux">万</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">企业网址：</label>
							<div class="layui-input-block">
								<input type="text" id="wzhi" title="${rlzyCompany.companywebsite}" name="companywebsite" value="${rlzyCompany.companywebsite}" disabled placeholder="请输入企业网址"
									autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
				</div>
				
				<div class="biaot">
					<span class="name1">联系方式&emsp;</span> <span class="name2"></span>
				</div>
				<div class="syt tpone">
				<div class="divs">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系人：</label>
						<div class="layui-input-block">
							<input type="text" disabled name="contacts" value="${rlzyCompany.contacts}" required
								lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系电话：</label>
						<div class="layui-input-block">
							<input type="text" name="telephone" disabled value="${rlzyCompany.telephone}"
								required lay-verify="required" placeholder="请输入联系电话"
								autocomplete="off" class="layui-input">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系邮箱：</label>
						<div class="layui-input-block">
							<input type="email" name="email" value="${rlzyCompany.email}" disabled value="147528@qq.com"
								required lay-verify="required" placeholder="请输入联系邮箱"
								autocomplete="off" class="layui-input">
						</div>
					</div>
				</div>
					
					<div class="divs">
					   <div class="layui-form-item">
							<label class="layui-form-label">座机：</label>
							<div class="layui-input-block">
								<input type="text" name="phone" placeholder="请输入座机号码" disabled value="${rlzyCompany.phone}"
									disabled autocomplete="off" class="layui-input">
							</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label">QQ：</label>
						<div class="layui-input-block">
							<input type="text" name="qq" disabled value="${rlzyCompany.qq}"
								disabled autocomplete="off" class="layui-input">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">微信：</label>
						<div class="layui-input-block">
							<input type="text" name="webchat" disabled value="${rlzyCompany.webchat}"
								autocomplete="off" class="layui-input">
							</div>
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系地址：</label>
						<div class="layui-input-block wenb webp">
							<input id="map" type="text" name="address" value="${rlzyCompany.address}" disabled
								required lay-verify="required" placeholder="请输入联系地址"
								autocomplete="off" class="layui-input" onblur="geocoder();">
						</div>
						
						<!-- 地图相关模块 -->
						<input id="lnglat" name="lnglat" type="text" value="${rlzyCompany.lnglat}" hidden="hidden">
						<div id="container" style="display: none;"></div>
						<div id="panel" style="display: none;"></div>
						
					</div>
				</div>
				<div class="biaot">
					<span class="name1">账号信息&emsp;</span> <span class="name2"></span>
				</div>
				<div class="syt tpone">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>昵称：</label>
						<div class="layui-input-block">
							<input type="text" name="nickName" value="${rlzyCompany.nickName}" disabled required
								lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off"
								class="layui-input">
						</div>
					</div>
				</div>
				
				<div class="biaot">
					<span class="name1">企业介绍&emsp;</span> <span class="name2"></span>
				</div>
				<div class="tpone service">
					<div class="layui-form-item layui-form-text">
						<div class="layui-input-block wenb web3">
							<textarea id="123d" name="companyprofile" disabled  maxlength="1000"
								class="layui-textarea layui-input textarea" onKeyUp="Huitextarealength(this)">${rlzyCompany.companyprofile}</textarea>
							<p class="textarea-numberbar"><em class="textarea-length">0</em>/<am>1000</am></p>
						</div>
					</div>
				</div>
				
				<c:if test="${rlzyCompany.companytype == '2'}">
				<div class="biaot">
					<span class="name1">服务范围&emsp;</span> <span class="name2"></span>
				</div>
				<div class="tpone service">
					<div class="layui-form-item layui-form-text">
						<div class="layui-input-block wenb web3 laytextarea" style="position: relative;">
							<textarea id="editor" name="servicerange" disabled="disabled"  maxlength="1000"
								class="layui-textarea layui-input textarea" autofocus>${rlzyCompany.servicerange}</textarea>
							<!-- <p class="textarea-numberbar"><em class="textarea-length">0</em>/<am>1000</am></p> -->
						</div>
					</div>
				</div>
				
				<div class="biaot">
					<span class="name1">案例图片&emsp;</span> <span class="name2"></span>
				</div>
				<div class="section">
					<div class="article">
					<c:if test="${rlzyCompany.casepic == '' || rlzyCompany.casepic == null}">
						<c:forEach items="${pic }" var="pic" varStatus="i">
						<div class="item">
							<img class="addImg" onclick="clickImg(this);" src="${ctxStatic }/rlzy/img/sc.jpg">						
							<input name="url" type="file" class="upload_input" onchange="change(this)">
							<input id="inp${i.index}" class="inp" value="" hidden="hidden" type="text">
							<div class="preBlock">
								<img class="preview" id="preview1" alt="" width="190" height="190" src="${ctxStatic }/rlzy/img/sc.jpg">
							</div>
							<img class="delete" onclick="deleteImg(this)" src="${ctxStatic }/rlzy/img/del.png">
						</div>
						</c:forEach>
						</c:if>
					<!-- 修改显示 -->
					<c:if test="${rlzyCompany != null && rlzyCompany.casepic != '' && rlzyCompany.casepic != null}">
						<c:forEach items="${pic }" var="pic" varStatus="i">
						<div class="item">
						<c:if test="${pic != null}">
							<img class="addImg" onclick="clickImg(this);" src="${pic}">						
						</c:if>
						<c:if test="${pic == null || pic == ''}">
							<img class="addImg" onclick="clickImg(this);" src="${ctxStatic }/rlzy/img/sc.jpg">						
						</c:if>
								<input name="url" type="file" class="upload_input" onchange="change(this)">
								<input id="inp${i.index}" class="inp" value="${pic}" hidden="hidden" type="text">
							<div class="preBlock">
								<img class="preview" id="preview1" alt="" width="190" height="190" src="${pic}">
							</div>
							<img class="delete" onclick="deleteImg(this)" src="${ctxStatic }/rlzy/img/del.png">
						</div>
						</c:forEach>
						</c:if>
						<div style="clear: left;"></div>
					</div>
				</div>
				<input id="inp" value="" hidden="hidden" type="text" name="casepic">
				</c:if>
				<div class="cys" style="display: none;">
					<button id="formDemo" class="layui-btn btn" type="text" lay-submit lay-filter="formDemo">提交审核</button>
				</div>
			</form:form>
		</div>

	</div>
	<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
	<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
	<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
	<script src="${ctxStatic }/rlzy/js/logophoto.js"></script>
	<script src="${ctxStatic }/rlzy/js/yyphoto.js"></script>
	<script src="${ctxStatic }/rlzy/js/companyinfo.js"></script>
</body>
<script type="text/javascript">
var url = "${rlzyPath}";
var id = "${rlzyCompany.id}";
	//logo文件上传
	$('#previewImg').on('change', function () {
		var formData = new FormData();
		var file = document.getElementById("previewImg").files[0];
		formData.append("file", file);
		$.ajax({
			type: 'POST',
			url: '${rlzyPath}/company/upload',
			data: formData,
			contentType: false,
			processData: false,
			async: true,
			success: function (result) {
				$("#logo").val(result);
				$("#imghead").attr("src",result);
				
			}
		});
	}); 
	
	//营业执照上传
	 $('#previewImg2').on('change', function () {
		var formData = new FormData();
		var file = document.getElementById("previewImg2").files[0];
		formData.append("file", file);
		$.ajax({
			type: 'POST',
			url: '${rlzyPath}/company/upload',
			data: formData,
			contentType: false,
			processData: false,
			async: true,
			success: function (result) {
				$("#businesslicense").val(result);
				$("#imghead2").attr("src",result);
				
			}
		});
	});
	
	//文本框高度自适应问题
	  $(function(){
	  $('textarea').each(function () {
	     this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
	  }).on('input', function () {
	  this.style.height = 'auto';
	  this.style.height = (this.scrollHeight) + 'px';
	  })
	})
	
	/*富文本编辑器js*********************************  */
	var editor = new Simditor({
	toolbar: ['fontScale','|', 'ol', '|','ul'],
	textarea: '#editor',
    placeholder: '写点什么...',
    cleanPaste: true
	});
	/*富文本编辑器js*********************************  */
</script>
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
