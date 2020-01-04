<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>新闻动态</title>
<!-- Bootstrap -->
<link rel="shortcut icon" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="bookmark" href="${ctxStatic }/rlzy/favicon.ico" />
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet"
	href="${ctxStatic }/rlzy/css/Registeredcomment.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/news.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/pages/skillUp.css" />
<style type="text/css">
/* .tit {
    font-size: 16px;
    padding: 10px;
    margin: 8px 0;
    color: #1787fb;
    border-bottom: 1px dotted #323232;
}*/
.left {
	height: initial;
}
</style>
</head>
<body>
	<div class="img-v" style="margin-bottom: -70px;">
		<img src="/rlzy/static/rlzy/img/jnts.png">
	</div>
	<div class="cont news-v">
		<div class="left">
			<div class="tit">服务窗口</div>
			<ul
				class="layui-nav layui-nav-tree layui-bg-cyan layui-inline news-ul"
				lay-filter="demo" >
				<c:forEach items="${newsModelList}" var="mapParentList">
					<li class="layui-nav-item news-li"><a
						data-id="${mapParentList.id}" data-count="${mapParentList.spe1}"
						href="javascript:;">${mapParentList.name}</a></li>
				</c:forEach>
			</ul>
		</div>
		<div class="right">
			<div class="news-cont">
				<div class="news-cont-top">服务机构></div>
				<div class="new-cont">
					<div class="news-cont-bot">
						<ul class="news-ul" id="ul1">
							<c:forEach items="${serviceList}" var="serviceList">
								<li class="news-li">
									<div class="newsli-cont" style="display: none;">${serviceList.content }</div>
									<div class="newsli-top">
										<div>●</div>
										<div title="" class="news-title">${serviceList.title }</div>
										<div class="news-time">
											<fmt:formatDate value="${serviceList.createDate }"
												pattern="yyyy-MM-dd" />
										</div>
									</div>
									<div class="newsli-deta">${serviceList.brief }</div>
								</li>
							</c:forEach>
						</ul>
						<!-- 分页 -->
						<div class="paging-v">
							<div id="paging" class="paging"></div>
						</div>
					</div>
				</div>
				
				<div class="newsdeta-cont" style="display: none;">
					<div class="n-tit">
						<h3 id="title"></h3>
						<div class="data-v">
						</div>
					</div>
					<div class="n-cont" id="count"></div>
				</div>
			
			</div>
		
		</div>
	
	</div>
</body>
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<script
			src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
		<script src="${ctxStatic }/rlzy/js/pages/nav.js"></script>
		 <script src="${ctxStatic }/rlzy/js/pages/serviceWindow.js"></script>
		<script>
		
		layui.use('element', function() {
				var element = layui.element; 
				//监听导航点击
				element.on('nav(demo)', function(elem) {
					id = elem.attr("data-id");
					count = elem.attr("data-count");
					
					$.ajax({
			      	url:"/rlzy/home/serviceList?id="+id+"&page=1&pageSize=10",
			      	type:"post",
			      	success:function(data){
			      	var list = data.list;
		 			let arr = new Array();
		 			arr.push('<div class="news-cont-bot">');
		 			arr.push('<ul class="news-ul" id="ul1">');
		 			for(var i=0;i<list.length;i++){
		 				var time = new Date(list[i].createDate).format("yyyy-MM-dd")
		 				arr.push('<li class="news-li">');
		 				arr.push('<div class="newsli-cont" style="display:none">'+list[i].content+'</div>'); 
		 				arr.push('<div class="newsli-top">');
		 				arr.push('<div>●</div>');
		 				arr.push('<div title="" class="news-title">'+list[i].title+'</div>');
		 				arr.push('<div class="news-time">'+time+'</div>');
		 				arr.push('</div>');
		 				arr.push('<div class="newsli-deta">'+list[i].brief+'</div></li>');
		 			} 
		 			arr.push('</ul>');
		 			arr.push('<div class="paging-v">');
		 			arr.push('<div id="paging" class="paging"></div>');
		 			arr.push('</div>');
		 			arr.push('</div>')
		 			
		 			let html = arr.join('');
		 			$('.news-cont-bot').show();
					$('.newsdeta-cont').hide(); 
		 			$(".news-cont-bot").children().remove();
		 			$(".news-cont-bot").html(html);
		 			let count = data.count;
		 			news.init();
		 			pages(count);
		      	}
			      }); 
		     	
				});
			})
	
	function pages(count){
		layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage,
		  layer = layui.layer;
		  //分页功能
		  laypage.render({
		    elem: 'paging',
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
	
	
		layui.use(['laypage', 'layer'], function(){
		  var laypage = layui.laypage,
		  layer = layui.layer;
		  //分页功能
		  laypage.render({
		    elem: 'paging',
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
		      var id = "${newsList[0].newsModel.id}";
		      $.ajax({
		      	url:"/rlzy/home/serviceList?id="+id+"&page="+page+"&pageSize="+obj.limit,
		      	type:"get",
		      	success:function(data){
		 			let arr = new Array();
		 			arr.push('<div class="news-cont-bot">');
		 			arr.push('<ul class="news-ul" id="ul1">');
		 			for(var i=0;i<data.length;i++){
		 				var time = new Date(data[i].createDate).format("yyyy-MM-dd")
		 				arr.push('<li class="news-li">');
		 				arr.push('<div class="newsli-cont" style="display:none">'+data[i].content+'</div>');
		 				arr.push('<div class="newsli-top">');
		 				arr.push('<div>●</div>');
		 				arr.push('<div title="" class="news-title">'+data[i].title+'</div>');
		 				arr.push('<div class="news-time">'+time+'</div>');
		 				arr.push('</div>');
		 				arr.push('<div class="newsli-deta">'+data[i].brief+'</div></li>');
		 			} 
		 			arr.push('</ul>');
		 			arr.push('<div class="paging-v">');
		 			arr.push('<div id="paging" class="paging"></div>');
		 			arr.push('</div>');
		 			arr.push('</div>')
		 			let html = arr.join('');
		 			$("#ul1>li").remove();
		 			$("#ul1").html(html);    	
		      	}
		      });
		    }
		  });
		  
		});
		
		
		
		//js时间格式化
Date.prototype.format = function(fmt) { 
   var o = { 
      "M+" : this.getMonth()+1,                 //月份 
      "d+" : this.getDate(),                    //日 
      "h+" : this.getHours(),                   //小时 
      "m+" : this.getMinutes(),                 //分 
      "s+" : this.getSeconds(),                 //秒 
      "q+" : Math.floor((this.getMonth()+3)/3), //季度 
      "S"  : this.getMilliseconds()             //毫秒 
  }; 
  if(/(y+)/.test(fmt)) {
          fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
  }
   for(var k in o) {
      if(new RegExp("("+ k +")").test(fmt)){
           fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
       }
   }
  return fmt; 
}
	</script>

</html>
