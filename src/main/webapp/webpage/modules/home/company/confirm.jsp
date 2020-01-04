<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no">
		<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
		<title>确认职位</title>
		<!-- Bootstrap -->
		<link rel="stylesheet" href="${ctxStatic }/rlzy/css/common/layui-v2.5.5/layui/css/layui.css">
		<style>
			.v{
				width: 600px;
			}
			.c{
				display: table;
				padding: 24px 0;
			}
			.zw{
				width: 120px;
				display: table-cell;
				vertical-align: middle;
				text-align: center;
				font-size: 16px;
			}
			.ul-v{
				display: table-cell;
			}
			.ul-v>li{
				float: left;
			    cursor: pointer;
			    border-radius: 2px;
			    min-width: 150px;
			    height: 30px;
			    line-height: 30px;
			    font-size: 14px;
			}
			.ul-v>li:hover{
				    color: #1e9fff;
			}
			.ul-v>.active{
				    color: #1e9fff;	
			}
			.btn-v{
				text-align: center;
			}
		</style>
	</head>
	<body>
		<div class="v">
			<div class="c">
				<div class="zw">选择职位:</div>
				<ul class="ul-v">
				<input type="hidden" value="${userid}" id="userid">
					<c:forEach items="${rlzyPosition}" var="arr">
						<li data-id="${arr.id}">${arr.positionname}</li>
					</c:forEach>
				</ul>
			</div>
			<div class="btn-v">
				<button data-txt="" type="button" class="layui-btn layui-btn-normal succ-btn">确定</button>
			</div>
		</div>
	</body>
	<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
	<script>
		$(function(){
			$('.ul-v li').bind('click',function(){
				let txt = $(this).text();
				let id = $(this).attr('data-id');
				console.log(id);
				$(this).addClass('active');
				$(this).siblings().removeClass('active');
				$('.succ-btn').attr('data-txt',txt);
				$('.succ-btn').attr('data-id',id);
				console.log(txt);
			})
			$('.succ-btn').click(function(){
				let txt = $(this).attr('data-txt');
				let id = $(this).attr('data-id');
				let userid =$("#userid").val();
				console.log(userid);
				console.log(id);
				console.log(txt);
				if(txt == ''){
					alert('请选择职位!');
				}else{
					$.get("${rlzyPath}/talent/inviteUser?id="+id+"&txt="+txt+"&userid="+userid,function(data){
						if(data == '1'){
							var index = parent.layer.getFrameIndex(window.name);
	                        parent.layer.close(index);
						}if(data == '2'){
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
						alert('你已邀请过该人才！');
						}
					});
				}
				
			})
		})
	</script>
</html>
