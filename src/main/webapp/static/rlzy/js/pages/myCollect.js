function MyCollect() {

}
MyCollect.prototype = {
	init : function() {
		/*myCollect.get();*/
		myCollect.bind();
	},
	/*get : function() {
		// 职位收藏夹
		myCollect.tabInvite();
	},*/
	bind : function() {
		// 邀请申请切换
		$("#title_txt>.title-x").on('click', function() {
			let i = $(this).index();
			i = i == 2 ? "1" : "0";
			// console.log(i);
			$(this).addClass('col-activ');
			$(this).siblings().removeClass('col-activ');
			$('#table_v .table-lst').eq(i).show();
			$('#table_v .table-lst').eq(i).siblings().hide();
		})
		// 表格点击
		layui.use('table', function() {
			var table = layui.table;
			table.on('tool(invite)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					// layer.alert('编辑行：<br>'+ JSON.stringify(data));
					parent.MyFind.prototype.tab2Decline(data);
				} else if (obj.event === 'yq') {
					//邀请
					parent.MyFind.prototype.tab6Accept(data);
				} else if (obj.event === 'view') {
					//查看
					parent.MyFind.prototype.tab8Decline(data);
				}
			});
		});
	},
	// 职位收藏夹
	/*tabInvite : function() {
		layui.use('table', function() {
			var table = layui.table;
			table.reload('inviteTab', {
				url :  '/rlzy/user/collectData?userId=' + userId,
				where : {}, // 设定异步数据接口的额外参数
				height : 480,
				page : true
			});
		});

	},*/

}
var myCollect = new MyCollect();
myCollect.init();