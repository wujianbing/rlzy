function LookFor(){
	this.valObj = {};
}
LookFor.prototype = {
	
	init: function(){
		lookFor.bind();
	},
	bind: function(){
		let self = this;
		//增加选项
		$('.sxl ul li').bind('click',self.inputVal_fuc);
		//删除选项
		$('.lsp .layui-icon-close').bind('click',self.delVal_fuc);
	},
	inputVal_fuc: function(){
		let self = this;
		//console.log(this);
		let text = $(this).find('a').attr('data-value');
		if(text == "0"){
			text="";
		}
		let id = $(this).parent().prev().attr('data-id');
		console.log(text,id);
		let key='';
		if(id == 1){
			key = 'salary';
			lookFor.valObj[key] = text;
		}else if(id == 2){
			key = 'industry';
			lookFor.valObj[key] =text;
		}else if(id == 3){
			key = 'major';
			lookFor.valObj[key] = text;
		}else if(id == 4){
			key = 'sex';
			lookFor.valObj[key] = text;
		}else if(id == 5){
			key = 'worknature';
			lookFor.valObj[key] = text;
		}else if(id == 6){
			key = 'education';
			lookFor.valObj[key] = text;
		}else if(id == 7){
			key = 'workingage';
			lookFor.valObj[key] = text;
		}else if(id == 8){
			key = 'utime';
			lookFor.valObj[key] = text;
		}
		console.log(lookFor.valObj);
		reload (lookFor.valObj);
	},
	delVal_fuc: function(){
		$(this).parent().css("display", "none");
		let id = $(this).parent().attr('data-id');
		console.log(id);
		if(id == 1){
			delete(lookFor.valObj['salary']);
		}else if(id == 2){
			delete(lookFor.valObj['industry']);
		}else if(id == 3){
			delete(lookFor.valObj['major']);
		}else if(id == 4){
			delete(lookFor.valObj['sex']);
			console.log(lookFor.valObj);
		}else if(id == 5){
			delete(lookFor.valObj['worknature']);
		}else if(id == 6){
			delete(lookFor.valObj['education']);
		}else if(id == 7){
			delete(lookFor.valObj['workingage']);
		}else if(id == 8){
			delete(lookFor.valObj['utime']);
		}
		console.log(lookFor.valObj);
		reload (lookFor.valObj);
	}
}
var lookFor = new LookFor();
lookFor.init();
	//点击下拉选择框的时候，对应下面的标签框内容出现，当成功选择后，标签内容改变
	function reload (rlzyUser){
		$.ajax({
			type: 'post',
			data : JSON.stringify(rlzyUser),
			url: urls+"?page=1&pageSize=10",
			contentType: "application/json;charset=utf-8",
			success:function(data){
				let arr = new Array();
				arr.push('<div class="yuleft">');
				arr.push('<ul class="alljob" id="ul1">');
	 			for(var i=0;i<data.length;i++){
	 				var time = new Date(data[i].createDate).format("yyyy-MM-dd")
	 				arr.push('<li>');
	 				arr.push('<div class="infoname">');
	 				arr.push('<h5><span class="lefth5"><span class="nameb">'+data[i].desiredindustry+'</span></span>')
					arr.push('<span class="lefth5">');
	 				arr.push('<span>'+data[i].name+'</span>&emsp;&emsp;');
	 				arr.push('</span>');
	 				arr.push('<span class="lefth5">');
	 				arr.push('<span>'+data[i].liveplace+'</span>&emsp;&emsp;');
					arr.push('</span>');
					arr.push('<span class="lefth5 righth5">');
					arr.push('发布时间：<span>'+time+'</span></span></h5>');
					arr.push('<div class="bot">');
					arr.push('<div class="imgntitle">')
					arr.push('<img src='+data[i].photo+' />')
					arr.push('</div>')
					arr.push('<div class="letbot">');
					arr.push('<p class="infopname1">');
					arr.push('<span class="sitename">'+data[i].desiredposition+'</span>');
					arr.push('<span class="sitename">'+data[i].sex+'</span>');
					arr.push('<span class="sitename">'+data[i].age+'<span>岁</span></span>');
					arr.push('<span class="sitename">'+data[i].education+'</span>');
					arr.push('<span class="sitename">'+data[i].workingage+'</span>');
					arr.push('</p>');
					arr.push('<p class="infopname1">');
					arr.push('<span class="sitename">'+data[i].major+'</span>');
					arr.push('<span class="sitename">'+data[i].currentstate+'</span>');
					arr.push('<span class="sitename">'+data[i].worknature+'</span>');
					arr.push('<span class="sitename">'+data[i].salary+'</span>');
					arr.push('</p>');
					arr.push('<p class="infopname2">');
					arr.push('<span class="sitename2">自我介绍：<span>'+data[i].selfdescription+'</span></span>');
					arr.push('</p>');
					arr.push('</div>');
					arr.push('<div class="rightbot">');
					arr.push('<a href="#"><span class="btnlock tdjl ckjl" onclick="javascript:window.open(\'/rlzy/talent/talentDetails?id=' + data[i].id + '\')">查看简历</span></a>');
					arr.push('<span class="btnlock sqzw sc" onclick="ac(this)"  id="sc" data-user="' + data[i].id + '"><span class="layui-icon layui-icon-rate-solid"></span>收&ensp;藏</span>');		
					arr.push('</div>');			
					arr.push('</div>');	
					arr.push('</div>');
					arr.push('</li>');				  
	 			}
					arr.push('</ul>');
					arr.push('</div>');
					arr.push('<div class="paging-v">');
					arr.push('<div id="paging" class="paging"></div>');
	 			let html = arr.join('');
	 			$(".yuqbottom2").children().remove();
	 			$(".yuqbottom2").html(html);
	 			//console.log(data[0]);
	 			if(data[0] != undefined || data[0] != null){
	 				var count = data[0].spe3;
		 			 pages(count);
	 			}else{
	 				$('#ul1').html('抱歉，未查询到数据！');
	 				$('#ul1').css({'text-align':'center','line-height':'50px','font-size':'15px','color':'#7b7474'});
	 			}
	 			
			}
		});
		}
	 
	$('.gz0 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt1").css("display", "block");
		$('#yxgz1').html(s);
		
	}); 
		      
	$('.gz1 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt2").css("display", "block");
		$('#yxgz2').html(s);
	});



	$('.gz3 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt4").css("display", "block");
		$('#yxgz4').html(s);
	});

	$('.gz4 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt5").css("display", "block");
		$('#yxgz5').html(s);
	});
	$('.gz5 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt6").css("display", "block");
		$('#yxgz6').html(s);
	});
	$('.gz6 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt7").css("display", "block");
		$('#yxgz7').html(s);
	});
	$('.gz7 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt8").css("display", "block");
		$('#yxgz8').html(s);
	});
	
	$('.gz8 li').on("click", function() {
		var s=$(this).text();
		console.log(s);
		$(".appendt3").css("display", "block");
		$('#yxgz3').html(s);
	});
	
	

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