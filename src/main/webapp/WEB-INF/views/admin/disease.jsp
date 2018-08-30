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
.datagrid-body
{
  overflow-x:hidden;
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
		var diseaseDataGrid;		
		
		 $(function() {
			
			 $('#diseaseType').combobox({
					url:'${path}/disease/selectDiseaseType',
				     valueField:'ID',   
				     textField:'TEXT'
				});
				
				$('#diseaseSeq').combobox({
					url:'${path}/disease/selectDiseaseNum',
				     valueField:'ID',   
				     textField:'TEXT'
				});
				
				$('#diseaseName').combobox({
					url:'${path}/disease/selectDiseaseName',
				     valueField:'ID',   
				     textField:'TEXT'
				});
				
				$('#diseaseMode').combobox({
					url:'${path}/paramter/getType?clum=BZLX',
				     valueField:'pValue',   
				     textField:'pName',
				     required:'true',
				     onHidePanel: function () {
						 checkCombobox(this);
					 }
				});
				
			 
			 diseaseDataGrid = $('#diseaseDataGrid').datagrid({
				 url : '${path }/disease/selectDisease',
		            fit : true,
		            striped : true,
		            pagination : true,
		            singleSelect : false,
		            nowrap : false,
		            sortName : 'bzxh',
			        sortOrder : 'asc',
		            pageSize : 20,
		            pageList : [ 10, 20, 30, 40, 50, 100 ],
		            columns : [ [
		            	{
		                    checkbox : 'true',
		                    field : 'fc'
		                },{
		                    width : '15%',
		                    title : '<font size="3px">病种分类</font>',
		                    field : 'BZFL'
		                },{
		                    width : '15%',
		                    title : '<font size="3px">病种序号</font>',
		                    field : 'BZXH'
		                },{
		                    width : '15%',
		                    title : '<font size="3px">病种编码</font>',
		                    field : 'ZDBM'
		                },{
		                    width : '15%',
		                    title : '<font size="3px">病种名称</font>',
		                    field : 'BZMC'
		                },{
		                    width : '14%',
		                    title : '<font size="3px">病种类型</font>',
		                    field : 'BZLX'
		                },{
		                    width : '15%',
		                    title : '<font size="3px">治疗方式</font>',
		                    field : 'ZLFS'
		                },{
		                    width : '11%',
		                    title : '<font size="3px">临床路径</font>',
		                    field : 'SFLCLJGL',
		                    formatter : function(value, row, index) {
		                        switch (value) {
		                        case "0":
		                            return '否';
		                        case "1":
		                            return '是';
		                        }
		                    }
		                }
		            	
		            ] ],
		        	onBeforeLoad: function (param) {
		            	updateDatagridHeader(this);        	
		            	
		            }
			 });
			 
			 $("#id_all").click(function(){
				 $("input[name='diseaseId']").prop("checked", this.checked);
			 });  
			 
			 $("#delDisease").click(function(){
				 var diseaseChecked = diseaseDataGrid.datagrid('getSelections');
				 if(diseaseChecked.length<1)
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
					 for(i=0;i<diseaseChecked.length;i++)
					 {
					 	id[i]=diseaseChecked[i].ID;
					 }
					 
					 progressLoad();
					 $.post('${path }/disease/deleteDisease', {
	                     id : id
	                 }, function(result) {
	                     if (result.success) {
	                         parent.$.messager.alert('提示', result.msg, 'info');
	                         diseaseDataGrid.datagrid('reload');
	                     }
	                     progressClose();
	                 }, 'JSON');
				 });
				 
			 });
			 
			 
			 $('#diseaseEditForm').form({
				 url : '${path}/disease/editDisease',
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
		                	$('#diseaseType').combobox('reload');
		                	$('#diseaseSeq').combobox('reload');
		                	$('#diseaseName').combobox('reload');
		                	diseaseDataGrid.datagrid('load', $.serializeObject($('#searchDiseaseForm')));
	                	}
		                else
	                	{
		                	parent.$.messager.alert('提示', result.msg, 'warning');
	                	}
		            }
			 }); 
			
		 });
		 
	 function searchDiseaseFun() 
	 {
		 diseaseDataGrid.datagrid('load', $.serializeObject($('#searchDiseaseForm')));
	 }
	 function cleanDiseaseFun()
    {
        $('#searchDiseaseForm input').val('');
        diseaseDataGrid.datagrid('load', {});
    }
	 
	 function openWin() 
	 {
		 $('#diseaseEditForm input:text').val('');
		 $('#diseaseEditForm textarea').val('');
		 $('#diseaseMode').combobox('setValue', '');
		 $('#pathWayFlag').val("1");
		 $('#id').val('');
		 showDiv();
	 }
	 
	 function editWin()
	 {
		 var diseaseChecked = diseaseDataGrid.datagrid('getSelections');
		 if(diseaseChecked.length==0)
		 {
			 parent.$.messager.alert({
                    title : '提示',
                    msg : '请选择要修改的记录！'
                });
			 return;
		 }
		 
		 if(diseaseChecked.length>1)
		 {
			 parent.$.messager.alert({
                    title : '提示',
                    msg : '只能修改一条记录！'
                });
			 return;
		 }
		 $.post('${path }/disease/selectEditDisease', {
             id : diseaseChecked[0].ID
         }, function(result) {
             $('#id').val(result.id);
             $('#diseaseType2').val(result.diseaseType);
             $('#diseaseSeq2').val(result.diseaseSeq);
             $('#diseaseCode').val(result.diseaseCode);
             $('#diseaseName2').val(result.diseaseName);
             $('#diseaseMode').combobox('setValue', result.diseaseMode);
             $('#diseaseDesc').val(result.diseaseDesc);
             $('#pathWayFlag').val(result.pathWayFlag);
           	            
             showDiv(); 
             
         }, 'JSON');
		 
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
	// function exportExcle()
	 //{
	//	 location.href="${path }/disease/exportExcel";
		 
	 //}
</script>
</head>

<body>

<div class="pop-up bg-color1">
        <span class="float pop-up-span width-color dis-block">病种字典</span>
    </div>

    <div class="header-div-tj bg-color3 margin-top21">
        <div style="width: 80%;float: left">
        <form id="searchDiseaseForm">
            <table class="margin-left10 margin-top6">
                <tbody>
                <tr style="display: block;margin-top: 8px">
                    <td class="input-td">病种分类</td>
                    <td>
                        <input type="text" id="diseaseType"  name="diseaseType" style="width:200px;height: 30px;" >
                    </td>
                    <td class="input-td" style="padding-left: 48px">病种序号</td>
                    <td>
                        <input type="text"  id="diseaseSeq"  name="diseaseSeq"  style="width:200px;height: 30px;" >
                    </td>
                    <td class="input-td" style="padding-left: 48px">病种名称</td>
                    <td>
                        <input type="text"  id="diseaseName"  name="diseaseName"  style="width:200px;height: 30px;" >
                    </td>

                </tr>
                </tbody>
            </table>
            </form>
        </div>
        <div style="float: right;margin-right:34px;margin-top: 10px ">
            <input type="button" class="btn" onclick="searchDiseaseFun();" value="查询" />
            <input type="button" class="btn" onclick="cleanDiseaseFun();" value="重置" />
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
                    <button id="delDisease" class="btn">删除</button>
                </td>
               <!--  <td>
                    <button class="btn" onclick="exportExcle()">导出</button>
                </td> -->
            </tr>
        </table>
    </div>

    <div class="margin-top15" style="height: 630px" >
        <table id="diseaseDataGrid">
            
        </table>
    </div>
    <!--弹出层-->
    <div class="BgDiv1"></div>
    <div class="DialogDiv1" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">新增/修改</span>
        </div>

        <!--table数据-->
          <form id="diseaseEditForm" method="post">
        <div class="body-width border-val" style="height: 416px;width: 94%;margin-left: 3%;margin-top: 20px !important">
         
	 		<input type="hidden" id="id" name="id" />
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>病种分类
                    </td>
                    <td>
                        <input type="text" id="diseaseType2" name="diseaseType" class="easyui-validatebox" validateOnCreate="false" validType="length[1,10]" data-options="required:true" />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>病种序号
                    </td>
                    <td>
                        <input type="text" id="diseaseSeq2" name="diseaseSeq" class="easyui-validatebox" validateOnCreate="false" onkeyup="this.value=this.value.replace(/[^\u0000-\u00FF]/g,'')"  data-options="required:true" validType="length[1,20]"/>
                    </td><td>
                        <span class="bz-zd-table-span">*</span>病种编码
                    </td>
                    <td>
                        <input type="text"  id="diseaseCode" name="diseaseCode" class="easyui-validatebox" validateOnCreate="false" validType="length[1,20]" onkeyup="this.value=this.value.replace(/[^\u0000-\u00FF]/g,'')"  data-options="required:true"/>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>病种名称
                    </td>
                    <td>
                        <input type="text" id="diseaseName2" name="diseaseName" class="easyui-validatebox" validateOnCreate="false" validType="length[1,25]" data-options="required:true"/>
                    </td>
                    <td>临床路径</td>
					<td>
						<select id="pathWayFlag" name="pathWayFlag" style="width: 99%" ><option value="1">是</option><option value="0">否</option></select>
					</td>			
                    <td>
                        <span class="bz-zd-table-span">*</span>病种类型
                    </td>
                    <td style="padding-left: 6px; text-align: left">
                        <input  id="diseaseMode" name="diseaseMode" validateOnCreate="false"  />	
                    </td>
                </tr>
                <tr>
				<td>治疗方式</td>
			    <td><input type="text" id="treatmentMethod" name="treatmentMethod"  class="easyui-validatebox" validateOnCreate="false" validType="length[0,50]" /></td>
			    
			</tr>
                <tr>
                    <td>病种描述</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="5">
                        <textarea cols="50" rows="10" id="diseaseDesc" name="diseaseDesc" maxlength="20"></textarea>
                    </td>
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