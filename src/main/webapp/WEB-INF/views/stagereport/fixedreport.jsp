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
<title>固定报表</title>
	<!-- <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
 	<script src="${path }/static/js/jquery.easyui.min.js"></script>
  	<script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <script src="${path}/static/js/jquery.combo.select.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
    <link href="${path }/static/css/common.css" rel="stylesheet">
     <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> -->
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
<div class="bg-color">
    <!--选项卡-->
     <div class="gauge-title-div border-bom padding-bom6" >
            <table class="body-width" >
                <tr>
                    <td>
                        <div class="tab-tables">
                        <ul class="queryclass">
                            <li class="on padding-left0 margin-left0" id="0">总额监控</li>
                            <li id="1">医保费用</li>
                            <li id="2">绩效指标</li>
                            <li id="3">人次指标</li>
                            <li id="4">病种管理</li>
                            <li id="5">门特病管理</li>
                            <li id="6">超限患者</li>
                            <li id="7">问题单据</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
	<div class="tab-table-boxs">
    	<!-- 总额监控 -->
		<div class="ks-fy-zb ks-nm-div-name-div">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="totalmonitoring">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    	<!-- 医保费用 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                   <!--  <canvas id="line" style="position:absolute;z-index:1000" width="400" height="400"></canvas> -->
                    <table class="body-width common-table" id="medicarecosts">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    	<!-- 绩效指标 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="performanceindicators">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>        
    	<!-- 人次指标 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="personindex" style="width:100%">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>         
    	<!-- 病种管理 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="diseasemanagement">
                        <tbody>
                        
                        </tbody>
                    </table>
                </div>
            </div>
        </div>          
    	<!-- 门特病管理 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="outpatientspecial">
                        <tbody>
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>  
    	<!-- 超限患者 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="outpatients">
                        <tbody>
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>        
    	<!-- 问题单据 -->
		<div class="ks-fy-zb ks-nm-div-name-div" style="display:none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="right fs_16">
                            <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table" id="questiondocument">
                        <tbody>
                       
                        </tbody>
                    </table>
                </div>
            </div>
        </div>         
    </div>
</div>

</body>
<script src="${path }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script>
    var cellWidth="" ;  //医保费用表格第一个单元格宽度
    var cellHeight="" ; //医保费用表格第一个单元格高度
    var ctx;
    /*var ctx=document.getElementById("line").getContext("2d");*/
    $(function () {

	   getQueryData()
	   $.ajax({
            type:"POST",
            url:"${path}/department/getDepartmentOfUser?kslx=mzsy",
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
        $(".tab-tables ul li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-table-boxs > div").eq(index).css("display", "block").siblings().css("display", "    none");
            
            if(index == 0 ){//总额监控
                totalmonitoring();
            }
            
            if(index == 1){ //医保费用
                medicarecosts();
            }
            if(index == 2){ //绩效指标
                performanceindicators();
            }
            if(index == 3){ //人次指标
                personindex();
            }
            if(index == 4){ //病种管理
                diseasemanagement();
            }
            if(index == 5){ //门特病管理
                outpatientspecial();
            }
            if(index == 6){ //超限患者
                outpatients();
            }   
            if(index == 7){//问题单据
                questiondocument();
            }   
        });	
    });	

    //表格斜线绘制
    function line(){
       /* var ctx=document.getElementById("line").getContext("2d");*/
        ctx.moveTo(0, 0);
        console.log(cellWidth, cellHeight);
        ctx.lineTo(cellWidth, cellHeight);
        ctx.strokeStyle='#ccc';
        ctx.stroke();
        ctx.fill();
    }
	function seachdate() {
		var index =$(".queryclass  .on").attr("id")
		
		if(index == 0 ){//总额监控
			totalmonitoring();
		}
		
		if(index == 1){ //医保费用
			medicarecosts();
		}
		if(index == 2){ //绩效指标
			performanceindicators();
		}
		if(index == 3){ //人次指标
			personindex();
		}
		if(index == 4){ //病种管理
			diseasemanagement();
		}
		if(index == 5){ //门特病管理
			outpatientspecial();
		}
		if(index == 6){ //超限患者
			outpatients();
		}	
		if(index == 7){//问题单据
			questiondocument();
		}
		
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

	
	
	//总额监控
	function totalmonitoring() {
		var ksbm =$("#depart").val();
		
		 $('#totalmonitoring').datagrid({
		        url : '${path }/fixedreport/totalmonitoring',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        //sortName : 'jzrq',
		        //sortOrder : 'asc',
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		        	{width : '15%',title : '科室名称',field : 'ksmc'},
		        	{width : '10%',title : '参保类型',field : 'cblx'},
		        	{width : '10%',title : '年度',field : 'nd'},
		        	{width : '10%',title : '月度',field : 'yd'},
		        	{width : '10%',title : '就诊类型',field : 'jzlx'},
		        	{width : '10%',title : '预算额度',field : 'ysed'},
		        	{width : '10%',title : '已用额度',field : 'yyed'},
		        	{width : '10%',title : '可用额度',field : 'kyed'},
		        	{width : '10%',title : '医疗总费用',field : 'ylzfy'},
		        	{width : '10%',title : '医保统筹支付',field : 'ybtczf'},
		        	{width : '10%',title : '自费总额',field : 'zfed' }
		        ]],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    window.onresize=function(){
                        $('#totalmonitoring').datagrid('resize');
                    }
                }
		 });
		
	}
	
	//医保费用
	function medicarecosts() {
		var ksbm =$("#depart").val();
		
		 $('#medicarecosts').datagrid({
		        url : '${path }/fixedreport/medicarecosts',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        //sortName : 'jzrq',
		        //sortOrder : 'asc',
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
			        {
			            width : '10%',
			            title : '费用类别',
			            colspan:1
			        },{
			            width : '10%',
			            title : '门诊统筹（不包括门诊规定病种）',
			            colspan:5
			        },{
			            width : '10%',
			            title : '门诊规定病种',
			            colspan:5
			        },{
			            width : '10%',
			            title : '住院统筹（不包括单病种）',
			            colspan:5
			        },{
			            width : '10%',
			            title : '单病种',
			            colspan:5
			        }		 	 	
			        ],[
			        	{
				            width : '10%',
				            title : '参保类型',
				            field : 'cblx',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '人次 ',
				            field : 'mzrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医疗总费用',
				            field : 'mzylzfy',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保统筹',
				            field : 'mzybtc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '患者负担',
				            field : 'mzhzfd',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保拒付',
				            field : 'mzybjf',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '人次 ',
				            field : 'mgrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医疗总费用',
				            field : 'mgylzfy',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保统筹',
				            field : 'mgybtc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '患者负担',
				            field : 'mghzfd',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保拒付',
				            field : 'mgybjf',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '人次 ',
				            field : 'zyrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医疗总费用',
				            field : 'zyylzfy',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保统筹',
				            field : 'zyybtc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '患者负担',
				            field : 'zyhzfd',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保拒付',
				            field : 'zyybjf',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '人次 ',
				            field : 'dbzrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医疗总费用',
				            field : 'dbzylzfy',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保统筹',
				            field : 'dbzybtc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '患者负担',
				            field : 'dbzhzfd',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '医保拒付',
				            field : 'dbzybjf',
				            rowspan:1
				        }
	 
			        ]
			        
			       ],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 

                   
                    
                   
                },
                onLoadSuccess:function(data){
                    $("#medicarecosts").parent().find(".datagrid-header-row:nth-child(1)").find("td:nth-child(1) div").css({"text-align":"right"});
                    $("#medicarecosts").parent().find(".datagrid-header-row:nth-child(2)").find("td:nth-child(1) div").css({"text-align":"left"});
                    $("#medicarecosts").parent().find(".datagrid-header-row:nth-child(1)").find("td:nth-child(1)").css({"borderBottom":"none","position":"relative"}).append($('<canvas id="line" style="position:absolute;z-index:1000;top:0;left:0" width="400" height="400"></canvas>'));
                    cellHeight=$("#medicarecosts").parent().find(".datagrid-header").height()+7;
                    cellWidth=$("#medicarecosts").parent().find(".datagrid-header-row td:nth-child(1)").width()+12;
                    ctx=document.getElementById("line").getContext("2d");
                    line();
                    window.onresize=function(){
                        ctx.clearRect(0, 0,cellWidth,cellHeight);
                        $('#medicarecosts').datagrid('resize');
                        cellHeight=$("#medicarecosts").parent().find(".datagrid-header").height()+7;
                        cellWidth=$("#medicarecosts").parent().find(".datagrid-header-row td:nth-child(1)").width()+12+1;
                        ctx.beginPath();
                        line();
                    }
                }
		 });
		
	}
	
	//绩效指标
	function performanceindicators() {
		var ksbm =$("#depart").val();
		
		 $('#performanceindicators').datagrid({
		        url : '${path }/fixedreport/performanceindicators',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        //sortName : 'jzrq',
		        //sortOrder : 'asc',
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
			        	{
				            width : '15%',
				            title : '科室名称',
				            field : 'ksmc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '年度 ',
				            field : 'nd',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '月度',
				            field : 'yd',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '门诊人次',
				            field : 'mzrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '住院人次',
				            field : 'zyrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '手术人次',
				            field : 'ssrc',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '平均住院日 ',
				            field : 'pjzyr',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '床位周转率',
				            field : 'zwzzl',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '药占比',
				            field : 'yzb',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '检查检验占比',
				            field : 'jcjyzb',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '诊疗占比',
				            field : 'zlzb',
				            rowspan:1
				        },{
				            width : '10%',
				            title : '材料占比 ',
				            field : 'clzb',
				            rowspan:1
				        }
	 
			        ]],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    window.onresize=function(){
                        $('#performanceindicators').datagrid('resize');
                    }
                }    
		 });
	}
	
	//人次指标
	function personindex() {
		var ksbm =$("#depart").val();		
		 $('#personindex').datagrid({
		        url : '${path }/fixedreport/personindex',
		        // fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        //sortName : 'jzrq',
		        //sortOrder : 'asc',
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
				        	{title:"科室名称",field:'ksmc',width:"15%"},
				        	{title:"参保类型",field:'cblx',width:"10%"},
				        	{title:"年度",field:'nd',width:"10%"},
				        	{title:"月度",field:'yd',width:"10%"},
				        	{title:"门诊统筹人次",field:'mztcrc',width:"10%"},
				        	{title:"门诊规定病种人次",field:'mgrc',width:"15%"},
				        	{title:"住院统筹人次",field:'zytcrc',width:"10%"},
				        	{title:"单病种人次",field:'dbzrc',width:"10%"},
				        	{title:"手术人次",field:'ssrc',width:"10%"} 
			        ]],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    $("td[field='ssrc']").css({"width":"10000px"});
                    window.onresize=function(){
                        $('#personindex').datagrid('resize');
                    }
                }

		 });
	}
	
	//病种管理
	function diseasemanagement() {
		var ksbm =$("#depart").val();
		
		 $('#diseasemanagement').datagrid({
		        url : '${path }/fixedreport/diseasemanagement',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
		        	{title:"单病种名称",field:'dbzmc',width:'10%',rowspan:2},
		        	{title:"年度	",field:'nd',width:'7%',rowspan:2},
		        	{title:"月度",field:'yd',width:'7%',rowspan:2},
		        	{title:"参保类型",field:'cblx',width:'10%',rowspan:2},
		        	{title:"单病种医疗总费用",field:'dbzylzfy',width:'12%',rowspan:2},
		        	{title:"门诊规定病种人次",field:'mgbzrc',width:'12%',rowspan:2},
		        	{title:"患者人数",width:'49%' ,colspan:5},
		        	{title:"单病种效率",width:'17%',colspan:2},   
		         	{title:"费用超额患者数",field:'fycehzs',width:'10%',rowspan:2},
		        	{title:"次均住院费用",field:'cjzyfy',width:'10%',rowspan:2},
		        	{title:"平均超额",field:'pjce',width:'7%',rowspan:2},
		        	{title:"最高超额",field:'zgce',width:'7%',rowspan:2},
		        	{title:"次均药费",field:'cjyf',width:'7%',rowspan:2},
		        	{title:"次均诊疗费",field:'cjzlf',width:'7%',rowspan:2},
		        	{title:"次均检查检验费",field:'cjjcjyf',width:'10%',rowspan:2},
		        	{title:"次均材料费",field:'cjclf',width:'7%',rowspan:2}  ,
		        	], [
		        		{title:"单病种人次",field:'dbzrc',width:'7%',rowspan:1},
 						{title:"执行路径人次",field:'zxljrc',width:'10%',rowspan:1},
 						{title:"路径完成人次",field:'ljwcrc',width:'10%',rowspan:1},
 						{title:"路径退出人次",field:'ljtcrc',width:'10%',rowspan:1},
 						{title:"实行单病种收费人次",field:'sxdbzsfrc',width:'12%',rowspan:1},
 						{title:"平均住院日",field:'pjzyr',width:'7%',rowspan:1},
 						{title:"日均住院费用",field:'rjzyfy',width:'10%',rowspan:1}
 						
		        	] 
		        ],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    window.onresize=function(){
                        $('#diseasemanagement').datagrid('resize');
                    }
                }
		 });
	}
	
	//门特病管理
	function outpatientspecial() {
		var ksbm =$("#depart").val();
		
		 $('#outpatientspecial').datagrid({
		        url : '${path }/fixedreport/outpatientspecial',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
		        	{title:"门规病种类型",field:'dbzmc',width:'15%'},
		        	{title:"年度",field:'nd',width:'15%'},
		        	{title:"月度",field:'yd',width:'15%'},
		        	{title:"参保类型",field:'cblx',width:'15%'},
		        	{title:"门规患者总费用",field:'dbzylzfy',width:'15%'},
		        	{title:"违规人次",field:'mgbzrc',width:'15%'},
		        	{title:"违规金额",field:'fycehzs',width:'10%' },
		        	]
		        ],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    $("td[field='fycehzs']").css({"width":"10000px"});
                    window.onresize=function(){                        
                        $('#outpatientspecial').datagrid('resize');
                    }
                }
		 });

	}
	
	//超限患者
	function outpatients() {
		var ksbm =$("#depart").val();
		 $('#outpatients').datagrid({
		        url : '${path }/fixedreport/outpatients',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
		        	{title:"科室名称",field:'dbzmc',width:'15%'},
		        	{title:"年度",field:'nd',width:'15%'},
		        	{title:"月度",field:'yd',width:'15%'},
		        	{title:"门诊大处方人次",field:'cblx',width:'15%'},
		        	{title:"普通住院超定额人次",field:'dbzylzfy',width:'20%'},
		        	{title:"单病种患者超额人次",field:'mgbzrc',width:'20%'},
		        	
		        	]
		        ],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    $("td[field='mgbzrc']").css({"width":"10000px"});
                    window.onresize=function(){
                        $('#outpatients').datagrid('resize');
                    }
                }
		 });
	}
	//超限患者
	function questiondocument() {
		var ksbm =$("#depart").val();
		 $('#questiondocument').datagrid({
		        url : '${path }/fixedreport/questiondocument',
		        fit : false,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns :[ [
				        	{title:"单病种名称",field:'dbzmc',width:'10%',rowspan:2},
				        	{title:"年度	",field:'nd',width:'5%',rowspan:2},
				        	{title:"月度",field:'yd',width:'5%',rowspan:2},
				        	{title:"违规情况",width:'20%',colspan:2},
				        	{title:"限儿童",width:'10%',colspan:2},
				        	{title:"限定性别",width:'10%',colspan:2},
				        	{title:"超量用药",width:'10%'},
				        	{title:"提前取药",width:'10%',colspan:2},   
				         	{title:"重复用药",width:'10%',colspan:2},
				        	{title:"超适应症",width:'10%',colspan:2},
				        	
				        	], [
				        		{title:"违规单据数",field:'wgdjs',width:'10%'},
		 						{title:"违规总金额",field:'wgzje',width:'10%'},
				        		{title:"单据数",field:'xetdjs',width:'6%'},
		 						{title:"金额",field:'xetje',width:'6%'},
				        		{title:"单据数",field:'xdxbdjs',width:'6%'},
		 						{title:"金额",field:'xdxbje',width:'6%'},
				        		{title:"单据数",field:'clyydjs',width:'6%'},
		 						{title:"金额",field:'clyyje',width:'6%'},
				        		{title:"单据数",field:'tqqydjs',width:'6%'},
		 						{title:"金额",field:'tqqyje',width:'6%'},
				        		{title:"单据数",field:'cfyydjs',width:'6%'},
		 						{title:"金额",field:'cfyyje',width:'6%'},
				        		{title:"单据数",field:'csyzdjs',width:'6%'},
				        	] 
				        ],
                onBeforeLoad: function (param) {
                    updateDatagridHeader(this); 
                },
                onLoadSuccess:function(data){
                    window.onresize=function(){
                        $('#questiondocument').datagrid('resize');
                    }
                }
		 });
	}
	
	
	
	
</script>

</html>