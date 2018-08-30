<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<%-- <%@ include file="/commons/basejs.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>门诊患者查询</title>
    <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
 	<script src="${path }/static/js/jquery.easyui.min.js"></script>
  	<script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path}/static/js/jquery.combo.select.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
    <!-- <link href="${path }/static/css/common.css" rel="stylesheet"> -->
   <%--  <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">   --%>
	<script src="${staticPath }/static/js/common.js"></script>
	<style type="text/css">
	
		.seachimg{
			
			background:url(${staticPath }/static/img/menu/search.png);
		}
		.combo-select{display:inline-block}
		</style>
</head>
<script type="text/javascript">
$(function(){
	getQueryData();
    selectRender("${path}/department/getDepartmentOfUser?kslx=mzsy","#depart");
    var ksbm = $("#depart").val();
    selectRender("${path}/department/getdoctorByksbm?ksbm="+ksbm,"#doctor");
    $("#depart").change(function(){
        updateDoctor();
    })
    $("#selectYear,#selectMonth,#depart,#cblxbm,#doctor").comboSelect();
   	$("#selectYear,#doctor").parent().css({"width":"8%"});
    $("#selectMonth").parent().css({"width":"6%"});
    $("#cblxbm").parent().css({"width":"10%"});
   $("#depart").parent().css({"width":"12%"}); 
    getmzpatientDataGrid()
});

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
                $("#doctor").parent().css({"width":"8%"});
             /*    $(id).parent().find("input").css({"width":"100px"}); */
            }                        
        }
    })
}
function updateDoctor() {
    var ksbm=$("#depart").val();
    if(ksbm!=null&&ksbm!=''){
        selectRender("${path}/department/getdoctorByksbm?ksbm="+ksbm,"#doctor");
    }
}

function getQueryData(){
	//  年份下拉选项 往回倒推三年
	var date = new Date();
	var syy= date.getFullYear();
    for(var sy=0;sy<3;sy++){		
		$('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
	}	
    var month=date.getMonth()+1
	month=month<10?"0"+month:String(month); 
    $('#selectMonth').val(month);
}

// 门诊患者查询
function getmzpatientDataGrid() {
	   var cblxbm=$('#cblxbm').val();
	   /*var ksbm=$("#depart").combobox('getValue');
	   var ysgh=$("#doctor").combobox('getValue');	 */
       var ksbm=$("#depart").val();
       var ysgh=$("#doctor").val();   
	   var sfzhm=$('#sfzhm').val();
	   var hzxm= '%'+$("#hzxm").val()+'%';
	   //alert(sfzhm);
	    $('#getmzpatientDataGrid').datagrid({
        url : '${path }/mgquota/getmzpatientDataGrid',
       // fit : true,
        striped : true,
        queryParams: {          
        	syear:$('#selectYear').val(),
        	smonth:$('#selectMonth').val(),
        	cblxbm:cblxbm,
        	ysgh:ysgh,
        	sfzhm:sfzhm,
        	ksbm:ksbm,
        	hzxm:hzxm
          },
        pagination : true,
        singleSelect : true,
        //sortName : 'jzrq',
        //sortOrder : 'asc',
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [
        {
            width : '10%',
            title : '就诊日期',
            field : 'jzrq'
        
        },{
            width : '15%',
            title : '身份证号',
            field : 'sfzhm',           
        }, {
            width : '10%',
            title : '姓名',
            field : 'xm',          
        }, {
            width : '5%',
            title : '性别',
            field : 'xb',
             formatter : function(value, row, index) {
                switch (value) {
                case 1:
                    return '男';
                case 2:
                    return '女';
                }
            } 
        },
          {
            width : '5%',
            title : '年龄',
            field : 'nl',        
        },{
            width : '10%',
            title : '科室',
            field : 'ks',         
        }, 
        {
            width : '10%',
            title : '医师',
            field : 'ys',
         
        },{
            width : '10%',
            title : '疾病名称',
            field : 'jbmc',
       
        },{
            width : '10%',
            title : '是否门规病种',
            field : 'sfmgbz',
             formatter : function(value, row, index) {
                switch (value) {
                case 0:
                    return '否';
                case 1:
                    return '是';
                }
            } 
       
        },{
            width : '10%',
            title : '医疗费',
            field : 'ylf',       
        },{
            width : '10%',
            title : '医保统筹支付(元)',
            field : 'ybtczf',
       
        },{
            width : '10%',
            title : '个人自付(元)',
            field : 'grzf',
       
        },{
            width : '10%',
            title : '自费金额(元)',
            field : 'zfje',
       
        },{
            width : '10%',
            title : '药品费(元)',
            field : 'ypf',
       
        },{
            width : '10%',
            title : '检查检验费(元)',
            field : 'jcjyf',
       
        },{
            width : '10%',
            title : '诊疗费(元)',
            field : 'zlf',
       
        },{
            width : '10%',
            title : '材料费(元)',
            field : 'clf',
       
        },{
            width : '10%',
            title : '自费占比',
            field : 'zfzb',
       
        },{
            width : '10%',
            title : '药占比',
            field : 'yzb',
       
        },{
            width : '10%',
            title : '检查检验占比',
            field : 'jcjyzb',
       
        },{
            width : '10%',
            title : '诊疗占比',
            field : 'zlzb',
       
        },{
            width : '10%',
            title : '材料占比',
            field : 'clzb',
       
        }
        ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	
        	
        },
        onLoadSuccess:function(data){
        	window.onresize=function(){
        		$("#getmzpatientDataGrid").datagrid('resize');
        	}
        	
        }
        	
    });
}


function serchdata() {
	getmzpatientDataGrid();
}

//导出excel
function excelExport(){
    var url = "${path }/excel/mzPatient";
    $("#dataSearchForm").attr("action", url);
    $("#dataSearchForm").submit();
}
</script>
<body>
<div class="header-div bg-color margin-top10">
    <form id="dataSearchForm" method="post" class="padding-left20">
       
	       
                <select id="selectYear" name="syear">
                </select>   
                 <span class="fs_16 pdr2">
              		  年
            	</span>          
        
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
                 <span class="fs_16">月</span>
           
	            <span class="fs_16">
	             	   科室
	            </span>
	 	                
	               <!-- <input  type="text"  id="depart"  name="ksbm"  style="width: 120px" class=" easyui-validatebox xd-nm" /> -->
                   <select name="ksbm" id="depart"></select>

	            <span class="fs_16" >
	             	  医师
	            </span>
	        
	               <!--  <input  type="text"  id="doctor"  name="ysgh"  style="width: 120px" class=" easyui-validatebox xd-nm" /> -->
                   <select name="ysgh" id="doctor"></select>
	     
	                  <span class="fs_16 " >
                       参保类型
            </span>

                <select id="cblxbm" name="cblxbm">
                    <option value="000">全部</option>
                    <option value="391">城乡居民</option>
                    <option value="392">城镇职工</option>
                    <option value="393">省直医保</option>
                </select>
 
             <span class="fs_16" >
                        姓名
            </span>

                <input type="text" placeholder="输入姓名" size="10"  name="hzxm" id="hzxm" >

            <span class="fs_16">
                          身份证号
            </span>

                <input type="text" placeholder="输入身份证号码" size="19" style="width:10%" name="sfzhm" id="sfzhm" >
           
            <div style="display:inline-block;margin-left:2%">
                <!-- <input type="button"  value="查询"    class="btn btn-primary "> -->
                <button class="btn btn-info btn-sm" onclick="serchdata()" type="button"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
            </div>          
        </tr>
     
        </tbody>
    </table>
   </form>
</div>
<div class="tab-div-box bg-color">
 <div class="ks-fy-zb">
    <div class="gauge-title-div padding-top10">
        <table class="body-width">
            <tr>
                <td class="right" style="width: 76%">
                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="yb-jj-div">
        <div class="ys-rc-div " style="height: auto;width: auto;">
            <table class="body-width common-table lj" id="getmzpatientDataGrid">
                <tbody>
                         
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
</body>
</html>