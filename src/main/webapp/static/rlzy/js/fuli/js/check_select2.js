$(function(){
	oliDelete();			
	//定义一个存储数据的数组，用于下面重复选择判断，删除标签
	var oliIdArray = [];
			
	//点击输入框时候
	$(".selectBox").on("click",function(event){
		//document.getElementById("qyful").style.display="none";
		$(".divp").toggle();//ul弹窗展开
		$(".selectUl").toggle();//ul弹窗展开
//		myJobwant.iframH('#app','iframe');
//		myJobwant.iframH('#app','iframe');
		$(this).next().toggleClass("fa-caret-up")//点击input选择适合，小图标动态切换
		if($(this).next().hasClass("fa-caret-down")){
			$(this).next().removeClass("fa-caret-down").addClass("fa-caret-up")//点击input选择适合，小图标动态切换
		}else{
			$(this).next().addClass("fa-caret-down").removeClass("fa-caret-up")//点击input选择适合，小图标动态切换
		}
		if (event.stopPropagation) {   
        	// 针对 Mozilla 和 Opera   
        	event.stopPropagation();   
        }else if (window.event) {   
        	// 针对 IE   
        	window.event.cancelBubble = true;   
        }  
	});
	
	//点击右边箭头icon时候
	$(".selectBox .fa").on("click",function(event){
		//document.getElementById("qyful").style.display="none";
		$(".divp").toggle();//ul弹窗展开
		$(".selectUl").toggle();//ul弹窗展开
//		myJobwant.iframH('#app','iframe');
		if($(this).hasClass("fa-caret-down")){
			$(this).removeClass("fa-caret-down").addClass("fa-caret-up")//点击input选择适合，小图标动态切换
		}else{
			$(this).addClass("fa-caret-down").removeClass("fa-caret-up")//点击input选择适合，小图标动态切换
		}
		if (event.stopPropagation) {   
        	// 针对 Mozilla 和 Opera   
        	event.stopPropagation();   
        }else if (window.event) {   
        	// 针对 IE   
        	window.event.cancelBubble = true;   
        }  
	});
	
	
	$(".selectUl li").click(function(event){
		event=event||window.event; 
		$(this).addClass("actived_li");//点击当前的添加   actived_li这个类；
		var oliId = $(this).attr("oliId");
		if(oliIdArray.indexOf(oliId)>-1){
			
		}else{
			oliIdArray.push(oliId);
			$(this).parent().prev().children().attr("oliId",oliIdArray);//把当前点击的oliId赋值到显示的input的oliId里面
			$("#role_select").append("<span class='person_root'><span data-id=\'"+oliId+"\'>"+$(this).text()+"</span><i class='close' oliId='" + oliId + "' >x</i></span>");
		}
		console.log(oliIdArray)
		$("#data").val(oliIdArray);
		var s = $("#data").val();
		console.log(s);
		oliDelete();
	    
	    
	});
	
	function oliDelete(){
		//进行绑定事件，每个删除事件得以进行
		var role_select = document.getElementById("role_select");
    	var role_span= role_select.getElementsByTagName('i');
    	var id;
    	//console.log("span的选择个数"+role_span.length)l
    	for(var i=0;i<role_span.length;i++){  
	        role_span[i].onclick = function(){ 
	        		$(".selectUl").hide();//当点击空白处，隐藏ul弹窗
				$(".divp").hide();//当点击空白处，隐藏ul弹窗
//			myJobwant.iframH('#app','iframe');
	        	var oliId = $(this).attr("oliId");
	        	//console.log("oliId"+oliId)
	            for (var i = 0; i < oliIdArray.length; i++){
			        if (oliIdArray[i] === oliId){ //表示数组里面有这个元素
			            id = i;//元素位置
			            oliIdArray.splice(i,1);
			            console.log('删除当前的序号'+oliId+';'+'剩下数组'+oliIdArray);
			            console.log(oliIdArray);
			        }
			    }
				$(".selectUl li").eq(oliId-1).removeClass("actived_li");
				$(this).parent().remove();
		    }  
	    }  
	}
	
	//点击任意地方隐藏下拉
	$(document).click(function(event){
		event=event||window.event; 
		$(".inputCase .fa").removeClass("fa-caret-up").addClass("fa-caret-down")//当点隐藏ul弹窗时候，把小图标恢复原状
		//$(".selectUl").hide();//当点击空白处，隐藏ul弹窗
		//document.getElementById("qyful").style.display="block";
	});
	
})
  
	//点击任意地方隐藏下拉
	$(".qudi").click(function(event){
		$(".selectUl").hide();//当点击空白处，隐藏ul弹窗
		$(".divp").hide();//当点击空白处，隐藏ul弹窗
})