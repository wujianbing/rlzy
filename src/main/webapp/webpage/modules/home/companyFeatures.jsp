<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>企业分风采展示列表</title>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/jquery.my-modal.1.1.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/findInfo.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/qyfc.css" />
		<style type="text/css">
			.gz1 {
				/*position: relative;
			    width: 863px;
			    height: auto;
			    border: 1px solid #ddd;
			    color: #333;
			    background: #fff;
			    cursor: auto;*/
			}
			
			span.lsp {
				display: flex;
				width: 90%;
				overflow: visible;
				word-wrap: break-word;
				word-break: break-all;
			}
			.herf12 {
				display: flex;
			}
			
			.herf12 .lefth5 {
				flex: 1;
			}
			
			span.lefth5.nametop {
				width: 200px;
				display: inline-block;
				white-space: nowrap;
				/* background: #ff6501; */
				/* text-overflow: ellipsis; */
				text-align: left;
			}
			
			span.nameb.name1 {
				display: inline-block;
				max-width: 189px;
				white-space: nowrap;
				overflow: hidden;
				text-overflow: ellipsis;
			}
			
			.lefth5 {
				text-align: left;
				cursor: pointer;
			}
			
			span.name2 {
				display: inline-block;
				white-space: nowrap;
				text-overflow: ellipsis;
				overflow: hidden;
				word-break: break-all;
				max-width: 180px;
			}
			
			sup {
				background: red;
				padding: 2px 8px;
				font-size: 12px;
				border-radius: 2px;
				color: #fff;
				position: relative;
				top: -1px;
			}
			.yuqbottom2{
				min-height: 60%;
			}
		</style>
	</head>

	<body>
		<!--首页内容-->
		<div class="humanbox">
			<!--banner图-->
			<div class="banner"></div>
			<div class="selet">
				<div class="sxl">

					<div class="divset">企业风采列表</div>
					<div class="divset search bar1">

						<input id="name" type="text" placeholder="请输入公司名称..." value="">
						<div id="search" class="setsec"><i class="layui-icon layui-icon-search"></i></div>

					</div>
				</div>

			</div>
			<!--所有职位-->
			<div class="titlebg">
				<div class="leftbtn">

				</div>
			</div>
			<!--个人信息部分-->
			<div class="yuqbottom2">
				<!--左边简历部分-->
				<div class="yuleft">
					<!--基本信息-->
					<ul class="alljob" id="ul1">
					<c:forEach items="${rlzyCompanyList}" var="rlzyCompany">
					<a href="${rlzyPath}/company/companyData?id=${rlzyCompany.id}">
						<li>
							<div class="company-header-block">
								<div class="divt">
									<img src="${rlzyCompany.logo}" />
								</div>
								<div class="divt">
									<div class="header">
										<h1 class="name">${rlzyCompany.companyname}</h1></div>
									<div class="detailw clear">
										<!--联系方式等-->
										<ul class="clear"> 
											<li>联系人：<span>${rlzyCompany.contacts}</span></li>
											<li>联系电话：<span>${rlzyCompany.telephone}</span></li>
											<li>企业地址：<span>${rlzyCompany.address}</span></li>
										</ul>
									</div>
								</div>
							</div>
						</li>
						</a>
					</c:forEach>
					</ul>
					<div class="fy">
						<div id="test1"></div>
					</div>
				</div>
			</div>

			<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
			<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
			<script type="text/javascript" src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
			<script type="text/javascript" src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
	</body>
</html>
<script type="text/javascript" charset="utf-8">
	//分页事件
layui.use('laypage', function(){
  var laypage = layui.laypage;
  //执行一个laypage实例
  laypage.render({
	    elem: 'test1',
	    theme: '#1787fb',
	    count: ${count},
	    layout: ['count', 'prev', 'page', 'next', 'limit'],
	    jump: function(obj,first){
	      var page = "1";
	      if(obj.curr != undefined){
	      	page = obj.curr;
	      }
	      if(first){
	      	return false;
	      }
	      $.ajax({
	      	url:"/rlzy/home/rlzycompanypage?&page="+page+"&pageSize="+obj.limit,
	      	type:"get",
	      	success:function(data){
	 			let arr = new Array();
	 			for(var i=0;i<data.length;i++){
	 				arr.push('<li>');
	 				arr.push('<div class="company-header-block">');
	 				arr.push('<div class="divt">');
	 				arr.push('<img src="'+data[i].logo+'"/>');
	 				arr.push('</div>');
	 				arr.push('<div class="divt">');
	 				arr.push('<div class="header">');
	 				arr.push('<h1 class="name">'+data[i].companyname+'</h1></div>');
	 				arr.push('<div class="detailw clear">');
	 				arr.push('<ul class="clear"> ');
	 				arr.push('<li>联系人：<span>'+data[i].contacts+'</span></li>');
	 				arr.push('<li>联系电话：<span>'+data[i].telephone+'</span></li>');
	 				arr.push('<li>企业地址：<span>'+data[i].address+'</span></li>');
	 				arr.push('</ul>');
	 				arr.push('</div>');
	 				arr.push('</div>');
	 				arr.push('</div>');
	 				arr.push('</li>');
	 			} 
	 			let html = arr.join('');
	 			$("#ul1>li").remove();
	 			$("#ul1").html(html);    	
	      	}
	      });
	    }
	  });
});
	
$("#search").click(function(){
	var name = $("#name").val();
      $.ajax({
      	url:"/rlzy/home/rlzyCompanyListBySelect?&page=1&pageSize=10&name="+name,
      	type:"get",
      	contentType: "application/json;charset=utf-8",
      	success:function(data){
 			let arr = new Array();
 			arr.push('<ul class="alljob" id="ul1">');
 			for(var i=0;i<data.length;i++){
 				arr.push('<a href="${rlzyPath}/company/companyData?id='+data[i].id+'">');
 				arr.push('<li>');
 				arr.push('<div class="company-header-block">');
 				arr.push('<div class="divt">');
 				arr.push('<img src="'+data[i].logo+'"/>');
 				arr.push('</div>');
 				arr.push('<div class="divt">');
 				arr.push('<div class="header">');
 				arr.push('<h1 class="name">'+data[i].companyname+'</h1></div>');
 				arr.push('<div class="detailw clear">');
 				arr.push('<ul class="clear"> ');
 				arr.push('<li>联系人：<span>'+data[i].contacts+'</span></li>');
 				arr.push('<li>联系电话：<span>'+data[i].telephone+'</span></li>');
 				arr.push('<li>企业地址：<span>'+data[i].address+'</span></li>');
 				arr.push('</ul>');
 				arr.push('</div>');
 				arr.push('</div>');
 				arr.push('</div>');
 				arr.push('</li>');
 				
 			} 
 			arr.push('</a>');
			arr.push('</ul>');
			arr.push('<div class="fy">');
			arr.push('<div id="test1"></div>');
			arr.push('</div>');
 			let html = arr.join('');
 			$(".yuleft").children().remove();
 			$(".yuleft").html(html);
 			console.log(data[0]);
 			if(data[0] != undefined || data[0] != null){
 				var count = data[0].spe3;
	 			 pages(count);
 			}else{
 				$('.yuleft').html('抱歉，未查询到数据！');
 				$('.yuleft').css({'text-align':'center','line-height':'50px','font-size':'15px','color':'#7b7474'});
 			}   	
      	}
      });
});

function pages(count){
	layui.use('laypage', function(){
		  var laypage = layui.laypage;
		  //执行一个laypage实例
		  laypage.render({
			    elem: 'test1',
			    theme: '#1787fb',
			    count: count,
			    layout: ['count', 'prev', 'page', 'next', 'limit'],
			    jump: function(obj,first){
			      var page = "1";
			      if(obj.curr != undefined){
			      	page = obj.curr;
			      }
			      if(first){
			      	return false;
			      }
			    }
		  });
	});
}
</script>