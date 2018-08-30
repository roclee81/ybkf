<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/global.jsp" %>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
 <script src="${path }/static/js/jquery.easyui.min.js"></script>
  <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>决策分析-审核违规</title>
    <style>
        .float-right {
            float: right;
        }

        .gauge-div {
            margin-left: 8px;
        }
        </style>
</head>
<script type="text/javascript">
$(function() {
	setYearMonth();
	 $('#depart').combobox({   
			url:'${path}/department/getDepartmentOfUser2',
		     valueField:'ksbm',   
		     textField:'ksmc',
		 
		     onLoadSuccess: function () { 
		    	 var val = $(this).combobox('getData');  
		         for (var item in val[0]) 
		         {  
		             if (item == 'ksbm') 
		             {  
		                 $(this).combobox('select', val[0][item]); 	
		                 department = val[0][item];
		             }  
		         }	 
		         searchdata() ;
		     }
		     
		 });
	
});

function wgdepartOrder() {
	
	$.ajax({
		type: "POST",
		url:"${path }/costStruct/selectEcharsData?methodFlag=wgdepartOrder",    			
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:$('#dataForm').serialize(),	
		success:function(data){			
			if(JSON.stringify(data) == "{}"){
				optionBar1.xAxis[0].data=[];
		 	   optionBar1.series[0].data=[0];
		 	  optionBar1.series[1].data=[0];	 	
		 	 myChartBar1.setOption(optionBar1);	    		
	 	    	}else{
	 	    		
  		 var wgdjs = data.wgdepartOrder_value0;
	 	    		 var wgje = data.wgdepartOrder_value1;
	 	    		var ksmc = data.wgdepartOrder_value2;
	 	    		optionBar1.xAxis[0].data=ksmc;
	 	    		optionBar1.series[0].data=wgje;
	 	    		optionBar1.series[1].data=wgdjs;
	 	    		myChartBar1.setOption(optionBar1);
	 	    	}
		}
	
	});
	
	
}
function wggzOrder() {
	
	$.ajax({
		type: "POST",
		url:"${path }/costStruct/selectEcharsData?methodFlag=wggzOrder",    			
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:$('#dataForm').serialize(),	
		success:function(data){
			if(JSON.stringify(data) == "{}"){
				optionBar2.xAxis[0].data=[];
			 	   optionBar2.series[0].data=[0];
			 	  optionBar2.series[1].data=[0];	 	
			 	 myChartBar2.setOption(optionBar2);	    		
		 	    	}else{
	  		 var wgdjs = data.wggzOrder_value0;
		 	    		 var wgje = data.wggzOrder_value1;
		 	    		var ksmc = data.wggzOrder_value2;
		 	    		optionBar2.xAxis[0].data=ksmc;
		 	    		optionBar2.series[0].data=wgje;
		 	    		optionBar2.series[1].data=wgdjs;
		 	    		 myChartBar2.setOption(optionBar2);
		 	    	}		
		}
	
	});
	
	
}
function  getmgDoctorDataGrid() {
	   var syear=$('#syear').val();
	   var smonth=$('#smonth').val();
	   var cblxbm=$('#cblxbm').val();
	   		var ksbm=$("#depart").combobox('getValue');

	   		mgDoctorDataGrid = $('#mgDoctorDataGrid').datagrid({
     url : '${path }/costStruct/SelectCostStruct?methodFlag=mgDoctorDataGrid',
     fit : true,
     striped : true,
     queryParams: {          
     	syear: syear,
     	smonth: smonth,
     	cblxbm:cblxbm,   
     	ksbm:ksbm
       }    ,
    // rownumbers : true,
     pagination : true,
    singleSelect : true,
   //  idField : 'id',
     sortName : 'wgje',
     sortOrder : 'asc',
     pageSize : 10,
     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
     columns : [ [/*  {
     	field:'ck',
     	checkbox : true,
     	 width : ''
      }, */ {
         width : '15%',
         title : '科室名称',
         field : 'KSMC'
     
     },{
         width : '15%',
         title : '工号',
         field : 'YSGH'
   
     },  {
         width : '15%',
         title : '医师',
         field : 'YSXM',
    
     }, {
         width : '15%',
         title : '单据数量',
         field : 'WGDJS',
     
     },{
         width : '15%',
         title : '患者人数',
         field : 'HZRS',
         formatter: function (value, rowData, rowIndex) {
                     
       
             return "<a style='color:green' href='javacript:;' onclick=getpatient('" + rowIndex + "');>" + value + "</a>";
         }
     }, 
     {
         width : '15%',
         title : '单据金额',
         field : 'DJJE',
      
     },{
         width : '12%',
         title : '违规金额',
         field : 'WGJE',
    
     }
     
     
     ] ],
     onBeforeLoad: function (param) {
     	updateDatagridHeader(this);        	
     	
     }
 
 });
	
}

function getpatient(rowIndex) {
	 $("#box-ys").css({display: 'block'});
	var patientTable=$("#mgDoctorDataGrid").datagrid("getRows");
	var ysgh=patientTable[rowIndex]['YSGH'];
	 var syear=$('#syear').val();
	   var smonth=$('#smonth').val();
	   var cblxbm=$('#cblxbm').val();
	   		var ksbm=$("#depart").combobox('getValue');

	   		mgpatientDataGrid = $('#mgpatientDataGrid').datagrid({
   url : '${path }/costStruct/SelectCostStruct?methodFlag=mgpatientDataGrid',
   fit : true,
   striped : true,
   queryParams: {          
   	syear: syear,
   	smonth: smonth,
   	cblxbm:cblxbm,
  ysgh:ysgh,
   	ksbm:ksbm
     }    ,
  // rownumbers : true,
   pagination : true,
  singleSelect : true,
 //  idField : 'id',
   sortName : 'wgje',
   sortOrder : 'asc',
   pageSize : 10,
   pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
   columns : [ [/*  {
   	field:'ck',
   	checkbox : true,
   	 width : ''
    }, */ {
       width : '15%',
       title : '身份证号',
       field : 'SFZHM'
   
   },{
       width : '15%',
       title : '姓名',
       field : 'XM'
 
   },  {
       width : '15%',
       title : '性别',
       field : 'XB',
  
   },{
       width : '15%',
       title : '年龄',
       field : 'NL',
      
   }, 
   {
       width : '15%',
       title : '门规病种类型',
       field : 'BZMC',
    
   },{
       width : '12%',
       title : '就诊时间',
       field : 'JZSJ',
  
   }, {
       width : '15%',
       title : '结算日期',
       field : 'JSRQ',
   
   }, {
       width : '15%',
       title : '违规金额',
       field : 'WGJE',
   
   }
   
   
   ] ],
   onBeforeLoad: function (param) {
   	updateDatagridHeader(this);        	
   	
   }

});
	
}
function setYearMonth()
{
	var date=new Date;
	year=date.getFullYear();
	for(var i=0;i<4;i++) 
	{
		var temp = year-i;
		$('#syear').append("<option value='"+temp+"'>"+temp+"</option>");
	}
	
	month=date.getMonth()+1
	month=month<10?"0"+month:String(month);
	$("#smonth").val(month);

}

function searchdata() {
	getmgDoctorDataGrid();
	wggzOrder() ;
	wgdepartOrder();
}
</script>
<body>
<div class="header-div bg-color"> 
     <form id="dataForm">
    <table class="ys-table tiaojian margin-left20" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
                年度
            </td>
            <td>
                <select id="syear" name="syear">
                    

                </select>
            </td>
            <td class="td-width fs_16">
                月份
            </td>
            <td style="width: 44px">
                <select style="width: 44px" id="smonth" name="smonth" >
                    <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                </select>
            </td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
              
             <input  type="text"  id="depart"  name="ksbm"  style="width: 120px" class=" easyui-validatebox xd-nm"        />

          
            </td>
            <td class="td-width fs_16">
                参保类型
            </td>
            <td>
                <select  name="cblxbm" style="width: 78px;">
                    <option value="0">全部</option>
                    <option value="1">城镇职工</option>
                    <option value="2">城乡居民</option>
                </select>
            </td>
            <td class="td-width"></td>
            <td>
                <input type="button" class="btn btn-primary" onclick="searchdata()" value="查询" ><img src="${path }/static/img/menu/search.png">
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
    </form>
</div>
<!--柱状图-->
<div class="tab-div-box bg-color header-div">

    <div class="gauge-div float bg-color" style="height: 290px">
        <div class="gauge-title-div border-bom">
            <table class="body-width">
                <tr>
                    <td class="left "><label class="radius"></label>违规科室排序</td>
                    <td class="right ">
                        <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                    </td>
                </tr>
            </table>
        </div>
        <div id="bar1" class="body-width" style="height: 260px;padding-top:10px;">

        </div>
    </div>
    <div class="gauge-div float bg-color" style="height: 290px;">
        <div class="gauge-title-div border-bom">
            <table class="body-width">
                <tr>
                    <td class="left "><label class="radius"></label>违规规则排序</td>
                    <td class="right ">
                        <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                    </td>
                </tr>
            </table>
        </div>
        <div id="bar2" class="body-width" style="height: 260px;padding-top:10px;">

        </div>
    </div>
    <div class="clear"></div>

</div>
<!--表格数据-->
<div class="clear"></div>
<div class="tab-div-box bg-color">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb1" style="height:270px">
                <div class="gauge-title-div border-bom">
                    <table id="btn-table" class=" float-right">
                        <tr>
                            <td>
                                <button class="btn btn-success margin-right10"><img src="${path }/static/img/menu/btn1-icon.png">导出
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="body-width padding10">
                    <div class="ys-rc-div" style="height: 220px;width: auto;">
                        <table class="zy-table body-width common-table"  id="mgDoctorDataGrid" style="width: 100%">
                    
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="tab-div-box bg-color margin-bottom20" id="box-ys" style="display:none">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb1" style="height:270px">
                <div class="gauge-title-div border-bom">
                    <table class="body-width">
                        <tr>
                            <td class="left"><label class="radius"></label>违规患者信息</td>
                            <td>
                                <button class="btn btn-success margin-right10 float-right"><img
                                        src="${path }/static/img/menu/btn1-icon.png">导出
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="body-width padding10" >
                    <div class="ys-rc-div" style="height: 220px;width: auto;">
                        <table class="zy-table body-width common-table" id="mgpatientDataGrid" style="width: 100%">
                        
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script>

    /*表头筛选条件输入*/
    $(function () {
        $(".sf-msg-table th").click(function () {
            $(this).parent().next().toggle();
        });

        /* 违规患者信息 */
        $("#E_xh a").click(function () {
            $("#box-ys").css({display: 'block'});
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
            right: 10,
            top: 0,
            data: ['按违规金额', '按违规单据数']
        },
        grid: {
            top: 54,
            left: '2%',
            right: '2%',
            bottom: '17%',
            containLabel: true,
            y2: 140
        },
        xAxis: [
            {
                type: 'category',
                axisPointer: {
                    type: 'shadow'
                },
                data: [/* '神经内科', '肾内科', '儿科', '妇产科', '耳鼻喉科', '心内科' */],
                axisLabel:{
                    interval:0,//横轴信息全部显示
                    rotate:30//-30度角倾斜显示
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '金额(元)',
                boundaryGap: [0.2, 0.2],
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                }
            },
            {
                type: 'value',
                name: '人次',
                boundaryGap: [0.2, 0.2],
                axisLine: {
                    lineStyle: {
                        width: 0
                    }
                },
                axisTick: {
                    show: false
                },
                splitLine: {
                    show: false
                }
            }
        ],
        series: [
            {
                name: '按违规金额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#799ee2'
                    }
                },
                barWidth: 20,
                data: []
            },
            {
                name: '按违规单据数',
                type: 'bar',
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: '#e27983'
                    }
                },
                barWidth: 20,
                barGap: 0.1,
                data: []
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
            right: 10,
            top: 0,
            data: ['按违规金额', '按违规单据数']
        },
        grid: {
            top: 54,
            left: '2%',
            right: '2%',
            bottom: '17%',
            containLabel: true,
            y2: 140
        },
        xAxis: [
            {
                type: 'category',
                axisPointer: {
                    type: 'shadow'
                },
                data: [/* '超适应症用药', '限性别', '限儿童', '限就医方式', '重复收费', '限定性别' */],
                axisLabel:{
                    interval:0,//横轴信息全部显示
                    rotate:30//-30度角倾斜显示
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '金额(元)',
                boundaryGap: [0, 0.01],
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                }
            },
            {
                type: 'value',
                name: '人次',
                boundaryGap: [0, 0.01],
                axisLine: {
                    lineStyle: {
                        width: 0
                    }
                },
                axisTick: {
                    show: false
                },
                splitLine: {
                    show: false
                }
            }
        ],
        series: [
            {
                name: '按违规金额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#799ee2'
                    }
                },
                barWidth: 20,
                data: []
            },
            {
                name: '按违规单据数',
                type: 'bar',
                yAxisIndex: 1,
                itemStyle: {
                    normal: {
                        color: '#e27983'
                    }
                },
                barWidth: 20,
                barGap: 0.1,
                data: []
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    myChartBar2.setOption(optionBar2);

    window.addEventListener("resize", function () {
        myChartBar1.resize();
        myChartBar2.resize();
    });

    $("a,button").focus(function () {
        this.blur()
    });
</script>
</html>