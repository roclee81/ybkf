<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>决策分析-费用结构</title>

    <style>
        .jc-sh-wg-bar{
            text-align: left;
            padding-left: 20%;
        }
        .xy-button{
            height: 36px;
            width: 150px;
        }
		.hc-div p{width:314px; margin:12px auto 0;}
    </style>
</head>
<body>
<!--筛选条件-->
<div class="body-width fs_18 bold header-color">耗材分析</div>
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

<div class="body-width margin-top6">
    <div class="hc-div">
        <p><span class="fs_16">高值耗材</span ><span style="padding-right:5px" >金额：<span id='gzhcje11' style="padding-right:5px"></span>万元</span><span style="padding-right:15px" >人次：<span id='gzhcrc11' style="padding-right:5px" ></span></span></p>
        <p><span class="fs_16">普通耗材</span><span style="padding-right:5px">金额：<span id='pthcje11' style="padding-right:5px"></span>万元</span><span  >人次：<span id='pthcrc11' style="padding-right:5px"></span></span></p>
    </div>
    <!--饼图、仪表图-->
    <div class="margin-top20">
        <div class="float fy-gauge-div" >
            <div class="fy-gauge" id="gauge7"> </div>
            <div style="margin-top: 4px">
                <table class="ed-table">
                    <tr>
                        <td class="center-td dis-block" style="position: relative">
                            <label id='hczbtb' class="same gauge-font">同比增长2.34%</label>
                            <div class="zy-same">
                                <p><span class='date'></span><br><label id='hczb' class="failure-style"></label></p>
                            </div>
                            <label id='hczbhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长3.03%</label>
                            <div class="zy-sequential">
                                <p><span class='date'></span><br><label id='hczb1' class="failure-style"></label></p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="float fy-pie-div2" style="margin-right: 1%">
            <div class="fy-pie" id="pie2">

            </div>
        </div>
        <div class="float fy-pie-div2">
            <div class="fy-pie" id="pie3">

            </div>
        </div>
    </div>
</div>
<div class="body-width margin-bottom20">
    <!--筛选条件-->
    <table class="sx-dj body-width">
        <tr>
            <td class="fs_16">耗材类型</td>
            <td>
                <select onchange="getConsumableByType($(this).val())">
                    <option value='高值耗材'>高值耗材</option>
                    <option value='普通耗材'>普通耗材</option>
                </select>
            </td>
            <td class="fs_16">耗材名称</td>
            <td>
                <select id='consumable' onchange="getLineGroupByMonth($('#selectYear').val(),$('#selectMonth').val(), $(this).val(), $('#depart').combobox('getValue'));
                selecConsumableByDepart('2017', '01', $(this).val(), $('#depart').combobox('getValue'));">
                	
                </select>
            </td>
            <td>
                <button class="xy-button fs_16 xy-btn-bg xy-btn-active xy-btn-select">耗材指标月度变化趋势</button>
                <button class="xy-button fs_16 xy-btn-bg margin-left10">科室耗材使用分布</button>
            </td>
        </tr>
    </table>
    <div class="tab_box">
        <!--治疗—折线图1-->
        <div class="line1">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line7">

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
        <!--治疗-折线图2-->
        <div class="line2">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line8">

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
            	getLineGroupByMonth($('#selectYear').val(),$('#selectMonth').val(), $('#consumable').val(), $('#depart').combobox('getValue'));
            }
            if(index==1){
            	line2();
            	selecConsumableByDepart('2017', '01', $('#consumable').val(), $('#depart').combobox('getValue'));
            }
        }
    });

    //耗材-仪表图1
    var Chart_Gauge7 = echarts.init(document.getElementById('gauge7'));
    // 指定图表的配置项和数据
    option_Gauge7 = {
        title : {
            text: '耗材占比',
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
                name:'耗材占比',
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
                data:[{value: 6.6}]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge7.setOption(option_Gauge7);
    window.onresize = Chart_Gauge7.resize;

    // 耗材-饼图1
    var myChartPie2 = echarts.init(document.getElementById('pie2'));
    // 指定图表的配置项和数据
    optionPie2 = {
        title:{
            text:"耗材费用：4.49万元",
            left:"center",
            top:'3%',
            textStyle:{
                fontSize:14,
                fontWeight:500
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}(万元) ({d}%)"
        },
        legend: {
            bottom: '1%',
            data: ['检查用一次性医用材料费','治疗用一次性医用材料费','手术用一次性医用材料费']
        },
        series : [
            {
                name: '耗材费用',
                type: 'pie',
                radius : '65%',
                center: ['50%', '46%'],
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position:'inside',
                        formatter: "{c}(万元)"
                    }
                },
                data:[
                   
                ]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartPie2.setOption(optionPie2);
    window.onresize = myChartPie2.resize;

    // 耗材-饼图3
    var myChartPie3 = echarts.init(document.getElementById('pie3'));
    // 指定图表的配置项和数据
    optionPie3 = {
        title:{
            text:"耗材使用人次：1520",
            left:"center",
            top:'3%',
            textStyle:{
                fontSize:14,
                fontWeight:500
            }
        },
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {c}(次) ({d}%)"
        },
        legend: {
            bottom: '1%',
            data: ['检查用一次性医用材料费','治疗用一次性医用材料费','手术用一次性医用材料费']
        },
        series : [
            {
                name: '耗材费用',
                type: 'pie',
                radius : '65%',
                center: ['50%', '46%'],
                hoverAnimation:true,
                labelLine: {
                    normal: {
                        show: false
                    }
                },
                label: {
                    normal: {
                        show: true,
                        position:'inside',
                        formatter: "{c}(次)"
                    }
                },
                data:[]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartPie3.setOption(optionPie3);
    window.onresize = myChartPie3.resize;

    
    function line1() {
    	 myChartLine7 = echarts.init(document.getElementById('line7'));
    	    // 指定图表的配置项和数据
    	    optionLine7 = {
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
    	            right:'6%',
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
    	                data:['1月','2月','3月','4月','5月','6月','','']
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
    	                data:[21002.82, 25839.4, 36476.36, 37074.03,25851.75,22238.28]
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
    	                data:[169,105,159,201,197,75]
    	            }
    	        ]
    	    };
    	    // 使用刚指定的配置项和数据显示图表。
    	    myChartLine7.setOption(optionLine7);
    	    window.onresize = myChartLine7.resize;
	}
    function line2() {
    	  myChartLine8 = echarts.init(document.getElementById('line8'));
    	    // 指定图表的配置项和数据
    	    optionLine8 = {
    	        title : {
    	            text: '科室耗材使用分布',
    	            textStyle:{
    	                fontSize:14,
    	                fontWeight:'bold',
    	                color:'#333'
    	            },
    	            left:'40%',
    	            top:'4%'
    	        },
    	        tooltip: {
    	            trigger: 'axis',
    	            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
    	                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    	            }
    	        },
    	        legend: {
    	            right:'6%',
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
    	                data:[7654, 6453, 35134, 4357,5467]
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
    	                data:[1796,1452,1312,1813,1472]
    	            }
    	        ]
    	    };
    	    // 使用刚指定的配置项和数据显示图表。
    	    myChartLine8.setOption(optionLine8);
    	    window.onresize = myChartLine8.resize;
	}
    // 耗材-折线图1
    var myChartLine7 = echarts.init(document.getElementById('line7'));
    // 指定图表的配置项和数据
    optionLine7 = {
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
            right:'6%',
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
                data:['1月','2月','3月','4月','5月','6月','','']
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
                data:[21002.82, 25839.4, 36476.36, 37074.03,25851.75,22238.28]
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
                data:[169,105,159,201,197,75]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartLine7.setOption(optionLine7);
    window.onresize = myChartLine7.resize;

    // 耗材-折线图2
    var myChartLine8 = echarts.init(document.getElementById('line8'));
    // 指定图表的配置项和数据
    optionLine8 = {
        title : {
            text: '科室耗材使用分布',
            textStyle:{
                fontSize:14,
                fontWeight:'bold',
                color:'#333'
            },
            left:'40%',
            top:'4%'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            right:'6%',
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
                data:[7654, 6453, 35134, 4357,5467]
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
                data:[1796,1452,1312,1813,1472]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartLine8.setOption(optionLine8);
    window.onresize = myChartLine8.resize;

    $("a,button").focus(function(){this.blur()});
    
    
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
    
    function loadgauge(year,month,department){
    	   $.post('${path }/costStruct/selectEcharsData', {
    		    syear:year,
    		    smonth:month,
    			department:department,
    			methodFlag:'selectConsumablePie'
    		}, function(result) {
    			if(result.selectConsumablePie_value0){
    				$('#gzhcje11').html(result.selectConsumablePie_value0.slice(0,1)/10000); 
    				$('#gzhcrc11').html(result.selectConsumablePie_value1.slice(0,1)); 
    				$('#pthcje11').html(result.selectConsumablePie_value2.slice(0,1)/10000); 
    				$('#pthcrc11').html(result.selectConsumablePie_value3.slice(0,1)); 
    				
    				option_Gauge7.series[0].data={value:result.selectConsumablePie_value4.slice(0,1)};
    	 			Chart_Gauge7.setOption(option_Gauge7);
    	 			//甲类仪表盘数据
    	 			$('#hczbtb').html("同比增长"+result.selectConsumablePie_value5.slice(0,1)+"%");
    	 			$('#hczbhb').html("环比增长"+result.selectConsumablePie_value6.slice(0,1)+"%");
    	 			$('#hczb').html("&nbsp;&nbsp;&nbsp;耗材占比"+result.selectConsumablePie_value4.slice(0,1)+"%");
    	 			$('#hczb1').html("&nbsp;&nbsp;&nbsp;耗材占比"+result.selectConsumablePie_value4.slice(0,1)+"%");
    	 			//乙类仪表盘数据
    	 			
    	 			
    	 			optionPie2.series[0].data=[{value:result.selectConsumablePie_value7.slice(0,1), name:'检查用一次性医用材料费',itemStyle:{normal: {color:'#077DED'}}},
    	 			                           {value:result.selectConsumablePie_value8.slice(0,1), name:'治疗用一次性医用材料费',itemStyle:{normal: {color:'#FB5656'}}},
    	 			                           {value:result.selectConsumablePie_value9.slice(0,1), name:'手术用一次性医用材料费',itemStyle:{normal: {color:'#28BA24'}}}]
    	 			myChartPie2.setOption(optionPie2);
    	 			
    	 			optionPie3.series[0].data=[ {value:result.selectConsumablePie_value10.slice(0,1), name:'检查用一次性医用材料费',itemStyle:{normal: {color:'#077DED'}}},
    	 			                           {value:result.selectConsumablePie_value11.slice(0,1), name:'治疗用一次性医用材料费',itemStyle:{normal: {color:'#FB5656'}}},
    	 			                          {value:result.selectConsumablePie_value7.slice(0,1), name:'手术用一次性医用材料费',itemStyle:{normal: {color:'#28BA24'}}}]
    	 			myChartPie3.setOption(optionPie3);
    	 			//$('#yzbtb').html("同比增长"+result.getYPFXByDateAndKSBM_value4.slice(0,1)+"%");
    	 			//$('#yzbhb').html("环比增长"+result.getYPFXByDateAndKSBM_value5.slice(0,1)+"%");
    	 			//$('#yzb').html("&nbsp;&nbsp;&nbsp;乙占比"+result.getYPFXByDateAndKSBM_value3.slice(0,1)+"%");
    	 			//$('#yzb1').html("&nbsp;&nbsp;&nbsp;乙占比"+result.getYPFXByDateAndKSBM_value3.slice(0,1)+"%");
    	 			//目录类仪表盘数据
    	 			//$('#mlytb').html("同比增长"+result.getYPFXByDateAndKSBM_value7.slice(0,1)+"%");
 	 				//$('#mlyhb').html("环比增长"+result.getYPFXByDateAndKSBM_value8.slice(0,1)+"%");
 	 				//$('#mlyzb').html("&nbsp;&nbsp;&nbsp;目录药占比"+result.getYPFXByDateAndKSBM_value6.slice(0,1)+"%");
 	 				//$('#mlyzb1').html("&nbsp;&nbsp;&nbsp;目录药占比"+result.getYPFXByDateAndKSBM_value6.slice(0,1)+"%");
    	 			//修改DIV悬浮框日期
    	 			$('.date').html(result.getYPFXByDateAndKSBM_value13);

    	 			
    			}else{
    				alert('暂无数据')
    			}
    		}, 'JSON');
     }
    
    function getConsumableByType(hclx){
    	$.ajax({
    		url:'${path}/chargeCheck/getComsumableByLevel',
    		data:{
    			hclx:hclx
    		},
    		success:function(data){
    			data=JSON.parse(data);
    			$('#consumable').empty();
    			for(var i=0;i<data.length;i++){
    				$('#consumable').append("<option value='"+data[i].XMBM+"'>"+data[i].XMMC+"</option>");
    			}
    			document.getElementById("consumable").selectedIndex = -1;
    		}
    	})
    }
    
    function searchAll(){
    	loadgauge($('#selectYear').val(),$('#selectMonth').val(),$('#depart').combobox('getValue'));
    }
    
    function getLineGroupByMonth(syear,smonth,ssczbm,department){
    	
   	   $.post('${path }/costStruct/selectEcharsData', {
   		    syear:syear,
   		    smonth:smonth,
   		  	ssczbm:ssczbm,
   		  	department:department,
   			methodFlag:'selectConsumableByMonth'
   		}, function(result) {
   			if(result.selectConsumableByMonth_value1){
   	  			optionLine7.xAxis[0].data=result.selectConsumableByMonth_value0;
   	  			optionLine7.series[0].data=result.selectConsumableByMonth_value1;
   	  			optionLine7.series[1].data=result.selectConsumableByMonth_value2;
   	  	    	myChartLine7.setOption(optionLine7);
    			$($('#monthMoney').siblings('td')).empty();
   				$($('#monthPerson').siblings('td')).empty();
   	   			for(var mm=0;mm<result.selectConsumableByMonth_value0.length;mm++){
   	   				$($('#monthMoney').siblings('td')[mm]).html(result.selectConsumableByMonth_value1[mm]);
   	   				$($('#monthPerson').siblings('td')[mm]).html(result.selectConsumableByMonth_value2[mm]);
   	   			}
   			}else{
   				alert('暂无数据');
   			}

   		}, 'JSON');
      }
    
    function selecConsumableByDepart(syear,smonth,ssczbm,department){
    	
   	   $.post('${path }/costStruct/selectEcharsData', {
 	    	syear:syear,
 		  	ssczbm:ssczbm,
 		  	smonth:smonth,
 		  	department:department,
 			methodFlag:'selectConsumableByDepart'
   		}, function(result) {
   			if(result.selectConsumableByDepart_value0){
   				optionLine8.xAxis[0].data=result.selectConsumableByDepart_value0;
   	   			optionLine8.series[0].data=result.selectConsumableByDepart_value1;
   	   			optionLine8.series[1].data=result.selectConsumableByDepart_value2;
   	   			//myChartLine8.setOption(optionLine8);
   	   			$('#monthDepart').siblings('th').remove();
   	   			for(var de=0;de<result.selectConsumableByDepart_value0.length;de++){
   	   				$('#monthDepartF').append("<th>"+result.selectConsumableByDepart_value0[de]+"</th>");
   	   			}
   	   			$('#departMoney').siblings('td').remove();
   	   			$('#departPerson').siblings('td').remove();
   	   			for(var mm=0;mm<result.selectConsumableByDepart_value0.length;mm++){
   	   				//alert($('#departMoney').siblings('td').length);
   	   				$('#departMoneyF').append("<td>"+result.selectConsumableByDepart_value1[mm]+"</td>")
   	   				$('#departPersonF').append("<td>"+result.selectConsumableByDepart_value2[mm]+"</td>")
   	   			}
   	   			myChartLine8 = echarts.init(document.getElementById('line8'));
   	   		    myChartLine8.setOption(optionLine8);
   			}
    		
   		}, 'JSON');
      }  
    
    
    $(function(){
    	for(var sy=0;sy<3;sy++){
    		var syy= new Date().getFullYear();
    		$('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
    	}
    	var date=new Date;
    	var month=date.getMonth()+1
    	month=month<10?"0"+month:String(month);
    	$("#selectMonth").val(month);
    	
		$('#depart').combobox({
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',
		     textField:'ksmc',
			onLoadSuccess: function () {
				chooseFirstOption(this);
			}
		});
		loadgauge('2017', '01', '0000');
		getConsumableByType('高值耗材');
		getLineGroupByMonth('2017', 'F00000000762', '0013');
		selecConsumableByDepart('2017', '01', '', '');
    })
    

</script>
</body>
</html>