function MyJobwant() {
}
MyJobwant.prototype = {
	init : function() {
		/*myJobwant.get();*/
		myJobwant.bind();
	},
	/*	get: function() {
			//面试邀请
			myJobwant.tabInvite();

		},*/
	bind : function() {
		//表格点击
		layui.use('table', function() {
			var table = layui.table;
			//面试邀
			table.on('tool(invite)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					parent.MyFind.prototype.tab17Decline(data);

				} else if (obj.event === 'ck') {

					parent.MyFind.prototype.tab16Submint(data);
				}

			});
			table.on('toolbar(invite)', function(obj) {
				var data = obj.data;
				if (obj.event === 'add') {
					//添加表格
					parent.MyFind.prototype.add1table(data);

				}
			});

		});

	},
//已发布职位
/*tabInvite: function() {
	layui.use('table', function() {
		var table = layui.table;
		table.reload('inviteTab', {
			url: 'js/haveMan.json',
			where: {}, //设定异步数据接口的额外参数
			height: 480,
			page: true,
			toolbar: '#toolbarDemo',
			defaultToolbar: ['', '', ''],
			done: function(res, curr, count) {
				//如果是异步请求数据方式，res即为你接口返回的信息。
				//如果是直接赋值的方式，res即为：{data: [], count: 99} data为当前页数据、count为数据总长度
				console.log(res);

				//得到当前页码
				console.log(curr);

				//得到数据总量
				console.log(count);
			}
		});
	});

},*/
}
var myJobwant = new MyJobwant();
myJobwant.init();