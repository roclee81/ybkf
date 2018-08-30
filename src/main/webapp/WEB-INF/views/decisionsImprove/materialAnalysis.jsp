<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>耗材分析</title>
    <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath }/static/js/common.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <style>
       .hc-div p {
            width: 50%;
            text-align: center; 
			margin-bottom:0 !important;
        }
        .gauge-div{width:32%;margin-top:0px !important;
			margin-bottom:0px !important;}
        .float-right {
            float: right;
        }

        #zy_Gauge1 {
            height: 260px;
        }

        .fy-pie {
            height: 300px;
        }
		#NM_Gauge1{height:240px;}
		#NM_Gauge2{height:240px;}
		#NM_Gauge3{height:240px;}
		.Cost_top{margin-bottom:14px; padding:10px 0; background-color:#fff; display:none;}
		.Cost_top .Right_cost{}
		.yb-jj-div{padding:0;}
		.gauge-title-div table tr > td{color:#333333 !important; line-height:40px;}
		.body-width{width:100%;}
        /* .tab-menu ul >li{}*/
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
<div class="hc-div margin-top6 margin-bottom10">
    <p class="float"><font class="fs_16">高值耗材</font><span class="fs_16">金额：</span><font
            class="fs_16">2.6万元</font><span class="fs_16">人次：</span><font class="fs_16">601</font></p>

    <p class="float-right"><font class="fs_16">普通耗材</font><span class="fs_16">金额：</span><font
            class="fs_16">1.9万元</font><span class="fs_16">人次：</span><font class="fs_16">919</font></p>

    <div class="clear"></div>
</div>
    
<div class="tab-div-box">
    <!--医保基金利用情况-->
<div class="yb-jj-div">
	<div class="gauge-div float bg-color" style="width:49%;margin-right:1.9%">
        <div class="gauge-title-div">
            <table class="body-width">
                <tr>
                    <td class="left ">耗材费用</td>
                    <td class="right ">
                    </td>
                </tr>
            </table>
        </div>
        <div class="float fy-pie-div2">
            <div class="fy-pie" id="pie2">

            </div>
        </div>
    </div>
    <div class="gauge-div float bg-color" style="width:49%;">
        <div class="gauge-title-div">
            <table class="body-width">
                <tr>
                    <td class="left ">耗材占比</td>
                    <td class="right ">
                    </td>
                </tr>
            </table>
        </div>
        <div id="num_a">
            <div id="zy_Gauge1">

            </div>

        </div>
        <div class="gauge-bom">
            <table class="body-width">
                <tr>
                    <td class="center-td fs_16">同比增长：<span>4%</span></td>
                    <td class="center-td fs_16">环比增长：<span>3%</span></td>
                </tr>
            </table>
        </div>
    </div>
    
    <div class="clear"></div>
</div>
<div class="module-hr"></div>
</div>
   
    </div>
</div>
<div class="body-width margin-top6">
<div class="body-width margin-top6 bg-color margin-bottom20">
        <div class="header-div bg-color">
            <div class="body-width margin-bottom20">
                <!--选项卡-->
                <table class="sx-dj body-width">
                    <tr>
                        <td>
                            <div class="tab-menu" style="font-size: 12px !important;">
                                <ul class="padding-left10" id='tab1'>
                                    <li class=" on">耗材类别排序</li>
                                    <li class="">耗材种类排序</li>
                                    <li class="">单一耗材使用趋势</li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </td>
                        <td class="fs_14">耗材类型</td>
                        <td>
                            <select style="padding-right: 20px">
                                <option>高值耗材</option>
                                <option>普通耗材</option>
                            </select>
                        </td>
                        <td class="fs_14">耗材种类</td>
                        <td style="padding-right: 20px">
                            <select>
                                <option value="0">全部</option>
                                <option value="1">导管</option>
                                <option value="2">导丝</option>
                                <option value="3">球囊</option>
                                <option value="4">支架</option>
                                <option value="5">固定板</option>
                                <option value="6">人工骨</option>
                            </select>
                        </td>
                    </tr>
                </table>
                <div class="tab_box">
                    <div class="Cost_top padding10" style="display:block">
                        <div class="gauge-div" style="margin:0 0 0 10px;width:100%;">
                            <div class="gauge-title-div">
                                <table class="body-width">
                                    <tr>
                                        <td class="left fs_16 table-title"> 
                                        </td>
                                        <td class="right fs_16" >
                                            <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
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
                                            <th>耗材类别</th>
                                            <th>金额</th>
                                            <th>占耗材金额总比例</th>
                                        </tr>
                                        <tr>
                                            <td>01</td>
                                            <td>高值耗材</td>
                                            <td>26000</td>
                                            <td>58%</td>
                                        </tr>
                                        <tr>
                                            <td>02</td>
                                            <td>普通耗材</td>
                                            <td>19000</td>
                                            <td>42%</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    
                    <div class="Cost_top ">
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
                                            <th>耗材名称</th>
                                            <th>耗材累计金额</th>
                                            <th>当月金额</th>
                                            <th>同比增长率</th>
                                        </tr>
                                        <tr>
                                            <td>导管</td>
                                            <td>36220</td>
                                            <td>1401</td>
                                            <td>20%</td>
                                        </tr>
                                        <tr>
                                            <td>导丝</td>
                                            <td>45620</td>
                                            <td>2350</td>
                                            <td>15%</td>
                                        </tr>
                                        <tr>
                                            <td>球囊</td>
                                            <td>12400</td>
                                            <td>3520</td>
                                            <td>25%</td>
                                        </tr>
                                        <tr>
                                            <td>支架</td>
                                            <td>14523</td>
                                            <td>1452</td>
                                            <td>10%</td>
                                        </tr>
                                        <tr>
                                            <td>固定板</td>
                                            <td>45721</td>
                                            <td>1524</td>
                                            <td>12%</td>
                                        </tr>
                                        <tr>
                                            <td>人工骨</td>
                                            <td>8562</td>
                                            <td>4520</td>
                                            <td>8%</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="Cost_top">
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
                                            <th>耗材名称</th>
                                            <th>耗材规格</th>
                                            <th>当月金额</th>
                                            <th>同比增长率</th>
                                        </tr>
                                        <tr>
                                            <td>1月</td>
                                            <td>导管</td>
                                            <td></td>
                                            <td>1401</td>
                                            <td>20%</td>
                                        </tr>
                                        <tr>
                                            <td>2月</td>
                                            <td>导管</td>
                                            <td></td>
                                            <td>12400</td>
                                            <td>15%</td>
                                        </tr>
                                        <tr>
                                            <td>3月</td>
                                            <td>导管</td>
                                            <td></td>
                                            <td>23560</td>
                                            <td>25%</td>
                                        </tr>
                                        <tr>
                                            <td>4月</td>
                                            <td>导管</td>
                                            <td></td>
                                            <td>24500</td>
                                            <td>10%</td>
                                        </tr>
                                        <tr>
                                            <td>5月</td>
                                            <td>导管</td>
                                            <td></td>
                                            <td>42000</td>
                                            <td>12%</td>
                                        </tr>
                                        <tr>
                                            <td>6月</td>
                                            <td>导管</td>
                                            <td></td>
                                            <td>12000</td>
                                            <td>8%</td>
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
</div>
<script>
    /*初始化*/
    $(document).ready(function () {
        x_data1 = ['高值耗材','普通耗材'];
        bar_data1_1 = [50, 120];
        x_data2 = ['导管','导丝','球囊','支架','固定板','人工骨'];
        bar_data2_1 = [2400, 2200, 2000,1800, 1600, 1400];
        x_data3 = ['1月','2月','3月','4月','5月','6月'];
        bar_data3_1 = [2400, 2200, 2000,1800, 1600, 1400];
        Pine();
        /*				Pine2();
         Pine3();*/

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
    $("#tab1 li").on({
        "click": function () {
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab_box > div").eq(index).css("display", "block").siblings().css("display", "none");

            var index = $(this).index();
            if (index == 0) {
                Pine();
            } else if(index == 1) {
                Pine2();
            }else{
                Pine3();
            }
        }
    });

    //耗材-仪表图1
    function Gauge() {
        //仪表图1
        var Chart_zy_Gauge1 = echarts.init(document.getElementById('zy_Gauge1'));
        var gauge1_date = 6.6;
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
                    radius: '88%',
                    min: 0,                     // 最小值
                    max: gauge1_ze,                   // 最大值
                    splitNumber: 10,             // 分割段数，默认为5
                    axisLine: {            // 坐标轴线
                        show: true,        // 默认显示，属性show控制显示与否
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: [[gauge1_percent, '#A8CD64'], [1, '#E5E5E5']],
                            width: 20

                        }
                    },
                    axisTick: {            // 坐标轴小标记
                        show: true,        // 属性show控制显示与否，默认不显示
                        splitNumber: 5,    // 每份split细分多少段
                        length: 5,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle控制线条样式
                            color: '#eee',
                            width: 1,
                            type: 'solid'
                        }
                    },
                    axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                        show: true,
                        distance: -28,
                        textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                            color: '#333'
                        }
                    },
                    splitLine: {           // 分隔线
                        show: true,        // 默认显示，属性show控制显示与否
                        length: 8,         // 属性length控制线长
                        lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                            color: '#eee',
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
                            color: '#333',
                            fontSize: 16
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
                            color: '#A8CD64',
                            fontSize: 14
                        }
                    },
                    data: [{value: gauge1_date, name: ''}]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_zy_Gauge1.setOption(option_zy_Gauge1);
        window.addEventListener("resize", function () {
            Chart_zy_Gauge1.resize();
        });
    }

    // 耗材-饼图1
    var myChartPie2 = echarts.init(document.getElementById('pie2'));
    // 指定图表的配置项和数据
    optionPie2 = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}(万元) ({d}%)"
        },
        legend: {
            left: 'center',
            bottom: 2,
            data: ['检查用一次性医用材料费', '治疗用一次性医用材料费', '手术用一次性医用材料费']
        },
        series: [
            {
                name: '耗材费用',
                type: 'pie',
                radius: '70%',
                center: ['50%', '50%'],
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position: 'inside',
                        formatter: "{c}(万元)"
                    }
                },
                data: [
                    {value: 0.89, name: '检查用一次性医用材料费', itemStyle: {normal: {color: '#72B9E3'}}},
                    {value: 2.1, name: '治疗用一次性医用材料费', itemStyle: {normal: {color: '#EFB14E'}}},
                    {value: 1.5, name: '手术用一次性医用材料费', itemStyle: {normal: {color: '#A3C85F'}}}
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartPie2.setOption(optionPie2);
    window.addEventListener("resize", function () {
        myChartPie2.resize();
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
            $("#tab1 li").eq(1).addClass("on").siblings().removeClass("on");
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
            $("#tab1 li").eq(2).addClass("on").siblings().removeClass("on");
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
</script>
</body>
</html>