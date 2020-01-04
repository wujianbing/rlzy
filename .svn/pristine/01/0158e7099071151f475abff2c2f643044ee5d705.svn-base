<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
<link href="${ctxStatic }/rlzy/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/iconfont.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
<link rel="stylesheet" href="${ctxStatic }/rlzy/js/common/citySet/citySet.css" />
<link rel="stylesheet" href="${ctxStatic }/rlzy/css/editJob.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic }/rlzy/js/fuli/css/style2.css"/>
<!--富文本引用******************************************************************************  -->
<link rel="stylesheet" type="text/css" href="${ctxStatic }/rlzy/styles/simditor.css" />
<script src="${ctxStatic }/rlzy/scripts/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/scripts/module.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/scripts/hotkeys.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/scripts/simditor.min.js"></script>
<!--*************************************************************************************  -->
<style type="text/css">
     html,body{
     height:100%;
         overflow-y: auto;
     }
	/******************富文本css************************  */
/* 选择有序列表的样式 */
.simditor-body ol li {
    list-style: decimal;
        color: #666;
        font-size:16px!important;
}
/* 选择无序列表的样式 */
.simditor-body ul li {
    list-style: disc;
    color: #666;
    font-size:16px!important;
}
/* 输入框的文本样式 */
.simditor-body p{
  color: #666!important;
    font-size:16px!important;
}
/* 文本输入框的宽度 */
.layui-input-block.laytextarea {
    width: 632px;
}
/* 文本工具栏 */
.simditor .simditor-toolbar {
    border-bottom: 1px solid #e6e6e6;
    background: #ffffff;
    width: 100%;
}
/*文本输入框的边框线条  */
.simditor {
    position: relative;
    border: 1px solid #e6e6e6;
}
/******************************************  */
</style>
</head>
<body>
	<div class="jlpage" id="app">
		<div class="infoname">
			<form:form modelAttribute="rlzyPosition"  lay-filter="test1" class="forminfo layui-form" action="" method="post" id="form">
				<div class="row rowsy">
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>职位类型：</label>
							<div class="layui-input-block">
								<form:select class="form-control" path="positiontype" name="positiontype">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('work_nature')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>工作地点：</label>
							<div class="layui-input-block" style="cursor:pointer">
					      		<input type="text" name="workingplace" value="${rlzyPosition.workingplace}" style="cursor:pointer" required  lay-verify="required" placeholder="请选择所在地区" autocomplete="off" class="layui-input" id="workplace" >
					    	</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>最高学历：</label>
							<div class="layui-input-block">
								<form:select class="form-control" path="education" name="education">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('education')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>年龄要求：</label>
							<div class="layui-input-block">
								<form:select class="form-control" path="agerequirement" name="agerequirement">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('age_range')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>招聘人数：</label>
							<div class="layui-input-block">
								<input type="text" name="recruitnumber" required lay-verify="required"
										placeholder="请输入招聘人数" autocomplete="off" class="layui-input" value="${rlzyPosition.recruitnumber}">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>联系人：</label>
							<div class="layui-input-block">
								<input type="text" name="contacts" required lay-verify="required"
									placeholder="请输入标题" autocomplete="off" class="layui-input" value="${rlzyPosition.contacts}">
							</div>
						</div>
					</div>
					<div class="divs">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>职位名称：</label>
							<div class="layui-input-block">
								<input type="text" name="positionname" required lay-verify="required"
									placeholder="请输入标题" class="layui-input" value="${rlzyPosition.positionname}">
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>薪资范围：</label>
							<div class="layui-input-block">
								<form:select class="form-control" path="salaryrange" name="salaryrange">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('salary')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>工作年限：</label>
							<div class="layui-input-block">
								<form:select class="form-control" path="workingage" name="workingage">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('working_age')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>


						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>联系电话：</label>
							<div class="layui-input-block">
								<input type="text" name="phone" required
									lay-verify="required" placeholder="请输入标题" autocomplete="off"
									class="layui-input" value="${rlzyPosition.phone}">
							</div>
						</div>
					</div>
				</div>
					<div class="col-lg-12" style="padding:0">
						<div class="layui-form-item layui-form-text">
							<label class="layui-form-label"><span class="sign">*</span>职位描述：</label>
							<div class="layui-input-block laytextarea" style="position: relative;">
								<textarea id="editor" name="positiondescription" placeholder="" class="layui-textarea textarea" autofocus>${rlzyPosition.positiondescription}</textarea>
							</div>
						</div>
					</div>
					<div class="col-lg-12" style="padding:0">
						<label class="layui-form-label"><span class="sign">*</span>企业福利:</label>
							<div class="selectBox">
			        	<div class="inputCase">
			        		<div id="role_select" class="select-menu-input imitationSelect"></div>
							<i class="fa fa-caret-down"></i>
						</div>
			        </div>
			  		<div class="divp" style="display: none;">
			        	<ul class="selectUl">
			        	<c:set var="i" value="${0}" />
			        		<c:forEach items="${list}" var="list">
			        			<c:set var="i" value="${i+1}"/>
			        			<li oliName="${i}" oliId="${list.value}">${list.label}</li>
			        		</c:forEach>
						</ul>
						 <div class="layui-btn qudi" >确定</div>
			 		 </div>
					</div>
					<div class="col-lg-12" style="padding:0">
						<div class="layui-form-item">
							<label class="layui-form-label"><span class="sign">*</span>是否为急聘岗位：</label>
							<div class="layui-input-block setone">
								<form:select class="form-control" path="postflag" name="postflag">
									<form:option value="" label="" />
									<form:options items="${fns:getDictList('is_post')}" itemLabel="label" itemValue="value" htmlEscape="false" />
								</form:select>
							</div>
						</div>
					</div>
				</div>
				<div class="row nutbtn">
					<div class="layui-form-item">

						<button class="layui-btn" lay-submit lay-filter="formDemo">发布</button>

					</div>
				</div>
			</form:form>
		</div>
	</div>
</body>

</html>
<script type="text/javascript" src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
<script type="text/javascript" src="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/layui.js"></script>
<script src="${ctxStatic }/rlzy/js/Popt.js"></script> 
<script src="${ctxStatic }/rlzy/js/cityJson.js"></script>
<script src="${ctxStatic }/rlzy/js/citySet.js"></script>
<script src="${ctxStatic }/rlzy/js/fuli/js/check_select2.js"></script>
<script type="text/javascript">
	//	/Demo
	layui.use('form', function() {
		var form = layui.form;
		//监听提交
		form.on('submit(formDemo)', function(data) {
		  $.ajax({
				type : "POST",
				url : "${rlzyPath}/company/offerEditData?id=${rlzyPosition.id}",
				data : $("#form").serialize(),
				success : function(data) {
					if ("1" == data) {
						layer.msg("职位已更新成功");
						var index = parent.layer.getFrameIndex(window.name);
                        parent.layer.close(index);
                        //window.location.href="${rlzyPath}/company/offerManage?firmId=${firmId}";
                        //console.log($('.nameimg').text(),1);
                        /* var childWindow = $("#iframe")[0].contentWindow; //表示获取了嵌入在iframe中的子页面的window对象。  []将JQuery对象转成DOM对象，用DOM对象的contentWindow获取子页面window对象。
                        console.log(childWindow);
                        childWindow.subFunction(); */
                       // let dom = $('#iframe');
                        //dom.attr('src','${rlzyPath}/company/offerManage?firmId=${firmId}');
                        //parent.layui.table.reload('idTest',{page:{curr:1}});
						//parent.MyFind.prototype.tab1Href2();
					}
				}
			});
		  return false;
		});
	});
	//城市级联
	$("#workplace").click(function(e) {
		SelCity(this, e);
		console.log("inout", $(this).val(), new Date())
	});
	$(".lastfuli").on('click', function() {
		$(".fuli").toggle();
		//		 myJobwant.iframH('#app','iframe');
		//		 parent.MyFind.prototype.height1();
	})
	$(".shouq").on('click', function() {
		$(".fuli").toggle()
		//		 parent.MyFind.prototype.height1();
		// myJobwant.iframH('#app','iframe');
	})
	$(".fuli ul li").click(function() {
		if ($(this).hasClass("liact")) {
			$(this).removeClass("liact");
			$(this).find(".correct").remove()

		} else {

			$(this).addClass("liact");
			$(this).append("<span class='correct'></span>");
		}
	});
	
	/*富文本编辑器js*********************************  */
	var editor = new Simditor({
    toolbar: [ 'ol','|', 'ul', ],
    textarea: '#editor',
    placeholder: '写点什么...',
    cleanPaste: true
});
/*富文本编辑器js*********************************  */	
</script>