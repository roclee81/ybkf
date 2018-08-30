<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="${staticPath }/static/js/common.js"></script>
        <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <title>费用构成</title>
    <style>
        .ys-table tbody tr td > select {
            width: auto !important;
        }
        .tab-div-box {
            position: relative;
            overflow: hidden
        }
        .tab-div-box1 {
            position: relative;
            overflow: hidden
        }
        .tab-div-box3 {
            position: relative;
            overflow: hidden
        }

        .tab-menu {
            position: absolute;
            width: 100%;
            z-index: 90;
            background-color: #fff;
        }

        #F1 {
            position: absolute;
            width: 100%;
            padding-bottom: 48px
        }

        #F2 {
            position: absolute;
            width: 100%;
            padding-bottom: 48px
        }
        #F3 {
            position: absolute;
            width: 100%;
            padding-bottom: 48px
        }

        #bar1 {
            height: 90px;
        }

        #bar2 {
            height: 90px
        }
        #line1{
            height: 360px !important;
        }
        .C_hre > p {
            margin-bottom: 0 !important;
            line-height: 24px !important;
        }
		.gauge-div{margin:0 !important; width:38%;}
		#zy_Gauge1{height:234px;}
		#zy_Gauge3{height:330px}
		#zy_Gauge4{height:330px}
		#as_Gauge1{height:200px !important;}
		#as_Gauge2{height:200px !important;}
		#as_Gauge3{height:200px !important;}
		#Eum1{margin-top:10px;}
		#Eum2{margin-top:10px;}
		.ks-fy-zb{padding-bottom:0;}
		.ScrLts{padding:1% 2% !important;}
    </style>
</head>
<body>
 <!--普通住院--> 
<div class="header-div bg-color margin-top10">
    <table class="ys-table tiaojian margin-left20" style="width: 95%">
        <tbody>
        <tr>
            <td>
                <select>
                    <option>2016</option>
                    <option>2017</option>
                </select>
            </td>
            <td class="fs_16">
                年
            </td>
            <td style="width: 44px">
                <select style="width: 46px">
                    <option value="0">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6" selected>06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </td>
            <td class="td-width fs_16">月</td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
                <select style="width: 86px;" id="switch-select">
                    <option value="0">全院</option>
                    <option value="1">内科</option>
                    <option value="2">外科</option>
                </select>
            </td>
            <td class="td-width fs_16">
                参保类型
            </td>
            <td>
                <select style="width: 86px;" >
                    <option value="0">城乡居民</option>
                    <option value="1">城镇职工</option>
                    <option value="2">省直医保</option>
                </select>
            </td>
            <td class="td-width"></td>
            <td>
                <button class="btn btn-primary"><img src="${staticPath }/static/img/menu/search.png"> 查询</button>
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
</div>
<div class="tab-table-box bg-color margin-top10">
	<div class="tab-div-box">
        <div class="ScrLts padding-top10">
            <table class="body-width">
                <tr>
                    <td>
                        <li>
                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon01.png"/></div>
                            <div class="C_hre">
                                <p>36200<span class="nowrap margin-left10">限定值:55000</span></p>
                                <p class="nowrap">
                                    <span class="nowrap zb-font">医疗总费用</span>
                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">↑ 20%</font></span>
                                </p>
                            </div>
                        </li>
                    </td>
                    <td>
                        <li>
                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon02.png"/></div>
                            <div class="C_hre">
                                <p>800<span class="nowrap margin-left10">限定值:3000</span></p>
                                <p class="nowrap">
                                    <span class="nowrap zb-font">药品费</span>
                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                </p>
                            </div>
                        </li>
                    </td>
                    <td>
                        <li style="margin-right:0;">
                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon03.png"/></div>
                            <div class="C_hre">
                                <p>26000<span class="nowrap margin-left10">限定值:32000</span></p>
                                <p class="nowrap">
                                    <span class="nowrap zb-font">检查检验费</span>
                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                </p>
                            </div>
                        </li>
                    </td>
                </tr>
                <tr>
                    <td>
                        <li>
                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon05.png"/></div>
                            <div class="C_hre">
                                <p>1510<span class="nowrap margin-left10">限定值:3000</span></p>
                                <p class="nowrap">
                                    <span class="nowrap zb-font">耗材费</span>
                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">↑ 20%</font></span>
                                </p>

                            </div>
                        </li>
                    </td>
                    <td>
                        <li>
                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon06.png"/></div>
                            <div class="C_hre">
                                <p>560<span class="nowrap margin-left10">限定值:2500</span></p>
                                <p class="nowrap">
                                    <span class="nowrap zb-font">诊疗费</span>
                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                </p>
                            </div>
                        </li>
                    </td>
                    <td>
                        <li style="margin-right:0;">
                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon07.png"/></div>
                            <div class="C_hre">
                                <p>480<span class="nowrap margin-left10">限定值:1500</span></p>
                                <p class="nowrap">
                                    <span class="nowrap zb-font">人均药费</span>
                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                </p>
                            </div>
                        </li>
                    </td>
                </tr>
            </table>       
            <div class="clear"></div>
        </div>
    </div>
</div>
<div class="tab-table-box bg-color margin-top10">
    <div class="tab-div-box">
    	<div class="ks-fy-zb">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title ">费用类别</td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
       </div>
       <div class="yb-jj-div float"  style="width:60%; margin-left:1%;">
            <div class="ys-rc-div">
                <table class="body-width common-table">
                    <tbody>
                    <tr class="th-bg">
                        <th>费用类别</th>
                        <th>实际值</th>
                        <th>限定值</th>
                        <th>是否超额</th>
                        <th>与上月比</th>
                        <th>费用占比</th>
                    </tr>
                    <tr>
                        <td>药品费</td>
                        <td class="right">1200</td>
                        <td class="right">1000</td>
                        <td><label class="abnormal"></label></td>
                        <td class="right"><font class="abnormal-span padding-left4">↑ 20%</font></td>
                        <td class="right">14%</td>
                        
                    </tr>
                    <tr>
                        <td>检查检验费</td>
                        <td class="right">3000</td>
                        <td class="right">1000</td>
                        <td><label class="abnormal"></label></td>
                        <td class="right"><font class="abnormal-span padding-left4">↑ 25%</font></td>
                        <td class="right">23%</td>
                    </tr>
                    <tr>
                        <td>诊疗费</td>
                        <td class="right">800</td>
                        <td class="right">1000</td>
                        <td><label class="normal"></label></td>
                        <td class="right"><font class="normal-span padding-left4">↓ 20%</font></td>
                        <td class="right">10%</td>
                        
                    </tr>
                    <tr>
                        <td>手术费</td>
                        <td class="right">3000</td>
                        <td class="right">1000</td>
                        <td><label class="normal"></label></td>
                        <td class="right"><font class="normal-span padding-left4">↓ 20%</font></td>
                        <td class="right">23%</td>
                    </tr>
                    <tr>
                        <td>耗材费</td>
                        <td class="right">3000</td>
                        <td class="right">1000</td>
                        <td><label class="normal"></label></td>
                        <td class="right"><font class="normal-span padding-left4">↓ 20%</font></td>
                        <td class="right">23%</td>
                        
                    </tr>
                    <tr>
                        <td>自费金额</td>
                        <td class="right">3000</td>
                        <td class="right">1000</td>
                        <td><label class="normal"></label></td>
                        <td class="right"><font class="normal-span padding-left4">↓ 20%</font></td>
                        <td class="right">23%</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="gauge-div float" style="width:30;">
            <div id="num1">
                <div id="zy_Gauge1">

                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div class="tab-table-box bg-color margin-top10 margin-bottom20">
    <div class="tab-div-box ">
		<!--月度变化趋势-->
 		<div class="ks-fy-zb">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title">月度变化趋势</td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
       </div>
            <div class="gauge-title-div border-bom" style="margin:0 2%">
                <table class="body-width">
                    <tr>
                        <td>
                            <div class="tab-menu">
                                <ul class="card2">
                                    <li class="on padding-left0 margin-left0">按科室统计</li>
                                    <li>按人均统计</li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="sde">
            <!--按科室统计-折线图-->
            <div class="body-width fy-line-div" id="Eum1" style="display:block">
                <div class="fy-bar-div" id="Bine1">

                </div>
            </div>
            <!--按人均统计-折线图-->
            <div class="body-width fy-line-div" id="Eum2" style="display:none">
                <div class="fy-bar-div" id="Bine2">

                </div>
            </div>
            <div class="clear"></div>
            </div>
        </div>
    </div>          
</div>
    <script>
	$(document).ready(function () {
			Broken1();
			Broken2();
			linen();
			$(function(){
			 $(".card2 li").click(function(){
			 $(this).addClass("on").siblings().removeClass("on");
			 var index=$(this).index();
			 $(".sde .body-width").eq(index).show().siblings().hide(); 
			 if (index == 0) {
					Broken1();
					$("#Bine2").remove();
					var line2_html = "<div class='fy-bar-div' id='Bine2'></div>";
					$("#Eum2").append(line2_html);
				} else {
					Broken2();
					$("#Bine1").remove();
					var line1_html = "<div class='fy-bar-div' id='Bine1'></div>";
					$("#Eum1").append(line1_html);
				}
			 });
			});

		});
function linen(){
    // 耗材-饼图1
    var myChartPie1 = echarts.init(document.getElementById('zy_Gauge1'));
    // 指定图表的配置项和数据
    optionPie1 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}(元) ({d}%)"
        },
        legend: {
            orient: 'vertical',
			bottom: '4%',
			right: '8%',
			itemWidth:10,
            itemHeight:10,
            data: ['药品费', '检查检验费', '诊疗费', '手术费','耗材费','自费金额']
        },
        series: [
            {
                name: '费用项目',
                type: 'pie',
                center: ['35%','45%'],
                radius: ['50%', '80%'],
                avoidLabelOverlap: false,
                labelLine: {
                    normal: {
                    show: false,
                    position: 'center'
                    }
                },
                data: [
                    {value: 11079.71, name: '药品费', itemStyle: {normal: {color: '#a8ce67'}}},
                    {value: 7240, name: '检查检验费', itemStyle: {normal: {color: '#d9608c'}}},
                    {value: 3628.4, name: '诊疗费', itemStyle: {normal: {color: '#efb04f'}}},
                    {value: 2103, name: '手术费', itemStyle: {normal: {color: '#ece362'}}},
                    {value: 4285.8, name: '耗材费', itemStyle: {normal: {color: '#4cb5e3'}}},
                    {value: 1200, name: '自费金额', itemStyle: {normal: {color: '#71659d'}}},
                ],
				label:{
                normal:{
                    show:false
                }
            }
            }
        ]
    };
	// 使用刚指定的配置项和数据显示图表。
    myChartPie1.setOption(optionPie1);
	window.addEventListener("resize", function () {
        myChartPie1.resize();
    });
};

	//月度变化趋势
	//按科室统计-月度变化趋势-折线图
    /*单项目控费-月费用月度变化趋势-折线图*/
    /*单项目控费-月费用月度变化趋势-折线图*/
	//月度变化趋势
	//按科室统计-月度变化趋势-折线图
	function Broken1() {
		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById('Bine1'));
		var data1 = [120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
		var data2 = [36000, 29000, 21470, 19880, 25540, 21860, 19350, 20100, 26320, 19920, 27640, 17630];
		var data3 = [26000, 27000, 19770, 19880, 17540, 14580, 21010, 22100, 21320, 19820, 22360, 19830];
		var data4 = [36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73];
		var data5 = [560, 400, 470, 588, 354, 286, 735, 500, 332, 120, 564, 333];
		var data6 = [1000, 1100, 970, 1088, 754, 686, 1135, 900, 632, 720, 464, 533];
		var data7 = [480, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
		var data8= [120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
		var data9 = [36000, 29000, 21470, 19880, 25540, 21860, 19350, 20100, 26320, 19920, 27640, 17630];
		var data10 = [26000, 27000, 19770, 19880, 17540, 14580, 21010, 22100, 21320, 19820, 22360, 19830];
		var data11 = [36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73];
		var data12= [560, 400, 470, 588, 354, 286, 735, 500, 332, 120, 564, 333];
		var data13 = [142, 502, 762, 745, 674, 745, 832, 900, 632, 720, 464, 533];
		var data14 = [480, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
		var option = {
			tooltip: {
				trigger: 'axis',
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend: {
				left: "48%",
				top: '0%',
				itemWidth:10,
				itemHeight:10,
				data: [
					{
						name: '药费',
						icon: 'roundRect'
					},
					{
						name: '检查检验费',
						icon: 'roundRect'
					},
					{
						name: '手术麻醉费',
						icon: 'roundRect'
					},
					{
						name: '医用耗材费',
						icon: 'roundRect'
					},
					{
						name: '高值耗材费',
						icon: 'roundRect'
					},
					{
						name: '治疗费',
						icon: 'roundRect'
					},
					{
						name: '血费',
						icon: 'roundRect'
					},
					{
						name: '',
						icon: ''
					},
					{
						name: '药费占比',
						icon: 'roundRect'
					},
					{
						name: '检查检验费占比',
						icon: 'roundRect'
					},
					{
						name: '手术麻醉费占比',
						icon: 'roundRect'
					},
					{
						name: '医用耗材费占比',
						icon: 'roundRect'
					},
					{
						name: '高值耗材费占比',
						icon: 'roundRect'
					},
					{
						name: '治疗费占比',
						icon: 'roundRect'
					},
					{
						name: '血费占比',
						icon: 'roundRect'
					}
				]
			},
			grid: {
				top: '28%',
				left: '2%',
				right: '4%',
				bottom: '10%',
				containLabel: true
			},
			toolbox: {
				show: true,
				left: "25%",
				top: "0%",
				feature: {
					magicType: {type: ['line', 'bar']}
				}
			},
			xAxis: [
				{
					type: 'category',
					boundaryGap: false,
					axisLabel: {
						interval: 0,//横轴信息全部显示
						rotate: 0,//-30度角倾斜显示
						textStyle: {
                            color: '#333333'
                        }
					},
					axisLine:{
						lineStyle:{
                            color:'#dedede'}
						},
					data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
				}
			],
			yAxis: [
				{//  隐藏y轴
				axisLine: {show: false,lineStyle:{color:'#666666'}},
				// 去除y轴上的刻度线
				axisTick: {show: false },
					type: 'value',
					name: '金额(元)',
					boundaryGap: [0, 0.01],
					splitLine: {
						show: true,
						lineStyle: {
							color:'#dedede'}
					},
					axisLabel: {
						formatter: '{value}',
						textStyle: {
                            color: '#999'
                        }
					}
					
				},
				{//  隐藏y轴
				axisLine: {show: false, lineStyle:{color:'#666666'}},
				// 去除y轴上的刻度线
				axisTick: {show: false },
					type: 'value',
					name: '人次',
					axisLine: {
						lineStyle: {
							width: 0
						}
					},
					splitLine: {
						show: true,
						lineStyle: {
							color:'#dedede'}
					},
					axisLabel: {
						formatter: '{value}',
						textStyle: {
                            color: '#999'
                        }
					}
				},
			],
			series: [
				{
					name: "药费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#45C8DB'
						}
					},
					symbolSize: 2,
					data: data1
				},
				{
					name: " 检查检验费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#FF9948'
						}
					},
					symbolSize: 2,
					data: data2
				},
				{
					name: "手术麻醉费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#45C8DB'
						}
					},
					symbolSize: 2,
					data: data3
				},
				{
					name: "医用耗材费",
					yAxisIndex: 1,
					type: "line",
					itemStyle: {
						normal: {
							color: '#E27AB0'
						}
					},
					symbolSize: 2,
					data: data4
				},
				{
					name: "高值耗材费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#7A8BE2'
						}
					},
					symbolSize: 2,
					data: data5
				},
				{
					name: "治疗费",
					yAxisIndex: 1,
					type: "line",
					itemStyle: {
						normal: {
							color: '#E27AB0'
						}
					},
					symbolSize: 2,
					data: data6
				},
				{
					name: "血费",
					yAxisIndex: 1,
					type: "line",
					itemStyle: {
						normal: {
							color: '#5FC14C'
						}
					},
					symbolSize: 2,
					data: data7
				},
				{
					name: "药费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#74cd2c'
						}
					},
					symbolSize: 2,
					data: data1
				},
				{
					name: " 检查检验费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#bc6c04'
						}
					},
					symbolSize: 2,
					data: data2
				},
				{
					name: "手术麻醉费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#077ded'
						}
					},
					symbolSize: 2,
					data: data3
				},
				{
					name: "医用耗材费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#facd22'
						}
					},
					symbolSize: 2,
					data: data4
				},
				{
					name: "高值耗材费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#66c0e2'
						}
					},
					symbolSize: 2,
					data: data5
				},
				{
					name: "治疗费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#6bd4b6'
						}
					},
					symbolSize: 2,
					data: data6
				},
				{
					name: "血费占比",
					type: "line",
					itemStyle: {
						normal: {
							color: '#c36cc2'
						}
					},
					symbolSize: 2,
					data: data7
				}
			]
		};
		// 为echarts对象加载数据
		myChart.setOption(option);

		var triggerAction = function (action, selected) {
			legend = [];

			for (name in selected) {
				if (selected.hasOwnProperty(name)) {
					legend.push({name: name});
				}
			}
			myChart.dispatchAction({
				type: action,
				batch: legend
			});
		};

		var isFirstUnSelect = function (selected) {
			var unSelectedCount = 0;

			for (name in selected) {
				if (!selected.hasOwnProperty(name)) {
					continue;
				}

				else if (selected[name] == false) {
					++unSelectedCount;
				}
			}

			return unSelectedCount == 1;
		};

		var isAllUnSelected = function (selected) {
			var selectedCount = 0;
			for (name in selected) {
				if (!selected.hasOwnProperty(name)) {
					continue;
				}

				// 所有 selected Object 里面 true 代表 selected， false 代表 unselected
				if (selected[name] == true) {
					++selectedCount;
				}
			}
			return selectedCount == 0;
		};

		myChart.on('legendselectchanged', function (obj) {
			var selected = obj.selected;
			var legend = obj.name;
			// 使用 legendToggleSelect Action 会重新触发 legendselectchanged Event，导致本函数重复运行
			// 使得 无 selected 对象
			if (selected != undefined) {
				if (isFirstUnSelect(selected)) {
					triggerAction('legendToggleSelect', selected);
				} else if (isAllUnSelected(selected)) {
					triggerAction('legendSelect', selected);
				}
			}

		});

		window.addEventListener("resize", function () {
			myChart.resize();
		});
	}
/*按人均统计-月度变化趋势-折线图*/
	function Broken2() {
		// 基于准备好的dom，初始化echarts图表
		var myChart = echarts.init(document.getElementById('Bine2'));
		var data1 = [120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
		var data2 = [36000, 29000, 21470, 19880, 25540, 21860, 19350, 20100, 26320, 19920, 27640, 17630];
		var data3 = [26000, 27000, 19770, 19880, 17540, 14580, 21010, 22100, 21320, 19820, 22360, 19830];
		var data4 = [36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73];
		var data5 = [560, 400, 470, 588, 354, 286, 735, 500, 332, 120, 564, 333];
		var data6 = [1000, 1100, 970, 1088, 754, 686, 1135, 900, 632, 720, 464, 533];
		var data7 = [480, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
		var option = {
			tooltip: {
				trigger: 'axis',
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend: {
				left: "50%",
				top: '0%',
				itemWidth:10,
				itemHeight:10,
				data: [
					{
						name: '人均药品费',
						icon: 'roundRect'
					},
					{
						name: '人均检查检验费',
						icon: 'roundRect'
					},
					{
						name: '人均手术麻醉费',
						icon: 'roundRect'
					},
					{
						name: '人均医用耗材费',
						icon: 'roundRect'
					},
					{
						name: '人均高值耗材费',
						icon: 'roundRect'
					},
					{
						name: '人均治疗费',
						icon: 'roundRect'
					},
					{
						name: '人均血费',
						icon: 'roundRect'
					}
				]
			},
			grid: {
				top: '28%',
				left: '2%',
				right: '4%',
				bottom: '10%',
				containLabel: true
			},
			toolbox: {
				show: true,
				left: "40%",
				top: "0%",
				feature: {
					magicType: {type: ['line', 'bar']}
				}
			},
			xAxis: [
				{
					type: 'category',
					boundaryGap: false,
					axisLabel: {
						interval: 0,//横轴信息全部显示
						rotate: 0,//-30度角倾斜显示
						textStyle: {
                            color: '#333333'
                        }
					},
					axisLabel: {
						interval: 0,//横轴信息全部显示
						rotate: 0,//-30度角倾斜显示
						textStyle: {
                            color: '#333333'
                        }
					},
					axisLine:{
						lineStyle:{
                            color:'#dedede'}
						},
					data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
				}
			],
			yAxis: [
				{ //  隐藏y轴
				axisLine: {show: false,lineStyle:{color:'#666666'}},
				// 去除y轴上的刻度线
				axisTick: {show: false },
					type: 'value',
					name: '金额(元)',
					boundaryGap: [0, 0.01],
					splitLine: {
						lineStyle: {
							type: 'dashed'
						}
					},
				splitLine: {
						show: true,
						lineStyle: {
							color:'#dedede'}
					},
					axisLabel: {
						formatter: '{value}',
						textStyle: {
                            color: '#999'
                        }
					}
				},
				{//  隐藏y轴
				axisLine: {show: false,lineStyle:{color:'#666666'}},
				// 去除y轴上的刻度线
				axisTick: {show: false },
					type: 'value',
					name: '人次',
					axisLine: {
						lineStyle: {
							width: 0
						}
					},
					splitLine: {
						show: true,
						lineStyle: {
							color:'#dedede'}
					},
					axisLabel: {
						formatter: '{value}',
						textStyle: {
                            color: '#999'
                        }
					}
				}
			],
			series: [
				{
					name: "人均药品费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#45C8DB'
						}
					},
					symbolSize: 2,
					data: data1
				},
				{
					name: "人均检查检验费",
					type: "line",
					itemStyle: {
						normal: {
							color: '#FF9948'
						}
					},
					symbolSize: 2,
					data: data2
				},
				{
					name: "人均手术麻醉费",
					type: "line",
					itemStyle: {
						normal: {
							color: '#45C8DB'
						}
					},
					symbolSize: 2,
					data: data3
				},
				{
					name: "人均医用耗材费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#E27AB0'
						}
					},
					symbolSize: 2,
					data: data4
				},
				{
					name: "人均高值耗材费",
					type: "line",
					yAxisIndex: 1,
					itemStyle: {
						normal: {
							color: '#7A8BE2'
						}
					},
					symbolSize: 2,
					data: data5
				},
				{
					name: "人均治疗费",
					type: "line",
					itemStyle: {
						normal: {
							color: '#E27AB0'
						}
					},
					symbolSize: 2,
					data: data6
				},
				{
					name: "人均血费",
					type: "line",
					itemStyle: {
						normal: {
							color: '#5FC14C'
						}
					},
					symbolSize: 2,
					data: data7
				}
			]
		};
		// 为echarts对象加载数据
		myChart.setOption(option);

		var triggerAction = function (action, selected) {
			legend = [];

			for (name in selected) {
				if (selected.hasOwnProperty(name)) {
					legend.push({name: name});
				}
			}
			myChart.dispatchAction({
				type: action,
				batch: legend
			});
		};

		var isFirstUnSelect = function (selected) {
			var unSelectedCount = 0;

			for (name in selected) {
				if (!selected.hasOwnProperty(name)) {
					continue;
				}

				else if (selected[name] == false) {
					++unSelectedCount;
				}
			}

			return unSelectedCount == 1;
		};

		var isAllUnSelected = function (selected) {
			var selectedCount = 0;
			for (name in selected) {
				if (!selected.hasOwnProperty(name)) {
					continue;
				}

				// 所有 selected Object 里面 true 代表 selected， false 代表 unselected
				if (selected[name] == true) {
					++selectedCount;
				}
			}
			return selectedCount == 0;
		};

		myChart.on('legendselectchanged', function (obj) {
			var selected = obj.selected;
			var legend = obj.name;
			// 使用 legendToggleSelect Action 会重新触发 legendselectchanged Event，导致本函数重复运行
			// 使得 无 selected 对象
			if (selected != undefined) {
				if (isFirstUnSelect(selected)) {
					triggerAction('legendToggleSelect', selected);
				} else if (isAllUnSelected(selected)) {
					triggerAction('legendSelect', selected);
				}
			}

		});

		window.addEventListener("resize", function () {
			myChart.resize();
		});
	}
    </script>
</body>
</html>