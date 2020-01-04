<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/webpage/include/taglib.jsp"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>支付选择</title>
        <link href="${ctxStatic }/rlzy/css/style.css" rel="stylesheet" type="text/css"/>
        <style type="text/css">
        	#tail{
        		display: none;
        	}
        </style>
    </head>
    <body>
        <div style="height:200px;"></div>
        <!-- 可删除 -->
        <div class="Service-box">
        <%-- <div class="toptops">
			你好!&emsp;欢迎进入吴忠人力资源支付页面<a class="tc" href="${rlzyPath}/home/index">暂不支付</a>
		</div> --%>
            <div class="Service-content clearfix">
        
                <a href="${rlzyPath}/pay/alipayform?companyId = ${companyId}" class="Service-item" id="zfb">
                    <div class="item-image">
                        <img src="${ctxStatic }/rlzy/img/icon-tag002.png" alt="">
                    </div>
                    <h3 class="item-title">支付宝支付</h3>
                    <div class="item-text">用户在商家网站扫码进行付款</div>
                    <span class="item-link">去支付</span>
                </a>
                <a href="${rlzyPath}/pay/wxpay?companyId = ${companyId}" class="Service-item" id="wx">
                    <div class="item-image">
                        <img src="${ctxStatic }/rlzy/img/icon-tag004.png" alt="">
                    </div>
                    <h3 class="item-title">微信支付</h3>
                    <div class="item-text">用户在商家网站扫码进行付款</div>
                    <span class="item-link">去支付</span>
                </a>
         
            </div>
        </div>
		
		<script src="${ctxStatic }/rlzy/js/jquery.min.js"></script>
		<!--<script src="../js/pages/nav.js"></script>
		<script src="../js/unti.js"></script>
		<script src="../css/common/layui-v2.5.5/layui/layui.js"></script>-->
    </body>
    <script type="text/javascript">
    	$("#zfb").click(function(){
    		let companyId = "${companyId}";
    		$.ajax({
    			url:"${rlzyPath}/pay/alipay",
    			data:companyId,
    			type:"POST",
    			success:function(data){
    				//alert(data);
    			}
    		
    		
    		});
    	
    	});
    
    </script>
</html>
