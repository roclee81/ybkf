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
            width: 183px;
        }
    </style>
</head>
<body>
<!--筛选条件-->
<div class="body-width fs_18 bold header-color">检查检验分析</div>
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

<!--检查检验-->
<div class="body-width margin-top10 margin-bottom20">
    <!--筛选条件-->
    <table class="sx-dj1">
        <tr>
            <td class="fs_16">检查检验类别名称</td>
            <td>
                <select id='projectType' onchange="getProjectItem($(this).val())">

                </select>
            </td>
            <td class="fs_16">项目名称</td>
            <td>
                <select id='projectItem' onchange="searchAll()">
                </select>
            </td>
            <td>
                <button class="xy-button fs_16 xy-btn-bg xy-btn-active xy-btn-select">检查检验指标月度变化趋势</button>
                <button class="xy-button fs_16 xy-btn-bg margin-left10">科室项目分布</button>
            </td>
        </tr>
    </table>
    <div class="tab_box">
        <!--检查检验—折线图1-->
        <div class="line1">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line3">

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
        <!--检查检验—折线图2-->
        <div class="line2">
            <div class="body-width fy-line-div">
                <div class="fy-bar-div" id="line4">

                </div>
            </div>
            <!--表格数据-->
            <div class="clear"></div>
            <div class="ks-fy-line-div border-val margin-top10" style="overflow-x: auto">
                <table class="td-line body-width sf-msg-table">
                    <tbody>
                    <!-- yyy -->
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
                        <td>7654</td>
                        <td>6453</td>
                        <td>35134</td>
                        <td>4357</td>
                        <td>5467</td>
                    </tr>
                    <tr id='departPersonF'>
                        <td id='departPerson'>人次</td>
                        <td>1796</td>
                        <td>1452</td>
                        <td>1312</td>
                        <td>1813</td>
                        <td>1472</td>
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
            if(index==1){
            
            	getLineGroupByDepartment($('#depart').combobox('getValue'), $('#projectItem').val(), $('#selectYear').val(), $('#selectMonth').val());
            }
            if(index==0){
            	
            	loadTendencyByCondition($('#depart').combobox('getValue')
            			,$('#projectItem').val()
            			,$('#selectYear').val(),$('#selectMonth').val());
            }
        }
    });

    // 检查检验-折线图1
    var myChartLine3 = echarts.init(document.getElementById('line3'));
    // 指定图表的配置项和数据
    optionLine3 = {
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
                data:[]
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
                data:[]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartLine3.setOption(optionLine3);
    window.onresize = myChartLine3.resize;

    // 检查检验-折线图2
    var myChartLine4 = echarts.init(document.getElementById('line4'));
    // 指定图表的配置项和数据
    optionLine4 = {
        title : {
            text: '科室项目分布',
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
    myChartLine4.setOption(optionLine4);
    window.onresize = myChartLine4.resize;
/* 
    function line1() {
    	myChartLine3 = echarts.init(document.getElementById('line3'));
    	    // 指定图表的配置项和数据
    	    optionLine3 = {
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
    	                data:[]
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
    	                data:[]
    	            }
    	        ]
    	    };
    	    // 使用刚指定的配置项和数据显示图表。
    	    myChartLine3.setOption(optionLine3);
    	    window.onresize = myChartLine3.resize;
	}
    
    function line2() {
       myChartLine4 = echarts.init(document.getElementById('line4'));
        // 指定图表的配置项和数据
        optionLine4 = {
            title : {
                text: '科室项目分布',
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
        myChartLine4.setOption(optionLine4);
        window.onresize = myChartLine4.resize;	
	} */
    
    $("a,button").focus(function(){this.blur()});
    
    
    
    
    function getProject(typename){
    	$.ajax({
    		url:'${path}/chargeCheck/selectProject',
    		success:function(data){
    			data=JSON.parse(data);
				$('#projectType').empty();
    			for(var dg=0;dg<data.length;dg++){
    				$('#projectType').append("<option value='"+data[dg].FYLBMC2+"'>"+data[dg].FYLBMC2+"</option>");
    			}
    			//一开始选择项为空
    		    document.getElementById("projectType").selectedIndex = -1; 
    		}
    	});
    }
    
    function getProjectItem(ptype){
    	$.ajax({
    		url:'${path}/chargeCheck/selectProjectByType',
    		data:{
    			typename:ptype
    		},
    		success:function(data){
    			data=JSON.parse(data);
				$('#projectItem').empty();
    			for(var pi=0;pi<data.length;pi++){
    				$('#projectItem').append("<option value='"+data[pi].XMBM+"'>"+data[pi].XMMC+"</option>");
    			}
    			//一开始选择项为空
    		    document.getElementById("projectItem").selectedIndex = -1; 
    		}
    	});
    }
    function loadTendencyByCondition(department,projectCode,syear,smonth ){
  	   $.post('${path }/costStruct/selectEcharsData', {
  		    syear:year,
  		    smonth:smonth,
  		  	projectCode:projectCode,
   			department:department,
  			methodFlag:'getJCJYLineByCondition'
  		}, function(result) {
				if(result.getJCJYLineByCondition_value2){
					optionLine3.series[0].data=result.getJCJYLineByCondition_value2;
	  	  			optionLine3.series[1].data=result.getJCJYLineByCondition_value3;
	  	  			myChartLine3.setOption(optionLine3);
	  		 			$($('#monthMoney').siblings('td')).empty();
	  					$($('#monthPerson').siblings('td')).empty();
	  					if(result.getJCJYLineByCondition_value2){
	  						for(var mm=0;mm<$('#monthMoney').siblings('td').length;mm++){
	  		  	  				$($('#monthMoney').siblings('td')[mm]).html(result.getJCJYLineByCondition_value2[mm]);
	  		  	  				$($('#monthPerson').siblings('td')[mm]).html(result.getJCJYLineByCondition_value3[mm]);
	  		  	  			}
	  					}
				}
  				
  	  			
  			
  			
 			//myChartLine1 = echarts.init(document.getElementById('line1'));
 		    //myChartLine1.setOption(optionLine1);  
  		}, 'JSON');
    }
    
    function getLineGroupByDepartment(department,projectCode,syear,smonth){
    	
  	   $.post('${path }/costStruct/selectEcharsData', {
  		 	syear:syear,
  		 	projectCode:projectCode,
   			smonth:smonth,
   			department:department,
  			methodFlag:'getJYJCByDepart'
  		}, function(result) {

  				optionLine4.xAxis[0].data=result.getJYJCByDepart_value1;
  	  			optionLine4.series[0].data=result.getJYJCByDepart_value2;
  	  			optionLine4.series[1].data=result.getJYJCByDepart_value3;
  	  			myChartLine4.setOption(optionLine4);
  	  			$('#monthDepart').siblings('th').remove();
	  	  			$('#departMoney').siblings('td').remove();
  	  	  			$('#departPerson').siblings('td').remove();
  	  			if(result.getJYJCByDepart_value1){
  	  	  			for(var de=0;de<result.getJYJCByDepart_value1.length;de++){
  	  	  				$('#monthDepartF').append("<th>"+result.getJYJCByDepart_value1[de]+"</th>");
  	  	  			}

  	  	  			for(var mm=0;mm<result.getJYJCByDepart_value1.length;mm++){
  	  	  				//alert($('#departMoney').siblings('td').length);
  	  	  				$('#departMoneyF').append("<td>"+result.getJYJCByDepart_value2[mm]+"</td>")
  	  	  				$('#departPersonF').append("<td>"+result.getJYJCByDepart_value3[mm]+"</td>")
  	  	  			}
  	  			}

	  			myChartLine4 = echarts.init(document.getElementById('line4'));
  	  		    myChartLine4.setOption(optionLine4);
  		}, 'JSON');
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
    
    $(function (){
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
    	};
    	var date=new Date;
    	var month=date.getMonth()+1
    	month=month<10?"0"+month:String(month);
    	$("#selectMonth").val(month);
    	
    	getProject();
    	searchAll();
    })
    function searchAll(){
    	loadTendencyByCondition($('#depart').combobox('getValue')
    			,$('#projectItem').val()
    			,$('#selectYear').val(),$('#selectMonth').val());
    	getLineGroupByDepartment($('#depart').combobox('getValue'), $('#projectItem').val(), $('#selectYear').val(), $('#selectMonth').val());
    }
</script>
</body>
</html>