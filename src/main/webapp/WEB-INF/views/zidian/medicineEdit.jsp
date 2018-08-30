<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
  // var roleIds=${roleIds };
    $(function() {
    	
    	$('#ywflmc').combobox({
            url:'${path }/medicine/getType?clum=ywflmc',
            valueField:'ywflmc',
            textField:'ywflmc'
          }); 
       
    	$('#sfjbyw2').combobox({
      		 onHidePanel: function () {
      			 checkCombobox(this);
      		 }
      	 });
    	$('#yplbbz').combobox({
      		 onHidePanel: function () {
      			 checkCombobox(this);
      		 }
      	 });
  
    	$('#kjywbz2').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
    	$('#zlyybz2').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
    	$('#zyzsjbz2').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
    	$('#jsbz2').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
    	$('#fzzlywbz2').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
    	$('#zxybz').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
    	function checkCombobox(comboboxId){
    		
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
    	};
        $('#medicineEditForm').form({
            url : '${path }/medicine/edit',
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
        $("#userEditSex").val('${user.sex}');
      
        $("#userEditStatus").val('${user.status}');
        
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
    });
    
    
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="medicineEditForm" method="post">
           
            <table class="grid">
              <tr>
              
                    <td>药品编码</td>
                    
                    <td>  <input name="id"   id="id"  type="hidden" placeholder="请输入编码"   value="${medicine.id}"/><input name="ypdm"  readonly="readonly"  id="ypdm"  type="text" placeholder="请输入编码" class="easyui-validatebox"  validType="account[1,20]"  data-options="required:true" value="${medicine.ypdm}"></td>
                    <td>药品名称</td>
                    <td><input name="ypmc"     id="ypmc" type="text" placeholder="请输入名称" class="easyui-validatebox"  validType="length[1,30]"   data-options="required:true" value="${medicine.ypmc}"></td>
                    <td>药品通用名</td>
                    <td><input id="yptym"  name="yptym" data-options="required:true" value="${medicine.yptym}" class="easyui-validatebox"  validType="length[1,15]" /></td>
                </tr>
                <tr>
                    
                    <td>药品别名</td>
                     <td><input id="ypbm"  name="ypbm" value="${medicine.ypbm}"  class="easyui-validatebox"  validType="length[1,15]"   /></td>
                    
                    <td>药品规格</td>
                    <td><input id="gg" name="gg" style="width: 140px; height: 29px;" value="${medicine.gg}" class="easyui-validatebox"  validType="length[1,15]"  /></td>
                    <td>单位</td>
                    <td><input type="dw" name="dw" class="easyui-validatebox"  validType="length[1,5]" value="${medicine.dw}"  /></td>
                </tr>
               
               <tr>
                    
                    <td>剂型</td>
                     <td><input id="jx"  name="jx"   value="${medicine.jx}" class="easyui-validatebox"  validType="length[1,20]"  /></td>
                    
                    <td>剂量单位</td>
                    <td><input id="jldw" name="jldw" style="width: 140px; height: 29px;" value="${medicine.jldw}"  class="easyui-validatebox"  validType="length[1,4]"   /></td>
                    <td>药品限定量</td>
                    <td><input type="ypxdl" name="ypxdl"class="easyui-validatebox"  validType="length[1,5]"  value="${medicine.ypxdl}" /></td>
                </tr>
                <tr>
                    
                    <td>是否基本药物</td>
                     <td><input id="sfjbyw2"  name="sfjbyw" value="${medicine.sfjbyw}" class="easyui-combobox"   validType="length[1,2]" 
                      data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                   
                    "  /></td>
                    
                    <td>药品类别标志</td>
                    <td><input id="yplbbz" class="easyui-combobox" name="yplbbz" style="width: 140px; height: 29px;" value="${medicine.yplbbz}" 
                     data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                   
                    "  /></td>
                    <td>药品分类名称</td>
                    <td><input type="ypflmc" name="yplbmc" class="easyui-validatebox"  validType="length[1,10]" value="${medicine.ypflmc}" /></td>
                </tr>
                  <tr>
                    
                    <td>药品分类代码</td>
                     <td><input id="ypfldm"  name="ypfldm" class="easyui-validatebox" validType="account[1,10]" value="${medicine.ypfldm}" /></td>
                    
                    <td>抗菌药物标志</td>
                    <td><input id="kjywbz2" name="kjywbz" style="width: 140px; height: 29px;" class="easyui-combobox" value="${medicine.kjywbz}" 
                     data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                   
                    "  /></td>
                    <td>抗菌药物级别</td>
                    <td><input type="kjywjb" name="kjywjb" class="easyui-validatebox"  validType="length[1,4]" value="${medicine.kjywjb}" /></td>
                </tr>
                 <tr>
                  
                    <td>肿瘤用药标志</td>
                    <td><input id="zlyybz2" name="zlyybz" style="width: 140px; height: 29px;" class="easyui-combobox" value="${medicine.zlyybz}"  data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                   
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                   
                    " /></td>
                    <td>中药注射剂标志</td>
                    <td><input type="zyzsjbz2" name="zyzsjbz"  class="easyui-combobox" class="easyui-validatebox"   validType="length[1,2]"  value="${medicine.zyzsjbz}" 
                    data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                   
                    " 
                    /></td>
                   <td>激素标志</td>
                     <td><input id="jsbz2"  name="jsbz" class="easyui-combobox"   value="${medicine.jsbz}"  data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                   
                    "  /></td>
                </tr>
                  <tr>
                  
                    <td>辅助药物标志</td>
                    <td><input id="fzzlywbz2" name="fzzlywbz" class="easyui-combobox"  style="width: 140px; height: 29px;" value="${medicine.fzzlywbz}"
                    data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px'
                   
                    " 
                    
                     /></td>
                    <td>中西药标志</td>
                    <td><input id="zxybz2" name="zxybz"  validType="length[1,2]" class="easyui-combobox"  value="${medicine.zxybz}" data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                   
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'50px',
                    label: 'Language:',
                    labelPosition: 'top'
                    "  /></td>
                   <td>目录药类别</td>
                     <td><input id="muylb"  name="muybz" class="easyui-validatebox" validType="length[1,2]"  value="${medicine.muylb}" /></td>
                </tr>
            </table>
        </form>
    </div>
</div>