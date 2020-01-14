var arr = new Array();
console.log(arr);
function Qydetil() {

}
Qydetil.prototype = {
	init : function() {
		Qydetil.bind();
		qydetil.iframH('#app', 'iframe');
	},

	bind : function() {
	},
	iframH : function(app, iframe) {
		setTimeout(function() {
			// 父页面iframe高度
			var apph = $(app).outerHeight();
			let parIframe = window.parent.document.getElementById(iframe);
			// console.log(apph);
			$(parIframe).css({
				'height' : apph
			});
		}, 300);
	},

}
var qydetil = new Qydetil();
qydetil.init();
$(function() {
	var i = 0;
	$("#editd").click(function(){
		i++;
		if(i % 2 != 0) {
			$(this).text("取消");
			$(".layui-input").removeAttr("disabled");
			$(".layui-input").css('border','1px solid #ccc');
			$(".layui-unselect.layui-form-select").css('display','block');
			$(".setselect").css('display','none');
			$(".service").css('display','block');
			$(".section").css('display','block');
			$(".textarea-numberbar").css('display','block');
			$(".cys").css('display','block');
			$(".delete").css("display","block");
			$(".addImg").css("display","block");
			qydetil.iframH('#app','iframe');
		}else {
			$(this).text("修改")
			$(".layui-input").attr("disabled", "disabled");
			$(".layui-input").css('border','0');
			$(".layui-unselect.layui-form-select").css('display','none');
			$(".setselect").css('display','block');
			$(".service").css('display','block');
			$(".section").css('display','none');
			$(".textarea-numberbar").css('display','none');
			$(".cys").css('display','none');
			qydetil.iframH('#app','iframe');
			imgshow();
		}
	})
	$(".shoucang").click(function() {
		i++;
		if(i % 2 != 0) {
			$(".named").text('取消收藏');
			$(this).css("color", "#ff6501");
		} else {
			$(".named").text('收藏');
			$(this).css("color", "#000");
		}
	});
})

$("#city").click(function(e) {
	SelCity(this, e);
	// console.log("inout", $(this).val(), new Date())
});
// 点击
var clickImg = function(obj) {
	$(obj).parent().find('.upload_input').click();
}
// 删除
var deleteImg = function(obj) {
	$(obj).parent().find('input').val('');
	$(obj).parent().find('img.preview').attr("src", "");
	// IE9以下
	$(obj).parent().find('img.preview').css("filter", "");
	$(obj).hide();
	$(obj).parent().find('.addImg').show();
}
// 选择图片
function change(file) {
	// 预览
	var pic = $(file).parent().find(".preview");
	// 添加按钮
	var addImg = $(file).parent().find(".addImg");
	// 删除按钮
	var deleteImg = $(file).parent().find(".delete");

	var ext = file.value.substring(file.value.lastIndexOf(".") + 1)
			.toLowerCase();
	
	// gif在IE浏览器暂时无法显示
	if (ext != 'png' && ext != 'jpg' && ext != 'jpeg') {
		if (ext != '') {
			alert("图片的格式必须为png或者jpg或者jpeg格式！");
		}
		return;
	}
	// 判断IE版本
	var isIE = navigator.userAgent.match(/MSIE/) != null, isIE6 = navigator.userAgent
			.match(/MSIE 6.0/) != null;
	isIE10 = navigator.userAgent.match(/MSIE 10.0/) != null;
	if (isIE && !isIE10) {
		file.select();
		var reallocalpath = document.selection.createRange().text;
		// console.log(reallocalpath);
		// IE6浏览器设置img的src为本地路径可以直接显示图片
		if (isIE6) {
			pic.attr("src", reallocalpath);
		} else {
			// 非IE6版本的IE由于安全问题直接设置img的src无法显示本地图片，但是可以通过滤镜来实现
			pic.css(
							"filter",
							"progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\""
									+ reallocalpath + "\")");
			// 设置img的src为base64编码的透明图片 取消显示浏览器默认图片
			pic.attr(
							'src',
							'data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==');
		}
		addImg.hide();
		deleteImg.show();
	} else {
		html5Reader(file, pic, addImg, deleteImg);
		//重要注解  上传
		var formData = new FormData();
		formData.append("file", file.files[0]);
		$.ajax({
			type : 'POST',
			url : url + '/company/upload',
			data : formData,
			contentType : false,
			processData : false,
			async : true,
			success : function(result) {
				$(file).parent().find(".inp").val(result);
				//html5Reader(file, pic, addImg, deleteImg);
			}
		});
	}
}

// H5渲染
function html5Reader(file, pic, addImg, deleteImg) {
	var file = file.files[0];
	var reader = new FileReader();
	reader.readAsDataURL(file);
	// 添加图片路径到数组
	reader.onload = function(e) {
		pic.attr("src", this.result);
	}
	addImg.hide();
	deleteImg.show();
}

layui.use('form', function() {
	var form = layui.form;
	// 监听提交
	form.on('submit(formDemo)', function(data) {
		arr.push($("#inp0").val());
		arr.push($("#inp1").val());
		arr.push($("#inp2").val());
		arr.push($("#inp3").val());
		var datas = arr.join("|");
		$("#inp").val(datas);
		console.log(datas);
		$.ajax({
			cache : true,
			type : "POST",
			url : url + "/company/editWorkerSave?id=" + id,
			data : $("#form").serialize(),
			success : function(data) {
				if ("1" == data) {
					layui.use('layer', function(){
						  var layer = layui.layer;
						  //layer.msg('您已收藏！');
						  layer.alert('您已修改企业信息！', {
						  skin: 'layui-layer-molv' //样式类名
						  ,closeBtn: 0
						}, function(){
						  layer.alert('您已修改成功！', {
						    skin: 'layui-layer-lan'
						    ,closeBtn: 0
						    ,anim: 4 //动画类型
						    ,success: function(layero){
						    	imgshow();
								window.location.href=url+"/company/workerDetail?id="+id;
						      }
						  });
						});
					});
				}
			}
		});
		return false;
	});
});

// 文本框的字数限制以及自动调整高度
var Huitextarealength = function(obj) {
	var html = $(obj).parent();
	var tatal = html.find('am').html();
	var sets = $(obj).val().length;
	if (sets * 1 > tatal * 1) {
		var str = '<div style="width: auto;position: absolute; right: 4%;color: red;">内容超出限制</div>';
		$(obj).after(str);
		html.find('em').css({color : 'red'});
	} else {
		$(obj).parent().find('div').remove();
		html.find('em').css({
			color : 'black'
		});
		$("#123d").autoHeight();
		$("#124d").autoHeight();
	}
	// 设置已输入数量
	html.find('em').html(sets);
}

$.fn.autoHeight = function() {
	function autoHeight(elem) {
		elem.style.height = 'auto';
		elem.scrollTop = 0; // 防抖动
		elem.style.height = elem.scrollHeight + 'px';
	}
	this.each(function() {
		autoHeight(this);
		$(this).on('keyup', function() {
			autoHeight(this);
			qydetil.iframH('#app', 'iframe');
		});
	});
}

//提交后调用的函数
function imgshow(){
	$(".section").css("display","block");
	$(".delete").css("display","none");
	$(".addImg").css("display","none");
}
//提交保存的时候调用此函数，将其对于的input框的值赋值给title
function  nametitle(){
	var val = $('#name').val();
	$('#name').attr('title',val);
	var val2 = $('wzhi').val();
	$('#wzhi').attr('wzhi',val);

}
$(function(){
	imgshow();
})