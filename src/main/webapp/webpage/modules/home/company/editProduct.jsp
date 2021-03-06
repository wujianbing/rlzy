<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>产品发布</title>
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css" />
<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<link href="https://www.jq22.com/jquery/bootstrap-3.3.4.css" rel="stylesheet">
<script src="https://www.jq22.com/jquery/bootstrap-3.3.4.js"></script>
<link href="${ctxStatic}/rlzy/textPlugin/summernote.css" rel="stylesheet">
<script src="${ctxStatic}/rlzy/textPlugin/summernote.js"></script>
<style type="text/css">
.layui-form {
	width: 800px;
	margin: 45px auto 20px;
}

ol li {
	list-style-type: decimal;
}

ul li {
	list-style-type: disc;
}

.lae {
	border-radius: 5px;
}

.layui-form-item {
	margin-bottom: 27px;
	font-size: 16px;
	color: #333;
}
.layui-form-label {
    white-space: nowrap;
}
.law {
	text-align: center;
	margin-top: 20px;
}
.note-editor.note-frame .note-editing-area .note-editable {
    padding: 27px;
}
.note-editor.note-frame .note-editing-area .note-editable {
    min-height: 227px;
}
</style>
</head>
<body>
<form:form modelAttribute="rlzyProduct"  lay-filter="test1" class="forminfo layui-form" action=""  method="post" id="form">
<!--产品名称-->	
  <div class="layui-form-item">
    <label class="layui-form-label">产品名称：</label>
    <div class="layui-input-block lae">
      	<input id="t1" value="${rlzyProduct.title}" type="text" name="title" required  lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">产品简介：</label>
    <div class="layui-input-block lae">
      	<input id="t2" type="text" value="${rlzyProduct.intro}" name="intro" required  lay-verify="required" autocomplete="off" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">产品介绍：</label>
    <div class="layui-input-block">
      	<div id="summernote">${rlzyProduct.content}</div>
      	<input value="" hidden="hidden" id="cp" name="content"/>
    </div>
  </div>
<!--富文本编辑器-->	
  <div class="layui-form-item law">
      <div class="layui-btn" lay-submit lay-filter="formDemo">确认修改</div>
  </div>
</form:form>
<script>

$(document).ready(function() {
    $('#summernote').summernote();
});

/* function blur(){
	 var txt = $('#summernote').summernote('code');
	  console.log( $("#summernote").html());
	  $("#cp").val(txt);
}; */

layui.use('form', function(){
  var form = layui.form;
  //监听提交
  form.on('submit(formDemo)', function(data){
	  var txt = $('#summernote').summernote('code');
	  console.log( $("#summernote").html());
	  $("#cp").val(txt);
	  console.log($("#cp").val());
    $.ajax({
		type : "POST",
		url : "${rlzyPath}/company/editProductSave?id=${rlzyProduct.id}",
		data : $("#form").serialize(),
		success : function(data) {
			layer.msg("产品更新成功");
			var index = parent.layer.getFrameIndex(window.name);
            parent.layer.close(index);
		}
	});
    return false;
  });
});	
</script>
</body>
</html>