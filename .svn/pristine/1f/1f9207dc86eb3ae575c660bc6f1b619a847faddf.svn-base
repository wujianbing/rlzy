<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<title>企业信息管理</title>
<meta name="decorator" content="ani" />
<script type="text/javascript">

		$(document).ready(function() {
			jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("${ctx}/portal/rlzyCompany");
				}else{
				    jp.error(data.msg);
				    $("#inputForm").find("button:submit").button("reset");
				}
			});
			
		});
		
		function addRow(list, idx, tpl, row){
			$(list).append(Mustache.render(tpl, {
				idx: idx, delBtn: true, row: row
			}));
			$(list+idx).find("select").each(function(){
				$(this).val($(this).attr("data-value"));
			});
			$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
				var ss = $(this).attr("data-value").split(',');
				for (var i=0; i<ss.length; i++){
					if($(this).val() == ss[i]){
						$(this).attr("checked","checked");
					}
				}
			});
			$(list+idx).find(".form_datetime").each(function(){
				 $(this).datetimepicker({
					 format: "YYYY-MM-DD HH:mm:ss"
			    });
			});
		}
		function delRow(obj, prefix){
			var id = $(prefix+"_id");
			var delFlag = $(prefix+"_delFlag");
			if (id.val() == ""){
				$(obj).parent().parent().remove();
			}else if(delFlag.val() == "0"){
				delFlag.val("1");
				$(obj).html("&divide;").attr("title", "撤销删除");
				$(obj).parent().parent().addClass("error");
			}else if(delFlag.val() == "1"){
				delFlag.val("0");
				$(obj).html("&times;").attr("title", "删除");
				$(obj).parent().parent().removeClass("error");
			}
		}
	</script>
<style>
#inputForm .form-group {
	display: inline-block;
	width: 49%;
}

#inputForm .form-group .col-sm-10 {
	padding-right: 20px;
}

.sub-btn-v {
	text-align: center;
}
</style>
</head>
<body>
	<div class="wrapper wrapper-content">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">
							<a class="panelButton" href="${ctx}/portal/rlzyCompany"><i
								class="ti-angle-left"></i> 返回</a>
						</h3>
					</div>
					<div class="panel-body">
						<form:form id="inputForm" modelAttribute="rlzyCompany"
							action="${ctx}/portal/rlzyCompany/save" method="post"
							class="form-horizontal">
							<form:hidden path="id" />
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业名称：</label></td>
										<td class="width-15"><form:input path="companyname"
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">昵称：</label></td>
										<td class="width-15"><form:input path="nickName"
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">密码：</label></td>
										<td class="width-15"><form:input path="password"
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">企业logo：</label></td>
										<td class="width-15"><sys:fileUpload path="logo"
												value="${rlzyCompany.logo}" type="file"
												uploadPath="/company" /></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业规模：</label></td>
										<td class="width-15"><form:select class="form-control"
												path="companyscale">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('company_scale')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
										<td class="width-10 active"><label class="pull-right">企业性质：</label></td>
										<td class="width-15"><form:select path="companynature"
												class="form-control ">
												<form:option value="" label="请选择" />
												<form:options items="${fns:getDictList('company_nature')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
										<td class="width-10 active"><label class="pull-right">注册资金：</label></td>
										<td class="width-15"><form:input path="registeredcapital"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">所在地区：</label></td>
										<td class="width-15"><form:input path="localplace"
												htmlEscape="false" class="form-control " /></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">信用编码：</label></td>
										<td class="width-15"><form:input path="creditcode"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">所属行业：</label></td>
										<td class="width-15"><form:select path="industry"
												class="form-control ">
												<form:option value="" label="请选择" />
												<form:options items="${fns:getDictList('desired_industry')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
										<td class="width-10 active"><label class="pull-right">企业网址：</label></td>
										<td class="width-15 " colspan="3"><form:input
												path="companywebsite" htmlEscape="false"
												class="form-control " /></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">联系人：</label></td>
										<td class="width-15"><form:input path="contacts"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">联系电话：</label></td>
										<td class="width-15"><form:input path="telephone"
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">座机：</label></td>
										<td class="width-15"><form:input path="phone"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">邮箱：</label></td>
										<td class="width-15"><form:input path="email"
												htmlEscape="false" class="form-control " /></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业类型：</label></td>
										<td class="width-15"><form:select path="companytype"
												class="form-control ">
												<form:option value="" label="请选择" />
												<form:options items="${fns:getDictList('company_type')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
										<td class="width-10 active"><label class="pull-right">营业执照：</label></td>
										<td class="width-15"><sys:fileUpload path="businesslicense"
												value="${rlzyCompany.businesslicense}" type="file"
												uploadPath="/company/${rlzyCompany.telephone}" /></td>
										<td class="width-10 active"><label class="pull-right">联系地址：</label></td>
										<td class="width-15" colspan="3"><form:input
												path="address" htmlEscape="false" class="form-control " /></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">审核状态：</label></td>
										<td class="width-15"><form:select path="reviewstate"
												class="form-control">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('review_state')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
										<td class="width-10 active"><label class="pull-right">试用状态：</label></td>
										<td class="width-15"><form:select path="trystate"
												class="form-control">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('try_state')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
										<td class="width-10 active"><label class="pull-right">案例：</label></td>
										<td class="width-15"><sys:fileUpload path="casepic"
												value="${rlzyCompany.casepic}" type="file"
												uploadPath="/company/${rlzyCompany.telephone}" />
												</td>
										<td class="width-10 active"><label class="pull-right">支付状态：</label></td>
										<td class="width-15"><form:select path="paystatus"
												class="form-control">
												<form:option value="" label="" />
												<form:options items="${fns:getDictList('paystatus')}"
													itemLabel="label" itemValue="value" htmlEscape="false" />
											</form:select></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">服务范围：</label></td>
										<td class="width-15" colspan="7"><form:textarea
												path="servicerange" htmlEscape="false" class="form-control "
												style="height:200px" /></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业简介：</label></td>
										<td class="width-15" colspan="7"><form:textarea
												path="companyprofile" htmlEscape="false"
												class="form-control " style="height:200px" /></td>
									</tr>
								</tbody>
							</table>
							<div class="tabs-container">
								<ul class="nav nav-tabs">
									<li class="active"><a data-toggle="tab" href="#tab-1"
										aria-expanded="true">职位表：</a></li>
								</ul>
								<div class="tab-content">
									<div id="tab-1" class="tab-pane fade in  active">
										<!-- <a class="btn btn-white btn-sm"
											onclick="addRow('#rlzyPositionList', rlzyPositionRowIdx, rlzyPositionTpl);rlzyPositionRowIdx = rlzyPositionRowIdx + 1;"
											title="新增"><i class="fa fa-plus"></i> 新增</a> -->
										<table
											class="table table-striped table-bordered table-condensed">
											<thead>
												<tr>
													<th class="hide"></th>
													<th>工作性质</th>
													<th>职业名称</th>
													<th>薪资范围</th>
													<th>学历</th>
													<th>工作经验</th>
													<th width="70">招聘人数</th>
													<th>联系人</th>
													<th>联系电话</th>
													<th>是否急聘</th>
													<th>是否置顶</th>
													<th width="10">&nbsp;</th>
												</tr>
											</thead>
											<tbody id="rlzyPositionList">
											</tbody>
										</table>
										<script type="text/template" id="rlzyPositionTpl">//<!--
				<tr id="rlzyPositionList{{idx}}">
					<td class="hide">
						<input id="rlzyPositionList{{idx}}_id" name="rlzyPositionList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
						<input id="rlzyPositionList{{idx}}_delFlag" name="rlzyPositionList[{{idx}}].delFlag" type="hidden" value="0"/>
					</td>
					
					<td>
						<select id="rlzyPositionList{{idx}}_positiontype" name="rlzyPositionList[{{idx}}].positiontype" data-value="{{row.positiontype}}" class="form-control m-b">
							<option value=""></option>
							<c:forEach items="${fns:getDictList('work_nature')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</td>
					
					
					<td>
						<input id="rlzyPositionList{{idx}}_positionname" name="rlzyPositionList[{{idx}}].positionname" type="text" value="{{row.positionname}}"    class="form-control "/>
					</td>
					
					
					<td>
						<select id="rlzyPositionList{{idx}}_salaryrange" name="rlzyPositionList[{{idx}}].salaryrange" data-value="{{row.salaryrange}}" class="form-control m-b">
							<option value=""></option>
							<c:forEach items="${fns:getDictList('salary')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</td>
					
					
					<td>
						<select id="rlzyPositionList{{idx}}_education" name="rlzyPositionList[{{idx}}].education" data-value="{{row.education}}" class="form-control m-b">
							<option value=""></option>
							<c:forEach items="${fns:getDictList('education')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</td>
					
					
					<td>
						<select id="rlzyPositionList{{idx}}_workingage" name="rlzyPositionList[{{idx}}].workingage" data-value="{{row.workingage}}" class="form-control m-b">
							<option value=""></option>
							<c:forEach items="${fns:getDictList('working_age')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</td>
					
					
					<td width="70">
						<input id="rlzyPositionList{{idx}}_recruitnumber" name="rlzyPositionList[{{idx}}].recruitnumber" type="text" value="{{row.recruitnumber}}"    class="form-control "/>
					</td>
					
					<td>
						<input id="rlzyPositionList{{idx}}_contacts" name="rlzyPositionList[{{idx}}].contacts" type="text" value="{{row.contacts}}"    class="form-control "/>
					</td>
					
					<td>
						<input id="rlzyPositionList{{idx}}_phone" name="rlzyPositionList[{{idx}}].phone" type="text" value="{{row.phone}}"    class="form-control "/>
					</td>
					
					<td>
						<select id="rlzyPositionList{{idx}}_postflag" name="rlzyPositionList[{{idx}}].postflag" data-value="{{row.postflag}}" class="form-control m-b">
							<option value=""></option>
							<c:forEach items="${fns:getDictList('is_post')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<select id="rlzyPositionList{{idx}}_isTop" name="rlzyPositionList[{{idx}}].isTop" data-value="{{row.isTop}}" class="form-control m-b">
							<option value=""></option>
							<c:forEach items="${fns:getDictList('is_top')}" var="dict">
								<option value="${dict.value}">${dict.label}</option>
							</c:forEach>
						</select>
					</td>
					<td class="text-center" width="10">
						{{#delBtn}}<span class="close" onclick="delRow(this, '#rlzyPositionList{{idx}}')" title="删除">&times;</span>{{/delBtn}}
					</td>
				</tr>
			</script>
										<script type="text/javascript">
				var rlzyPositionRowIdx = 0, rlzyPositionTpl = $("#rlzyPositionTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
				$(document).ready(function() {
					var data = ${fns:toJson(rlzyCompany.rlzyPositionList)};
					for (var i=0; i<data.length; i++){
						addRow('#rlzyPositionList', rlzyPositionRowIdx, rlzyPositionTpl, data[i]);
						rlzyPositionRowIdx = rlzyPositionRowIdx + 1;
					}
				});
			</script>
									</div>
								</div>
							</div>
							<c:if test="${mode == 'add' || mode=='edit'}">
								<div class="col-lg-3"></div>
								<div class="col-lg-6 sub-btn-v">
									<div class="form-group text-center">
										<div>
											<button class="btn btn-primary btn-block btn-lg btn-parsley"
												data-loading-text="正在提交...">提 交</button>
										</div>
									</div>
								</div>
							</c:if>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>