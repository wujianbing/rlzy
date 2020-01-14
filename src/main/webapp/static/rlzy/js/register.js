
function Login(){
	
}
Login.prototype = {
		init: function(){
			login.bind();
			unti.contH('#body');
		},

	bind: function(){
		$('#num').blur(function(){
			//手机失去焦点判断
			 unti.checkPhone('#num');
			
		});
		$('#yzm').click(function(){
				if(check_bool){
					unti.countDown('#yzm');
				}
		})
	}
}

let login = new Login();
login.init();
