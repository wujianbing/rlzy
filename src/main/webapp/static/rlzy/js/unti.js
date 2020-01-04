let unti = {
	contH: function(id){
		let domH = $(document).height();
		let navH = $('#nav').outerHeight() + $('#tail').outerHeight(true);   
		//console.log(domH,navH)
		$(id).css('height',domH-navH+'px');
	},
	checkPhone: function(id) {
		let _phone = $(id).val();
		if (!(/^1[3|4|5|6|7|8|9][0-9]\d{8}$/.test(_phone))) {
			let html = '';
			html += '<span class="test-span">请输入正确的手机号！</span>';
			$(id).parent().append(html);
			return false;
		}else{
			return true;
		}
	},
	countDown: function(id) {
		console.log(id);
		var bool = true;
		if (bool == true) {
			console.log(bool);
			var count = 60;
			$(id).attr('disabled',true);
			$(id).addClass('notclick');
			var time = setInterval(function() {
				bool = false;
				console.log(count);
				count--;
				$(id).html(count + "秒后重新获取");
				if (count == 0) {
					console.log(count);
					clearInterval(time);
					$(id).html('重新获验证码');
					$(id).attr('disabled',false);
					$(id).removeClass('notclick');
					bool = true;
				};
			}, 1000);
		}
		if (bool == false) {
			return false;
		}
	}

}
