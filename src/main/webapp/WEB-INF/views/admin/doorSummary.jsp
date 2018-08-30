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
    <link href="${path }/static/css/common.css" rel="stylesheet">
     <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>门规汇总</title>

    <style>
        .sf-msg-table th {
            border-top: none !important;
        }

        label {
            font-weight: 500 !important;
            height: 100%
        }

        .see-dot-msg-table td {
            width: 8%
        }

        .jb-ul-li li:nth-child(6) {
            width: 14%
        }

        .jb-ul-li li:nth-child(4) {
            width: 15.995%
        }

        p {
            margin: 0 !important;
        }

        .main-div {
            min-height:88.5%
        }

        select {
            width: auto !important;
        }
        .ys-table tbody tr >td{
            width: 5% !important;
        }
       /* .gauge-div{margin-top: 0!important;border-top: none !important;}*/
	.tab-div-box{ position:relative; overflow:hidden}
	.tab-menu{position:absolute; width:100%; z-index:90; background-color:#fff;}
	#F1{position:absolute; width:100%; top:40px;padding-bottom: 48px}
    </style>
</head>
<script type="text/javascript">
$(function() {
$('#depart').combobox({   
	url:'${path}/department/getDepartmentOfUser2',
     valueField:'ksbm',   
     textField:'ksmc',
     onChange: function (newValue, oldValue) {  
         updateDoctor() ;       
      }  ,
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
       
     }
     
 });
$('#mgjblx').combobox({   
	url:'${path}/mglimit/getbzmcbyfl',
     valueField:'bzxh',   
     textField:'bzmc',
     onChange: function (newValue, oldValue) {  
         updateDoctor() ;       
      }  ,
     onLoadSuccess: function () { 
    	 var val = $(this).combobox('getData');  
         for (var item in val[0]) 
         {  
             if (item == 'bzxh') 
             {  
                 $(this).combobox('select', val[0][item]); 	
                 department = val[0][item];
             }  
         }	 
       
     }
     
 });

});
function updateDoctor() {
	var ksbm=$("#depart").combobox('getValue');
if(ksbm!=null&&ksbm!=''){
	$('#doctor').combobox({   
		url:'${path}/department/getdoctorByksbm?ksbm='+ksbm,
	     valueField:'gh',   
	     textField:'xm',	
	     onLoadSuccess: function () { 
	    	 var val = $(this).combobox('getData');  
	         for (var item in val[0]) 
	         {  
	             if (item == 'gh') 
	             {  
	                 $(this).combobox('select', val[0][item]); 	
	                 department = val[0][item];
	             }  
	         }	 
	         getmgquotaDataGrid();
	     }
	     
	 });
}
	

}
function getmgquotaDataGrid() {
	   var syearmonth=$('#syearmonth').val();
	   var cblxbm=$('#cblxbm').val();
	   		var ksbm=$("#depart").combobox('getValue');
	   		var ysgh=$("#doctor").combobox('getValue');

	   var bzxh=$("#mgjblx").combobox('getValue');
	   var qybm=$('#qybm').val();
	mgquotaDataGrid = $('#mgquotaDataGrid').datagrid({
        url : '${path }/mgquota/mgquotaDataGrid',
        fit : true,
        striped : true,
        queryParams: {          
        	syearmonth: syearmonth,
        	cblxbm:cblxbm,
        	ysgh:ysgh,
        	bzxh:bzxh,
        	qybm:qybm,
        	ksbm:ksbm
          }    ,
       // rownumbers : true,
        pagination : true,
       singleSelect : true,
      //  idField : 'id',
        sortName : 'bzbm',
        sortOrder : 'asc',
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [/*  {
        	field:'ck',
        	checkbox : true,
        	 width : ''
         }, */ {
            width : '10%',
            title : '门规病种类型',
            field : 'bzmc'
        
        },{
            width : '10%',
            title : '患者例数',
            field : 'hzls'
      
        },  {
            width : '10%',
            title : '就诊人数',
            field : 'jzrs',
       
        }, {
            width : '10%',
            title : '就诊人次',
            field : 'jzrc',
        
        },{
            width : '10%',
            title : '医疗费用',
            field : 'ylf',
           
        }, 
        {
            width : '10%',
            title : '医保统筹支付',
            field : 'ybtczf',
         
        },{
            width : '10%',
            title : '问题单据数',
            field : 'wgdjs',
       
        },{
            width : '10%',
            title : '月度超额人次',
            field : 'ydcerc',
       
        },{
            width : '10%',
            title : '月度超额人数',
            field : 'ydcers',
       
        },{
            width : '10%',
            title : '年度超额人数',
            field : 'ndcers',
       
        },{
            width : '10%',
            title : '次均费用',
            field : 'cjfy',
       
        },{
            width : '10%',
            title : '次均药费',
            field : 'cjyf',
       
        },{
            width : '10%',
            title : '次均检查检验费用',
            field : 'cjjcjyf',
       
        }
        
        
        ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	
        	
        },
        onClickRow:function(index,row){
         
           }
    });
	
}
function departZB() {

	
	$.ajax({
		type: "POST",
		url:"${path }/mgquota/mgquotadepartZB",
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:$('#dataSearchForm').serialize(),	
		success:function(data){		  	
			 $('#jzrc').text("-");
			 $('#ylf').text("-");
			 $('#ybtczf').text("-");
			 $('#wgdjs').text("-");
			 $('#wgje').text("-");
			 $('#hzfd').text("-");
			 $('#cjfy').text("-");
			 $('#cjyf').text("-");
			
			if(data!=""&&JSON.stringify(data) != "{}"){
				var shuju=data[0];
				//alert(data[0].zyrs);
				if(typeof(shuju.jzrc)!='undefined'){
					
			    $('#jzrc').html(shuju.jzrc);
				}
				if(typeof(shuju.ylf)!='undefined'){
			    $('#ylf').html(shuju.ylf);
				}
				if(typeof(shuju.ybtczf)!='undefined'){
			    $('#ybtczf').html(shuju.ybtczf);
				}
				if(typeof(shuju.wgdjs)!='undefined'){
			    $('#wgdjs').html(shuju.wgdjs);
				}
				if(typeof(shuju.wgje)!='undefined'){
			    $('#wgje').html(shuju.wgje);
				}
				if(typeof(shuju.hzfd)!='undefined'){
			    $('#hzfd').html(shuju.hzfd);
				} 
				if(typeof(shuju.cjfy)!='undefined'){
			    $('#cjfy').html(shuju.cjyf);
				} 
				if(typeof(shuju.cjyf)!='undefined'){
			    $('#cjyf').html(shuju.cjyf);
				} 
				
			}
		}
		
	});
}


function findmonthcostofMg() {	

	$.ajax({
		type: "POST",
		url:"${path }/costStruct/selectEcharsData?methodFlag=findmonthcostofMg",
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:$('#dataSearchForm').serialize(),	
		success:function(data){
			
	 	   	if(JSON.stringify(data) == "{}"){
	 	   	//option_zy_line.xAxis[0].data=[];
	 	   option_bar1.series[0].data=[0];
	 	  option_bar1.series[1].data=[0];
	 	 option_bar1.series[2].data=[0];
	 	option_bar1.series[3].data=[0];
	 	option_bar1.series[4].data=[0];
	 	option_bar1.series[5].data=[0];
	 	Chart_bar1.setOption(option_bar1);
 	    		
 	    	}else{
 	    		
 	    		 var months = data.costFlagofMonth_value1;
 				 var jzrc = data.costFlagofMonth_value2;
 				 var ydcerc = data.costFlagofMonth_value3;			 
 				 var wgdjs = data.costFlagofMonth_value4;			 
 				 var cjfy = data.costFlagofMonth_value5;			 
 				 var cjyf = data.costFlagofMonth_value6;			 
 				 var cjjcjyf = data.costFlagofMonth_value7;			 
 				 
 				 var jzrc2 = [];
 				 var ydcerc2 =[];			 
 				 var wgdjs2 = [];			 
 				 var  cjfy2 = [];			 
 				 var cjyf2 = [];			 
 				 var cjjcjyf2 =[];			 
 			 	
 				
 				 if(data.costFlagofMonth_value1.length<12) {
 					
 					 var count =12;
 					 var currentDate=new Date;
 					 var currentYear=currentDate.getFullYear();
 					 //如果是本年度只需要显示到当前月份
 					// if(currentYear==$('#syear').val() ) {
 						var currentMonth=currentDate.getMonth()+1;
 						count=currentMonth;
 					// }
 				
 					
 					 if(data.costFlagofMonth_value1.length<count) { 
 						
 						 amount = [];
 						person = [];	
 						 //将缺失的数据的月份补0
 						 for(var i=0;i<count;i++)	 {
 							 tempAmount1=0;
 							 tempAmount2=0;
 							 tempAmount3=0;
 							 tempAmount4=0;
 							 tempAmount5=0;
 							 tempAmount6=0;
 													
 						 	for(var j=0;j<months.length;j++)		{
 					 			var temp = i+1;
 					 			
 					 			if(temp == parseInt(months[j]))	{
 					 			
 					 				tempAmount1=data.costFlagofMonth_value2[j];
 					 				tempAmount2=data.costFlagofMonth_value3[j];
 					 				tempAmount3=data.costFlagofMonth_value4[j];
 					 				tempAmount4=data.costFlagofMonth_value5[j];
 					 				tempAmount5=data.costFlagofMonth_value6[j];
 					 				tempAmount6=data.costFlagofMonth_value7[j];
 					 			//	tempAmount7=data.costFlagofMonth_value8[j]; 	
 					 				
 					 				break;
 				 				}
 					 		
 					 		}
 						 	
 						 	jzrc2[i]=tempAmount1;
 						 	ydcerc2[i]=tempAmount2;
 						 	wgdjs2[i]=tempAmount3;
 						 	cjfy2[i]=tempAmount4;
 						 	cjyf2[i]=tempAmount5;
 						 	cjjcjyf2[i]=tempAmount6;
 						 //	rjclf2[i]=tempAmount7;				
 						 }
 						 var jzrc = jzrc2;
 		 				 var ydcerc =ydcerc2;			 
 		 				 var wgdjs = wgdjs2;			 
 		 				 var cjfy = cjfy2;			 
 		 				 var cjyf = cjyf2;			 
 		 				 var cjjcjyf =cjjcjyf2;			 
 		 			//	 var rjclf = rjclf2;	 
 						 
 					}
 				 }
 				
 				option_bar1.xAxis[0].data=['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'];
 				option_bar1.series[0].data=jzrc;
 				option_bar1.series[1].data=ydcerc;
 				option_bar1.series[2].data=wgdjs;
 				option_zy_line.series[3].data=cjfy;
 				option_bar1.series[4].data=cjyf;
	 	    	option_bar1.series[5].data=cjjcjyf;
	 	    //	option_zy_line.series[6].data=rjclf;	 	    	
	 	    	Chart_bar1.setOption(option_bar1); 	    	
 	    	}
		
		
		}
	})
	
}
function searchbzxeECharts() {
	
	$.ajax({
		type: "POST",
		url:"${path }/costStruct/selectEcharsData?methodFlag=searchbzxeECharts",    			
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:$('#dataSearchForm').serialize(),	
		success:function(data){	
			if(JSON.stringify(data) == "{}"){
			//	option_radar.xAxis[0].data=[];
				option_radar.series[0].data[0].value=[0,0,0,0,0,0];
				option_radar.series[0].data[1].value=[0,0,0,0,0,0];
			Chart_radar.setOption(option_radar);	 
	 	    	}else{
	 	    
	 		 var sjz = data.searchbzxeECharts_value0;
	 	    		var xdz = data.searchbzxeECharts_value1;
	 	    		option_radar.series[0].data[0].value=sjz;
	 	    	option_radar.series[0].data[1].value=xdz;
	 	    	
	 	    		Chart_radar.setOption(option_radar);	
	 	    		  window.addEventListener("resize", function () {
	 	    		        Chart_radar.resize();
	 	    		    });
	 	    	
	 	    	}			
		}
	
	});
	
}
function searchbzrcECharts() {	
	$.ajax({
		type: "POST",
		url:"${path }/costStruct/selectEcharsData?methodFlag=searchbzrcECharts",    			
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:$('#dataSearchForm').serialize(),	
		success:function(data){
			
			if(JSON.stringify(data) == "{}"){				
				option_bar2.xAxis[0].data=[];
				option_bar2.series[0].data=[0];
				Chart_bar2.setOption(option_bar2);	    		
	 	    	}else{
	 		 var jzrc = data.searchbzrcECharts_value0;
	 	    		var wggz = data.searchbzrcECharts_value1;
	 	    		
	 	    		option_bar2.xAxis[0].data=wggz;
	 	    		option_bar2.series[0].data=jzrc;
					Chart_bar2.setOption(option_bar2);	    		
	 	    	}
			
		}
	
	});

}

function serchdata() {
	
	departZB();
	getmgquotaDataGrid();
	searchbzrcECharts();
	searchbzxeECharts();
}
</script>
<body>
<div class="header-div bg-color margin-top6">
<form  id="dataSearchForm" method="post">
    <table class="ys-table tiaojian margin-left20">
        <tbody>
        <tr>
            <td class="fs_16">
                年月
            </td>
            <td>
             <input  name="syearmonth" style="width:120px;height: 30px;" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM'})" readonly="readonly" />
            <!--   <div class="input-group date form_date" style="float: right">
                    <input class="padding-left4" size="7" type="text">
                  <span class="input-group-addon"></span><span class="glyphicon-calendar"></span>
               </div>  -->
            </td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
         
                <input  type="text"  id="depart"  name="ksbm"  style="width: 120px" class=" easyui-validatebox xd-nm"        />
            </td>
            <td class="td-width fs_16">
                医师
            </td>
            <td>
               <!--  <select>
                    <option value="0">全部</option>
                    <option value="1">医师1</option>
                    <option value="2">医师2</option>
                </select> -->
     <input  type="text"  id="doctor"  name="ysgh"  style="width: 120px" class=" easyui-validatebox xd-nm"        />                
           </td>
        </tr>
        <tr>
            <td class="td-width fs_16">参保类型</td>
            <td>
                <select id="cblxbm" name="cblxbm">
                    <option value="0">全部</option>
                    <option value="1">城乡居民</option>
                    <option value="2">城镇职工</option>
                </select>
            </td>
            <td class="td-width fs_16">门规病种类型</td>
            <td>
            
              <input  type="text"  id="mgjblx"  name="bzxh"  style="width: 120px" class=" easyui-validatebox xd-nm"        />
                
            </td>
            <td class="td-width fs_16">审核规则</td>
            <td>
               <select  name="wggz">
                    <option value="0">全部</option>
                    <option value="1">疾病诊断合理性审核</option>
                    <option value="2">非基本医疗保险目录</option>
                    <option value="3">自费项目提醒</option>
                    <option value="4">限医院类型级别</option>
                    <option value="5">限定性别审核</option>
                    <option value="6">门规病种月度总额审核</option>
                </select>
                
            </td>
            <td class="td-width fs_16">区域</td>
            <td>
                <select id="qybm" name="qybm" >
                    <option  value="0">全部</option>
                    <option value="1">高新</option>
                    <option value="2">历城</option>
                    <option value="3">历下</option>
                    <option value="4">商河</option>
                    <option value="5">章丘</option>
                    <option value="6">长清</option>
                </select>
            </td>
            <td>
                <input type="button" value="查询"  onclick="serchdata()"  class="btn btn-primary"><%-- <img src="${path }/static/img/menu/search.png"/>  --%>
                <input  type="button" value="重置" class="btn btn-default"><%-- <img src="${path }/static/img/menu/reset.png"/>  --%>
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
    </form>
</div>
<div class="bg-color main-div">
    <div class="tab-menu border-bom">
        <ul class="padding-left10" id='sd'>
            <li class="fs_16 on" id="sd1">门规关键指标</li>
            <li class="fs_16" id="sd2">门规病种统计</li>
            <li class="fs_16" id="sd3">月度变化趋势</li>
            <li class="fs_16" id="sd4">重点病种</li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="tab-div-box" >
        <!--门规关键指标-->
        <div id="F1">
        <div class="ks-fy-zb">
                <div class="gauge-title-div border-bom">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title"><label class="radius"></label>门规关键指标</td>
                            <td class="right fs_16">
                                <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ScrLts">
                    <table class="body-width">
                        <tr>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao1.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">就诊人次</span><br/>

                                        <p id="jsrc">-</p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao2.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">医疗总费用(元)</span><br/>

                                        <p id="ylf">-</p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao3.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">医保统筹支付(元)</span><br/>

                                        <p id="ybtczf">-</p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao7.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">违规单据数</span><br/>

                                        <p id="wgdjs">-</p>
                                    </div>
                                </li>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao8.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">违规金额(元)</span><br/>

                                        <p id="wgje">-</p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao4.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">患者负担(元)</span><br/>

                                        <p id="hzfd">-</p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao5.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">次均费用（元）</span><br/>

                                        <p id="cjfy">-</p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/bianshi/biao6.png"/></div>
                                    <div class="C_hre">
                                        <span class="nowrap">次均药费（元）</span><br/>

                                        <p id="cjyf">-</p>
                                    </div>
                                </li>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
            </div>
        <!--门规病种统计-->
        <div class="ks-fy-zb">
            <div class="gauge-title-div border-bom">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title"><label class="radius"></label>门规病种统计</td>

                        <td class="right fs_16">
                            <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="yb-jj-div ScrLts">
                <div class="ys-rc-div "  style="height: 120px;width: auto;">
                    <table id="mgquotaDataGrid" class="body-width common-table" id="Ys_div">
                        <tbody>
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <!--月度变化趋势-->
        <div class="line1">
            <div class="main-ys-fy">
                <div class="ks-fy-zb" style="height:auto">
                    <div class="gauge-title-div border-bom">
                        <table class=" float-right" width="100%">
                            <tr>
                                <td class="left "><label class="radius"></label>月度变化趋势</td>
                                <td class="text-right">
                                    <table class="two-table">
                                        <tr>
                                            <td>门规类别</td>
                                            <td>
                                                <select style="padding-right: 20px">
                                                    <option value="0">I类</option>
                                                    <option value="1">II类</option>
                                                    <option value="2">III类</option>
                                                </select>
                                            </td>
                                            <td>门规病种类型</td>
                                            <td>
                                                <select>
                                                    <option value="0">全部</option>
                                                    <option value="1">恶性肿瘤</option>
                                                    <option value="2">尿毒症</option>
                                                    <option value="3">慢性病毒性肝炎</option>
                                                    <option value="4">冠心病</option>
                                                    <option value="5">糖尿病</option>
                                                    <option value="6">高血压</option>
                                                    <option value="7">肾功能衰竭</option>
                                                    <option value="8">帕金森氏病</option>
                                                    <option value="9">白血病</option>
                                                    <option value="10">系统性红斑狼疮</option>
                                                </select>
                                            </td>
                                            <td>
                                                <button class="btn btn-success margin-right10"><img
                                                        src="${path }/static/img/menu/btn1-icon.png">导出
                                                </button>
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                        <div class="clear"></div>
                    </div>

                    <div class="body-width fy-line-div">
                        <div class="fy-bar-div" id="line1">

                        </div>
                    </div>
                    <!--表格数据-->
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!--重点病种 -->
        <div class="margin-top10">
            <div class="yb-jj-div">
                <div class="gauge-div float">
                    <div class="gauge-title-div border-bom">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title"><label class="radius"></label>重点病种就诊人次</td>
                                <td class="right fs_16">
                                    <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="num1">
                        <div id="zy_Gauge1">

                        </div>
                    </div>
                </div>
                <div id="radar" class="gauge-div float" style="margin-left: 2%">
                    <div class="gauge-title-div border-bom">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title"><label class="radius"></label>重点病种限额情况</td>
                                <td class="right fs_16">
                                    <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="num2">
                        <div id="zy_Gauge2">

                        </div>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            </div>
        </div>
    </div>
</div>

<script>
    $(function () {
         var x_data1;
         var bar_data;
        $(document).ready(function(){
             x_data1 = ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'];
             bar_data = [22, 7, 5, 6, 14, 10];
            line();
			bar();
			radar();
			Paxiu();
	
        });

        //选项卡
        $(".tab-menu ul li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
        });

        /* 日期插件*/
        $('.form_date').datetimepicker({
            format:'yyyy-mm',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            weekStart: 1,
            startView: 3,
            minView: 3,
            forceParse: false,
            todayBtn: true//显示今日按钮
        });
//排序
function Paxiu(){
	var h=$("#F1").outerHeight(true);
	$('.tab-div-box').css("height",h);		
	
	$("#sd1").click(function(){
		$('#F1').animate({top:'40px'},500);
		$('.tab-div-box').css("height",h);
    });
	$("#sd2").click(function(){
		$('#F1').animate({top:'-205px'},500);
		var Hg=h-205+'px';
		$('.tab-div-box').css("height",Hg);
    });
	$("#sd3").click(function(){
		$('#F1').animate({top:'-420px'},500);
		var Hg=h-420+'px';
		$('.tab-div-box').css("height",Hg);
    });
	$("#sd4").click(function(){
		$('#F1').animate({top:'-800px'},500);
		var Hg=h-800+'px';
		$('.tab-div-box').animate({height:Hg},500);
    });	
}


        //下来框选项
        $("#switch-select").on({
            "change":function(){
                var index= $('#switch-select option:selected').index();
                if(index==2){
                    $("#radar").hide();
                     x_data1 = ['恶性肿瘤','肾功能衰竭','帕金森氏病','白血病','系统性红斑狼疮'];
                     bar_data = [12, 11, 2, 9, 4, 16];
                }else{
                    $("#radar").show();
                     x_data1 = ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'];
                     bar_data = [22, 7, 5, 6, 14, 10];
                }
                line();
            }
        });
        //柱状图1
        function bar(){
            var Chart_bar1 = echarts.init(document.getElementById('line1'));
            var jz_data = [];
            var yd_data = [];
            var cf_data = [];
            var cy_data = [];
			var jc_data	= [];
            var dj_data = [];
            // 指定图表的配置项和数据
            option_bar1 = {
                 tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        legend: {
            right: '10%',
            top: 20,
            data: ['就诊人次', '月度超额人次','问题单据数','次均费用', '次均药费','检查检验费']
        },
        grid: {
            top: 80,
            left: '2%',
            right: '6%',
            bottom: '2%',
            containLabel: true
        },
        xAxis: [
            {
                type: 'category',
                nameRotate: 50,
                axisPointer: {
                    type: 'shadow'
                },
                data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', ' ']
                
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '单位：元',
                boundaryGap: [0, 0.01],
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                }
            },
            {
                type: 'value',
                name: '单位：人次',
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
                        name: '就诊人次',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#5ea2d7'
                            }
                        },
                        barWidth: 20,
                        data: jz_data
                    },
                    {
                        name: '月度超额人次',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#e8a839'
                            }
                        },
                        barWidth: 20,
                        data: yd_data
                    },
                    {
                        name: '次均费用',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#bb870a'
                            }
                        },
                        barWidth: 20,
                        data: cf_data
                    },
                    {
                        name: '次均药费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#1f83ff'
                            }
                        },
                        barWidth: 20,
                        data: cy_data
                    },
					{
						name: '检查检验费',
						type: 'line',
						yAxisIndex: 1,
						itemStyle: {
							normal: {
								color: '#bd3232'
							}
						},
						barWidth: 20,
						barGap: 0.1,
						data:jc_data
					},
					
                    {
                        name: '问题单据数',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#8ba621'
								}
							},
					barWidth: 20,
					data:dj_data
				}
        ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_bar1.setOption(option_bar1);

            window.addEventListener("resize", function () {
                Chart_bar1.resize();
            });
        };
        /*柱状图2*/
         function line(){ 
            var Chart_bar2 = echarts.init(document.getElementById('zy_Gauge1'));
            // 指定图表的配置项和数据
            option_bar2 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    top: 40,
                    left: '2%',
                    right: '2%',
                    bottom: '16%',
                    containLabel: true,
                    y2: 140
                },
                xAxis: [
                    {
                        type: 'category',
                        nameRotate: 50,
                        axisPointer: {
                            type: 'shadow'
                        },
                        data: ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'],
                        axisLabel: {
                            interval: 0,//横轴信息全部显示
                            rotate: 30//-30度角倾斜显示
                        }
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '单位：人次',
                        boundaryGap: [0, 0.01],
                        splitLine: {
                            lineStyle: {
                                type: 'dashed'
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '人次',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#037FF4'
                            }
                        },
                        barWidth: 20,
                        data: []
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_bar2.setOption(option_bar2);
            window.addEventListener("resize", function () {
                Chart_bar2.resize();
            });
        };
        /*雷达图*/
        function radar(){
            var Chart_radar = echarts.init(document.getElementById('zy_Gauge2'));
            option_radar = {
                title: {
                    text: '单位：元',
                    right:'15%',
                    top:20,
                    textStyle: {
                        fontSize: 14,
                        fontWeight: 500
                    }
                },
                legend: {
                    top:'5%',
                    left:'2%',
                    data: ['实际值','限定值']
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                radar: {
                    // shape: 'circle',
                    name: {
                        textStyle: {
                            color: '#000'
                        }
                    },
                    indicator: [
                        { name: '恶性肿瘤', max: 4000},
                        { name: '尿毒症', max: 5000},
                        { name: '慢性病毒性肝炎', max: 3600},
                        { name: '冠心病', max: 3800},
                        { name: '糖尿病', max: 4200},
                        { name: '高血压', max: 5000}
                    ]
                },
                series: [{
                    name: '重点病种限额情况',
                    type: 'radar',
                    tooltip: {trigger: 'item'},
                    itemStyle: {normal: {areaStyle: {type: 'default'}}},
                    data: [
                        {
                            name: '限定值',
                            areaStyle:{
                                normal:{
                                    color:'#4F81BC',
                                    opacity:1
                                }
                            },
                            itemStyle:{
                                normal:{
                                    color:'#4F81BC'
                                }
                            },
                            value : []
                        },
                        {
                            name:'实际值',
                            areaStyle:{
                                normal:{
                                    color:'#A3595C',
                                    opacity:0.5
                                }
                            },
                            itemStyle:{
                                normal:{
                                    color:'#A3595C'
                                }
                            },
                            value : []
                        }
                    ]

                }]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_radar.setOption(option_radar);

            window.addEventListener("resize", function () {
                Chart_radar.resize();
            });
        };
    });
    
    var Chart_bar2 = echarts.init(document.getElementById('zy_Gauge1'));
    // 指定图表的配置项和数据
    option_bar2 = {
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        grid: {
            top: 40,
            left: '2%',
            right: '2%',
            bottom: '16%',
            containLabel: true,
            y2: 140
        },
        xAxis: [
            {
                type: 'category',
                nameRotate: 50,
                axisPointer: {
                    type: 'shadow'
                },
                data: ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'],
                axisLabel: {
                    interval: 0,//横轴信息全部显示
                    rotate: 30//-30度角倾斜显示
                }
            }
        ],
        yAxis: [
            {
                type: 'value',
                name: '单位：人次',
                boundaryGap: [0, 0.01],
                splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                }
            }
        ],
        series: [
            {
                name: '人次',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#037FF4'
                    }
                },
                barWidth: 20,
                data: []
            }
        ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_bar2.setOption(option_bar2);
    window.addEventListener("resize", function () {
        Chart_bar2.resize();
    });
    
    
    var Chart_radar = echarts.init(document.getElementById('zy_Gauge2'));
    option_radar = {
        title: {
            text: '单位：元',
            right:'15%',
            top:20,
            textStyle: {
                fontSize: 14,
                fontWeight: 500
            }
        },
        legend: {
            top:'5%',
            left:'2%',
            data: ['实际值','限定值']
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        radar: {
            // shape: 'circle',
            name: {
                textStyle: {
                    color: '#000'
                }
            },
            indicator: [
                { name: '恶性肿瘤', max: 4000},
                { name: '尿毒症', max: 5000},
                { name: '慢性病毒性肝炎', max: 3600},
                { name: '冠心病', max: 3800},
                { name: '糖尿病', max: 4200},
                { name: '高血压', max: 5000}
            ]
        },
        series: [{
            name: '重点病种限额情况',
            type: 'radar',
            tooltip: {trigger: 'item'},
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: [
                {
                    name: '限定值',
                    areaStyle:{
                        normal:{
                            color:'#4F81BC',
                            opacity:1
                        }
                    },
                    itemStyle:{
                        normal:{
                            color:'#4F81BC'
                        }
                    },
                    value : []
                },
                {
                    name:'实际值',
                    areaStyle:{
                        normal:{
                            color:'#A3595C',
                            opacity:0.5
                        }
                    },
                    itemStyle:{
                        normal:{
                            color:'#A3595C'
                        }
                    },
                    value : []
                }
            ]

        }]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_radar.setOption(option_radar);

    window.addEventListener("resize", function () {
        Chart_radar.resize();
    });

    var Chart_bar1 = echarts.init(document.getElementById('line1'));
    var jz_data = [];
    var yd_data = [];
    var cf_data = [];
    var cy_data = [];
	var jc_data	= [];
    var dj_data = [];
    // 指定图表的配置项和数据
    option_bar1 = {
         tooltip: {
    trigger: 'axis',
    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
    }
},
legend: {
    right: '10%',
    top: 20,
    data: ['就诊人次', '月度超额人次','问题单据数','次均费用', '次均药费','检查检验费']
},
grid: {
    top: 80,
    left: '2%',
    right: '6%',
    bottom: '2%',
    containLabel: true
},
xAxis: [
    {
        type: 'category',
        nameRotate: 50,
        axisPointer: {
            type: 'shadow'
        },
        data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', ' ']
        
    }
],
yAxis: [
    {
        type: 'value',
        name: '单位：元',
        boundaryGap: [0, 0.01],
        splitLine: {
            lineStyle: {
                type: 'dashed'
            }
        }
    },
    {
        type: 'value',
        name: '单位：人次',
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
                name: '就诊人次',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#5ea2d7'
                    }
                },
                barWidth: 20,
                data: jz_data
            },
            {
                name: '月度超额人次',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#e8a839'
                    }
                },
                barWidth: 20,
                data: yd_data
            },
            {
                name: '次均费用',
                type: 'line',
                itemStyle: {
                    normal: {
                        color: '#bb870a'
                    }
                },
                barWidth: 20,
                data: cf_data
            },
            {
                name: '次均药费',
                type: 'line',
                itemStyle: {
                    normal: {
                        color: '#1f83ff'
                    }
                },
                barWidth: 20,
                data: cy_data
            },
			{
				name: '检查检验费',
				type: 'line',
				yAxisIndex: 1,
				itemStyle: {
					normal: {
						color: '#bd3232'
					}
				},
				barWidth: 20,
				barGap: 0.1,
				data:jc_data
			},
			
            {
                name: '问题单据数',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#8ba621'
						}
					},
			barWidth: 20,
			data:dj_data
		}
]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_bar1.setOption(option_bar1);

    window.addEventListener("resize", function () {
        Chart_bar1.resize();
    });
    
    
    $("a,button").focus(function () {
        this.blur()
    });

</script>
</body>
</html>