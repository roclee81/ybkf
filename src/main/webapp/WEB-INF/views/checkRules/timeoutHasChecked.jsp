<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/global.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>漏审审核信息</title>
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
<script src="${path }/static/extJs.js"></script>
<script src="${staticPath }/static/js/common.js"></script>
<script src="${path }/static/js/bootstrap-datetimepicker.js"></script>
<script src="${path }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${path }/static/js/jquery.combo.select.js"></script>
<script type="text/javascript">
function timeoutHasCheckedDataGrid() {
	$('#timeoutDataGrid').datagrid({
        url : '${path }/timeout/timeoutHasCheckedDataGrid',
        fit : false,
        striped : true,
        checkOnSelect : 'true',
        pagination : true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50 ],
        queryParams:{'flag':'to_64','ldate':$('#ldate').val(),'hdate':$('#hdate').val(),'ksbm':$('#depart').val()},
        columns : [ [{width : '13%',title : '就诊日期',field : 'JZRQ' },
     	            {width : '15%',title : '身份证号',field : 'SFZHM'},  
    	            {width : '10%',title : '患者姓名',field : 'HZXM',
    	                formatter: function (value, rowData, rowIndex) {       
    	                    return "<a style='color:green' href='javascript:void(0);' onclick=getSHviolationDetails('"+rowData.LSH+"');>" +      value + "</a>";;
    	                }
    	            }, 
    	            {width : '8%',title : '性别',field : 'XB'},
    	            {width : '8%',title : '年龄',field : 'NL'},
    	            {width : '10%',title : '医保卡号',field : 'YBKH'},
    	            {width : '10%',title : '科室',field : 'KSMC'}, 
    	            {width : '10%',title : '医师',field : 'YSXM'}, 
    	            {width : '15%',title : '疾病诊断',field : 'JBMC'},
    	            {width : '15%',title : '整单违反规则',field : 'IFZDWG'}, 
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
    	        onBeforeLoad: function (param) {
    	        	updateDatagridHeader(this);        	       	
    	        },
    	        onLoadSuccess:function(data){
    	        	$(".nm-div-name-div").css("display","none");
    	        }
    });
	
}

function getSHviolationDetails(jzlsh){
	$(".nm-div-name-div").css("display","block");
	$('#violationDetails').datagrid({
        url : '${path }/timeout/timeoutDetailsDataGrid',
        fit : false,
        striped : true,
        checkOnSelect : 'true',
        pagination : true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50 ],
        queryParams:{'flag':'to_64','jzlsh':jzlsh},
        columns : [[{width : '10%',title : '日期',field : 'rq'},
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
	              {width : '10%',title : '医保内金额(元)',field : 'ybnje'}
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
		    <div style="padding-bottom:10px">
		        <span class="fs_16">漏审日期</span>
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
		        <select id="depart"  name="ksbm"></select>
		     <div style="display:inline-block;margin-left:2%">
                <button class="btn btn-info btn-sm " id="searchData"  type="button" ><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
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
                        <td class="left fs_16 table-title">违规汇总</td>
                    </tr>
                </table>
            </div>
            <div class="body-width padding10" style="padding-top:0">
            	<div class="ys-rc-div" >
                	<table class="body-width common-table" id="timeoutDataGrid"  style="height:auto">
                	</table>
                </div>
            </div>
            <div class="clear"></div>
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
    </div>
</div>
</body>
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
        timeoutHasCheckedDataGrid();
        selectRender("${path}/department/getDepartmentOfUser?kslx=zysy","#depart");
    	$("#depart").comboSelect();
    	$("#depart").parent().css({"width":"12%"});
	})
	
	$("#searchData").click(function(){
		timeoutHasCheckedDataGrid();
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
				} 
			}
		})
	}

</script>
</html>