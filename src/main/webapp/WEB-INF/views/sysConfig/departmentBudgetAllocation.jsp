<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>科室预算分配</title>
    <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
    <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <script src="${path}/static/js/jquery.combo.select.js"></script>
    <style>
        .sf-msg-table th {
            border-top: none !important;
        }

        .ys-table .td-width {
            width: 76%;
        }
		.ys-table td{
			padding-top: 10px;
		}
        .rules-table .td-width {
            width: 76px;
        }

        .table-mz {
            display: none;
        }
        .main-div{
        	min-height:78%;
        }
    	.combo-select{display:inline-block;}
    	.fs_14{padding-right:6px;}
    </style>
</head>
<body>
<div class="border-bom padding10 padding-top20 bg-color">
  <form id="dataSearchForm" method="post" class="margin-left20">
   
            <span class="fs_16">
                年度
            </span>

                <select id="selectYear" name="syear" style="text-align:left">
                </select>               
            <span class="fs_16 pdl3p">
                科室
            </span>
                   
             <select id="depart" name="ksbm"></select>

		
            <span class="fs_16 pdl3p">
                参保类型
            </span>
                <select id="cblxbm" name="cblxbm" onchange='cblxChange(this[selectedIndex].value)';>
                     <option value="390">城乡居民</option>
                     <option value="391">城镇职工</option>
                     <option value="392">省直医保</option>
                </select>
       	<span class="qy">
             <span class="fs_16 pdl3p qy">
                区域
            </span>
                <select id="qy" name="qy" class="qy">
                </select>
			</span>
            	 <div style="display:inline-block;margin-left:2%" class="btns">              
            		<button class="btn btn-info btn-sm" type="button" onclick="search()"><img src="${path }/static/img/menu/search.png" style="padding:0"><span > 查询</span></button>
        		</div>
  </form>  
</div>
<div class="body-width  xy-div-bg">
    <div class="body-width padding-top10">
    <form id="dataUpdateForm" method="post" class="margin-left20 padding-right20">   
        <table class="ys-table" style="width: 100%">
            <tbody>
            <tr>
            <td class="fs_14 padding-left10">
                    控费时间方式
                </td>
                <td >
                    <select class="td-width" name="kfsjfs" id="conTime" onchange="kfsjfsChange(this[selectedIndex].value)">
                        <option value="1" selected="selected">月度</option>
                        <option value="2">季度</option>
                    </select>
                </td>
                <td class="fs_14 ">
                    医疗总费用
                </td>
                <td>
                    <input type="text" class="td-width"  name="ylzfyxe"><span class="others sum-cost tooltip-test" data-toggle="tooltip" title="月度/季度限额设定">…</span>
                </td>
                <td class="fs_14">
                    住院人次
                </td>
                <td>
                    <input type="text" class="td-width"  name="zyrc"><span class="others hospital-count tooltip-test" data-toggle="tooltip" title="月度/季度限额设定">…</span>
                </td>
                <td class="fs_14">
                    住院天数
                </td>
                <td>
                    <input type="text" class="td-width" name="zytsxd">
                </td>
                <td class="fs_14">
                    基金限额
                </td>
                <td>
                    <input type="text" class="td-width"  name="jjxe"><span class="others limits tooltip-test" data-toggle="tooltip" title="月度/季度限额设定">…</span>
                </td>
                
                <td class="fs_14">患者负担比</td>
                <td>
                    <input type="text" class="td-width"  name="hzfdzbxe">&nbsp;%
                </td>
                <td class="">
                	<button class="btn btn-info btn-sm" type="button" id="reset"><img src="${path }/static/img/menu/reset.png" style="padding-bottom:1px"><span>重置</span></button>
                </td>
            </tr>
            <tr>
            	<td class="fs_14">乙类自付占比</td>
                <td>
                    <input type="text" class="td-width"  name="ylzfbxe">&nbsp;%
                </td>

            	<td class="fs_14 padding-left10">
                    自费占比
                </td>
                <td>
                    <input type="text" class="td-width"  name="zfbxe">&nbsp;%
                </td>
                <td class="fs_14">
                    药占比
                </td>
                <td>
                    <input type="text" class="td-width"  name="yzbxe">&nbsp;%
                </td>
                <td class="fs_14">
                    检查检验占比
                </td>
                <td>
                    <input type="text" class="td-width"  name="jcjyzbxe">&nbsp;%
                </td>
                <td class="fs_14">
                    诊疗占比
                </td>
                <td>
                    <input type="text" class="td-width"  name="zlzbxe">&nbsp;%
                </td>
                <td class="fs_14">
                    耗材占比
                </td>
                <td>
                    <input type="text" class="td-width"  name="hczbxe">&nbsp;%
                    <input type="hidden" name="id" value=""/>
                </td>
                <td class="">
                	<button class="btn btn-info btn-sm" type="button" id="save"><img src="${path }/static/img/menu/save.png"> <span>保存</span></button>
                </td>
            </tr>
            </tbody>
        </table>
      </form>
    </div>
    <div class="clear"></div>
</div>
<div class="body-width  xy-div-bg">
    <div class="body-width padding-top10">
       <form id="file_form" action=""
     	enctype="multipart/form-data" method="post">
	    	<table>
	    		<tbody>
	    			<tr>
	    				<td class="padding-left10">
	    				<input type="file" name="file" id="file_input">
	    				</td>
	    				<td class="padding-left10">
	    				<button class="btn btn-info btn-sm" type="button" onclick="excelImport()"><img src="${path }/static/img/menu/btn1-icon.png"><span>模板</span></button>
	    				<input type="hidden" name="syear"  id="hidYear"/>
	    				<input type="hidden" name="cblxbm" id="hidCblxbm"/>
	    				<input type="hidden" name="qy" id="hidQy"/>
	    				</td>
	    				<td class="padding-left10">
	    				<input type="submit" value="导入数据" class="btn btn-success btn-sm" id="subID" >
	    				</td>
	    			</tr>
	    		</tbody>
	    	</table>
	    </form>
    </div>
    <div class="clear"></div>
</div>

<div class="bg-color main-div">
    <div class="tab-div-box">
        <!--科室预算分配-->
        <div>
            <div class="yb-jj-div padding-top20">
                <div>
                    <div class="body-width">
                        <div class="ks-ys-div  float">
                            <table class="body-width  ks-ys-title ">
                                <tr>
                                    <td class="left table-title padding-left20">科室基金分配计划</td>
<!--                                     <td class="right fs_14">当前全院基金剩余：</td> -->
<!--                                     <td class="j-fp-font fs_16">3123000<span class="fs_16">元</span></td> -->
                                    <td class="right fs_16">
                                        <button class="btn btn-info btn-sm" type="button" onclick="excelExport()"><img src="${path }/static/img/menu/btn1-icon.png"><span>导出</span></button>
                                        <button class="btn btn-success btn-sm" type="button" id="update"><img src="${path }/static/img/menu/correct.png"><span>修改</span></button>
                                        <button class="btn btn-del del" type="button" id="remove"><img src="${path }/static/img/menu/del.png"><span>移除</span></button>
                                    </td>
                                </tr>
                            </table>
                            <div class="body-width padding10 padding-top0 over-x margin-bottom20">
                                <table class=" common-table "  id="departmentPlanDatagrid">
                                    
                                </table>
                            </div>
                        </div>
                        <div class="rj-fy-div float" style="padding-right: 10px !important;">
                            <table class="body-width padding10 ks-ys-title" id="selectKs">
                                <tr>
                                    <td class="left table-title padding-left10">科室列表</td>
                                    <td class="ks-list on-list zyks" value="0">住院科室</td>
                                    <td class="ks-list mzks" value="1">门诊科室</td>
                                </tr>
                            </table>
                            <div class="body-width  over-x  margin-bottom20 ">
                               <div id="table-zy">
                                <table class="common-table" id="zyks">
                                    
                                </table>
                                </div>
                                <div style="display: none" id="table-mz" style="display: none">
                                <table class="table-mz body-width common-table border1 on-style"  id="mzks">
                                    
                                </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--弹出层-->
    <div class="setValueBgDiv"></div>
    <div class="setValueDialogDiv">
        <div class="pop-up bg-color1">
            <table class="body-width">
                <tr>
                    <td class="text-right padding-right20">
                        <img src="${staticPath }/static/img/close.png" id="setValue-closes">
                    </td>
                </tr>
            </table>
        </div>
               
        <!--违规单据-->
        <div class="ks-fy-zb ks-nm-div">
        	<div class="gauge-title-div">
	            <table class="body-width">
	                <tr>
	                    <td class="left fs_16 table-title setValue-title">医疗总费用定额设定</td>
	                </tr>
	            </table>
         	</div>
            <div class="body-width padding10 pad-top0">
                <div class="ys-rc-div">
                	<div class="mouth-table">
                		<form id="monthForm">
		                    <table class="body-width common-table data-month">
		                        <tbody>
		                        <tr class="data-month-title">
		                            <th>1月</th>
		                            <th>2月</th>
		                            <th>3月</th>
		                            <th>4月</th>
		                            <th>5月</th>
		                            <th>6月</th>
		                            <th>7月</th>
		                            <th>8月</th>
		                            <th>9月</th>
		                            <th>10月</th>
		                            <th>11月</th>
		                            <th>12月</th>
		                        </tr>
		                        <tr class="data-input">
		                           <td><input type="text" class="setValue-input  month01" name="month01"></td>
		                            <td><input type="text" class="setValue-input month02" name="month02"></td>
		                            <td><input type="text" class="setValue-input month03" name="month03"></td>
		                            <td><input type="text" class="setValue-input month04" name="month04"></td>
		                            <td><input type="text" class="setValue-input month05" name="month05"></td>
		                            <td><input type="text" class="setValue-input month06" name="month06"></td>
		                            <td><input type="text" class="setValue-input month07" name="month07"></td>
		                            <td><input type="text" class="setValue-input month08" name="month08"></td>
		                            <td><input type="text" class="setValue-input month09" name="month09"></td>
		                            <td><input type="text" class="setValue-input month10" name="month10"></td>
		                            <td><input type="text" class="setValue-input month11" name="month11"></td>
		                            <td><input type="text" class="setValue-input month12" name="month12"></td>
		                        </tr>
		                        <tr class="data-read-only">
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </form>
	                    <p class="text-center margin-top21 data-input"><button type="button" class="btn btn-info setValue-save" onclick="saveDetails()">保 存</button></p>	
	                </div>
                    <div class="clear"></div>
                    <div class="quarter-table">
                    	<form id="seasonForm">
		                    <table class="body-width common-table data-season">
		                        <tbody>
		                        <tr>
		                            <th>第一季度</th>
		                            <th>第二季度</th>
		                            <th>第三季度</th>
		                            <th>第四季度</th>
		                        </tr>
		                        <tr class="data-input">
		                            <td><input type="text" class="setValue-input season1" name="season1"></td>
		                            <td><input type="text" class="setValue-input season2" name="season2"></td>
		                            <td><input type="text" class="setValue-input season3" name="season3"></td>
		                            <td><input type="text" class="setValue-input season4" name="season4"></td>
		                        </tr>
		                        <tr class="data-read-only">
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                            <td>-</td>
		                        </tr>
		                        </tbody>
		                    </table>
		                </form>
	                    <p class="text-center margin-top21 data-input"><button type="button" class="btn btn-info setValue-save" onclick="saveDetails()">保 存</button></p>	
	                </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>

<script>
var arrValues = null;
var model={
urls:[
      '${path }/departmentPlan/departmentPlanDatagrid',  //获取  科室基金分配计划 0
      '${path }/departmentPlan/insertDepartmentPlan',	 //插入数据 1
      '${path }/departmentPlan/deleteDepartmentPlan',	 //删除数据 2
      '${path }/departmentPlan/getDepartmentPlan',	 	 //获取一行数据 3
      '${path }//department/getDepartDatagrid',	 	     //获取科室信息 4
      '${path }/departmentPlan/DepPlanOfMonth',	 		//插入月度数据  5
      '${path }/departmentPlan/DepPlanOfSeason',	 	//插入季度数据  6
      '${path }/departmentPlan/getDataOfMonth',	 		//获取月度数据  7
      '${path }/departmentPlan/delDepPlan',	 			//获取月度数据  8
      '${path }/departmentPlan/uploadDePlans',	 		//上传文件  9
  ], 
  
cols:[
      //门规病种统计
      [[  {width : '10%',title : '科室编码',field : 'ksbm',checkbox:true },
          {width : '10%',title : '年',field : 'syear',hidden:true },
          {width : '10%',title : '参保类型编码',field : 'cblxbm',hidden:true },
          {width : '10%',title : '科室',field : 'ksmc'}, 
          {width : '10%',title : '参保类型',field : 'cblx'},
          {width : '10%',title : '医疗总费用',field : 'ylzfyxe',
        	  formatter: function (value,rowData){
        		  	  if(rowData.cblxbm!='392'){
        		  		return "<span style='color:blue;cursor:pointer'>" + value + "</span>" 
        		  	  }else{
        		  		return "<span>" + value + "</span>"   
        		  	  }
                       
              }}, 
          {width : '10%',title : '住院人次',field : 'zyrc',
        	  formatter: function (value,rowData){
        		  if(rowData.cblxbm!='392'){
      		  		return "<span style='color:blue;cursor:pointer'>" + value + "</span>" 
      		  	  }else{
      		  		return "<span>" + value + "</span>"   
      		  	  } 
          }},
          {width : '10%',title : '基金限额',field : 'jjxe',
        	  formatter: function (value,rowData){
        		  if(rowData.cblxbm!='392'){
      		  		return "<span style='color:blue;cursor:pointer'>" + value + "</span>" 
      		  	  }else{
      		  		return "<span>" + value + "</span>"   
      		  	  }
          }},
          {width : '10%',title : '区域',field : 'qy'},
          {width : '10%',title : '住院天数',field : 'zytsxd'},
          {width : '14%',title : '限定患者负担比',field : 'hzfdzbxe'},
          {width : '15%',title : '限定乙类自付占比',field : 'ylzfbxe'},
          {width : '14%',title : '限定自费占比',field : 'zfbxe'},
          {width : '13%',title : '限定药占比',field : 'yzbxe'}, 
          {width : '15%',title : '限定检查检验占比',field : 'jcjyzbxe'},
          {width : '14%',title : '限定诊疗占比',field : 'zlzbxe'}, 
          {width : '14%',title : '限定耗材占比',field : 'hczbxe'}]], 
        //门规病种统计
        [[  {width : '50%',title : '科室编码',field : 'ksdm'},
            {width : '50%',title : '科室名称',field : 'ksmc'}]], 
      ]
}

    $(function () {
    	
    	getQueryData(); 
        selectRender("${path}/department/getDepartmentOfUser?kslx=qysy","#depart",{});
        selectRender("${path}/department/sbInfo","#qy",{});
        $('#selectYear,#cblxbm,#depart,#conTime,#qy').comboSelect();
        $("#selectYear").parent().css({"width":"8%"});
        $("#depart").parent().css({"width":"12%"});
        $("#cblxbm").parent().css({"width":"10%"});
        $("#qy").parent().css({"width":"10%"});
        $("#conTime").parent().find("input").css({"width":"62px"});
        search();
        getDepartments();
        $(".ks-list").click(function () {
            $(this).addClass("on-list").siblings().removeClass("on-list");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tabs >table").eq(index - 1).show().siblings().hide();
            getDepartments();
        });

        //全选,取消全选
        $(".chk-qx").click(function () {
            if ($(this).hasClass("checked") == false) {
                $(this).closest(".common-table").find("input[type=checkbox]").prop("checked", true);
                $(this).addClass("checked");
                $(this).parent().parent().siblings().addClass("active-tr");

            } else {
                $(this).closest(".common-table").find("input[type=checkbox]").prop("checked", false);
                $(this).removeClass("checked");
                $(this).parent().parent().siblings().removeClass("active-tr");
                $(this).parent().parent().siblings().removeClass("border-color");
            }
        });
        
    	$("#conTime").parent().find("li:eq(0)").click(function(){
    		$(this).addClass("option-selected");
    	})
    });
   
    /*点击保存按钮*/
    $("#save").click(function(){
    	var rows = $('#departmentPlanDatagrid').datagrid('getSelections');
    	var id = $("#dataUpdateForm input[name='id']").val();
    	getAjax(model.urls[1], JSON.stringify({"obj":$.extend($("#dataSearchForm").serializeObject(),$("#dataUpdateForm").serializeObject()),"list":arrValues}),'save');
    });
    
    
    /*点击重置按钮*/
    $("#reset").click(function(){
    	$("#dataUpdateForm").find("input").val("");
    	$("#conTime").parent().find("li:eq(1)").trigger("click");
    	$("#conTime").parent().find("li:eq(0)").trigger("click");
    	$("#departmentPlanDatagrid").datagrid('reload');
    	arrValues = null;
    });
    /*点击移除按钮*/
    $("#remove").click(function(){
    	deleteData(model.urls[2]);
    });
    /*点击修改按钮*/
    $("#update").click(function(){
    	getDataById(model.urls[3]);
    });
    
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

//下拉框渲染
function selectRender(url,id,datas){
    $.ajax({
        type:"POST",
        url:url,
        cache:false,
        async:false,
        dataType:"json",
        data:datas,
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
            }else if(id=="#qy"){
            	var obj = data.obj;
            	for(var i=0;i<obj.length;i++){
                    str+="<option value='"+obj[i].ID+"'>"+obj[i].MC+"</option>";
                }
            	$(id).empty().append($(str)); 
            }                        
        }
    })
}
	
	function departmentPlan(){
		datagridRender('#departmentPlanDatagrid',model.urls[0],model.cols[0],$("#dataSearchForm").serializeObject(),true,false);
	}
	
	function getDepartments(){
		var id ='#mzks';
		var kslx = 'mzsy';
		var index = $("#selectKs tr .on-list").attr("value");
		$("#table-zy").css("display","none");
		$("#table-mz").css("display","block");
		if(index==0)
		{
			id='#zyks';
			kslx='zysy';
			$("#table-zy").css("display","block");
			$("#table-mz").css("display","none");
		}
		datagridRender(id,model.urls[4],model.cols[1],{kslx:kslx},false,true);
	}
	
	//datagrid
	function datagridRender(id,url,col,params,flag1,flag2){
	    $(id).datagrid({
	        url:url,
	        fit:false,
	        striped:false,
	        queryParams:params,
	        pagination : true,
	        //rownumbers:true,
	        //singleSelect : flag1,
	        checkOnSelect:flag2,
	        pageSize : 10,
	        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	        columns:col,
	        onBeforeLoad: function (param) {
	            updateDatagridHeader(this);
	        },
	        onLoadSuccess:function(data){
	            window.onresize=function(){                            
	                $(id).datagrid('resize');//列表随屏幕大小变化
	            }
	            $("#conTime").parent().find("li:eq(1)").trigger("click");
	        	$("#conTime").parent().find("li:eq(0)").trigger("click");
	        	var cblxbm = $("#cblxbm").val();
	        	if(cblxbm==390){
		        	$('#departmentPlanDatagrid').datagrid('showColumn', 'qy');
	        	}else{
	        		$('#departmentPlanDatagrid').datagrid('hideColumn', 'qy');
	        	}
	        },
	        //点击表格数据 总医疗费用、住院人次、基金限额 弹框展示设定的金额
	        onClickCell: function(index,field,value){	
	        	 var rows = $('#departmentPlanDatagrid').datagrid('getRows')[index];
	        	 $(".data-read-only").find('td').text('');
	    		if('ylzfyxe' == field){
	    			getValueTable(field,rows.id);
	    			$(".setValue-title").text('医疗总费用定额查看');
	    		}
	    		else if('zyrc' == field){
	    			getValueTable(field,rows.id);
	    			$(".setValue-title").text('住院人次定额查看');
	    		}
	    		else if('jjxe' == field){
	    			getValueTable(field,rows.id);
	    			$(".setValue-title").text('基金限额查看');
	    		}
	    	}
	    })
	}
	
	
	function getAjax(url,param,type){
		$.ajax({
	        type:"POST",                      //请求类型
	        url:url, //URL
	        data:param,   //传递的参数
	        contentType: "application/json",
	        success:function(data){
	           if(type=='save'){
	        	  $("#dataUpdateForm input[name='id']").val('');
	        	  $.messager.alert('提示', data, 'info');
	        	  search();
	           }
	        },
	        error:function(data) {
	        	$.messager.alert('警告', "保存失败", 'warn');
	        }
	  });
	}
	
	
	//form表单数据格式化
	$.fn.serializeObject = function() {
	    var o = {};
	    var a = this.serializeArray();
	    $.each(a, function() {
	        if (o[this.name] !== undefined) {
	            if (!o[this.name].push) {
	                o[this.name] = [o[this.name]];
	            }
	            o[this.name].push(this.value || '');
	        } else {
	            o[this.name] = this.value || '';
	        }
	    });
	    return o;
	};
	
	function search(){
		departmentPlan();
		$("#reset").trigger("click");
	}
	
	function deleteData(url){
		var id=null;
        var rows = $('#departmentPlanDatagrid').datagrid('getSelections');
        /* if(rows.length>1){
       	 $.messager.alert( '提示', "只能选一行 ", 'warning');
       	 return 
        }else  */
        //console.log(rows[0].id);
        if(rows.length<1){
       	 $.messager.alert( '提示', "请至少选一行", 'warning');
       	 return 
        }else{
	       	for(var i=0;i<rows.length;i++){
	       		if(id==null){
	       			id=rows[i].id;
	       		}else{
	       			id=id+','+rows[i].id;
	       		}
	       	}
        };
        $.messager.confirm('提示', '确定删除选中行', function(result){
        	if(result){
        		 $.post(url, {
           		     ids : id
                  }, function(result) {
                	  search();
                  }, 'JSON');
        	}
        });
	}
	
	function getDataById(url){
		var id=null;
        var rows = $('#departmentPlanDatagrid').datagrid('getSelections');
        if(rows.length>1){
       	 $.messager.alert( '提示', "只能选一行 ", 'warning');
       	 return 
        }else if(rows.length<1){
       	 $.messager.alert( '提示', "请选一行", 'warning');
       	 return 
        }else{
        	id=rows[0].id;
        	 $("#dataUpdateForm input[name='id']").val(id);
        };
        $.post(url, {
  		     id : id
         }, function(result) {
        	 $.each(result,function(i,value){
        		 if(i=='kfsjfs'){
        			 if(value==1){
        			     $("#conTime").parent().find("li:eq(0)").trigger("click");
        			 }else if(value==2){
        				 $("#conTime").parent().find("li:eq(1)").trigger("click");
        			 }else{
        				 $.messager.alert( '提示', "数据存在问题", 'warning');
        			 }
        		 }else{
        			 $("#dataUpdateForm input[name="+i+"]").val(value); 
        		 }
        	 })
         }, 'JSON');
	}
	
    $("a,button").focus(function () {
        this.blur()
    });
//导出excel
function excelExport(){
    var url = "${path }/excel/exportDepartPlan";
    $("#dataSearchForm").attr("action", url);
    $("#dataSearchForm").submit();
}
/*弹出框*/
function getValueTable(field,id){
	$(".data-input").hide();
	$(".data-read-only").show();
	$(".setValueBgDiv").css({display: "block", height: $(document).height()});
	$(".setValueDialogDiv").css("display", "block");
	document.documentElement.scrollTop = 0;
    $.ajax({
        type:"POST",
        url:model.urls[7],
        cache:false,
        async:false,
        dataType:"json",
        data:{'ksfptype':field,'id':id},
        success:function(data){
      		var type = data.type;
      		if(type=='month'){
      			isMonthOrSeason("月度");
      			$.each(data,function(i,val){
      				if(Number(i.substring(5,7))>0){
      					$('.data-read-only').eq(0).find('td').eq(Number(i.substring(5,7))-1).text(val);
      				} 
      			});
      		}else if(type=='season'){
      			isMonthOrSeason("季度");
      			$.each(data,function(i,val){
      				if(Number(i.substring(6,7))>0){
      					$('.data-read-only').eq(1).find('td').eq(Number(i.substring(6,7))-1).text(val);
      				} 
      			});
      		}else{
      			$(".setValueBgDiv").css({display: "none", height: $(document).height()});
      			$(".setValueDialogDiv").css("display", "none");
      			$.messager.alert('消息', '无详情指标', 'info');
      		}
        }
    })
}
$(".data-input,.data-read-only").hide();
// 点击弹出框按钮
$(".sum-cost,.hospital-count,.limits").click(function () {
    // 判断是谁点击进来的 
    if($(this).hasClass("sum-cost")){
    	$(".data-input").show();
    	$(".data-read-only").hide();
        $(".setValue-title").text('医疗总费用定额设定');
    }
    else if($(this).hasClass("hospital-count")){
    	$(".data-input").show();
    	$(".data-read-only").hide();
    	$(".setValue-title").text('住院人次定额设定');
    }
    else{
    	$(".data-input").show();
    	$(".data-read-only").hide();
    	$(".setValue-title").text('基金限额设定');
    }
    cleanMonthAndSeason();
    popupLayer("block");
    var rows = $('#departmentPlanDatagrid').datagrid('getSelections');
    // 选中一项时
    if(rows.length==1){
    	$('.data-input').val('');
    	var data = getDetailsByRow(rows);
  		var type = data.type;
  		if(type=='month'){
  			isMonthOrSeason("月度");
  			$.each(data,function(i,val){
  				if(Number(i.substring(5,7))>0){
  					$('.data-input').eq(0).find('input').eq(Number(i.substring(5,7))-1).val(val);
  				} 
  			});
  			$("#conTime").parent().find("li:eq(0)").trigger("click");
  		}else if(type=='season'){
  			isMonthOrSeason("季度");
  			$.each(data,function(i,val){
  				if(Number(i.substring(6,7))>0){
  					$('.data-input').eq(2).find('input').eq(Number(i.substring(6,7))-1).val(val);
  				} 
  			});
  			$("#conTime").parent().find("li:eq(1)").trigger("click");
  		}else{
  			var vals = $("#conTime  option:selected").text();
  		    isMonthOrSeason(vals);
  		}
    }else{
    	// 未选中  或 选中多个（2个以上）
	    var vals = $("#conTime  option:selected").text();
	    isMonthOrSeason(vals);
	    popupLayer("block");
    }
});

// 弹出层确认按钮
$('.messager-button').find('span .l-btn-text:eq(0)').click(function(){
	popupLayer("block");
})

// 弹出层取消按钮
$('.messager-button').find('span .l-btn-text:eq(1)').click(function(){
	//popupLayer("block");
})

// 当且仅当选中一项时，获取指标详情
function getDetailsByRow(rows){
	var id = rows[0].id;
	var data;
		$.ajax({
	        type:"POST",
	        url:model.urls[7],
	        cache:false,
	        async:false,
	        dataType:"json",
	        data:{'ksfptype':$(".setValue-title").text(),'id':id},
	        success:function(result){
	        	data = result;
	        }
	    });
		return data
    
}

//判断月度还是季度
function isMonthOrSeason(vals){
	 if(vals == "月度"){
	    	$(".mouth-table").css("display", "block");
	    	$(".quarter-table").css("display", "none");
	    }
	    else{
	    	$(".mouth-table").css("display", "none");
	    	$(".quarter-table").css("display", "block");
	    }
}

// 弹出层判定
function popupLayer(flag){
    
    //获取被按下按钮的索引值，需要注意index是从0开始的
    $(".setValueBgDiv").css({display: flag, height: $(document).height()});
    $(".setValueDialogDiv").css("display", flag);
    document.documentElement.scrollTop = 0;
}

$(".setValueBgDiv,#setValue-closes,.setValue-save").click(function () {
    $(".setValueBgDiv").css("display", "none");
    $(".setValueDialogDiv").css("display", "none");
});

	// 月度、季度分配详情
	function saveDetails(){
	    //判断月度还是季度
	    var vals = $("#conTime  option:selected").text();
	    var arrsMonthOrSeason;
	    var url;
	    var param = null;
	    var flag = -1; // -1 表示没有重复数据   0，1，2 表示存在重复数据的下标  表示医疗费 、人次定额、基金限额
	    // 设置的详情均不为空时 才允许操作 保证插入到数据有值
	    if(setValueHasNotNull(vals)){
	    	if(vals == "月度"){
		    	arrsMonthOrSeason = ['month01','month02','month03','month04','month05','month06',
				                 		'month07','month08','month09','month10','month11','month12'];
		    	url = model.urls[5];
		    	param = $.extend($("#monthForm").serializeObject(),$("#dataSearchForm").serializeObject(),{"kfsjfs":'1',"ksfptype":$(".setValue-title").text()});
		    }
		    else{
		    	arrsMonthOrSeason = ['season1','season2','season3','season4'];
		    	url = model.urls[6];
		    	param = $.extend($("#seasonForm").serializeObject(),$("#dataSearchForm").serializeObject(),{"kfsjfs":'2',"ksfptype":$(".setValue-title").text()});
		    }
		    if(arrValues!=null){
			    for (var i = 0; i < arrValues.length; i++) {
					if(arrValues[i].ksfptype==param.ksfptype){
						flag = i;
					}
				}
		    }else{
		    	arrValues = new Array();
		    }
		    
		    //弹出框存在数据输入 
		    if(setValue(arrsMonthOrSeason)>0){
		    	// 更新    数据时
		    	if(flag>=0) { arrValues[i] = param;  }
		    	// 新增    数据时
		    	if(flag==-1){ arrValues.push(param); }
		    }
	    }
	}
	
	function setValue(arrs){
		var total = 0;
		for(var i=0;i<arrs.length;i++){
			var num = Number($("."+arrs[i]).val());
			if(isNaN(num)){
				$.messager.alert('消息', '请输入正确的数值', 'warn');
				return -1;	
			}
			total+=num;
		}
		if(total!=0){
			var text = $(".setValue-title").text();
			if(text=='医疗总费用定额设定'){
				$('input[name="ylzfyxe"]').val(total);
			}else if(text=='住院人次定额设定'){
				$('input[name="zyrc"]').val(total);
			}else if(text=='基金限额设定'){
				$('input[name="jjxe"]').val(total);
				
			}
		}
		return total;
	}
	
	// 清空月度 、季度分配列表
	function cleanMonthAndSeason(){
		$('.setValue-input').val('');
	}
	
	// 参保类型变化
	function cblxChange(val){
		if(val=='390'){
			$('.others').show();
			$('.qy').show();
		}
		if(val=='391'){
			$('.others').show();
			$('.qy').hide();
		}
		if(val=='392'){
			$('.others').hide();
			$('.qy').hide();
		}
	}
	
	// 控费时间方式变化
	function kfsjfsChange(val){
		var id = $("#dataUpdateForm input[name='id']").val();
		var rows = $('#departmentPlanDatagrid').datagrid('getSelections');
		if(rows.length==1&&id!=""&&id!=null){
			//$("#conTime").parent().find("li:eq(0)").trigger("click");
			var data = getDetailsByRow(rows);
			$('.data-input').val('');
      		var type = data.type;
        	if(type=="month"){
        		if(val==2){
        			$.messager.confirm('提示','当前控费方式为月度，如果修改为季度，已经设定的月度定额将会置空。请确认！'
      						,function(r){
      							if(r)
      							{'确定',$.post(model.urls[8], {"id":id}),$("#conTime").parent().find("li:eq(1)").trigger("click");}
      							{'取消'}
      						});
        		}
        	}else if(type=="season"){
        		if(val==1){
        			$.messager.confirm('提示','当前控费方式为季度，如果修改为月度，已经设定的季度定额将会置空。请确认！'
      						,function(r){
      							if(r)
      							{'确定',$.post(model.urls[8], {"id":id}),$("#conTime").parent().find("li:eq(0)").trigger("click");}
      							{'取消'}
      						});
        		}
        	}
	}else if(rows.length!=1&&id!=""&&id!=null){
		$("#dataUpdateForm").find("input").val("");
		$(".data-input").find("input").val("");
		$("#conTime").parent().find("li:eq(1)").trigger("click");
    	$("#conTime").parent().find("li:eq(0)").trigger("click");
	}else if(rows.length!=1&&(id==""||id==null)){
		$(".data-input").find("input").val("");
		arrValues = null;
	}
}
	// 判断输入的数据是否为空
	function setValueHasNotNull(vals){
		var statu = true;
		if(vals=="月度"){
	    	// 一旦输入月度限额详情，则每一个月都必须有值
	    	var monthParams = $("#monthForm").serializeObject();
	    	$.each(monthParams,function(index,obj){
	    		if(obj==""){
	    			statu = false;
	    			var month = parseInt(index.substring(5,7))
	    			$.messager.alert("提示", "存在月份数据为空", 'info');
	    			return false;
	    		}
	    	});
		}else{
			// 一旦输入季度限额详情，则每一个季度都必须有值
	    	var seasonParams = $("#seasonForm").serializeObject();
	    	$.each(seasonParams,function(index,obj){
	    		if(obj==""){
	    			statu = false;
	    			var season = parseInt(index.substring(6,7));
	    			$.messager.alert("提示", "存在季度数据为空", 'info');
	    			return false;
	    		}
	    	});
		}
		return statu;
	}
	
	function excelImport(){
	    window.location.href = "${path }/excel/exportDepartPlanTemp";
	}
	
	$('#file_form').form({
  		 url :model.urls[9],
  		onSubmit : function() {
           $("#hidYear").val($("#selectYear").val());
           $("#hidCblxbm").val($("#cblxbm").val());
           $("#hidQy").val($("#qy").val());
           if($("#file_input").val()==null||$("#file_input").val()==''){
        	   $.messager.alert('提示', '请选择文件', 'info'); 
        	   return false;
           }
        },
         success : function(data) {
        	 var msg = JSON.parse(data).msg;
	         $.messager.alert('消息', msg, 'info');
	         search();
         }
  	 });
	
	$(function () { $("[data-toggle='tooltip']").tooltip(); });
		
</script>
</body>
</html>