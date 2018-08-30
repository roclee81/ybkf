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
    <title>住院执行科室项目明细</title>
    <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
	<script src="${path }/static/js/jquery.easyui.min.js"></script>
	<script src="${path }/static/js/bootstrap-datetimepicker.js"></script>
	<script src="${path }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
	<script src="${path }/static/js/jquery.combo.select.js"></script>
	<style type="text/css">
	
		.seachimg{
			
			background:url(${staticPath }/static/img/menu/search.png);
		}
		.combo-select{display:inline-block;}
		.ylv{
			width:6%;
			display:inline-block;
			text-align:right;
		}
	</style>
</head>

<body>
<div class="header-div bg-color margin-top10">
    <form id="dataSearchForm" method="post" class="padding-left20">
	       	<div style="padding-bottom:4px">
	       	<span class="fs_16">出院日期</span>
		        <div style="display:inline-block;vertical-align:bottom;width:303px;">
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
	        <span class="fs_16 ylv">执行科室</span>
	        <select id="depart"  name="ksbm"></select>
	       <span class="fs_16 ylv">医师</span>

             <select id="doctor"  name="ysgh" ></select>

   			</div>
   			<div>
   			<div style="display:inline-block;width:16%">
   				  <span class="fs_16">
                	患者姓名
            </span>
      
             <input style="width:50%" type="text" placeholder="输入患者姓名" size="19" name="hzxm" id="hzxm" >
   			</div>
          
   
            <span class="fs_16 ">
                身份证号
            </span>
  
                <input style="width:12%" type="text" placeholder="输入身份证号码" size="19"  name="sfzhm" id="sfzhm" >
          
           <span class="fs_16 ylv">
             		  参保类型
            </span>

                <select id="cblxbm" name="cblxbm">
                    <option value="000">全部</option>
                    <option value="390">城乡居民</option>
                    <option value="391">城镇职工</option>
                    <option value="392">省直医保</option>
                </select>
         
            <span class="fs_16 ylv">
             	   就医方式
            </span>
                 <select  id="jyfs" name="jyfs" >
                	<option value="0">全部</option>
                    <option value="21">普通住院</option>
                    <option value="22">单病种</option>
                    <option value="23">其他</option>
                </select> 

            <div class="ylv">
                <!-- <input type="button"  value="查询"    class="btn btn-primary "> -->
                <button class="btn btn-sm btn-info" onclick="serchdata()" type="button"><img style="padding: 0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
            </div>
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
            <table class="body-width common-table lj" id="hospitalizedDataGrid">
                <tbody>
                         
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">
$(function(){	
    /* 日期插件*/
    $('.form_date').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 'month',
        language: 'zh-CN',
        autoclose: true,
        todayBtn: true//显示今日按钮
    });
    
    selectRender("${path}/department/getDepartmentOfUser?kslx=zysy","#depart");
	 var ksbm = $("#depart").val();
    selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor");
     $("#depart").change(function(){        
        var ksbm=$(this).val();
        selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor");
    })
    $('#cblxbm,#depart,#jyfs,#doctor').comboSelect();
    $("#jyfs,#doctor,#cblxbm,#depart").parent().css({"width":"12%"});
    $("#depart").parent().css({"width":"12%"});
     hospitalizedDataGrid();
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
                $(id).parent().find("input").css({"width":"100px"});
            }            

            
        }
    })
}

// 门诊患者查询
function hospitalizedDataGrid () {
	   var ldate = $('#ldate').val();
	   var hdate = $('#hdate').val();
	   var cblxbm=$('#cblxbm').val(); //参保类型
       var ksbm=$("#depart").val();
       var ysgh=$("#doctor").val(); 
	   var sfzhm=$('#sfzhm').val(); //身份证号码
	   var hzxm = $("#hzxm").val(); //患者姓名
	   var jyfs= $("#jyfs").val();//就医方式
	   
	    $('#hospitalizedDataGrid').datagrid({
        url : '${path }/inHospital/zyzxksxmmxGrid',
       // fit : true,
        striped : true,
        queryParams: {
        	ldate:ldate,
        	hdate:hdate,
        	cblxbm:cblxbm,
        	ysgh:ysgh,
        	sfzhm:sfzhm,
        	ksbm:ksbm,
        	hzxm:hzxm,
        	jyfs:jyfs
          },
        pagination : true,
        singleSelect : true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [
        	 {
                 width : '7%',
                 title : '住院号',
                 field : 'ZYH',           
             }, {
                 width : '7%',
                 title : '住院号码',
                 field : 'ZYHM',           
             }, {
                 width : '55',
                 title : '姓名',
                 field : 'BRXM',          
             }, {
                 width : '15%',
                 title : '身份证号',
                 field : 'SFZH',           
             }, {
                 width : '55',
                 title : '性别',
                 field : 'BRXB',
                 formatter : function(value, row, index) {
                     switch (value) {
                     case "1":
                         return '男';
                     case "2":
                         return '女';
                     }
                 } 
             }, {
                 width : '55',
                 title : '年龄',
                 field : 'BRNL',        
             },{
                 width : '10%',
                 title : '医保卡号',
                 field : 'YBKH',         
             },{
                 width : '15%',
                 title : '入院时间',
                 field : 'RYRQ',
             },{
                 width : '15%',
                 title : '出院时间',
                 field : 'CYRQ',
             },{
                 width : '10%',
                 title : '科室名称',
                 field : 'ZXKS',
             },{
                 width : '10%',
                 title : '出院诊断 ',
                 field : 'CYZDMC',
             },{
                 width : '10%',
                 title : '就医方式',
                 field : 'JYFSMC',       
             },{
                 width : '8%',
                 title : '住院天数(天)',
                 field : 'ZYTS',
             },{
                 width : '10%',
                 title : '参保类型 ',
                 field : 'CBLX',
             },{
                 width : '10%',
                 title : '住院医疗费用(元) ',
                 field : 'FYJE',
             },{
                 width : '10%',
                 title : '乙类自付(元)',
                 field : 'ZFPAY',
             },{
                 width : '10%',
                 title : '自费金额(元)',
                 field : 'SEFLPAY',
             },{
                 width : '10%',
                 title : '药品费(元)',
                 field : 'YPF',
             },{
                 width : '10%',
                 title : '检查检验费(元)',
                 field : 'JYF',
             },{
                 width : '10%',
                 title : '诊疗费(元)',
                 field : 'ZLF',
             },{
                 width : '10%',
                 title : '治疗费(元)',
                 field : 'ZILF',
             },{
                 width : '10%',
                 title : '材料费(元)',
                 field : 'CLF',
             },{
                 width : '10%',
                 title : '床位费(元)',
                 field : 'CWF',
             },{
                 width : '10%',
                 title : '手术费(元)',
                 field : 'SSF',
             },{
                 width : '10%',
                 title : '自费占比',
                 field : 'ZFZB',
             },{
                 width : '10%',
                 title : '药占比',
                 field : 'YZB',
             },{
                 width : '10%',
                 title : '检查检验占比',
                 field : 'JCJYFZB',
             },{
                 width : '10%',
                 title : '诊疗占比',
                 field : 'ZLFZB',
             },{
                 width : '10%',
                 title : '材料占比',
                 field : 'CLFZB',
             }
        ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	
        },
        onLoadSuccess:function(data){
        	$("#hospitalizedDataGrid").datagrid('resize');//加载完成之后再重新加载一次，防止因滚动条的原因导致表格尺寸偏差(暂时没想到其他方法)
        	window.onresize=function(){
        		$("#hospitalizedDataGrid").datagrid('resize');
        	}
        }
    });
}


function serchdata() {
	hospitalizedDataGrid();
}

//导出excel
function excelExport(){
    var url = "${path }/excel/zyzxksxmmxExport";
    $("#dataSearchForm").attr("action", url);
    $("#dataSearchForm").submit();
}

function excelExport(){
	var ldate = $('#ldate').val();
	var hdate = $('#hdate').val();
	var cblxbm=$('#cblxbm').val(); //参保类型
    var ksbm=$("#depart").val();
    var ysgh=$("#doctor").val(); 
	var sfzhm=$('#sfzhm').val(); //身份证号码
	var hzxm = $("#hzxm").val(); //患者姓名
	var jyfs= $("#jyfs").val();//就医方式

    $.ajax({
		type: "post",
		url: '${path}/excel/zyzxksxmmxCount',
	    cache: false,
	    async : false,
	    dataType: "json",
	    data: {
	    	ldate:ldate,
        	hdate:hdate,
        	cblxbm:cblxbm,
        	ysgh:ysgh,
        	sfzhm:sfzhm,
        	ksbm:ksbm,
        	hzxm:hzxm,
        	jyfs:jyfs
	    }, 
	    success: function (result) {
	    	if (result < 20000) {
	    		parent.$.messager.alert({
	 		        title : '提示',
	 		        msg : '正在导出数据... ,导出数据量为'+result+'条,请耐心等待！'
 		    	});
	    		location.href='${path}/excel/zyzxksxmmxExport?ldate='+ldate+'&hdate='+hdate
				+'&cblxbm='+cblxbm +'&ysgh='+ysgh+'&sfzhm='+sfzhm +'&ksbm='+ksbm+'&hzxm='+hzxm+'&jyfs='+jyfs; 
			}else{
				parent.$.messager.alert({
	 		        title : '提示',
	 		        msg : '数据量为['+result+"]条,太大,请输入查询条件"
	 		    });
			}		 			
	    }
	});	
}
</script>
</body>
</html>