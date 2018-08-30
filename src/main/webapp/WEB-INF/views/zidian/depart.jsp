<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
 <script src="${path }/static/js/jquery.easyui.min.js"></script>
  <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/js/common.js"></script>
     <script src="${path }/static/extJs.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
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
    var userDataGrid;
    var organizationTree;

    $(function() { 	   
     /*   $('#ksbm').combobox({
       url:'${path }/department/getType?ksbm',
       valueField:'ksbm',
       textField:'ksbm'
     }); */
        $('#ksmc').combobox({
           url:'${path }/department/getType?clum=ksmc',
           valueField:'ksmc',
           textField:'ksmc'
         }); 
        $('#kslb').combobox({
           url:'${path }/department/getType?clum=kslb',
           valueField:'kslb',
           textField:'kslb',
           panelHeight:'120px'
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
       $('#kslb2').combobox({
           url:'${path }/department/getType?clum=kslb',
           valueField:'kslb',
           textField:'kslb',
           panelHeight:'120px'
         });
      
       
       
       $('#kslb2').combobox({
    		 onHidePanel: function () {
    			 checkCombobox(this);
    		 }
    	 });
       $('#kslb3').combobox({
    		 onHidePanel: function () {
    			 checkCombobox(this);
    		 }
    	 });
       $('#ksqybz2').combobox({
    		 onHidePanel: function () {
    			 checkCombobox(this);
    		 }
    	 });
       
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
   	                $.fn.validatebox.defaults.rules.account.message = '长度必须在' + param[0] + '至' + param[1] + '范围';  
   	                return false;  
   	            } else {  
   	                if (!/^[\w]+$/.test(value)) {  
   	                    $.fn.validatebox.defaults.rules.account.message = '只能数字、字母、下划线组成.';  
   	                    return false;  
   	                } else {  
   	                    return true;  
   	                }  
   	            }  
   	        }, message: ''  
   	    }  
        });
       departDataGrid = $('#departDataGrid').datagrid({
            url : '${path }/department/dataGrid',
            fit : true,
         //   striped : true,
          //  rownumbers : true,
            pagination : true,
           singleSelect : false,
           // idField : 'id',
        //  sortName : '',
            CheckOnSelect:false,
            SelectOnCheck:false,
	      sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [{
            	field:'ck',
            	checkbox : true,
            	
             }, {
                width : '15%',
                title : '<font size="3px">科室编码</font>',
                field : 'ksbm'
               
            }, {
                width : '20%',
                title : '<font size="3px">科室名称</font>',
                field : 'ksmc'
             
            },{
                width : '15%',
                title : '<font size="3px">科室类别</font>',
                field : 'kslb'
            }, {
                width : '20%',
                title : '<font size="3px">科室上级编码</font>',
                field : 'ksjbgl'
            },  {
                width : '15%',
                title : '<font size="3px">科室启用标志</font>',
                field : 'ksqybz',
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '未启用';
                    case 1:
                        return '启用';
                    }
                }
            },{
                width : '15%',
                title : '<font size="3px">编制床位数</font>',
                field : 'bzcws'
            }
            
            ] ],
            onBeforeLoad: function (param) {
            	updateDatagridHeader(this);        	
            	
            }
          
        });
 
      
     	$('#departAddForm').form({
    		 url :'${path }/department/add',
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
                	   hideDiv1();
                		departDataGrid.datagrid('load', $.serializeObject($('#searchdepartForm')));
                		 $.messager.alert( '提示',result.msg, 'warning');
               	}
                   else
               	{
                   	parent.$.messager.alert('提示', result.msg, 'warning');
               	}
               }
    	 });
       	$('#departEditForm').form({
   		 url : '${path }/department/edit',
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
               	   hideDiv2();
               		departDataGrid.datagrid('load', $.serializeObject($('#searchdepartForm')));
               	 $.messager.alert( '提示',result.msg, 'warning');
              	}
                  else
              	{
                  	parent.$.messager.alert('提示', result.msg, 'warning');
              	}
              }
      	 });
    });
    
    function addDepartFun() {
        parent.$.modalDialog({
            title : '添加',
            width :800,
            height : 300,
            href : '${path }/department/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = departDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#departAddForm');
                    f.submit();
                }
            } ,{
                text : '取消',
                handler : function() {
                	  
                	   parent.$.modalDialog.handler.dialog('close');

                }
            } ,]
        });
    }
    
    function deleteUserFun() {
    	
       /*  if (id == undefined) {//点击右键菜单才会触发这个
            var rows = userDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            userDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        } */
    	 var ss = "";
         var rows = $('#departDataGrid').datagrid('getSelections');
         if(rows.length<1){
        	 $.messager.alert( '提示', "至少选一行", 'warning');
        	 return;
         }else{
         for(var i=0; i<rows.length; i++){
             var row = rows[i].id;
             if(i==0){
            	 
            	 ss=ss+row; 
             }else{
             ss=ss+","+row;
             }
         }
         }  
        parent.$.messager.confirm('询问', '您是否要删除用户？', function(b) {
            if (b) {
                var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
              
                    progressLoad();
                    $.post('${path }/department/delete', {
                        id : ss
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            departDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
               
            }
        });
    }
    
    function editUserFun() {
    	var id;
    	 var ss = [];
         var rows = $('#departDataGrid').datagrid('getSelections');
        /*  for(var i=0; i<rows.length; i++){
             var row = rows[i];
             ss.push('<span>'+row.itemid+":"+row.productid+":"+row.attr1+'</span>');
         } */
         if(rows.length>1){
        	 $.messager.alert( '提示', "只能选一行 ", 'warning');
        	 return 
         }else if(rows.length<1){
        	 $.messager.alert( '提示', "请选一行", 'warning');
        	 return 
         }else{
        	 id=rows[0].id;
         }
       //  $.messager.alert('Info', ss.join('<br/>'));
    	
    	
       /*  if (id == undefined) {
            var rows = userDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            userDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        } */
   	 $.post('${path }/department/editPage', {
   		deparrtId : id
     }, function(result) {
    	 showDiv2(); 
         $('#id').val(result.id);
         $('#ksbm').val(result.ksbm);
         $('#ksmc2').val( result.ksmc);
         $('#kslb3').combobox('setValue',result.kslb);
         $('#ksqybz2').combobox('setValue',result.ksqybz);
  //       $('#diseaseMode').combobox('setValue', result.diseaseMode);
         $('#ksjbgl').val(result.ksjbgl);
         $('#bzcws').val(result.bzcws);
       	            
         
         
     }, 'JSON');
        
        // location.href='${path }/department/editPage?deparrtId=' + id+"&id="+pageId+"&pid="+pagepId+"&ppid="+pageppId;
    }
    
    function searchUserFun() {
    	departDataGrid.datagrid('load', $.serializeObject($('#searchdepartForm')));
    }
    function cleanUserFun() {
        $('#searchdepartForm input').val('');
        departDataGrid.datagrid('load', {});
    }
    function addDepart() {
		$.ajax({
			type: "post",
	 		url: '${path }/department/add',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#departAddForm').serialize()  ,	
	 	    success: function (result) {
	 	    	// result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv1").css("display","none");
	                	 $(".DialogDiv1").css("display", "none")
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                	
	                } else {
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                }
	 	    }
		});
		
    	
	}

    function showDiv2()
	 {
	 	$(".BgDiv2").css("z-index","100");
	     $(".BgDiv2").css({ display: "block", height: $(document).height()});
	     $(".DialogDiv2").css("top", "5%");
	     $(".DialogDiv2").css("display", "block");
	   //  document.documentElement.scrollTop = 0;
	 }
   function hideDiv2()
   {
   	 $(".BgDiv2").css("display", "none");
        $(".DialogDiv2").css("display", "none"); 
   }
   function showDiv1()
	 {
	 	$(".BgDiv1").css("z-index","100");
	     $(".BgDiv1").css({ display: "block", height: $(document).height()});
	     $(".DialogDiv1").css("top", "5%");
	     $(".DialogDiv1").css("display", "block");
	   //  document.documentElement.scrollTop = 0;
	 }
   function hideDiv1()
   {
   	 $(".BgDiv1").css("display", "none");
        $(".DialogDiv1").css("display", "none"); 
   }
</script>
</head>
<body>
	
 <div class="body-width fs_18 bold header-color">科室字典</div>
    <div class="header-div-tj bg-color3 margin-top21">
        <form action="" id="searchdepartForm">
        <div style="width: 80%;float: left">
            <table class="margin-left10 margin-top6">
                <tbody>
                <tr style="display: block;margin-top: 8px">
                    <td class="input-td">科室编码</td>
                    <td>
                        <input name="ksbm"  class="" style="width:120px;height: 30px;"    />
                    </td>
                    <td class="input-td" style="padding-left: 48px"  >科室名称</td>
                    <td>
                        <input name="ksmc"style="width:120px;height: 30px;"   />
                    </td>
                    <td class="input-td" style="width:120px;height: 30px;"   style="padding-left: 48px">科室类别</td>
                    <td>
                        <select id="kslb"  name="kslb" style="width:80px" >
                          
                        </select>
                    </td>
                    <td class="input-td" style="padding-left: 48px">启用标志</td>
                    <td>
                        <select id="ksqybz"  style="width:120px;height: 30px;"   name="ksqybz" style="width:80px" >
                            <option value="">-请选择-</option>
                           <option value="1">-启用-</option>
                           <option value="0">-未启用-</option>
                        </select>
                    </td>

                </tr>
                </tbody>
            </table>
        </div>
        <div style="float: right;margin-right:24px;margin-top: 15px ">
            <input type="text" onclick="searchUserFun()" style="text-align: center;"  value="查询" class="btn-ok fs_16">
            <input type="text" onclick="cleanUserFun()" style="text-align: center;" value="重置" class="btn-ok fs_16">
        </div>
        </form>
    </div>

    <div class="header-div-tj bg-color3 margin-top21">
        <table id="btn-table" class="margin-left10 float margin-top10" style="width: 25%;">
            <tr>
                <td>
                    <button   class="btn-ok fs_16" id="increase">新增</button>
                </td>
                <td>
                    <button onclick="editUserFun()"  class="btn-ok fs_16">修改</button>
                </td>
                <td>
                    <button  onclick="deleteUserFun()"  class="btn-ok fs_16">删除</button>
                    
                </td>
               <!--  <td>
                    <button class="btn">导出</button>
                </td> -->
            </tr>
        </table>
    </div>

    <div class="body-width   margin-top15" style="height: 615px;overflow-x:auto;">
        <table id="departDataGrid" class="yz-msg-table border-val" style="width: 100%">
            
        </table>
    </div>
    <!--弹出层-->
    <div class="BgDiv1"></div>
    <div class="DialogDiv1" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">科室字典新增</span>
        </div>

        <!--table数据-->
        <form id="departAddForm" method="post">
        <div class="body-width border-val" style="height: 200px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室编码
                    </td>
                    <td>
                        <input name="ksbm" type="text"  validateOnCreate="false"  style="width: 148px;"   class="easyui-validatebox" validType="account[1,10]"  data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室名称
                    </td>
                    <td>
                        <input name="ksmc" type="text" class="easyui-validatebox" validateOnCreate="false" style="width: 148px;"    validType="length[1,15]"   data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室类别
                    </td>
                    <td> 
                        <input  id="kslb2"  name="kslb" type="text" validateOnCreate="false"  style="width: 148px;"   data-options="required:true"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室启用标志
                    </td>
                    <td>
                        <select    class="easyui-validatebox"  validateOnCreate="false"  style="width: 148px;"    data-options="required:true"  name="ksqybz"  >
                        
                           <option value="1">是</option>
                           <option value="0">否</option>
                        </select>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>上级科室编码
                    </td>
                    <td>
                        <input type="text" validateOnCreate="false"   style="width: 148px;"   data-options="required:true"  name="ksjbgl" class="easyui-validatebox"   validType="account[1,10]" />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>编制床位数
                    </td>
                    <td>
                        <input type="text" validateOnCreate="false"   style="width: 148px;"   data-options="required:true"  name="bzcws"  validType="account[1,10]"  class="easyui-numberbox" />
                    </td>
                </tr>
              
                <!-- <tr>
                    <td colspan="2" style="text-align: center;color:#DF2828">
                        注：(*为必须项)
                    </td>
                    <td colspan="2"></td>
                    <td colspan="1">
                        <input id="ok" type="submit"  value="确认" class="btn"/>
                        <input id="back" type="button" value="取消"  class="back btn"/>
                       <input type="reset" class="btn" value="重置" />
                    </td>
                </tr> -->
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
                    <td colspan="1" style="text-align:center;">        
                         <input id="ok" type="submit"  style="width: 80px" value="确认" class="btn-ok"/>
                        <input id="back" type="button" style="width: 80px" value="取消" class="btn-cancel"/>              
                    </td>
                    <td colspan="2">
                    
                    </td>
                </tr>
                </tbody>
            </table>
          
        </div>
        </form>
    </div>
    
	  <!--修改弹出层-->
    <div class="BgDiv2"></div>
    <div class="DialogDiv2" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">科室字典修改</span>
        </div>

        <!--table数据-->
       <form id="departEditForm" method="post">
        <div class="body-width border-val" style="height: 200px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tbody>
                <tr>
              
                    <td>
                       <input id="id" name="id" type="hidden"      <%--  value="${depart.id}" --%>/>
                        <span class="bz-zd-table-span">*</span>科室编码
                    </td>
                    <td>
                        <input id="ksbm"  name="ksbm" type="text"  validateOnCreate="false"  style="width: 148px;"    class="easyui-validatebox" validType="account[1,10]"  data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室名称
                    </td>
                    <td>
                        <input id="ksmc2"  name="ksmc" type="text"  validateOnCreate="false"   style="width: 148px;"  class="easyui-validatebox"   validType="length[1,15]"    data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室类别
                    </td>
                    <td>
                        <input  id="kslb3"   class="easyui-combobox " style="width: 148px;"    name="kslb" type="text" <%-- value="${depart.kslb}" --%>
                          data-options="
                    url:'${path }/department/getType?clum=kslb',
                    method:'post',
                    required:true,
                    valueField:'kslb',
                    textField:'kslb',
                    panelHeight:'120px'
                
                    " 
                    />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>科室启用标志
                    </td>
                    <td>
                         <input id="ksqybz2"   name="ksqybz"  style="width: 148px;"  validateOnCreate="false"  class="easyui-combobox"  <%--  value="${depart.ksqybz}"  --%>
                        data-options="
                    url:'${path }/paramter/getType?clum=bz',
                    method:'post',
                    required:true,
                    valueField:'pValue',
                    textField:'pName',
                   
                   
                    " 
                        />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>上级科室编码
                    </td>
                    <td>
                        <input  id="ksjbgl"  type="text" validateOnCreate="false"  style="width: 148px;"   data-options="required:true"  name="ksjbgl" class="easyui-validatebox" <%-- value="${depart.ksjbgl }" --%> validType="account[1,10]" />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>编制床位数
                    </td>
                    <td>
                        <input  id="bzcws"  type="text" validateOnCreate="false"  style="width: 148px;"  data-options="required:true"  name="bzcws"  <%-- value="${depart.bzcws }"  --%>   onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" />
                    </td>
                </tr>
              
              <!--   <tr>
                    <td colspan="2" style="text-align: center;color:#DF2828">
                        注：(*为必须项)
                    </td>
                    <td colspan="2"></td>
                    <td colspan="1">
                           <input  id="ok" type="submit"  value="确认" class="ok btn"/>
                        <input id="back" type="button" value="取消"  class="back btn"/>
                       <input type="reset" class="btn" value="重置" />
                    </td>
                </tr> -->
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
                    <td colspan="1" style="text-align:center;">
                     <input id="ok" type="submit" style="width: 80px"value="确认" class="btn-ok"/>
                        <input id="back" type="button"  style="width: 80px" value="取消" class="btn-cancel"/>
                    </td>
                    <td colspan="2">
                    
                        
                    </td>
                </tr>
                </tbody>
            </table>
          
        </div>
        </form>
    </div>
<!-- <div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 50px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                    <th>科室编码:</th>
                    <td><input name="ksbm" id="ksbm" placeholder="请输入编码"/></td>
                     <th>科室名称:</th>
                    <td><input name="ksmc" id="ksmc" placeholder="请输入名称"/></td>
                    <th>科室类别:</th>
                     <td><input id="kslb"  name="kslb"></input></td>
                     <th>科室启用标志:</th>
                     <td><input id="ksqybz"  type="text"  name="ksqybz"/></td>
                    
                </tr>
                  <tr><td>
                        
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">清空</a>
                    </td></tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'科室列表'" >
        <table id="departDataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div data-options="region:'west',border:true,split:false,title:'组织机构'"  style="width:150px;overflow: hidden; ">
        <ul id="organizationTree" style="width:160px;margin: 10px 10px 10px 10px"></ul>
    </div>
</div>
<div id="userToolbar" style="display: none;">
  
        <a onclick="addDepartFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
        <a onclick="editUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">编辑</a>
        <a onclick="deleteUserFun();" href="javascript:void(0);" class="easyui-linkbutton"  data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>

</div> -->


<script>
$(function () {
    //全选,取消全选
    $(document).on("click","#chk-qx",function(){
        if($(this).hasClass("checked")==false){
            $(this).closest(".yz-msg-table").find("input[type=checkbox]").prop("checked",true);
            $(this).addClass("checked");
        }else{
            $(this).closest(".yz-msg-table").find("input[type=checkbox]").prop("checked",false);
            $(this).removeClass("checked");
        }
    });

    <!--增加-弹出层-->
    $("#increase").click(function () {
        // var str = "我是弹出对话框";
        $(".BgDiv1").css("z-index","100");
        $(".BgDiv1").css({ display: "block", height: $(document).height()});
        $(".DialogDiv1").css("top", "5%");
        $(".DialogDiv1").css("display", "block");
        document.documentElement.scrollTop = 0;
    });
    $(".BgDiv1,.btn-cancel").click(function() {
        $(".BgDiv1").css("display", "none");
        $(".DialogDiv1").css("display", "none");  });

    <!--修改-弹出层-->
    $("#update").click(function () {
        $(".BgDiv2").css("z-index","100");
        $(".BgDiv2").css({ display: "block", height: $(document).height()});
        $(".DialogDiv2").css("top", "5%");
        $(".DialogDiv2").css("display", "block");
    });
    $(".BgDiv2,.btn-cancel").click(function() {
        $(".BgDiv2").css("display", "none");
        $(".DialogDiv2").css("display", "none");
    });
    
    
});

$("a,button").focus(function(){this.blur()});
</script>
</body>
</html>