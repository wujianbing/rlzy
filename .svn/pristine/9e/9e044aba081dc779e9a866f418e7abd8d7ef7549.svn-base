function MyJobwant() {

}
MyJobwant.prototype = {
	init : function() {
	/*	myJobwant.get();*/
		myJobwant.bind();
	},
	get : function() {
		/*myJobwant.tabInvite();*/

	},
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
					// 删除
					parent.MyFind.prototype.tab5Decline(data);
				} else if (obj.event === 'yq') {
					// 邀请
					parent.MyFind.prototype.tab5Accept(data);
				} else if (obj.event === 'view') {
					//查看简历信息
					parent.MyFind.prototype.tab8Decline(data);
				}
			});
			
			table.on('tool(record)', function(obj) {
				var data = obj.data;
				if (obj.event === 'view') {
					//查看简历信息
					parent.MyFind.prototype.tab12Decline(data);
				}
			});
		});
	},
	// 收到简历
	/*tabInvite : function() {
		layui.use('table', function() {
			var table = layui.table;
			table.reload('inviteTab', {
				url : url + '/company/receiveResumeData?firmId=' + firmId,
				where : {}, // 设定异步数据接口的额外参数
				height : 480,
				page : true
			});
		});

	},*/
}
var myJobwant = new MyJobwant();
myJobwant.init();