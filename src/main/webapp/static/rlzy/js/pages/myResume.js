
	
	function MyFind(){
		
	}
	MyFind.prototype = {
		init: function(){
			myFind.bind();
			//ifram高度自适应
			myFind.iframH('#app','iframe');
		},
		bind: function(){
			let self = this;
			//信息修改
			$('.revise').bind("click",function(){
				myFind.revise($(this).attr('data-id'));
			});
			//自我描述
			$('#decs_btn').on('click',self.decs_fuc);
			//教育经历
			$('#teach_btn').on('click',self.teach_fuc);
			//工作经历
			$('#job_btn').on('click',self.job_fuc);
			//培训经历
			$('#train_btn').on('click',self.train_fuc);
			//证书经历
			$('#certi_btn').on('click',self.certi_fuc);
		},
		revise: function(id){
			//console.log(id);
			if(id == 1){//基本信息修
				dom = "#basic_info";
			}else if(id == 2){//求职意向
				dom = "#job_want";
			}else if(id == 3){//自我描述
				$('.wordmy').slideToggle(300);
			}else if(id == 4){//教育经历
				$('.teach').slideToggle(300);
			}else if(id == 5){//工作经历
				$('.job').slideToggle(300);
			}else if(id == 6){//培训经历
				$('.train').slideToggle(300);
			}else if(id == 7){//证书时间
				$('.certi').slideToggle(300);
			}else if(id == 8){//附件
				$('.file').slideToggle(300);
			}
			if(id == 1){
				$(dom).find(".form-control").removeClass("gname");
				$(dom).find(".form-control").attr('disabled',false);
				// $(dom).find(".form-control").css({'width':'200px'});
				$(dom).find(".acp").css({'width':'49%'});
			}else if(id == 2){
				$(dom).find(".form-control").removeClass("gname");
				$(dom).find(".form-control").attr('disabled',false);
				// $(dom).find(".form-control").css({'width':'200px'});
				$(dom).find(".acp").css({'width':'49%'});
			}
			//ifram高度自适应
			myFind.iframH('#app','iframe');
			
		},
		//ifram高度自适应
		iframH: function(app,iframe){
			setTimeout(function(){
				//父页面iframe高度
				var apph = $(app).outerHeight();
				let parIframe = window.parent.document.getElementById(iframe);
				//console.log(apph);
				$(parIframe).css({'height':apph});
			},300);
		},
		//自我描述
		decs_fuc: function(){
			let txtDom = $(this).parent().siblings().children();
			if(txtDom.val() ==''){
				layer.msg("不能为空");
				return;
			}
			$(this).parent().parent().parent().slideToggle(300);
			$("#decs_txt").html(txtDom.val());
		},
		//教育经历提交
		teach_fuc: function(){
			//表单
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(formTeach)', function(data) {
					let res = data.field;
					$.ajax({
				        type:"post",
				        url:url+"/user/saveResume",
				        data:res,
				        success:function(data){
				        	if(data=='success'){
				        		let studyTime1 = res.startdate.substring(0,7);
								let studyTime2 = res.enddate.substring(0,7);
								let d1 = new Date(res.startdate).getTime();
								let d2 = new Date(res.enddate).getTime();
								if(d2 - d1 < 0){
									layer.msg('结束时间不能小于开始时间');
									return false;
								}
								let days = Math.floor((d2-d1)/(24*3600*1000));
								let years = Math.floor(days/365);
								let yearsF = '0.'+(days/365).toString().replace(/\d+\.(\d*)/,"$1");
								let months = Math.round(yearsF*365/31);
								let education=res.education;
								if(education=="1"){
									education="不限";
								}else if(education=="2"){
									education="初中";
								}else if(education=="3"){
									education="高中";
								}else if(education=="4"){
									education="大专";
								}else if(education=="5"){
									education="本科";
								}else if(education=="6"){
									education="硕士";
								}else if(education=="7"){
									education="博士";
								}
								let html = '';
								html += '<li class="layui-timeline-item">';
								html += '<i class="layui-icon layui-timeline-axis"></i>';
								html += '<div class="layui-timeline-content layui-text timeline-flex">';
								html += '<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1">'+studyTime1+'</span>至<span class="studyTime2">'+studyTime2+'</span>【<span class="years">'+years+'</span>年<span class="months">'+months+'</span>月】</h3>';
								html += '<h3 data-id="'+res.id+'" class="layui-timeline-title rev-teach2 layui-timeline-mar">'+education+'</h3>';
								html += '<h3 class="layui-timeline-title rev-teach3 layui-timeline-mar">'+res.name+'</h3>';
								html += '<h3 class="layui-timeline-title rev-teach4 layui-timeline-mar">'+res.major+'</h3>';
								html += '<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.teachRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>';
								html += '</div>';
								html += '</li>';
								if(myFind.rev_id == 1){
									let revObj = $('#timeline_teach .rev').parent().parent();
									revObj.find('.rev-teach1 span:nth-child(1)').text(studyTime1);
									revObj.find('.rev-teach1 span:nth-child(2)').text(studyTime2);
									revObj.find('.rev-teach1 .years').text(years);
									revObj.find('.rev-teach1 .months').text(months);
									revObj.find('.rev-teach2').text(education);
									revObj.find('.rev-teach3').text(res.name);
									revObj.find('.rev-teach4').text(res.major);
									myFind.rev_id = 0;
									$('#timeline_teach .rev-id').removeClass('rev');
									
								}else{
									$('#timeline_teach').append(html);
								}
								$('.teach').slideUp(300);
								return false;
				        	}
				        }
				    });
					return false;
				});
			});
		},
		//教育经历修改
		teachRe: function(obj){
			$(obj).addClass('rev');
			$(obj).attr('data-id',1);
			$('#timeline_teach .rev').siblings().attr('data-id','');
			myFind.rev_id = $(obj).attr('data-id');
			let res = $(obj).parent().parent().children();
			let time1 = res.eq(0)[0].innerText.substring(0,7)+"-01";
			let time2 = res.eq(0)[0].innerText.substring(8,15)+"-01";
			let id = $(res.eq(1)[0]).attr('data-id');
			$('.teach').slideDown(300);
			layui.use('form', function(){
				var form = layui.form;
				//console.log(res);
				form.val("teach-from", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
				  "education": res.eq(1)[0].innerText // "name": "value"
				  ,"name": res.eq(2)[0].innerText
				  ,"major": res.eq(3)[0].innerText
				  ,"startdate": time1
				  ,"enddate": time2,
				  "id":id
				});
				return false;
			});
			//ifram高度自适应
			myFind.iframH('#app','iframe');
		},
		//删除
		teachDel: function(obj){
			let res = $(obj).parent().parent().children();
			let id = $(res.eq(1)[0]).attr('data-id');
			$.ajax({
		        type:"POST",
		        url:url+"/user/delResume",
		        data: "id=" + id, 
		        success:function(data){
		        	if (data == "success") {
		        		$(obj).parent().parent().parent().remove();
	                }
		        }
		    })
		},
		//工作经历提交
		job_fuc: function(){
			//表单
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(formJob)', function(data) {
					//layer.msg(JSON.stringify(data.field));
					//console.log(data.field);
					let res = data.field;
					$.ajax({
				        type:"POST",
				        dateType:"JSON",
				        url:url+"/user/saveResume",
				        data:res,
				        success:function(data){
				        	if(data=='success'){
				        		let studyTime1 = res.startdate.substring(0,7);
								let studyTime2 = res.enddate.substring(0,7);
								let d1 = new Date(res.startdate).getTime();
								let d2 = new Date(res.enddate).getTime();
								if(d2 - d1 < 0){
									layer.msg('结束时间不能小于开始时间');
									return false;
								}
								let days = Math.floor((d2-d1)/(24*3600*1000));
								let years = Math.floor(days/365);
								let yearsF = '0.'+(days/365).toString().replace(/\d+\.(\d*)/,"$1");
								//console.log(yearsF);
								let months = Math.round(yearsF*365/31);
								//console.log(months);
								let html = '';
								html += '<li class="layui-timeline-item">';
								html += '<i class="layui-icon layui-timeline-axis"></i>';
								html += '<div class="layui-timeline-content data-id layui-text timeline-flex">';
								html += '<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1">'+studyTime1+'</span>至<span class="studyTime2">'+studyTime2+'</span>【<span class="years">'+years+'</span>年<span class="months">'+months+'</span>月】</h3>';
								html += '<h3 data-id="'+res.id+'" class="layui-timeline-title rev-teach2 layui-timeline-mar">'+res.major+'</h3>';
								html += '<h3 class="layui-timeline-title rev-teach3 layui-timeline-mar">'+res.name+'</h3>';
								html += '<h3 class="layui-timeline-title rev-teach4 layui-timeline-mar ellipsis">'+res.describes+'</h3>';
								html += '<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.jobRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>';
								html += '</div>';
								html += '</li>';
								//console.log(myFind.rev_id);
								if(myFind.rev_id == 1){
									let revObj = $('#timeline_job .rev').parent().parent();
									revObj.find('.rev-teach3').text(res.name);
									revObj.find('.rev-teach2').text(res.major);
									revObj.find('.rev-teach1 span:nth-child(1)').text(studyTime1);
									revObj.find('.rev-teach1 span:nth-child(2)').text(studyTime2);
									revObj.find('.rev-teach1 .years').text(years);
									revObj.find('.rev-teach1 .months').text(months);
									revObj.find('.rev-teach4').text(res.describes);
									myFind.rev_id = 0;
									$('#timeline_job .rev-id').removeClass('rev');
								}else{
									$('#timeline_job').append(html);
								}
								$('.job').slideUp(300);
								return false;
				        	}
				        }
				    });
					return false;
				});
			});
		},
		//工作经历修改
		jobRe: function(obj){
			//console.log($(obj));
			$(obj).addClass('rev');
			$(obj).attr('data-id',1);
			$('#timeline_job .rev').siblings().attr('data-id','');
			myFind.rev_id = $(obj).attr('data-id');
			let res = $(obj).parent().parent().children();
			let time1 = res.eq(0)[0].innerText.substring(0,7)+"-01";
			let time2 = res.eq(0)[0].innerText.substring(8,15)+"-01";
			let id = $(res.eq(1)[0]).attr('data-id');
			$('.job').slideDown(300);
			layui.use('form', function() {
				var form = layui.form;
				form.val("job-from", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
				  "name": res.eq(2)[0].innerText // "name": "value"
				  ,"major": res.eq(1)[0].innerText
				  ,"describes": res.eq(3)[0].innerText
				  ,"studyTime1": time1
				  ,"studyTime2": time2,
				  "id":id
				});
				return false;
			});
			//ifram高度自适应
			myFind.iframH('#app','iframe');
		},
		//培训经历提交
		train_fuc: function(){
			//表单
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(formTrain)', function(data) {
					//layer.msg(JSON.stringify(data.field));
					//console.log(data.field);
					let res = data.field;
					$.ajax({
				        type:"POST",
				        dateType:"JSON",
				        url:url+"/user/saveResume",
				        data:res,
				        success:function(data){
				        	if(data=='success'){
				        		let studyTime1 = res.startdate.substring(0,7);
								let studyTime2 = res.enddate.substring(0,7);
								let d1 = new Date(res.startdate).getTime();
								let d2 = new Date(res.enddate).getTime();
								if(d2 - d1 < 0){
									layer.msg('结束时间不能小于开始时间');
									return false;
								}
								let days = Math.floor((d2-d1)/(24*3600*1000));
								let years = Math.floor(days/365);
								let yearsF = '0.'+(days/365).toString().replace(/\d+\.(\d*)/,"$1");
								//console.log(yearsF);
								let months = Math.round(yearsF*365/31);
								//console.log(months);
								let html = '';
								html += '<li class="layui-timeline-item">';
								html += '<i class="layui-icon layui-timeline-axis"></i>';
								html += '<div class="layui-timeline-content data-id layui-text timeline-flex">';
								html += '<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1">'+studyTime1+'</span>至<span class="studyTime2">'+studyTime2+'</span>【<span class="years">'+years+'</span>年<span class="months">'+months+'</span>月】</h3>';
								html += '<h3 data-id="'+res.id+'" class="layui-timeline-title rev-teach4 layui-timeline-mar ellipsis">'+res.major+'</h3>';
								html += '<h3 class="layui-timeline-title rev-teach2 layui-timeline-mar">'+res.name+'</h3>';
								html += '<h3 class="layui-timeline-title rev-teach3 layui-timeline-mar">'+res.describes+'</h3>';
								html += '<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.trainRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>';
								html += '</div>';
								html += '</li>';
								//console.log(myFind.rev_id);
								if(myFind.rev_id == 1){
									let revObj = $('#timeline_train .rev').parent().parent();
									revObj.find('.rev-teach1 span:nth-child(1)').text(studyTime1);
									revObj.find('.rev-teach1 span:nth-child(2)').text(studyTime2);
									revObj.find('.rev-teach1 .years').text(years);
									revObj.find('.rev-teach1 .months').text(months);
									revObj.find('.rev-teach2').text(res.major);
									revObj.find('.rev-teach3').text(res.name);
									revObj.find('.rev-teach4').text(res.describes);
									myFind.rev_id = 0;
									$('#timeline_train .rev-id').removeClass('rev');
								}else{
									$('#timeline_train').append(html);
								}
								$('.train').slideUp(300);
								return false;
				        	}
				        }
				    });
					return false;
				});
			});
		},
		//培训经历修改
		trainRe: function(obj){
			// console.log($(obj));
			$(obj).addClass('rev');
			$(obj).attr('data-id',1);
			$('#timeline_train .rev').siblings().attr('data-id','');
			myFind.rev_id = $(obj).attr('data-id');
			let res = $(obj).parent().parent().children();
			let time1 = res.eq(0)[0].innerText.substring(0,7)+"-01";
			let time2 = res.eq(0)[0].innerText.substring(8,15)+"-01";
			let id = $(res.eq(1)[0]).attr('data-id');
			$('.train').slideDown(300);
			layui.use('form', function() {
				var form = layui.form;
				form.val("train-from", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
				  "major": res.eq(1)[0].innerText // "name": "value"
				  ,"name": res.eq(2)[0].innerText
				  ,"describes": res.eq(3)[0].innerText
				  ,"studyTime1": time1
				  ,"studyTime2": time2,
				  "id":id
				});
				return false;
			});
			//ifram高度自适应
			myFind.iframH('#app','iframe');
		},
		//获得证书提交
		certi_fuc: function(){
			//表单
			layui.use('form', function() {
				var form = layui.form;
				//监听提交
				form.on('submit(formCerti)', function(data) {
					//layer.msg(JSON.stringify(data.field));
					//console.log(data.field);
					let res = data.field;
					$.ajax({
				        type:"POST",
				        dateType:"JSON",
				        url:url+"/user/saveResume",
				        data:res,
				        success:function(data){
				        	if(data=='success'){
				        		let studyTimea = res.gaindate.substring(0,4);
								let studyTimeb = res.gaindate.substring(5,7);
								let studyTime1 = studyTimea+'年'+studyTimeb+'月';
								let d1 = new Date(res.startdate).getTime();
								let html = '';
								html += '<li class="layui-timeline-item">';
								html += '<i class="layui-icon layui-timeline-axis"></i>';
								html += '<div class="layui-timeline-content data-id layui-text timeline-flex">';
								html += '<h3 class="layui-timeline-title rev-teach1 layui-timeline-title1"><span class="studyTime1">'+studyTime1+'</span></h3>';
								html += '<h3 data-id="'+res.id+'"  class="layui-timeline-title rev-teach2 layui-timeline-mar">'+res.name+'</h3>';
								html += '<div class="layui-timeline-title timeline-right"><span class="rev-id" onclick="myFind.certiRe(this)">修改</span>/<span onclick="myFind.teachDel(this)">删除</span></div>';
								html += '</div>';
								html += '</li>';
								//console.log(myFind.rev_id);
								if(myFind.rev_id == 1){
									let revObj = $('#timeline_certi .rev').parent().parent();
									revObj.find('.rev-teach1 span:nth-child(1)').text(studyTime1);
									revObj.find('.rev-teach2').text(res.name);
									myFind.rev_id = 0;
									$('#timeline_certi .rev-id').removeClass('rev');
								}else{
									$('#timeline_certi').append(html);
								}
								$('.certi').slideUp(300);
								return false;
				        	}
				        }
				    });
					return false;
				});
			});
		},
		//证书修改
		certiRe: function(obj){
			// console.log($(obj));
			$(obj).addClass('rev');
			$(obj).attr('data-id',1);
			$('#timeline_certi .rev').siblings().attr('data-id','');
			myFind.rev_id = $(obj).attr('data-id');
			let res = $(obj).parent().parent().children();
			let time1 = res.eq(0)[0].innerText.substring(0,7)+"-01";
			let id = $(res.eq(1)[0]).attr('data-id');
			$('.certi').slideDown(300);
			layui.use('form', function() {
				var form = layui.form;
				form.val("certi-from", { //formTest 即 class="layui-form" 所在元素属性 lay-filter="" 对应的值
				  "name": res.eq(1)[0].innerText // "name": "value"
				  ,"studyTime1": time1,
				  "id":id
				});
				return false;
			});
			//ifram高度自适应
			myFind.iframH('#app','iframe');
		},
}
var myFind = new MyFind();
myFind.init();
	
