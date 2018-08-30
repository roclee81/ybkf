<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>决策分析-药品分析</title>
 
    <style>
        .jc-sh-wg-bar{
            text-align: left;
            padding-left: 20%;
        }
        .xy-button{
            height: 36px;
            width: 150px;
        }
    </style>
</head>
<body>
<!--筛选条件-->
<div class="body-width fs_18 bold header-color">药品分析</div>
<div class="header-div bg-color1 border-rgt border-lef">
    <table class="ys-table" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
                年度
            </td>
            <td>
                <select id='selectYear' style="width: 124px">
                	
                </select>月份
                <select id='selectMonth' style="width: 124px">
                	<option value='01'>1月</option>
                	<option value='02'>2月</option>
                	<option value='03'>3月</option>
                	<option value='04'>4月</option>
                	<option value='05'>5月</option>
                	<option value='06'>6月</option>
                	<option value='07'>7月</option>
                	<option value='08'>8月</option>
                	<option value='09'>9月</option>
                	<option value='10'>10月</option>
                	<option value='11'>11月</option>
                	<option value='12'>12月</option>
                </select>月
            </td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
				<input id="depart"  class="easyui-combobox"  style="width:100px;">
            </td>

            <td class="td-width"></td>
            <td>
                <button class="btn-ok fs_16" onclick="searchAll()">查询</button>
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
</div>
<!--第一排图表-->
<div class="body-width margin-top10">
    <div class="float fy-gauge-div" >
        <div class="fy-gauge" id="gauge1"> </div>
        <div style="margin-top: 4px">
            <table class="ed-table">
                <tr>
                    <td class="center-td dis-block" style="position: relative">
                        <label  id='jzbtb' class="same gauge-font">同比增长</label>
                        <div class="zy-same">
                            <p class='date'><br><label id='jzb' class="failure-style"></label></p>
                        </div>
                        <label id='jzbhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长</label>

                        <div class="zy-sequential">
                            <p class='date'> <br><label id='jzb1' class="failure-style"></label></p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="float fy-gauge-div" >
        <div class="fy-gauge" id="gauge2"> </div>
        <div style="margin-top: 4px">
            <table class="ed-table">
                <tr>
                    <td class="center-td dis-block" style="position: relative">
                        <label id='yzbtb' class="same gauge-font">同比增长4%</label>
                        <div class="zy-same">
                            <p class='date'><br><label id='yzb' class="failure-style"></label></p>
                        </div>
                        <label id='yzbhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长3%</label>
                        <div class="zy-sequential">
                            <p class='date'><br><label id='yzb1' class="failure-style"></label></p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="float fy-gauge-div" >
        <div class="fy-gauge" id="gauge3"> </div>
        <div style="margin-top: 4px">
            <table class="ed-table">
                <tr>
                    <td class="center-td dis-block" style="position: relative">
                        <label id='mlytb' class="same gauge-font">同比增长2.3%</label>
                        <div class="zy-same">
                            <p class='date'><br><label id='mlyzb' class="failure-style"></label></p>
                        </div>
                        <label id='mlyhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长2.1%</label>
                        <div class="zy-sequential">
                            <p class='date'><br><label id='mlyzb1' class="failure-style"></label></p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="float fy-pie-div" id="pie1">

    </div>
</div>
<!--药品-->
<div class="body-width margin-bottom20">
    <!--筛选条件-->
    <table class="sx-dj">
        <tr>
            <td class="fs_16">药品分类</td>
            <td>
                <select onchange="getDrugByType($(this).val())">
                    <option value='抗肿瘤药'>抗肿瘤药物</option>
                    <option value='抗生素'>抗菌药物</option>
                    <!-- <option value='中药'>中药注射剂</option> -->
                    <option value='血液'>血液制品</option>
                </select>
            </td>
            <td class="fs_16">药品名称</td>
            <td>
                <select id='drugName' onchange="loadMonthTendency($('#selectYear').val(),$('#selectMonth').val(),$(this).val(), $('#depart').combobox('getValue'));
                getLineGroupByDepartment($('#selectYear').val(),$(this).val(),$('#selectMonth').val())">
                	
                </select>
            </td>
            <td>
                <button class="xy-button fs_16 xy-btn-bg xy-btn-active xy-btn-select">药品指标月度变化趋势</button>
                <button class="xy-button fs_16 xy-btn-bg margin-left10">科室药品用量分布</button>
            </td>
        </tr>
    </table>

    <div class="tab_box">
        <!--药品—折线图1-->
        <div class="line1">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line1">

                </div>
            </div>
            <!--表格数据-->
            <div class="clear"></div>
            <div class="ks-fy-line-div border-val margin-top10" style="overflow-x: auto">
                <table class="body-width">
                    <tbody>
                    <tr class="bg-color1">
                        <th class="center-td">月份</th>
                        <th>1月</th>
                        <th>2月</th>
                        <th>3月</th>
                        <th>4月</th>
                        <th>5月</th>
                        <th>6月</th>
                        <th>7月</th>
                        <th>8月</th>
                        <th>9月</th>
                        <th>10月</th>
                        <th>11月</th>
                        <th>12月</th>
                    </tr>
                    <tr>
                        <td id='monthMoney' class="center-td">金额(元)</td>
                        <td>12000</td>
                        <td>21000</td>
                        <td>15000</td>
                        <td>29000</td>
                        <td>15010</td>
                        <td>12000</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                    </tr>
                    <tr>
                        <td id='monthPerson' class="center-td">人次</td>
                        <td>80</td>
                        <td>40</td>
                        <td>79</td>
                        <td>90</td>
                        <td>110</td>
                        <td>70</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                        <td>—</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!--药品-折线图2-->
        <div class="line2">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line2">

                </div>
            </div>
            <!--表格数据-->
            <div class="clear"></div>
            <div class="ks-fy-line-div border-val margin-top10" style="overflow-x: auto">
                <table class="td-line body-width sf-msg-table">
                    <tbody>
                    <tr id='monthDepartF' class="th-bg">
                        <th id='monthDepart'>科室</th>
                        <th>血液内科</th>
                        <th>肾内科</th>
                        <th>内分泌科</th>
                        <th>免疫科</th>
                        <th>普通外科</th>
                    </tr>
                    <tr id='departMoneyF'>
                        <td id='departMoney'>金额(元)</td>
                        <td>25000</td>
                        <td>35600</td>
                        <td>45940</td>
                        <td>35190</td>
                        <td>24780</td>
                    </tr>
                    <tr id='departPersonF'>
                        <td id='departPerson'>人次</td>
                        <td>110</td>
                        <td>217</td>
                        <td>27</td>
                        <td>120</td>
                        <td>55</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    /*初始化*/

    $(document).ready(function(){
        $(".line2").css("display","none");
    });

    /*同比鼠标事件*/
    $(".same").on({
        "mouseenter":function(){
            $(this).next().css("display", "block");
        },
        "mouseleave":function(){
            $(this).next().css("display", "none");
        }
    });
    $(".sequential").on({
        "mouseenter":function(){
            $(this).next().css("display", "block");
        },
        "mouseleave":function(){
            $(this).next().css("display", "none");
        }
    });

    //选项卡
    $(".xy-button").on({
        "mouseenter":function(){
            if (!$(this).hasClass("xy-btn-active"))
            {
                $(this).addClass("xy-btn-active");
            }
        },
        "mouseleave":function(){
            $(this).removeClass("xy-btn-active");
        },
        "click":function(){
            var index=$(this).index();
            $(this).addClass("xy-btn-select").siblings().removeClass("xy-btn-select");
            $(this).siblings().removeClass("xy-btn-active");
            console.log($(this).parent().parent().parent().parent().siblings());
            $(this).parent().parent().parent().parent().parent().find(".tab_box > div").eq(index).show().siblings().hide();
            if(index==0){
            	line1();
            	loadMonthTendency($('#selectYear').val(),$('#selectMonth').val(),$('#drugName').val(), $('#depart').combobox('getValue'))
            	
            }
            if(index==1){	
            	line2();
            	getLineGroupByDepartment($('#selectYear').val(),$('#drugName').val(),$('#selectMonth').val());
            }
            
        }
    });

    //药品-仪表图1
  
    var Chart_Gauge1 = echarts.init(document.getElementById('gauge1'));
    // 指定图表的配置项和数据
    option_Gauge1 = {
        title : {
            text: '甲占比',
            left:'center',
            top:'3%',
            textStyle:{
                fontSize:14,
                fontWeight:500
            }
        },
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        series : [
            {
                name:'甲占比',
                type:'gauge',
                center : ['50%', '65%'],    // 默认全局居中
                radius : '95%',
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, '#49c646'],[0.8, '#087dee'],[1.5, '#fa5655']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    distance:-2,
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :14,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333',
                        fontSize : 15
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: [0, '26%'],
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 14
                    }
                },
                data:[]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge1.setOption(option_Gauge1);
    window.onresize = Chart_Gauge1.resize;
	
	
  
	
    //药品-仪表图2
    var Chart_Gauge2 = echarts.init(document.getElementById('gauge2'));
    // 指定图表的配置项和数据
    option_Gauge2 = {
        title : {
            text: '乙占比',
            left:'center',
            top:'3%',
            textStyle:{
                fontSize:14,
                fontWeight:500
            }
        },
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        series : [
            {
                name:'乙占比',
                type:'gauge',
                center : ['50%', '65%'],    // 默认全局居中
                radius : '95%',
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, '#49c646'],[0.8, '#087dee'],[1.5, '#fa5655']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    distance:-2,
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :14,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333',
                        fontSize : 15
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: [0, '26%'],
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 14
                    }
                },
                data:[{value: 15}]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge2.setOption(option_Gauge2);
    window.onresize = Chart_Gauge2.resize;
	
	
    //药品-仪表图3
    var Chart_Gauge3 = echarts.init(document.getElementById('gauge3'));
    // 指定图表的配置项和数据
    option_Gauge3 = {
        title : {
            text: '目录药占比',
            left:'center',
            top:'3%',
            textStyle:{
                fontSize:14,
                fontWeight:500
            }
        },
        tooltip : {
            formatter: "{a} <br/>{b} : {c}%"
        },
        series : [
            {
                name:'目录药占比',
                type:'gauge',
                center : ['50%', '65%'],    // 默认全局居中
                radius : '95%',
                min: 0,                     // 最小值
                max: 100,                   // 最大值
                precision: 0,               // 小数精度，默认为0，无小数点
                splitNumber: 10,             // 分割段数，默认为5
                axisLine: {            // 坐标轴线
                    show: true,        // 默认显示，属性show控制显示与否
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: [[0.2, '#49c646'],[0.8, '#087dee'],[1.5, '#fa5655']],
                        width: 30
                    }
                },
                axisTick: {            // 坐标轴小标记
                    show: true,        // 属性show控制显示与否，默认不显示
                    splitNumber: 5,    // 每份split细分多少段
                    length :8,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle控制线条样式
                        color: '#eee',
                        width: 1,
                        type: 'solid'
                    }
                },
                axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                    show: true,
                    distance:-2,
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333'
                    }
                },
                splitLine: {           // 分隔线
                    show: true,        // 默认显示，属性show控制显示与否
                    length :14,         // 属性length控制线长
                    lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                        color: '#eee',
                        width: 2,
                        type: 'solid'
                    }
                },
                pointer : {
                    length : '80%',
                    width : 8,
                    color : 'auto'
                },
                title : {
                    show : true,
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: '#333',
                        fontSize : 15
                    }
                },
                detail : {
                    show : true,
                    backgroundColor: 'rgba(0,0,0,0)',
                    borderWidth: 0,
                    borderColor: '#ccc',
                    width: 100,
                    height: 40,
                    offsetCenter: [0, '26%'],
                    formatter:'{value}%',
                    textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                        color: 'auto',
                        fontSize : 14
                    }
                },
                data:[{value: 35}]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge3.setOption(option_Gauge3);
    window.onresize = Chart_Gauge3.resize;

    // 饼图
    var myChartPie = echarts.init(document.getElementById('pie1'));
    // 指定图表的配置项和数据
    optionPie = {
        title:{
            text:"中西药占比及费用",
            left:"center",
            top:'3%',
            textStyle:{
                fontSize:14,
                fontWeight:500
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}(元) ({d}%)"
        },
        legend: {
            orient: 'vertical',
            right:'2%',
            top:40,
            orient:'vertical',
            data:['西药','中药','中成药','中草药',]
        },
        series: [
            {
                name:'中西药占比及费用',
                type:'pie',
                selectedMode: 'single',
                center:['40%','55%'],
                radius: [0, '50%'],
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position:'inside',
                        fontSize:14
                    }
                },
                data:[

                ]
            },
            {
                name:'中西药占比及费用',
                type:'pie',
                center:['40%','55%'],
                radius: ['60%', '80%'],
                selectedMode: 'single',
                labelLine:{
                    normal:{
                        length:8,
                        length2:5
                    }
                },
                data:[

                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartPie.setOption(optionPie);
    window.onresize = myChartPie.resize;

    function line1() {
         myChartLine1 = echarts.init(document.getElementById('line1'));
        // 指定图表的配置项和数据
        optionLine1 = {
            title : {
                text: '月度变化趋势',
                left:'40%',
                top:'4%',
                textStyle:{
    					fontSize:14,
                        fontWeight:'bold',
                        color:'#333'
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                right:"6%",
                top:'4%',
                data:[{name:'按金额',icon:'roundRect'},{name:'按人次',icon:'roundRect'}]
            },
            grid: {
                top:'24%',
                left: '2%',
                right: '6%',
                bottom: '4%',
                containLabel: true
            },
            toolbox:{
                show: true,
                left:"70%",
                top:"4%",
                feature: {
                    magicType: {type: ['line', 'bar']}
                }
            },
            xAxis: [
                {
                    type: 'category',
                    boundaryGap : false,
                    data:['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '金额(元)',
                    boundaryGap: [0, 0.01],
                    splitLine:{
                        lineStyle:{
                            type:'dashed'
                        }
                    }
                },
                {
                    type: 'value',
                    name: '人次',
                    axisLine:{
                        lineStyle:{
                            width:0
                        }
                    },
                    axisTick:{
                        show:false
                    },
                    splitLine:{
                        show:false
                    }
                }
            ],
            series: [
                {
                    name:'按金额',
                    type:'line',
                    itemStyle:{
                        normal:{
                            color:'#037FF4',
                            borderWidth:2
                        }
                    },
                    lineStyle:{
                        normal:{
                            type:'dotted'
                        }
                    },
                    symbolSize:6,
                    label:{
                        normal:{
                            show:true
                        }
                    },
                    data:[12000, 21000, 15000, 29000,15010,12000]
                },
                {
                    name:'按人次',
                    type:'line',
                    yAxisIndex: 1,
                    itemStyle:{
                        normal:{
                            color:'#28BA24',
                            borderWidth:2
                        }
                    },
                    lineStyle:{
                        normal:{
                            type:'dotted'
                        }
                    },
                    symbolSize:6,
                    label:{
                        normal:{
                            show:true
                        }
                    },
                    data:[80,40,79,90,110,70]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        myChartLine1.setOption(optionLine1);
        window.onresize = myChartLine1.resize;
    }
    // 药品-折线图1
    var myChartLine1 = echarts.init(document.getElementById('line1'));
    // 指定图表的配置项和数据
    optionLine1 = {
        title : {
            text: '月度变化趋势',
            left:'40%',
            top:'4%',
            textStyle:{
					fontSize:14,
                    fontWeight:'bold',
                    color:'#333'
            }
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            right:"6%",
            top:'4%',
            data:[{name:'按金额',icon:'roundRect'},{name:'按人次',icon:'roundRect'}]
        },
        grid: {
            top:'24%',
            left: '2%',
            right: '6%',
            bottom: '4%',
            containLabel: true
        },
        toolbox:{
            show: true,
            left:"70%",
            top:"4%",
            feature: {
                magicType: {type: ['line', 'bar']}
            }
        },
        xAxis: [
            {
                type: 'category',
                boundaryGap : false,
                data:['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '金额(元)',
                boundaryGap: [0, 0.01],
                splitLine:{
                    lineStyle:{
                        type:'dashed'
                    }
                }
            },
            {
                type: 'value',
                name: '人次',
                axisLine:{
                    lineStyle:{
                        width:0
                    }
                },
                axisTick:{
                    show:false
                },
                splitLine:{
                    show:false
                }
            }
        ],
        series: [
            {
                name:'按金额',
                type:'line',
                itemStyle:{
                    normal:{
                        color:'#037FF4',
                        borderWidth:2
                    }
                },
                lineStyle:{
                    normal:{
                        type:'dotted'
                    }
                },
                symbolSize:6,
                label:{
                    normal:{
                        show:true
                    }
                },
                data:[12000, 21000, 15000, 29000,15010,12000]
            },
            {
                name:'按人次',
                type:'line',
                yAxisIndex: 1,
                itemStyle:{
                    normal:{
                        color:'#28BA24',
                        borderWidth:2
                    }
                },
                lineStyle:{
                    normal:{
                        type:'dotted'
                    }
                },
                symbolSize:6,
                label:{
                    normal:{
                        show:true
                    }
                },
                data:[80,40,79,90,110,70]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartLine1.setOption(optionLine1);
    window.onresize = myChartLine1.resize;
    
    function line2() {
    	 myChartLine2 = echarts.init(document.getElementById('line2'));
    	    // 指定图表的配置项和数据
    	    optionLine2 = {
    	        title : {
    	            text: '科室用药分布',
    	            left:'40%',
    	            top:'4%',
    	            textStyle:{
    	                fontSize:14,
    	                fontWeight:'bold',
    	                color:'#333'
    	            }
    	        },
    	        tooltip: {
    	            trigger: 'axis',
    	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
    	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    	            }
    	        },
    	        legend: {
    	            right:120,
    	            top:'4%',
    	            data:[{name:'按金额',icon:'roundRect'},{name:'按人次',icon:'roundRect'}]
    	        },
    	        grid: {
    	            top:'24%',
    	            left: '2%',
    	            right: '6%',
    	            bottom: '4%',
    	            containLabel: true
    	        },
    	        xAxis: [
    	            {
    	                type: 'category',
    	                nameRotate:50,
    	                axisPointer: {
    	                    type: 'shadow'
    	                },
    	                data:['血液内科','肾内科','内分泌科','免疫科','普通外科','','']
    	            }
    	        ],
    	        yAxis: [
    	            {
    	                type: 'value',
    	                name: '金额(元)',
    	                boundaryGap: [0, 0.01],
    	                splitLine:{
    	                    lineStyle:{
    	                        type:'dashed'
    	                    }
    	                }
    	            },
    	            {
    	                type: 'value',
    	                name: '人次',
    	                axisLine:{
    	                    lineStyle:{
    	                        width:0
    	                    }
    	                },
    	                axisTick:{
    	                    show:false
    	                },
    	                splitLine:{
    	                    show:false
    	                }
    	            }
    	        ],
    	        series: [
    	            {
    	                name:'按金额',
    	                type:'line',
    	                itemStyle:{
    	                    normal:{
    	                        color:'#037FF4',
    	                        borderWidth:2
    	                    }
    	                },
    	                lineStyle:{
    	                    normal:{
    	                        type:'dotted'
    	                    }
    	                },
    	                symbolSize:6,
    	                label:{
    	                    normal:{
    	                        show:true
    	                    }
    	                },
    	                data:[25000, 35600, 45940, 35190,24780]
    	            },
    	            {
    	                name:'按人次',
    	                yAxisIndex: 1,
    	                type:'line',
    	                itemStyle:{
    	                    normal:{
    	                        color:'#28BA24',
    	                        borderWidth:2
    	                    }
    	                },
    	                lineStyle:{
    	                    normal:{
    	                        type:'dotted'
    	                    }
    	                },
    	                symbolSize:6,
    	                label:{
    	                    normal:{
    	                        show:true
    	                    }
    	                },
    	                data:[110,217,27,120,55]
    	            }
    	        ]
    	    };
    	    // 使用刚指定的配置项和数据显示图表。
    	    myChartLine2.setOption(optionLine2);
    	    window.onresize = myChartLine2.resize;
    }
    // 药品-折线2
    var myChartLine2 = echarts.init(document.getElementById('line2'));
    // 指定图表的配置项和数据
    optionLine2 = {
        title : {
            text: '科室用药分布',
            left:'40%',
            top:'4%',
            textStyle:{
                fontSize:14,
                fontWeight:'bold',
                color:'#333'
            }
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            right:120,
            top:'4%',
            data:[{name:'按金额',icon:'roundRect'},{name:'按人次',icon:'roundRect'}]
        },
        grid: {
            top:'24%',
            left: '2%',
            right: '6%',
            bottom: '4%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                nameRotate:50,
                axisPointer: {
                    type: 'shadow'
                },
                data:['血液内科','肾内科','内分泌科','免疫科','普通外科','','']
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '金额(元)',
                boundaryGap: [0, 0.01],
                splitLine:{
                    lineStyle:{
                        type:'dashed'
                    }
                }
            },
            {
                type: 'value',
                name: '人次',
                axisLine:{
                    lineStyle:{
                        width:0
                    }
                },
                axisTick:{
                    show:false
                },
                splitLine:{
                    show:false
                }
            }
        ],
        series: [
            {
                name:'按金额',
                type:'line',
                itemStyle:{
                    normal:{
                        color:'#037FF4',
                        borderWidth:2
                    }
                },
                lineStyle:{
                    normal:{
                        type:'dotted'
                    }
                },
                symbolSize:6,
                label:{
                    normal:{
                        show:true
                    }
                },
                data:[25000, 35600, 45940, 35190,24780]
            },
            {
                name:'按人次',
                yAxisIndex: 1,
                type:'line',
                itemStyle:{
                    normal:{
                        color:'#28BA24',
                        borderWidth:2
                    }
                },
                lineStyle:{
                    normal:{
                        type:'dotted'
                    }
                },
                symbolSize:6,
                label:{
                    normal:{
                        show:true
                    }
                },
                data:[110,217,27,120,55]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartLine2.setOption(optionLine2);
    window.onresize = myChartLine2.resize;
    
    $("a,button").focus(function(){this.blur()});

    
    
    //yyy
    $(function(){
		$('#depart').combobox({
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',
		     textField:'ksmc',
			onLoadSuccess: function () {
				chooseFirstOption(this);
			}
		});
		var date=getYearMonth();
    	
    	for(var sy=0;sy<3;sy++){
    		var syy= new Date().getFullYear();
    		$('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
    	}
    	var date=new Date;
    	var month=date.getMonth()+1
    	month=month<10?"0"+month:String(month);
    	$("#selectMonth").val(month);
    	
    	loadgauge($('#selectYear').val(), $('#selectMonth').val(),'0000');
    	loadMonthTendency($('#selectYear').val(),$('#selectMonth').val(),'', $('#depart').combobox('getValue'));
    	getDrugByType('抗肿瘤药');
    	
    	
    	 line1() ;
    	 line2() ;
    			
    });
    
    function loadgauge(year,month,department){
   	   $.post('${path }/costStruct/selectEcharsData', {
   		    syear:year,
   		    smonth:month,
   			department:department,
   			methodFlag:'getYPFXByDateAndKSBM'
   		}, function(result) {
   			if(result.getYPFXByDateAndKSBM_value0){
   	 			option_Gauge1.series[0].data={value:result.getYPFXByDateAndKSBM_value0.slice(0,1)};
   	 			option_Gauge2.series[0].data={value:result.getYPFXByDateAndKSBM_value3.slice(0,1)};
   	 			option_Gauge3.series[0].data={value:result.getYPFXByDateAndKSBM_value6.slice(0,1)};
   	 			Chart_Gauge1.setOption(option_Gauge1);
   	 			Chart_Gauge2.setOption(option_Gauge2);
   	 			Chart_Gauge3.setOption(option_Gauge3);
   	 			//甲类仪表盘数据
   	 			$('#jzbtb').html("同比增长"+result.getYPFXByDateAndKSBM_value1.slice(0,1)+"%");
   	 			$('#jzbhb').html("环比增长"+result.getYPFXByDateAndKSBM_value2.slice(0,1)+"%");
   	 			$('#jzb').html("&nbsp;&nbsp;&nbsp;甲占比"+result.getYPFXByDateAndKSBM_value0.slice(0,1)+"%");
   	 			$('#jzb1').html("&nbsp;&nbsp;&nbsp;甲占比"+result.getYPFXByDateAndKSBM_value0.slice(0,1)+"%");
   	 			//乙类仪表盘数据
   	 			$('#yzbtb').html("同比增长"+result.getYPFXByDateAndKSBM_value4.slice(0,1)+"%");
   	 			$('#yzbhb').html("环比增长"+result.getYPFXByDateAndKSBM_value5.slice(0,1)+"%");
   	 			$('#yzb').html("&nbsp;&nbsp;&nbsp;乙占比"+result.getYPFXByDateAndKSBM_value3.slice(0,1)+"%");
   	 			$('#yzb1').html("&nbsp;&nbsp;&nbsp;乙占比"+result.getYPFXByDateAndKSBM_value3.slice(0,1)+"%");
   	 			//目录类仪表盘数据
   	 			$('#mlytb').html("同比增长"+result.getYPFXByDateAndKSBM_value7.slice(0,1)+"%");
	 			$('#mlyhb').html("环比增长"+result.getYPFXByDateAndKSBM_value8.slice(0,1)+"%");
	 			$('#mlyzb').html("&nbsp;&nbsp;&nbsp;目录药占比"+result.getYPFXByDateAndKSBM_value6.slice(0,1)+"%");
	 			$('#mlyzb1').html("&nbsp;&nbsp;&nbsp;目录药占比"+result.getYPFXByDateAndKSBM_value6.slice(0,1)+"%");
   	 			//修改DIV悬浮框日期
   	 			$('.date').prepend(result.getYPFXByDateAndKSBM_value14);
   	 			//饼图数据
   	 			
   	 			optionPie.series[0].data=[{value:result.getYPFXByDateAndKSBM_value16, name:'中药',itemStyle:{normal: {color:'#FB5656'}}},
   	 			                      {value:result.getYPFXByDateAndKSBM_value15, name:'西药',itemStyle:{normal: {color:'#077DED'}}}];
   	 			optionPie.series[1].data=[                    {value:result.getYPFXByDateAndKSBM_value17, name:'中成药',itemStyle:{normal: {color:'#74cd2c'}}},
   	 			                                          		{value:result.getYPFXByDateAndKSBM_value18, name:'中草药',itemStyle:{normal: {color:'#BC6C04'}}},
   	 			                                      				{value:result.getYPFXByDateAndKSBM_value15, name:'西药',itemStyle:{normal: {color:'#077DED'}}}];
   	 			myChartPie.setOption(optionPie);
   	 			
   			}else{
   	 			option_Gauge1.series[0].data={value:0};
   	 			option_Gauge1.series[0].data={value:0};
   	 			option_Gauge1.series[0].data={value:0};
   	 			Chart_Gauge1.setOption(option_Gauge1);
   	 			Chart_Gauge2.setOption(option_Gauge2);
   	 			Chart_Gauge3.setOption(option_Gauge3);
   			}
   		}, 'JSON');
    }
    
    function loadMonthTendency(year,month,drugCode,department){
    	   $.post('${path }/costStruct/selectEcharsData', {
      		    syear:year,
      		    smonth:month,
      		  	drugCode:drugCode,
       			department:department,
      			methodFlag:'getLineByDrugCodeAndYear'
      		}, function(result) {
      			optionLine1.series[0].data=result.getLineByDrugCodeAndYear_value0;
      			optionLine1.series[1].data=result.getLineByDrugCodeAndYear_value1;
      			myChartLine1.setOption(optionLine1);
  				$($('#monthMoney').siblings('td')[mm]).empty();
  				$($('#monthPerson').siblings('td')[mm]).empty();
      			for(var mm=0;mm<$('#monthMoney').siblings('td').length;mm++){
      				$($('#monthMoney').siblings('td')[mm]).html(result.getLineByDrugCodeAndYear_value0[mm]);
      				$($('#monthPerson').siblings('td')[mm]).html(result.getLineByDrugCodeAndYear_value1[mm]);
      			}
     			myChartLine1 = echarts.init(document.getElementById('line1'));
     		    myChartLine1.setOption(optionLine1);
      		}, 'JSON');
    }
    function getLineGroupByDepartment(syear,drugCode,smonth){
    	
 	   $.post('${path }/costStruct/selectEcharsData', {
 		    syear:syear,
 		  	drugCode:drugCode,
  			smonth:smonth,
 			methodFlag:'getLineGroupByDepartment'
 		}, function(result) {
 			if(result.getLineGroupByDepartment_value0){
 				optionLine2.xAxis[0].data=result.getLineGroupByDepartment_value0;
 	 			optionLine2.series[0].data=result.getLineGroupByDepartment_value1;
 	 			optionLine2.series[1].data=result.getLineGroupByDepartment_value2;
 	 			myChartLine2.setOption(optionLine2);
 	 			$('#monthDepart').siblings('th').remove();
 	 			for(var de=0;de<result.getLineGroupByDepartment_value0.length;de++){
 	 				$('#monthDepartF').append("<th>"+result.getLineGroupByDepartment_value0[de]+"</th>");
 	 			}
 	 			$('#departMoney').siblings('td').remove();
 	 			$('#departPerson').siblings('td').remove();
 	 			for(var mm=0;mm<result.getLineGroupByDepartment_value0.length;mm++){
 	 				//alert($('#departMoney').siblings('td').length);
 	 				$('#departMoneyF').append("<td>"+result.getLineGroupByDepartment_value1[mm]+"</td>")
 	 				$('#departPersonF').append("<td>"+result.getLineGroupByDepartment_value2[mm]+"</td>")
 	 			}
 	 			myChartLine2 = echarts.init(document.getElementById('line2'));
 	 		    myChartLine2.setOption(optionLine2);
 			}
  			
 		}, 'JSON');
    }
    
    function getYearMonth(){
 	   var mydate = new Date();
	   var str = "" + mydate.getFullYear();
	   var m=mydate.getMonth();
	   if(m<10){
		   str+="0"+(m+1);
	   }else{
		   str+=""+(m+1);
	   }
	   return str;
    }
    
    function getDrugByType(typename){
    	$.ajax({
    		url:'${path}/chargeCheck/selectDrugByType',
    		data:{
    			typename:typename
    		},
    		success:function(data){
    			
    			data=JSON.parse(data);
				$('#drugName').empty();
    			for(var dg=0;dg<data.length;dg++){
    				$('#drugName').append("<option value='"+data[dg].YPBM+"'>"+data[dg].YPMC+"</option>");
    			}
    			//一开始选择项为空
    		    document.getElementById("drugName").selectedIndex = -1;
    		}
    	});
    }
    function chooseFirstOption(comboboxId)
    {
    	 var val = $(comboboxId).combobox('getData');  
         for (var item in val[0]) 
         {  
             if (item == 'ksbm' || item == 'ID') 
             {  
                 $(comboboxId).combobox('select', val[0][item]);
             }
         }  
    }
    function searchAll(){
    	loadgauge($('#selectYear').val(), $('#selectMonth').val(),$('#depart').combobox('getValue'));
    }
</script>
</body>
</html>