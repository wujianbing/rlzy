function NumPerson(){
	
}

var date =[];
var delCount =[];
var positionCount =[];
var collectCount = [];

	$.ajax({
		url :'/rlzy/data/companyCurve' , // 请求路径
		type : "post", // 请求类型
		success : function(res) {
			for(var i=0;i<res.length;i++){
				for(var j=0;j<res[i].length;j++){
					if(i==0){
						var post = res[i];
						var postition = post[j];
						date.push(postition.date);
						console.log(date);
						positionCount.push(postition.count);
					}else if(i == 1){
						var del= res[i];
						var dels = del[j];
						delCount.push(dels.count);
					}else{
						var collect = res[i];
						var collects = collect[j];
						collectCount.push(collects.count);
					}
					}
						
			 }
		}
	});
NumPerson.prototype = {
	init: function(){
		$.ajax({
			type:'post',
			url:'/rlzy/data/industryCount',
			contentType: "application/json;charset=utf-8",
			success:function(data){
				map = data;
				numPerson.get();
			}
		});
	/*	$.ajax({
			type:'post',
			url:'/rlzy/data/position',
			contentType: "application/json;charset=utf-8",
			success:function(data){
				map1 = data;
				numPerson.get();
			}
		});*/
		//表格数据
		numPerson.tabLst();
	},
	get: function(){
		let _self = this;
		let dataLevelPieLeg = [];
		let datalevelPieSer = [{
				value: map.count11,
				name: '1-1.5K/月'
			},
			{
				value: map.count12,
				name: '1.5-2K/月'
			},
			{
				value: map.count13,
				name: '2-3K/月'
			},
			{
				value: map.count14,
				name: '3-5K/月'
			},
			{
				value: map.count15,
				name: '5-10K/月'
			},			
			{
				value: map.count16,
				name: '10K以上/月'
			}
		];
		_self.pie_s("pie1", "企业 分布", dataLevelPieLeg, datalevelPieSer, "pie");
		
		let dataLevelPieLeg2 = [];
		let datalevelPieSer2 = [{
					value: map.count6,
					name: '1-20人'
				},
				{
					value: map.count7,
					name: '20-50人'
				},
				{
					value: map.count8,
					name: '50-100人'
				},
				{
					value: map.count9,
					name: '100-500人'
				},
				{
					value: map.count10,
					name: '500+人'
				}
		];
		_self.pie_s("pie2", "职位相关数据", dataLevelPieLeg2, datalevelPieSer2, "pie");
		
		let dataDomainPieLeg = ['PLC故障', 'CNC故障', '加工程序出错', '单元出错', '搜索出错'];
		let dataDomainPieSer = [{
				value: map.positionCount,
				name: '职位发布数'
			},
			{
				value: map.deliveryCollect,
				name: '收到简历数'
			},
			{
				value: map.companyDeal,
				name: '处理简历数'
			},
			{
				value: map.positionCollect,
				name: '职位被收藏数'
			}
		];
		_self.pie_h("pie3", "职位相关数据", dataDomainPieLeg, dataDomainPieSer, "pie",'45%');
		_self.bar('bar1');
		_self.line('line1');
	},
	tabLst: function(){
		let h = $('#tab').height();
		console.log(h);
		layui.use('table', function() {
			var table = layui.table;
			table.reload('inviteTab', {
				url: '/rlzy/data/companyList',
				where: {}, //设定异步数据接口的额外参数
				height: h,
				page:false
			});
		});
	},
	pie_s: function(id, titName, dataLeg, dataSer, type) {
		let dom = document.getElementById(id);
		let myChart = echarts.init(dom);
		let option = {
			title: {
				text: titName,
				textStyle: {
					fontSize: 14,
					fontWeight: '600',
					color: '#53B0E9'
				},
				x: '15',
				y: '10',
			},
			tooltip: {
				trigger: 'item',
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			legend: {
				orient: 'vertical',
				y: 'center', //延Y轴居中
				x: 'left', //居右显示
				data: dataLeg
			},
			visualMap: {
				show: false,
				min: 5000,
				max: 5000,
				inRange: {
					colorLightness: [0, 1]
				}
			},
			series: [{
				name: '企业信息',
				type: 'pie',
				radius: '80%',
				center: ['50%', '50%'],
				data: dataSer.sort(function(a, b) {
					return a.value - b.value;
				}),
				roseType: 'radius',
				label: {
					normal: {
						textStyle: {
							color: '#28D4EC'
						}
					}
				},
				labelLine: {
					normal: {
						lineStyle: {
							color: 'rgba(255, 255, 255, 0.5)'
						},
						smooth: 0.2,
						length: 6
					}
				},
				itemStyle: {
					normal: {
						color: '#1A8CD2',
						shadowBlur: 200,
						shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				},
	
				animationType: 'scale',
				animationEasing: 'elasticOut',
				animationDelay: function(idx) {
					return Math.random() * 200;
				}
			}]
			// series : [
			// 	{
			// 		name: '访问来源',
			// 		type: type,
			// 		radius : '55%',
			// 		center: ['50%', '50%'],
			// 		data:dataSer,
			// 		itemStyle: {
			// 			emphasis: {
			// 				shadowBlur: 10,
			// 				shadowOffsetX: 0,
			// 				shadowColor: 'rgba(0, 0, 0, 0.5)'
			// 			}
			// 		}
			// 	}
			// ]
		};
		myChart.setOption(option);
	},
	pie_h: function(id, titName, dataLeg, dataSer, type,top) {
		let dom = document.getElementById(id);
		let myChart = echarts.init(dom);
		
		let option = {
			title: {
				text: titName,
				textStyle: {
					fontSize: 14,
					fontWeight: '600',
					color: '#53B0E9'
				},
				x: '15',
				y: '10',
			},
			tooltip: {
				trigger: 'item',
				formatter: "{a} <br/>{b} : {c} ({d}%)"
			},
			color: ['#318FC3', '#58C3C9', '#DBBE58', '#DA8C75', '#AA64BC', '#4BA29D', '#408E27'],
			legend: {
				orient: 'horizontal',
				y: 380, //延Y轴居中
				x: 'center', //居右显示
				icon: "circle",
				itemWidth: 10, // 设置宽度
				itemHeight: 10, // 设置高度
				itemGap: 10, // 设置间距
				textStyle: {
					color: '#29D1EC'
				},
				data: dataLeg
			},
			series: [{
				name: '职位相关数据',
				type: type,
				radius: ['40%', '58%'],
				center: ['50%', top],
				data: dataSer,
				labelLine: {
					normal: {
						smooth: 0.2,
						length: 3
					}
				},
				itemStyle: {
					// normal : {
					// 	label : {
					// 	  show : false
					// 	},
					// 	labelLine : {
					// 	  show : false
					// 	}
					//  },
					emphasis: {
						shadowBlur: 10,
						shadowOffsetX: 0,
						shadowColor: 'rgba(0, 0, 0, 0.5)'
					}
				}
			}]
		};
		myChart.setOption(option);
	},
	// 柱状图
			bar: function(id) {
				$.ajax({
					url:'/rlzy/data/industry',
					type:'post',
					success:function(data){
						console.log(data);
						var name =[];
						var count=[];
						for(var key in data){
							name.push(key)
							count.push(data[key])
						}
						let option = {
								title: {
									text: '求职人员期望行业',
									// subtext: '数据来自网络',
									textStyle: {
										fontSize: 14,
										fontWeight: '600',
										color: '#53B0E9'
									},
									x: 10,
									y: 10,
								},
								tooltip: {
									trigger: 'axis',
									axisPointer: {
										type: 'shadow'
									}
								},
								legend: {
									data: ['2011年', '2012年'],
									textStyle: {
										color: '#29D1EC'
									},
									y: 10,
								},
								grid: {
									left: '3%',
									right: '4%',
									bottom: '3%',
									containLabel: true
								},
								xAxis: {
									type: 'value',
									boundaryGap: [0, 0.01],
									axisLine: {
										lineStyle: {
											color: '#ffffff',
										},
									},
									boundaryGap: false,
								},
								yAxis: {
									type: 'category',
									data: name,
									axisLine: {
										lineStyle: {
											color: '#ffffff',
										}
									},
									axisTick: {
										show: false
									}
								},
								series: [{
									/*name: '2011年',*/
									type: 'bar',
									itemStyle: {
										normal: {
											//好，这里就是重头戏了，定义一个list，然后根据所以取得不同的值，这样就实现了，
											color: function(params) {
												// build a color map as your need.
												var colorList = [
													'#FE8463', '#9BCA63', '#FAD860', '#F3A43B', '#60C0DD',
													'#D7504B', '#C6E579', '#F4E001', '#F0805A', '#26C0C0'
												];
												return colorList[params.dataIndex]
											},
											//以下为是否显示，显示位置和显示格式的设置了
											// label: {
											// 	show: true,
											// 	position: 'top',
											// 	formatter: '{b}\n{c}'
											// }
										}
									},
									data:count
								}]
							};
							myChart.setOption(option);
					}
				});
			
				let dom = document.getElementById(id);
				let myChart = echarts.init(dom);
			
			},
	line: function(id) {
		let that = this;
		//console.log(wAll);
		let x = 20;
		let y = 30;
		let gridTop = '23%';
		let legendTop = 35;
		
	
		let dom = document.getElementById(id);
		let myChart = echarts.init(dom);
	
		let fzTime = ['08:00', '10:00', '12:00', '14:00', '168:00', '18:00', '20:00', '22:00'];
		let fzA = ['32', '24', '63', '42', '42', '16', '43', '32'];
		let fzX = ['14', '52', '46', '43', '14', '42', '23', '34'];
		let fzY = ['22', '23', '23', '15', '54', '23', '12', '54'];
		let fzZ = ['16', '43', '34', '12', '23', '43', '44', '76'];
		let fzZhu = ['19', '21', '45', '32', '42', '12', '22', '15'];
		let option = {
			title: {
				text: '8天内企业情况',
				textStyle: {
					fontSize: 16,
					fontWeight: '600',
					color: '#0097ff'
				},
				x: x,
				y: y,
			},
			tooltip: {
				trigger: 'axis',
	
			},
	
			legend: {
				data: ['职位发布数', '简历处理数', '收藏候选人数'],
				//				        orient: 'horizontal',
				//						icon: "circle",
	
				y: legendTop, //延Y轴居中
				//						x: 'center', //居右显示
				//						itemWidth: 10,  // 设置宽度
				//						itemHeight: 10, // 设置高度
				itemGap: 10, // 设置间距
				textStyle: {
					color: '#29D1EC',
					fontSize: 14
				},
			},
			color: ['#318FC3', '#58C3C9', '#DBBE58', '#DA8C75', '#AA64BC', '#4BA29D', '#408E27'],
			grid: {
				left: '3%',
				right: '4%',
				top: gridTop,
				bottom: '3%',
				containLabel: true
			},
			//				    toolbox: { //图片保存
			//				        feature: {
			//				            saveAsImage: {}
			//				        }
			//				    },
			xAxis: {
				type: 'category',
				axisLine: {
					lineStyle: {
						color: '#ffffff',
					},
				},
				boundaryGap: false,
				data: date
			},
			yAxis: {
				type: 'value',
				axisLine: {
					lineStyle: {
						color: '#ffffff',
					}
				},
				axisTick: {
					show: false
				}
			},
			series: [{
					name: '职位发布数',
					type: 'line',
					lineStyle: {
						normal: {
							color: "#E162AF"
						}
					},
					data: positionCount
				},
				{
					name: '简历处理数',
					type: 'line',
					lineStyle: {
						normal: {
							color: "#FE9F7F"
						}
					},
					data: delCount
				},
				{
					name: '收藏候选人数',
					type: 'line',
					lineStyle: {
						normal: {
							color: "#FFDC5C"
						}
					},
					data: collectCount
				}
			]
		};
	
		myChart.setOption(option, true);
		// that.myChart1 = myChart;
	},
}
let numPerson = new NumPerson();
numPerson.init();