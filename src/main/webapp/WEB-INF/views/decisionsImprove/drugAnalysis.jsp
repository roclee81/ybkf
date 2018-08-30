<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>药品分析</title>

    <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath }/static/js/common.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <style>
        .gauge-div {
            width: 22%;
			margin-top:14px !important;
			margin-bottom:0px !important;
        }

        #zy_Gauge1 {
            height: 200px
        }

        #zy_Gauge2 {
            height: 200px
        }

        #zy_Gauge3 {
            height: 200px
        }
		#NM_Gauge1{height:240px;}
		#NM_Gauge2{height:240px;}
		#NM_Gauge3{height:240px;}
		.Cost_top{margin-bottom:14px; padding:10px 0; display:none;}
		.Cost_top .Right_cost{}
		.yb-jj-div{padding:0;}
		.gauge-title-div table tr > td{color:#333333 !important; line-height:40px;}
		.sx-dj td:nth-child(4){padding-left:10px;}
		.body-width{width:100%;}
		.sx-dj{margin:10px 0 0px}
    </style>
</head>
<body>
<!--筛选条件-->
<div class="header-div bg-color">
    <table class="ys-table" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
                日期
            </td>
            <td>
                <div class="input-group date form_date" style="float: right">
                    <input class="padding-left4" size="10" type="text">
                    <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                    &nbsp;至&nbsp;
                </div>
            </td>
            <td style="padding-left: 0px">
                <div class="input-group date form_date float">
                    <input class="padding-left4" size="10" type="text">
                    <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                </div>
            </td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
                <select>
                    <option value="0">全院</option>
                    <option value="1">内科</option>
                    <option value="1">外科</option>
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
<!--第一排图表-->

    <div class="tab-div-box">
        <!--医保基金利用情况-->
            <div class="yb-jj-div ">
            	<div class="gauge-div float bg-color" style="margin-right: 1%; height:279px; width:30%">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">中西药费用及占比</td>
                            </tr>
                        </table>
                    </div>
                    <div class="float fy-pie-div" id="pie1">

                    </div>
                </div>
                <div class="gauge-div float bg-color">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">甲占比</td>
                            </tr>
                        </table>
                    </div>
                    <div id="num_a">
                        <div id="zy_Gauge1">

                        </div>

                    </div>
                    <div class="gauge-bom ">
                        <table class="body-width">
                            <tr>
                                <td class="center-td">同比增长：<span>3.68%</span></td>
                                <td class="center-td">环比增长：<span>3.61%</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="gauge-div float bg-color" style="margin-left:1.3%">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">乙占比</td>
                            </tr>
                        </table>
                    </div>
                    <div id="num_b">
                        <div id="zy_Gauge2">

                        </div>
                    </div>
                    <div class="gauge-bom">
                        <table class="body-width">
                            <tr>
                                <td class="center-td">同比增长：<span>4%</span></td>
                                <td class="center-td">环比增长：<span>3.78%</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="gauge-div float bg-color" style="margin-left:1.3%">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">目录外药占比</td>
                            </tr>
                        </table>
                    </div>
                    <div id="num_c">
                        <div id="zy_Gauge3">

                        </div>
                    </div>
                    <div class="gauge-bom">
                        <table class="body-width">
                            <tr>
                                <td class="center-td">同比增长：<span>2.3%</span></td>
                                <td class="center-td">环比增长：<span>2.1%</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            
        </div>
    </div>
    <div class="clear"></div>
    <div class="body-width margin-top10">
        <div class="clear"></div>
    </div>
    <!--药品-->
<div class="body-width margin-top6 bg-color margin-bottom20">
    <div class="header-div bg-color">
        <div class="margin-bottom20">
            <!--选项卡-->
            <table class="sx-dj">
                <tr>
                    <td>
                        <button class="xy-button  xy-btn-select">药品类别排序</button>
                        <button class="xy-button margin-left10">药品种类排序</button>
                        <button class="xy-button margin-left10">单品牌药品使用趋势 </button>
                    </td>
                    <td class="fs_14">药品种类</td>
                    <td>
                        <select style="padding-right: 20px">
                            <option>抗生素类药品</option>
                            <option>心脑血管用药</option>
                            <option>消化系统用药</option>
                            <option>呼吸系统用药</option>
                            <option>泌尿系统用药</option>
                            <option>血液系统用药</option>
                        </select>
                    </td>
                    <td class="fs_14">单品牌药品</td>
                    <td>
                        <select style="padding-right: 20px" class="margin-right10">
                            <option>阿莫西林胶囊</option>
                            <option>氯化钠注射液</option>
                            <option>葡萄糖注射液</option>
                            <option>奥美拉唑肠溶胶囊</option>
                            <option>地佐辛</option>
                            <option>氨氯地平</option>
                        </select>
                    </td>

                </tr>
            </table>
<div class="tab_box">
    <!-- 药品类别费用top10 -->
    <div class="Cost_top bg-color" style="display:block;">
        <div class="gauge-div" style="margin:0 0 0 10px !important; width:100%;">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title">
                        </td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-primary margin-right10"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Bum1">
                <div id="NM_Gauge1">

                </div>
            </div>
        </div>
 		<div class="yb-jj-div body-width" style="padding:0 10px">
            <div class="ys-rc-div ">
                <table class="body-width common-table">
                        <tbody>
                        <tr class="th-bg">
                            <th>排名</th>
                            <th>药品类别</th>
                            <th>金额</th>
                            <th>占药品金额总比例</th>
                        </tr>
                        <tr>
                            <td>01</td>
                            <td class="left">抗生素类药品</td>
                            <td class="right">23500</td>
                            <td class="right">20%</td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td class="left">心脑血管用药</td>
                            <td class="right">12400</td>
                            <td class="right">15%</td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td class="left">消化系统用药</td>
                            <td class="right">23560</td>
                            <td class="right">25%</td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td class="left">呼吸系统用药</td>
                            <td class="right">24500</td>
                            <td class="right">10%</td>
                        </tr>
                        <tr>
                            <td>05</td>
                            <td class="left">泌尿系统用药</td>
                            <td class="right">42000</td>
                            <td class="right">12%</td>
                        </tr>
                        <tr>
                            <td>06</td>
                            <td class="left">血液系统用药</td>
                            <td class="right">12000</td>
                            <td class="right">8%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
    </div>
    <div class="Cost_top bg-color">
        <div class="gauge-div" style="margin:0 0 0 10px !important;width:100%;">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title">
                        </td>
                        <td class="right fs_16 table-title">
                            <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Bum2">
                <div id="NM_Gauge2">

                </div>
            </div>
        </div>
        <div class="Right_cost">
            <div class="body-width" style="padding:0 10px">
                <div class="ys-rc-div">
                    <table class="zy-table body-width common-table">
                        <tbody>
                        <tr class="bg-color1">
                            <th>药品名称</th>
                            <th>药品累计金额</th>
                            <th>当月金额</th>
                            <th>同比增长率</th>
                        </tr>
                        <tr>
                            <td>阿莫西林胶囊</td>
                            <td class="right">36220</td>
                            <td class="right">1401</td>
                            <td class="right">20%</td>
                        </tr>
                        <tr>
                            <td>氯化钠注射液</td>
                            <td class="right">45620</td>
                            <td class="right">2350</td>
                            <td class="right">15%</td>
                        </tr>
                        <tr>
                            <td>葡萄糖注射液</td>
                            <td class="right">12400</td>
                            <td class="right">3520</td>
                            <td class="right">25%</td>
                        </tr>
                        <tr>
                            <td>奥美拉唑肠溶胶囊</td>
                            <td class="right">14523</td>
                            <td class="right">1452</td>
                            <td class="right">10%</td>
                        </tr>
                        <tr>
                            <td>地佐辛</td>
                            <td class="right">45721</td>
                            <td class="right">1524</td>
                            <td class="right">12%</td>
                        </tr>
                        <tr>
                            <td>氨氯地平</td>
                            <td class="right">8562</td>
                            <td class="right">4520</td>
                            <td class="right">8%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <div class="Cost_top bg-color">
        <div class="gauge-div" style="margin:0 0 0 10px !important;width:100%;">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title">
                        </td>
                        <td class="right fs_16 table-title">
                            <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Bum3">
                <div id="NM_Gauge3">

                </div>
            </div>
        </div>
        <div class="Right_cost">
            <div class="body-width" style="padding:0 10px">
                <div class="ys-rc-div">
                    <table class="zy-table body-width common-table">
                        <tbody>
                        <tr class="bg-color1">
                            <th>月份</th>
                            <th>药品名称</th>
                            <th>药品规格</th>
                            <th>当月金额</th>
                            <th>同比增长率</th>
                        </tr>
                        <tr>
                            <td>1月</td>
                            <td class="left">阿莫西林胶囊</td>
                            <td class="left">5g/盒</td>
                            <td class="right">1401</td>
                            <td class="right">20%</td>
                        </tr>
                        <tr>
                            <td>2月</td>
                            <td class="left">阿莫西林胶囊</td>
                            <td class="left">5g/盒</td>
                            <td class="right">12400</td>
                            <td class="right">15%</td>
                        </tr>
                        <tr>
                            <td>3月</td>
                            <td class="left">阿莫西林胶囊</td>
                            <td class="left">5g/盒</td>
                            <td class="right">23560</td>
                            <td class="right">25%</td>
                        </tr>
                        <tr>
                            <td>4月</td>
                            <td class="left">阿莫西林胶囊</td>
                            <td class="left">5g/盒</td>
                            <td class="right">24500</td>
                            <td class="right">10%</td>
                        </tr>
                        <tr>
                            <td>5月</td>
                            <td class="left">阿莫西林胶囊</td>
                            <td class="left">5g/盒</td>
                            <td class="right">42000</td>
                            <td class="right">12%</td>
                        </tr>
                        <tr>
                            <td>6月</td>
                            <td class="left">阿莫西林胶囊</td>
                            <td class="left">5g/盒</td>
                            <td class="right">12000</td>
                            <td class="right">8%</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
        </div>
    </div>
</div>
</div>
<script>
    /*初始化*/
    $(document).ready(function () {
		x_data1 = ['抗生素类药品','心脑血管用药','消化系统用药','呼吸系统用药','泌尿系统用药','血液系统用药'];
		bar_data1_1 = [2400, 2200, 2000,1800, 1600, 1400];
		x_data2 = ['阿莫西林胶囊','氯化钠注射液','葡萄糖注射液','奥美拉唑肠溶胶囊','地佐辛','氨氯地平'];
		bar_data2_1 = [2400, 2200, 2000,1800, 1600, 1400];
		x_data3 = ['1月','2月','3月','4月','5月','6月'];
		bar_data3_1 = [2400, 2200, 2000,1800, 1600, 1400];
		Pine();
        Gauge();
		});
    /*同比鼠标事件*/
    $(".same").on({
        "mouseenter": function () {
            $(this).next().css("display", "block");
        },
        "mouseleave": function () {
            $(this).next().css("display", "none");
        }
    });
    $(".sequential").on({
        "mouseenter": function () {
            $(this).next().css("display", "block");
        },
        "mouseleave": function () {
            $(this).next().css("display", "none");
        }
    });

    //选项卡
    $(".xy-button").on({
        "mouseenter": function () {
            if (!$(this).hasClass("xy-btn-active")) {
                $(this).addClass("xy-btn-active");
            }
        },
        "mouseleave": function () {
            $(this).removeClass("xy-btn-active");
        },
        "click": function () {
            var index = $(this).index();
            $(this).addClass("xy-btn-select").siblings().removeClass("xy-btn-select");
            $(this).siblings().removeClass("xy-btn-active");
            $(this).parent().parent().parent().parent().parent().find(".tab_box > .Cost_top").eq(index).css("display", "block").siblings().css("display", "none");
            if (index == 0) {
                Pine();
            } else if(index == 1) {
                Pine2();
            }else{
				Pine3();
				}
        }
    });
	//患者来源分布-柱状图
	function Pine(){
		var Chart_bar1 = echarts.init(document.getElementById('NM_Gauge1'));
		// 指定图表的配置项和数据
		
		option_bar1 = {
			tooltip: {
				trigger: 'axis',
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend: {
				right:'10%',
				top: 0
			},
			grid: {
				top: 40,
				left: '2%',
				right: '2%',
				bottom: '10%',
				containLabel: true
				
			},
			xAxis: [
				{
					type: 'category',
					nameRotate: 50,
					axisPointer: {
						type: 'shadow'
					},
					data: x_data1,
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
						}
				}
			],
			yAxis: [
				{
				//  隐藏y轴
				axisLine: {show: false},
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
            }
			],
			itemStyle:{
				emphasis: {
                            barBorderRadius: [10, 10, 10, 10]
                        },
                         
                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10]
                        }
				},
			series: [
			{
                name: '金额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#41afd6'
                    }
                },
                barWidth: 12,
                data:bar_data1_1
            }
			]
		};

		// 使用刚指定的配置项和数据显示图表。
		Chart_bar1.setOption(option_bar1);
      // 图例开关的行为只会触发 legendselectchanged 事件
        Chart_bar1.on('click', function (params) {
            // 获取点击图例的选中状态

            $(".tab_box > div").eq(1).css("display", "block").siblings().css("display", "none");
			$(".sx-dj .xy-button").eq(1).addClass("xy-btn-select").siblings().removeClass("xy-btn-select");
            Pine2();

        });
		window.addEventListener("resize", function () {
			Chart_bar1.resize();
		});

	};
    function Pine2(){
		var Chart_bar2 = echarts.init(document.getElementById('NM_Gauge2'));
		// 指定图表的配置项和数据
		option_bar2 = {
			tooltip: {
				trigger: 'axis',
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend: {
				right:'10%',
				top: 0
			},
			grid: {
				top: 40,
				left: '2%',
				right: '2%',
				bottom: '16%',
				containLabel: true
			},
			xAxis: [
				{
					type: 'category',
					nameRotate: 50,
					axisPointer: {
						type: 'shadow'
					},
					data: x_data2,
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
						}
				}
			],
			yAxis: [
				{
				//  隐藏y轴
				axisLine: {show: false},
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
            }
			],
			itemStyle:{
				emphasis: {
                            barBorderRadius: [10, 10, 10, 10]
                        },
                         
                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10]
                        }
				},
			series: [
				{
                name: '金额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#41afd6'
                    }
                },
                barWidth: 12,
                data:bar_data2_1
            }
			]
		};
		// 使用刚指定的配置项和数据显示图表。
		Chart_bar2.setOption(option_bar2);
// 图例开关的行为只会触发 legendselectchanged 事件
        Chart_bar2.on('click', function (params) {
            // 获取点击图例的选中状态

            $(".tab_box > div").eq(2).css("display", "block").siblings().css("display", "none");
			$(".sx-dj .xy-button").eq(2).addClass("xy-btn-select").siblings().removeClass("xy-btn-select");
            Pine3();

        });
		window.addEventListener("resize", function () {
			Chart_bar2.resize();
		});
	};
    function Pine3(){
		var Chart_bar3 = echarts.init(document.getElementById('NM_Gauge3'));
		// 指定图表的配置项和数据
		option_bar3 = {
			tooltip: {
				trigger: 'axis',
				axisPointer: {            // 坐标轴指示器，坐标轴触发有效
					type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend: {
				right:'10%',
				top: 0
			},
			grid: {
				top: 40,
				left: '2%',
				right: '2%',
				bottom: '16%',
				containLabel: true
			},
			xAxis: [
				{
					type: 'category',
					nameRotate: 50,
					axisPointer: {
						type: 'shadow'
					},
					data: x_data3,
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
						}
				}
			],
			yAxis: [
				{
				//  隐藏y轴
				axisLine: {show: false},
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
            }
			],
			itemStyle:{
				emphasis: {
                            barBorderRadius: [10, 10, 10, 10]
                        },
                         
                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10]
                        }
				},
			series: [
				{
                name: '金额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#41afd6'
                    }
                },
                barWidth: 12,
                data:bar_data3_1
            }
			]
		};
		// 使用刚指定的配置项和数据显示图表。
		Chart_bar3.setOption(option_bar3);

		window.addEventListener("resize", function () {
			Chart_bar3.resize();
		});
	};
    /*仪表盘*/
    function Gauge() {
        //仪表图1
        var Chart_zy_Gauge1 = echarts.init(document.getElementById('zy_Gauge1'));
        var gauge1_date = 85;
        var gauge1_ze = 100;
        var gauge1_percent = Number((gauge1_date / gauge1_ze).toPrecision(2));

        // 指定图表的配置项和数据
        option_zy_Gauge1 = {
            tooltip: {
                formatter: "{a} <br/>{b} : {c}(万元)"
            },
            series: [
                {
                    name: '本月使用',
                    type: 'gauge',
                    center: ['50%', '58%'],    // 默认全局居中
                    radius: '78%',
                    min: 0,                     // 最小值
                    max: gauge1_ze,                   // 最大值
                    splitNumber: 10,             // 分割段数，默认为5
                    axisLine: {            // 坐标轴线
                        show: true,        // 默认显示，属性show控制显示与否
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[gauge1_percent, '#ED86A4'], [1, '#dedede']],
                            width: 20
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show: true,        // 属性show控制显示与否，默认不显示
                        splitNumber: 5,    // 每份split细分多少段
                        length: 5,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: '#ffffff',
                            width: 1,
                            type: 'solid'
                        }
                    },
                    axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                        show: true,
                        distance: -28,
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#999',
                            fontSize: 12,
                            fontWeight:200
                        }
                    },
                    splitLine: {           // 分隔线
                        show: true,        // 默认显示，属性show控制显示与否
                        length: 8,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: '#ffffff',
                            width: 1,
                            type: 'solid'
                        }
                    },
                    pointer: {
                        show: false,
                        length: '60%',
                        width: 8,
                        color: 'auto'
                    },
                    title: {
                        show: true,
                        offsetCenter: [0, '-2%'],
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#999',
                            fontSize: 14
                        }
                    },
                    detail: {
                        show: true,
                        backgroundColor: 'rgba(0,0,0,0)',
                        borderWidth: 0,
                        borderColor: '#ccc',
                        offsetCenter: [0, '10%'],
                        formatter: '{value}(%)',
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#ED86A4',
                            fontSize: 14
                        }
                    },
                    data: [{value: gauge1_date, name: ''}]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_zy_Gauge1.setOption(option_zy_Gauge1);
        //仪表图2
        var Chart_zy_Gauge2 = echarts.init(document.getElementById('zy_Gauge2'));
        // 指定图表的配置项和数据
        var gauge2_date = 15;
        var gauge2_ze = 100;
        var gauge2_percent = Number((gauge2_date / gauge2_ze).toPrecision(2));

        option_zy_Gauge2 = {
            tooltip: {
                formatter: "{a} :<br/> {c}(万元)"
            },
            series: [
                {
                    name: '年度使用',
                    type: 'gauge',
                    center: ['50%', '58%'],    // 默认全局居中
                    radius: '78%',
                    min: 0,                     // 最小值
                    max: gauge2_ze,                   // 最大值
                    precision: 0,               // 小数精度，默认为0，无小数点
                    splitNumber: 10,             // 分割段数，默认为5
                    axisLine: {            // 坐标轴线
                        show: true,        // 默认显示，属性show控制显示与否
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[gauge2_percent, '#A8CD64'], [1.0, '#E5E5E5']],
                            width: 20
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show: true,        // 属性show控制显示与否，默认不显示
                        splitNumber: 5,    // 每份split细分多少段
                        length: 2,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: '#eee',
                            width: 1,
                            type: 'solid'
                        }
                    },
                    axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                        show: true,
                        distance: -34,
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#999',
                            fontSize: 12,
                            fontWeight:200
                        }
                    },
                    splitLine: {           // 分隔线
                        show: true,        // 默认显示，属性show控制显示与否
                        length: 8,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: '#eee',
                            width: 2,
                            type: 'solid'
                        }
                    },
                    pointer: {
                        show: false,
                        length: '60%',
                        width: 8,
                        color: 'auto'
                    },
                    title: {
                        show: true,
                        offsetCenter: [0, '-2%'],
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#333',
                            fontSize: 16
                        }
                    },
                    detail: {
                        show: true,
                        backgroundColor: 'rgba(0,0,0,0)',
                        borderWidth: 0,
                        borderColor: '#ccc',
                        width: 100,
                        height: 40,
                        offsetCenter: [0, '10%'],
                        formatter: '{value}%',
                        textStyle: {      // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#A8CD64',
                            fontSize: 14
                        }
                    },
                    data: [{value: gauge2_date, name: ''}]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_zy_Gauge2.setOption(option_zy_Gauge2);
        //仪表图3
        var Chart_zy_Gauge3 = echarts.init(document.getElementById('zy_Gauge3'));
        // 指定图表的配置项和数据
        var gauge3_date = 35;
        var gauge3_ze = 100;
        var gauge3_percent = Number((gauge3_date / gauge3_ze).toPrecision(2));

        option_zy_Gauge3 = {
            tooltip: {
                formatter: "{a} :<br/> {c}(万元)"
            },
            series: [
                {
                    name: '年度使用',
                    type: 'gauge',
                    center: ['50%', '58%'],    // 默认全局居中
                    radius: '78%',
                    min: 0,                     // 最小值
                    max: gauge3_ze,                   // 最大值
                    precision: 0,               // 小数精度，默认为0，无小数点
                    splitNumber: 10,             // 分割段数，默认为5
                    axisLine: {            // 坐标轴线
                        show: true,        // 默认显示，属性show控制显示与否
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[gauge3_percent, '#EFB04F'], [1, '#E5E5E5']],
                            width: 20
                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show: true,        // 属性show控制显示与否，默认不显示
                        splitNumber: 5,    // 每份split细分多少段
                        length: 2,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: '#eee',
                            width: 1,
                            type: 'solid'
                        }
                    },
                    axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                        show: true,
                        distance: -34,
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#999',
                            fontSize: 12,
                            fontWeight:200
                        }
                    },
                    splitLine: {           // 分隔线
                        show: true,        // 默认显示，属性show控制显示与否
                        length: 8,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: '#ffffff',
                            width: 2,
                            type: 'solid'
                        }
                    },
                    pointer: {
                        show: false,
                        length: '60%',
                        width: 8,
                        color: 'auto'
                    },
                    title: {
                        show: true,
                        offsetCenter: [0, '-2%'],
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#333',
                            fontSize: 16
                        }
                    },
                    detail: {
                        show: true,
                        backgroundColor: 'rgba(0,0,0,0)',
                        borderWidth: 0,
                        borderColor: '#ccc',
                        width: 100,
                        height: 40,
                        offsetCenter: [0, '10%'],
                        formatter: '{value}%',
                        textStyle: {      // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#EFB04F',
                            fontSize: 14
                        }
                    },
                    data: [{value: gauge3_date, name: ''}]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_zy_Gauge3.setOption(option_zy_Gauge3);
        window.addEventListener("resize", function () {
            Chart_zy_Gauge1.resize();
            Chart_zy_Gauge2.resize();
            Chart_zy_Gauge3.resize();
        });
    }
    ;

    // 饼图
    var myChartPie = echarts.init(document.getElementById('pie1'));
    // 指定图表的配置项和数据
    optionPie = {
        title: {
            text: "",
            left: "center",
            top: '3%',
            textStyle: {
                fontSize: 14,
                fontWeight: 500
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}(元) ({d}%)"
        },
        legend: {
            orient: 'vertical',
            right: '1%',
            top: 100,
            textStyle: {
                fontSize: 12
            },
            orient: 'vertical',
            data: ['西药', '中药', '中成药', '中草药',]
        },
        series: [
            {
                name: '',
                type: 'pie',
                selectedMode: 'single',
                center: ['35%', '55%'],
                radius: [0, '50%'],
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: 'inside',
                        fontSize: 14
                    }
                },
                data: [
                    {value: 38135.4, name: '中药', itemStyle: {normal: {color: '#bd6da5'}}},
                    {value: 178893.1, name: '西药', itemStyle: {normal: {color: '#BAD787'}}}
                ]
            },
            {
                name: '',
                type: 'pie',
                center: ['35%', '55%'],
                radius: ['60%', '80%'],
                selectedMode: 'single',
                labelLine: {
                    normal: {
                        length: 8,
                        length2: 5
                    }
                },
                data: [
                    {value: 26785.1, name: '中成药', itemStyle: {normal: {color: '#71659d'}}},
                    {value: 11350.3, name: '中草药', itemStyle: {normal: {color: '#65b7e3'}}},
                    {value: 178893.1, name: '西药', itemStyle: {normal: {color: '#BAD787'}}}
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartPie.setOption(optionPie);
    window.addEventListener("resize", function () {
        myChartPie.resize();
    });

    $("a,button").focus(function () {
        this.blur()
    });

    $(function () {
        /* 日期插件*/
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            todayBtn: true//显示今日按钮
        });
    });
</script>
</body>
</html>