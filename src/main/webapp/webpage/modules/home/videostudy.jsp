<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>技能提升</title>
		<!-- Bootstrap -->
		<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico"/>
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/skillUp.css" />
	</head>
	<body>
		<div class="img-v" style="margin-bottom: -70px;"><img src="/rlzy/static/rlzy/img/jnts.png"> </div>
		<div class="cont skill-up">
			<div class="left">
				<div class="tit">视频模块</div>
				<ul class="layui-nav layui-nav-tree layui-bg-cyan layui-inline" lay-filter="demo">
					<c:forEach items="${videoModelList}" var="mapParentList">
					<li class="layui-nav-item">
						<c:if test="${'0' eq mapParentList.parent.id}">
						<a data-id="${mapParentList.id}" data-count="${mapParentList.spe1}" href="javascript:;">${mapParentList.name}</a>
						</c:if>
						<dl class="layui-nav-child">
							<c:forEach items="${videoModelList}" var="mapChildList">
							<c:if test="${mapParentList.id eq mapChildList.parent.id}">
							<dd><a data-id="${mapChildList.id}" data-count="${mapChildList.spe1}" href="javascript:;">${mapChildList.name}</a></dd>
							</c:if>
						</c:forEach>
						</dl>
					</li>
					</c:forEach>
				</ul>	
			</div>
			<div class="right" id="videodiv">
				<div class="tit">视频</div>
				<div class="cont-v">
					<ul class="video-v" id='videoul'>
						<c:forEach items="${videoList}" var="videoList">
						<li class="video-lst">
							<video class="video" poster="${videoList.pic}" src="${videoList.path}" controls="controls">您的浏览器不支持 video 标签。</video>
						     <div class="viedoname">${videoList.title}</div>
						</li>
						</c:forEach>
					</ul>
				</div>
				<!-- 分页按钮 -->
				<div class="paging-v">
					<div id="paging" class="paging"></div>
				</div>
			</div>
		</div>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/skillUp.js"></script>
		<script>
			let id = "";
			let count = ${count};
			layui.use('element', function() {
				var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
				//监听导航点击
				element.on('nav(demo)', function(elem) {
					id = elem.attr("data-id");
					count = elem.attr("data-count");
					$.ajax({
			      	url:"/rlzy/home/videoList?id="+id+"&page=1&pageSize=10",
			      	type:"get",
			      	success:function(res){
			      		let data = res.list;
			      		count = res.count;
			 			let arr = new Array();
			 			arr.push('<div class="tit">视频分类</div>');
			 			arr.push('<div class="cont-v">');
			 			arr.push('<ul class="video-v" id="videoul">');
			 			if(data != undefined){
			 				for(var i=0;i<data.length;i++){
		 				arr.push('<li class="video-lst">');
		 				arr.push('<video class="video" poster="'+data[i].pic+'" src="'+data[i].path+'" controls="controls">您的浏览器不支持 video 标签。</video>');
		 				arr.push(' <div class="viedoname">'+data[i].title+'</div>');
		 				arr.push('</li>');
			 				} 
			 			}
			 			arr.push('</ul>');
			 			arr.push('</div>');
			 			arr.push('<div class="paging-v">');
			 			arr.push('<div id="paging" class="paging"></div>');
			 			arr.push('</div>');
			 			let html = arr.join('');
			 			$("#videodiv").children().remove();
			 			$("#videodiv").html(html);
			 			 pages(id,count);    	
			      	}
			      }); 
		     	
				});
			})
			
		 function pages(id,count){
		 console.log(id,count)
		 	layui.use(['laypage', 'layer'], function(){
			  var laypage = layui.laypage
			  ,layer = layui.layer;
			  
			  //完整功能
			  laypage.render({
			    elem: 'paging'
			    ,count: count
			    ,layout: ['count', 'prev', 'page', 'next', 'limit']
			    ,jump: function(obj,first){
			      console.log(obj)
			      var page = "1";
		      if(obj.curr != undefined){
		      	page = obj.curr;
		      }
		      if(first){
		      	return false;
		      }
		      $.ajax({
		      	url:"/rlzy/home/videoList?id="+id+"&page="+page+"&pageSize="+obj.limit,
		      	type:"get",
		      	success:function(res){
		      		let data = res.list;
		 			let arr = new Array();
			 			for(var i=0;i<data.length;i++){
		 				arr.push('<li class="video-lst">');
		 				arr.push('<video class="video" poster="'+data[i].pic+'" src="'+data[i].path+'" controls="controls">您的浏览器不支持 video 标签。</video>');
		 				arr.push(' <div class="viedoname">'+data[i].title+'</div>');
		 				arr.push('</li>');
		 			} 
		 			let html = arr.join('');
		 			$("#videoul>li").remove();
		 			$("#videoul").html(html);        	
		      	}
		      });
			    }
			  });
			});
		 }
		 
		 layui.use(['laypage', 'layer'], function(){
			  var laypage = layui.laypage
			  ,layer = layui.layer;
			  
			  //完整功能
			  laypage.render({
			    elem: 'paging'
			    ,count: count
			    ,layout: ['count', 'prev', 'page', 'next', 'limit']
			    ,jump: function(obj,first){
			      console.log(obj)
			      var page = "1";
		      if(obj.curr != undefined){
		      	page = obj.curr;
		      }
		      if(first){
		      	return false;
		      }
		      $.ajax({
		      	url:"/rlzy/home/videoList?id="+id+"&page="+page+"&pageSize="+obj.limit,
		      	type:"get",
		      	success:function(res){
		      		let data = res.list;
		 			let arr = new Array();
			 			for(var i=0;i<data.length;i++){
		 				arr.push('<li class="video-lst">');
		 				arr.push('<video class="video" src="'+data[i].path+'" controls="controls">您的浏览器不支持 video 标签。</video>');
		 				arr.push(' <div class="viedoname">'+data[i].title+'</div>');
		 				arr.push('</li>');
		 			} 
		 			let html = arr.join('');
		 			$("#videoul>li").remove();
		 			$("#videoul").html(html);        	
		      	}
		      });
			    }
			  });
			});
		</script>
	</body>
</html>
