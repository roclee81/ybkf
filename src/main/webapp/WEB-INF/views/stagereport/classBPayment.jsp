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
<title>乙类自付比/自费比</title>
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
            <td style="text-align:left">
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
                <input type="hidden" id="hid" name="lmonth"/>
            </td>
            <td class="fs_16 padding-left6" style="width:10%">月</td>
            <td class="fs_16 padding-right6">
               		 科室
            </td>
            <td>
               <select id="depart" name="ksbm"></select>
            </td>
            <td style="padding-left:4%">
                <button class="btn btn-info btn-sm" onclick="seachdate()" type="button" ><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
            </td>
        </tr>
        </tbody>
    </table>
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
	   getQueryData()
	   $.ajax({
            type:"POST",
            url:"${path}/department/getDepartmentOfUser?kslx=zysy",
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
        $("#depart,#selectYear,#selectMonth").comboSelect();
        $("#selectYear").parent().find("input").css({"width":"100px"});
        $("#selectMonth").parent().find("input").css({"width":"60px"});
        totalmonitoring();
    });	

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
		$('#totalmonitoring').datagrid({
		        url : '${path }/fixedreport/hosPatInfoGrid',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:syear,
		        	smonth:smonth,
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
				columns:[
				         [{title: syear+'年'+smonth+'月医疗医保绩效考核指标 ',colspan:20}],
				         [
								{field:'ksbm',title:'科室编码',rowspan:3,width:'7%'},
								{field:'ksmc',title:'科室名称',rowspan:3,width:'7%',}, 
								{title:syear+'年考核指标',colspan:6},
								{title:syear+'年'+smonth+'月科室数据',colspan:12}
				          ],[    
						      	{title:'患者负担比',colspan:2},{title:'乙类自付比',colspan:2},{title:'自费比',colspan:2},
						      	{title:'患者负担比',colspan:4},{title:'乙类自付比',colspan:4},{title:'自费比',colspan:4}
						  ],[    
							    {field:'fdb_zg',title:'职工',width:'7%'},    
							    {field:'fdb_jm',title:'居民',width:'7%'},    
							    {field:'zfb_zg',title:'职工',width:'7%'},    
							    {field:'zfb_jm',title:'居民',width:'7%'},  
							    {field:'zfeib_zg',title:'职工',width:'7%'},
							    {field:'zfeib_jm',title:'居民',width:'7%'},
							    
							    {field:'brfdzb_zg',	title:'职工',width:'7%'},
							    {field:'fdzj_zg',	title:'增减',width:'7%'},
							    {field:'brfdzb_jm',	title:'居民',width:'7%'}, 
							    {field:'fdzj_jm',	title:'增减',width:'7%'}, 
							    {field:'ylzfzb_zg',	title:'职工',width:'7%'}, 
							    {field:'zfzj_zg',	title:'增减',width:'7%'}, 
							    {field:'ylzfzb_jm',	title:'居民',width:'7%'},  
							    {field:'zfzj_jm',	title:'增减',width:'7%'}, 
							    {field:'zfjezb_zg',	title:'职工',width:'7%'},
							    {field:'zfeizj_zg',	title:'增减',width:'7%'}, 
							    {field:'zfjezb_jm',	title:'居民',width:'7%'},
							    {field:'zfeizj_jm',	title:'增减',width:'7%'}, 
						]],  
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                    changeRowHeader(this); 
                },
                onLoadSuccess:function(data){
                	var mark = 0;  
                	var rowspan_field = ['ksbm','ksmc'];  
                	for (var i=1; i <data.rows.length; i++) {  
                		if (data.rows[i][rowspan_field[0]] == data.rows[i-1][rowspan_field[0]]) {  
                			for(var j=0;j<2;j++){
	                	        $(this).datagrid('mergeCells',{  
	                	            index: mark,  
	                	            field: rowspan_field[j],
	                	            rowspan:i-mark+1	  
	                	        });  
                			}
                	    }else{
                	    	mark= i;
                	    } 
                	};
                    window.onresize=function(){
                        $('#totalmonitoring').datagrid('resize');
                    };
                }
		 });
		
	}
	
	function excelExport(){
		var url = "${path }/excel/classB";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
	
	
</script>

</html>