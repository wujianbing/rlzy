<%@ page contentType="text/html;charset=UTF-8" %>
<script>
$(document).ready(function() {
	$('#rlzyCompanyTable').bootstrapTable({
		 
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
    	       //显示详情按钮
    	       detailView: true,
    	       	//显示详细内容函数
	           detailFormatter: "detailFormatter",
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
               url: "${ctx}/portal/rlzyCompany/data",
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
                        jp.confirm('确认要删除该企业信息记录吗？', function(){
                       	jp.loading();
                       	jp.get("${ctx}/portal/rlzyCompany/delete?id="+row.id, function(data){
                   	  		if(data.success){
                   	  			$('#rlzyCompanyTable').bootstrapTable('refresh');
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
		        field: 'companyname',
		        title: '企业名称',
		        sortable: true,
		        sortName: 'companyname',
		        formatter:function(value, row , index){
			        	value = jp.unescapeHTML(value);
					   <c:choose>
						   <c:when test="${fns:hasPermission('portal:rlzyCompany:edit')}">
						      return "<a href='javascript:edit(\""+row.id+"\")'>"+value+"</a>";
					      </c:when>
						  <c:when test="${fns:hasPermission('portal:rlzyCompany:view')}">
						      return "<a href='javascript:view(\""+row.id+"\")'>"+value+"</a>";
					      </c:when>
						  <c:otherwise>
						      return value;
					      </c:otherwise>
					   </c:choose>
			     }
		    }
			,{
		        field: 'logo',
		        title: '企业logo',
		        sortable: true,
		        sortName: 'logo',
        	    formatter:function(value, row , index){
		        	if(value==null || value==""){
		        		value="-";
		        	}
		        	var valueArray = value.split("|");
		        	var labelArray = [];
		        	for(var i =0 ; i<valueArray.length; i++){
		        		if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(valueArray[i]))
		        		{
		        			labelArray[i] = "<a href=\""+valueArray[i]+"\" url=\""+valueArray[i]+"\" target=\"_blank\">"+decodeURIComponent(valueArray[i].substring(valueArray[i].lastIndexOf("/")+1))+"</a>"
		        		}else{
		        			labelArray[i] = '<img   onclick="jp.showPic(\''+valueArray[i]+'\')"'+' height="50px" src="'+valueArray[i]+'">';
		        		}
		        	}
		        	return labelArray.join(" ");
		        }
		       
		    }
			,{
		        field: 'companyscale',
		        title: '企业规模',
		        sortable: true,
		        sortName: 'companyscale',
		        formatter:function(value, row , index){
		        	return jp.getDictLabel(${fns:toJson(fns:getDictList('company_scale'))}, value, "-");
		        }
		       
		    }
			,{
		        field: 'companynature',
		        title: '企业性质',
		        sortable: true,
		        sortName: 'companynature',
		        formatter:function(value, row , index){
		        	return jp.getDictLabel(${fns:toJson(fns:getDictList('company_nature'))}, value, "-");
		        }
		       
		    }
			,{
		        field: 'registeredcapital',
		        title: '注册资金',
		        sortable: true,
		        sortName: 'registeredcapital'
		       
		    }
			,{
		        field: 'creditcode',
		        title: '企业统一信用编码',
		        sortable: true,
		        sortName: 'creditcode'
		       
		    }
			,{
		        field: 'paystatus',
		        title: '支付状态',
		        sortable: true,
		        sortName: 'paystatus',
		        formatter:function(value, row , index){
		        	return jp.getDictLabel(${fns:toJson(fns:getDictList('paystatus'))}, value, "-");
		        }
		       
		    }
			,{
		        field: 'reviewstate',
		        title: '审核状态',
		        sortable: true,
		        sortName: 'reviewstate',
		        formatter:function(value, row , index){
		        	return jp.getDictLabel(${fns:toJson(fns:getDictList('review_state'))}, value, "-");
		        }
		       
		    }
			,{
		        field: 'trystate',
		        title: '试用状态',
		        sortable: true,
		        sortName: 'trystate',
		        formatter:function(value, row , index){
		        	return jp.getDictLabel(${fns:toJson(fns:getDictList('try_state'))}, value, "-");
		        }
		       
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

		 
		  $('#rlzyCompanyTable').bootstrapTable("toggleView");
		}
	  
	  $('#rlzyCompanyTable').on('check.bs.table uncheck.bs.table load-success.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $('#remove').prop('disabled', ! $('#rlzyCompanyTable').bootstrapTable('getSelections').length);
            $('#view,#edit').prop('disabled', $('#rlzyCompanyTable').bootstrapTable('getSelections').length!=1);
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
					  jp.downloadFile('${ctx}/portal/rlzyCompany/import/template');
				  },
			    btn2: function(index, layero){
				        var iframeWin = layero.find('iframe')[0]; //得到iframe页的窗口对象，执行iframe页的方法：iframeWin.method();
						iframeWin.contentWindow.importExcel('${ctx}/portal/rlzyCompany/import', function (data) {
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
            var sortName = $('#rlzyCompanyTable').bootstrapTable("getOptions", "none").sortName;
            var sortOrder = $('#rlzyCompanyTable').bootstrapTable("getOptions", "none").sortOrder;
            var values = "";
            for(var key in searchParam){
                values = values + key + "=" + searchParam[key] + "&";
            }
            if(sortName != undefined && sortOrder != undefined){
                values = values + "orderBy=" + sortName + " "+sortOrder;
            }

			jp.downloadFile('${ctx}/portal/rlzyCompany/export?'+values);
	  })
		    
	  $("#search").click("click", function() {// 绑定查询按扭
		  $('#rlzyCompanyTable').bootstrapTable('refresh');
		});
	 
	 $("#reset").click("click", function() {// 绑定查询按扭
		  $("#searchForm  input").val("");
		  $("#searchForm  select").val("");
		   $("#searchForm  .select-item").html("");
		  $('#rlzyCompanyTable').bootstrapTable('refresh');
		});
		
		
	});
		
  function getIdSelections() {
        return $.map($("#rlzyCompanyTable").bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }
  
  function deleteAll(){

		jp.confirm('确认要删除该企业信息记录吗？', function(){
			jp.loading();  	
			jp.get("${ctx}/portal/rlzyCompany/deleteAll?ids=" + getIdSelections(), function(data){
         	  		if(data.success){
         	  			$('#rlzyCompanyTable').bootstrapTable('refresh');
         	  			jp.success(data.msg);
         	  		}else{
         	  			jp.error(data.msg);
         	  		}
         	  	})
          	   
		})
  }

     //刷新列表
  function refresh(){
  	$('#rlzyCompanyTable').bootstrapTable('refresh');
  }
  function add(){
		jp.go("${ctx}/portal/rlzyCompany/form/add");
	}

  function edit(id){
	  if(id == undefined){
		  id = getIdSelections();
	  }
	  jp.go("${ctx}/portal/rlzyCompany/form/edit?id=" + id);
  }
  
 function view(id){//没有权限时，不显示确定按钮
      if(id == undefined){
             id = getIdSelections();
      }
         jp.go("${ctx}/portal/rlzyCompany/form/view?id=" + id);
 }

  
  
  
		   
  function detailFormatter(index, row) {
	  var htmltpl =  $("#rlzyCompanyChildrenTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
	  var html = Mustache.render(htmltpl, {
			idx:row.id
		});
	  $.get("${ctx}/portal/rlzyCompany/detail?id="+row.id, function(rlzyCompany){
    	var rlzyCompanyChild1RowIdx = 0, rlzyCompanyChild1Tpl = $("#rlzyCompanyChild1Tpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
		var data1 =  rlzyCompany.rlzyPositionList;
		for (var i=0; i<data1.length; i++){
			data1[i].dict = {};
			data1[i].dict.positiontype = jp.getDictLabel(${fns:toJson(fns:getDictList('work_nature'))}, data1[i].positiontype, "-");
			data1[i].dict.workingage = jp.getDictLabel(${fns:toJson(fns:getDictList('working_age'))}, data1[i].workingage, "-");
			data1[i].dict.postflag = jp.getDictLabel(${fns:toJson(fns:getDictList('is_post'))}, data1[i].postflag, "-");

			addRow('#rlzyCompanyChild-'+row.id+'-1-List', rlzyCompanyChild1RowIdx, rlzyCompanyChild1Tpl, data1[i]);
			rlzyCompanyChild1RowIdx = rlzyCompanyChild1RowIdx + 1;
		}
				
      	  			
      })
     
        return html;
    }
  
	function addRow(list, idx, tpl, row){
		$(list).append(Mustache.render(tpl, {
			idx: idx, delBtn: true, row: row
		}));
	}
			
</script>
<script type="text/template" id="rlzyCompanyChildrenTpl">//<!--
	<div class="tabs-container">
		<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#tab-{{idx}}-1" aria-expanded="true">职位表</a></li>
		</ul>
		<div class="tab-content">
				 <div id="tab-{{idx}}-1" class="tab-pane fade in active">
						<table class="ani table">
						<thead>
							<tr>
								<th>工作性质</th>
								<th>职业名称</th>
								<th>工作经验</th>
								<th>招聘人数</th>
								<th>联系人</th>
								<th>联系电话</th>
								<th>是否急聘</th>
								<th>更新时间</th>
							</tr>
						</thead>
						<tbody id="rlzyCompanyChild-{{idx}}-1-List">
						</tbody>
					</table>
				</div>
		</div>//-->
	</script>
	<script type="text/template" id="rlzyCompanyChild1Tpl">//<!--
				<tr>
					<td>
						{{row.dict.positiontype}}
					</td>
					<td>
						{{row.positionname}}
					</td>
					<td>
						{{row.dict.workingage}}
					</td>
					<td>
						{{row.recruitnumber}}
					</td>
					<td>
						{{row.contacts}}
					</td>
					<td>
						{{row.phone}}
					</td>
					<td>
						{{row.dict.postflag}}
					</td>
					<td>
						{{row.updateDate}}
					</td>
				</tr>//-->
	</script>
