function CollectMan() {

}
CollectMan.prototype = {
	init : function() {
		/*collectMan.get();*/
		collectMan.bind();
	},
	get : function() {
		// 面试邀请
		/*collectMan.tabInvite();*/

	},
	bind : function() {
		// 表格点击
		layui.use('table', function() {
			var table = layui.table;
			table.on('tool(invite)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					//拒绝
					parent.MyFind.prototype.tab2Decline(data);
				} else if (obj.event === 'yq') {
					//邀请
					parent.MyFind.prototype.tab1Accept(data);
				} else if (obj.event === 'sc') {
					//取消收藏
					parent.MyFind.prototype.tab1Decline(data);
				} else if (obj.event === 'view') {
					//查看
					parent.MyFind.prototype.tab7Decline(data);
				}

			});
		});
	},
	// 已发布职位
	/*tabInvite : function() {
		layui.use('table', function() {
			var table = layui.table;
			table.reload('inviteTab', {
				url : url + '/company/companyCollect?firmId=' + firmId,
				where : {}, // 设定异步数据接口的额外参数
				height : 480,
				page : true
			});
		});

	},*/
}
var collectMan = new CollectMan();
collectMan.init();