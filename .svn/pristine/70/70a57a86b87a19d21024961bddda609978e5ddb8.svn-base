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

		function save() {
            var isValidate = jp.validateForm('#inputForm');//校验表单
            if(!isValidate){
                return false;
			}else{
                jp.loading();
                jp.post("${ctx}/portal/video/save",$('#inputForm').serialize(),function(data){
                    if(data.success){
                        jp.getParent().refresh();
                        var dialogIndex = parent.layer.getFrameIndex(window.name); // 获取窗口索引
                        parent.layer.close(dialogIndex);
                        jp.success(data.msg)

                    }else{
                        jp.error(data.msg);
                    }
                })
			}
        }
	</script>
</head>
<body class="bg-white">
		<form:form id="inputForm" modelAttribute="video" class="form-horizontal">
		<form:hidden path="id"/>	
		<table class="table table-bordered">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right">视频标题：</label></td>
					<td class="width-35" colspan="3">
						<form:input path="title" htmlEscape="false"    class="form-control "/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">所属模块：</label></td>
					<td class="width-35">
						<sys:treeselect id="videoModel" name="videoModel.id" value="${video.videoModel.id}" labelName="" labelValue="${video.videoModel.name}"
							title="视频模块id" url="/portal/videoModel/treeData" extId="${video.id}" cssClass="form-control " allowClear="true"/>
					</td>
					<td class="width-15 active"><label class="pull-right">是否置顶：</label></td>
					<td class="width-35">
						<form:select path="isTop" class="form-control ">
							<form:options items="${fns:getDictList('is_top')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
				<tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">视频缩略图：</label></td>
					<td class="width-35">
						<sys:fileUpload path="pic"  value="${video.pic}" type="image" uploadPath="/portal/video"/>
					</td>
					<td class="width-15 active"><label class="pull-right">视频文件：</label></td>
					<td class="width-35">
						<sys:fileUpload path="path"  value="${video.path}" type="video" uploadPath="/portal/video"/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">视频简介：</label></td>
					<td class="width-35" colspan="3">
						<form:textarea path="brief" htmlEscape="false" rows="4"    class="form-control "/>
					</td>
				<tr>
				</tr>
					<td class="width-15 active"><label class="pull-right">正文：</label></td>
					<td class="width-35" colspan="3">
                        <input type="hidden" name="content" value=" ${video.content}"/>
						<div id="content">
                          ${fns:unescapeHtml(video.content)}
                        </div>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">备注：</label></td>
					<td class="width-35" colspan="3">
						<form:textarea path="remarks" htmlEscape="false" rows="4"    class="form-control "/>
					</td>
		  		</tr>
		 	</tbody>
		</table>
	</form:form>
</body>
</html>