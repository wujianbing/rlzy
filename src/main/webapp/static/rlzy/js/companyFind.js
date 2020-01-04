function MyFind(){
	
}
MyFind.prototype = {
	init: function(){
		myFind.bind();
	},
	bind: function(){
		//表格点击
		layui.use('table');
	},
	tab1Href2 : function() {
		//职位发布修改跳转
		window.location.href=url+"/company/offerManage?firmId="+firmId;
	},
	tab1Href : function() {
		//跳转首页
		window.location.href=url+"/login/tologin";
	},
	//收藏-邀请
	tab1Accept: function(res){
		if("1" == res.invites){
			layer.open({
				type: 1
				,offset: 'auto' //具体配置参考：offset参数项
				,content: '<div style="padding: 20px 80px;">您已邀请过了，请等待对方回复！</div>'
				,btn: '关闭'
				,btnAlign: 'c' //按钮居中
				,shade: 0 //不显示遮罩
				,yes: function(){
				layer.closeAll();
				}
			});
		}else{
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "确认职位", //不显示标题
			  area: ['600px', '350px'], //宽高
			  content:url+"/company/collectManageYq?id="+res.relationId,
		});
		}
//		layer.confirm('是否确定邀请此联系人？', {
//		  btn: ['确定','取消'] //按钮
//		}, function(){
//		  $.get(url+"/company/collectManageYq?id="+res.relationId,function(data){
//			  if("1" == data){
//				  layer.msg('邀请成功', {icon: 1});
//				  let dom = $('#iframe');
//				  dom.attr('src',url+'/company/collectManage?firmId='+firmId);
//			  }
//		  });
//		});
	},
	//收藏 -取消
	tab1Decline: function(res){
		layer.confirm('是否确定取消收藏此联系人？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			 $.get(url+"/company/collectManageC?id="+res.relationId,function(data){
				  if("1" == data){
					  layer.msg('取消收藏成功', {icon: 1});
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/collectManage?firmId='+firmId);
				  }
			  });
		});
	},
	//收藏 -拒绝
	tab2Decline: function(res){
		layer.confirm('真的删除此条信息？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.get(url+"/company/collectManageDel?id="+res.relationId,function(data){
				  if("1" == data){
					  layer.msg('删除成功', {icon: 1});
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/collectManage?firmId='+firmId);
				  }
			  });
		});
	},
	//查看人员信息
	tab7Decline: function(res){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "查看简历信息", //不显示标题
			  area: ['900px', '700px'], //宽高
			  content:url+"/company/lookCompany?id="+res.relationId,
		});
	},
	//收到的简历删除
	tab5Decline: function(res){
		layer.confirm('是否确定删除此条简历信息？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.get(url+"/company/receiveResumeDataDel?id="+res.relationId,function(data){
				  if("1" == data){
					  layer.msg('删除成功', {icon: 1});
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/receiveResume?firmId='+firmId);
				  }
			  });
		});
	},
	//收到的简历邀请
	tab5Accept: function(res){
		if("1" == res.invites){
			layer.open({
				type: 1
				,offset: 'auto' //具体配置参考：offset参数项
				,content: '<div style="padding: 20px 80px;">您已邀请过了，请等待对方回复！</div>'
				,btn: '关闭'
				,btnAlign: 'c' //按钮居中
				,shade: 0 //不显示遮罩
				,yes: function(){
				layer.closeAll();
				}
			});
		}else{
		layer.confirm('是否确定邀请此联系人？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
		  $.get(url+"/company/receiveResumeDataYQ?id="+res.relationId,function(data){
			  if("1" == data){
				  layer.msg('邀请成功', {icon: 1});
				  let dom = $('#iframe');
				  dom.attr('src',url+'/company/receiveResume?firmId='+firmId);
			  }
		  });
		});
	  }
	},
	//查看简历信息
	tab8Decline: function(res){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "查看简历信息", //不显示标题
			  area: ['900px', '700px'], //宽高
			  content:url+"/company/lookJob?id="+res.relationId,
		});
	},
	//职位-修改
	tab3Decline: function(res){
			layer.open({
				  type: 2,
				  skin: 'layui-layer-lan', //加上边框
				  title: "职位信息修改", //不显示标题
//				  offset: ['800px', '50px'],
				  area: ['900px', '700px'], //宽高
				  content:"/rlzy/company/publishOfferEdit?id="+res.positionId+"&firmId="+firmId,
			});
	},
	//职位-删除
	tab4Decline: function(res){
		console.log(res);
		layer.confirm('真的删除此条职位发布？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.get(url+"/company/offerManageDataDel?id="+res.positionId,function(data){
				  if("1" == data){
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/offerManage?firmId='+firmId);
					  //window.location.href=url+"/company/offerManage?firmId="+firmId;
					  layer.msg('删除成功', {icon: 1});
				  }
			  });
		});
	},
	//职位-下线
	tab10Decline: function(res){
		console.log(res);
		layer.confirm('真的下线此条职位？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.get(url+"/company/offline?id="+res.positionId,function(data){
				  if("1" == data){
					  layer.msg('下线成功', {icon: 1});
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/offerManage?firmId='+firmId);
				  }
			  });
		});
	},
	//职位-上线
	tab11Decline: function(res){
		console.log(res);
		layer.confirm('真的上线此条职位？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.get(url+"/company/upline?id="+res.positionId,function(data){
				  if("1" == data){
					  layer.msg('上线成功', {icon: 1});
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/offerManage?firmId='+firmId);
				  }
			  });
		});
	},
	//查看简历信息
	tab12Decline: function(res){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "查看简历信息", //不显示标题
			  area: ['900px', '700px'], //宽高
			  content:url+"/company/lookJob?id="+res.relationId,
		});
	},
	//产品列表
	addtable: function(res){
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "发布产品", //不显示标题
			  area: ['900px', '700px'], //宽高
			  content:url+"/company/publishProduct?id="+firmId,
		});
	},
	//产品-修改
	tab14Decline: function(res){
		console.log(res);
		layer.open({
			  type: 2,
			  skin: 'layui-layer-lan', //加上边框
			  title: "修改产品", //不显示标题
			  area: ['900px', '700px'], //宽高
			  content:url+"/company/editProduct?id="+res.productId,
		});
	},
	//产品-删除
	tab15Decline: function(res){
		console.log(res);
		layer.confirm('真的删除此条产品信息？', {
		  btn: ['确定','取消'] //按钮
		}, function(){
			$.get(url+"/company/editProductDel?id="+res.productId,function(data){
				  if("1" == data){
					  layer.msg('删除成功!', {icon: 1});
					  let dom = $('#iframe');
					  dom.attr('src',url+'/company/productPage?firmId='+firmId);
				  }
			  });
		});
	}
};
let myFind = new MyFind();
myFind.init();



//iframe自适应
function reinitIframe(){
	var iframe = document.getElementById("iframe");
	try{
	var bHeight = iframe.contentWindow.document.body.scrollHeight;
	var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
	var height = Math.max(bHeight, dHeight);
	$('#iframe').css({'height':height});
	console.log(height);
	}catch (ex){}
}
// iframe切换
$(function(){
	$('#navbar li').on('click',function(){
		console.log($(this).attr('data-id'));
		let id = $(this).attr('data-id');
		let dom = $('#iframe');
		if(id == 1){
			dom.attr('src',url+'/company/companyInfo?firmId='+firmId);
			dom.css({'height':'959px'});
		}else if(id == 2){
			dom.attr('src',url+'/company/offerManage?firmId='+firmId);
			dom.css({'height':'600px'});
		}else if(id == 3){
			dom.attr('src',url+'/company/publishOffer?firmId='+firmId);
			dom.css({'height':'900px'});
		}else if(id == 4){
			dom.attr('src',url+'/company/collectManage?firmId='+firmId);
			dom.css({'height':'600px'});
		}else if(id == 5){
			dom.attr('src',url+'/company/receiveResume?firmId='+firmId);
			dom.css({'height':'600px'});
		}else if(id == 6){
			dom.attr('src',url+'/company/companyAccount?firmId='+firmId);
			dom.css({'height':'600px'});
		}else if(id == 7){
			dom.attr('src',url+'/company/productPage?firmId='+firmId);
			dom.css({'height':'600px'});
		}
		$(this).addClass('navbar-active');
		$(this).siblings().removeClass('navbar-active');
	})
})