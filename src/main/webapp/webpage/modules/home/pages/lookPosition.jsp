<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<title></title>
<link href="${ctxStatic }/rlzy/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Jobdetiles.css" />
<style type="text/css">
	.selectBox.qyfl li {
    font-size: 14px;
    float: left;
    border: 0;
    padding: 0 10px;
    color: #555;
    padding: 0 10px;
}
.selectBox{
	display: block !important;
}
</style>
</head>
<body>
	<div class="jlpage" id="app">
		<div class="infoname">
			<h5>
				<span class="name1">职位详情&emsp;</span><span class="name2"></span>
			</h5>
			<form:form modelAttribute="rlzyPosition"  lay-filter="test1" class="forminfo layui-form" action="" method="post" id="form">
				<div class="row rowsy">
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label">职位类型：</label>
							<div class="layui-input-block">${fns:getDictLabel(rlzyPosition.positiontype, "work_nature", defaultValue)}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">工作地点：</label>
							<div class="layui-input-block">${rlzyPosition.workingplace}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">最高学历：</label>
							<div class="layui-input-block">${fns:getDictLabel(rlzyPosition.education, "education", defaultValue)}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">年龄要求：</label>
							<div class="layui-input-block">${fns:getDictLabel(rlzyPosition.agerequirement, "age_range", defaultValue)}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">招聘人数：</label>
							<div class="layui-input-block">${rlzyPosition.recruitnumber}</div>
						</div>
						
					</div>
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label">职位名称：</label>
							<div class="layui-input-block">${rlzyPosition.positionname}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">薪资范围：</label>
							<div class="layui-input-block">${fns:getDictLabel(rlzyPosition.salaryrange, "salary", defaultValue)}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">工作经验：</label>
							<div class="layui-input-block">${fns:getDictLabel(rlzyPosition.workingage, "working_age", defaultValue)}</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label">联系电话：</label>
							<div class="layui-input-block">${rlzyPosition.phone}</div>
						</div>
						
						<div class="layui-form-item">
							<label class="layui-form-label">联系人：</label>
							<div class="layui-input-block">${rlzyPosition.contacts}</div>
						</div>
					</div>
					<div class="col-lg-12">
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label">职位描述：</label>
							<div class="layui-input-block">
								<div name="desc" class="layui-textarea" style="line-height:26px;font-size:16px; padding:0; color:#333;">${rlzyPosition.positiondescription}</div>
							</div>
						</div>
					</div>
					<div class="col-lg-12">
						<label class="layui-form-label">企业福利：</label>
						<ul class="selectBox qyfl">
							<c:forEach items="${arr}" var="arr">
								<li>${ fns:getDictLabel (arr, "company_welfare", defaultValue)}</li>
							</c:forEach>
						</ul>
					</div>
					<div class="col-lg-12">
						<div class="layui-form-item">
							<label class="layui-form-label">是否急聘：</label>
							<div class="layui-input-block">${fns:getDictLabel(rlzyPosition.postflag, "is_post", defaultValue)}</div>
						</div>
					</div>
				</div>
			</form:form>
		</div>
</body>
</html>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>