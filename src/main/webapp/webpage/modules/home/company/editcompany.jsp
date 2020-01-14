<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>企业信息</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/qiyegongsiimg.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/companyinfo.css" />
		<style type="text/css">
			.layui-input{
			   border: none;
			   color: #666;
			}
	       .gname{
	       		border:0;
	       }
			.layui-unselect.layui-form-select {
				    display: none;
				}
		.layui-input-block.wenb.wenb2 {
				    margin-left: 54px;
				    width: 80%;
		}
		.layui-input-block.wenb.web3 {
		    width: 80%;
		    margin-left: 57px;
		}
			.layui-input-block.layui-input-inline.zijin {
		    margin-left: 3px;
		}
		.layui-input-block.wenb {
   			 margin-left: 121px;
   	
			}
			.syt .layui-input-block.wenb {
    		 width: 66.6%;
}
			.syt .layui-input-block {
			    width: 235px;
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
						<button  class="layui-btn layui-btn-sm acd" id="editd">修改</button>
					</div>
				<form:form modelAttribute="rlzyCooperation" action="" method="post" class="forminfo layui-form" enctype="multipart/form-data" id="form">
					
					<div class="tpone tpone">
						<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>企业名称：</label>
							<div class="layui-input-block gname">
								<input type="text"  id="name" title="${rlzyCooperation.companyname}" name="companyname" disabled value="${rlzyCooperation.companyname}" required
									lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>

						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>企业性质：</label>
							<div class="layui-input-block">
							<input type="text" disabled value="${fns:getDictLabel (rlzyCooperation.companynature, 'company_nature', defaultValue)}"lay-verify="required" autocomplete="off" class="layui-input  setselect">
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
							<input type="text" disabled value="${fns:getDictLabel (rlzyCooperation.companyscale, 'company_scale', defaultValue)}" required lay-verify="required" autocomplete="off" class="layui-input  setselect">
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
							<input type="text" disabled value="${fns:getDictLabel (rlzyCooperation.industry, 'desired_industry', defaultValue)}" required lay-verify="required" autocomplete="off" class="layui-input  setselect">
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
								<input type="text" id="city" name="localplace" value="${rlzyCooperation.localplace}"  required lay-verify="required" autocomplete="off" class="layui-input">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>信用代码：</label>
							<div class="layui-input-block">
								<input type="text" name="creditcode" value="${rlzyCooperation.creditcode}" disabled required
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
									<c:if test="${rlzyCooperation.logo == '' || rlzyCooperation.logo == null}">
									<img id="imghead" class="imglogo" border="0" src="${ctxStatic }/rlzy/img/sc.jpg" onclick="$('#previewImg').click();">
									</c:if>
									<c:if test="${rlzyCooperation.logo != '' && rlzyCooperation.logo != null}">
										<img id="imghead" class="imglogo" border="0" src="${rlzyCooperation.logo}" onclick="$('#previewImg').click();">
									</c:if>
								</div>
								<input type="file" disabled onchange="previewImage(this)" style="display: none;" id="previewImg" class="layui-input">
								<input type="text" value="${rlzyCooperation.logo}" name="logo" hidden="hidden" id="logo">
							</div>
						</div>
						<div class="layui-form-item big-photo">
							<label class="layui-form-label"><span class="sign">*</span>营业执照：</label>
							<div class="layui-input-block">
								<div id="preview2">
									<c:if test="${rlzyCooperation.businesslicense == '' || rlzyCooperation.businesslicense == null}">
										<img id="imghead2" class="imglogo" border="0" src="${ctxStatic }/rlzy/img/sc.jpg" onclick="$('#previewImg2').click();">
									</c:if>
									<c:if test="${rlzyCooperation.businesslicense != '' && rlzyCooperation.businesslicense != null}">
										<img id="imghead2" class="imglogo" border="0" src="${rlzyCooperation.businesslicense}" onclick="$('#previewImg2').click();">
									</c:if>
								</div>
								<input type="file" disabled onchange="previewImage2(this)" style="display: none;" id="previewImg2" class="layui-input">
								<input type="text" value="${rlzyCooperation.businesslicense}" name="businesslicense" hidden="hidden" id="businesslicense">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">注册资金：</label>
							<div class="layui-input-block layui-input-inline zijin">
								<input type="text" name="registeredcapital" value="${rlzyCooperation.registeredcapital}" disabledplaceholder="请输入注册资金" autocomplete="off" class="layui-input">
							</div>
							  <div class="layui-form-mid layui-word-aux">万</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">企业网址：</label>
							<div class="layui-input-block">
								<input type="text" id="wzhi" title="${rlzyCooperation.companywebsite}" name="companywebsite" value="${rlzyCooperation.companywebsite}" disabled placeholder="请输入企业网址"
									autocomplete="off" class="layui-input">
							</div>
						</div>

						</div>
                      <!--成功后回显到此div内部-->
					   <!--<div class="basc">
					   		<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>企业介绍:</label>
						</div>
							<div class="layui-input-block wenb wenb2 webs">
								<textarea  name="tablemsg" id="123d" disabled value="" placeholder="" class="layui-textarea layui-input textarea"  onKeyUp="Huitextarealength(this)"></textarea>
							<p class="textarea-numberbar"><em class="textarea-length">0</em>/<am>1000</am></p>
							</div>
					   </div>-->
                    
					</div>
					<div class="biaot">
						<span class="name1">联系方式&emsp;</span>
						<span class="name2"></span>
					</div>
					<div class="syt tpone ">
						 <div class="divs">
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系人：</label>
						<div class="layui-input-block">
							<input type="text" disabled name="contacts" value="${rlzyCooperation.contacts}" required
								lay-verify="required" placeholder="请输入联系人姓名" autocomplete="off"
								class="layui-input">
						</div>
					</div>
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系电话：</label>
						<div class="layui-input-block">
							<input type="text" name="telephone" disabled value="${rlzyCooperation.telephone}"
								required lay-verify="required" placeholder="请输入联系电话"
								autocomplete="off" class="layui-input">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系邮箱：</label>
						<div class="layui-input-block">
							<input type="email" name="email" value="${rlzyCooperation.email}" disabled value="147528@qq.com"
								required lay-verify="required" placeholder="请输入联系邮箱"
								autocomplete="off" class="layui-input">
						</div>
					</div>
  				</div>
  				 <div class="divs">
					<div class="layui-form-item">
						<label class="layui-form-label">QQ：</label>
						<div class="layui-input-block">
							<input type="text" name="qq" disabled value="${rlzyCooperation.qq}"
								disabled autocomplete="off" class="layui-input">
						</div>
					</div>

					<div class="layui-form-item">
						<label class="layui-form-label">微信：</label>
						<div class="layui-input-block">
							<input type="text" name="webchat" disabled value="${rlzyCooperation.webchat}"
								autocomplete="off" class="layui-input">
							</div>
						</div>

						</div>
						
					<div class="layui-form-item">
						<label class="layui-form-label"><span class="sign">*</span>联系地址：</label>
						<div class="layui-input-block wenb webp">
							<input id="map" type="text" name="address" value="${rlzyCooperation.address}" disabled
								required lay-verify="required" placeholder="请输入联系地址"
								autocomplete="off" class="layui-input" >
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
					<div class="tpone service">
					<div class="layui-form-item layui-form-text">
						<div class="layui-input-block wenb web3">
							<textarea id="123d" name="companyprofile" disabled  maxlength="1000"
								class="layui-textarea layui-input textarea" onKeyUp="Huitextarealength(this)">${rlzyCooperation.companyprofile}</textarea>
							<p class="textarea-numberbar"><em class="textarea-length">0</em>/<am>1000</am></p>
						</div>
					</div>
				</div>
				</div>
					<div class="cys" style="display: none;">
						<button class="layui-btn btn"  type="text" lay-filter="formDemo" lay-submit>提交审核</button>
					</div>
				</form:form>

			</div>

		</div>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/Popt.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/cityJson.js"></script>
		<script src="${ctxStatic }/rlzy/js/common/citySet/citySet.js"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/logophoto.js"></script>
		<script type="text/javascript" src="${ctxStatic }/rlzy/js/yyphoto.js"></script>
        <script type="text/javascript" src="${ctxStatic }/rlzy/js/companyinfo1.js" ></script>
	</body>

</html>
<script type="text/javascript">
/* 	layui.use('form', function() {
		var form = layui.form;

		//监听提交
		form.on('submit(formDemo)', function(data) {
			return false;
		});
	}); */
	
	
	
	function  nametitle(){
		var val = $('#name').val();
		$('#name').attr('title',val);
		var val2 = $('wzhi').val();
		$('#wzhi').attr('wzhi',val);
		var val3 = $('#name').val();
		$('#dizhi').attr('dizhi',val);
	}
	//文本框高度自适应问题
  $(function(){
 heightone();
})
function heightone(){
$('textarea').each(function () {
     this.setAttribute('style', 'height:' + (this.scrollHeight) + 'px;overflow-y:hidden;');
  }).on('input', function () {
  this.style.height = 'auto';
  this.style.height = (this.scrollHeight) + 'px';
  })
}
</script>

<script type="text/javascript">
var url = "${rlzyPath}";
var id = "${rlzyCooperation.id}";
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
	
</script>