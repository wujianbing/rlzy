function NumPerson(){
	
}

var date =[];
var delCount =[];
var companyCount =[];
var userCount = [];
var salary ='';
var education ='';
var workingage ='';
var userage ='';

	$.ajax({
		url :'/rlzy/data/userCurve' , // 请求路径
		type : "post", // 请求类型
		success : function(res) {
			for(var i=0;i<res.length;i++){
				for(var j=0;j<res[i].length;j++){
					if(i==0){
						var user = res[i];
						var users = user[j];
						date.push(users.date);
						userCount.push(users.count);
					}else if(i == 1){
						var del= res[i];
						var dels = del[j];
						delCount.push(dels.count);
					}else{
						var company = res[i];
						var companys = company[j];
						companyCount.push(companys.count);
					}
					}
						
			 }
		}
	});
	
NumPerson.prototype = {
	init: function(){
		$.ajax({
			type:'post',
			url:'/rlzy/data/userCount',
			contentType: "application/json;charset=utf-8",
			success:function(data){
				map = data;
				salary = data.salarys;
				education = data.education;
				workingage = data.workingage;
				userage = data.userage;
				console.log(salary);
				numPerson.get();
			}
		});
	},
	get: function(){
		let _self = this;
		let dataLevelPieLeg = [];
		let datalevelPieSer = [{
				value: map.male,
				name: '男'
			},
			{
				value: map.female,
				name: '女'
			}
		];
		_self.pie_s("pie1", "注册人员人员性别占比", dataLevelPieLeg, datalevelPieSer, "pie");
		
		let dataLevelPieLeg4 = [];
		let datalevelPieSer4= salary;
		_self.pie_s("pie4", "注册人员期望薪资分布", dataLevelPieLeg4, datalevelPieSer4, "pie");
		
		let dataDomainPieLeg = [];
		let dataDomainPieSer = userage;
		_self.pie_h("pie2", "注册人员年龄分布", dataDomainPieLeg, dataDomainPieSer, "pie",'55%');
		
		let dataDomainPieLeg1 = ['PLC故障', 'CNC故障', '加工程序出错', '单元出错', '搜索出错'];
		let dataDomainPieSer1 = education;
		_self.pie_h("pie3", "注册人员学历分布", dataDomainPieLeg1, dataDomainPieSer1, "pie",'55%');
		let dataDomainPieLeg2 = [];
		let dataDomainPieSer2 = workingage;
		_self.pie_h("pie5", "注册人员工作经验分布", dataDomainPieLeg2, dataDomainPieSer2, "pie",'45%');
		_self.bar('bar1');
		_self.line('line1');
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
				name: '求职者信息',
				type: 'pie',
				radius: '80%',
				center: ['50%', '55%'],
				data: dataSer,
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
				y: 340, //延Y轴居中
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
				name: '求职者信息',
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
									/*data: ['2011年', '2012年'],*/
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
				text: '7天内人才情况',
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
				data: ['人才注册数', '人才投递简历数', '找到合适企业人数'],
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
					name: '人才注册数',
					type: 'line',
					lineStyle: {
						normal: {
							color: "#E162AF"
						}
					},
					data: userCount
				},
				{
					name: '人才投递简历数',
					type: 'line',
					lineStyle: {
						normal: {
							color: "#FE9F7F"
						}
					},
					data: delCount
				},
				{
					name: '找到合适企业人数',
					type: 'line',
					lineStyle: {
						normal: {
							color: "#FFDC5C"
						}
					},
					data: companyCount
				}
			]
		};
	
		myChart.setOption(option, true);
		// that.myChart1 = myChart;
	},
}
let numPerson = new NumPerson();
numPerson.init();