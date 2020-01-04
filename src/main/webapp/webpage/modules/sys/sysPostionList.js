<%@ page contentType="text/html;charset=UTF-8" %>
<script>
	    var $sysPostionTreeTable=null;  
		$(document).ready(function() {
			$sysPostionTreeTable=$('#sysPostionTreeTable').treeTable({  
		    	   theme:'vsStyle',	           
					expandLevel : 2,
					column:0,
					checkbox: false,
		            url:'${ctx}/sys/sysPostion/getChildren?parentId=',  
		            callback:function(item) { 
		            	 item.type =  jp.getDictLabel(${fns:toJson(fns:getDictList('desiredIndustry'))}, item.type);// 字典转换
		            	 var treeTableTpl= $("#sysPostionTreeTableTpl").html();
		            	 var result = laytpl(treeTableTpl).render({row: item});
		                 return result;                   
		            },  
		            beforeClick: function($sysPostionTreeTable, id) { 
		                // 异步获取数据 这里模拟替换处理
		                $sysPostionTreeTable.refreshPoint(id);  
		            },  
		            beforeExpand : function($sysPostionTreeTable, id) {   
		            },  
		            afterExpand : function($sysPostionTreeTable, id) {  
		            },  
		            beforeClose : function($sysPostionTreeTable, id) {    
		            	
		            }  
		        });
		        
		        $sysPostionTreeTable.initParents('${parentIds}', "0");// 在保存编辑时定位展开当前节点
		       
		});
		
		function del(con,id){  
			jp.confirm('确认要删除职业信息吗？', function(){
				jp.loading();
	       	  	$.get("${ctx}/sys/sysPostion/delete?id="+id, function(data){
	       	  		if(data.success){
	       	  			$sysPostionTreeTable.del(id);
	       	  			jp.success(data.msg);
	       	  		}else{
	       	  			jp.error(data.msg);
	       	  		}
	       	  	})
	       	   
       		});
	
		} 
		
		function refreshNode(data) {// 刷新节点
            var current_id = data.body.sysPostion.id;
			var target = $sysPostionTreeTable.get(current_id);
			var old_parent_id = target.attr("pid") == undefined?'1':target.attr("pid");
			var current_parent_id = data.body.sysPostion.parentId;
			var current_parent_ids = data.body.sysPostion.parentIds;
			if(old_parent_id == current_parent_id){
				if(current_parent_id == '0'){
					$sysPostionTreeTable.refreshPoint(-1);
				}else{
					$sysPostionTreeTable.refreshPoint(current_parent_id);
				}
			}else{
				$sysPostionTreeTable.del(current_id);// 刷新删除旧节点
				$sysPostionTreeTable.initParents(current_parent_ids, "0");
			}
        }
		function refresh(){// 刷新
			var index = jp.loading("正在加载，请稍等...");
			$sysPostionTreeTable.refresh();
			jp.close(index);
		}
</script>
<script type="text/html" id="sysPostionTreeTableTpl">
			<td>
			<c:choose>
			      <c:when test="${fns:hasPermission('sys:sysPostion:edit')}">
				    <a  href="#" onclick="jp.openSaveDialog('编辑职业信息', '${ctx}/sys/sysPostion/form?id={{d.row.id}}','800px', '500px')">
							{{d.row.name === undefined ? "": d.row.name}}
					</a>
			      </c:when>
			      <c:when test="${fns:hasPermission('sys:sysPostion:view')}">
				    <a  href="#" onclick="jp.openViewDialog('查看职业信息', '${ctx}/sys/sysPostion/form?id={{d.row.id}}','800px', '500px')">
							{{d.row.name === undefined ? "": d.row.name}}
					</a>
			      </c:when>
			      <c:otherwise>
							{{d.row.name === undefined ? "": d.row.name}}
			      </c:otherwise>
			</c:choose>
			</td>
			<td>
							{{d.row.code === undefined ? "": d.row.code}}
			</td>
			<td>
							{{d.row.type === undefined ? "": d.row.type}}
			</td>
			<td>
							{{d.row.remarks === undefined ? "": d.row.remarks}}
			</td>
			<td>
				<div class="btn-group">
			 		<button type="button" class="btn  btn-primary btn-xs dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-cog"></i>
						<span class="fa fa-chevron-down"></span>
					</button>
				  <ul class="dropdown-menu" role="menu">
					<shiro:hasPermission name="sys:sysPostion:view">
						<li><a href="#" onclick="jp.openViewDialog('查看职业信息', '${ctx}/sys/sysPostion/form?id={{d.row.id}}','800px', '500px')"><i class="fa fa-search-plus"></i> 查看</a></li>
					</shiro:hasPermission>
					<shiro:hasPermission name="sys:sysPostion:edit">
						<li><a href="#" onclick="jp.openSaveDialog('修改职业信息', '${ctx}/sys/sysPostion/form?id={{d.row.id}}','800px', '500px')"><i class="fa fa-edit"></i> 修改</a></li>
		   			</shiro:hasPermission>
		   			<shiro:hasPermission name="sys:sysPostion:del">
		   				<li><a  onclick="return del(this, '{{d.row.id}}')"><i class="fa fa-trash"></i> 删除</a></li>
					</shiro:hasPermission>
		   			<shiro:hasPermission name="sys:sysPostion:add">
						<li><a href="#" onclick="jp.openSaveDialog('添加下级职业信息', '${ctx}/sys/sysPostion/form?parent.id={{d.row.id}}','800px', '500px')"><i class="fa fa-plus"></i> 添加下级职业信息</a></li>
					</shiro:hasPermission>
				  </ul>
				</div>
			</td>
	</script>