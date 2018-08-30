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
     <script src="${path }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${path }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${path }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

       <style>
        #btn-table td{
            padding-right:20px;
        }
        .yz-msg-table th{
            box-shadow: 0px 2px 0px #cdcdcd;
            opacity: 1.0;
        }
        #btn-table .btn{
            background: #4373FF;
            color: #ffffff;
        }
        #btn-table .btn:hover{
            color: #1E1E1E;
        }
        #back{
         /*    background: #DFDFDF; */
        }
        #ok{
            background: #4373FF;
            color: #ffffff;
        }
        #ok:hover{
            color: #1E1E1E;
        }
        .ys-table select{
            width: 68px;
        }
        .bz-zd-table{width: 77% !important; margin-left: 10%!important;}
    </style>
<script type="text/javascript">
    var userDataGrid;
    var organizationTree;
   
    $(function() { 
    	
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
     	        }, message: ''  ,
     	    }  
          });  
     /*    organizationTree = $('#organizationTree').tree({
            url : '${path }/organization/tree',
            parentField : 'pid',
            lines : true,
            onClick : function(node) {
                userDataGrid.datagrid('load', {
                    organizationId: node.id
                });
            }
        }); */
   
         $('#userAddRoleIds').combotree({
            url: '${path }/role/tree', 
          /*   multiple: true, */
             required: true,
            panelHeight : 'auto'
        }); 
       
        $('#adddepartmentId').combobox({
        	url:'${path }/department/getType?clum=ksmc,ksbm',
            valueField:'ksbm',
            textField:'ksmc',
            required:true,
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
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

        
        userDataGrid = $('#userDataGrid').datagrid({
            url : '${path }/user/dataGrid',
            fit : true,
            striped : true,
           // rownumbers : true,
            pagination : true,
           //singleSelect : true,
          //  idField : 'id',
            sortName : 'createTime',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
            	field:'ck',
            	checkbox : true,
            	 width : ''
             },{
                width : '15%',
                title : '登录名',
                field : 'userName'
             
            }, {
                width : '10%',
                title : '姓名',
                field : 'name'
            
            },{
                width : '20%',
                title : '创建时间',
                field : 'createTime'
          
            },  {
                width : '10%',
                title : '性别',
                field : 'sex',
           
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '男';
                    case 1:
                        return '女';
                    }
                }
            }, {
                width : '10%',
                title : '年龄',
                field : 'age',
            
            },{
                width : '10%',
                title : '电话',
                field : 'phone',
               
            }, 
            {
                width : '15%',
                title : '角色',
                field : 'rolesList',
                formatter : function(value, row, index) {
                    var roles = [];
                    for(var i = 0; i< value.length; i++) {
                        roles.push(value[i].name);  
                    }
                    return(roles.join('\n'));
                }
            },{
                width : '10%',
                title : '状态',
                field : 'status',
             
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '正常';
                    case 1:
                        return '停用';
                    }
                }
            } ] ],
            onBeforeLoad: function (param) {
            	updateDatagridHeader(this);        	
            	
            },
            onLoadSuccess: function (data) {            	
                var body = $(this).datagrid('getPanel').find('.datagrid-body');
            	body.css({"overflow-x":"hidden"});
            }
        });
        
       
    	$('#userEditForm').form({
   		 url :'${path }/user/edit',
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
               	userDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
           	 $.messager.alert( '提示',result.msg, 'warning');
              	}
                  else
              	{
                  	parent.$.messager.alert('提示', result.msg, 'warning');
              	}
              }
   	 });
      
    	$('#userAddForm').form({
   		 url :'${path }/user/add',
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
               	userDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
           	 $.messager.alert( '提示',result.msg, 'warning');
              	}
                  else
              	{
                  	parent.$.messager.alert('提示', result.msg, 'warning');
              	}
              }
   	 }); 
     
    });// 页面加载
    
      function addUserFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/user/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = userDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#userAddForm');
                    f.submit();
                }
            } ]
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
     var rows = $('#userDataGrid').datagrid('getSelections');
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
        parent.$.messager.confirm('询问', '您是否要删除当前用户？', function(b) {
            if (b) {
                var currentUserId = '${sessionInfo.id}';/*当前登录用户的ID*/
                for(var i=0; i<rows.length; i++){
                    var row = rows[i].id;
                    if (currentUserId == row) {
                    	 parent.$.messager.show({
                             title : '提示',
                             msg : '不可以删除自己！'
                         });
                    }
                }
                if (b) {
                    progressLoad();
                    $.post('${path }/user/delete', {
                        id : ss
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            userDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
                }
            }
        });
    }
    
    function editUserFun() {
       	var id;
   	 var ss = [];
        var rows = $('#userDataGrid').datagrid('getSelections');
        if(rows.length>1){
       	 $.messager.alert( '提示', "只能选一行 ", 'warning');
       	 return 
        }else if(rows.length<1){
       	 $.messager.alert( '提示', "请选一行", 'warning');
       	 return 
        }else{
       	 id=rows[0].id;
        }       
    	 $.post('${path }/user/editPage', {
    		 userId : id
           }, function(result) {
          	 showDiv2(); 
               $('#id2').val(result.user.id);
               $('#userName').val(result.user.userName);
               $('#name').val(result.user.name);
               $('#editage').numberbox('setValue',result.user.age);
               
               $('#phone2').val(result.user.phone);
               $("#userEditSex").val(result.user.sex);
            
               $("#userEditRoleIds").combotree('setValue',result.roleIds);
               
               $("#userEditStatus").val(result.user.status);

               $('#departmentId').combobox('setValue',result.user.departmentId);
         
           }, 'JSON');
        
    }
    
    function searchUserFun() {
        userDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
        alert("searchUserFun");
    }
    function cleanUserFun() {
        $('#searchUserForm input[type=text]').val('');
        userDataGrid.datagrid('load', {});
    }
    function addUser() {
		$.ajax({
			type: "post",
	 		url: '${path }/user/add',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#userAddForm').serialize()  ,	
	 	    success: function (result) {
	 	    	// result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv1").css("display","none");
	                	 $(".DialogDiv1").css("display", "none")
	                	    userDataGrid.datagrid('load', {});
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                	
	                } else {
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                }
	 	    }
		});
		
    	
	}
    function editUser() {
    	var isValid = $(this).form('validate');
    	if(!isValid){
    		return  false
    	}
		$.ajax({
			type: "post",
	 		url: '${path }/user/edit',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#userEditForm').serialize()  ,	
	 	    success: function (result) {
	 	    	// result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv2").css("display","none");
	               	 $(".DialogDiv2").css("display", "none")
	               	    userDataGrid.datagrid('load', {});
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
     <div class="body-width fs_18 bold header-color">用户管理</div>
<div class="header-div bg-color border-rgt border-lef">
<form action="" id="searchUserForm">
    <table class="ys-table" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
               姓名
            </td>
            <td>
                <input name="name"  type="text"/>
            </td>

            <td class="td-width fs_16">
                创建时间
            </td>
            <td>
                <div class="input-group date form_date" style="float: right">
                    <input class="padding-left4" size="10" type="text" name="createdateStart">
                    <span class="input-group-addon"><span class="glyphicon-calendar" ></span></span>
                    &nbsp;至&nbsp;
                </div>
            </td>
            <td style="padding-left: 0px">
                <div class="input-group date form_date float">
                    <input class="padding-left4" size="10" type="text" name="createdateEnd">
                    <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                </div>
            </td>

            <td class="td-width"></td>
            <td>               
              <input type="button"  onclick="searchUserFun()"  value="查询" class="btn-ok fs_16">
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
    </form>
</div>

    <table id="btn-table" class="float margin-top10" style="width: 25%;">
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
             <td>
                   <!--  <button class="btn-ok fs_16">导出</button> -->
                </td>
        </tr>
    </table>
     <div class="body-width   margin-top15" style="height: 430px;overflow-x:auto;">
    <table id='userDataGrid' class="sf-msg-table border-val" style="width: 100%">
        
    </table>
    </div>
     
        <!--弹出层-->
    <div class="BgDiv1"></div>
    <div class="DialogDiv1" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">用户新增</span>
        </div>

        <!--table数据-->
        <form id="userAddForm" method="post">
         <div class="margin-top32 border-val" style="height: 240px; width: 80%;margin-left: 10%">
        <table class="bz-zd-table">
            <tbody>
            <tr>
                <td colspan="6" style="text-align: right;color:#DF2828">
                    注：* 为必须项
                </td>
            </tr>
            <tr>
                <td>
                   <span >*</span>登录名 
                </td>
                <td>
                      <input name="userName" style="width:158px;" type="text" class="easyui-validatebox" validateOnCreate="false"
                        validType="account[1,16]"  data-options="required:true" >
                </td>
                   <td>
                        <span >*</span>姓名
                    </td>
                    <td >
                       <input name="name" type="text" style="width:158px;" class="easyui-validatebox" validateOnCreate="false"
                         validType="length[1,16]"   data-options="required:true" >
                    </td>
                   
                    <td>
                        <span >*</span>密码
                    </td>
                    <td>
                      <input name="userPassword"  style="width:158px;"type="password" validateOnCreate="false"
                       class="easyui-validatebox" validType="length[1,16]"  data-options="required:true">
                    </td>
                    
                </tr>
                <tr>
                <td>
                        <span >*</span>性别
                    </td>
                    <td>
                             <select name="sex" class="easyui-combobox" validateOnCreate="false"
                              data-options="width:158,height:29,editable:false,panelHeight:'auto'">
                            <option value="0" selected="selected">男</option>
                            <option value="1" >女</option>
                        </select>
                    </td>
                    <td>
                        <span ></span>年龄
                    </td>
                    <td>
                        <input type="text" style="width:158px;" name="age"  validateOnCreate="false"
                        class="easyui-numberbox" validType="length[1,3]" />
                    </td>
                    <td>
                        <span >*</span>科室
                    </td>
                    <td>
                      <input id="adddepartmentId"  style="width:158px;" validateOnCreate="false"
                        type="text"  name="departmentId"  />
                    </td>
                    
                </tr>
                <tr>
                <td>
                        <span >*</span>角色
                    </td>
                    <td>
                      <select  id="userAddRoleIds" validateOnCreate="false"
                       name="roleIds" style="width: 158px; height: 29px;"></select>
                    </td>
                    <td>
                        <span ></span>电话
                    </tdroel>
                    <td>
                         <input  style="width:158px;"type="text" validateOnCreate="false"
                          name="phone"  validType="mobile"  class="easyui-numberbox"/>
                    </td>
                    <td>
                        <span >*</span>用户状态
                    </td>
                    <td>
                      <select style="width:158px;" name="status" class="easyui-combobox" validateOnCreate="false"
                       data-options="width:158,height:29,editable:false,panelHeight:'auto'">
                                <option value="0">正常</option>
                                <option value="1">停用</option>
                        </select>
                    </td>
              
            </tr>

            <tr>
                <td colspan="2"></td>
                <td colspan="1" class="center-td padding-top20">
                    <input type="submit"   id="ok" class="btn-ok" value="确认" />
                    <input id="back" type="button" class="btn-cancel"  value="取消"/>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
        </form>
    </div>
    
       <!--弹出层-->
    <div class="BgDiv2"></div>
    <div class="DialogDiv2" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">用户修改</span>
        </div>

        <!--table数据-->
        <form id="userEditForm" method="post">
        <div class="body-width border-val" style="height: 250px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                        <span class="">*</span>登录名
                    </td>
                    <td>
                    <input id="id2" name="id" type="hidden"  <%-- value="${user.id}" --%>/>
                      <input id="userName"  style="width:158px;"name="userName"  validateOnCreate="false"  type="text"  class="easyui-validatebox"   <%-- value="${user.userName}" --%> validType="account[1,16]"  data-options="required:true" value="">
                    </td>
                    <td>
                        <span >*</span>姓名
                    </td>
                    <td>
                       <input id="name"   style="width:158px;"name="name" validateOnCreate="false"  type="text"  class="easyui-validatebox"  validType="length[1,16]" <%-- value="${user.name}" --%>  data-options="required:true" value="">
                    </td>
                    <td>
                        <span >*</span>密码
                    </td>
                    <td>
                      <input id="userPassword" style="width:158px;" name="userPassword" type="password" placeholder="密码不改则不输" class="easyui-validatebox" validType="length[1,16]"  >
                    </td>
                    
                </tr>
                <tr>
                <td>
                        <span >*</span>性别
                    </td>
                    <td>
                           <select id="userEditSex" style="width:158px;" name="sex" validateOnCreate="false" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">男</option>
                            <option value="1">女</option>
                    </select>
                    </td>
                    <td>
                        <span ></span>年龄
                    </td>
                    <td>
                        <input id="editage"  style="width:158px;"type="text" name="age" class="easyui-numberbox"  <%--onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"   value="${user.age}" --%> validType="length[1,3]" />
                    </td>
                    <td>
                        <span >*</span>科室
                    </td>
                    <td>
                    <input id="departmentId" style="width:158px;" name="departmentId" validateOnCreate="false" <%-- value="${user.departmentId}" --%>  class="easyui-combobox"
                      data-options="
                    url:'${path }/department/getType?clum=ksmc,ksbm',
                    method:'post',
                    valueField:'ksbm',
                    textField:'ksmc',
                    "/>
                    </td>
                    
                </tr>
                <tr>
                <td>
                        <span >*</span>角色
                    </td>
                    <td>
               <input  id="userEditRoleIds"style="width:158px;" class="easyui-combotree" validateOnCreate="false"  name="roleIds" style="width: 158px; height: 29px;"
                     data-options="
                       url : '${path }/role/tree',
                       parentField : 'pid',
                             lines : true,
                           panelHeight : 'auto',
                           
                         required : true,
                        cascadeCheck : false
                      
                     "
                     />
                    </td>
                    <td>
                        <span ></span>电话
                    </td>
                    <td>
                         <input type="text" style="width:158px;"id="phone2"  name="phone"  class="easyui-validatebox" validType="mobile" <%--  value="${user.phone}"  --%>  />
                    </td>
                    <td>
                        <span >*</span>用户状态
                    </td>
                    <td>
                      <select id="userEditStatus" style="width:158px;" name="status" validateOnCreate="false" <%-- value="${user.status}"  --%>class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                    </select>
                    </td>
                 
                </tr>
         <tr>
                <td colspan="2"></td>
                <td colspan="1" class="center-td padding-top20">
                    <input type="submit"   id="ok" class="btn-ok" value="确认" />
                    <input id="back" type="button" class="btn-cancel"  value="取消"/>
                </td>
            </tr>
                </tbody>
            </table>
        </div>
 
        </form>
    </div>
    


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
$(function () {
    /* 日期插件*/
    $('.form_date').datetimepicker({
        format: 'yyyy-mm-dd',
        minView: 'month',
        language: 'zh-CN',
        autoclose: true,
        todayBtn: true//显示今日按钮
    });
});
</script>
</body>
</html>