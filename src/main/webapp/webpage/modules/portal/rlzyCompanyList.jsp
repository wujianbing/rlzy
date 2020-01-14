<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>企业信息管理</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<meta name="decorator" content="ani"/>
	<%@ include file="/webpage/include/bootstraptable.jsp"%>
	<%@include file="/webpage/include/treeview.jsp" %>
	<%@include file="rlzyCompanyList.js" %>
</head>
<body>
	<div class="wrapper wrapper-content">
	<div class="panel panel-primary">
	<div class="panel-heading">
		<h3 class="panel-title">企业信息列表</h3>
	</div>
	<div class="panel-body">
	
	<!-- 搜索 -->
	<div id="search-collapse" class="collapse">
		<div class="accordion-inner">
			<form:form id="searchForm" modelAttribute="rlzyCompany" class="form form-horizontal well clearfix">
			 <div class="col-xs-12 col-sm-6 col-md-4">
				<label class="label-item single-overflow pull-left" title="企业名称：">企业名称：</label>
				<form:input path="companyname" htmlEscape="false" maxlength="100"  class=" form-control"/>
			</div>
			 <div class="col-xs-12 col-sm-6 col-md-4">
				<label class="label-item single-overflow pull-left" title="企业规模：">企业规模：</label>
				<form:select class="form-control" path="companyscale">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('company_scale')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
			 <div class="col-xs-12 col-sm-6 col-md-4">
				<label class="label-item single-overflow pull-left" title="企业性质：">企业性质：</label>
				<form:select class="form-control" path="companynature">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('company_nature')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<label class="label-item single-overflow pull-left" title="是否置顶：">是否置顶：</label>
				<form:select class="form-control" path="istop">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('is_top')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<label class="label-item single-overflow pull-left" title="入驻类型：">入驻类型：</label>
				<form:select class="form-control" path="companytype">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('company_type')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
			<div class="col-xs-12 col-sm-6 col-md-4">
				<label class="label-item single-overflow pull-left" title="所属行业：">所属行业：</label>
				<form:select class="form-control" path="industry">
					<form:option value="" label="请选择" />
					<form:options items="${fns:getDictList('desired_industry')}" itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		 <div class="col-xs-12 col-sm-6 col-md-4">
			<div style="margin-top:26px">
			  <a  id="search" class="btn btn-primary btn-rounded  btn-bordered btn-sm"><i class="fa fa-search"></i> 查询</a>
			  <a  id="reset" class="btn btn-primary btn-rounded  btn-bordered btn-sm" ><i class="fa fa-refresh"></i> 重置</a>
			 </div>
	    </div>	
	</form:form>
	<input id="reviewstate" hidden="hidden" value="${reviewstate}"/>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div id="toolbar">
			<c:if test="${reviewstate == 0}">
			<shiro:hasPermission name="portal:rlzyCompany:add">
				<button id="add" class="btn btn-primary" onclick="add()">
					<i class="glyphicon glyphicon-plus"></i> 新建
				</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="portal:rlzyCompany:edit">
			    <button id="edit" class="btn btn-success" disabled onclick="edit()">
	            	<i class="glyphicon glyphicon-edit"></i> 修改
	        	</button>
			</shiro:hasPermission>
			<shiro:hasPermission name="portal:rlzyCompany:del">
				<button id="remove" class="btn btn-danger" disabled onclick="deleteAll()">
	            	<i class="glyphicon glyphicon-remove"></i> 删除
	        	</button>
			</shiro:hasPermission>
			<%-- <shiro:hasPermission name="portal:rlzyCompany:import">
				<button id="btnImport" class="btn btn-info"><i class="fa fa-folder-open-o"></i> 导入</button>
			</shiro:hasPermission> --%>
			<shiro:hasPermission name="portal:rlzyCompany:export">
	        		<button id="export" class="btn btn-warning">
					<i class="fa fa-file-excel-o"></i> 导出
				</button>
			 </shiro:hasPermission>
			 </c:if>
			 <c:if test="${reviewstate != 1}">
	                 <shiro:hasPermission name="portal:rlzyCompany:view">
				<button id="view" class="btn btn-default" disabled onclick="view()">
					<i class="fa fa-search-plus"></i> 查看
				</button>
			</shiro:hasPermission>
			</c:if>
			<c:if test="${reviewstate == 1}">
				<button id="check" class="btn btn-danger">
					<i class="fa fa-file-excel-o"></i> 审核
				</button>
			</c:if>
		    </div>
		
	<!-- 表格 -->
	<table id="rlzyCompanyTable"   data-toolbar="#toolbar"></table>

    <!-- context menu -->
    <ul id="context-menu" class="dropdown-menu">
    	<shiro:hasPermission name="portal:rlzyCompany:view">
        <li data-item="view"><a>查看</a></li>
        </shiro:hasPermission>
    	<shiro:hasPermission name="portal:rlzyCompany:edit">
        <li data-item="edit"><a>编辑</a></li>
        </shiro:hasPermission>
        <shiro:hasPermission name="portal:rlzyCompany:del">
        <li data-item="delete"><a>删除</a></li>
        </shiro:hasPermission>
        <li data-item="action1"><a>取消</a></li>
    </ul>  
	</div>
	</div>
	</div>
</body>
</html>