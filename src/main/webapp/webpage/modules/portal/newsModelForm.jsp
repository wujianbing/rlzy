<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>新闻模块管理</title>
	<meta name="decorator" content="ani"/>
	<script type="text/javascript">

		$(document).ready(function() {

		});

		function save() {
            var isValidate = jp.validateForm('#inputForm');//校验表单
            if(!isValidate){
                return false;
		    }else{
                	jp.loading();
	                jp.post("${ctx}/portal/newsModel/save",$('#inputForm').serialize(),function(data){
	                    if(data.success){
	                        jp.getParent().refreshTree();
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
		<form:form id="inputForm" modelAttribute="newsModel" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<table class="table table-bordered">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right">模块名称：</label></td>
					<td class="width-35" colspan="3">
						<form:input path="name" htmlEscape="false"    class="form-control "/>
					</td>
				<tr>
					<td class="width-15 active"><label class="pull-right">上级模块：</label></td>
					<td class="width-35">
						<sys:treeselect id="parent" name="parent.id" value="${newsModel.parent.id}" labelName="parent.name" labelValue="${newsModel.parent.name}"
						title="父类id" url="/portal/newsModel/treeData" extId="${newsModel.id}" cssClass="form-control " allowClear="true"/>
					</td>
					<td class="width-15 active"><label class="pull-right">模块类型：</label></td>
					<td class="width-35">
						<form:select path="type" class="form-control ">
							<form:options items="${fns:getDictList('news_model_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">是否导航菜单：</label></td>
					<td class="width-35">
						<form:select path="isNav" class="form-control " onchange="hideGrade(this.value)">
							<form:options items="${fns:getDictList('is_nav')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
					<td class="width-15 active"><label class="pull-right">模块级别：</label></td>
					<td class="width-35">
						<form:select path="grade" class="form-control ">
							<form:options items="${fns:getDictList('grade_level')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
					</div>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">模块状态：</label></td>
					<td class="width-35">
						<form:select path="status" class="form-control ">
							<form:options items="${fns:getDictList('status_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
					<td class="width-15 active"><label class="pull-right">排序：</label></td>
					<td class="width-35">
						<form:input path="sort" htmlEscape="false"    class="form-control "/>
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