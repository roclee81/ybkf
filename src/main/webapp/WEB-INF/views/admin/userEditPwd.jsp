<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>

<%--  <script src="${path }/static/js/jquery.easyui.min.js"></script>
  <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/js/common.js"></script> --%>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
<script type="text/javascript">
    $(function() {
    	
    	
    	 $.extend($.fn.validatebox.defaults.rules, {  
  	   		
 	   		 pwd: {//value值为文本框中的值  
 	   		        validator: function (value) {  
 	   		            //var reg =$('#pwd').val(); 
 	   		        return $("#pwd").val() == value;  	            
 	   		           // return reg.test(value);  
 	   		           
 	   		        },  
 	   		        message: '两次输入的密码不一致!'  
 	   		    },
 	   
 	   	    });
    	
        $('#editUserPwdForm').form({
            url : '${path }/user/editUserPwd',
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
                $.messager.alert( '提示',result.msg, 'info');
                if (result.success) {
                	 //$.messager.alert( '提示',result.msg, 'info');
                  //  parent.$.messager.alert('提示', result.msg, 'info');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                	
                	// $.messager.alert( '提示',result.msg, 'error');
                  //  parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;">
            <form id="editUserPwdForm" method="post">
                <table>
                    <tr>
                        <th>登录名：</th>
                        <td><shiro:principal></shiro:principal></td>
                    </tr>
                    <tr>
                        <th>原密码：</th>
                        <td><input name="oldPwd" type="password" placeholder="请输入原密码" validateOnCreate="false"  class="easyui-validatebox" data-options="required:true"></td>
                    </tr>
                    <tr>
                        <th>新密码：</th>
                        <td><input name="pwd" type="password" id="pwd" placeholder="请输入新密码" validateOnCreate="false" class="easyui-validatebox" data-options="required:true"></td>
                    </tr>
                    <tr>
                        <th>重复密码：</th>
                        <td><input name="rePwd" type="password" validateOnCreate="false"  validType="pwd"  placeholder="请再次输入新密码" class="easyui-validatebox" data-options="required:true"></td>
                    </tr>
                </table>
            </form>
    </div>
</div>