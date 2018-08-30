<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
    <style>
        .header-div{
            margin-top: 6px;
            border: 0;
            border: 1px solid #C5C5C5;
        }
        .sf-msg-table th{
            border-top: none !important;
        }
        label{font-weight: 500 !important;height: 100%}
        .see-dot-msg-table td{width: 8%}
        p{margin: 0 0 14px !important;}
        .zy-day p{margin: 0!important;}
        .see-dot-msg-table td{ white-space: nowrap;}
	.ys-table select{width:96px;}
	
	  .header-div{
            margin-top: 0px;
            border: 0;
            border: 1px solid #C5C5C5;
        }
        .sf-msg-table th{
            border-top: none !important;
        }
        label{font-weight: 500 !important;height: 100%}
        .see-dot-msg-table td{width: 8%}
		.jb-ul-li li{width: 18.5%}
        .jb-ul-li li:nth-child(4){width: 26%}
        p{margin: 0!important;}
        .see-dot-msg-table td{ white-space: nowrap;}
        .C_hre{min-width: 110px;width: auto}
    </style>

<script type="text/javascript">
var lsh="";
$(function() {
	//setYearMonth();
	 $('#depart').combobox({   
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',   
		     textField:'ksmc',
		     onChange: function (newValue, oldValue) {  
		    	 findByksbm();
	           
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
	
	
});

function findByksbm() {
	var ksbm=$('#depart').combobox('getValue');
	
	 $('#ylz').combobox({   
			url:'${path}/doctorGroup/findByksbm?ksbm='+ksbm,
		     valueField:'ylzbm',   
		     textField:'ylzmc',
		      
		     })
		 
	
	
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


function loadDefineDataGrid()
{
	
	var ksbm="";
	var ylzbm="";
	var	starttime=$("#starttime").val();
	var	endtime=$("#endtime").val();
		ksbm=$("#depart").combobox('getValue');
		ylzbm=$("#ylz").combobox('getValue');
	 var sql="ksmc,ylz";
	var columns =[];
	var selectColumns=[];
	var columnsObj;
	var columnWidth= "10%";
	columnsObj = new Object();
	columnsObj.width=columnWidth;
	 columnsObj.title="科室名称";
	columnsObj.field="ksmc";
	columns.push(columnsObj);
	columnsObj = new Object();
	 columnsObj.title="医疗组";
	 columnsObj.width=columnWidth;
	columnsObj.field="ylz";
	columns.push(columnsObj);
	var checkboxs=$("input:checkbox:checked");
	if(checkboxs.length<1){
		 $.messager.alert( '提示',"请选择左边指标", 'warning');
		 return false;
	}
	
	$("input:checkbox:checked").each(function(index,d){ //由于复选框一般选中的是多个,所以可以循环输出 
		columnsObj = new Object();
		columnsObj.width=columnWidth;
		 columnsObj.title=$(this).attr("name");
		 columnsObj.field=$(this).val().toLowerCase();
		 columns.push(columnsObj);	
	
		  sql=sql+","
	  
	  sql=sql+"to_char(round("+$(this).val().toLowerCase()+",2)) as "+$(this).val().toLowerCase();
	}); 	 
	formsTableDataGrid = $('#formsTable').datagrid({	
		url:'${path }/forms/defineFormsDataGrid',
		 queryParams: {          
	        	sql: sql,
	        	starttime: starttime,
	        	endtime: endtime,
	        	ylzbm: ylzbm,
	        	ksbm: ksbm
	        	
	          }    ,
		fit : true,
        striped : true,
        pagination : true,
        remoteFilter: true,
        nowrap : false,	    
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100 ],
        columns : [columns],
        onBeforeLoad: function (param) {
        	  updateDatagridHeader(this);
        	}
	});	
	$("#rq").html("统计日期："+starttime+"至"+endtime);
	
	
}
function defineFormseExport() {
	
	var ksbm="";
	var ylzbm="";
	var	starttime=$("#starttime").val();
	var	endtime=$("#endtime").val();
		ksbm=$("#depart").combobox('getValue');
		ylzbm=$("#ylz").combobox('getValue');
	 var sql="ksmc,ylz";
	 var title="科室名称,医疗组";
	var columns =[];
	var selectColumns=[];
	var columnsObj;
	var columnWidth= "10%";
	columnsObj = new Object();
	columnsObj.width=columnWidth;
	 columnsObj.title="科室名称";
	columnsObj.field="ksmc";
	columns.push(columnsObj);
	columnsObj = new Object();
	 columnsObj.title="医疗组";
	 columnsObj.width=columnWidth;
	columnsObj.field="ylz";
	columns.push(columnsObj);
	var checkboxs=$("input:checkbox:checked");
	if(checkboxs.length<1){
		 $.messager.alert( '提示',"请选择左边指标", 'warning');
		 return false;
	}
	
	$("input:checkbox:checked").each(function(index,d){ //由于复选框一般选中的是多个,所以可以循环输出 
		columnsObj = new Object();
		columnsObj.width=columnWidth;
		 columnsObj.title=$(this).attr("name");
		 columnsObj.field=$(this).val().toLowerCase();
		 columns.push(columnsObj);	
	
		  sql=sql+","
		  title=title+","+$(this).attr("name");
	  
	  sql=sql+"to_char(round("+$(this).val().toLowerCase()+",2)) as "+$(this).val().toLowerCase();
	}); 
	location.href="${path }/forms/defineFormseExport?sql="+sql+"&starttime="
			+starttime+"&endtime="+endtime+"&ylzbm="+ylzbm+"&ksbm="+ksbm+"&title="+title
	/* $.ajax({
		type: "post",
 		url:"${path }/forms/defineFormseExport",
 	    cache: false,
 	    async : false,
 	    dataType: "json",
 	    data:  {  
 	   	sql: sql,
    	starttime: starttime,
    	endtime: endtime,
    	ylzbm: ylzbm,
    	ksbm: ksbm,
    	title :title
             }    ,	
 	    success: function (data) {
 	    	
 	    } 
		
		
		
		
	})*/
	
	
	
	
}


</script>
<body>
    <!--筛选条件-->
    <div class="body-width fs_18 bold header-color">阶段报表</div>
    <div class="header-div bg-color1 margin-top6" style="height:50px;">
        <table class="ys-table" style="width:50%">
            <tbody>
            <tr>
                <td class="padding-left10 fs_16">
                	日期
                </td>
                <td>
                    <input  name="starttime" id="starttime"placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" style="width: 124px">&nbsp;至
                    &nbsp;<input id="endtime"  name="endtime" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly"style="width: 124px">
                </td>
                <td class="td-width fs_16">
                    科室
                </td>
                <td>
                    <select name="ksbm"  id="depart">
                      
                    </select>
                </td>
                <td class="td-width fs_16">
                                               医疗组
                </td>
                <td>
                    <select style="width:115px;" id="ylz" name="ylzbm"  >
                       
                    </select>
                </td>
                <td style="text-align:left;">
                    <input type="button"  value="查询" class="btn-ok fs_16">
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!--指标展示-->
    <div class="Report_t margin-bottom20">
    	<!--左侧选择-->
        <div class="LeftOpt">
        	<div class="topText">服务能力</div>
            <ul>
            	<li><input type="checkbox"name="就诊人次" value="jzrc"    />就诊人次</li>
           
                <li><input type="checkbox"name="手术人次" value="ssrc"  />手术人次</li>
            </ul>
            <div class="topText">服务效率</div>
            <ul>
            	<li><input type="checkbox"name="平均住院日" value="pjzyr" />平均住院日</li>
                <li><input type="checkbox"name="床位周转率" value="cwzzl"  />床位周转率</li>
            </ul>
            <div class="topText">总费用</div>
            <ul>
            	<li><input type="checkbox" name="医疗总费用"value="ylzfy"/>医疗总费用</li>
                <li><input type="checkbox" name="医保统筹费用" value="ybtcfy"/>医保统筹费用</li>
                <li><input type="checkbox"name="患者自付"  value="hzzf" />患者自付</li>
                <li><input type="checkbox"name="自费金额"  value="zfje"/>自费金额</li>
            </ul>
            <div class="topText">人均费用指标</div>
            <ul>
            	<li><input type="checkbox" name="人均医疗费用" value="rjylfy"/>人均医疗费用</li>
                <li><input type="checkbox" name="人均医保统筹" value="rjybtc" />人均医保统筹</li>
                <li><input type="checkbox" name="人均药费" value="rjyf" />人均药费</li>
                <li><input type="checkbox" name="人均检查检验费" value="rjjcjyf"/>人均检查检验费</li>
                <li><input type="checkbox" name="人均诊疗费"   value="rjzlf"/>人均诊疗费</li>
            </ul>
            <div class="topText">单病种指标</div>
            <ul>
            <!-- 	<li><input type="checkbox" value="dbzmc"/>单病种名称</li> -->
                <li><input type="checkbox" name="单病种医疗总费用"   value="dbzylzfy" />单病种医疗总费用</li>
                <li><input type="checkbox" name="单病种超限患者人次"  value="dbzcxhzrc"  />单病种超限患者人次</li>
            </ul>
            <div class="topText">门特病指标</div>
            <ul>
           
                <li><input type="checkbox"   name="门特病人次" value="mtbrc"/>门特病人次</li>
                <li><input type="checkbox" name="门特病医疗总费用"   value="mtbylzfy"  />门特病医疗总费用</li>
                <li><input type="checkbox" name="门特病统筹支付" value="mtbtczf"  />门特病统筹支付</li>
                <li><input type="checkbox" name="门特病个人负担" value="mtbgrfd"  />门特病个人负担</li>
                <li><input type="checkbox"name="门特病次均费用"  value="mtbcjfy"/>门特病次均费用</li>
                <li><input type="checkbox" name="门特病次均药费"  value="mtbcjyf" />门特病次均药费</li>
            </ul>
            <div class="topText">违规指标</div>
            <ul>
            	<!-- <li><input type="checkbox"/>违规规则</li> -->
                <li><input type="checkbox"  name="违规单据数量" value="wgdjsl"/>违规单据数量</li>
                <li><input type="checkbox"  name="违规金额" value="wgje"/>违规金额</li>
            </ul>
        </div>
        <!-- 展示列表 -->
        <div class="RightLay">
        	<div class="DisplayTop">
            	 <button class="btn-ok fs_16 margin-right10" onclick="loadDefineDataGrid()"  id='btn'>开始</button><button onclick="defineFormseExport()" class="btn-ok fs_16">导出</button>
                 <span id="rq">统计日期：2016-06-03至2016-07-03</span>
            </div>
            <div class="ks-fy-line-div border-val" style="height:800px;width:auto; margin-top:10px; border:1px solid #c1c1c1" id='tdCl'>
                <table id="formsTable"   class="body-width sf-msg-table"  >
                   
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
	
    <script>
        /*$(function () {
            $("#btn").click(function () {
                //切换选中的按钮高亮状态
                $("#tdCl").css('display','block');

            });
        });*/
        $("a,button").focus(function(){this.blur()});
    </script>
</body>
</html>