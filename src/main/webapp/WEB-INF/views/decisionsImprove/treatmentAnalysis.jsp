<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>治疗分析</title>
    <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath }/static/js/common.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <style>
    	.gauge-div{width:32.66%;margin-top:14px !important;
			margin-bottom:0px !important;}
		#zy_Gauge1{height:220px}
		#zy_Gauge2{height:220px}
		#zy_Gauge3{height:220px}
		#NM_Gauge1{height:240px;}
		#NM_Gauge2{height:240px;}
		#NM_Gauge3{height:240px;}
		.Cost_top{margin-bottom:14px; padding:10px 0; background-color:#fff; display:none;}
		.Cost_top .Right_cost{}
		.yb-jj-div{padding:0;}
		.gauge-title-div table tr > td{color:#333333 !important; line-height:40px;}
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
                        <input class="padding-left4" size="10" type="text" >
                        <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                       &nbsp;至&nbsp;
                    </div>
            </td>
			<td style="padding-left: 0px">
                <div class="input-group date form_date float">
                    <input class="padding-left4" size="10" type="text" >
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
<!--仪表图-->

    <div class="tab-div-box margin-bottom10">
        <!--医保基金利用情况-->
            <div class="yb-jj-div">
                <div class="gauge-div float bg-color">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">治疗费用</td>
                                <td class="right "></td>
                            </tr>
                        </table>
                    </div>
                    <div id="num_a">
                        <div id="zy_Gauge1">

                        </div>
                        
                    </div>
					<p class="HanDe">
                        <font>治疗费：<span>38</span> 万元</font>
                    </p>
                    <div class="gauge-bom">
                        <table class="body-width">
                            <tr>
                                <td class="center-td fs_16">同比增长：<span>3.2%</span></td>
                                <td class="center-td fs_16">环比增长：<span>2.8%</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="gauge-div float bg-color" style="margin-left: 1%">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">手术治疗费</td>
                                <td class="right "></td>
                            </tr>
                        </table>
                    </div>
                    <div id="num_b">
                        <div id="zy_Gauge2">

                        </div>
                    </div>
                    <p class="HanDe">
                        <font>手术治疗费：<span>15</span> 万元</font>
                        <font>手术费：<span>9.8 </span> 万元</font>
                        <font>麻醉费：<span>0.8</span> 万元</font>
                    </p>
                    <div class="gauge-bom">
                        <table class="body-width">
                            <tr>
                                <td class="center-td fs_16">同比增长：<span>4.01%</span></td>
                                <td class="center-td fs_16">环比增长：<span>3.78%</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="gauge-div float bg-color" style="margin-left: 1%">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left ">非手术治疗费</td>
                                <td class="right "></td>
                            </tr>
                        </table>
                    </div>
                    <div id="num_c">
                        <div id="zy_Gauge3">

                        </div>
                    </div>
                    <p class="HanDe">
                        <font>非手术疗费：<span>12.4</span> 万元</font>
                    </p>
                    <div class="gauge-bom">
                        <table class="body-width">
                            <tr>
                                <td class="center-td fs_16">同比增长：<span>2.3%</span></td>
                                <td class="center-td fs_16">环比增长：<span>2.1%</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            <div class="clear"></div>
        </div>
    </div>

    
  </div>
</div>

<div class="clear"></div>
<div class="body-width margin-top6 bg-color">
<div class="header-div bg-color margin-bottom20">
<div class="body-width margin-bottom20">
    <!--选项卡-->
    <table class="sx-dj body-width">
        <tr>
        	<td>
                <button class="xy-button  xy-btn-select">治疗费类别排序 </button>
                <button class="xy-button  margin-left10">治疗费种类排序</button>
                <button class="xy-button  margin-left10">治疗费使用趋势</button>
            </td>
            <td class="fs_14">治疗费类别</td>
            <td>
                <select>
                    <option value="0">全部</option>
                    <option value="1">治疗费</option>
                    <option value="2">手术费</option>
                    <option value="3">麻醉费</option>
                    <option value="4">非手术疗费</option>
                </select>
            </td>
            <td class="fs_14">治疗种类</td>
            <td>
                <select class="margin-right10">
                    <option value="0">全部</option>
                    <option value="1">全胃切除术</option>
                    <option value="2">肝切除术</option>
                    <option value="3">胆道再次切除术</option>
                    <option value="4">甲状旁腺切除术</option>
                    <option value="5">主动脉瘤手术</option>
                    <option value="6">胰腺癌根治术</option>
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
                        <td class="right fs_16 " >
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
                            <th>治疗类别</th>
                            <th>金额</th>
                            <th>占治疗金额总比例</th>
                        </tr>
                        <tr>
                            <td>01</td>
                            <td class="left">治疗费</td>
                            <td class="right">23500</td>
                            <td class="right">20%</td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td class="left">手术费</td>
                            <td class="right">12400</td>
                            <td class="right">15%</td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td class="left">麻醉费</td>
                            <td class="right">23560</td>
                            <td class="right">25%</td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td class="left">非手术疗费</td>
                            <td class="right">24500</td>
                            <td class="right">10%</td>
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
                            <th>治疗名称</th>
                            <th>治疗累计金额</th>
                            <th>当月金额</th>
                            <th>同比增长率</th>
                        </tr>
                        <tr>
                            <td class="left">全胃切除术</td>
                            <td class="right">36220</td>
                            <td class="right">1401</td>
                            <td class="right">20%</td>
                        </tr>
                        <tr>
                            <td class="left">肝切除术</td>
                            <td class="right">45620</td>
                            <td class="right">2350</td>
                            <td class="right">15%</td>
                        </tr>
                        <tr>
                            <td class="left">胆道再次切除术</td>
                            <td class="right">12400</td>
                            <td class="right">3520</td>
                            <td class="right">25%</td>
                        </tr>
                        <tr>
                            <td class="left">甲状旁腺切除术</td>
                            <td class="right">14523</td>
                            <td class="right">1452</td>
                            <td class="right">10%</td>
                        </tr>
                        <tr>
                            <td class="left">主动脉瘤手术</td>
                            <td class="right">45721</td>
                            <td class="right">1524</td>
                            <td class="right">12%</td>
                        </tr>
                        <tr>
                            <td class="left">胰腺癌根治术</td>
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
    <div class="Cost_top">
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
                            <th>治疗名称</th>
                            <th>治疗规格</th>
                            <th>当月金额</th>
                            <th>同比增长率</th>
                        </tr>
                        <tr>
                            <td>1月</td>
                            <td class='left'>全胃切除术</td>
                            <td></td>
                            <td class="right">1401</td>
                            <td class="right">20%</td>
                        </tr>
                        <tr>
                            <td>2月</td>
                            <td class='left'>全胃切除术</td>
                            <td></td>
                            <td class="right">12400</td>
                            <td class="right">15%</td>
                        </tr>
                        <tr>
                            <td>3月</td>
                            <td class='left'>全胃切除术</td>
                            <td></td>
                            <td class="right">23560</td>
                            <td class="right">25%</td>
                        </tr>
                        <tr>
                            <td>4月</td>
                            <td class='left'>全胃切除术</td>
                            <td></td>
                            <td class="right">24500</td>
                            <td class="right">10%</td>
                        </tr>
                        <tr>
                            <td>5月</td>
                            <td class='left'>全胃切除术</td>
                            <td></td>
                            <td class="right">42000</td>
                            <td class="right">12%</td>
                        </tr>
                        <tr>
                            <td>6月</td>
                            <td class='left'>全胃切除术</td>
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
    $(document).ready(function(){
		x_data1 = ['治疗费','手术费','麻醉费','非手术疗费'];
		bar_data1 = [22, 14, 10,22, 14, 10];
		bar_data1_1 = [2400, 2200, 2000,1800, 1600, 1400];
		x_data2 = ['全胃切除术','肝切除术','胆道再次切除术','甲状旁腺切除术','主动脉瘤手术','胰腺癌根治术'];
		bar_data2 = [22, 14, 10,22, 14, 10];
		bar_data2_1 = [2400, 2200, 2000,1800, 1600, 1400];
		x_data3 = ['1月','2月','3月','4月','5月','6月'];
		bar_data3 = [22, 14, 10,22, 14, 10];
		bar_data3_1 = [2400, 2200, 2000,1800, 1600, 1400];
		Pine();
/*		Pine2();
		Pine3();*/
        /*line1();*/
		Gauge();
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
            $(this).parent().parent().parent().parent().parent().find(".tab_box > div").eq(index).css("display","block").siblings().css("display","none");
            if (index == 0) {
                Pine();
            } else if(index == 1) {
                Pine2();
            }else{
				Pine3();
				}
        }
    });

        /*仪表盘*/
        function Gauge(){
            //仪表图1
            var Chart_zy_Gauge1 = echarts.init(document.getElementById('zy_Gauge1'));
            var gauge1_date = 76;
            var gauge1_ze = 100;
            var gauge1_percent = Number((gauge1_date/gauge1_ze).toPrecision(2));

            // 指定图表的配置项和数据
            option_zy_Gauge1 = {
                tooltip : {
                    formatter: "{a} <br/>{b} : {c}(万元)"
                },
                series : [
                    {
                        name:'本月使用',
                        type:'gauge',
                        center : ['50%', '58%'],    // 默认全局居中
                        radius : '88%',
                        min: 0,                     // 最小值
                        max: gauge1_ze,                   // 最大值
                        splitNumber: 10,             // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            show: true,        // 默认显示，属性show控制显示与否
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[gauge1_percent, '#ED86A4'],[1, '#E5E5E5']],
                                width: 20

                            }
                        },
                        axisTick: {            // 坐标轴小标记
                            show: true,        // 属性show控制显示与否，默认不显示
                            splitNumber: 5,    // 每份split细分多少段
                            length :5,         // 属性length控制线长
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: '#eee',
                                width: 1,
                                type: 'solid'
                            }
                        },
                        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                            show: true,
                            distance:-28,
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#333'
                            }
                        },
                        splitLine: {           // 分隔线
                            show: true,        // 默认显示，属性show控制显示与否
                            length :8,         // 属性length控制线长
                            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                                color: '#eee',
                                width: 1,
                                type: 'solid'
                            }
                        },
                        pointer : {
                            show:false,
                            length : '60%',
                            width : 8,
                            color : 'auto'
                        },
                        title : {
                            show : true,
                            offsetCenter: [0, '-2%'],
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#333',
                                fontSize : 16
                            }
                        },
                        detail : {
                            show : true,
                            backgroundColor: 'rgba(0,0,0,0)',
                            borderWidth: 0,
                            borderColor: '#ccc',
                            offsetCenter: [0, '10%'],
                            formatter:'{value}(%)',
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#ED86A4',
                                fontSize : 14
                            }
                        },
                        data:[{value: gauge1_date,name: ''}]
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_zy_Gauge1.setOption(option_zy_Gauge1);
            //仪表图2
            var Chart_zy_Gauge2 = echarts.init(document.getElementById('zy_Gauge2'));
            // 指定图表的配置项和数据
            var gauge2_date = 67.37;
            var gauge2_ze = 100;
            var gauge2_percent = Number((gauge2_date/gauge2_ze).toPrecision(2));

            option_zy_Gauge2 = {
                tooltip : {
                    formatter: "{a} :<br/> {c}(万元)"
                },
                series : [
                    {
                        name:'年度使用',
                        type:'gauge',
                        center : ['50%', '58%'],    // 默认全局居中
                        radius : '88%',
                        min: 0,                     // 最小值
                        max: gauge2_ze,                   // 最大值
                        precision: 0,               // 小数精度，默认为0，无小数点
                        splitNumber: 10,             // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            show: true,        // 默认显示，属性show控制显示与否
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[gauge1_percent, '#FFA31C'],[1.0, '#E5E5E5']],
                                width: 20
                            }
                        },
                        axisTick: {            // 坐标轴小标记
                            show: true,        // 属性show控制显示与否，默认不显示
                            splitNumber: 5,    // 每份split细分多少段
                            length :2,         // 属性length控制线长
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: '#eee',
                                width: 1,
                                type: 'solid'
                            }
                        },
                        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                            show: true,
                            distance:-34,
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#333'
                            }
                        },
                        splitLine: {           // 分隔线
                            show: true,        // 默认显示，属性show控制显示与否
                            length :8,         // 属性length控制线长
                            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                                color: '#eee',
                                width: 2,
                                type: 'solid'
                            }
                        },
                        pointer : {
                            show: false,
                            length : '60%',
                            width : 8,
                            color : 'auto'
                        },
                        title : {
                            show : true,
                            offsetCenter: [0, '-2%'],
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#333',
                                fontSize : 16
                            }
                        },
                        detail : {
                            show : true,
                            backgroundColor: 'rgba(0,0,0,0)',
                            borderWidth: 0,
                            borderColor: '#ccc',
                            width: 100,
                            height: 40,
                            offsetCenter: [0, '10%'],
                            formatter:'{value}%',
                            textStyle: {      // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#FFA31C',
                                fontSize : 18
                            }
                        },
                        data:[{value: gauge2_date,name:''}]
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_zy_Gauge2.setOption(option_zy_Gauge2);
			//仪表图3
            var Chart_zy_Gauge3 = echarts.init(document.getElementById('zy_Gauge3'));
            // 指定图表的配置项和数据
            var gauge3_date = 32.63;
            var gauge3_ze =100;
            var gauge3_percent = Number((gauge3_date/gauge3_ze).toPrecision(2));

            option_zy_Gauge3 = {
                tooltip : {
                    formatter: "{a} :<br/> {c}(万元)"
                },
                series : [
                    {
                        name:'年度使用',
                        type:'gauge',
                        center : ['50%', '58%'],    // 默认全局居中
                        radius : '88%',
                        min: 0,                     // 最小值
                        max: gauge3_ze,                   // 最大值
                        precision: 0,               // 小数精度，默认为0，无小数点
                        splitNumber: 10,             // 分割段数，默认为5
                        axisLine: {            // 坐标轴线
                            show: true,        // 默认显示，属性show控制显示与否
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: [[gauge3_percent, '#A6CB62'],[1, '#E5E5E5']],
                                width: 20
                            }
                        },
                        axisTick: {            // 坐标轴小标记
                            show: true,        // 属性show控制显示与否，默认不显示
                            splitNumber: 5,    // 每份split细分多少段
                            length :2,         // 属性length控制线长
                            lineStyle: {       // 属性lineStyle控制线条样式
                                color: '#eee',
                                width: 1,
                                type: 'solid'
                            }
                        },
                        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
                            show: true,
                            distance:-34,
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#333'
                            }
                        },
                        splitLine: {           // 分隔线
                            show: true,        // 默认显示，属性show控制显示与否
                            length :8,         // 属性length控制线长
                            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                                color: '#eee',
                                width: 2,
                                type: 'solid'
                            }
                        },
                        pointer : {
                            show: false,
                            length : '60%',
                            width : 8,
                            color : 'auto'
                        },
                        title : {
                            show : true,
                            offsetCenter: [0, '-2%'],
                            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#333',
                                fontSize : 16
                            }
                        },
                        detail : {
                            show : true,
                            backgroundColor: 'rgba(0,0,0,0)',
                            borderWidth: 0,
                            borderColor: '#ccc',
                            width: 100,
                            height: 40,
                            offsetCenter: [0, '10%'],
                            formatter:'{value}%',
                            textStyle: {      // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                                color: '#A6CB62',
                                fontSize : 14
                            }
                        },
                        data:[{value: gauge3_date,name:''}]
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_zy_Gauge3.setOption(option_zy_Gauge3);
            window.addEventListener("resize",function(){
                Chart_zy_Gauge1.resize();
                Chart_zy_Gauge2.resize();
				Chart_zy_Gauge3.resize();
            });


        };


    $("a,button").focus(function(){this.blur()});
	
	$(function () {
       /* 日期插件*/
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            minView:'month',
            language: 'zh-CN',
            autoclose:true,
            todayBtn: true//显示今日按钮
        });
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
</script>
</body>
</html>