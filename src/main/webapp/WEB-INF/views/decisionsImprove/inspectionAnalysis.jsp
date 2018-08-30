<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>检查检验分析</title>

    <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath }/static/js/common.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <style>
        .gauge-div {
            width: 22%;
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
    <div class="body-width margin-top10">
        <div class="clear"></div>
    </div>
    <!-- 药品类别费用top10 -->
    <!--药品-->
<div class="body-width margin-top6 bg-color margin-bottom20">
    <div class="header-div bg-color">
        <div class="body-width margin-bottom20">
            <!--选项卡-->
            <table class="sx-dj">
                <tr>
                    <td>
                        <button class="xy-button  xy-btn-select">检查检验费类别排序</button>
                        <button class="xy-button margin-left10">检查检验费种类排序</button>
                        <button class="xy-button margin-left10">单一检查检验费排序</button>
                    </td>
                    <td class="fs_14"> 检查检验费种类</td>
                    <td>
                        <select>
                            <option value="0">全部</option>
                            <option value="1">肝功能</option>
                            <option value="2">血常规</option>
                            <option value="3">肾功能</option>
                            <option value="4">微量元素测定</option>
                            <option value="5">一氧化碳测定</option>
                            <option value="6">胆囊炎</option>
                        </select>
                    </td>
                    <td class="fs_14">单一检查检验项目</td>
                    <td>
                        <select class="margin-right10">
                            <option value="0">全部</option>
                            <option value="1">肝功8项</option>
                            <option value="2">肝功13项</option>
                            <option value="3">肝纤三项</option>
                            <option value="4">血氨</option>
                            <option value="5">胆碱脂酶</option>
                            <option value="6">胆汁酸</option>
                        </select>
                    </td>

                </tr>
            </table>

    <div class="tab_box">
        <div class="Cost_top bg-color" style="display:block;">
            <div class="gauge-div" style="margin:0 0 0 10px;width:100%;">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">
                            </td>
                            <td class="right fs_16" >
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
            <div class="Right_cost">
                <div class="body-width" style="padding:0 10px">
                    <div class="ys-rc-div">
                        <table class="zy-table body-width common-table">
                            <tbody>
                            <tr class="bg-color1">
                                <th>排名</th>
                                <th>项目类别</th>
                                <th>金额</th>
                                <th>占检查检验费总比例</th>
                            </tr>
                            <tr>
                                <td>01</td>
                                <td class="left">生化全项检查</td>
                                <td class="right">23500</td>
                                <td class="right">20%</td>
                            </tr>
                            <tr>
                                <td>02</td>
                                <td class="left">肝功能检查</td>
                                <td class="right">12400</td>
                                <td class="right">15%</td>
                            </tr>
                            <tr>
                                <td>03</td>
                                <td class="left">肾功能检查</td>
                                <td class="right">23560</td>
                                <td class="right">25%</td>
                            </tr>
                            <tr>
                                <td>04</td>
                                <td class="left">糖尿病监测</td>
                                <td class="right">24500</td>
                                <td class="right">10%</td>
                            </tr>
                            <tr>
                                <td>05</td>
                                <td class="left">血脂检查</td>
                                <td class="right">42000</td>
                                <td class="right">12%</td>
                            </tr>
                            <tr>
                                <td>06</td>
                                <td class="left">贫血检查</td>
                                <td class="right">12000</td>
                                <td class="right">8%</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="Cost_top bg-color">
            <div class="gauge-div" style="margin:0 0 0 10px;width:100%;">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title"></td>
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
                                <th>项目名称</th>
                                <th>项目累计金额</th>
                                <th>当月金额</th>
                                <th>同比增长率</th>
                            </tr>
                            <tr>
                                <td class="left">肝功能</td>
                                <td class="right">36220</td>
                                <td class="right">1401</td>
                                <td class="right">20%</td>
                            </tr>
                            <tr>
                                <td class="left">血常规</td>
                                <td class="right">45620</td>
                                <td class="right">2350</td>
                                <td class="right">15%</td>
                            </tr>
                            <tr>
                                <td class="left">肾功能</td>
                                <td class="right">12400</td>
                                <td class="right">3520</td>
                                <td class="right">25%</td>
                            </tr>
                            <tr>
                                <td class="left">微量元素测定</td>
                                <td class="right">14523</td>
                                <td class="right">1452</td>
                                <td class="right">10%</td>
                            </tr>
                            <tr>
                                <td class="left">一氧化碳测定</td>
                                <td class="right">45721</td>
                                <td class="right">1524</td>
                                <td class="right">12%</td>
                            </tr>
                            <tr>
                                <td class="left">胆囊炎</td>
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
            <div class="gauge-div" style="margin:0 0 0 10px;width:100%;">
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
                                <th>项目名称</th>
                                <th>项目规格</th>
                                <th>当月金额</th>
                                <th>同比增长率</th>
                            </tr>
                            <tr>
                                <td>1月</td>
                                <td class="left">肝功能</td>
                                <td></td>
                                <td class="right">1401</td>
                                <td class="right">20%</td>
                            </tr>
                            <tr>
                                <td>2月</td>
                                <td class="left">肝功能</td>
                                <td></td>
                                <td class="right">12400</td>
                                <td class="right">15%</td>
                            </tr>
                            <tr>
                                <td>3月</td>
                                <td class="left">肝功能</td>
                                <td></td>
                                <td class="right">23560</td>
                                <td class="right">25%</td>
                            </tr>
                            <tr>
                                <td>4月</td>
                                <td class="left">肝功能</td>
                                <td></td>
                                <td class="right">24500</td>
                                <td class="right">10%</td>
                            </tr>
                            <tr>
                                <td>5月</td>
                                <td class="left">肝功能</td>
                                <td></td>
                                <td class="right">42000</td>
                                <td class="right">12%</td>
                            </tr>
                            <tr>
                                <td>6月</td>
                                <td class="left">肝功能</td>
                                <td></td>
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
		x_data1 = ['生化全项检查','肝功能检查','肾功能检查','糖尿病监测','血脂检查','贫血检查'];
		bar_data1 = [22, 14, 10,22, 14, 10];
		bar_data1_1 = [2400, 2200, 2000,1800, 1600, 1400];
		x_data2 = ['肝功8项','肝功13项','肝纤三项','血氨','胆碱脂酶','胆汁酸'];
		bar_data2 = [22, 14, 10,22, 14, 10];
		bar_data2_1 = [2400, 2200, 2000,1800, 1600, 1400];
		x_data3 = ['1月','2月','3月','4月','5月','6月'];
		bar_data3 = [22, 14, 10,22, 14, 10];
		bar_data3_1 = [2400, 2200, 2000,1800, 1600, 1400];
		Pine();
/*		Pine2();
		Pine3();*/
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
            $(this).parent().parent().parent().parent().parent().find(".tab_box > div").eq(index).css("display", "block").siblings().css("display", "none");
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
    // 药品-折线图1
 
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