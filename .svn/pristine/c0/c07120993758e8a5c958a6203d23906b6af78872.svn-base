function MyJobwant1() {

}
MyJobwant1.prototype = {
	init : function() {
		/*myJobwant1.get();*/
		myJobwant1.bind();
	},
	/*get : function() {
		// 面试邀请
		myJobwant1.tabInvite();
	},*/
	bind : function() {
		// 表格点击
		layui.use('table', function() {
			var table = layui.table;
			table.on('tool(invite)', function(obj) {
				var data = obj.data;
				console.log(data)
				if (obj.event === 'del') {
					//职位删除
					parent.MyFind.prototype.tab4Decline(data);
				} else if (obj.event === 'edit') {
					//职位修改
					parent.MyFind.prototype.tab3Decline(data);

				}else if (obj.event === 'offline') {
					//下线职位
					parent.MyFind.prototype.tab10Decline(data);

				}else if (obj.event === 'upline') {
					//上线职位
					parent.MyFind.prototype.tab11Decline(data);

				}

			});
		});
		
	},
	// 已发布职位
	/*tabInvite : function() {
		console.log(11);
		layui.use('table', function() {
			var table = layui.table;
			table.reload('inviteTab', {
				url : url + '/company/offerManageData?firmId=' + firmId,
				where : {}, // 设定异步数据接口的额外参数
				height : 480,
				page :true
				
			});
			
			 table.render({
				    elem: '#inviteTab'
				    ,url:url + '/company/offerManageData?firmId=' + firmId
				    ,height : 480
				    ,cols: [[
				        {field:'positionname', width:80, title: '职位名称', sort: true}
				        ,{field:'salaryrange', width:80, title: '薪资范围'}
				        ,{field:'recruitnumber', width:80, title: '招聘人数', sort: true}
				        ,{field:'workingage', width:80, title: '工作经验'}
				        ,{field:'num', title: '投递简历数', minWidth: 150}
				        ,{field:'line', width:80, title: '是否上线', sort: true}
				        ,{field:'right', width:135, title: '操作', sort: true, toolbar: '#barInvite'}
				      ]]
				    ,page:true
		});
	});
 }*/
}
var myJobwant1 = new MyJobwant1();
myJobwant1.init();