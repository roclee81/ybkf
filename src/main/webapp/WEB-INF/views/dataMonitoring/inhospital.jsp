<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ include file="/commons/global.jsp"%>
<%-- <%@ include file="/commons/basejs.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>在院监控</title>
<%-- <script src="${path }/static/js/jquery-1.10.1.min.js"></script> 

 <script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/js/datagrid-filter.js"></script>
<script src="${path }/static/extJs.js"></script>
--%>

<link href="${path }/static/css/common.css" rel="stylesheet">
<script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
<script
	src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet"> 
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css"
	href="${staticPath }/static/easyui/themes/icon.css" />
<script src="${path }/static/js/jquery-1.10.1.min.js"></script> 
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${staticPath }/static/js/common.js"></script>
<script src="${staticPath}/static/js/jquery.combo.select.js"></script>
<script src="${staticPath}/static/js/jquery.serializejson.js"></script>
<script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
<script
	src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<style>
.see-dot-msg-table td {
	width: 8%
}

.zy-day p {
	margin: 0 !important;
}

.see-dot-msg-table td {
	white-space: nowrap;
}

.ScrLts li .C_hre {
	width: 50% !important;
}

.ScrLts li .C_hre>p {
	line-height: 16px !important;
}

.ScrLts table tbody tr>td {
	width: 20%;
	padding-top: 20px;
	padding-bottom: 8px
}

.ScrLts table tbody tr td p>font {
	color: #666666
}

.half-body-width {
	width: 54% !important;
}
.tab-div-box1 border-val {
    height: auto;
    padding: 0 0 15px;
}
.combo-select,.form_date{display:inline-block;}
#queryparameter{height:30px;}
</style>
</head>
<body>
	<!--筛选条件-->
	<div class="header-div bg-color">
			<form id="queryparameter" method="post" class="padding-left20">			
						<span class="fs_16">入院日期</span>
							
								<div class="input-group date form_date">
									<input class="padding-left4" size="10" type="text"
										 name="syearmonth" id="syearmonth"> <span
										class="input-group-addon" style="display:inline-block;width:24px;"><span
										class="glyphicon-calendar"></span></span>
								</div>
							
							<span class="fs_16 pdl3p">科室</span>
							
							<select id="depart" name="ksbm"></select>
							<span class="fs_16 pdl3p">医师</span>
					
								<select id="doctor" name="ysgh"></select>
	
							<span class="fs_16 pdl3p">参保类型</td>
							<select id="cblxbm" name="cblxbm">
									<option value="000">全部</option>
									<option value="390">城乡居民</option>
									<option value="391">城镇职工</option>
									<option value="392">省直医保</option>
							</select>
							<span class="fs_16 pdl3p">就医方式</td>
							<td><select id="jyfs" name="jyfs">
									<option value="0">全部</option>
									<option value="21">普通住院</option>
									<option value="22">单病种</option>
							</select>
							<div style="display:inline-block;margin-left:2%">
								<button class="btn btn-info btn-sm" type="button" id="searchdata">
									<img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span>
								</button>
							</div>

			</form>
		<div class="clear"></div>
	</div>
	<div class="bg-color main-div margin-top10" style="min-height: 94.5%">
		<div class="tab-div-box">
			<!--指标监控-->
			<div>
				<div class="yb-jj-div">
					<table style="width: 60%; margin: 0 auto">
						<tr style="margin-bottom: 10px">
							<td></td>
							<td class="text-center">
								<p class="padding-top10" id="zy">
									在院<span class="zy-style">-</span>例
								</p>
							</td>
							<td class="text-center">
								<p class="padding-top10" id="ptzy">
									普通住院<span class="zy-style">-</span>例
								</p>
							</td>
							<td class="text-center" id="dbz">
								<p class="padding-top10">
									单病种<span class="zy-style">-</span>例
								</p>
							</td>
							<td class="text-center" id="fyyc">
								<p class="padding-top10">
									费用指标异常<span class="zy-style">-</span>例
								</p>
							</td>
							<td class="text-center" id="shwg">
								<p class="padding-top10">
									审核违规<span class="zy-style">-</span>例
								</p>
							</td>
							<td></td>
						</tr>
					</table>
				</div>
				<div class="clear module-hr"></div>
				
			</div>
			<div class="clear module-hr"></div>
			<!--患者监控-->
			<div class="main-rj-fy">
				<div class="ks-fy-zb">
					<div class="body-width padding10">
						<div>
							<table class="body-width" id="inhospitalpatient">
								<tr>
									<td class="left fs_16 table-title ">在院患者列表</td>
									<td class="right">
										<button class="btn btn-sm btn-info" type="button" onclick="excelExport()">
											<img src="${staticPath }/static//img/menu/btn1-icon.png">导出
										</button>
									</td>
								</tr>
							</table>
						</div>
						<div class="ys-rc-div">
							<table class="body-width common-table" id="Ys_div">
								<tbody>
								
								</tbody>
							</table>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<input type="hidden" id="zylsh" name="zylsh"/>
				<div class="yb-jj-div margin-top20">
					<div class="padding10">
						<div class="float tab-div" style="width: 80%;">
							<div class="tab-div-menu jb-ul-li">
								<ul class="ul-style" id="ul-two">
									<li><label class="x-on" style="margin-left: -2px">就诊信息</label> </li>
									<li><label>费用指标预警</label></li>
									<li><label>审核违规</label></li>
									<!-- <li><label>自费提醒</label></li> -->
									<!-- <li><label>出院带药</label></li> -->
									<!-- <li><label>医保对账</label></li> -->
									<li><label>医嘱明细</label></li>
									<li><label>费用明细</label></li>

								</ul>
							</div>
						</div>

						<div class="clear"></div>
						<div class="tab-div-box1 border-val" style="  padding: 0 0 15px">
							<!--就诊信息-->
							<div class="margin-top10" style="width: 98%;">
								<div class="body-width margin-left10 see-dot-msg-header fs_16">
									<label class="edges-icon1"></label>就诊信息
								</div>
								<table class="see-dot-msg-table margin-top10 half-body-width" id="diagnosisinfo">
									
								</table>
								<div class="body-width margin-left10 see-dot-msg-header">
									<label class="edges-icon1"></label>诊断信息
								</div>
								<table
									class="zd-table margin-top10 margin-left10 half-body-width" id="zstable">
									
								</table>
							</div>
							<!--费用指标预警-->
							<div class="margin-top10" style="display: none; width: 98%">
								<div class="body-width margin-left10 see-dot-msg-header fs_16">
									<label class="edges-icon1"></label>费用指标预警
								</div>
								<table class="see-dot-msg-table half-body-width margin-top10" id="costwarning">
									
								</table>
							</div>
							<!--审核违规-->
							<div style="display: none;">
								<div class="yb-jj-div">
									<div class="ys-rc-div margin-top20">
										<table class="common-table" id="auditviolations">
											<tbody>
											
											</tbody>
										</table>
									</div>
								</div>

							</div>
							
							<!--医嘱明细-->
							<div style="display: none;">
								<div class="yb-jj-div">
									<div class="ys-rc-div margin-top20">
										<table class="common-table" id="orderdetails">
											<tbody>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
							<!--费用明细-->
							<div style="display: none;">
								<div class="yb-jj-div">
									<div class="ys-rc-div margin-top20">
										<table class="common-table" id="chargedetails">
											<tbody>
												
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
		var zylsh = "" ,linum =0;
        $(function () {
        	 selectRender("${path}/department/getDepartmentOfUser?kslx=zysy","#depart",{});
        	 var ksbm = $("#depart").val();
        	 selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor",{});
        	 $("#depart").change(function(){        
        	        var ksbm=$(this).val();
        	        selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor",{});
        	    })
            /* 日期插件*/
            $('.form_date').datetimepicker({
                format: 'yyyy-mm-dd',
                minView: 'month',
                language: 'zh-CN',
                autoclose: true,
                todayBtn: true//显示今日按钮
            });

            $(".sort-ul li").click(function () {
                $(this).addClass("selected-li").siblings().removeClass("selected-li");
            });


            $(".tab-div-menu ul li").click(function () {
                //切换选中的按钮高亮状态
                var index = $(this).index();
                $("#ul-two li").eq(index).find('label').addClass("x-on");
                $("#ul-two li").eq(index).siblings().children().removeClass("x-on");

                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-div-box1 > div").eq(index).show().siblings().hide();
                linum = index;
                var num = $("#zylsh").val();
                visitInfo(num);
            });
            
            $("#searchdata").click(function(){
            	zylsh = "";
            	examplenumber();
            	inhospitalpatient();
            });
            
            $("#depart,#doctor,#cblxbm,#jyfs").comboSelect();
            $("#doctor,#cblxbm,#jyfs").parent().css({"width":"10%"});
            $("#depart").parent().css({"width":"12%"});
            examplenumber();
            inhospitalpatient();
            
        });

      $("a,button").focus(function () {
          this.blur()
      });
        
      
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
    	            }            

    	            
    	        }
    	    })
    	} 
        function examplenumber() {
        	$.ajax({
        		url:"${path}/hospitalized/getExampleNumber",
        		cache: false,
        	    async : false,
        		type:"post",
        		datatype:"json",
        		data:$("#queryparameter").serialize(),
        		success:function(data){
        			var datajson = JSON.parse(data);
        			//console.log(datajson);
        			/* $("#zy").html("在院<span class='zy-style'>"+datajson[0].zy+"</span>例");
        			$("#ptzy").html("普通住院	<span class='zy-style'>"+datajson[0].zy+"</span>例");
        			$("#dbz").html("单病种<span class='zy-style'>"+datajson[0].zy+"</span>例");
        			$("#fyyc").html("费用指标异常<span class='zy-style-p'>"+datajson[0].zy+"</span>例");
        			$("#shwg").html("审核违规<span class='zy-style-p'>"+datajson[0].zy+"</span>例");
        			$("#zftx").html("自费提醒<span class='zy-style-p'>"+datajson[0].zy+"</span>例");
        			$("#cydywg").html("出院带药违规<span class='zy-style-p'>"+datajson[0].zy+"</span>例");
        			$("#ybdzyc").html("医保对账异常<span class='zy-style-p'>"+datajson[0].zy+"</span>例"); */
        			$("#zy").html("在院<span class='zy-style'>"+datajson[0].ptzy+"</span>例");
        			$("#ptzy").html("普通住院	<span class='zy-style'>"+datajson[0].ptzy+"</span>例");
        			$("#shwg").html("审核违规	<span class='zy-style'>"+datajson[0].shwg+"</span>例");
        		}
        	})
        	
        	
		}
        
        function inhospitalpatient(){
      			$('#Ys_div').datagrid({
      		        url : '${path }/hospitalized/getInhospatientGrid',
      		        fit : false,
      		        striped : true,
      		        queryParams:$("#queryparameter").serializeJSON(),
  			      	fit : false,
  			      	striped : false,
  			      	pagination : true,
  			     	nowrap : false,
  			     	singleSelect:true,
      		        pageSize : 10,
      		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
      		        columns : [ [
      		        {
      		            width : '20%',
      		            title : '就诊日期',
      		            field : 'indate' 
      		        },{
      		            width : '18%',
      		            title : '身份证号',
      		            field : 'idcare'
      		      
      		        }, {
      		            width : '10%',
      		            title : '床位号',
      		            field : 'brch'
      		      
      		        },{
      		            width : '10%',
      		            title : '患者姓名	',
      		            field : 'name',
      		          formatter: function (value, rowData, rowIndex) {    
      		        	  
      		        	  
                          return "<a style='color:green' href='javascript:void(0);' onclick=visitInfo('" + rowData.zyh + "');>" + value + "</a>";
                   }
      		      
      		        },{
      		            width : '12%',
      		            title : '参保类型',
      		            field : 'cblx'
      		      
      		        },{
      		            width : '10%',
      		            title : '就医方式',
      		            field : 'jyfs'
      		      
      		        },{
      		            width : '10%',
      		            title : '科室',
      		            field : 'ksmc'
      		      
      		        },{
      		            width : '10%',
      		            title : '医师',
      		            field : 'ysmc'
      		      
      		        },{
      		            width : '10%',
      		            title : '医疗费用(元)',
      		            field : 'ylfy'
      		      
      		        },{
      		            width : '10%',
      		            title : '医保内金额(元)',
      		            field : 'ybnje'
      		      
      		        },{
      		            width : '10%',
      		            title : '乙类自付(元)',
      		            field : 'ylzf'
      		      
      		        },{
      		            width : '10%',
      		            title : '自费金额(元)',
      		            field : 'zfje'
      		      
      		        }
      		        ] ],
      		        onBeforeLoad: function (param) {
      		        	updateDatagridHeader(this);
      		        },
      		       	onLoadSuccess:function(data){
      		       		if(data.rows.length!=0)
      		       		{
    	      		       	if(zylsh==""||zylsh==null)
    	      	        	{
    	      		       		$('#Ys_div').datagrid("selectRow", 0);
    	      	            	var row = $('#Ys_div').datagrid("getSelections");
    	      	            	if(row[0]!=undefined)
    	      	            	{
    	      	            		visitInfo(row[0].zyh);
    	      	            	}
    	      	        	}      		       			
      		       		}else
      		       		{
      		       			zylsh = "123";	// 任意取值，清空datagrid中的数据
      		       			visitInfo(zylsh);
      		       		}
      		       		$("#Ys_div").datagrid('resize');
      		       		window.onresize=function(){
      		       			$("#Ys_div").datagrid('resize');
      		       		}
      		       	}
      		    });
        }
        
        function visitInfo(num) {
	         $("#zylsh").val(num);
        	 if(0==linum){//console.log("就诊信息")
        		 diagnosisinfo(num);
        	 }
        	 if(1==linum){//console.log("费用指标预警")
        		 costwarning(num);
        	 }
        	 if(2==linum){//console.log("审核违规")
        		 auditviolations(num);
        	 }
        	 /* if(3==linum){//console.log("出院带药")
        		 dischargedmedicine(num);
        	 } */ 
        	 if(3==linum){//console.log("医嘱明细")
        		 orderdetails(num);
        	 }
        	 if(4==linum){//console.log("费用明细")
        		 chargedetails(num);
        	 } 
        	
        	
		}
        
        function diagnosisinfo(num) {
        	if(num==null||num==""||num=="123"){
    			var html="<tr>\n" +
    			"	<td>身份证号:</td>\n" +
    			"	<td>--</td>\n" +
    			"	<td>参保人:</td>\n" +
    			"	<td>--</td>\n" +
    			"	<td>人员类别:</td>\n" +
    			"	<td>--</td>\n" +
    			"	<td>年龄:</td>\n" +
    			"	<td>--</td>\n" +
    			"	<td>性别:</td>\n" +
    			"	<td>--</td>\n" +
    			"</tr>\n" +
    			"<tr>\n" +
    			"	<td>就医方式 :</td>\n" +
    			"	<td>--</td>\n" +
    			"	<td>入院日期:</td>\n" +
    			"	<td>--</td>\n" +
    			"</tr>"
	
				$("#diagnosisinfo").html(html);	        	
		    	var html1 = "	<tr>\n" +
				        	"		<td>入院诊断:</td>\n" +
				        	"		<td>--</td>\n" +
				        	"		<td>其他诊断 :</td>\n" +
				        	"		<td>--</td>\n" +
				        	"	</tr>";
				$("#zstable").html(html1); 
				return false;
        	}
        	
        		$.ajax({
            		url:"${path}/hospitalized/getDiagnosisInfo",
            		cache: false,
            	  async : false,
            		type:"post",
            		datatype:"json",
            		data:{zylsh:num},
            		success:function(data){
            			var datajson = JSON.parse(data);
            			jsonstr = datajson.obj[0];       			
            			var html="<tr>\n" +
    		        			"	<td>身份证号:</td>\n" +
    		        			"	<td>"+jsonstr.idcar+"</td>\n" +
    		        			"	<td>参保人:</td>\n" +
    		        			"	<td>"+jsonstr.name+"</td>\n" +
    		        			"	<td>人员类别:</td>\n" +
    		        			"	<td>"+jsonstr.rylb+"</td>\n" +
    		        			"	<td>年龄:</td>\n" +
    		        			"	<td>"+jsonstr.nl+"</td>\n" +
    		        			"	<td>性别:</td>\n" +
    		        			"	<td>"+jsonstr.xb+"</td>\n" +
    		        			"</tr>\n" +
    		        			"<tr>\n" +
    		        			"	<td>就医方式 :</td>\n" +
    		        			"	<td>"+jsonstr.jyfs+"</td>\n" +
    		        			"	<td>入院日期:</td>\n" +
    		        			"	<td>"+jsonstr.indate+"</td>\n" +
    		        			"</tr>"
            		
            			$("#diagnosisinfo").html(html);	        	
    		        	var html1 = "	<tr>\n" +
    					        	"		<td>入院诊断:</td>\n" +
    					        	"		<td>"+jsonstr.ryzd+"</td>\n" +
    					        	"		<td>其他诊断 :</td>\n" +
    					        	"		<td>"+jsonstr.qtzd+"</td>\n" +
    					        	"	</tr>";
            			$("#zstable").html(html1);       			
            		}
            	})
        	
        	
        	
			
		}
        
        function costwarning(num) {
        	if(num==null||num==""||num=="123"){
        		var html =  "	<tr>\n" +
    			"		<td >医保金额(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>人均基金限额(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>\n" +
    			"	<tr>\n" +
    			"		<td>住院天数:</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>限定住院时间:</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>\n" +
    			"	<tr>\n" +
    			"		<td>自费(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>自费比:</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>限定自费比:</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>\n" +
    			"	<tr>\n" +
    			"		<td>药费(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>药占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>限定药占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>\n" +
    			"	<tr>\n" +
    			"		<td>检查检验费(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>检查检验占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>限定检查检验占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>\n" +
    			"	<tr>\n" +
    			"		<td>诊疗费(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>诊疗占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>限定诊疗占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>\n" +
    			"	<tr>\n" +
    			"		<td>材料费(元):</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>材料占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"		<td>限定材料占比:</td>\n" +
    			"		<td>--</td>\n" +
    			"	</tr>";
    			
			$("#costwarning").html(html); 
				return false;
        	}
        		$.ajax({
            		url:"${path}/hospitalized/getCostWarning",
            		cache: false,
            	    async : false,
            		type:"post",
            		datatype:"json",
            		data:{zylsh:num},
            		success:function(data){
            			var dataJson = JSON.parse(data);
            		
            			datajson = dataJson.obj[0];
            	
            			
            			var html =  "	<tr>\n" +
    			        			"		<td>医保金额(元):</td>\n" +
    			        			"		<td>"+datajson.ybje+"</td>\n" +
    			        			"		<td>人均基金限额(元):</td>\n" +
    			        			"		<td>"+datajson.rjjjxe+"</td>\n" +
    			        			"	</tr>\n" +
    			        			"	<tr>\n" +
    			        			"		<td>住院天数:</td>\n" +
    			        			"		<td>"+datajson.zyts+"天</td>\n" +
    			        			"		<td>限定住院时间:</td>\n" +
    			        			"		<td>"+datajson.xdzysj+"天</td>\n" +
    			        			"	</tr>\n" +
    			        			"	<tr>\n" +
    			        			"		<td>自费(元):</td>\n" +
    			        			"		<td>"+datajson.zf+"</td>\n" +
    			        			"		<td>自费比:</td>\n" +
    			        			"		<td>"+datajson.zfb+"</td>\n" +
    			        			"		<td>限定自费比:</td>\n" +
    			        			"		<td>"+datajson.xdzfb+"</td>\n" +
    			        			"	</tr>\n" +
    			        			"	<tr>\n" +
    			        			"		<td>药费(元):</td>\n" +
    			        			"		<td>"+datajson.yf+"</td>\n" +
    			        			"		<td>药占比:</td>\n" +
    			        			"		<td>"+datajson.yfb+"</td>\n" +
    			        			"		<td>限定药占比:</td>\n" +
    			        			"		<td>"+datajson.xdyfb+"</td>\n" +
    			        			"	</tr>\n" +
    			        			"	<tr>\n" +
    			        			"		<td>检查检验费(元):</td>\n" +
    			        			"		<td>"+datajson.jcjyf+"</td>\n" +
    			        			"		<td>检查检验占比:</td>\n" +
    			        			"		<td>"+datajson.jcjyfzb+"</td>\n" +
    			        			"		<td>限定检查检验占比:</td>\n" +
    			        			"		<td>"+datajson.xdjcjyfzb+"</td>\n" +
    			        			"	</tr>\n" +
    			        			"	<tr>\n" +
    			        			"		<td>诊疗费(元):</td>\n" +
    			        			"		<td>"+datajson.zlf+"</td>\n" +
    			        			"		<td>诊疗占比:</td>\n" +
    			        			"		<td>"+datajson.zlfzb+"</td>\n" +
    			        			"		<td>限定诊疗占比:</td>\n" +
    			        			"		<td>"+datajson.xdzlfzb+"</td>\n" +
    			        			"	</tr>\n" +
    			        			"	<tr>\n" +
    			        			"		<td>材料费(元):</td>\n" +
    			        			"		<td>"+datajson.clf+"</td>\n" +
    			        			"		<td>材料占比:</td>\n" +
    			        			"		<td>"+datajson.clfzb+"</td>\n" +
    			        			"		<td>限定材料占比:</td>\n" +
    			        			"		<td>"+datajson.xdclfzbzb+"</td>\n" +
    			        			"	</tr>";
    			        			
            				$("#costwarning").html(html);
            		}
            	})
        	
		}
        
        function auditviolations(num) {
        			if(num==""||num==null){
        				return false;
        			};
      
          			$('#auditviolations').datagrid({
          		        url : '${path }/hospitalized/getAuditViolations',
          		        fit : false,
          		        striped : true,
          		        queryParams: {zylsh:num} ,
      			 	  	singleSelect:true,
      			      	fit : false,
      			      	striped : true,
      			      	pagination : true,
      			     	nowrap : true,
          		        pageSize : 10,
          		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
          		        columns : [ [
          		        {
          		            width : '10%',
          		            title : '项目编码',
          		            field : 'xmbm'
          		        },{
          		            width : '20%',
          		            title : '项目名称',
          		            field : 'xmmc'
          		        },{
          		            width : '30%',
          		            title : '违反规则',
          		            field : 'wfgz'
          		      
          		        },{
          		            width : '40%',
          		            title : '提示说明',
          		            field : 'tssm'
          		      
          		        }
          		        ] ],
          		        onBeforeLoad: function (param) {
          		        	updateDatagridHeader(this);
          		        },
          		        onLoadSuccess:function(data){
          		        	 window.onresize=function(){                 
          		                $('#auditviolations').datagrid('resize');//列表随屏幕大小变化
          		            }
          		        }
          		    });
        		
		}
        
        function dischargedmedicine(num) {
        	if(num==""||num==null){
        		return false;
        	};
        	$('#dischargedmedicine').datagrid({
  		        url : '${path }/hospitalized/getDischargedMedicine',
  		        fit : false,
  		        striped : true,
  		        queryParams: {zylsh:num} ,
			 	  	singleSelect:true,
			      	fit : false,
			      	striped : true,
			      	pagination : true,
			     	nowrap : false,
  		        pageSize : 10,
  		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
  		        columns : [ [
  		        {
  		            width : '10%',
  		            title : '序号',
  		            field : 'xh' 
  		        },{
  		            width : '10%',
  		            title : '日期',
  		            field : 'rq'
  		      
  		        }, {
  		            width : '10%',
  		            title : '时间',
  		            field : 'sj'
  		      
  		        },{
  		            width : '10%',
  		            title : '项目编码',
  		            field : 'xmbm'
  		        },{
  		            width : '10%',
  		            title : '项目名称',
  		            field : 'xmmc'
  		        },{
  		            width : '10%',
  		            title : '违反规则',
  		            field : 'wfgz'
  		      
  		        },{
  		            width : '10%',
  		            title : '提示说明',
  		            field : 'tssm'
  		      
  		        },{
  		            width : '10%',
  		            title : '科室',
  		            field : 'ksmc'
  		      
  		        },{
  		            width : '10%',
  		            title : '医师',
  		            field : 'ysmc'
  		      
  		        },{
  		            width : '10%',
  		            title : '规格',
  		            field : 'gg'
  		      
  		        },{
  		            width : '10%',
  		            title : '单位',
  		            field : 'dw'
  		      
  		        },{
  		            width : '10%',
  		            title : '单价(元)',
  		            field : 'dj'
  		      
  		        },{
  		            width : '10%',
  		            title : '给药途径',
  		            field : 'gytj'
  		      
  		        },{
  		            width : '10%',
  		            title : '用法',
  		            field : 'yf'
  		      
  		        },{
  		            width : '10%',
  		            title : '用量',
  		            field : 'yl'
  		      
  		        },{
  		            width : '10%',
  		            title : '数量',
  		            field : 'sl'
  		      
  		        },{
  		            width : '10%',
  		            title : '金额(元)',
  		            field : 'je'
  		      
  		        },{
  		            width : '10%',
  		            title : '医保内金额(元)',
  		            field : 'ybnje'
  		      
  		        }
  		        ] ],
  		        onBeforeLoad: function (param) {
  		        	updateDatagridHeader(this);
  		        },
  		      	onLoadSuccess:function(data){
		        	 window.onresize=function(){                        
		                $('#dischargedmedicine').datagrid('resize');//列表随屏幕大小变化
		            }
		        }
  		    });
        	
        }
        
        function orderdetails(num) {
        	if(num==""||num==null){return false};
        		$('#orderdetails').datagrid({
      		        url : '${path }/hospitalized/getOrderDetails',
      		        fit : false,
      		        striped : true,
      		        queryParams: {zylsh:num} ,
    			 	  	singleSelect:true,
    			      	fit : false,
    			      	striped : false,
    			      	pagination : true,
    			     	nowrap : true,
    			     	rownumbers : true,
      		        pageSize : 10,
      		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
      		        columns : [ [
      		        {
      		            width : '18%',
      		            title : '开嘱时间',
      		            field : 'sj'
      		      
      		        },{
      		            width : '18%',
      		            title : '停嘱时间',
      		            field : 'tzsj'
      		        },
      		        {
      		            width : '10%',
      		            title : '项目编码',
      		            field : 'xmbm'
      		        },{
      		            width : '10%',
      		            title : '项目名称',
      		            field : 'xmmc',
      		            formatter: function (value){
      		        	 if(value==null){
      		        		 return '-'; 
      		        	 }else{
      		        		 return "<span title='" + value + "'>" + value + "</span>"; 
      		        	 } 
      		         }
      		        },{
      		            width : '10%',
      		            title : '科室',
      		            field : 'ksmc'
      		      
      		        },{
      		            width : '10%',
      		            title : '医师',
      		            field : 'ysmc'
      		      
      		        },{
      		            width : '10%',
      		            title : '规格',
      		            field : 'gg'
      		      
      		        },{
      		            width : '10%',
      		            title : '单位',
      		            field : 'dw'
      		      
      		        },{
      		            width : '10%',
      		            title : '用法',
      		            field : 'yf'
      		      
      		        },{
      		            width : '10%',
      		            title : '用量',
      		            field : 'yl'
      		      
      		        },{
      		            width : '10%',
      		            title : '单价(元)',
      		            field : 'dj'
      		      
      		        },{
      		            width : '10%',
      		            title : '数量',
      		            field : 'sl'
      		      
      		        },{
      		            width : '10%',
      		            title : '金额(元)',
      		            field : 'je'
      		      
      		        },{
      		            width : '10%',
      		            title : '医保内金额(元)',
      		            field : 'ybnje'
      		      
      		        }
      		        ] ],
      		        onBeforeLoad: function (param) {
      		        	updateDatagridHeader(this);
      		        	changeRowHeader(this);
      		        },
      		      	onLoadSuccess:function(){
      		      	$('#orderdetails').datagrid('resize');
      	            	window.onresize=function(){                        
      	                	$('#orderdetails').datagrid('resize');//列表随屏幕大小变化
      	            	}
      	        	}
      		    });
        	
		}
        
        
        function chargedetails(num) {
        	if(num==""||num==null){return false};
					$('#chargedetails').datagrid({
						url : '${path }/hospitalized/getChargeDetails',
						fit : false,
						striped : true,
						rownumbers : true,
						queryParams : {
							zylsh : num
						},
						singleSelect : true,
						fit : false,
						striped : true,
						pagination : true,
						nowrap : true,
						pageSize : 10,
						pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
						columns : [ [ 
						   {
							width : '25%',
							title : '医院项目名称',
							field : 'xmmc',
							formatter: function (value){
		      		        	 if(value==null){
		      		        		 return '-'; 
		      		        	 }else{
		      		        		 return "<span title='" + value + "'>" + value + "</span>"; 
		      		        	 } 
		      		         }
	
						}, {
							width : '10%',
							title : '数量',
							field : 'sl'
						}, {
							width : '15%',
							title : '金额(元)',
							field : 'je'
						}, {
							width : '15%',
							title : '医保内金额(元)',
							field : 'ybnje'
	
						}, {
							width : '15%',
							title : '执行科室',
							field : 'ksmc'
	
						} ] ],
						onBeforeLoad : function(param) {
							updateDatagridHeader(this);
							changeRowHeader(this);
						},
						onLoadSuccess : function() {
							$("#chargedetails").parent().find("td[field='ksmc']").css({
								"width" : "10000px"
							}); //让该列充满表格
							window.onresize = function() {
								$('#chargedetails').datagrid('resize');//列表随屏幕大小变化
							}
						}
					});
		}
    	//导出excel
    	function excelExport(){
    		var	url = "${path }/excel/exportInHosPatients";
    	    $("#queryparameter").attr("action", url);
    	    $("#queryparameter").submit();
    	}
	</script>
</body>
</html>