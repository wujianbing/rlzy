
function MyJobwant(){
	
}
MyJobwant.prototype = {
	init: function(){

		myJobwant.bind();
		myJobwant.iframH('#app','iframe');
	},

	bind: function(){
	
		$(".lastfuli").on('click',function(){
		 $(".fuli").toggle();
		 
		 myJobwant.iframH('#app','iframe');
//		 parent.MyFind.prototype.height1();
		})
		$(".shouq").on('click',function(){
		 $(".fuli").toggle()
//		 parent.MyFind.prototype.height1();
		 myJobwant.iframH('#app','iframe');
		})
	},
	iframH: function(app,iframe){
			console.log(1);
			setTimeout(function(){
				//父页面iframe高度
				var apph = $(app).outerHeight();
				let parIframe = window.parent.document.getElementById(iframe);
				//console.log(apph);
				$(parIframe).css({'height':apph});
			},300);
		},
	}
var myJobwant = new MyJobwant();
myJobwant.init();

//手机号码验证
function check(){
	var phone=$('#phone').val();
	console.log(phone);
	var myreg = /^(((13[0-9]{1})|(14[0-9]{1})|(17[0]{1})|(15[0-3]{1})|(15[5-9]{1})|(18[0-9]{1}))+\d{8})$/;       
	if(phone == ''){
	layer.msg('手机号码不能为空！'); 
	return false;
}else if(phone.length !=11){
	layer.msg('请输入有效的手机号码！'); 
	return false;
}else if(!myreg.test(phone)){
	layer.msg('请输入有效的手机号码！');
	return false;
	}
};

//文本框的字数限制以及自动调整高度
var Huitextarealength = function (obj){
	
var html = $(obj).parent();
var tatal = html.find('am').html();
var sets = $(obj).val().length;

if(sets*1>tatal*1){
    var str = '<div style="width: auto;position: absolute; right: 4%;color: red;">内容超出限制</div>';
    $(obj).after(str);
    html.find('em').css({color:'red'});
}else {
    $(obj).parent().find('div').remove();
    html.find('em').css({color:'black'});
		$("#123d").autoHeight();

	
}
//设置已输入数量
html.find('em').html(sets);
}

$.fn.autoHeight = function(){

function autoHeight(elem){
	elem.style.height = 'auto';
	elem.scrollTop = 0; //防抖动
	elem.style.height = elem.scrollHeight + 'px';
	
}

this.each(function(){
	autoHeight(this);
	$(this).on('keyup', function(){
		autoHeight(this);
		myJobwant.iframH('#app','iframe');	

	});
});

}