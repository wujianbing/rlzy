<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>视频管理</title>
	<meta name="decorator" content="ani"/>
	<!-- SUMMERNOTE -->
	<%@include file="/webpage/include/summernote.jsp" %>
	<script type="text/javascript">

		$(document).ready(function() {
			jp.ajaxForm("#inputForm",function(data){
				if(data.success){
				    jp.success(data.msg);
					jp.go("${ctx}/portal/video");
				}else{
				    jp.error(data.msg);
				    $("#inputForm").find("button:submit").button("reset");
				}
			});
				//富文本初始化
			$('#content').summernote({
				height: 300,                
                lang: 'zh-CN',
                callbacks: {
                    onChange: function(contents, $editable) {
                        $("input[name='content']").val($('#content').summernote('code'));//取富文本的值
                    }
                }
            });
		});

	</script>
</head>
<body>
<div class="wrapper wrapper-content">				
<div class="row">
	<div class="col-md-12">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3 class="panel-title"> 
				<a class="panelButton" href="${ctx}/portal/video"><i class="ti-angle-left"></i> 返回</a>
			</h3>
		</div>
		<div class="panel-body">
		<form:form id="inputForm" modelAttribute="video" action="${ctx}/portal/video/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
				<div class="form-group">
					<label class="col-sm-2 control-label"><font color="red">*</font>视频标题：</label>
					<div class="col-sm-10">
						<form:input path="title" htmlEscape="false"    class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><font color="red">*</font>所属模块：</label>
					<div class="col-sm-10">
						<sys:treeselect id="videoModel" name="videoModel" value="${video.videoModel.id}" labelName="" labelValue="${video.videoModel.name}"
							title="模块id" url="/portal/videoModel/treeData" extId="${video.id}" cssClass="form-control required" allowClear="true"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">所属企业：</label>
					<div class="col-sm-10">
						<form:input path="source" htmlEscape="false" class="form-control required"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">是否置顶：</label>
					<div class="col-sm-10">
						<form:select path="isTop" class="form-control ">
							<form:options items="${fns:getDictList('is_top')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><font color="red">*</font>视频缩略图：</label>
					<div class="col-sm-10">
						<sys:fileUpload path="pic"  value="${video.pic}" type="image" uploadPath="/portal/video"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><font color="red">*</font>视频文件：</label>
					<div class="col-sm-10">
						<sys:fileUpload path="path"  value="${video.path}" type="video" uploadPath="/portal/video"/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">视频简介：</label>
					<div class="col-sm-10">
						<form:textarea path="brief" htmlEscape="false" rows="4"    class="form-control "/>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">视频正文：</label>
					<div class="col-sm-10">
                        <input type="hidden" name="content" value=" ${video.content}"/>
						<div id="content">
                          ${fns:unescapeHtml(video.content)}
                        </div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">备注：</label>
					<div class="col-sm-10">
						<form:textarea path="remarks" htmlEscape="false" rows="4"    class="form-control "/>
					</div>
				</div>
		<c:if test="${mode == 'add' || mode=='edit'}">
				<div class="col-lg-3"></div>
		        <div class="col-lg-6">
		             <div class="form-group text-center">
		                 <div>
		                     <button class="btn btn-primary btn-block btn-lg btn-parsley" data-loading-text="正在提交...">提 交</button>
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