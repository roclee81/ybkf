<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

       <style>
        .yz-msg-table th{
            box-shadow: 0px 2px 0px #cdcdcd;
            opacity: 1.0;
        }
        #back{
         /*    background: #DFDFDF; */
        }
      /*   #ok{
            background: #4373FF;
            color: #ffffff;
        } */
        #ok:hover{
            color: #1E1E1E;
        }
        .ys-table select{
            width: 68px;
        }
        .bz-zd-table{width: 77% !important; margin-left: 10%!important;}
         .combo-select{display:inline-block;}
         input{padding-left:8px;}
    </style>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script> 
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script src="${path }/static/extJs.js"></script>
<script src="${path }/static/js/common.js"></script>
<script type="text/javascript">
    var userDataGrid;
    var organizationTree;
    var currentPage;
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
            required: true,
            panelHeight : 'auto'
        }); 
       
        $('#adddepartmentId').combobox({
        	url:'${path }/department/getType?clum=ksmc,ksdm&kslx=qysy',
            valueField:'ksdm',
            textField:'ksmc',
            required:true,
    
            height:34,
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
        	var arrValue; 
        	var flag = false;
        	var ksmc = null;
        	for (var i = 0; i < _data.length; i++)
        	{  
                if (_data[i][_options.valueField] == inputValue) 
                {  
                	ksmc=_data[i]['ksmc'];
                	flag=true;  
                    break;  
                }  
            } 
        	if(inputValue!= null||inputValue!= ''){
        		if(currentPage=='add'){
        			add_div(inputValue,_data,ksmc);
        		}
        		if(currentPage=='upd'){
        			upd_div(inputValue,_data,ksmc);
        		}
        		
        	}
        	if(!flag)
        	{
        		$(comboboxId).combobox('setValue', '');
        	}
        }
        
        $("#add_div").on("click", ".del-div", function () { 
        	var  ksdm=   $(this).parent().find('input[type=hidden]').val();
        	var adepart = $("#add_div_departId").val();
        	var ndepart = $("#add_div_departName").val();
        	var arrDepart=adepart.split(",");
        	var arrNDepart=ndepart.split(",");
			  for (var i=0;i<arrDepart.length ;i++ )  {  
	            if(arrDepart[i]==ksdm){
	            	
	            	arrDepart.splice(i,1);
	            	arrNDepart.splice(i,1);
	            }
			  } 			  
			  $('#add_div_departId').val(arrDepart.toString());
			  $('#add_div_departName').val(arrNDepart.toString());	
              $(this).parent().remove();          
        });
        
        $("#upd_div").on("click", ".del-div", function () { 
        	var  ksdm=   $(this).parent().find('input[type=hidden]').val();
        	var adepart = $("#upd_div_departId").val();
        	var ndepart = $("#upd_div_departName").val();
        	var arrDepart=adepart.split(",");
        	var arrNDepart=ndepart.split(",");
			  for (var i=0;i<arrDepart.length ;i++ )  {  
	            if(arrDepart[i]==ksdm){
	            	arrDepart.splice(i,1);
	            	arrNDepart.splice(i,1);
	            }
			  } 			  
			  $('#upd_div_departId').val(arrDepart.toString());
			  $('#upd_div_departName').val(arrNDepart.toString());	
              $(this).parent().remove();          
        });
		
        // 预选科室div框--新增页
        function add_div(inputValue,_data,ksmc){
        	if(inputValue!=null&&inputValue!=''){
        		var arrValue = new Array();
            	var adepart = $("#add_div_departId").val();
            	var ndepart = $("#add_div_departName").val();
            	var flag = 0;
            	arrValue = adepart.split(',');
            	for(var i=0;i<arrValue.length;i++){
            		if(inputValue==arrValue[i]){
            			$.messager.alert('提示', "已选！", 'info');
            			flag=1;
                	}
            	}
            	if(flag==0&&ksmc!=null){
            		if(adepart!=null&&adepart!=''){
            			$("#add_div_departId").val(adepart+','+inputValue);
            			$("#add_div_departName").val(ndepart+','+ksmc);
            		}else{
            			$("#add_div_departId").val(inputValue);
            			$("#add_div_departName").val(ksmc);
            		}
            		var add_html = " <div class='add_div' ><input value="+inputValue+"  type='hidden'> </input> <span>" + ksmc + "</span><div class='del-div' style='display:inline-block'></div></div>";
                	$("#add_div").append(add_html);	
            	}
        	}
        }
        
     	// 预选科室div框--修改页
        function upd_div(inputValue,_data,ksmc){
        	if(inputValue!=null&&inputValue!=''){
        		var arrValue = new Array();
            	var adepart = $("#upd_div_departId").val();
            	var ndepart = $("#upd_div_departName").val();
            	var flag = 0;
            	arrValue = adepart.split(',');
            	for(var i=0;i<arrValue.length;i++){
            		if(inputValue==arrValue[i]){
            			$.messager.alert('提示', "已选！", 'info');
            			flag = 1;
                	}
            	}
            	if(flag==0&&ksmc!=null){
            		if(adepart!=null&&adepart!=''){
            			$("#upd_div_departId").val(adepart+','+inputValue);
            			$("#upd_div_departName").val(ndepart+','+ksmc);
            		}else{
            			$("#upd_div_departId").val(inputValue);
            			$("#upd_div_departName").val(ksmc);
            		}
            		var add_html = " <div class='add_div' ><input value="+inputValue+"  type='hidden'> </input> <span>" + ksmc + "</span><div class='del-div' style='display:inline-block'></div></div>";
                	$("#upd_div").append(add_html);	
            	}
        	}
        }
        
        userDataGrid = $('#userDataGrid').datagrid({
            url : '${path }/user/dataGrid',
            /* fit : true, */
            striped : true,
           // rownumbers : true,
            pagination : true,
            singleSelect : false,
          //  idField : 'id',
            sortName : 'createTime',
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [ {
            	field:'ck',
            	checkbox : true,
            	width:''
             },{
                width : '15%',
                title : '登录名',
                field : 'userName'
             
            }, {
                width : '10%',
                title : '姓名',
                field : 'name'
            
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
            }, {
                width : '10%',
                title : '科室',
                field : 'department_name',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            
            },  {
                width : '5%',
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
                width : '5%',
                title : '年龄',
                field : 'age',
            
            },{
                width : '10%',
                title : '电话',
                field : 'phone',
               
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
            },{
                width : '20%',
                title : '创建时间',
                field : 'createTime'
          
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
     
    });
    
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
       	currentPage='upd';
       	$("#upd_div").empty();
       	//$("#departmentId").combobox('select','');
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
          	 	console.log(result.user.phone)
               $('#id2').val(result.user.id);
               $('#userName').val(result.user.userName);
               $('#name').val(result.user.name);
               $('#editage').numberbox('setValue',result.user.age);
               $('#phone2').val(result.user.phone);
               $("#userEditSex").combobox('select',result.user.sex);
               $("#userEditRoleIds").combotree('setValue',result.roleIds);
               $("#userEditStatus").combobox('select',result.user.status);
               $('#upd_div_departName').val(result.user.department_name);
               $('#upd_div_departId').val(result.user.departmentId);
               $('#departmentId').combobox('setValue','');
               var ksdm = result.depart.ksdm;
               var ksmc = result.depart.ksmc;
               for(var i=0;i<ksdm.length;i++){
            	   var add_html = " <div class='add_div' ><input value="+ksdm[i]+"  type='hidden'> </input> <span>" + ksmc[i] + "</span><div class='del-div' style='display:inline-block'></div></div>";
               	   $("#upd_div").append(add_html);
               }
           }, 'JSON');
        
    }
    
    function searchUserFun() {
        userDataGrid.datagrid('load', $.serializeObject($('#searchUserForm')));
    }
    function cleanUserFun() {
        $('#searchUserForm input[type=text]').val('');
        $('#departmentId').val('');
        $('#adddepartmentId').val('');
        userDataGrid.datagrid('load', {});
    }
    function addUser() {
		$.ajax({
			type: "post",
	 		url: '${path }/user/add',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#userAddForm').serialize(),	
	 	    success: function (result) {
	 	    	// result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv").css("display","none");
	                	 $(".DialogDiv").css("display", "none")
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
	 	$(".BgDiv").css("z-index","100");
	     $(".BgDiv").css({ display: "block", height: $(document).height()});
	     $(".DialogDiv").css("top", "5%");
	     $(".DialogDiv").css("display", "block");
	   //  document.documentElement.scrollTop = 0;
	 }
    function hideDiv1()
    {
    	 $(".BgDiv").css("display", "none");
         $(".DialogDiv").css("display", "none"); 
    }
</script>
</head>
<body>
<div class="header-div bg-color border-rgt border-lef">
<form id="searchUserForm" method="post">
            <span class="fs_16 padding-left10">
               姓名
            </span>
                <input name="name"  type="text" style="width:8%;padding-left:6px"/>
            <span class="fs_16 pdl3p">
              科室
            </span>
               <select id="depart" name="departmentId"></select>

            <span class="fs_16 pdl3p">
               状态
            </span>
               <select id="searchStatus" name='status'>
               	<option value='00'>全部</option>
               	<option value='0'>正常</option>
               	<option value='1'>停用</option>
               </select>

           <div style="display:inline-block;margin-left:2%">
            <button class="btn btn-info btn-sm serchdata" onclick="searchUserFun()" type="button"><img style="padding: 0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
         	</div>
    </form>
</div>

    <table id="btn-table" class="float margin-top10" style="width: 25%;">
        <tr>
            <td>
               <button   class="btn btn-sm btn-info" id="increase"><img src="${staticPath }/static/img/menu/xinzeng-icon.png"><span>新增</span></button>
            </td>
            <td>
                 <button onclick="editUserFun()"  class="btn btn-sm btn-success"><span>修改</span></button>
            </td>
            <td>
                <button  onclick="deleteUserFun()"  class="btn btn-sm btn-del"><img src="${staticPath }/static/img/menu/del.png"><span>移除</span></button>
            </td>
             <td>
                     <button class="btn btn-sm btn-primary" type="button" onclick="excelExport()"><img src="${staticPath }/static/img/menu/btn1-icon.png"><span>导出</span></button> 
                </td>
        </tr>
    </table>
     <div class="body-width   margin-top15">
    <table id='userDataGrid' class="sf-msg-table border-val" style="width: 100%">      
    </table>
    </div>
     
        <!--弹出层-->
    <div class="BgDiv"></div>
    <div class="DialogDiv" style="display: none">
        <div class="pop-up bg-color1">
	        <table class="body-width">
	            <tr>
	                <td class="left padding-left20 fs_16">用户新增</td>
	                <td class="text-right padding-right20">
	                   <img src="${staticPath }/static/img/close.png" id="closes">
	                </td>
	            </tr>
	        </table>
    	</div>

        <!--table数据-->
        <form id="userAddForm" method="post">
         <div class="margin-top32 border-val" style="width: 80%;margin-left: 10%;padding-bottom:20px">
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
                   
                </tr>
                <tr>
                 <td>
                        <span >*</span>密码
                    </td>
                    <td>
                      <input name="userPassword"  style="width:158px;"type="password" validateOnCreate="false"
                       class="easyui-validatebox" validType="length[1,16]"  data-options="required:true">
                    </td>
                <td>
                        <span >*</span>性别
                    </td>
                    <td>
                             <select name="sex" class="easyui-combobox" validateOnCreate="false"
                              data-options="width:158,height:34,editable:false,panelHeight:'auto'" id="addSex">
                            <option value="0" selected="selected">男</option>
                            <option value="1" >女</option>
                        </select>
                    </td>
                </tr>
                <tr>
            	<td>
                        <span ></span>年龄
                    </td>
                    <td >
                     <!--    <input type="text" style="width:158px;" name="age"  validateOnCreate="false"
                        class="easyui-numberbox" validType="length[1,3]" /> -->
                        <!-- <input name="age" style="width:158px;" type="text" class=" easyui-numberbox" validateOnCreate="false"
                        validType="account[1,3]"  data-options="required:true" > -->
                        <input name="age" style="width:158px;" type="text" class="easyui-validatebox" validateOnCreate="false"
                        validType="account[1,3]"  data-options="required:true" >
                    </td>
                     <td>
                       <span ></span>电话
                   </tdroel>
                   <td>
                     
                         <input name="phone" style="width:158px;" type="text" class="easyui-validatebox" validateOnCreate="false" validType="mobile"
                        validType="account[1,3]"  data-options="required:true" >
                   </td>
                
            </tr>
            <tr>
				<td>
                        <span >*</span>选择科室
                    </td>
                    <td>
                      <input id="adddepartmentId"  style="width:158px;" validateOnCreate="false"
                        type="text"  />
                    </td>
                    <td>
                        <span >*</span>科室
                    </td>
                    <td>
                   	  <input type="hidden" name="departmentId" id="add_div_departId"/>
                   	  <input type="hidden" name="department_name" id="add_div_departName"/>
                      <div id="add_div">
                      	
                      </div>
                    </td>              
            </tr>
            
            <tr>
           		  
                   <td>
                        <span >*</span>角色
                    </td>
                    <td>
                      <select  id="userAddRoleIds" validateOnCreate="false"
                       name="roleIds" style="width: 158px; height:34px;"></select>
                    </td>
                   <td>
                       <span >*</span>用户状态
                   </td>
                   <td>
                     <select style="width:158px;" name="status" class="easyui-combobox" validateOnCreate="false"
                      data-options="width:158,height:34,editable:false,panelHeight:'auto'" id="addStatus">
                               <option value="0">正常</option>
                               <option value="1">停用</option>
                       </select>
                   </td>
            </tr>

            <tr>
              
                <td colspan="4" class="center-td padding-top20">
                    <input type="submit" class="btn-ok" value="确认" />
                    <input  type="button" class="btn-cancel"  value="取消"/>
                </td>
            </tr> 
            </tbody>
        </table>
    </div>
        </form>
    </div>
    
       <!--弹出层-->
    <div class="BgDiv2"></div>
    <div class="DialogDiv2" style="display: none;height: 60%;width:60%;left:20%;">
        <div class="pop-up bg-color1">
	        <table class="body-width">
	            <tr>
	                <td class="left padding-left20 fs_16">用户修改</td>
	                <td class="text-right padding-right20">
	                   <img src="${staticPath }/static/img/close.png" id="close1s">
	                </td>
	            </tr>
	        </table>
    	</div>

        <!--table数据-->
        <form id="userEditForm" method="post">
        <div class="body-width border-val margin-top32" style="height: 284px;width: 80%;margin-left: 10%;">
            <table class="bz-zd-table margin-top10">
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
                </tr>
                <tr>
                <td>
                        <span >*</span>密码
                    </td>
                    <td>
                      <input id="userPassword" style="width:158px;" name="userPassword" type="password" placeholder="密码不改则不输" class="easyui-validatebox" validType="length[1,16]"  >
                    </td>
                <td>
                        <span >*</span>性别
                    </td>
                    <td>
                        <select id="userEditSex" style="width:158px;" name="sex" validateOnCreate="false" class="easyui-combobox" data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">男</option>
                            <option value="1">女</option>
	                    </select>
	                    <input name="createUser" type="hidden" value="1101,1222"/>
                    </td>
                </tr>
                <tr>
                	<td>
                        <span >*</span>选择科室
                    </td>
                    <td>
                    <input id="departmentId" style="width:158px;height: 29px;" validateOnCreate="false"   class="easyui-combobox"
                      data-options="
                    url:'${path }/department/getType?clum=ksmc,ksdm&kslx=qysy',
                    method:'post',
                    valueField:'ksdm',
                    textField:'ksmc',
                    heght:34
                    "
                     />
                    </td>
                    <td>
                        <span >*</span>科室
                    </td>
                    <td>
                   	  <input type="hidden" name="departmentId" id="upd_div_departId"/>
                   	  <input type="hidden" name="department_name" id="upd_div_departName"/>
                      <div id="upd_div">
                      	
                      </div>
                    </td> 
                 
                </tr>
                <tr>
                	<td>
                        <span ></span>年龄
                    </td>
                    <td>
                        <input id="editage"  style="width:158px;"type="text" name="age" class="easyui-validatebox"  <%--onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"   value="${user.age}" --%> validType="length[1,3]" />
                    </td>
                	<td>
                        <span >*</span>角色
                    </td>
                    <td>
               <input  id="userEditRoleIds"style="width:158px;height: 29px;" class="easyui-combotree" validateOnCreate="false"  name="roleIds"
                     data-options="
                       url : '${path }/role/tree',
                       parentField : 'pid',
                             lines : true,
                           panelHeight : 'auto',
                         required : true,
                        cascadeCheck : false,
                        height:34
                      
                     "
                     />
                    </td>
                </tr>
                <tr>
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
               
                <td colspan="4" class="center-td padding-top20">
                    <input type="submit" class="btn-ok" value="确认" />
                    <input type="button" class="btn-cancel"  value="取消"/>
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

    selectRender("${path}/department/getDepartmentOfUser?kslx=qysy","#depart",{});
    $("#depart,#searchStatus").comboSelect();
    $("#depart").parent().css({"width":"12%"});
    $("#searchStatus").parent().css({"width":"8%"});
  //下拉框渲染
    function selectRender(url,id,datas){
        $.ajax({
            type:"POST",
            url:url,
            cache:false,
            async:false,
            dataType:"json",
            data:datas,
            success:function(data){
                var str="";
                if(id=="#depart"){
                    for(var i=0;i<data.length;i++){
                        str+="<option value='"+data[i].ksdm+"'>"+data[i].ksmc+"</option>";
                    }  
                    $(id).empty().append($(str));             
                }else if(id=="#doctor"){
                    for(var i=0;i<data.length;i++){
                        str+="<option value='"+data[i].gh+"'>"+data[i].xm+"</option>";
                    }
                    $(id).empty().append($(str));
                    $(id).comboSelect();
                    $(id).parent().find("input").css({"width":"100px"});
                }                        
            }
        })
    }
    <!--增加-弹出层-->
    $("#increase").click(function () {
        // var str = "我是弹出对话框";
      
        $(".BgDiv").css("z-index","100");
        $(".BgDiv").css({ display: "block", height: $(document).height()});
        $(".DialogDiv").css("top", "5%");
        $(".DialogDiv").css("display", "block");
        document.documentElement.scrollTop = 0;
        $('#userAddForm').form('clear');
        $('#addSex').combobox('select',0);
        $('#addStatus').combobox('select',0);
        $("#add_div").empty();
        $("#add_div_departName").val('');
        $("#add_div_departId").val('');
        currentPage='add';
    });
    $(".BgDiv,.btn-cancel,#closes").click(function() {
        $(".BgDiv").css("display", "none");
        $(".DialogDiv").css("display", "none");  });

    <!--修改-弹出层-->
    $("#update").click(function () {
        $(".BgDiv2").css("z-index","100");
        $(".BgDiv2").css({ display: "block", height: $(document).height()});
        $(".DialogDiv2").css("top", "5%");
        $(".DialogDiv2").css("display", "block");
        currentPage='upd';
    });
    $(".BgDiv2,.btn-cancel,#close1s").click(function() {
        $(".BgDiv2").css("display", "none");
        $(".DialogDiv2").css("display", "none");
    });
});

$("a,button").focus(function(){this.blur()});

//导出excel
function excelExport(){
    var url = "${path }/excel/exportSysUser";
    $("#searchUserForm").attr("action", url);
    $("#searchUserForm").submit();
}
</script>
</body>
</html>