<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function() {
     
    	
    	
    	
        $('#departmentId').combobox({
            url:'${path }/department/getType?clum=ksmc',
            valueField:'ksbm',
            textField:'ksmc'
          }); 
        
        $('#departmentId').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
        
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
        $.extend($.fn.validatebox.defaults.rules, {  
    		
     		 mobile: {//value值为文本框中的值  
     		        validator: function (value) {  
     		            var reg = /^1[3|4|5|8|9]\d{9}$/;  
     		            return reg.test(value);  
     		        },  
     		        message: '输入手机号码格式不准确.'  
     		    },
     		  account: {//param的值为[]中值  
     	        validator: function (value, param) {  
     	            if (value.length < param[0] || value.length > param[1]) {  
     	                $.fn.validatebox.defaults.rules.account.message = '用户名长度必须在' + param[0] + '至' + param[1] + '范围';  
     	                return false;  
     	            } else {  
     	                if (!/^[\w]+$/.test(value)) {  
     	                    $.fn.validatebox.defaults.rules.account.message = '用户名只能数字、字母、下划线组成.';  
     	                    return false;  
     	                } else {  
     	                    return true;  
     	                }  
     	            }  
     	        }, message: ''  
     	    }  
          });
        $('#userAddRoleIds').combotree({
            url: '${path }/role/tree',
            multiple: true,
            required: true,
            panelHeight : 'auto'
        });

        $('#userAddForm').form({
            url : '${path }/user/add',
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
                    parent.$.messager.alert('提示', result.msg, 'warning');
                }
            }
        });
        
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="userAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>登录名</td>
                    <td><input name="userName" type="text" placeholder="请输入登录名称" class="easyui-validatebox"  validType="account[1,16]"  data-options="required:true" value=""></td>
                    <td>姓名</td>
                    <td><input name="name" type="text" placeholder="请输入姓名" class="easyui-validatebox"  validType="length[1,16]"   data-options="required:true" value=""></td>
                </tr>
                <tr>
                    <td>密码</td>
                    <td><input name="userPassword" type="password" placeholder="请输入密码" class="easyui-validatebox" validType="length[1,16]"  data-options="required:true"></td>
                    <td>性别</td>
                    <td>
                        <select name="sex" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0" selected="selected">男</option>
                            <option value="1" >女</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>年龄</td>
                    <td><input type="text" name="age" class="easyui-numberbox" validType="length[1,2]" /></td>
                   <!--  <td>用户类型</td>
                    <td>
                        <select name="userType" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">管理员</option>
                            <option value="1" selected="selected">用户</option>
                        </select>
                    </td> -->
                </tr>
                <tr>
                    < <td>科室</td>
                    <td><select id="departmentId" name="departmentId" style="width: 140px; height: 29px;" class="easyui-validatebox" data-options="required:true"></select></td> 
                    <td>角色</td>
                    <td><select id="userAddRoleIds" name="roleIds" style="width: 140px; height: 29px;"></select></td>
                </tr>
                <tr>
                    <td>电话</td>
                    <td>
                        <input type="text" name="phone"  validType="mobile"  class="easyui-numberbox"/>
                    </td>
                    <td>用户状态</td>
                    <td>
                        <select name="status" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                                <option value="0">正常</option>
                                <option value="1">停用</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>