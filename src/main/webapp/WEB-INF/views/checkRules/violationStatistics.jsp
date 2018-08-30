<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>违规统计</title>
    <style>
    	.combo-select{display:inline-block;}
    </style>
</head>
<body>
<!--筛选条件-->
<div class="header-div bg-color margin-top6">
<form id="dataSearchForm" method="post" class="padding-left20">
 				<input type="hidden" name="flag" value="to_64"/>
                <select id="selectYear" name="syear">
                </select>

            <span class="fs_16 pdr3p" >
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
                <input type="hidden" id="hid" name="lmonth"/>
            <span class="fs_16 pdr3p" >月</span>
            <span class="fs_16">
                科室
            </span>
  
               <select id="depart" name="ksbm"></select>

            <span class="fs_16 pdl3p" >
                参保类型
            </span>
 
                  <select id="cblxbm" name="cblxbm">
	                    <option value="0">全部</option>
	                    <option value="390">城乡居民</option>
	                    <option value="391">城镇职工</option>
	                    <option value="392">省直医保</option>
	             </select> 
     
            <!-- <td class="td-width"></td> -->
            <div style="display:inline-block;margin-left:2%">
               
                <button class="btn btn-info btn-sm " id="searchData" type="button" ><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
            </div>
  </form>  

</div>

    <div class="bg-color margin-top10">

        <!--选项卡-->
        <div class="gauge-title-div border-bom" style="padding-bottom: 8px!important;">
            <table class="body-width">
                <tr>
                    <td>
                        <div class="tab-tables">
                            <ul>
                                <li class="on padding-left0 margin-left0" value="0">违规规则排序</li>
                                <li value="1">科室违规情况</li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-table-boxs">
            <!--违规规则排序-->
            <div class="ks-fy-zb">
                <div class="body-width fy-line-div" id="num7">
                    <div class="fy-bar-div" id="bar3">

                    </div>
                </div>
                <div class="clear"></div>
                <div class="ks-fy-zb">
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="ruleOrdering">
                               
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--违规单据-->
                <div class="ks-fy-zb nm-div" style="display: none">
                	<div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title">违规单据汇总</td>
                                </tr>
                            </table>
                        </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="summaryIllegalDocuments">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--违规信息-->
                <div class="ks-fy-zb nm-div-name-div" style="margin-bottom: 10px;display: none">
                	<div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title">违规详情</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="violationDetails">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!--科室违规情况-->
            <div class="ks-fy-zb" style="display: none">
                <!--科室规则排序-->
                <div class="ks-fy-zb" style="padding-bottom: 0">
                    <div class="body-width fy-line-div" id="num8">
                        <div class="fy-bar-div" id="bar4">

                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--科室违规-->
                <div class="ks-fy-zb ks-tables">
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="common-table" id="doc_departViolations">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--医师违规-->
                <div class="ks-fy-zb ys-tables" style="display: none;">
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="common-table">
                                <tbody>
                                <tr>
                                    <th>排序</th>
                                    <th>医师</th>
                                    <th>违规单据数</th>
                                </tr>
                                <tr>
                                    <td>01</td>
                                    <td>王刚</td>
                                    <td><a href="javascript:void(0);" class="ks-nm">50</a></td>
                                </tr>
                                <tr>
                                    <td>02</td>
                                    <td>郝红梅</td>
                                    <td><a href="javascript:void(0);" class="ks-nm">40</a></td>
                                </tr>
                                <tr>
                                    <td>03</td>
                                    <td>李芳</td>
                                    <td><a href="javascript:void(0);" class="ks-nm">34</a></td>
                                </tr>
                                <tr>
                                    <td>04</td>
                                    <td>李强</td>
                                    <td><a href="javascript:void(0);" class="ks-nm">28</a></td>
                                </tr>
                                <tr>
                                    <td>05</td>
                                    <td>王玉兰</td>
                                    <td><a href="javascript:void(0);" class="ks-nm">21</a></td>
                                </tr>
                                <tr>
                                    <td>06</td>
                                    <td>高宝强</td>
                                    <td><a href="javascript:void(0);" class="ks-nm">19</a></td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--违规单据-->
                <div class="ks-fy-zb ks-nm-div" style="display: none">
                	<div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title">违规单据汇总</td>
                                </tr>
                            </table>
                        </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="doc_departViolationSummary">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--违规信息-->
                <div class="ks-fy-zb ks-nm-div-name-div" style="margin-bottom: 10px;display: none">
                	<div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title">违规详情</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="doc_departViolationDetails">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>

    </div>

</div>
</body>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/extJs.js"></script>
<script src="${staticPath }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script>
var echartsData="";
var model={
	    params:{
	        gzbm:""
	    },
	    //url
	    urls:[
				'${path }/violationStatistic/Ordering',   //违规排序 0
				'${path }/costStruct/SelectCostStruct?methodFlag=ruleOrderingTable',   //违规规则排序--表格 1
				'${path }/costStruct/SelectCostStruct?methodFlag=departOrderingTable',   //违规科室排序--表格 2
				'${path }/costStruct/SelectCostStruct?methodFlag=doctorOrderingTable',   //违规医师排序--表格 3
				'${path }/violationStatistic/violationSummary',      //违规汇总 4
				'${path }/violationStatistic/violationDetails',   //违规详情 5
	        ], 
	    //列
	    cols:[
			//违规统计-违规规则排序 0
			 [ [{width : '50%',title : '违规规则',field : 'GZMC'},  
			    {width : '50%',title : '违规单据数',field : 'WGDJS',
			        formatter: function (value, rowData, rowIndex) {       
			            return "<a style='color:green' href='javascript:void(0);' onclick=getSHViolationSummary('" + rowData.GZBM + "','gzbm');>" + value + "</a>";
			        }
			    },  
			    { hidden:true,field :'GZBM'}] ], 
			  //违规统计-违规科室排序 1
			 [ [{width : '50%',title : '科室',field : 'KSMC'},  
			    {width : '50%',title : '违规单据数',field : 'WGDJS',
			        formatter: function (value, rowData, rowIndex) {       
			            return "<a style='color:green' href='javascript:void(0);' onclick=getSHViolationSummary('" + rowData.KSBM + "','ksbm');>" + value + "</a>";
			        }
			    }] ],
			  //违规统计-违规医师排序2
			 [ [{width : '50%',title : '医师',field : 'YSMC'},  
			    {width : '50%',title : '违规单据数',field : 'WGDJS',
			        formatter: function (value, rowData, rowIndex) {       
			            return "<a style='color:green' href='javascript:void(0);' onclick=getSHViolationSummary('" + rowData.YSBM + "','ysgh');>" + value + "</a>";
			        }
			    }] ],
			 //违规汇总3
		    [ [{width : '13%',title : '就诊日期',field : 'JZRQ' },
	            {width : '15%',title : '身份证号',field : 'SFZHM'},  
	            {width : '10%',title : '患者姓名',field : 'HZXM',
	                formatter: function (value, rowData, rowIndex) {       
	                    return "<a style='color:green' href='javascript:void(0);' onclick=getSHviolationDetails('"+rowData.LSH+"','"+rowData.IFZDWG+"');>" +      value + "</a>";;
	                }
	            }, 
	            {width : '8%',title : '性别',field : 'XB'},
	            {width : '8%',title : '年龄',field : 'NL'},
	            {width : '10%',title : '医保卡号',field : 'YBKH'},
	            {width : '10%',title : '科室',field : 'KSMC'}, 
	            {width : '10%',title : '医师',field : 'YSXM'}, 
	            {width : '15%',title : '疾病诊断',field : 'JBMC'},
	            {width : '15%',title : '整单违反规则',field : 'IFZDWG',hidden:'hidden'}, 
	            {width : '10%',title : '开立原因',field : 'KLYY',
	            	formatter: function (value){
	                      if(value==null){
	                          return '-'; 
	                      }else{
	                          return "<span title='" + value + "'>" + value + "</span>" 
	                      }
	                  }
	            },
	            {width : '10%',title : '医疗费(元)',field : 'YLF'}, 
	            {width : '10%',title : '医保内金额(元)',field : 'YBNJE'}
	            ] ], 
	            // 违规详情
	            [[{width : '10%',title : '日期',field : 'rq'},
	              {width : '10%',title : '时间',field : 'sj'},
	              {width : '10%',title : '项目编码',field :'xmbm'},
	              {width : '10%',title : '项目名称',field : 'xmmc',
	                  formatter: function (value){
	                      if(value==null){
	                          return '-'; 
	                      }else{
	                          return "<span title='" + value + "'>" + value + "</span>" 
	                      }
	                  }
	       
	              } , 
	              {width : '10%',title : '违反规则',field : 'wfgz',
	                  formatter: function (value){
	                      if(value==null){
	                          return '-'; 
	                      }else{
	                          return "<span title='" + value + "'>" + value + "</span>" 
	                      }
	                  }
	              }, 
	              {width : '10%',title : '提示说明',field : 'tssm',
	                  formatter: function (value){
	                      if(value==null){
	                          return '-'; 
	                      }else{
	                          return "<span title='" + value + "'>" + value + "</span>" 
	                      }
	                  }
	              }, 
	              {width : '10%',title : '科室',field : 'ksmc'},
	              {width : '10%',title : '医师',field : 'ysxm'}, 
	              {width : '10%',title : '规格',field : 'ypgg'}, 
	              {width : '10%',title : '单位',field : 'dw'}, 
	              {width : '10%',title : '用法',field : 'yf'},
	              {width : '10%',title : '用量',field : 'yl'}, 
	              {width : '10%',title : '单价(元)',field : 'dj'},
	              {width : '10%',title : '数量',field : 'sl'}, 
	              {width : '10%',title : '金额(元)',field : 'je'}, 
	              {width : '10%',title : '医保内金额(元)',field : 'ybnje'}] ],  
	     ] 
	}


 $(document).ready(function () {
	getQueryData();
	selectRender("${path}/department/getDepartmentOfUser?kslx=qysy","#depart");
	$("#depart,#cblxbm,#selectYear,#selectMonth").comboSelect();
	$("#depart").parent().css({"width":"12%"});
	$("#cblxbm").parent().css({"width":"10%"});
	$("#selectYear").parent().css({"width":"8%"});
	$("#selectMonth").parent().css({"width":"6%"});
	$(".tab-tables ul li").eq(0).trigger('click');
	datagridRender("#ruleOrdering", model.urls[1], model.cols[0], $("#dataSearchForm").serializeObject());
	
	$("#searchData").click(function(){
		var index = $(".tab-tables ul .on").val();
		var ksbm =  $("#depart").val();
		hiddenInterface();
		if(index==0)
		{
			bar2();
			datagridRender("#ruleOrdering", model.urls[1], model.cols[0], $("#dataSearchForm").serializeObject());
		}else if(index==1)
		{
			bar3();
			if(ksbm==0)
			{
				$(".tab-tables ul li").eq(1).text("科室违规情况");
				datagridRender("#doc_departViolations", model.urls[2], model.cols[1], $("#dataSearchForm").serializeObject());
			}else
			{
				$(".tab-tables ul li").eq(1).text("医师违规情况");
				datagridRender("#doc_departViolations", model.urls[3], model.cols[2], $("#dataSearchForm").serializeObject());
			}
		}
	});
});


 
	//下拉框渲染
	function selectRender(url, id) {
		$.ajax({
			type : "POST",
			url : url,
			cache : false,
			async : false,
			dataType : "json",
			success : function(data) {
				var str = "";
				if (id == "#depart") {
					for (var i = 0; i < data.length; i++) {
						str += "<option value='"+data[i].ksdm+"'>"
								+ data[i].ksmc + "</option>";
					}
					$(id).empty().append($(str));
				} else if (id == "#doctor") {
					for (var i = 0; i < data.length; i++) {
						str += "<option value='"+data[i].gh+"'>" + data[i].xm
								+ "</option>";
					}
					$(id).empty().append($(str));
					$(id).comboSelect();
				}
			}
		})
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
	
	function getAjax(url,datas){
		$.ajax({
	        type:"POST",
	        url:url,
	        cache:false,
	        async:false,
	        dataType:"json",
	        data:datas,
	        success:function(data){
	            echartsData=data;
	        }
	    })
	};
	
	//datagrid  
	function datagridRender(id,url,col,params){
	    $(id).datagrid({
	        url:url,
	        fit:false,
	        striped:false,
	        queryParams:params,
	        pagination : true,
	        rownumbers:true,
	        singleSelect : true,
	        pageSize : 10,
	        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	        columns:col,
	        onBeforeLoad: function (param) {
	            updateDatagridHeader(this);
	            changeRowHeader(this); 
	        },
	        onLoadSuccess:function(data){
	            window.onresize=function(){                            
	                $(id).datagrid('resize');//列表随屏幕大小变化
	            }
	        }
	    })
	}
	
	function getSHViolationSummary(value,key){
		$(".nm-div").css("display","block");
		$(".ks-nm-div").css("display","block");
		$(".nm-div-name-div").css("display","none");
		model.cols[3][0][9].hidden=false;
		var index = $(".tab-tables ul .on").val();
		var id = "#doc_departViolationSummary"
		if(index==0)
		{
			model.cols[3][0][9].hidden=true;
			lx = 'rule';
			id = "#summaryIllegalDocuments"
		}
		datagridRender(id, model.urls[4], model.cols[3], $.extend($("#dataSearchForm").serializeObject(),{lx:key,data:value}));
	}
	
	function getSHviolationDetails(lsh,ifzdwg){
		$(".nm-div-name-div").css("display","block");
		$(".ks-nm-div-name-div").css("display","block");
		var index = $(".tab-tables ul .on").val();
		var lx = 'depart';
		var id = "#doc_departViolationDetails"
		if(index==0)
		{
			lx = 'rule';
			id = "#violationDetails"
		}
		datagridRender(id, model.urls[5], model.cols[4], {mzlsh:lsh,gzbm:ifzdwg,lx:lx,flag:"to_64"});
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
	
	/*弹出层-违规规则排序-违规单据数点击事件*/
	$(".nm").click(function() {
		$(".nm-div").css("display", "block");
	});
	$(".nm-div-name").click(function() {
		$(".nm-div-name-div").css("display", "block");
	});
	$(".ks-nm").click(function() {
		$(".ks-nm-div").css("display", "block");
	});
	$(".ks-nm-div-name").click(function() {
		$(".ks-nm-div-name-div").css("display", "block");
	});

	$(".tab-tables ul li").click(
			function() {

				$(this).addClass("on").siblings().removeClass("on");
				//切换选中的按钮高亮状态
				var index = $(this).index();
				//获取被按下按钮的索引值，需要注意index是从0开始的
				$(".tab-table-boxs > div").eq(index).css("display", "block")
						.siblings().css("display", "none");
				if (index == 0) {
					bar2();
					hiddenInterface();
					datagridRender("#ruleOrdering", model.urls[1], model.cols[0], $("#dataSearchForm").serializeObject());
					$(".ks-nm-div").css("display", "none");
					$(".ks-nm-div-name-div").css("display", "none");
				} else {
					bar3();
					hiddenInterface();
					var ksbm = $("#depart").val();
					if(ksbm==0)
					{
						$(".tab-tables ul li").eq(1).text("科室违规情况");
						datagridRender("#doc_departViolations", model.urls[2], model.cols[1], $("#dataSearchForm").serializeObject());
					}
					else 
					{
						$(".tab-tables ul li").eq(1).text("医师违规情况");
						datagridRender("#doc_departViolations", model.urls[3], model.cols[2], $("#dataSearchForm").serializeObject());
					}
					$(".nm-div").css("display", "none");
					$(".nm-div-name-div").css("display", "none");
				}
			});
	/*普通住院-弹出层-违规规则排序-柱状图*/
	function bar2() {
		// 柱状图2
		myChartBar = echarts.init(document.getElementById('bar3'));
		getAjax(model.urls[0], $.extend($("#dataSearchForm").serializeObject(),{lx:"rule"}));
		var gzmc = echartsData.order_value0;
		var wgdjs = echartsData.order_value2;
		// 指定图表的配置项和数据
		option_bar3 = {
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend : {
				right : '10%',
				top : 0,
				data : [ '违规单据数' ],
				selectedMode : 'single'
			},
			grid : {
				top : 54,
				left : '3%',
				right : '6%',
				bottom : '25%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				axisPointer : {
					type : 'shadow'
				},
				axisTick : {
					show : false
				},
				data : gzmc,
				axisLabel : {
					textStyle: {
                        color: '#333333',
                        fontWeight:700
                    },
                    rotate: -30,//-30度角倾斜显示
                    interval:0 
				}
			} ],
			yAxis : [ {
				type : 'value',
				name : '单据数',
				boundaryGap : [ 0, 0.01 ],
				axisTick : {
					show : false
				},

				 splitLine: {
	                    lineStyle: {
	                        type: 'dashed'
	                    }
	                },
				axisLabel : {
					formatter : '{value}',
					textStyle : {
						color : '#999'
					}

				}
			} ],
			series : [ {
				name : '违规单据数',
				type : 'bar',
				itemStyle : {
					normal : {
						color : '#41afd6',
						barBorderRadius : [ 80 ]
					}
				},
				barWidth : 12,
				barGap : 0.1,
				data : wgdjs
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChartBar.setOption(option_bar3);

		window.addEventListener("resize", function() {
			myChartBar.resize();
		});
	};
	/*普通住院-弹出层-科室违规情况-柱状图*/
	function bar3() {
		var ksbm = $("#depart").val();
		if(ksbm==0){
			getAjax(model.urls[0], $.extend($("#dataSearchForm").serializeObject(),{lx:"department"}));
		}else{
			getAjax(model.urls[0], $.extend($("#dataSearchForm").serializeObject(),{lx:"doctor"}));
		}
		var mc = echartsData.order_value0;
		var wgdjs = echartsData.order_value2;
		// 柱状图2
		myChartBar = echarts.init(document.getElementById('bar4'));
		// 指定图表的配置项和数据
		option_bar4 = {
			tooltip : {
				trigger : 'axis',
				axisPointer : { // 坐标轴指示器，坐标轴触发有效
					type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
				}
			},
			legend : {
				right : '10%',
				top : 0,
				data : [ '违规单据数' ],
				selectedMode : 'single'
			},
			grid : {
				top : 54,
				left : '3%',
				right : '6%',
				bottom : '12%',
				containLabel : true
			},
			xAxis : [ {
				type : 'category',
				axisPointer : {
					type : 'shadow'
				},
				data : mc,
				axisLabel : {
                    textStyle: {
                 		color: '#333333',
                 		fontWeight:700
             		},
             		rotate: -30,//-30度角倾斜显示
             		interval:0
              	},
				axisTick : {
					show : false
				}
			} ],
			yAxis : [ {
				type : 'value',
				name : '单据数',
				boundaryGap : [ 0, 0.01 ],
				axisTick : {
					show : false
				},
				splitLine: {
                    lineStyle: {
                        type: 'dashed'
                    }
                },
				axisLabel : {
					formatter : '{value}',
					textStyle : {
						color : '#999'
					}

				}
			} ],
			series : [ {
				name : '违规单据数',
				type : 'bar',
				itemStyle : {
					normal : {
						color : '#41AFD6',
						barBorderRadius : [ 80 ]
					}
				},
				barWidth : 12,
				barGap : 0.1,
				data : wgdjs
			} ]
		};
		// 使用刚指定的配置项和数据显示图表。
		myChartBar.setOption(option_bar4);

		window.addEventListener("resize", function() {
			myChartBar.resize();
		});
	};
</script>
</html>