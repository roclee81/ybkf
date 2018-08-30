<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>违规汇总明细</title>
<style>
.tab-tables ul > li{margin:6px 1px !important;}
.ys-table tbody tr td > select {width: auto !important;  }
</style>
</head>

<body>
<div class="header-div bg-color margin-top10">
<form id="dataSearchForm" method="post" class="padding-left20">
    <table class="ys-table tiaojian" style="width: 50%">
        <tbody>
        <tr>
           <td style="text-align:left">
                <select id="selectYear" name="syear">
                </select>
            </td>
            <td class="fs_16 padding-left6" style="width:10%">
             			   年
            </td>
            <td style="text-align:left" class="fs_16 padding-left6">
                 <select id="selectMonth" name="smonth">
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </td>
            <td class="fs_16 padding-left6" style="width:10%">月</td>
            <td class="fs_16 padding-left6">
               		 科室
            </td class="fs_16 padding-left6">
            <td>
               <select id="depart" name="ksbm"></select>
            </td>
            <td class="fs_16 padding-left6">
               		 就医方式
            </td>
            <td  style="text-align:left" class="fs_16 padding-left6">
               <select id="jyfs" name="jyfs" onchange="changeDepart(this.value)">
               		<option value="mzsy">门诊</option>
                    <option value="zysy">住院</option>
               </select>
            </td>
            <td class="fs_16 padding-left6">
               		违规状态
            </td>
            <td  style="text-align:left" class="fs_16 padding-left6">
               <select id="wgzt" name="wgzt" >
               		<option value="0">全部</option>
               		<option value="1">违规</option>
                    <option value="2">可疑</option>
               </select>
            </td>
            <td style="padding-left:4%">
                <button class="btn btn-info btn-sm" onclick="seachdate()" type="button" ><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
            </td>
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="flag" value="to_64"/>
</form>
</div>
<div class="module-hr"></div>
<div>
	<table class="body-width">
   		<tr>                          
        	<td class="right">
            	<button class="btn btn-sm btn-info" type="button" onclick="excelExport()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
            </td>
       	</tr>
   	</table>
</div>
<div class="bg-color">
	<div class="tab-table-boxs">
    	<!-- 总额监控 -->
		<div class="ks-fy-zb ks-nm-div-name-div">
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="totalmonitoring">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script>
    $(function () {
	   getQueryData();
	   initDepartment('mzsy');
       totalmonitoring();
    });	
    
    function initDepartment(value){
	   $.ajax({
            type:"POST",
            url:"${path}/department/getDepartmentOfUser?kslx="+value,
            cache:false,
            async:false,
            dataType:"json",
            success:function(data){
                var str=""
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].ksdm+"'>"+data[i].ksmc+"</option>";
                }
                $("#depart").append($(str));  
            }
        })	 
        $("#depart,#selectYear,#selectMonth,#jyfs,#wgzt").comboSelect();
        $("#selectYear").parent().find("input").css({"width":"100px"});
        $("#selectMonth").parent().find("input").css({"width":"60px"});
        $("#jyfs").parent().find("input").css({"width":"80px"});
        $("#wgzt").parent().find("input").css({"width":"80px"});
    }
    
    function changeDepart(value){
    	$("#depart").empty();
    	initDepartment(value);
    }

	function seachdate() {
			totalmonitoring();
	}

	//查询条件 年日
	function getQueryData(){
		//  年份下拉选项 往回倒推三年
		var date = new Date();
		var syy= date.getFullYear();
	    for(var sy=0;sy<3;sy++){		
			$('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
		}	
	    var month=date.getMonth()+1;
		month=month<10?"0"+month:String(month); 
	    $('#selectMonth').val(month);
	}

	function totalmonitoring() {
		var ksbm =$("#depart").val();
		var syear = $("#selectYear").val();
		var smonth = $("#selectMonth").val();
		var jyfs = $("#jyfs").val();
		var wgzt = $("#wgzt").val();
		 $('#totalmonitoring').datagrid({
		        url : '${path }/fixedreport/summaryVioDetailsGrid',
		        fit : false,
		        striped : true,
		        rownumbers: true,
		        rownumberHeader:'序号',
		        queryParams: {          
		        	syear:syear,
		        	smonth:smonth,
		        	ksbm:ksbm,
		        	jyfs:jyfs,
		        	wgzt:wgzt,
		        	flag:"to_64"
		          } ,
		        pagination : true,
		        singleSelect : true,
		        
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		                    {
		 		                width : '13%',
		 		                title : '项目时间',
		 		                field : 'KFSJ'
		 	            	},{
		 		                width : '13%',
		 		                title : '入院日期',
		 		                field : 'RYRQ'
		 	            	},
		                     {
		                         width : '10%',
		                         title : '患者姓名',
		                         field : 'HZXM'
		                     },
		                     {
		                         width : '13%',
		                         title : '身份证',
		                         field : 'SFZHM'
		                     },
		                     {
		                         width : '10%',
		                         title : '科室',
		                         field : 'KSMC'
		                     },
		                     {
		                         width : '10%',
		                         title : '医师',
		                         field : 'YSMC'
		                     },{
		                         width : '10%',
		                         title : '项目编码',
		                         field : 'FYXMBM'
		                     },{
		                         width : '20%',
		                         title : '项目名称',
		                         field : 'FYXMMC',
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
		                         field : 'GZMC',
		                         formatter: function(value){
		     	                	if(value==null){
		     	                  		 return '-'; 
		     	                  	 }else{
		     	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
		     	                  	 } 
		     	                }
		                     },
		                     {
		                         width : '20%',
		                         title : '提示说明',
		                         field : 'TSXX',
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
		                         title : '违规数量',
		                         field : 'WGSL'
		                     },{
		                         width : '10%',
		                         title : '违规金额(元)',
		                         field : 'WGJE'
		                     }
		                 ]],  
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                    changeRowHeader(this); 
                },
                onLoadSuccess:function(data){
                    window.onresize=function(){
                        $('#totalmonitoring').datagrid('resize');
                    }
                }
		 });
		
	}
	
	function excelExport(){
		var url = "${path }/excel/sumViolation";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
</script>

</html>