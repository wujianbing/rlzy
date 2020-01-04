<%@ page contentType="text/html;charset=UTF-8" %>
	<script>
		$(document).ready(function() {
			var to = false;
			$('#search_q').keyup(function () {
				if(to) { clearTimeout(to); }
				to = setTimeout(function () {
					var v = $('#search_q').val();
					$('#videoModeljsTree').jstree(true).search(v);
				}, 250);
			});
			$('#videoModeljsTree').jstree({
				'core' : {
					"multiple" : false,
					"animation" : 0,
					"themes" : { "variant" : "large", "icons":true , "stripes":true},
					'data' : {
						"url" : "${ctx}/portal/videoModel/treeData",
						"dataType" : "json" 
					}
				},
				"conditionalselect" : function (node, event) {
					return false;
				},
				'plugins': ["contextmenu", 'types', 'wholerow', "search"],
				"contextmenu": {
					"items": function (node) {
						var tmp = $.jstree.defaults.contextmenu.items();
						delete tmp.create.action;
						delete tmp.rename.action;
						tmp.rename = null;
						tmp.create = null;
						tmp.remove = null;
						tmp.ccp = null;
						<c:if test="${fns:hasPermission('portal:videoModel:add')}">
						tmp.create = {
							"label": "添加下级模块",
							"action": function (data) {
								var inst = jQuery.jstree.reference(data.reference),
									obj = inst.get_node(data.reference);
								jp.openSaveDialog('添加下级模块', '${ctx}/portal/videoModel/form?parent.id=' + obj.id + "&parent.name=" + obj.text, '800px', '500px');
							}
						};
						</c:if>
						<c:if test="${fns:hasPermission('portal:videoModel:del')}">
						tmp.remove = {
							"label": "删除模块",
							"action": function (data) {
								var inst = jQuery.jstree.reference(data.reference),
									obj = inst.get_node(data.reference);
								jp.confirm('确认要删除模块吗？', function(){
									jp.loading();
									$.get("${ctx}/portal/videoModel/delete?id="+obj.id, function(data){
										if(data.success){
											$('#videoModeljsTree').jstree("refresh");
											jp.success(data.msg);
										}else{
											jp.error(data.msg);
										}
									})

								});
							}
						}
						</c:if>
						<c:if test="${fns:hasPermission('portal:videoModel:update')}">
						tmp.ccp = {
							"label": "编辑模块",
							"action": function (data) {
								var inst = jQuery.jstree.reference(data.reference),
									obj = inst.get_node(data.reference);
								var parentId = inst.get_parent(data.reference);
								var parent = inst.get_node(parentId);
								jp.openSaveDialog('编辑模块', '${ctx}/portal/videoModel/form?id=' + obj.id, '800px', '500px');
							}
						}
						</c:if>
						return tmp;
					}

				},
				"types":{
					'default' : { 'icon' : 'fa fa-folder' },
					'1' : {'icon' : 'fa fa-home'},
					'2' : {'icon' : 'fa fa-umbrella' },
					'3' : { 'icon' : 'fa fa-group'},
					'4' : { 'icon' : 'fa fa-file-text-o' }
				}

			}).bind("activate_node.jstree", function (obj, e) {
				var node = $('#videoModeljsTree').jstree(true).get_selected(true)[0];
				var opt = {
					silent: true,
					query:{
						'videoModel.id':node.id
					}
				};
				$("#videoModelId").val(node.id);
				$("#videoModelName").val(node.text);
				$('#videoTable').bootstrapTable('refresh',opt);
			}).on('loaded.jstree', function() {
				$("#videoModeljsTree").jstree('open_all');
			});
		});

		function refreshTree() {
	            $('#videoModeljsTree').jstree("refresh");
	        }
	</script>