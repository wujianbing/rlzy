function ParkServiceData(){
	
}
ParkServiceData.prototype = {
	init: function(){
		parkServiceData.bind();
	},
	bind: function(){
		parkServiceData.iframH('#iframe');
	},
	iframH: function(iframe){
		setTimeout(function(){
			//父页面iframe高度
			var apph = $('html').outerHeight();
			let parIframe = $(window.parent.document).find("#iframe")
			console.log(apph,parIframe);
			$(parIframe).css({'height':apph});
		},300);
	},
	
}
var parkServiceData = new ParkServiceData();
parkServiceData.init();