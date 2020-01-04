<%@ page contentType="text/html;charset=UTF-8" %>
<script>
$(document).ready(function() {
	$('#rlzyRelationTable').bootstrapTable({
		 
		  //请求方法
               method: 'post',
               //类型json
               dataType: "json",
               contentType: "application/x-www-form-urlencoded",
               //显示检索按钮
	           showSearch: true,
               //显示刷新按钮
               showRefresh: true,
               //显示切换手机试图按钮
               showToggle: true,
               //显示 内容列下拉框
    	       showColumns: true,
    	       //显示到处按钮
    	       showExport: true,
    	       //显示切换分页按钮
    	       showPaginationSwitch: true,
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
               url: "${ctx}/portal/rlzyRelation/data",
               //默认值为 'limit',传给服务端的参数为：limit, offset, search, sort, order Else
               //queryParamsType:'',   
               ////查询参数,每次调用是会带上这个参数，可自定义                         
               queryParams : function(params) {
               	var searchParam = $("#searchForm").serializeJSON();
               	searchParam.pageNo = params.limit === undefined? "1" :params.offset/params.limit+1;
               	searchParam.pageSize = params.limit === undefined? -1 : params.limit;
               	searchParam.orderBy = params.sort === undefined? "" : params.sort+ " "+  params.order;
                   return searchParam;
               },
               //分页方式：client客户端分页，server服务端分页（*）
               sidePagination: "server",
               contextMenuTrigger:"right",//pc端 按右键弹出菜单
               contextMenuTriggerMobile:"press",//手机端 弹出菜单，click：单击， press：长按。
               contextMenu: '#context-menu',
               onContextMenuItem: function(row, $el){
                   if($el.data("item") == "edit"){
                   		edit(row.id);
                   }else if($el.data("item") == "view"){
                       view(row.id);
                   } else if($el.data("item") == "delete"){
                        jp.confirm('确认要删除该关联信息记录吗？', function(){
                       	jp.loading();
                       	jp.get("${ctx}/portal/rlzyRelation/delete?id="+row.id, function(data){
                   	  		if(data.success){
                   	  			$('#rlzyRelationTable').bootstrapTable('refresh');
                   	  			jp.success(data.msg);
                   	  		}else{
                   	  			jp.error(data.msg);
                   	  		}
                   	  	})
                   	   
                   	});
                      
                   } 
               },
              
               onClickRow: function(row, $el){
               },
               	onShowSearch: function () {
			$("#search-collapse").slideToggle();
		},
               columns: [{
		        checkbox: true
		       
		    }
			,{
		        field: 'username',
		        title: '求职者名称',
		        sortable: true,
		        sortName: 'username'
		        ,formatter:function(value, row , index){
		        	value = jp.unescapeHTML(value);
				   <c:choose>
					   <c:when test="${fns:hasPermission('portal:rlzyRelation:edit')}">
					      return "<a href='javascript:edit(\""+row.id+"\")'>"+value+"</a>";
				      </c:when>
					  <c:when test="${fns:hasPermission('portal:rlzyRelation:view')}">
					      return "<a href='javascript:view(\""+row.id+"\")'>"+value+"</a>";
				      </c:when>
					  <c:otherwise>
					      return value;
				      </c:otherwise>
				   </c:choose>
		         }
		       
		    }
			,{
		        field: 'companyname',
		        title: '企业名称',
		        sortable: true,
		        sortName: 'companyname'
		       
		    }
			,{
		        field: 'positionname',
		        title: '职位名称',
		        sortable: true,
		        sortName: 'positionname'
		       
		    }
			,{
		        field: 'age',
		        title: '出生年月',
		        sortable: true,
		        sortName: 'age'
		       
		    }
			,{
		        field: 'sex',
		        title: '性别',
		        sortable: true,
		        sortName: 'sex'
		       
		    }
			,{
		        field: 'currentstate',
		        title: '工作状态',
		        sortable: true,
		        sortName: 'currentstate'
		       
		    }
			,{
		        field: 'workingage',
		        title: '工作年限',
		        sortable: true,
		        sortName: 'workingage'
		       
		    }
			,{
		        field: 'workingplace',
		        title: '工作地点',
		        sortable: true,
		        sortName: 'workingplace'
		       
		    }
			,{
		        field: 'deliverystate',
		        title: '投递状态（主动投递/邀请面试）',
		        sortable: true,
		        sortName: 'deliverystate'
		       
		    }
			,{
		        field: 'userdealstate',
		        title: '用户处理状态',
		        sortable: true,
		        sortName: 'userdealstate'
		       
		    }
			,{
		        field: 'companydealstate',
		        title: '企业处理状态',
		        sortable: true,
		        sortName: 'companydealstate'
		       
		    }
			,{
		        field: 'collectionstate',
		        title: '收藏状态',
		        sortable: true,
		        sortName: 'collectionstate'
		       
		    }
			,{
		        field: 'remarks',
		        title: '备注',
		        sortable: true,
		        sortName: 'remarks'
		       
		    }
			,{
		        field: 'updateDate',
		        title: '更新时间',
		        sortable: true,
		        sortName: 'updateDate'
		       
		    }
		     ]
		
		});
		
		  
	  if(navigator.userAgent.match(/(iPhone|iPod|Android|ios)/i)){//如果是移动端

		 
		  $('#rlzyRelationTable').bootstrapTable("toggleView");
		}
	  
	  $('#rlzyRelationTable').on('check.bs.table uncheck.bs.table load-success.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $('#remove').prop('disabled', ! $('#rlzyRelationTable').bootstrapTable('getSelections').length);
            $('#view,#edit').prop('disabled', $('#rlzyRelationTable').bootstrapTable('getSelections').length!=1);
        });
		  
		$("#btnImport").click(function(){
			jp.open({
			    type: 2,
                area: [500, 200],
                auto: true,
			    title:"导入数据",
			    content: "${ctx}/tag/importExcel" ,
			    btn: ['下载模板','确定', '关闭'],
				    btn1: function(index, layero){
					 jp.downloadFile('${ctx}/portal/rlzyRelation/import/template');
				  },
			    btn2: function(index, layero){
				        var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
						iframeWin.contentWindow.importExcel('${ctx}/portal/rlzyRelation/import', function (data) {
							if(data.success){
								jp.success(data.msg);
								refresh();
							}else{
								jp.error(data.msg);
							}
						   jp.close(index);
						});//调用保存事件
						return false;
				  },
				 
				  btn3: function(index){ 
					  jp.close(index);
	    	       }
			}); 
		});
		    
		
	 $("#export").click(function(){//导出Excel文件
	        var searchParam = $("#searchForm").serializeJSON();
	        searchParam.pageNo = 1;
	        searchParam.pageSize = -1;
            var sortName = $('#rlzyRelationTable').bootstrapTable("getOptions", "none").sortName;
            var sortOrder = $('#rlzyRelationTable').bootstrapTable("getOptions", "none").sortOrder;
            var values = "";
            for(var key in searchParam){
                values = values + key + "=" + searchParam[key] + "&";
            }
            if(sortName != undefined && sortOrder != undefined){
                values = values + "orderBy=" + sortName + " "+sortOrder;
            }

			jp.downloadFile('${ctx}/portal/rlzyRelation/export?'+values);
	  })

		    
	  $("#search").click("click", function() {// 绑定查询按扭
		  $('#rlzyRelationTable').bootstrapTable('refresh');
		});
	 
	 $("#reset").click("click", function() {// 绑定查询按扭
		  $("#searchForm  input").val("");
		  $("#searchForm  select").val("");
		  $("#searchForm  .select-item").html("");
		  $('#rlzyRelationTable').bootstrapTable('refresh');
		});
		
		
	});
		
  function getIdSelections() {
        return $.map($("#rlzyRelationTable").bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }
  
  function deleteAll(){

		jp.confirm('确认要删除该关联信息记录吗？', function(){
			jp.loading();  	
			jp.get("${ctx}/portal/rlzyRelation/deleteAll?ids=" + getIdSelections(), function(data){
         	  		if(data.success){
         	  			$('#rlzyRelationTable').bootstrapTable('refresh');
         	  			jp.success(data.msg);
         	  		}else{
         	  			jp.error(data.msg);
         	  		}
         	  	})
          	   
		})
  }
  function refresh(){
  	$('#rlzyRelationTable').bootstrapTable('refresh');
  }
  function add(){
		jp.go("${ctx}/portal/rlzyRelation/form/add");
	}

  function edit(id){
	  if(id == undefined){
		  id = getIdSelections();
	  }
	  jp.go("${ctx}/portal/rlzyRelation/form/edit?id=" + id);
  }

  function view(id) {
      if(id == undefined){
          id = getIdSelections();
      }
      jp.go("${ctx}/portal/rlzyRelation/form/view?id=" + id);
  }
  
</script>