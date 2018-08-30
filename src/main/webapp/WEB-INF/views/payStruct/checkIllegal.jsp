<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>决策分析-审核违规</title>

    <style>
        .fw-target-div{
            background: none;
        }
        .ks-fy-line-div{
            margin-top: 20px;
        }
         .panel-body{
        	padding: 0px;
        }
    </style>
</head>
<body>
    <div class="body-width fs_18 bold header-color">审核违规</div>
    <div class="header-div bg-color1  border-lef border-rgt">
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
                </select>
            </td>
                <td class="td-width fs_16">
                    科室
                </td>
                <td>
                  <input id="depart"  class="easyui-combobox"  style="width:100px;">
                </td>
                <td class="td-width fs_16">
                    参保类型
                </td>
                <td>
                    <select id='mitype' style="width: 78px;">
                        <option value="390">城乡居民</option>
                        <option value="391">城镇职工</option>
                    </select>
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
    <!--柱状图-->
    <div class="body-width margin-top20">
        <div class="fw-target-div" style="height: 290px">
            <div class="jc-sh-wg-bar fs_16">
                违规科室排序
            </div>
            <div id="bar1" class="body-width" style="height: 260px">

            </div>
        </div>
        <div class="fw-target-div" style="height: 290px">
            <div class="jc-sh-wg-bar fs_16">
                违规规则排序
            </div>
            <div id="bar2" class="body-width" style="height: 260px">

            </div>
        </div>
    </div>

    <!--表格数据-->
    <div class="clear"></div>
    <div class="ks-fy-line-div border-val" style="height: 235px;margin-bottom: 0px;border: 0px;overflow: hidden;">
      	<table id='dgFirst'>
			<!-- yyy -->
        </table>
    </div>
	<div class="half-body-width fs_16 bold padding-top">违规患者信息</div>
    <div class="border-val margin-bottom20" style="height: 245px;margin-bottom: 0px;border: 0px;overflow: hidden;">
        <table id='dgSecond' class="td-line body-width sf-msg-table">
            
        </table>
    </div>
</body>
<script>
    /*表头筛选条件输入*/
    $(function () {
        $(".sf-msg-table th").click(function () {
            $(this).parent().next().toggle();
        });
    });
    // 柱状图1
    var myChartBar1 = echarts.init(document.getElementById('bar1'));
    // 指定图表的配置项和数据
    optionBar1 = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            right:10,
            top:0,
            data: ['按违规金额', '按违规单据数']
        },
        grid: {
            top:54,
            left: '2%',
            right: '2%',
            bottom: '10%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                nameRotate:50,
                axisPointer: {
                    type: 'shadow'
                },
                data:['神经内科','肾内科','儿科','妇产科','耳鼻喉科','心内科']
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
                name:'按违规金额',
                type:'bar',
                itemStyle:{
                    normal:{
                        color:'#037FF4'
                    }
                },
                barWidth:20,
                data:[5010, 4600, 4000, 3400,2800,2020]
            },
            {
                name:'按违规单据数',
                type:'bar',
                yAxisIndex: 1,
                itemStyle:{
                    normal:{
                        color:'#FA5654'
                    }
                },
                barWidth:20,
                barGap:0.1,
                data:[200,170, 230,140,200,88]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartBar1.setOption(optionBar1);

    // 柱状图2
    var myChartBar2 = echarts.init(document.getElementById('bar2'));
    // 指定图表的配置项和数据
    optionBar2 = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            right:10,
            top:0,
            data: ['按违规金额', '按违规单据数']
        },
        grid: {
            top:54,
            left: '2%',
            right: '2%',
            bottom: '10%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                nameRotate:50,
                axisPointer: {
                    type: 'shadow'
                },
                data:['超适应症用药','限性别','限儿童','限就医方式','重复收费','限定性别']
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
                name:'按违规金额',
                type:'bar',
                itemStyle:{
                    normal:{
                        color:'#037FF4'
                    }
                },
                barWidth:20,
                data:[2010, 600, 940, 590,780,520]
            },
            {
                name:'按违规单据数',
                type:'bar',
                yAxisIndex: 1,
                itemStyle:{
                    normal:{
                        color:'#FA5654'
                    }
                },
                barWidth:20,
                barGap:0.1,
                data:[50,17,23,14,15,18]
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartBar2.setOption(optionBar2);

    $("a,button").focus(function(){this.blur()});
    
    
    
    function getSHWGGroupByDepart(syear,smonth,mitype,department){
  	   $.post('${path }/costStruct/selectEcharsData', {
		    syear:syear,
		    mitype:mitype,
 			smonth:smonth,
 			department:department,
			methodFlag:'getSHWGGroupByDepart'
		}, function(result) {
			optionBar1.xAxis[0].data=result.getSHWGGroupByDepart_value0.slice(0,5);
 			
			optionBar1.series[0].data=result.getSHWGGroupByDepart_value1.slice(0,5);
			optionBar1.series[1].data=result.getSHWGGroupByDepart_value2.slice(0,5);
			myChartBar1.setOption(optionBar1);
		}, 'JSON');
    }
    function getSHWGGroupByRule(syear,smonth,mitype,department){
   	   $.post('${path }/costStruct/selectEcharsData', {
 		    syear:syear,
 		    mitype:mitype,
  			smonth:smonth,
  			department:department,
 			methodFlag:'getSHWGGroupByRule'
 		}, function(result) {
 			optionBar2.xAxis[0].data=result.getSHWGGroupByRule_value0.slice(0,5);
  			
 			optionBar2.series[0].data=result.getSHWGGroupByRule_value1.slice(0,5);
 			optionBar2.series[1].data=result.getSHWGGroupByRule_value2.slice(0,5);
 			myChartBar2.setOption(optionBar2);
 		}, 'JSON');
     }
    function loadgrid1(syear,smonth,mitype,department){
    	$('#dgFirst').datagrid({
    		 url : '${path }/costStruct/SelectCostStruct',
    		 queryParams : {
   	 		    syear:syear,
   	 		    mitype:mitype,
   	  			smonth:smonth,
   	  			department:department,
	     	 	methodFlag:'getSHWGGridByDepart'
    		 },
    		singleSelect:true,
           fit : true,
           striped : true,
           pagination : true,
           nowrap : false,
           pageSize : 5,
           pageList : [ 5 ],
           columns : [ [
        	    {
                   width : '200',
                   title : '科室',
                   field : 'KSMC'
                },{
                	width : '150',
                    title : '工号',
                    field : 'YSGH'
                },{
                	width : '140',
                    title : '医师',
                    field : 'YSXM'
                },{
                	width : '140',
                    title : '单据数量',
                    field : 'DJSL'
                },{
                	width : '155',
                    title : '患者人数',
                    field : 'HZRS'
                },{
                	width : '150',
                    title : '单据金额',
                    field : 'DJJE'
                },{
                	width : '150',
                    title : '违规金额',
                    field : 'WGJE'
                }
           ]],
           onBeforeLoad: function (param) {
                updateDatagridHeader(this);
            	 updateDatagridPager(this);
            	 changeRowHeader(this);
           },
           onClickRow:function (index,row){
        	   loadgrid2($('#selectYear').val(),$('#selectMonth').val(), row.YSGH, $('#depart').combobox('getValue'));
           }
    	});
    }
    
    function loadgrid2(syear,smonth,ysgh,department){
    	$('#dgSecond').datagrid({
    		 url : '${path }/costStruct/SelectCostStruct',
    		 queryParams : {
    			 ldate:syear+""+smonth,
    			 hdate:syear+""+gethdate(smonth),
   	  			department:department,
   	  			docname:ysgh,
	     	 	methodFlag:'getSHWGGridByDoctor'
    		 },
    		singleSelect:true,
           fit : true,
           striped : true,
           pagination : true,
           nowrap : false,
           pageSize : 5,
           pageList : [ 5 ],
           columns : [ [
        	    {
                   width : '100',
                   title : '医保卡号',
                   field : 'YBKH'
                },{
                	width : '100',
                    title : '姓名',
                    field : 'XM'
                },{
                	width : '100',
                    title : '性别',
                    field : 'XB'
                },{
                	width : '100',
                    title : '年龄',
                    field : 'NL'
                },{
                	width : '120',
                    title : '入院日期',
                    field : 'RYRQ'
                },{
                	width : '120',
                    title : '出院日期',
                    field : 'CYRQ'
                },{
                	width : '120',
                    title : '结算日期',
                    field : 'JSRQ'
                },{
                	width : '120',
                    title : '入院诊断',
                    field : 'RYZD'
                },{
                	width : '105',
                    title : '出院诊断',
                    field : 'CYZD'
                },{
                	width : '100',
                    title : '违规金额',
                    field : 'WGJE'
                }
           ]],
           onBeforeLoad: function (param) {
                updateDatagridHeader(this);
            	 updateDatagridPager(this);
            	 changeRowHeader(this);
           }
    	});
    } 
    
    function gethdate(smonth){
    	var j= parseInt(smonth);
    	if(j>=10){
    		return j+1;
    	}else{
    		return '0'+(j+1);
    	}
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
		    	getSHWGGroupByDepart($('#selectYear').val(),$('#selectMonth').val(),$('#mitype').val(),$('#depart').combobox('getValue'));
		    	getSHWGGroupByRule($('#selectYear').val(),$('#selectMonth').val(),$('#mitype').val(),$('#depart').combobox('getValue'));
		    	loadgrid1($('#selectYear').val(),$('#selectMonth').val(),$('#mitype').val(),$('#depart').combobox('getValue'));
			}
		});
    })
    
    function searchAll(){
    	getSHWGGroupByDepart($('#selectYear').val(),$('#selectMonth').val(),$('#mitype').val(),$('#depart').combobox('getValue'));
    	getSHWGGroupByRule($('#selectYear').val(),$('#selectMonth').val(),$('#mitype').val(),$('#depart').combobox('getValue'));
    	loadgrid1($('#selectYear').val(),$('#selectMonth').val(),$('#mitype').val(),$('#depart').combobox('getValue'));
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
</script>
</html>