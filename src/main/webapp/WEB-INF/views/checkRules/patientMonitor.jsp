<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/global.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>门诊审核</title>
  <!--   <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
   <script src="${path }/static/js/jquery.easyui.min.js"></script>
      <script src="${path }/static/js/datagrid-filter.js"></script>
   <script src="${path }/static/extJs.js"></script>
   <script src="${path }/static/js/common.js"></script>
   <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
     <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
   <link href="${path }/static/css/common.css" rel="stylesheet">
   <script src="${path }/static/js/bootstrap-datetimepicker.js"></script>
   <script src="${path }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
   <link href="${path }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> -->
    <link href="${path }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <style>
        label {
            font-weight: 500 !important;
            height: 100%
        }

        .jz-msg td {
            white-space: nowrap;
        }

        ul, ol {
            margin-top: 2px margin-bottom : 4 px !important;
        }

        .radio-table td {
            color: #2a425a;
        }

        .radio-table td:nth-child(1) {
            width: 24% !important;
            color: #666;
            white-space: nowrap;
        }

        .td-width {
            width: 50px;
        }

        .textarea {
            width: 99%;
            height: 120px;
            border: 1px solid #d4d4d4;
        }
        .not-allowed{
            cursor: not-allowed!important;
            pointer-events:auto!important;
        }
        .payKe {
            vertical-align: text-bottom;
            margin-bottom: -6px !important;
            margin-right: 10px !important;
        }

        .main-div {
            min-height: 90%
        }
        select{width: auto!important;}
        .DialogDiv3{top: 10%!important;height: 80%!important;}
        td{white-space: nowrap;}
        .close{padding-top: 4px;padding-right: 20px}
        #close{background: #000 !important;border-color:#000 !important;color: #FFFFFF!important;}
        .cost{padding-left: 5px}
        .recipe{padding-right: 5px}
        .combo-select{display:inline-block;}
        .ylv{display:inline-block;width:6%;text-align:right;}
    </style>
</head>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/js/bootstrap-datetimepicker.js"></script>
<script src="${path }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${path }/static/js/jquery.combo.select.js"></script>
<script type="text/javascript">
var num = 0;
var lsh = "";
$(function() {
    selectRender("${path}/department/getDepartmentOfUser?kslx=mzsy","#depart");
    var ksbm = $("#depart").val();
    selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor");
    $("#depart,#cblxbm,#jyfs1,#shzt").comboSelect();
    $("#depart").parent().css({"width":"12%"});
    $("#doctor,#shzt").parent().css({"width":"10%"});
    $("#hzxm,#mzjbmc").css({"width":"10%"});
    $("#cblxbm,#jyfs1").parent().css({"width":"100px"});
    $("#sfzhm").css({"width":"12%"});
    getmzpatientDataGrid();
    $("#depart").change(function(){        
          updateDoctor();
    });
})
//下拉框渲染
function selectRender(url,id){
    $.ajax({
        type:"POST",
        url:url,
        cache:false,
        async:false,
        dataType:"json",
        success:function(data){
            var str="";
            if(id=="#depart"){
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].ksdm+"'>"+data[i].ksmc+"</option>";
                }  
                $(id).empty().append($(str));             
            }else if(id=="#doctor"){
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].gh+"'>"+data[i].xm+"</option>";
                }
                $(id).empty().append($(str));
                $(id).comboSelect();
                $("#doctor").parent().css({"width":"10%"});
            }                        
        }
    })
}
function updateDoctor() {
  var ksbm=$("#depart").val();
	if(ksbm!=null&&ksbm!=''){
        selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor");
	}
}

function getmzpatientDataGrid() {
	   var ldate=$("#ldate").val();
	   var hdate=$("#hdate").val();
       var ksbm=$("#depart").val();
       var ysgh=$("#doctor").val();  
	   var sfzhm=$('#sfzhm').val();	   
	   var hzxm=$("#hzxm").val();
	   var cblxbm=$('#cblxbm').val(); 
	   var jyfs=$('#jyfs1').val();
	   var mzjbmc=$('#mzjbmc').val();
	   var shzt=$('#shzt').val(); 
	   var url;
	   if(shzt==3){
		   url='${path }/costStruct/SelectCostStruct?methodFlag=mzkydjDataGrid';  //可疑单据
	   }else{
		   url='${path }/costStruct/SelectCostStruct?methodFlag=mzdjDataGrid';
	   }
	   $('#mzpatientDataGrid').datagrid({
        url : url,
        fit : false,
        striped : true,
        queryParams: {          
        	ldate: ldate,
        	hdate: hdate,
        	ksbm: ksbm,
        	ysgh:ysgh,
        	hzxm:hzxm,
        	cblxbm:cblxbm,
        	shzt:shzt,
        	sfzhm:sfzhm,
        	jyfs:jyfs,
        	mzjbmc:mzjbmc,
        	flag:"to_64"
          }    ,
       // rownumbers : true,
        pagination : true,
       singleSelect : true,
      //  idField : 'id',
        sortName : 'jzrq',
        sortOrder : 'asc',
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [ 
	        {
	         width : '10%',
	         title : '就诊日期',
	         field : 'JZRQ' 
		     },{
		         width : '15%',
		         title : '身份证号',
		         field : 'SFZHM'
		         
		     },  {
		         width : '10%',
		         title : '患者姓名',
		         field : 'HZXM',
		         formatter: function (value, rowData, rowIndex) {       
		                 return "<a style='color:green' href='javacript:;' onclick=visitInfo('" + rowData.MZLSH + "');>" + value + "</a>";
		          }
		     }, {
		         width : '10%',
		         title : '参保类型',
		         field : 'CBLX'
		     } , {
		         width : '10%',
		         title : '就医方式',
		         field : 'JYFS',
		         formatter:function(value,row,index){
		        	 switch (value) {
		        	 case '11':
		        	 	return "门统";
		        	 case '13':
			        	return "门规";
			         default:
			        	 return "-";
		        	 }
		         }
		    
		     }, {
		         width : '10%',
		         title : '疾病名称',
		         field : 'RYZD',
		         formatter: function (value){
		        	 if(value==null){
		        		 return '-'; 
		        	 }else{
		        		 return "<span title='" + value + "'>" + value + "</span>"; 
		        	 } 
		         }
		    
		     }, {
		         width : '10%',
		         title : '科室',
		         field : 'KSMC'
		    
		     }, {
		         width : '10%',
		         title : '医师',
		         field : 'YSXM'
		    
		     }, 
		     {width : '10%',title : '开立原因',field : 'KLYY',
	            	formatter: function (value){
	                      if(value==null){
	                          return '-'; 
	                      }else{
	                          return "<span title='" + value + "'>" + value + "</span>" 
	                      }
	                  }
	         },
		     {
		         width : '6%',
		         title : '医疗费(元)',
		         field : 'YLF'
		    
		     }, {
		         width : '8%',
		         title : '医保内金额(元)',
		         field : 'YBNJE'
		    
		     }, {
		         width : '8%',
		         title : '自费金额(元)',
		         field : 'ZFJE'   
		     }, {
		         width : '6%',
		         title : '违规状态',
		         field : 'WGZT'
		     }, {
		         width : '10%',
		         title : '审核意见',
		         field : 'SHYJ'   
		     }
        ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	       	
        },
        onLoadSuccess:function(data){
        		$('#mzpatientDataGrid').datagrid("selectRow", 0);
            	var row = $('#mzpatientDataGrid').datagrid("getSelections");
            	if(row[0]!=undefined)
            	{
            		visitInfo(row[0].MZLSH);
            	}
          window.onresize=function(){
              $("#mzpatientDataGrid").datagrid('resize');
          }
        }
    });
	
}

function getpatient(lsh) {
	if(lsh != ""){
			$.ajax({
			    url:'${path }/invoiceCheck/selectByLsh',
			    type:'post',
				data:{
					mzlsh:lsh,
					flag:"to_64"
					},
				success:function(data){
					data=JSON.parse(data);	//身份证号
					$('#patietsfzhm').html(data.SFZHM);
					$('#rylb').html(data.RYLB);
					$('#borth').html(data.BORTH);
					$('#jyfs').html(data.JYFS);
					$('#cbr').html(data.CBR);
					$('#xb').html(data.XB);
					$('#nl').html(data.NL);
					$('#jzrq').html(data.JZRQ);
					$('#zfy').html(data.ZFY);
					$('#mlnje').html(data.YBNZJE);
				} 
		   });
		
	}else{
		$('#patietsfzhm,#rylb,#borth,#jyfs,#cbr,#xb,#nl,#jzrq,#zfy,#mlnje').html('-');
	}
	checkState();
}

//就医方式
function seeDoctorWay(value){
   	 switch (value) {
   	 case 11:
   	 	return "普通门诊";
   	 case 13:
       	 return "门诊大病";
   	 case 15:
       	 return "异地门诊";
   	 case 21:
       	 return "普通住院";
   	 case 22:
       	 return "特殊病种住院";
   	 case 25:
       	 return "异地住院";
   	 case 51:
       	 return "生育门诊";
   	 case 52:
       	 return "生育住院";
   	 case 71:
       	 return "工伤门诊";
   	 case 72:
       	 return "工伤住院";
        default:
       	 return "-";
   	 }
}

function searchData() {
	getmzpatientDataGrid();
  limitForm();
}

function loadWGXXgrid(lsh){
	if(lsh!=''){
		$('#violationInforDataGrid').datagrid({
	 		url : '${path }/costStruct/SelectCostStruct',
	 		queryParams : {
	 			lsh:lsh,
	     	 	methodFlag:'getWGXXByLSH',
	     	 	flag:"to_64"
	 		},
	 		rownumbers:true,
	 		singleSelect:true,
	 		rownumberHeader:'序号',
	        fit : false,
	        striped : true,
	        pagination : true,
	        nowrap : true,
	        pageSize : 5,
	        pageList : [ 5 ],
	        columns : [ [
				{
	                width : '13%',
	                title : '项目时间',
	                field : 'KFSJ'
	            },{
	                width : '10%',
	                title : '项目编码',
	                field : 'XMBM'
	            },{
	                width : '10%',
	                title : '项目名称',
	                field : 'XMMC',
	                formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
	            },
	            {
	                width : '10%',
	                title : '违反规则',
	                field : 'WFGZ',
	                formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
	            },
	            {
	                width : '10%',
	                title : '提示说明',
	                field : 'TSSM',
	                formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
	            },
	            {
	                width : '10%',
	                title : '科室',
	                field : 'KS'
	            },
	            {
	                width : '10%',
	                title : '医师',
	                field : 'YS'
	            },
	            {
	                width : '10%',
	                title : '规格',
	                field : 'GG'
	            },
	            {
	                width : '10%',
	                title : '单位',
	                field : 'DW'
	            },
	            {
	                width : '10%',
	                title : '用法',
	                field : 'YF'
	            },
	            {
	                width : '10%',
	                title : '用量',
	                field : 'YL'
	            },
	            {
	                width : '10%',
	                title : '单价(元)',
	                field : 'DJ'
	            },
	            {
	                width : '10%',
	                title : '数量',
	                field : 'SL'
	            },{
	                width : '10%',
	                title : '金额(元)',
	                field : 'JE'
	            },
	            {
	                width : '10%',
	                title : '医保内金额(元)',
	                field : 'YBNJE'
	            }
	        ]],
	        onBeforeLoad: function (param) {
	             updateDatagridHeader(this);
	       	}
	 	});
	}
	
}
function loadFYMXgrid(lsh){
	if(lsh!=''){
	$('#chargesDetailDataGrid').datagrid({
 		url : '${path }/costStruct/SelectCostStruct',
 		queryParams : {
 			lsh:lsh,
     	 	methodFlag:'getSFMXByLSH',
     	 	flag:"to_64"
 		},
 		rownumbers:true,
 		singleSelect:true,
 		rownumberHeader:'序号',
        fit : false,
        striped : true,
        pagination : true,
        nowrap : false,
        pageSize : 5,
        pageList : [ 5 ],
        columns : [ [
			{
                width : '13%',
                title : '项目时间',
                field : 'XMSJ'
            },
			{
                width : '10%',
                title : '项目编码',
                field : 'XMBM'
            },{
                width : '20%',
                title : '项目名称',
                field : 'XMMC'
            },
            {
                width : '20%',
                title : '数量',
                field : 'SL'
            },
            {
                width : '20%',
                title : '金额(元)',
                field : 'JE'
            },
            {
                width : '20%',
                title : '医保内金额(元)',
                field : 'YBNJE'
            },
            {
                width : '10%',
                title : '执行科室',
                field : 'KS'
            }

        ]],
        onBeforeLoad: function (param) {
             updateDatagridHeader(this);
       	}
 	});
  }
}

function loadFYZBYJgrid(lsh) {
	  //改良版循环赋值的方法——严开畅
	if(lsh!=''){
		$.ajax({
			   url:'${path}/costStruct/selectEcharsData?methodFlag=getFYZBYJByLSH',
         type:"POST",
			   data:{mzlsh:lsh,flag:"to_64"},
			   success:function(data){
				  var data=JSON.parse(data);
				  $("#value0").text(data.getFYZBYJByLSH_value0);
				  $("#value1").text(data.getFYZBYJByLSH_value1); 
				  $("#value2").text(data.getFYZBYJByLSH_value2);
				  $("#value3").text(data.getFYZBYJByLSH_value3);
				  $("#value4").text(data.getFYZBYJByLSH_value4);			  
				  $("#value5").text(data.getFYZBYJByLSH_value5);
				  $("#value6").text(data.getFYZBYJByLSH_value6);
				  $("#value7").text(data.getFYZBYJByLSH_value7);
			   }
		   });
	}else{
      $("#warningInfoDataGrid").find("tr td:odd").empty();
  }
}
//比较两个值大小，变红的方法——严开畅
function changeColorByCondition(sjz,xe,change){
	if($(xe).html=="" || $(xe).html==undefined){
		return;
	}
	if($(sjz).html>$(xe).html){
		$(sjz).removeClass();
		$(sjz).addClass('warning1');
		$(xe).removeClass();
		$(xe).addClass('warning1');
		if(change!=undefined){
			$(change).removeClass();
			$(change).addClass('warning1');
		}
	}
}
//循环赋值的方法——严开畅
function circlePushValue(data){
	   data=JSON.parse(data);
	   for(var w in data[0]){
		   $("#"+w).html(data[0][w]);
	   }
}


function loadYZMXgrid(lsh){
	if(lsh!=''){
		$('#doctoeAdviceDetailDataGrid').datagrid({
	 		url : '${path }/costStruct/SelectCostStruct',
	 		queryParams : {
	 			lsh:lsh,
	     	 	methodFlag:'getCFMXByLSH',
	     	 	flag:"to_64"
	 		},
	 		rownumbers:true,
	 		singleSelect:true,
	 		rownumberHeader:'序号',
	        fit : false,
	        striped : true,
	        pagination : true,
	        nowrap : false,
	        pageSize : 5,
	        pageList : [ 5 ],
	        columns : [ [
				{
	                width : '13%',
	                title : '项目时间',
	                field : 'XMSJ'
	            },
				{
	                width : '10%',
	                title : '项目编码',
	                field : 'XMBM'
	            },{
	                width : '10%',
	                title : '项目名称',
	                field : 'XMMC'
	            },
	            {
	                width : '10%',
	                title : '科室',
	                field : 'KS'
	            },
	            {
	                width : '10%',
	                title : '医师',
	                field : 'YS'
	            },{
	                width : '10%',
	                title : '规格',
	                field : 'GG'
	            },
	            {
	                width : '10%',
	                title : '单位',
	                field : 'DW'
	            },
	            {
	                width : '10%',
	                title : '用法',
	                field : 'YF'
	            },
	            {
	                width : '10%',
	                title : '用量',
	                field : 'YL'
	            }, 
	            {
	                width : '10%',
	                title : '单价(元)',
	                field : 'DJ'
	            },
	            {
	                width : '10%',
	                title : '数量',
	                field : 'SL'
	            },
	            {
	                width : '10%',
	                title : '金额(元)',
	                field : 'JE'
	            },
	            {
	                width : '10%',
	                title : '医保内金额(元)',
	                field : 'YBNJE'
	            }
	        ]],
	        onBeforeLoad: function (param) {
	             updateDatagridHeader(this);
	       	}
	 	});
	}
	
}
</script>

<body>

<!--筛选条件-->
<div class="body-width border-bom xy-div-bg">
    <div class="body-width" style="padding-top:18px;">
    	<form  id="dataForm"  method="post" class="padding-left10 padding-right20">
		    <div style="padding-bottom:10px">
		        <span class="fs_16">就诊日期</span>
		        <div style="display:inline-block;vertical-align:bottom;width:300px;">
		            <table >
		                <tr>
		                    <td style="padding-top: 0">
		                        <div class="input-group date form_date" style="float: left">
		                            <input class="padding-left4" size="10" data-format="yyyy-MM-dd" style="width: 107px" id="ldate"  name="ldate" >
		                            <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
		                            &nbsp;至&nbsp;
		                        </div>
		                    </td>
		                    <td style="padding-top: 0;padding-left: 0">
		                        <div class="input-group date form_date" style="float: left">
		                            <input class="padding-left4" size="10" data-format="yyyy-MM-dd" style="width: 107px" id="hdate" name="hdate">
		                            <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
		                        </div>
		                    </td>
		                </tr>
		            </table>
		   		</div>
		        <span class="fs_16 ylv">科室</span>
		            <!-- <input  type="text"  id="depart"  name="ksbm"  style="width: 120px" class=" easyui-validatebox xd-nm"/> --> 
		            <select id="depart"  name="ksbm"></select> 
		        <span class="fs_16 ylv">医师</span>
		           <select name="ysgh" id="doctor"></select>
		        <span class="fs_16 ylv">疾病名称</span>
		            <input  type="text"  id="mzjbmc"  name="mzjbmc"  class=" easyui-validatebox xd-nm"/>
		  	</div>
		   	<div>
		    	<span class="fs_16">参保类型</span>
				<div style="display:inline-block;width:300px">
		        	<select id="cblxbm" name="cblxbm">
		               <option value="000">全部</option>
		               <option value="390">城乡居民</option>
				       	<option value="391">城镇职工</option>
				       	<option value="392">省直医保</option>
		        	</select>
		            <span class="fs_16" style="padding-left:20px">就医方式</span>
		            <select id="jyfs1" name="jyfs">
		            	<option value="0">全部</option>
		                <option value="11">门统</option>
		                <option value="13">门规</option>
		            </select> 
		         </div>
		         <span class="fs_16 ylv">身份证号</span>
		         <input type="text" placeholder="请填写身份证号" size="19"  id="sfzhm" name="sfzhm">
		         <span class="fs_16 ylv">患者姓名</span>
		         <input type="text" placeholder="" id="hzxm"  name="hzxm">
				 <span class=" fs_16 ylv">审核状态</span>
		         <select id="shzt" name="shzt">
		             <option value="0">全部</option>
		             <option value="1">违规</option>
		             <option value="2">正常</option>
		             <option value="3">可疑</option>
		         </select>
		         <div style="display:inline-block">
		           <button class="btn btn-info btn-sm " type="button" onclick="searchData()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
				 </div>
			</div>
	    </form>
    </div>
    <div class="clear"></div>
</div>

<div class="bg-color main-div">
	<div>
		<div class="ys-rc-div margin-bottom20">
        	<div class="gauge-title-div">
            	<table class="body-width">
                	<tr>
                    	<td class="table-title"></td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info" type="button" onclick="excelExport('info')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10" style="padding-top:0">
            	<div class="ys-rc-div" >
                	<table class="body-width common-table" id="mzpatientDataGrid"  style="height:auto">
                	</table>
                </div>
            </div>
        </div>
    </div>
    <div class="gauge-title-div borders export">
        <table class="body-width">
            <tr>
                <td class="table-title"></td>
                <td class="right fs_16">
                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('details')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="yb-jj-div margin-top20">
        <div class="float tab-div" style="width: 80%;">
            <div class="tab-div-menu jb-ul-li">
                <ul class="ul-style" id="ul-two">
                    <li>
                        <label class="x-on" style="margin-left: -2px">就诊信息</label>
                    </li>
                    <li>
                        <label>费用指标</label>
                    </li>
                    <li>
                        <label>审核违规</label>
                    </li>
                    <!-- <li>
                        <label>自费提醒</label>
                    </li>
                    <li>
                        <label>大额审批</label>
                    </li> -->
                    <li>
                        <label>处方信息</label>
                    </li>
                    <li>
                        <label>收费明细</label>
                    </li>
                </ul>
            </div>
        </div>

        <div class="clear"></div>
        <div class="tab-div-box1 border-val" style="margin-bottom: 2px; padding-bottom:10px;">
            <!--就诊信息-->
            <div class="margin-top10">
                <div class="float" style="width: 70%;">
                    <div class="margin-left10 see-dot-msg-header fs_16">
                        <label class="edges-icon1"></label>就诊信息
                    </div>
                    <table class="see-dot-msg-table margin-top10" style="width: 80%" id="jzxx">
                        <tr>
                            <td >身份证号:</td>
                            <td id="patietsfzhm"></td>
                            <td>参保人:</td>
                            <td id="cbr"></td>
                            <td>人员类别:</td>
                            <td id="rylb"></td>
                            <td>出生日期:</td>
                            <td id="borth"></td>
                        </tr>
                        <tr>
                            <td>性别:</td>
                            <td id="xb"></td>
                            <td>年龄:</td>
                            <td id="nl"></td>
                            <td>就医方式:</td>
                            <td id="jyfs"></td>
                            <td>就诊日期:</td>
                            <td id="jzrq"></td>
                        </tr>
                        <tr>
                            <td>医疗费:</td>
                            <td id="zfy"></td>
                            <td>目录内金额:</td>
                            <td id="mlnje"></td>
                        </tr>
                    </table>
                </div>
                <div class="border-lef float" style="width: 30%;">
                    <table class="radio-table body-width margin-top10" style="margin-bottom: 8px;">
                        <tr>
                            <td class="left" style="padding:8px 20px">违规状态：</td>
                            <td class="left"><input type="radio" class="payKe zc"  value="0" name="payMethod"/><span>正常</span>
                                <input type="radio" name="payMethod" value="1" class="payKe margin-left10 wg"/><span>违规</span></td>
                        </tr>
                        <tr>
                            <td style="text-align:left; padding:10px 20px">审核意见：</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-left: 20px;padding-right: 20px">
                                <textarea style="" id="checkopinion" class="textarea not-allowed" value="4"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="padding-top10 text-right padding-right20">
                                <button  type="button" onclick="changeCheck()" id="save" class="btn btn-success btn-sm">保存</button>
                                &nbsp;
                                <button class="btn btn-primary btn-sm" id="complete" onclick="complete()">完成</button>
                                &nbsp;
                                <button onclick="cancelOK()" id="cancel" class="btn btn-sm btn-info">取消完成</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="clear"></div>
            </div>
            <!--费用指标预警-->
            <div class="margin-top10" style="display: none;">
                <div style="width: 76%;">
                    <div class="margin-left10 see-dot-msg-header fs_16" style="width: 70%">
                        <label class="edges-icon1"></label>费用指标预警
                    </div>
                    <table class="see-dot-msg-table margin-top10" id="warningInfoDataGrid" style="width: 70%">
                        <tr>
                            <td>医疗费:</td>
                            <td id="value0"></td>
                            <td>月度限额:</td>
                            <td id="value1"></td>
                        </tr>
                        <tr>
                            <td>药品费:</td>
                            <td id="value2"></td>
                            <td>检查检验费:</td>
                            <td id="value3"></td>
                            <td >自费金额:</td>
                            <td id="value4"></td>
                        </tr>
                        <tr>
                            <td>药占比:</td>
                            <td id="value5"></td>
                            <td>检查检验费占比:</td>
                            <td id="value6"></td>
                            <td>自费比例:</td>
                            <td id="value7"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--审核违规-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20" style="/* display: none; */height: 314px;overflow-x: auto" >
                        <table class="common-table" id="violationInforDataGrid">
                   
                        </table>
                    </div>
                </div>
            </div>
            <!--自费提醒-->
          <!--   <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20" style="/* display: none; */height: 314px;overflow-x: auto" >
                        <table class="common-table"id="ownerCostRemindDataGrid" >
                   
                        </table>
                    </div>
                </div>
            </div>
            大额审批
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20" style="/* display: none; */height: 314px;overflow-x: auto" >
                        <table class="common-table" id="BigmoneycheckDataGrid">
                       
                        </table>
                    </div>
                </div>
            </div> -->
            <!--处方信息-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20" style="/* display: none; */height: 314px;overflow-x: auto" >
                        <table class="common-table" id="doctoeAdviceDetailDataGrid">
                  
                        </table>
                    </div>
                </div>
            </div>
            <!--收费明细-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20" style="/* display: none; */height: 294px;overflow-x: auto">
                        <table class="common-table" id="chargesDetailDataGrid">
                           
                        </table>
                    </div>
                </div>
            </div>            
        </div>
    </div>

    <!--增加-弹出层-->
    <div class="BgDiv3"></div>
    <div class="DialogDiv3" style="display: none; height:500px">
        <div class="pop-up bg-color1">
            <table class="body-width">
                <tr>
                    <td class="text-left"><span class="pop-up-span width-color fs_16">患者视图</span></td>
                    <td class="text-right close"><button type="button" class="btn" id="close">关闭</button></td>
                </tr>
            </table>

        </div>
        <div class="body-width margin-top10" style="padding: 10px">
            <div class="hz-msg-div padding10">
                <div class="float" style="margin-left: 2%; padding-top: 40px;width: 10%">
                    <table>
                        <tr>
                            <td class="hz-img" style="padding-top: 0px">
                                <img src="${path }/static/img/bianshi/Op.png" /><br>
                                <span class="fs_16 name"></span>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="float" style="padding-top: 70px;width: 30%">
                    <table>
                        <tr>
                            <td><span>性别：</span>男</td>
                        </tr>
                        <tr>
                            <td><span>年龄(岁)：</span><font class="age"></font></td>
                        </tr>
                        <tr>
                            <td><span>身份证号：</span> <font class="nb"></font></td>
                        </tr>

                        <tr>
                            <td><span>门规病种类型：</span><font class="office"></font></td>
                        </tr>
                    </table>
                </div>
                <div class="float" style="padding-top: 30px;width: 50%">
                    <table style="margin: 0 auto">
                        <tr>
                            <td>
                                <div id="bar1" style="height: 100px;min-width: 300px"></div>
                                <div id="bar2" style="height: 100px;min-width: 300px"></div>
                            </td>
                        </tr>
                    </table>
                </div>
                <table>

                   <!-- <tr>
                        <td rowspan="2" colspan="2" class="hz-img" style="padding-top: 0px">
                            <img src="${path }/static/img/bianshi/Op.png" />
                            <br>
                            <span class="fs_16 name"></span>
                        </td>
                        <td colspan="2"><span>身份证号：</span> <font class="nb"></font></td>


                        <td rowspan="3" colspan="6" style="width: 44%">
                            <div id="bar1" style="height: 100px;min-width: 300px"></div>
                            <div id="bar2" style="height: 100px;min-width: 300px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="name1"><span>年龄(岁)：</span><font class="age"></font><span 

class="padding-left20">性别：</span>男</td>
                    </tr>
                    <tr>
                        <td colspan="2">122</td>
                        <td colspan="2"><span>门规病种类型：</span><font class="office"></font></td>
                    </tr>-->
                </table>
            </div>
            <div  class="hz-msg-div" style="margin-left: 1%;width: 39%">
                <table class="zy-table body-width common-table" style="width: 100%">
                    <tbody>
                    <tr class="th-bg">
                        <th>分析指标(本月)</th>
                        <th>实际值</th>
                        <th>限定值</th>
                    </tr>
                    <tr>
                        <td>就诊次数</td>
                        <td class="right"></td>
                        <td class="right"></td>
                    </tr>
                    <tr>
                        <td>医疗费(元)</td>
                        <td class="right"></td>
                        <td class="right">-</td>
                    </tr>
                    <tr>
                        <td>医保统筹支付费(元)</td>
                        <td class="right"></td>
                        <td class="right">-</td>
                    </tr>
                    <tr>
                        <td>药品费(元)</td>
                        <td class="right"></td>
                        <td class="right">-</td>
                    </tr>

                    <tr>
                        <td>次均费用(元)</td>
                        <td class="right warning1"></td>
                        <td class="right"></td>
                    </tr>
                    <tr>
                        <td>次均药费(元)</td>
                        <td class="right"></td>
                        <td class="right">-</td>
                    </tr>
                    <tr>
                        <td>违规次数</td>
                        <td class="right"></td>
                        <td class="right">-</td>
                    </tr>
                    <tr>
                        <td>目录外金额</td>
                        <td class="right"></td>
                        <td class="right">-</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!--月度指标趋势-->
        <div class="clear"></div>
        <div class="ks-fy-zb margin-top10" style="height: 380px">
            <div class="gauge-title-div border-bom">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title"><label class="radius"></label>月度指标趋势</td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="num3">
                <div id="line">

                </div>
            </div>
            <div class="clear"></div>
        </div>
        <!--就诊记录-->
        <div class="ks-fy-zb" style="height: 130px;margin-bottom: 10px">
            <div class="gauge-title-div border-bom">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title"><label class="radius"></label>就诊记录</td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10">
                <div class="ys-rc-div">
                    <table class="body-width common-table">
                        <!-- <tbody>
                        <tr>
                            <th>门诊流水号</th>
                            <th>就诊日期</th>
                            <th>科室</th>
                            <th>医师</th>
                            <th>医疗费(元)</th>
                            <th>医保统筹支付(元)</th>
                            <th>目录外金额(元)</th>
                            <th>药品费(元)</th>
                            <th>诊疗费(元)</th>
                            <th>违规状态</th>
                            <th>审核意见</th>
                            <th>明细</th>
                        </tr>
                        <tr>
                            <td>101</td>
                            <td>2017/01/07</td>
                            <td>肿瘤科</td>
                            <td>龙陵</td>
                            <td class="right">2217</td>
                            <td class="right">2217</td>
                            <td class="right">572</td>
                            <td class="right">551</td>
                            <td class="right">490</td>
                            <td></td>
                            <td></td>
                            <td><a href="javascript:;" class="recipe">处方</a>/<a href="javascript:;" class="cost">收费

</a></td>
                        </tr>
                        </tbody> -->
                    </table>
                </div>
            </div>
            <div class="clear"></div>
        </div>

        <!--处方明细-->
        <div class="ks-fy-zb recipe-div" style="height: 300px;margin-bottom: 10px;display: none">
            <div class="gauge-title-div border-bom">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title"><label class="radius"></label>处方明细</td>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="doctoeAdviceDetailDataGrid">
                      
                    </table>
                </div>
            </div>
            <div class="clear"></div>
        </div>

        <!--收费明细-->
     <%--    <div class="ks-fy-zb cost_div" style="height: 290px;margin-bottom: 10px;display: none">
            <div class="gauge-title-div border-bom">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title"><label class="radius"></label>收费明细</td>
                        <td class="right fs_16">
                            <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="chargesDetailDataGrid">
            
                    </table>
                </div>
            </div> --%>
            <div class="clear"></div>
        </div>
    </div>
</div>

<script>

    $(function () {

        /* 日期插件*/
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            todayBtn: true//显示今日按钮
        });
        // $(".tab-div-menu ul li").click(function () {
          $(".tab-div-menu ul li").on("click",function(){
            //切换选中的按钮高亮状态
            var index = $(this).index();
            $("#ul-two li").eq(index).find('label').addClass("x-on");
            $("#ul-two li").eq(index).siblings().children().removeClass("x-on");

            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-div-box1 > div").eq(index).show().siblings().hide();
            num=index;
            visitInfo(lsh);
        });
        limitForm();
        $(".common-table tbody tr td a").click(function () {
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".BgDiv3").css("z-index", "100");
            $(".BgDiv3").css({display: "block", height: $(document).height()});
            $(".DialogDiv3").css("top", "15%");
            $(".DialogDiv3").css("display", "block");
            document.documentElement.scrollTop = 0;
            var nb = $(this).text();
            var name = $(this).parent().nextAll().eq(0).text();
            var age = $(this).parent().nextAll().eq(1).text();
            var office = $(this).parent().nextAll().eq(3).text();
            $(".nb").text(nb);
            $(".name").text(name)
            $(".age").text(age)
            $(".office").text(office)
            bar();
            line()
        });
        $(".BgDiv3,#close").click(function () {
            $(".BgDiv3").css("display", "none");
            $(".DialogDiv3").css("display", "none");
        });
        /*处方点击事件*/
        $(".recipe").click(function () {
            $(".recipe-div").css("display", "block");
            $(".cost_div").css("display", "none");
        });
        /*费用点击事件*/
        $(".cost").click(function () {
            $(".cost_div").css("display", "block");
            $(".recipe-div").css("display", "none");
        });

        //柱状图1
      

        //折线图
  
        $("a,button").focus(function () {
            this.blur()
        });
    });
    function putbar(mouth_x_date,mouth_s_date,year_x_date,year_s_date){
        var mouth_s_color;
        var year_s_color;
        var normal_color = "#92D050";
        var abnormal_color = "#FF0000"

        //柱状图1
        var Chart_bar1 = echarts.init(document.getElementById('bar1'));
      if(mouth_x_date==null||mouth_x_date==''){
    	  mouth_x_date = 40;
      }
      if(mouth_s_date==null||mouth_s_date==''){
    	   mouth_s_date = 45;
      }
       
      
        if(mouth_x_date > mouth_s_date){
            mouth_s_color = normal_color
        }
        else{
            mouth_s_color = abnormal_color
        }
        // 指定图表的配置项和数据
        option_bar1 = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '2%',
                right: '24%',
                bottom: '3%',
                top:'10%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                axisTick: {show: false},
                show: false
            },
            yAxis: {
                type: 'category',
                splitLine: {show: false},
                data: [{value:'月累计',textStyle:{fontSize:14}}],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                }
            },
            series: [{
                name: '限额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#E9E9E9',
                        barBorderRadius: [80]
                    }
                },
                barWidth: 14,
                barGap: '-100%', // Make series be overlap
                data: [mouth_x_date],
                markPoint : {
                    data : [
                        {name : '限额', value :mouth_x_date, xAxis: mouth_x_date},
                    ],
                    label:{
                        normal:{
                            show:true,
                            formatter: '限额:{c}元',
                            textStyle:{
                                color:"#000",
                                fontSize:14
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#C6C6C6'
                        }
                    }
                }
            }, {
                name: '实际使用',
                type: 'bar',
                barWidth: 14,
                z: 10,
                data: [{value: mouth_s_date, itemStyle: {normal: {color: mouth_s_color,barBorderRadius:80}}}
                ],
                label:{
                    normal:{
                        show:true,
                        position:'right',
                        formatter: '使用{c}元',
                        offset:[-64,20],
                        textStyle:{
                            color:mouth_s_color,
                            fontSize:14
                        }
                    }
                }
            }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_bar1.setOption(option_bar1);

        //柱状图2
        var Chart_bar2 = echarts.init(document.getElementById('bar2'));
       // var year_x_date = 560;
       // var year_s_date = 460;
        if(year_x_date==null ||year_x_date==''){
        	year_x_date = 560;
        }
        if(year_s_date==null||year_s_date==''){
        	year_s_date = 460;
        }
        if(year_x_date > year_s_date){
            year_s_color = normal_color
        }
        else{
            year_s_color = abnormal_color
        }
        // 指定图表的配置项和数据
        option_bar2 = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                right: 10,
                top: 10
            },
            grid: {
                left: '2%',
                right: '24%',
                bottom: '3%',
                top:'10%',
                containLabel: true
            },
            xAxis: {
                type: 'value',

                axisTick: {show: false},
                show: false
            },
            yAxis: {
                type: 'category',
                splitLine: {show: false},
                data: [{value:'年累计',textStyle:{fontSize:14}}],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                }
            },
            series: [{
                name: '定额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#E9E9E9',
                        barBorderRadius: [80]
                    }
                },
                silent: true,
                barWidth: 14,
                barGap: '-100%', // Make series be overlap
                data: [year_x_date],
                markPoint : {
                    data : [{ value : year_x_date, xAxis: year_x_date}],
                    label:{
                        normal:{
                            show:true,
                            formatter: '定额:{c}元',
                            textStyle:{
                                color:"#000",
                                fontSize:14
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#C6C6C6'
                        }
                    }
                }
            }, {
                name: '实际使用',
                type: 'bar',
                barWidth: 14,
                z: 10,
                data: [{value: year_s_date, itemStyle: {normal: {color: year_s_color, barBorderRadius: [80]}}}
                ],
                label:{
                    normal:{
                        show:true,
                        position:'right',
                        formatter: '使用{c}元',
                        offset:[-42,20],
                        textStyle:{
                            color:year_s_color,
                            fontSize:14
                        }
                    }
                }
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_bar2.setOption(option_bar2);

        window.addEventListener("resize", function () {
            Chart_bar1.resize();
            Chart_bar2.resize();
        });
    };
    
    
    function putline() {
        var Chart_line = echarts.init(document.getElementById('line'));
        // 指定图表的配置项和数据
        option_line = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                right: 10,
                top: 20,
                data: ['就诊次数', '违规次数','医疗费', '医保统筹支付费', '药品费', '次均费用', '次均药费', '目录外金额']


            },
            grid: {
                top: 80,
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
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
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
                    name: '次数',
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
                    name: '医疗费',
                    type: 'line',
                    data: [346, 185, 362, 162, 193, 373, 175]
                },
                {
                    name: '医保统筹支付费',
                    type: 'line',
                    data: [275, 175, 283, 132, 152, 296, 139]
                },
                {
                    name: '药品费',
                    type: 'line',
                    data: [178, 132, 226, 89, 126, 264, 107]
                },
                {
                    name: '次均费用',
                    type: 'line',
                    data: [78, 32, 26, 59, 12, 64, 17]
                },
                {
                    name: '次均药费',
                    type: 'line',
                    data: [17, 32, 42, 29, 56, 12, 10]
                },
                {
                    name: '目录外金额',
                    type: 'line',

                    data: [71, 40, 79, 30, 39, 77, 36]
                },
                {
                    name: '就诊次数',
                    type: 'bar',
                    yAxisIndex: 1,
                    itemStyle: {
                        normal: {
                            color: '#037FF4'
                        }
                    },
                    barWidth: 20,
                    data: [5, 21, 12, 16, 8, 5,16]
                },
                {
                    name: '违规次数',
                    type: 'bar',
                    yAxisIndex: 1,
                    itemStyle: {
                        normal: {
                            color: '#FA5654'
                        }
                    },
                    barWidth: 20,
                    data: [1, 7, 4, 2, 1, 6,3]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_line.setOption(option_line);
        window.addEventListener("resize", function () {
            Chart_line.resize();
        });
    }
    function changeCheck(){
		var shzt= $('input[name="payMethod"]:checked').val();//shzt  0:正常;1:违规
		var shyj=$('#checkopinion').val();
 		$.ajax({
			url:'${path}/invoiceCheck/changeCheckStatu',
			type:'post',
			data:{
				shzt:shzt,
				shyj:shyj,
				mzlsh:lsh,
				flag:"to_64"
			},
			success:function(data){
				$.messager.alert({
	                title:'消息',
	                msg:'审核成功',
	                icon:'info'
          		});
				limitForm();
				getmzpatientDataGrid();
			}
		});
	}
	function cancelOK(){
		if(lsh!=''){
			$.ajax({
				   url:'${path}/invoiceCheck/judgeSuspicious',
				   data:{mzlsh:lsh,flag:"to_64"},
				   type:'post',
				   success:function(data){
					  if(data=="true"){
              $("#save,#complete,#checkopinion,input:radio").attr("disabled", false)
              $("#checkopinion,input:radio,#save,#complete").removeClass('not-allowed');
					  }else{
						  $.messager.alert({
								title:'消息',
								msg:'该单据不需要审核',
								icon:'info',
								});
              limitForm();
              $('#mzpatientDataGrid').datagrid('reload');
					  }
				   }
			   });
		}
		
	}
	//禁用违规表单
  function limitForm(){
      lsh='';
      $("#jzxx,#warningInfoDataGrid").find("tr td:odd").empty();
      $("#violationInforDataGrid,#doctoeAdviceDetailDataGrid,#chargesDetailDataGrid").parents(".panel").css({"display":"none"});
      // updateInfo();
      $("#checkopinion").empty().val('');
      $("input[type='radio'],#checkopinion,#save,#complete,#cancel").addClass('not-allowed').attr("disabled",true);
      $("input[type='radio']").prop("checked",false);
     
  }
	function complete(){
      $("#checkopinion,:radio").addClass('not-allowed').attr("disabled",true);
	}
	
	function checkState(){
 
		if(lsh!=''){
			$.ajax({
           type:"POST",
				   url:'${path}/costStruct/selectEcharsData?methodFlag=checkState',
				   data:{mzlsh:lsh,flag:"to_64"},
				   success:function(data){
 					  var data=JSON.parse(data);
					  var shzt=data.checkState_value0;
					  var shyj=data.checkState_value1;
		        		if(shzt[0]=='0'){
                    $(":radio[value=0]").prop("checked",true).addClass('not-allowed');
                     $("#cancel,#save,#complete,#checkopinion").attr("disabled",true).addClass('not-allowed')
			        	 }else if(shzt[0]=='1'){
                    $(":radio[value=1]").prop("checked",true).addClass('not-allowed');
                    $("#cancel").attr("disabled",false).removeClass('not-allowed');
			        	 }
		        	  if(shyj==undefined){
		        		  $("#checkopinion").empty().val("");
		        	  }else if(shyj!=undefined){
		        		  $("#checkopinion").empty().val(data.checkState_value1);
		        	  }
				   }
			   });
		}
	}
	
	function visitInfo(lsh1){
		var index=num;
		lsh = lsh1;
		if(index==0){
			getpatient(lsh);
			$(".export").hide();
        }
		if(index==1){
			loadFYZBYJgrid(lsh);
			$(".export").hide();
        }
        if(index==2){
        	loadWGXXgrid(lsh);
			$(".export").hide();
        }
        if(index==3){
        	loadYZMXgrid(lsh);
        	$(".export").show();
        }
        if(index==4){
        	loadFYMXgrid(lsh);
        	$(".export").show();
        }
        $("input[type='radio'],#checkopinion,#save,#complete").addClass('not-allowed').attr("disabled",true);
	}
	
	function formatterCell(value){
		if(value==null){
       		 return '-'; 
       	 }else{
       		 return "<span title='" + value + "'>" + value + "</span>"; 
       	 } 
	};
	
	//导出excel
	function excelExport(flag){
		var url;
		if(flag=='info'){
			url = "${path }/excel/mzshInfo?flag=to_64";
			$("#dataForm").attr("action", url);
		    $("#dataForm").submit();
		}else{
			window.location.href = '${path }/excel/mzshDetails?lsh='+lsh+'&flag=to_64';
		}
	    
	}
	
</script>

</body>
</html>