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
    <title>大额医疗费用分析</title>
    <style>
  
		#bar3 {
            height: 350px !important;
			padding:20px 0;
        }

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

<div class="zy-div2 bg-color margin-top10">
    <div class="tab-table-box1s margin-bottom20">
        <!--违规规则排序-->
        <div>
        <div class="ks-fy-zb" style="padding-bottom:34px;">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="bar3">
                </div>
            </div>
        </div>
        <div class="module-hr"></div>    
        <div class="tab-table-box bg-color margin-top10" style="display:none" id="tab-box">
            <div class="tab-div-box">
                
               <div class="yb-jj-div float"  style="width:60%; margin-left:1%;">
                    <div class="ks-fy-zb"  style="padding-bottom:0px">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">患者明细</td>
                                    <td class="right fs_16">
                                        <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="ys-rc-div" style="border-right:1px solid #E4F1FD">
                        <table class="body-width common-table" id="common">
                            <tbody>
                            <tr class="th-bg">
                                <th>患者ID</th>
                                <th>患者姓名</th>
                                <th>患者就医方式</th>
                                <th>医疗费(元)</th>
                                <th>医保统筹支付(元)</th>
                                <th>报销比例</th>
                                <th>医保拒付金额(元)</th>
                                <th>药品总费(元)</th>
                                <th>检查检验总费(元)</th>
                                <th>诊疗总费(元)</th>
                                <th>材料总费(元)</th>
                            </tr>
                            <tr>
                                <td>21284939</td>
                                <td><a href="javascript:;">张军</a></td>
                                <td>省外</td>
                                <td class="right">7551.6</td>
                                <td class="right">5059.57</td>
                                <td class="right">0.67</td>
                                <td class="right">2187.64</td>
                                <td class="right">2243.13</td>
                                <td class="right">422.34</td>
                                <td class="right">2790.81</td>
                                <td class="right">1370.05</td>
                            </tr>
                            <tr>
                                <td>21384114</td>
                                <td><a href="javascript:;">赵旭</a></td>
                                <td>省内</td>
                                <td class="right">9938.61</td>
                                <td class="right">6460.1</td>
                                <td class="right">65%</td>
                                <td class="right">122.13</td>
                                <td class="right">5314.36</td>
                                <td class="right">536.07</td>
                                <td class="right">1586.4</td>
                                <td class="right">646.72</td>
                            </tr>
                            <tr>
                                <td>21428378</td>
                                <td><a href="javascript:;">陈宏子</a></td>
                                <td>省外</td>
                                <td class="right">7911.96</td>
                                <td class="right">7358.12</td>
                                <td class="right">93%</td>
                                <td class="right">38.43</td>
                                <td class="right">1757.91</td>
                                <td class="right">468.78</td>
                                <td class="right">1458.99</td>
                                <td class="right">1200.78</td>
                            </tr>
                            <tr>
                                <td>21523565</td>
                                <td><a href="javascript:;">秦婷婷</a></td>
                                <td>省内</td>
                                <td class="right">7919.27</td>
                                <td class="right">6968.96</td>
                                <td class="right">88%</td>
                                <td class="right">817.43</td>
                                <td class="right">3911.68</td>
                                <td class="right">255.5</td>
                                <td class="right">1723.5</td>
                                <td class="right">746.27</td>
                            </tr>
                            <tr>
                                <td>21537923</td>
                                <td><a href="javascript:;">曹丽娜</a></td>
                                <td>省外</td>
                                <td class="right">1997.92</td>
                                <td class="right">1458.48</td>
                                <td class="right">73%</td>
                                <td class="right">78.61</td>
                                <td class="right">1307.08</td>
                                <td class="right">593.08</td>
                                <td class="right">87.01</td>
                                <td class="right">343.74</td>
                            </tr>
                            <tr>
                                <td>21577912</td>
                                <td><a href="javascript:;">李娜</a></td>
                                <td>省外</td>
                                <td class="right">7516.88</td>
                                <td class="right">4209.45</td>
                                <td class="right">56%</td>
                                <td class="right">1417.02</td>
                                <td class="right">4954.41</td>
                                <td class="right">654.45</td>
                                <td class="right">1100.31</td>
                                <td class="right">424.28</td>
                            </tr>
                            <tr>
                                <td>21669546</td>
                                <td><a href="javascript:;">姜钰</a></td>
                                <td>省外</td>
                                <td class="right">8165.27</td>
                                <td class="right">3102.8</td>
                                <td class="right">38%</td>
                                <td class="right">2782.81</td>
                                <td class="right">1788.3</td>
                                <td class="right">122.98</td>
                                <td class="right">1503.09</td>
                                <td class="right">2073.98</td>
                            </tr>
                            <tr>
                                <td>21718066</td>
                                <td><a href="javascript:;">魏天霞</a></td>
                                <td>省内</td>
                                <td class="right">3124.14</td>
                                <td class="right">1749.52</td>
                                <td class="right">56%</td>
                                <td class="right">237.07</td>
                                <td class="right">1949.63</td>
                                <td class="right">215.53</td>
                                <td class="right">106.19</td>
                                <td class="right">170.63</td>
                            </tr>
                            <tr>
                                <td>21761524</td>
                                <td><a href="javascript:;">王红梅</a></td>
                                <td>省外</td>
                                <td class="right">9586.72</td>
                                <td class="right">2971.88</td>
                                <td class="right">31%</td>
                                <td class="right">2482.45</td>
                                <td class="right">1809.51</td>
                                <td class="right">415.97</td>
                                <td class="right">3098.62</td>
                                <td class="right">2126.73</td>
                            </tr>
                            <tr>
                                <td>21849471</td>
                                <td><a href="javascript:;">郭淑慧</a></td>
                                <td>省内</td>
                                <td class="right">5363.58</td>
                                <td class="right">4076.32</td>
                                <td class="right">76%</td>
                                <td class="right">1128.7</td>
                                <td class="right">3974.21</td>
                                <td class="right">399.44</td>
                                <td class="right">916.08</td>
                                <td class="right">635.96</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="gauge-div float" style="width:38%; margin-top:0;">
                    <div class="ks-fy-zb">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">费用分布情况</td>
                                    <td class="right fs_16">
                                        <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                   </div>
                    <div id="num1">
                        <div id="zy_Gauge1">
        
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="module-hr"></div>
            <div class="yb-jj-div margin-top10 bg-color" style="padding:10px; display:none;" id="ore">
            	<div class="float tab-div" style="width: 80%;">
                    <div class="tab-div-menu jb-ul-li" id="sd">
                        <ul class="ul-style" id="ul-two">
                            <li>
                                <label class="x-on" style="margin-left: -2px">医嘱明细</label>
                            </li>
                            <li>
                                <label>费用明细</label>
                            </li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="tab-div-box1 border-val" id="gw" style="margin-bottom: 2px; padding-bottom:10px;">
                	<!--医嘱明细-->
                    <div>
                        <div class="yb-jj-div">
                            <div class="ys-rc-div margin-top20">
                            <table class="common-table">
                            <tbody>
                            <tr class="th-bg">
                                <th>序号</th>
                                <th>日期</th>
                                <th>时间</th>
                                <th>项目编码</th>
                                <th>项目名称</th>
                                <th>违反规则</th>
                                <th>提示说明</th>
                                <th>违规金额(元)</th>
                                <th>实际数量</th>
                                <th>实际金额(元)</th>
                                <th>科室</th>
                                <th>医师</th>
                                <th>给药途径</th>
                                <th>用法</th>
                                <th>用量</th>
                                <th>规格</th>
                                <th>单位</th>
                                <th>单价(元)</th>
                                <th>数量</th>
                                <th>金额(元)</th>
                                <th>医保内金额(元)</th>
                            </tr>
        
                            <tr>
                                <td>0001</td>
                                <td>20170202</td>
                                <td>09:36</td>
                                <td>Y00000000947</td>
                                <td>糖脉康颗粒</td>
                                <td>1.超量取药</td>
                                <td>该药品在同一天<br>内的开药量不得<br>超过15天</td>
                                <td class="right">38</td>
                                <td class="right">4</td>
                                <td class="right">152</td>
                                <td>内科</td>
                                <td>肖勇</td>
                                <td>口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td>5g/袋</td>
                                <td>21袋/盒</td>
                                <td class="right">38</td>
                                <td class="right">4</td>
                                <td class="right">152</td>
                                <td class="right">152</td>
                            </tr>
                            <tr>
                                <td>0002</td>
                                <td>20170202</td>
                                <td>09:38</td>
                                <td>Y00000001502</td>
                                <td>阿司匹林肠溶片</td>
                                <td>2.超量取药</td>
                                <td>该药品在同一天<br>内的开药量不得<br>超过16天</td>
                                <td class="right">54.51</td>
                                <td class="right">10</td>
                                <td class="right">181.7</td>
                                <td>内科</td>
                                <td>肖勇</td>
                                <td>口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td>25mg</td>
                                <td>30片/盒</td>
                                <td class="right">18.17</td>
                                <td class="right">2</td>
                                <td class="right">36.34</td>
                                <td class="right">36.34</td>
                            </tr>
                            <tr>
                                <td>0003</td>
                                <td>20170202</td>
                                <td>10:38</td>
                                <td>Y00000010343</td>
                                <td>青霉素注射液</td>
                                <td>3.超量取药</td>
                                <td>该药品在同一天<br>内的开药量不得<br>超过2000w单位</td>
                                <td class="right">15</td>
                                <td class="right">1</td>
                                <td class="right">60</td>
                                <td>内科</td>
                                <td>许瑞才</td>
                                <td>静脉注射</td>
                                <td>-</td>
                                <td>-</td>
                                <td>80万u/支</td>
                                <td>12支/盒</td>
                                <td class="right">15</td>
                                <td class="right">4</td>
                                <td class="right">60</td>
                                <td class="right">-</td>
                            </tr>
                            </tbody>
                        </table>
                            </div>
                        </div>
                    </div>
                    <!--收费明细-->
                    <div style="display: none;">
                        <div class="yb-jj-div">
                            <div class="ys-rc-div margin-top20">
                                <table class="common-table">
                                    <tbody>
                                    <tr>
                                        <th>序号</th>
                                        <th>项目编码</th>
                                        <th>医院项目名称</th>
                                        <th>数量</th>
                                        <th>金额(元)</th>
                                        <th>医保内金额(元)</th>
                                        <th>执行科室</th>
                                    </tr>
                                    <tr>
                                        <td>160421</td>
                                        <td>F00000001372</td>
                                        <td>尿糖检查</td>
                                        <td class="right">1</td>
                                        <td class="right">45</td>
                                        <td class="right">37</td>
                                        <td>内分泌科</td>
                                    </tr>
                                    <tr>
                                        <td>150341</td>
                                        <td>F00000039347</td>
                                        <td>血常规</td>
                                        <td class="right">1</td>
                                        <td class="right">30</td>
                                        <td class="right">25</td>
                                        <td>检验科</td>
                                    </tr>
                                    <tr>
                                        <td>140261</td>
                                        <td>F00000000189</td>
                                        <td>葡萄糖测定(GLu)</td>
                                        <td class="right">2</td>
                                        <td class="right">78</td>
                                        <td class="right">20</td>
                                        <td>检验科</td>
                                    </tr>
                                    <tr>
                                        <td>130181</td>
                                        <td>F00000000219</td>
                                        <td>淀粉酶测定(AMY)</td>
                                        <td class="right">1</td>
                                        <td class="right">67</td>
                                        <td class="right">12</td>
                                        <td>检验科</td>
                                    </tr>
                                    <tr>
                                        <td>120101</td>
                                        <td>F00000000278</td>
                                        <td>钠测定(Na干化学)</td>
                                        <td class="right">2</td>
                                        <td class="right">100</td>
                                        <td class="right">28</td>
                                        <td>检验科</td>
                                    </tr>
                                    <tr>
                                        <td>110021</td>
                                        <td>F00000000277</td>
                                        <td>钾测定(K干化学)</td>
                                        <td class="right">1</td>
                                        <td class="right">100</td>
                                        <td class="right">20</td>
                                        <td>检验科</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>            
                </div>
            </div>
        </div>
        </div>
    </div>
</div>
 <script>
$(document).ready(function () {
bar2();
});
//普通住院-违规汇总
$("#ul-two li").click(function () {
	//切换选中的按钮高亮状态
	
	var index = $(this).index();
	$("#ul-two li").eq(index).find('label').addClass("x-on");
	
	$("#ul-two li").eq(index).siblings().children().removeClass("x-on");

	//获取被按下按钮的索引值，需要注意index是从0开始的
	$("#gw > div").eq(index).show().siblings().hide();
});

$("#common a").click(function(){
	$("#ore").css("display","block");
	});
/*普通住院-违规汇总-违规规则排序-柱状图*/
function bar2(){
	// 柱状图2
	var myChartBar = echarts.init(document.getElementById('bar3'));
	// 指定图表的配置项和数据
	option_bar3 = {
		title: {
        text: '大额医疗费用患者人次',
		top: 0,
		left: '30%',
		textStyle: {
			fontSize:14
					},
        },
		tooltip: {
			trigger: 'axis',
			axisPointer: {            // 坐标轴指示器，坐标轴触发有效
				type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			}
		},
		legend: {
			right: '3%',
			top: 20,
			itemWidth:11,
			itemHeight:11,
			data: [ '违规单据数'],
			selectedMode:'single'
		},
		grid: {
			top: 54,
			left: '3%',
			right: '3%',
			bottom: '6%',
			containLabel: true
		},
		xAxis: [
			{
				type: 'category',
				axisPointer: {
					type: 'shadow'
				},
				data: ['5W-10W', '10W-15W', '15W-20W', '20W-25W', '25W-30W', '30W-35W'],
				axisLabel: {
					textStyle: {
						color: '#333333'
					},
					rotate: 0,//-30度角倾斜显示
					interval:0 
				},
				axisLine:{
					lineStyle:{
						color:'#dedede'}
				}
			}
		],
		yAxis: [
			{
				type: 'value',
				name: '单据数',
				boundaryGap: [0, 0.01],

				axisLine: {show: false},
				axisTick: {show: false },
				splitLine: {
					show: true,
					lineStyle: {
						color:'#dedede'
					}
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
				name: '违规单据数',
				type: 'bar',
				itemStyle: {
					normal: {
						color: '#41afd6',
						barBorderRadius: [80]
					}
				},
				barWidth: 12,
				barGap: 0.1,
				data: [970, 940, 910, 880, 850, 820]
			}
		]
	};
	// 使用刚指定的配置项和数据显示图表。
	myChartBar.setOption(option_bar3);
	// 图例开关的行为只会触发 legendselectchanged 事件
	myChartBar.on('click', function (params) {
		// 获取点击图例的选中状态

		$("#tab-box").css("display", "block");
		linen();

	});
	window.addEventListener("resize", function () {
		myChartBar.resize();
	});
};

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
            data: ['药品费', '检查检验费', '诊疗费', '手术费','耗材费']
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
                    {value: 4285.8, name: '耗材费', itemStyle: {normal: {color: '#4cb5e3'}}}
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
</script>

</body>
</html>