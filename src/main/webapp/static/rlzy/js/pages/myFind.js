function MyFind() {

}
MyFind.prototype = {
	init : function() {
		myFind.bind();
	},
	bind : function() {
		// 表格点击
		layui.use('table');
	},
	tab1Href : function() {
		//跳转首页
		window.location.href=url+"/login/tologin";
	},
	tab1Accept : function(res) {
		console.log(res);
		// layer.alert('编辑行：<br>'+ JSON.stringify(res));
		if("2" == res.accepts){
			layer.open({
				type: 1
				,offset: 'auto' //具体配置参考：offset参数项
				,content: '<div style="padding: 20px 80px;">您已同意了，请等待对方回复！</div>'
				,btn: '关闭'
				,btnAlign: 'c' //按钮居中
				,shade: 0 //不显示遮罩
				,yes: function(){
				layer.closeAll();
				}
			});
		}else{
		// 询问框
		layer.confirm('是否确定接受？', {
			btn : [ '确定', '取消' ],
			offset: 'auto'
		// 按钮
		}, function() {
			$.get(url + "/user/accept?id=" + res.relationId, function(data) {
				if ("1" == data) {
					layer.msg('接受成功', {
						icon : 1
					});
					let dom = $('#iframe');
					dom.attr('src', url + '/user/careerManage?userId=' + userId);
				}
			});
		});
	  }
	},
	tab1Decline : function(res) {
		if("2" == res.accepts){
			layer.open({
				type: 1
				,offset: 'auto' //具体配置参考：offset参数项
				,content: '<div style="padding: 20px 80px;">您已同意暂时无法拒绝，请等待</div>'
				,btn: '关闭'
				,btnAlign: 'c' //按钮居中
				,shade: 0 //不显示遮罩
				,yes: function(){
				layer.closeAll();
				}
			});
		}else{
		layer.confirm('是否确定拒绝？', {
			btn : [ '确定', '取消' ]
		// 按钮
		}, function() {
			$.get(url + "/user/refuse?id=" + res.relationId, function(data) {
				if ("1" == data) {
					layer.msg('拒绝成功', {
						icon : 1
					});
					let dom = $('#iframe');
					dom.attr('src', url + '/user/careerManage?userId=' + userId);
				}
			});
		});
	  }
	},
	tab2Decline : function(res) {
		layer.confirm('是否取消收藏？', {
			btn : [ '确定', '取消' ]
		// 按钮
		}, function() {
			$.get(url + "/user/cancel?id=" + res.relationId, function(data) {
				if ("1" == data) {
					layer.msg('取消成功', {icon : 1});
					let dom = $('#iframe');
					dom.attr('src', url + '/user/jobCollect?userId=' + userId);
				}
			});
		});
	},
	tab6Accept : function(res) {
		console.log(res);
		// 询问框
		if("1" == res.applys){
			layer.open({
				type: 1
				,offset: 'auto' //具体配置参考：offset参数项
				,content: '<div style="padding: 20px 80px;">您已申请过，请等待对方回复!</div>'
				,btn: '关闭'
				,btnAlign: 'c' //按钮居中
				,shade: 0 //不显示遮罩
				,yes: function(){
				layer.closeAll();
				}
			});
		}else{
			layer.confirm('是否确定申请？', {
				btn : [ '确定', '取消' ]
			// 按钮
			}, function() {
				$.get(url + "/user/applyJob?id=" + res.relationId, function(data) {
					if ("1" == data) {
						layer.msg('申请成功', {
							icon : 1
						});
						let dom = $('#iframe');
						dom.attr('src', url + '/user/jobCollect?userId=' + userId);
					}
				});
			});
		}
	},
	//查看职位信息
	tab8Decline: function(res){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "职位信息查看", //不显示标题
			  area: ['900px', '650px'], //宽高
			  content:url+"/user/lookJob?id="+res.relationId,
		});
		
	},
	//查看公司职位信息
	tab9Decline: function(res){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "职位信息查看", //不显示标题
			  area: ['900px', '700px'], //宽高
			  content:url+"/user/lookCompany?id="+res.relationId,
		});
		let dom = $('#iframe');
	}
}
let myFind = new MyFind();
myFind.init();

// iframe自适应
function reinitIframe() {
	var iframe = document.getElementById("iframe");
	try {
		var bHeight = iframe.contentWindow.document.body.scrollHeight;
		var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
		var height = Math.max(bHeight, dHeight);
		$('#iframe').css({
			'height' : height
		});
		console.log(height);
	} catch (ex) {
	}
}
// iframe切换
$(function() {
	$('#navbar li').on('click', function() {
		// console.log($(this).attr('data-id'));
		let id = $(this).attr('data-id');
		let dom = $('#iframe');
		if (id == 1) {
			dom.attr('src', url + '/user/myResume?id=' + userId);
			dom.css({
				'height' : '1186px'
			});
		} else if (id == 2) {
			dom.attr('src', url + '/user/careerManage?userId=' + userId);
			dom.css({
				'height' : '600px'
			});
		} else if (id == 3) {
			dom.attr('src', url + '/user/jobCollect?userId=' + userId);
			dom.css({
				'height' : '600px'
			});
		} else if (id == 4) {
			dom.attr('src', url + '/user/personalAccount?userId=' + userId);
			dom.css({
				'height' : '600px'
			});
		}
		$(this).addClass('navbar-active');
		$(this).siblings().removeClass('navbar-active');
	})
})
