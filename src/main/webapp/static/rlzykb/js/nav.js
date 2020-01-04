function Nav(){
	
}
Nav.prototype = {
	init: function(){
		nav.navGet();
	},
	navGet: function(){
		nav.heard();
		//获取本地时间
		setInterval(function() {
			nav.time();
		}, 1000)
	},
	heard: function(){
		let html = '';
		html += '<div id="tit_v" class="tit-v">';
		html += '<div class="tit-bg">';
		html += '<div class="tit">';
		html += '<a href="/rlzy/data/numCompany" class="tit-span">公司</a>';
		html += '<a href="/rlzy/data/index" class="title">吴忠市人力资源产业园大数据看板</a>';
		html += '<a href="/rlzy/data/numPerson" class="tit-span">人员</a>';
		html += '</div>';
		html += '<div id="newtime" class="time"></div>';
		html += '</div>';
		html += '</div>';
		$('#app').prepend(html);
	},
	time: function(){
		var newtime = new Date(+new Date() + 8 * 3600 * 1000).toISOString().replace(/T/g, ' ').replace(/\.[\d]{3}Z/, '');
		//console.log(newtime);
		$('#newtime').html(newtime);
	}
}
let nav = new Nav();
nav.init();

$(document).ready(function() {
	var stars = 1000; /*星星的密集程度，数字越大越多*/
	var $stars = $(".stars");
	var r = 800; /*星星的看起来的距离,值越大越远,可自行调制到自己满意的样子*/
	for (var i = 0; i < stars; i++) {
		var $star = $("<div/>").addClass("star");
		$stars.append($star);
	}
	$(".star").each(function() {
		var cur = $(this);
		var s = 0.2 + (Math.random() * 1);
		var curR = r + (Math.random() * 300);
		cur.css({
			transformOrigin: "0 0 " + curR + "px",
			transform: " translate3d(0,0,-" + curR + "px) rotateY(" + (Math.random() * 360) + "deg) rotateX(" + (Math.random() *
				-50) + "deg) scale(" + s + "," + s + ")"

		})
	})
})