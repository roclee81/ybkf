<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>决策分析-治疗分析</title>
    <style>
        .jc-sh-wg-bar{
            text-align: left;
            padding-left: 20%;
        }
        .xy-button{
            height: 36px;
            width: 150px;
        }
        .panel-body{
        	padding: 0px;
        }
    </style>
</head>
<body>
<!--筛选条件-->
<div class="body-width fs_18 bold header-color">治疗分析</div>
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
<!--仪表图-->
<div class="body-width margin-top6">
    <div class="float fy-gauge-div" style="height: 262px !important;">
        <div class="fy-gauge" id="gauge4"> </div>
        <div style="margin-top: 4px">
            <table class="ed-table">
                <tr>
                    <td class="center-td dis-block" style="position: relative">
                        <label id='zlftb' class="same gauge-font">同比增长3.2%</label>
                        <div class="zy-same">
                            <p ><span class='date'></span><br><label id='zlf' class="failure-style"></label></p>
                        </div>
                        <label id='zlfhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长2.8%</label>
                        <div  class="zy-sequential">
                            <p ><span class='date'></span><br><label id='zlf1' class="failure-style"></label></p>
                        </div>
                    </td>
                </tr>
                <tr><td id='zlf2'>治疗费：38万元</td></tr>
            </table>
        </div>
    </div>
    <div class="float fy-gauge-div" style="height: 262px !important; width: 30%!important;">
        <div class="fy-gauge" id="gauge5"> </div>
        <div style="margin-top: 4px">
            <table class="ed-table">
                <tr>
                    <td class="center-td dis-block" style="position: relative">
                        <label id='sszlftb' class="same gauge-font">同比增长4.01%</label>
                        <div class="zy-same">
                            <p ><span class='date'></span><br><label id='sszlf' class="failure-style"></label></p>
                        </div>
                        <label id='sszlfhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长3.78%</label>
                        <div class="zy-sequential">
                            <p ><span class='date'></span><br><label id='sszlf1' class="failure-style"></label></p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        手术治疗费：<span id='sszlf2'></span>万元&nbsp;&nbsp;&nbsp;&nbsp;手术费：<span id='sszlf3'></span>万元&nbsp;&nbsp;&nbsp;&nbsp;麻醉费：<span id='sszlf4'></span>万元
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="float fy-gauge-div" style="height: 262px !important;">
        <div class="fy-gauge" id="gauge6"> </div>
        <div style="margin-top: 4px">
            <table class="ed-table">
                <tr>
                    <td class="center-td dis-block" style="position: relative">
                        <label id='fsszlftb' class="same gauge-font">同比增长3.23%</label>
                        <div class="zy-same">
                            <p ><span class='date'></span><br><label id='fsszlf' class="failure-style"></label></p>
                        </div>
                        <label id='fsszlfhb' class="sequential gauge-font" style="margin-left: 2px !important;">环比增长3.03%</label>
                        <div class="zy-sequential">
                            <p ><span class='date'></span><br><label id='fsszlf1' class="failure-style"></label></p>
                        </div>
                    </td>
                </tr>
                <tr><td >非手术疗费：<span id='fsszlf2'></span>万元</td></tr>
            </table>
        </div>
    </div>
    <div class="float ">

    </div>
</div>
<div class="clear"></div>
<div class="body-width margin-bottom20">
    <!--筛选条件-->
    <table class="sx-dj body-width">
        <tr>
            <td class="fs_16">手术等级</td>
            <td>
                <select id='ssdj' onchange="getSSMC($(this).val())">
                    <option value='1'>一级</option>
                    <option value='2'>二级</option>
                    <option value='3'>三级</option>
                    <option value='4'>四级</option>
                </select>
            </td>
            <td class="fs_16">手术名称</td>
            <td>
                <select id='ssmc' onchange="getLineGroupByMonth($('#selectYear').val(),$('#selectMonth').val(),$(this).val(),$('#depart').combobox('getValue'));
                selectOperationInfoByDepart($('#selectYear').val(), $('#selectMonth').val(), $(this).val(), $('#depart').combobox('getValue'));">
                </select>
            </td>
            <td>
                <button class="xy-button fs_16 xy-btn-bg xy-btn-active xy-btn-select">手术指标月度变化趋势</button>
                <button class="xy-button fs_16 xy-btn-bg margin-left10">科室手术项目分布</button>
            </td>
        </tr>
    </table>
    <div class="tab_box">
        <!--治疗—折线图1-->
        <div class="line1">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line5">

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
                <div class="fy-bar-div" id="line6">

                </div>
            </div>
            <!--表格数据-->
            <div class="clear"></div>
            <div class="ks-fy-line-div border-val margin-top10" style="overflow-x: auto">
                <table class="td-line body-width sf-msg-table">
                    <tbody>
                    <tr id='monthDepartF'  class="th-bg">
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
            	getLineGroupByMonth($('#selectYear').val(),$('#selectMonth').val(),$("#ssmc").val(),$('#depart').combobox('getValue'))
            }
            if(index==1){
            	line2();
            	selectOperationInfoByDepart($('#selectYear').val(), $('#selectMonth').val(), $("#ssmc").val(), $('#depart').combobox('getValue'));
            }
        }
    });

    //治疗-仪表图1
    var Chart_Gauge4 = echarts.init(document.getElementById('gauge4'));
    // 指定图表的配置项和数据
    option_Gauge4 = {
        title : {
            text: '治疗费占比',
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
                name:'治疗费占比',
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
                data:[{value: 56}]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge4.setOption(option_Gauge4);
    window.onresize = Chart_Gauge4.resize;

    //治疗-仪表图2
    var Chart_Gauge5 = echarts.init(document.getElementById('gauge5'));
    // 指定图表的配置项和数据
    option_Gauge5 = {
        title : {
            text: '手术治疗费占比',
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
                name:'手术治疗费占比',
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
                data:[{value: 67.37}]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge5.setOption(option_Gauge5);
    window.onresize = Chart_Gauge5.resize;

    //治疗-仪表图3
    var Chart_Gauge6 = echarts.init(document.getElementById('gauge6'));
    // 指定图表的配置项和数据
    option_Gauge6 = {
        title : {
            text: '非手术治疗费占比',
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
                name:'非手术治疗费',
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
                data:[{value: 32.63}]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_Gauge6.setOption(option_Gauge6);
    window.onresize = Chart_Gauge6.resize;

   
    // 治疗-折线图1
    var myChartLine5 = echarts.init(document.getElementById('line5'));
    function line1() {
    	myChartLine5 = echarts.init(document.getElementById('line5'));
    	 optionLine5 = {
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
    		    myChartLine5.setOption(optionLine5);
    		    window.onresize = myChartLine5.resize;
    }
    function line2() {
    	   myChartLine6 = echarts.init(document.getElementById('line6'));
    	    // 指定图表的配置项和数据
    	   
    	    optionLine6 = {
    	        title : {
    	            text: '科室手术分布',
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
    	    myChartLine6.setOption(optionLine6);
    	    window.onresize = myChartLine6.resize;
    	    
    }
    // 指定图表的配置项和数据
    optionLine5 = {
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
    myChartLine5.setOption(optionLine5);
    window.onresize = myChartLine5.resize;
   
    // 治疗-折线图2
  
    var myChartLine6 = echarts.init(document.getElementById('line6'));
    // 指定图表的配置项和数据
   
    optionLine6 = {
        title : {
            text: '科室手术分布',
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
    myChartLine6.setOption(optionLine6);
    window.onresize = myChartLine6.resize;
    
    $("a,button").focus(function(){this.blur()});
    
    $(function(){
    	
    })
    
function loadgauge(year,month,department){
   	   $.post('${path }/costStruct/selectEcharsData', {
   		    syear:year,
   		    smonth:month,
   			department:department,
   			methodFlag:'getTreatmentByDepart'
   		}, function(result) {
   				if(result.getTreatmentByDepart_value1){
   					
	   				option_Gauge4.series[0].data={value:result.getTreatmentByDepart_value1.slice(0,1)};
	   				Chart_Gauge4.setOption(option_Gauge4);
	   				option_Gauge5.series[0].data={value:result.getTreatmentByDepart_value7.slice(0,1)};
	   				Chart_Gauge5.setOption(option_Gauge5);
	   				option_Gauge6.series[0].data={value:result.getTreatmentByDepart_value11.slice(0,1)};
	   				Chart_Gauge6.setOption(option_Gauge6);
	   				//yyy
	   	 			//治疗费仪表盘数据
	   	 			$('#zlftb').html("同比增长"+result.getTreatmentByDepart_value2.slice(0,1)+"%");
	   	 			$('#zlfhb').html("环比增长"+result.getTreatmentByDepart_value3.slice(0,1)+"%");
	   	 			$('#zlf').html("&nbsp;&nbsp;&nbsp;治疗费占比"+result.getTreatmentByDepart_value1.slice(0,1)+"%");
	   	 			$('#zlf1').html("&nbsp;&nbsp;&nbsp;治疗费占比"+result.getTreatmentByDepart_value1.slice(0,1)+"%");
	   	 			$('#zlf2').html("&nbsp;&nbsp;&nbsp;治疗费占比"+result.getTreatmentByDepart_value1.slice(0,1)+"%");
	   	 			
	   	 			//手术治疗费仪表盘数据
	   	 			$('#sszlftb').html("同比增长"+result.getTreatmentByDepart_value8.slice(0,1)+"%");
	   	 			$('#sszlfhb').html("环比增长"+result.getTreatmentByDepart_value9.slice(0,1)+"%");
	   	 			$('#sszlf').html("&nbsp;&nbsp;&nbsp;手术治疗费占比"+result.getTreatmentByDepart_value7.slice(0,1)+"%");
	   	 			$('#sszlf1').html("&nbsp;&nbsp;&nbsp;手术治疗费占比"+result.getTreatmentByDepart_value7.slice(0,1)+"%");
	   	 			$('#sszlf2').html(""+result.getTreatmentByDepart_value4.slice(0,1));
	   	 		$('#sszlf3').html(""+result.getTreatmentByDepart_value5.slice(0,1));
	   	 	$('#sszlf4').html(""+result.getTreatmentByDepart_value6.slice(0,1));
	   	 			
	   	 			//甲类仪表盘数据
	   	 			$('#fsszlftb').html("同比增长"+result.getTreatmentByDepart_value12.slice(0,1)+"%");
	   	 			$('#fsszlfhb').html("环比增长"+result.getTreatmentByDepart_value13.slice(0,1)+"%");
	   	 			$('#fsszlf').html("&nbsp;&nbsp;&nbsp;非手术治疗费占比"+result.getTreatmentByDepart_value11.slice(0,1)+"%");
	   	 			$('#fsszlf1').html("&nbsp;&nbsp;&nbsp;非手术治疗费占比"+result.getTreatmentByDepart_value11.slice(0,1)+"%");
	   	 			$('#fsszlf2').html(""+result.getTreatmentByDepart_value10.slice(0,1));
	   	 			//修改DIV悬浮框日期 */
	   	 			$('.date').html(result.getTreatmentByDepart_value14);
   				}
   		}, 'JSON');
    }
    
    function getSSMC(ssdj){
    	$.ajax({
    		url:'${path}/chargeCheck/getOperateByLevel',
    		data:{ssdj:ssdj},
    		success:function(data){
    			data=JSON.parse(data);
    			
				$('#ssmc').empty();
    			for(var dg=0;dg<data.length;dg++){
    				$('#ssmc').append("<option value='"+data[dg].SSBM+"'>"+data[dg].SSMC+"</option>");
    			}
    			//一开始选择项为空
    		    document.getElementById("ssmc").selectedIndex = -1;
    		}
    	})
    }
    
    
    function getLineGroupByMonth(syear,smonth,ssczbm,department){
    	
  	   $.post('${path }/costStruct/selectEcharsData', {
  		    syear:syear,
  		    smonth:smonth,
  		  	ssczbm:ssczbm,
  		  	department:department,
  			methodFlag:'selectOperationInfoBySSDJ'
  		}, function(result) {
  			if(result.selectOperationInfoBySSDJ_value1){
  	  			optionLine5.xAxis[0].data=result.selectOperationInfoBySSDJ_value0;
  	  			optionLine5.series[0].data=result.selectOperationInfoBySSDJ_value1;
  	  			optionLine5.series[1].data=result.selectOperationInfoBySSDJ_value2;
  	  			myChartLine5.setOption(optionLine5);
  				$($('#monthMoney').siblings('td')).empty();
  				$($('#monthPerson').siblings('td')).empty();
  	   			for(var mm=0;mm<$('#monthMoney').siblings('td').length;mm++){
  	   				$($('#monthMoney').siblings('td')[mm]).html(result.selectOperationInfoBySSDJ_value1[mm]);
  	   				$($('#monthPerson').siblings('td')[mm]).html(result.selectOperationInfoBySSDJ_value2[mm]);
  	   			}
  			}else{
  				alert('暂无数据');
  			}

  		}, 'JSON');
     }
    
    function selectOperationInfoByDepart(syear,smonth,ssczbm,department){
    	
  	   $.post('${path }/costStruct/selectEcharsData', {
	    	syear:syear,
		  	ssczbm:ssczbm,
		  	smonth:smonth,
		  	department:department,
			methodFlag:'selectOperationInfoByDepart'
  		}, function(result) {
  		if(result.selectOperationInfoByDepart_value0){
  			optionLine6.xAxis[0].data=result.selectOperationInfoByDepart_value0;
  			optionLine6.series[0].data=result.selectOperationInfoByDepart_value1;
  			optionLine6.series[1].data=result.selectOperationInfoByDepart_value2;
  			myChartLine6.setOption(optionLine6);
  			$('#monthDepart').siblings('th').remove();
  			for(var de=0;de<result.selectOperationInfoByDepart_value0.length;de++){
  				$('#monthDepartF').append("<th>"+result.selectOperationInfoByDepart_value0[de]+"</th>");
  			}
  			$('#departMoney').siblings('td').remove();
  			$('#departPerson').siblings('td').remove();
  			for(var mm=0;mm<result.selectOperationInfoByDepart_value0.length;mm++){
  				//alert($('#departMoney').siblings('td').length);
  				$('#departMoneyF').append("<td>"+result.selectOperationInfoByDepart_value1[mm]+"</td>")
  				$('#departPersonF').append("<td>"+result.selectOperationInfoByDepart_value2[mm]+"</td>")
  			}
  			myChartLine6 = echarts.init(document.getElementById('line6'));//袁林：这里重新加载echarts图
  		    myChartLine6.setOption(optionLine6);//袁林：这里重新加载echarts图
  		}
   		
  		}, 'JSON');
     }

    
    $(function(){
		$('#depart').combobox({
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',
		     textField:'ksmc',
			onLoadSuccess: function () {
				chooseFirstOption(this);
			}
		});
    	for(var sy=0;sy<3;sy++){
    		var syy= new Date().getFullYear();
    		$('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
    	}
    	var date=new Date;
    	var month=date.getMonth()+1
    	month=month<10?"0"+month:String(month);
    	$("#selectMonth").val(month);
    	line1();
    	line2();
    	loadgauge('2017', '01', '0000');
    	getSSMC('1');
    	getLineGroupByMonth('2017', '', '0000');
    	
    })
    
    function searchAll(){
    	loadgauge($('#selectYear').val(), $('#selectMonth').val(),$('#depart').combobox('getValue'));
    	selectOperationInfoByDepart($('#selectYear').val(), $('#selectMonth').val(), $("#ssmc").val(), $('#depart').combobox('getValue'));
    }

</script>
</body>
</html>