<%@ page contentType="text/html;charset=UTF-8" %>
<script>
$(document).ready(function() {
	$('#isystemTable').bootstrapTable({
		 
		  //请求方法
               method: 'post',
               //类型json
               dataType: "json",
               contentType: "application/x-www-form-urlencoded",
               //显示检索按钮
	           showSearch: false,
               //显示刷新按钮
               showRefresh: false,
               //显示切换手机试图按钮
               showToggle: false,
               //显示 内容列下拉框
    	       showColumns: false,
    	       //显示到处按钮
    	       showExport: false,
    	       //显示切换分页按钮
    	       showPaginationSwitch: false,
    	       //最低显示2行
    	       minimumCountColumns: 2,
               //是否显示行间隔色
               striped: true,
               //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）     
               cache: false,    
               //是否显示分页（*）  
               pagination: true,   
                //排序方式 
               sortOrder: "asc",  
               //初始化加载第一页，默认第一页
               pageNumber:1,   
               //每页的记录行数（*）   
               pageSize: 10,  
               //可供选择的每页的行数（*）    
               pageList: [10, 25, 50, 100],
               //这个接口需要处理bootstrap table传递的固定参数,并返回特定格式的json数据  
               url: "${ctx}/portal/isystem/data",
               //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
               //queryParamsType:'',   
              
               //分页方式：client客户端分页，server服务端分页（*）
               sidePagination: "server",
               contextMenuTrigger:"right",//pc端 按右键弹出菜单
               contextMenuTriggerMobile:"press",//手机端 弹出菜单，click：单击， press：长按。
               
               columns: [{
		        field: 'name',
		        title: '名称',
		        sortable: false,
		        sortName: 'url'
		    }
			,{
		        field: 'count',
		        title: '访问量',
		        sortable: false,
		        sortName: 'count'
		    }
			,{
		        field: 'companyCount',
		        title: '企业注册量',
		        sortable: false,
		        sortName: 'companyCount'
		    }
			,{
		        field: 'userCount',
		        title: '个人注册量',
		        sortable: false,
		        sortName: 'userCount'
		    }
			,{
		        field: 'createDate',
		        title: '日期',
		        sortable: false,
		        sortName: 'createDate',
        	    formatter:function(value, row , index){
		        	return jp.dateFormat(value, "yyyy-MM-dd");
		        }
		        	
		    }
		     ]
		
		});
		
		  
	  if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){//如果是移动端

		 
		  $('#isystemTable').bootstrapTable("toggleView");
		}
	  
	  $('#isystemTable').on('check.bs.table uncheck.bs.table load-success.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $('#remove').prop('disabled', ! $('#isystemTable').bootstrapTable('getSelections').length);
            $('#view,#edit').prop('disabled', $('#isystemTable').bootstrapTable('getSelections').length!=1);
        });
		  
		
		
	});
  
</script>