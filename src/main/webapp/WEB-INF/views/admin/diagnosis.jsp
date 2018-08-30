<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%-- <%@ include file="/commons/basejs.jsp" %> --%>
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
#btn-table .btn
{
    background: #4373FF;
    color: #ffffff;
    
}
#btn-table .btn:hover
{
    color: #1E1E1E;
}
.bz-zd-table .btn
{
	width: 20%
}
#back{
    background: #DFDFDF;
}
#ok{
    background: #4373FF;
    color: #ffffff;
}
#ok:hover{
    color: #1E1E1E;
}
.textbox-text,.textbox
{
	width: 148px !important;
	height: 30px !important;
}
</style>
<script type="text/javascript">
var diagnosisDataGrid;

$(function() {	
	
	$('#diagnosisType').combobox({
		url:'${path}/paramter/getType?clum=ZDLX',
	     valueField:'pValue',   
	     textField:'pName',
	     onLoadSuccess: function(){
	    	 $('#diagnosisType2').combobox({
	    		 valueField:'pValue',   
	    	     textField:'pName',
	    	     data:$('#diagnosisType').combobox('getData'),
	    		 onHidePanel: function () {
	    			 checkCombobox(this);
	    		 }
	    	 });
	     }
	});
	
	$('#diagnosisMode').combobox({
		url:'${path}/paramter/getType?clum=ZDLB',
	     valueField:'pValue',   
	     textField:'pName',
	     onLoadSuccess: function(){
	    	 $('#diagnosisMode2').combobox({
	    		 valueField:'pValue',   
	    	     textField:'pName',
	    	     data:$('#diagnosisMode').combobox('getData'),
	    		 onHidePanel: function () {
	    			 checkCombobox(this);
	    		 }
	    	 });
	     }
	});
	
	diagnosisDataGrid = $('#diagnosisDataGrid').datagrid({
		url : '${path }/diagnosis/selectDiagnosis',
        fit : true,
        striped : true,
        pagination : true,
        singleSelect : false,        
        sortName : 'zdbm',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100 ],
        columns : [ [
        	{
                    checkbox : 'true',
                    field : 'fc'
                },{
                    width : '24%',
                    title : '<font size="3px">诊断代码</font>',
                    field : 'ZDBM'
                },{
                    width : '27%',
                    title : '<font size="3px">诊断名称</font>',
                    field : 'ZDMC'
                },{
                    width : '24%',
                    title : '<font size="3px">诊断类型</font>',
                    field : 'ZDLX'
                },{
                    width : '25%',
                    title : '<font size="3px">诊断类别</font>',
                    field : 'ZDLB'
                }
        	] ],
        	onBeforeLoad: function (param) {
            	updateDatagridHeader(this);        	
            	
            },
            onLoadSuccess: function (data) {            	
                var body = $(this).datagrid('getPanel').find('.datagrid-body');
            	body.css({"overflow-x":"hidden"});
            }
	});	
	
	
	$("#delDiagnosis").click(function(){
		 
		 var diagnosisChecked = diagnosisDataGrid.datagrid('getSelections');
		 
		 if(diagnosisChecked.length<1)
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
			 
			 var id=[];
			 for(i=0;i<diagnosisChecked.length;i++)
			 {
			 	id[i]=diagnosisChecked[i].ID;
			 }
			 
			 progressLoad();
			 $.post('${path }/diagnosis/deleteDiagnosis', {
	            id : id
	        }, function(result) {
	            if (result.success) {
	                parent.$.messager.alert('提示', result.msg, 'info');
	                diagnosisDataGrid.datagrid('reload');
	            }
	            progressClose();
	        }, 'JSON');
		 
	    });
	  });
	
	$('#diagnosisEditForm').form({
		 url : '${path}/diagnosis/editDiagnosis',
		 onSubmit : function() {
               progressLoad();
               var isValid = $(this).form('validate');
               if (!isValid) {
                   progressClose();
               }
               return isValid;
           },
           success : function(result) {
               progressClose();
               result = $.parseJSON(result);
               if(result.success)
           	{
            	   hideDiv();
               	diagnosisDataGrid.datagrid('load', $.serializeObject($('#searchDiagnosisForm')));
           	}
               else
           	{
               	parent.$.messager.alert('提示', result.msg, 'warning');
           	}
           }
	 });
	
	
	
});

function searchDiagnosisFun() 
{
	diagnosisDataGrid.datagrid('load', $.serializeObject($('#searchDiagnosisForm')));
}
function cleanDiagnosisFun()
{
   $('#searchDiagnosisForm input').val('');
   diagnosisDataGrid.datagrid('load', {});
}

function checkCombobox(comboboxId)
{
	var inputValue = $(comboboxId).combobox('getValue');
	var _options = $(comboboxId).combobox('options');
	var _data = $(comboboxId).combobox('getData');
	var flag = false;
	for (var i = 0; i < _data.length; i++)
	{  
        if (_data[i][_options.valueField] == inputValue) 
        {  
        	flag=true;  
            break;  
        }  
    } 
	if(!flag)
	{
		$(comboboxId).combobox('setValue', '');
	}
}

function openWin() 
{
	 $('#diagnosisEditForm input:text').val('');
	 $('#diagnosisType2').combobox('setValue', '');
	 $('#diagnosisMode2').combobox('setValue', '');
	 $('#id').val('');
	 showDiv();
	 
}

function editWin()
{
	var diagnosisChecked = diagnosisDataGrid.datagrid('getSelections');
	 if(diagnosisChecked.length==0)
	 {
		 parent.$.messager.alert({
               title : '提示',
               msg : '请选择要修改的记录！'
           });
		 return;
	 }
	 
	 if(diagnosisChecked.length>1)
	 {
		 parent.$.messager.alert({
               title : '提示',
               msg : '只能修改一条记录！'
           });
		 return;
	 }
	 $.post('${path }/diagnosis/selectEditDiagnosis', {
        id : diagnosisChecked[0].ID
    }, function(result) {
        $('#id').val(result.id);
        $('#diagnosisCode').val(result.diagnosisCode);
        $('#diagnosisName2').val(result.diagnosisName);
        $('#diagnosisType2').combobox('setValue', result.diagnosisType);
        $('#diagnosisMode2').combobox('setValue', result.diagnosisMode);
        
        showDiv(); 
        
    }, 'JSON');
	 
}

function showDiv()
{
	$(".BgDiv1").css("z-index","100");
    $(".BgDiv1").css({ display: "block", height: $(document).height()});
    $(".DialogDiv1").css("top", "5%");
    $(".DialogDiv1").css("display", "block");
    document.documentElement.scrollTop = 0;
}

function hideDiv()
{
	 $(".BgDiv1").css("display", "none");
     $(".DialogDiv1").css("display", "none"); 
}

</script>
</head>
<body>

<div class="pop-up bg-color1">
        <span class="float pop-up-span width-color dis-block">病种字典</span>
    </div>

    <div class="header-div-tj bg-color3 margin-top21">
        <div style="width: 80%;float: left">
        <form id="searchDiagnosisForm">
            <table class="margin-left10 margin-top6">
                <tbody>
                <tr style="display: block;margin-top: 8px">
                    <td class="input-td">诊断名称</td>
                    <td>
                        <input id="diagnosisName" type="text"  name="diagnosisName" style="width:200px;height: 30px;"  />
                    </td>
                    <td class="input-td" style="padding-left: 48px">诊断类型</td>
                    <td>
                        <input id="diagnosisType" type="text" name="diagnosisType"  style="width:200px;height: 30px;" >
                    </td>
                    <td class="input-td" style="padding-left: 48px">诊断类别</td>
                    <td>
                        <input id="diagnosisMode" type="text" name="diagnosisMode"  style="width:200px;height: 30px;" >
                    </td>

                </tr>
                </tbody>
            </table>
            </form>
        </div>
        <div style="float: right;margin-right:34px;margin-top: 10px ">
            <input type="button" value="查询" class="btn" onclick="searchDiagnosisFun();"/>
            <input type="button" value="重置" class="btn" onclick="cleanDiagnosisFun();"/>
        </div>
    </div>
    
    <div class="header-div-tj bg-color3 margin-top21">
        <table id="btn-table" class="margin-left10 float margin-top10" style="width: 25%;">
            <tr>
                <td>
                    <button onclick="openWin()" class="btn" id="increase">新增</button>
                </td>
                <td>
                    <button onclick="editWin()" class="btn">修改</button>
                </td>
                <td>
                    <button id="delDiagnosis" class="btn">删除</button>
                </td>
                <!-- <td>
                    <button  class="btn">导出</button>
                </td> -->
            </tr>
        </table>
    </div>

    <div class="body-width   margin-top15" style="height: 600px;overflow-x:auto;">
        <table id="diagnosisDataGrid">
            
        </table>
    </div>
    <!--弹出层-->
    <div class="BgDiv1"></div>
    <div id="w" class="DialogDiv1" style="display: none">
      <form id="diagnosisEditForm" method="post">
	    <input type="hidden" id="id" name="id" />
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">新增/修改</span>
        </div>

        <!--table数据-->
        <div class="body-width border-val" style="height: 116px;width: 94%;margin-left: 3%;margin-top: 20px !important">
            
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>诊断编码
                    </td>
                    <td>
                        <input type="text" id="diagnosisCode" name="diagnosisCode" validateOnCreate="false" onkeyup="this.value=this.value.replace(/[^\u0000-\u00FF]/g,'')" class="easyui-validatebox" validType="length[1,20]" data-options="required:true" />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>诊断名称
                    </td>
                    <td >
                        <input type="text" id="diagnosisName2" name="diagnosisName" class="easyui-validatebox" validateOnCreate="false"  data-options="required:true" validType="length[1,50]"/>
                    </td>
                </tr>
                <tr>				
					<td>诊断类型</td>
					<td style="padding-left: 6px; text-align: left"><input id="diagnosisType2"  name="diagnosisType"  style="width:391px;height: 30px;" >
					</td>
					<td>诊断类别</td>
					<td style="padding-left: 6px; text-align: left"><input id="diagnosisMode2"  name="diagnosisMode"  style="width:391px;height: 30px;" ></td>
				</tr>
                
                </tbody>
            </table>
        </div>
        <div class="margin-top10"style="width: 94%;margin-left: 3%;" >
            <table class="bz-zd-table " style="width: 96.5% !important;">
                <tbody>
                <tr>
                    <td style="text-align: left;color:#DF2828">
                        注：( * 为必须项)
                    </td>
                    <td colspan="2" style="text-align:left">
                     <input id="ok" class="btn" type="submit" value="确定" />
			    		<input id="back" type="button" class="btn" value="取消" onclick="hideDiv()" href="javascript:void(0);"/>
                    </td>
                    <td colspan="1">
                    
                                         
                     </td>
                </tr>
                </tbody>
            </table>
          
        </div>
       </form>
    </div>
   
</body>
</html>