function Index(){
	
}

Index.prototype = {
	init: function(){
		index.get();//自执行
		index.bind();//点击事件
	},
	get: function(){
		let self = this;
		//banner轮播
		//self.carousel();
		//获取localStorage
		index.user = JSON.parse(localStorage.getItem('user'));
	},
	bind: function(){
		let self = this;
		//招
		$('#recruit').bind('click',self.jobWant_fuc);
		//投
		$('#throw').bind('click',self.jobWant_fuc)
	},
	jobWant_fuc: function(){
		let dataId = $(this).attr('data-id');
		let dom = $('#'+$(this).attr('id'));
		if(dataId === '1'){
			//招
			dom.attr('href',url+'/talent/talentList');
		}else{
			//投
			dom.attr('href',url+'/position/positionList');
		}
	},
	
}
var index = new Index();
index.init();

$('.ruzhu-v a').hover(function(){
	$(this).find('.qycont').slideToggle();
})