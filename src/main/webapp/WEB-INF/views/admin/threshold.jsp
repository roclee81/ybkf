<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
    #btn-table td{
        padding-right:20px;
    }
.panel-body-noheader {
    border-top-width: 0px;
}
.panel-header, .panel-body {
    border-width: 1px;
    border-style: solid;
}
.datagrid .datagrid-pager {
    display: block;
    margin: 0;
    border-width: 0px 0 0 1;
    border-style: solid;
}
.datagrid-header td, .datagrid-body td, .datagrid-footer td {
    border-width: 0 1px 0px 0;
    border-style: dotted;
    margin: 0;
    padding: 0;
}
.btn
{
    background: #4373FF;
    color: #ffffff;
    
}
.btn:hover
{
    color: #1E1E1E;
}
.textbox-text,.textbox
{
	width: 99% !important;
	height: 30px !important;
}
</style>
<script type="text/javascript">
var thresholdDataGrid;
var diseaseSeq;
$(function() {
	
	$('#diseaseSeq').combobox({ 
		url:'${path}/disease/selectDiseaseWay',
	     valueField:'ID',   
	     textField:'TEXT',
		 loadFilter:function(data){
	            var o = [{'ID':'','TEXT':'所有病种'}];	            
	            return o.concat(data);
	        },
	     filter: function(q, row){
	    		var opts = $(this).combobox('options');
	    		return row[opts.textField].indexOf(q) > 0;
	    	},
		 onHidePanel : function(){	    	 
	    	 department = $(this).combobox('getValue');
	    	 thresholdDataGrid.datagrid('reload',{
	    		 diseaseSeq : $(this).combobox('getValue')
	    	 });
	    	 clearAndDisable();
	     }
	 });
		
	thresholdDataGrid = $('#thresholdDataGrid').datagrid({
		url : '${path }/threshold/selectThreshold',
		queryParams : {
			diseaseSeq : diseaseSeq
		},
		fit : true,
        striped : false,
        pagination : true,
        singleSelect : true,    
        nowrap : false,
        sortName : 't.bzxh',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100 ],
        columns : [ [
        	{
            	hidden: 'true',
                field : 'BZXH'
            },{
                width : '16%',
                title : '<font size="3px">病种名称</font>',
                field : 'BZMC'
            },{
                width : '8%',
                title : '<font size="3px">病种限额</font>',
                field : 'BZXE'
            },{
                width : '8%',
                title : '<font size="3px">预警限额</font>',
                field : 'YJXE'
            },{
                width : '8%',
                title : '<font size="3px">预警金额</font>',
                field : 'YJJE'
            },{
                width : '13%',
                title : '<font size="3px">限定住院时间</font>',
                field : 'XDZYSJ'
            },{
                width : '8%',
                title : '<font size="3px">药占比</font>',
                field : 'YZB'
            },{
                width : '8%',
                title : '<font size="3px">诊疗占比</font>',
                field : 'ZLZB'
            },{
                width : '8%',
                title : '<font size="3px">材料占比 </font>',
                field : 'CLZB'
            },{
                width : '10%',
                title : '<font size="3px">检验检查占比</font> ',
                field : 'JXJCZB'
            },{
                width : '8%',
                title : '<font size="3px">有效标志</font>',
                field : 'YXBZ',
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '无效';
                    case 1:
                        return '有效';
                    }
                }
            },{
                width : '8%',
                title : '<font size="3px">生效时间 </font>',
                field : 'SXSJ'
            },{
                width : '8%',
                title : '<font size="3px">失效时间 </font>',
                field : 'SHXSJ'
            }
            
        ]],
        onClickRow : function(rowIndex,rowData){
        	$('.cc').removeAttr("disabled");
        	$('#validFlag').removeAttr("disabled");
        	$('#saveButton').removeAttr("disabled");
        	$('#id').val(rowData.ID);
        	$('#diseaseLimit').val(rowData.BZXE);
        	$('#warnLimit').val(rowData.YJXE);
        	$('#warnAmount').val(rowData.YJJE);
        	$('#timeLimit').val(rowData.XDZYSJ);
        	$('#drugProportion').val(rowData.YZB);
        	$('#diagnosisProportion').val(rowData.ZLZB);
        	$('#materialProportion').val(rowData.CLZB);
        	$('#checkLimit').val(rowData.JXJCZB);
        	$('#validTime').val(rowData.SXSJ);
        	$('#invalidTime').val(rowData.SHXSJ);
        	$("#validFlag").val(rowData.YXBZ);
        	$('#diseaseSeq').combobox('setValue', rowData.BZXH);
        },
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this); 	
        	
        },
        onLoadSuccess: function (data) {            	
            //var body = $(this).datagrid('getPanel').find('.datagrid-body');
        	//body.css({"overflow-x":"hidden"});
        }
	});
	
	$('#editThresholdForm').form({
		 url : '${path}/threshold/editThreshold',
		 onSubmit : function() {
			 var isValid = true;
             progressLoad();
             
             if($('#diseaseSeq').combobox('getValue')=='' )
          	  {
	           	  progressClose();
	           	  parent.$.messager.alert({
	                     title : '提示',
	                     msg : '请选择一个病种！'
	                 });
	           	  isValid = false;
	           	  return isValid;
          	  }
             
             if($('#diseaseLimit').val()=='')
          	  {
	           	  progressClose();
	           	  parent.$.messager.alert({
	                     title : '提示',
	                     msg : '病种限额不能为空！'
	                 });
	           	  isValid = false;
	           		return isValid;
          	  }
             if($('#warnLimit').val()=='' && $('#warnAmount').val()=='')
         	  {
	           	  progressClose();
	           	  parent.$.messager.alert({
	                     title : '提示',
	                     msg : '预警限额和预警金额至少一个不能为空！'
	                 });
	           	  isValid = false;
	           	  return isValid;
         	  }
             
             return isValid;
         },
         success : function(result) {
             progressClose();
             result = $.parseJSON(result);
             if(result.success)
         	  {
            	 thresholdDataGrid.datagrid('reload', {
           		diseaseSeq:$('#diseaseSeq').combobox('getValue')
           	  });
           	  parent.$.messager.alert({
                     title : '提示',
                     msg : '保存成功！'
                 });
           		clearAndDisable();
             }
             else
         	  {
           	  parent.$.messager.alert('提示', result.msg, 'warning');
         	  }
         }
	 });
	
	 
	 
	 $("#delThreshold").click(function(){
			
			var thresholdSelected  = thresholdDataGrid.datagrid('getSelections');
			
			if(thresholdSelected.length<1)
			 {
				 parent.$.messager.alert({
	                  title : '提示',
	                  msg : '请选择要删除的记录！'
	              });
				 return;
			 }
			
			parent.$.messager.confirm('询问', '您是否要删除当前记录？', function(flag) {
				if(!flag)
			 	{
			 		return;
			 	}
				
				progressLoad();
				$.post('${path }/threshold/deleteThreshold', {
		            id : thresholdSelected[0].ID
		        }, function(result) {
		            if (result.success) {
		                parent.$.messager.alert('提示', result.msg, 'info');
		                $('#diseaseSeq').combobox('setValue', '');
		                thresholdDataGrid.datagrid('reload',{
		               		diseaseSeq:$('#diseaseSeq').combobox('getValue')
		             	  });		                
		                clearAndDisable();
		            }
		            progressClose();
		        }, 'JSON');
				
			});
			
		});
	
});

function addThreshold() 
{
	if($('#diseaseSeq').combobox('getValue')=='' )
 	{
  	  parent.$.messager.alert({
            title : '提示',
            msg : '请选择一个病种名称！'
        });
  	  return;
 	}
	
	$('.cc').val('');
	$('.cc').removeAttr("disabled");
	$('#validFlag').removeAttr("disabled");
	$('#saveButton').removeAttr("disabled");
}

function submitForm()
{
	$('#editThresholdForm').submit();
}
function clearAndDisable()
{
	$('.cc').val('');
	$('.cc').attr("disabled","disabled");
	$('#validFlag').val("1");
	$('#validFlag').attr("disabled","disabled");
	$('#saveButton').attr("disabled","disabled");
}
</script>
</head>
<body>
<div class="xPage">
<%-- <jsp:include page="../include/tophead.jsp" /> --%>
	
	 <div class="xMain">
<%-- 	<jsp:include page="../include/leftMenu.jsp" /> --%>
	 <div class="xRightbox">
	 <div class="header-div bg-color1">
        <span class="header-div-span">阈值设定</span>
    </div>

    <div class="header-input margin-top15" style="height: 194px">
        <div class="float margin-top21" style="width: 90%">
        <form id="editThresholdForm" method="post">
          <input type="hidden" id="id" name="id" />
            <table class="ys-table">
                <tbody>
                   <tr>
        			<td><span style="color: red">*</span>病种名称</td>
                    <td><input  id="diseaseSeq" name="diseaseSeq" /></td>
                    <td><span style="color: red">*</span>病种限额</td>
                    <td><input type="text" class="cc"  id="diseaseLimit" name="diseaseLimit" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/></td>
                    <td>预警限额</td>
                    <td><input type="text" class="cc"  id="warnLimit" name="warnLimit" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/>%</td>
                    <td>预警金额</td>
                    <td><input type="text" class="cc"  id="warnAmount" name="warnAmount" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/></td>
                    <td></td>
                    <td></td>
        		</tr>
        		<tr>
        			<td>限定住院时间</td>
                    <td><input type="text" class="cc"  id="timeLimit" name="timeLimit" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/></td>
                    <td>药占比</td>
                    <td><input type="text"  class="cc" id="drugProportion" name="drugProportion" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/>%</td>
                    <td>诊疗占比</td>
                    <td><input type="text" class="cc" id="diagnosisProportion" name="diagnosisProportion" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/>%</td>
                    <td>材料占比</td>
                    <td><input type="text" class="cc" id="materialProportion" name="materialProportion" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/>%</td>
                    <td></td>
                    <td></td>                
        		</tr>
        		<tr>
        			<td>检验检查占比</td>
                    <td><input type="text" class="cc" id="checkLimit" name="checkLimit" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/>%</td>
                    <td>有效标志</td>
                    <td><select id="validFlag" name="validFlag"  disabled ="disabled"><option value="1">有效</option><option value="0">无效</option></select></td>
                    <td>生效时间</td>
                    <td><input type="text" class="cc" id="validTime" name="validTime" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/></td>
                     <td>失效时间</td>
                    <td><input type="text" class="cc" id="invalidTime" name="invalidTime" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  disabled ="disabled "/></td>
                    <td></td>
                    <td></td>
        		</tr>
                </tbody>
            </table>
           </form>
        </div>
        <div class=" btn-div" style="float: right;width: 5%;margin-top: 84px">
            
            <input type="button" id="saveButton" class="btn" value="保存" disabled ="disabled" onclick="submitForm()"/>
        </div>
        <div class="clear"></div>
    </div>

    <div class="body-width margin-top15">
	<div class="header-div bg-color1" style="border: none !important;">
                <div class="float"><span class="header-div-span">阈值设定详情</span></div>
                <div style="float: right;margin-right:28px;margin-top: 10px; ">
                    <button class="btn" onclick="addThreshold()">新增</button>
                    <button id="delThreshold" class="btn">删除</button>
                </div>
            </div>
        <div class="margin-top15" style="width: 100%;height: 660px;">
            
            <table id="thresholdDataGrid" >
                
            </table>
        </div>
</div></div></div>
</body>
</html>