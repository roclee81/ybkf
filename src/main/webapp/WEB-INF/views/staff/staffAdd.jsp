<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
    	$('#rylbcombox').combobox({
   		 onHidePanel: function () {
   			 checkCombobox(this);
   		 }
   	 });
    	$('#ksbmcombox').combobox({
      		 onHidePanel: function () {
      			 checkCombobox(this);
      		 }
      	 });

        $('#staffAddForm').form({
            url : '${path }/staff/add',
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
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
    function checkid(){
    	//this.value=this.value.replace(/[^\u0000-\u00FF]/,'');
    	$.ajax({
    		 type: "POST",
             url: "${path }/staff/checkid?id="+$('#rybh').val(),
             dataType: "json",
             success: function(data){
                         if(data){
                        	 $('#msg').text('')
                         }else{
                        	 $('#msg').text('编号重复').css("color","red")
                         }
                      }
    	});
    	
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

</script>
<div class="easyui-layout" data-options="fit:true,border:false" >
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;" >
        <form id="staffAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>人员编号</td>
                    <td><input id='rybh' onchange="checkid()" onkeyup="this.value=this.value.replace(/[^\u0000-\u00FF]/g,'')" name="rybh" maxlength="10" type="text" placeholder="请输入人员编号" class="easyui-validatebox span2" data-options="required:true" value=""></td>
                    <td><span id='msg'></span></td>
                </tr>
                <tr>
                	<td>姓名</td>
                    <td><input name="xm" maxlength="10" type="text" placeholder="请输入姓名" class="easyui-validatebox span2" data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>所属科室</td>
                    <td >
                        <input id="ksbmcombox"  class="easyui-combobox" name="ksbm"  style="width:100px;" data-options="
                    url:'${path }/staff/depoption',
                    required:true,
                    method:'get',
                    valueField:'id',
                    textField:'ksmc',
                    panelHeight:'300px',
                    label: 'Language:',
                    labelPosition: 'top'
                    "></input>
                    </td>
                </tr>
                <tr>
                    <td>人员类别</td>
                    <td colspan="3"><input id='rylbcombox' class="easyui-combobox" name="rylb" style="width:100px;" data-options="
                    url:'${path }/staff/rylboption',
                    method:'get',
                    required:true,
                    valueField:'ID',
                    textField:'NAME',
                    panelHeight:'300px',
                    label: 'Language:',
                    labelPosition: 'top'
                    ">
    	
    	</input></td>
                </tr>
            </table>
        </form>
    </div>
</div>