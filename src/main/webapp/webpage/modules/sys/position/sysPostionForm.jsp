<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<title>职业信息管理</title>
<meta name="decorator" content="ani" />
<script type="text/javascript">
	$(document).ready(function() {

	});

	function save() {
		var isValidate = jp.validateForm('#inputForm');//校验表单
		if (!isValidate) {
			return false;
		} else {
			jp.loading();
			jp.post("${ctx}/sys/sysPostion/save", $('#inputForm').serialize(),
					function(data) {
						if (data.success) {
							jp.getParent().refreshNode(data);
							var dialogIndex = parent.layer
									.getFrameIndex(window.name); // 获取窗口索引
							parent.layer.close(dialogIndex);
							jp.success(data.msg)

						} else {
							jp.error(data.msg);
						}
					})
		}

	}
</script>
</head>
<body class="bg-white">
	<form:form id="inputForm" modelAttribute="sysPostion" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<table class="table table-bordered">
			<tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right">父级编号：</label></td>
					<td class="width-35"><sys:treeselect id="parent"
							name="parent.id" value="${sysPostion.parent.id}"
							labelName="parent.name" labelValue="${sysPostion.parent.name}"
							title="父级编号" url="/sys/sysPostion/treeData"
							extId="${sysPostion.id}" cssClass="form-control "
							allowClear="true" /></td>
					<td class="width-15 active"><label class="pull-right">名称：</label></td>
					<td class="width-35"><form:input path="name"
							htmlEscape="false" class="form-control " /></td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">职位编码：</label></td>
					<td class="width-35"><form:input path="code"
							htmlEscape="false" class="form-control " /></td>
					<td class="width-15 active"><label class="pull-right">行业类型：</label></td>
					<td class="width-35"><form:select path="type"
							class="form-control">
							<form:options items="${fns:getDictList('desiredIndustry')}"
								itemLabel="label" itemValue="value" htmlEscape="false" />
						</form:select></td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">备注信息：</label></td>
					<td class="width-35"><form:textarea path="remarks"
							htmlEscape="false" rows="4" class="form-control " /></td>
					<td class="width-15 active"></td>
					<td class="width-35"></td>
				</tr>
			</tbody>
		</table>
	</form:form>
</body>
</html>