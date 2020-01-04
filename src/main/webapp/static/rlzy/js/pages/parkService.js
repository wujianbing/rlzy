let id = "1";


function ParkService(){
	
}
let self ="";
ParkService.prototype = {
		
	init: function(){
		parkService.bind();
	},
	bind: function(){
		self = this;
		$('.service-tab>div').bind('click',self.service_tab);
		$('.service-ul>li').bind('click',self.service_data);
	},
	service_tab: function(){
		let i = $(this).index();
		let text = $(this).text();
		$('#service_tit').attr('class','bg'+(i+1)+'-h');
		$('#service_tit').text(text);
		$('.service-c-v').show();
		$('.iframe').hide();
		$('.iframe').attr('src','');
		id = $(this).attr("data-id");
		$.ajax({
			url : url+"/home/parkList?id=" + id + "&page=1&pageSize=10",
			type : "get",
			success : function(data) {
				let list = data.list;
				let arrs = new Array();
					arrs.push('<ul class="service-ul">');
					if(list != undefined){
						for (var i = 0; i < list.length; i++) {
							var time = new Date(list[i].createDate).format("yyyy-MM-dd")
							arrs.push('<li data-cid="'+list[i].id+'" class="service-lst">');
							arrs.push('<div class="service-c-right">');
							arrs.push('<div class="name-top">');
							arrs.push('<div class="name-img-v"><img class="name-img" src="'+list[i].logo+'"/></div>');
							arrs.push('<div>');
							arrs.push('<div class="name-tit">'+list[i].companyname+'</div>');
							arrs.push('<div class="name-deta">'+time+' 入驻</div>');
							arrs.push('</div>');
							arrs.push('</div>');
							arrs.push('<div class="name-cont">');
							arrs.push(''+list[i].companyprofile);
							arrs.push('</div>');
							arrs.push('</div>');
							arrs.push('<div class="service-c-left">');
							arrs.push('<div><img src="' + list[i].casepic + '"/></div>');
							arrs.push('<div><img src="' + list[i].spe3 + '"/></div>');
							arrs.push('</div>');
							arrs.push('</li>');
						}
					}
				arrs.push('</ul><div class="pages-v"><div id="pages"></div></div>');
				let html = arrs.join('');
				$(".service-c-v").children().remove();
				$(".service-c-v").html(html);
				$('.service-tab>div').unbind('click',self.service_tab);
				$('.service-ul>li').unbind('click',self.service_data);
				parkService.init();
				 page(id,data.count);
			}
		});
	},
	 service_data: function(){
		$(this).parent().parent().hide();
		console.log($(this).attr("class"));
		$('.iframe').show();
		let cid = $(this).attr("data-cid");
		$('.iframe').attr('src',url+'/home/parkSeverDate?id='+cid);
	}
}
var parkService = new ParkService();
parkService.init();

//js时间格式化
Date.prototype.format = function(fmt) { 
 var o = { 
    "M+" : this.getMonth()+1,                 //月份 
    "d+" : this.getDate(),                    //日 
    "h+" : this.getHours(),                   //小时 
    "m+" : this.getMinutes(),                 //分 
    "s+" : this.getSeconds(),                 //秒 
    "q+" : Math.floor((this.getMonth()+3)/3), //季度 
    "S"  : this.getMilliseconds()             //毫秒 
}; 
if(/(y+)/.test(fmt)) {
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
}
 for(var k in o) {
    if(new RegExp("("+ k +")").test(fmt)){
         fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
     }
 }
return fmt; 
}