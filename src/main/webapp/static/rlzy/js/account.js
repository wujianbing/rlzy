var m1 = new MyModal.modal(function() {
});
$('.UntyinPhone').on("click", function() {
	m1.show();
	$(function(){
		var valphone=$("#oldphone").val();
		$("#newphone").val(valphone);
		 console.log(valphone)
	})
});
var bool=true;	
   function count(id){
	//获取手机号
	var phone = document.getElementById("oldphone").value;  
	//验证码获取 TODO
	$.get(url+"/home/sendSms?phone="+phone);
    if(bool==true){
	var lab = $(id);
    var count=60;
    var time=setInterval(function() {
    	bool=false;
    	count--;
    	lab.text(count+"秒");
    	if(count==0){
    		clearInterval(time);
    		lab.text('重新获验证码');
    		bool=true;
    	};
    }, 1000);
    }
    if(bool==false){
     return false;
    }
   };
   //取消解绑手机的函数
   function qyxjibang(){
	   $('.box2').css("display","none")
   }
   //取消修改密码的操作
   function qxma(){
	   $('.box3').css("display","none")
   }
   //点击修改密码后的操作
   function xgma(){
	   $('.box3').css("display","block")
   }
   //点击解绑手机提交验证码后输入新手机号出现
   function xgphone(){
	   //校验验证码
	   var code = document.getElementById("yzcode").value;  
	   $.ajax({
	        type: "POST",
	        url: url+"/home/checkSms",
	        data: {"code":code},
	        success: function(data){
	        	if(data[0] == "0"){
	        		layui.use('layer', function(){
						  var layer = layui.layer;
						  //layer.msg('您已收藏！');
						  layer.alert('验证码错误！', {
						  skin: 'layui-layer-molv' //样式类名
						  ,closeBtn: 0
						}, function(){
						  layer.alert('请重新输入！', {
						    skin: 'layui-layer-lan'
						    ,closeBtn: 0
						    ,anim: 4 //动画类型
						    ,success: function(layero){
					    		return false;
						      }
						  });
						});
					}); 
	        	}else{
	        		 m1.hide();
	        		 $('.box2').css("display","block");
	        		 return false;
	        	}
	    	}
	    });
   };	
   
    $(function(){
        $("#psw_ag").blur(function(){
             if($("#psw").val()!=$("#psw_ag").val()){
				layer.msg('两次输入的密码不一致'); 
             }else{
				$("#t1").click(function(){
					var id = $("#inp").val();
					var pw = $("#psw").val();
				    $.get(url+"/company/accountPassword?id="+id+"&pw="+pw,function(data){
				    	if(data == "1"){
				    		$('.box3').css("display","none");
				    		layui.use('layer', function(){
								  var layer = layui.layer;
								  //layer.msg('您已收藏！');
								  layer.alert('您已修改密码！', {
								  skin: 'layui-layer-molv' //样式类名
								  ,closeBtn: 0
								}, function(){
								  layer.alert('密码修改成功！', {
								    skin: 'layui-layer-lan'
								    ,closeBtn: 0
								    ,anim: 4 //动画类型
								    ,success: function(layero){
								    	parent.MyFind.prototype.tab1Href();
							    		return false;
								      }
								  });
								});
							});
				    	}
				    })
				});
			}
         })
    })

    $('#phone').blur(function(){
    	var phone = $('#phone').val();
    	var message = "";
    	var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;
    	if (phone == '') {
    		layer.msg("手机号码不能为空！");
    		return false;
    	} else if (phone.length != 11) {
    		layer.msg("请输入有效的手机号码！");
    		return false;
    	} else if (!myreg.test(phone)) {
    		layer.msg("请输入有效的手机号码！");
    		return false;
    	}
   });
$("#t2").click(function(){
	
	//校验验证码
	   var code = document.getElementById("yzcode2").value;  
	   $.ajax({
	        type: "POST",
	        url: url+"/home/checkSms",
	        data: {"code":code},
	        success: function(data){
	        	if(data[0] == "0"){
	        		layer.msg('验证码错误!'); 
	        		return false;
	        	}else{
	        		var id = $("#inp2").val();
	        		var phone=$("#phone").val();
	        		$.get(url+"/company/accountPhone?id="+id+"&phone="+phone,function(data){
	        			if(data == "1"){
	        				$('.box2').css("display","none")
	        				layui.use('layer', function(){
								  var layer = layui.layer;
								  //layer.msg('您已收藏！');
								  layer.alert('您已修改手机号！', {
								  skin: 'layui-layer-molv' //样式类名
								  ,closeBtn: 0
								}, function(){
								  layer.alert('手机号修改成功！', {
								    skin: 'layui-layer-lan'
								    ,closeBtn: 0
								    ,anim: 4 //动画类型
								    ,success: function(layero){
								    	parent.MyFind.prototype.tab1Href();
							    		return false;
								      }
								  });
								});
							});
	        			}
	        		});
	        	}
	    	}
	    });	
});