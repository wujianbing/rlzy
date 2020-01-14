<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<title>企业信息审核</title>
<meta name="decorator" content="ani" />
<style>
button#auditone {
    margin-right: 37px;
    padding: 7px 16px;
    font-size: 16px;
    border-radius: 5px;
    background-color: #2292d6;
    color: white;
}
button#audittwo{
 	padding: 7px 16px;
    font-size: 16px;
    border-radius: 5px;
    background-color: #2292d6;
    color: white;
}
.btndiv {
    display: flex;
    justify-content: center;
    align-items: center;
}
</style>
<script type="text/javascript">

		$(document).ready(function() {
			//jp.go("${ctx}/portal/rlzyCompany?flag=1");
			 jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("${ctx}/portal/rlzyCompany?flag=1");
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
							<a class="panelButton" href="${ctx}/portal/rlzyCompany?flag=1"><i
								class="ti-angle-left"></i> 返回</a>
						</h3>
					</div>
					<div class="panel-body">
						<form class="form-horizontal">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业名称：</label></td>
										<td class="width-15"><input value="${rlzyCompany.companyname} "
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">昵称：</label></td>
										<td class="width-15"><input value="${rlzyCompany.nickName}
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">密码：</label></td>
										<td class="width-15"><input value="${rlzyCompany.password}" 
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">企业logo：</label></td>
										<td class="width-15">
												<div id="upfile"></div></td>
									</tr>
									<tr>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业规模：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.companyscale, 'company_scale', defaultValue)}" /></td>
										</td>

										<td class="width-10 active"><label class="pull-right">企业性质：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.companynature, 'company_nature', defaultValue)}" /></td>
										</td>

										<td class="width-10 active"><label class="pull-right">注册资金：</label></td>
										<td class="width-15"><input value="${rlzyCompany.registeredcapital} "
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">所在地区：</label></td>
										<td class="width-15"><input value="${rlzyCompany.localplace}"
												htmlEscape="false" class="form-control " /></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">信用编码：</label></td>
										<td class="width-15"><input value="${rlzyCompany.creditcode }"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">所属行业：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.industry, 'desired_industry', defaultValue)}" />
										</td>
										<td class="width-10 active"><label class="pull-right">企业网址：</label></td>
										<td class="width-15 "><input
												value="${rlzyCompany.companywebsite }" htmlEscape="false"
												class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">联系人：</label></td>
										<td class="width-15"><input value="${rlzyCompany.contacts}"
												htmlEscape="false" class="form-control " /></td>
									</tr>
									<tr>
										
										<td class="width-10 active"><label class="pull-right">联系电话：</label></td>
										<td class="width-15"><input value="${rlzyCompany.telephone}"
												htmlEscape="false" class="form-control required" /></td>
										<td class="width-10 active"><label class="pull-right">座机：</label></td>
										<td class="width-15"><input value="${rlzyCompany.phone }"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">邮箱：</label></td>
										<td class="width-15"><input value="${rlzyCompany.email }"
												htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">企业类型：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.companytype, 'company_type', defaultValue)}" />
										</td>
									</tr>
									<tr>
										
										<td class="width-10 active"><label class="pull-right">营业执照：</label></td>
										<td class="width-15">
												<div id="upfile2"></div></td>
										<td class="width-10 active"><label class="pull-right">审核状态：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.reviewstate, 'review_state', defaultValue)}" />
										</td>
										<td class="width-10 active"><label class="pull-right">试用状态：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.trystate, 'try_state', defaultValue)}" />
										</td>
										<td class="width-10 active"><label class="pull-right">支付状态：</label></td>
										<td class="width-15">
										<input htmlEscape="false" class="form-control " value="${ fns:getDictLabel (rlzyCompany.paystatus, 'paystatus', defaultValue)}" /></td>			
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">联系地址：</label></td>
										<td class="width-15" colspan="2"><input
												value="${rlzyCompany.address}" htmlEscape="false" class="form-control " /></td>
										<td class="width-10 active"><label class="pull-right">案例：</label></td>
										<td class="width-15" colspan="4">
												<div id="upfile3"></div></td>
										
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">服务范围：</label></td>
										<td class="width-15" colspan="7"><textarea
											  class="form-control "
												style="height:200px">${rlzyCompany.servicerange }</textarea></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">企业简介：</label></td>
										<td class="width-15" colspan="7"><textarea
												class="form-control " style="height:200px" >${rlzyCompany.companyprofile}</textarea></td>
									</tr>
									<tr>
										<td class="width-10 active"><label class="pull-right">审核意见：</label></td>
										<td class="width-15" colspan="1">
										<input htmlEscape="false" class="form-control" id="checkVal" value=""/></td>
										<td class="width-10 active"><label class="pull-right">是否置顶：</label></td>
										<td class="width-15" colspan="1">
										<select id="testSelect" class="form-control">
											<option value="0">请选择</option>
											<option value ="1">置顶</option>
											<option value ="2">不置顶</option>
										</select>
										<c:if test="${rlzyCompany.companytype == '2'}">
											<td class="width-10 active"><label class="pull-right">是否公开：</label></td>
											<td class="width-15" colspan="1">
											<select id="testSelect1" class="form-control">
												<option value="0">请选择</option>
												<option value ="1">公开</option>
												<option value ="2">不公开</option>
											</select>
											<td class="width-10 active"><label class="pull-right">排列序号：</label></td>
											<td class="width-15">
												<input id="rank" value="" placeholder="请输入数字" htmlEscape="false" class="form-control" type="number"/>
											</td>
										</c:if>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="col-lg-3"></div>
							<div class="col-lg-6">
								<div class='btndiv'>
										<button id="auditone" data-loading-text="正在提交...">通 过</button>
										<button id="audittwo" data-loading-text="正在提交...">驳回</button>
								</div>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<input id="yyzz" hidden="hidden" value="${rlzyCompany.businesslicense}">
	<input id="al" hidden="hidden" value="${rlzyCompany.casepic}">
	<input id="logo" hidden="hidden" value="${rlzyCompany.logo}">
	<input id="id" hidden="hidden" value="${rlzyCompany.id}">
	<script>
	var type = "${rlzyCompany.companytype}";
	$(function(){
		var driverImg =$("#logo").val(); 
		var subfile = driverImg.split("|");
		var subfilesArray=[];
		for(var i=0;i<subfile.length;i++){
			if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(subfile[i])){
	        	subfilesArray[i] = "<a href=\""+subfile[i]+"\" url=\""+subfile[i]+"\" target=\"_blank\">"+decodeURIComponent(subfile[i].substring(subfile[i].lastIndexOf("/")+1))+"</a>"
	        		$("#upfile").append(subfilesArray[i]);
	        		}else{
	        			subfilesArray[i] = '<img   onclick="jp.showPic(\''+subfile[i]+'\')"'+' height="50px" src="'+subfile[i]+'">';
	        			$("#upfile").append(subfilesArray[i]);
	        		}
		} 
		$("#upfile").append("</div>");
	})
	
	$(function(){
		var yyzz =$("#yyzz").val(); 
		var subfile = yyzz.split("|");
		var subfilesArray=[];
		for(var i=0;i<subfile.length;i++){
			if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(subfile[i])){
	        	subfilesArray[i] = "<a href=\""+subfile[i]+"\" url=\""+subfile[i]+"\" target=\"_blank\">"+decodeURIComponent(subfile[i].substring(subfile[i].lastIndexOf("/")+1))+"</a>"
	        		$("#upfile2").append(subfilesArray[i]);
	        		}else{
	        			subfilesArray[i] = '<img   onclick="jp.showPic(\''+subfile[i]+'\')"'+' height="50px" src="'+subfile[i]+'">';
	        			$("#upfile2").append(subfilesArray[i]);
	        		}
		} 
		$("#upfile2").append("</div>");
	})
	
	$(function(){
		var al =$("#al").val(); 
		var subfile = al.split("|");
		var subfilesArray=[];
		for(var i=0;i<subfile.length;i++){
			if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(subfile[i])){
	        	subfilesArray[i] = "<a href=\""+subfile[i]+"\" url=\""+subfile[i]+"\" target=\"_blank\">"+decodeURIComponent(subfile[i].substring(subfile[i].lastIndexOf("/")+1))+"</a>"
	        		$("#upfile3").append(subfilesArray[i]);
	        		}else{
	        			subfilesArray[i] = '<img   onclick="jp.showPic(\''+subfile[i]+'\')"'+' height="50px" src="'+subfile[i]+'">';
	        			$("#upfile3").append(subfilesArray[i]);
	        		}
		} 
		$("#upfile3").append("</div>");
	})
	
	$("#auditone").click(function(){
		jp.loading();
		var options = $("#testSelect option:selected").val();  //选中selsect
		console.log(options);
		if(options == "0"){
			jp.warning("请选择是否置顶!");
			return false;
		}
		if("2" == type){
			var ispublic = $("#testSelect1 option:selected").val();  //选中selsect
			console.log(ispublic);
			if(ispublic == "0"){
				jp.warning("请选择是否公开!");
				return false;
			}
			var rank = $("#rank").val();  //选中selsect
			console.log(options);
			if(rank == "" || rank == null){
				jp.warning("请输入排列序号!");
				return false;
			}
		}
		var checkVal =$('#checkVal').val();
		var id = $("#id").val(); 
              jp.get("${ctx}/portal/rlzyCompany/updateCheck?check=1&checkVal="+checkVal+"&id="+id+"&options="+options+"&ispublic="+ispublic+"&rank="+rank,function(data){
                  if(data.success){
                      var dialogIndex = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                      parent.layer.close(dialogIndex);
                      jp.success(data.msg)
                      jp.go("${ctx}/portal/rlzyCompany?flag=1");
                  }else{
                      jp.error(data.msg);
                  }
              })
	});
	
	$("#audittwo").click(function(){
		jp.loading();
		var options = $("#testSelect option:selected").val();  //选中selsect
		var checkVal =$('#checkVal').val();
		var rank = $("#rank").val();  //选中selsect
		var ispublic = $("#testSelect1 option:selected").val();  //选中selsect
		if(checkVal == ""){
			jp.warning("请填写驳回意见,方便公司修改信息!");
			return false;
		}
		var id = $("#id").val();  
              jp.get("${ctx}/portal/rlzyCompany/updateCheck?check=2&checkVal="+checkVal+"&id="+id+"&options="+options+"&ispublic="+ispublic+"&rank="+rank,function(data){
                  if(data.success){
                      var dialogIndex = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                      parent.layer.close(dialogIndex);
                      jp.success(data.msg);
                      jp.go("${ctx}/portal/rlzyCompany?flag=1");
                  }else{
                      jp.error(data.msg);
                  }
              })
	});
	</script>
</body>
</html>
