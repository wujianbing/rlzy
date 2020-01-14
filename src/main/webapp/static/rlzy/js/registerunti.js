let check_bool = false;
let unti = {
	contH: function(id){
		let domH = $(document).height();
		let navH = $('#nav').outerHeight() + $('#tail').outerHeight(true);   
		$(id).css('height',domH-navH+'px');
	},
	checkPhone: function(id) {
		console.log(id);
		let _phone = $(id).val();
		if (!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test(_phone))) {
			$("#phone").remove();
			let html = '';
			html += '<span id="phone" class="test-span">请输入正确的手机号！</span>';
			$(id).parent().append(html);
			check_bool = false;
			return false;
		}else{
			$.ajax({
				type : "POST",
				url : "/rlzy/home/check",
				data : {"phone" : _phone},
				async:false, 
				success : function(data) {
					if (data == "2") {
						$("#phone").remove();
						let html = '';
						html += '<span id="phone" class="test-span">手机号已经注册过，请登录！</span>';
						$(id).parent().append(html);
						check_bool = false;
						return false;
					} else {
						var phone =document.getElementById("phone")
						if(phone!=null){
							document.getElementById("phone").style.display="none";
						}
						check_bool=true;
						return true;
					}
				}

			});
		}
	},
	countDown: function(id) {
		var bool = true;
		var phone = document.getElementById("num").value; //获取手机号
		//验证码获取 TODO
		$.get("/rlzy/home/sendSms?phone="+phone);
		if (bool == true) {
			var lab = document.getElementById('yzm');
			var count = 60;
			var time = setInterval(function() {
				bool = false;
				count--;
				lab.innerHTML = count + "秒";
				if (count == 0) {
					clearInterval(time);
					lab.innerHTML = '重新获验证码';
					bool = true;
				}
				;
			}, 1000);
		}
		if (bool == false) {
			return false;
		}
	}

}
