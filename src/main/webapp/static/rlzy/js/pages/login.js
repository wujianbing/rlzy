function Login(){
	
}
Login.prototype = {
	init: function(){
		login.bind();
		unti.contH('#sign_v');
	},

	bind: function(){
		$('.sign-top>div').click(function(){
			let i = $(this).index();
			//console.log(i);
			$('.layui-form').eq(i).show();
			$('.layui-form').eq(i).siblings().hide();
			$(this).addClass('sign-activ');
			$(this).siblings().removeClass('sign-activ');
		})
		
		$('#phone').blur(function(){
			//手机失去焦点判断
			unti.checkPhone('#phone');
		});
		$('#yzm_bnt').click(function(){
			//验证码倒计时
			if(unti.checkPhone('#phone')){
				unti.countDown('#yzm_bnt');
			}
		})
	}
}

let login = new Login();
login.init();
