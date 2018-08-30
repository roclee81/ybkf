<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/global.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>漏审审核</title>
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
function getmzpatientDataGrid() {
	   $('#timeoutDataGrid').datagrid({
        url : '${path }/timeout/datagrid',
        fit : false,
        striped : true,
        checkOnSelect : 'true',
        pagination : true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50 ],
        queryParams:{'hzxm':$('#hzxm').val(),'sfzhm':$('#sfzhm').val()},
        frozenColumns:[[
                		{field:'ck',width : '5%',checkbox : true}
                	]],
        columns : [ [ 
			{
	         width : '20%',
	         title : '就诊日期',
	         field : 'inHospDate',
		     },{
		         width : '15%',
		         title : '身份证号',
		         field : 'patIdCard'
		         
		     },  {
		         width : '10%',
		         title : '患者姓名',
		         field : 'patName'
		     }, {
		         width : '10%',
		         title : '参保类型',
		         field : 'patInsuredType',
		         formatter: function (value){
		        	 if(value=="390"){
		        		 return '城乡居民'; 
		        	 }else if(value="391"){
		        		 return "城镇职工"; 
		        	 }else if(value="392"){
		        		 return "省直医保";
		        	 }else{
		        		 return "-";
		        	 } 
		         }
		     } , {
		         width : '10%',
		         title : '就医方式',
		         field : 'medTreatmentMode',
		         formatter:function(value,row,index){
		        	 switch (value) {
		        	 case '11':
		        	 	return "普通门诊";
		        	 case '13':
			        	return "门诊大病";
		        	 case '15':
			        	return "异地就医";
		        	 case '21':
			        	return "普通住院";
		        	 case '22':
			        	return "特殊病种住院";
		        	 case '25':
			        	return "异地住院";
		        	 case '51':
			        	return "生育门诊";
		        	 case '52':
			        	return "生育住院";
		        	 case '71':
			        	return "工伤门诊";
		        	 case '72':
			        	return "工伤住院";
			         default:
			        	 return "-";
		        	 }
		         }
		    
		     }, {
		         width : '10%',
		         title : '疾病名称',
		         field : 'diaInHospName',
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
		         field : 'inHospDeptName'
		    
		     }, {
		         width : '10%',
		         title : '医师',
		         field : 'physicianName'
		    
		     }, 
		     {
		         width : '6%',
		         title : '医疗费(元)',
		         field : 'totalCost'
		    
		     }, {
		         width : '8%',
		         title : '医保内金额(元)',
		         field : 'medInsTotalCost'
		    
		     }
        ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	       	
        },
        onLoadSuccess:function(data){
        }
    });
	
}
</script>

<body>

<!--筛选条件-->
<div class="body-width border-bom xy-div-bg">
    <div class="body-width" style="padding-top:18px;">
    	<form  id="dataForm"  method="post" class="padding-left10 padding-right20">
		   	<div>
		         <span class="fs_16 ylv">患者姓名</span>
		         <input type="text" placeholder="" id="hzxm"  name="hzxm">
		         <span class="fs_16 ylv">身份证号</span>
		         <input type="text" placeholder="请填写身份证号" size="19"  id="sfzhm" name="sfzhm">
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
                            <button class="btn btn-sm btn-info" type="button" onclick="check()"><img src="${staticPath }/static/img/menu/btn1-icon.png">审核</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10" style="padding-top:0">
            	<div class="ys-rc-div" >
                	<table class="body-width common-table" id="timeoutDataGrid"  style="height:auto">
                	</table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
	$(function(){
		getmzpatientDataGrid();
	})
	
	function searchData(){
		getmzpatientDataGrid();
	}
	
	function check(){
		var selectrow = $("#timeoutDataGrid").datagrid("getChecked");//获取的是数组，多行数
		var len = selectrow.length;
		var jzlshs ;
		if(len==0){
			$.messager.alert('提示', "至少选择一条记录进行审核", 'info');
			return null;
		}
		for(var i=0;i<len;i++){
			if(i==0){
				jzlshs=selectrow[0].diaSerialCode;
			}else{
				
				jzlshs+=','+selectrow[i].diaSerialCode;
			}
		}
		$.ajax({
		 type:"POST",
	        url:'${path}/timeout/check',
	        cache:false,
	        async:false,
	        data:{"jzlshs":jzlshs},
	        success:function(data){
	        	if(JSON.parse(data).success){
	        		$.messager.alert('提示', "审核成功", 'info');
	        	}else{
	        		$.messager.alert('警告', "审核失败", 'warn');
	        	}
	        }
		});
	}
</script>
</html>