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
.sx-dj1 td input, select {
    width: auto;
    margin-left: 0px !important;
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
        $('#ywflmc').combobox({
           url:'${path }/medicine/getType?clum=ywflmc',
           valueField:'ywflmc',
           textField:'ywflmc'
         }); 
    /*      $('#sfjbyw').combobox({
           url:'${path }/paramter/getType?clum=bz',
           valueField:'pValue',
           textField:'pName'
         });  */
        /*  $('#jsbz').combobox({
           url:'${path }/paramter/getType?clum=bz',
           valueField:'pValue',
           textField:'pName'
         }); 
      
        $('#kjywbz').combobox({
           url:'${path }/paramter/getType?clum=bz',
           valueField:'pValue',
           textField:'pName'
         }); 
      
           $('#zlyybz').combobox({
           url:'${path }/paramter/getType?clum=bz',
           valueField:'pValue',
           textField:'pName'
         });  */
       /*  $('#zyzsjbz').combobox({
           url:'${path }/paramter/getType?clum=bz',
           valueField:'pValue',
           textField:'pName'
         }); 
      
      
        $('#fzzlywbz').combobox({
           url:'${path }/paramter/getType?clum=bz',
           valueField:'pValue',
           textField:'pName'
         }); 
        */
       
        medicineDataGrid = $('#medicineDataGrid').datagrid({
            url : '${path }/medicine/dataGrid',
            fit : true,
            striped : true,
           // rownumbers : true,
            pagination : true,
           singleSelect : false,
          //  idField : 'id',
           // sortName : 'ypdm',
            CheckOnSelect:false,
            SelectOnCheck:false,
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [{
            	field:'ck',
            	checkbox : true
            	
             }, {
                width : '15%',
                title : '药品代码',
                field : 'ypdm'
              
            }, {
                width : '15%',
                title : '药品名称',
                field : 'ypmc'
               
            },{
                width : '10%',
                title : '药品通用名',
                field : 'yptym'
              
            }, {
                width : '10%',
                title : '药品别名',
                field : 'ypbm'
             
            }, {
                width : '10%',
                title : '规格',
                field : 'gg'
             
            }, {
                width : '10%',
                title : '单位',
                field : 'dw'
             
            },{
                width : '10%',
                title : '计量单位',
                field : 'jldw'
          
            }, {
                width : '10%',
                title : '药品限定量',
                field : 'ypxdl'
        
            }, {
                width : '10%',
                title : '药品分类代码',
                field : 'ypfldm'
           
            }, {
                width : '10%',
                title : '药品分类名称',
                field : 'ypflmc'
           
            }, {
                width : '10%',
                title : '是否基本药品',
                field : 'sfjbyw'
             
            }, {
                width : '10%',
                title : '抗菌药物标志',
                field : 'kjywbz',
             
                formatter : function(value, row, index) {
                    switch (value) {
                    case "0":
                        return '否';
                    case "1":
                        return '是';
                    }
                }
            }, {
                width : '10%',
                title : '抗菌药物级别',
                field : 'kjywjb',
             
            }, {
                width : '10%',
                title : '肿瘤用药标志',
                field : 'zlyybz',
            
                formatter : function(value, row, index) {
                    switch (value) {
                    case "0":
                        return '否';
                    case "1":
                        return '是';
                    }
                }
            },  {
                width : '13%',
                title : '中药注射剂标志',
                field : 'zyzsjbz',
            
                formatter : function(value, row, index) {
                    switch (value) {
                    case "0":
                        return '否';
                    case "1":
                        return '是';
                    }
                }
            },   {
                width : '10%',
                title : '激素标志',
                field : 'jsbz',
          
                formatter : function(value, row, index) {
                    switch (value) {
                    case "0":
                        return '否';
                    case "1":
                        return '是';
                    }
                }
            },   {
                width : '13%',
                title : '辅助治疗药物标志',
                field : 'fzzlywbz',
             
                formatter : function(value, row, index) {
                    switch (value) {
                    case "0":
                        return '否';
                    case "1":
                        return '是';
                    }
                }
            },   {
                width : '10%',
                title : '中西药标识',
                field : 'zxybz',
            
                formatter : function(value, row, index) {
                    switch (value) {
                    case "0":
                        return '否';
                    case "1":
                        return '是';
                    }
                }
            },   {
                width : '10%',
                title : '目录药级别',
                field : 'mlylb'
               
            }/* , {
                field : 'action',
                title : '操作',
                width : 130,
                formatter : function(value, row, index) {
                    var str = '';

                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="editUserFun(\'{0}\');" >编辑</a>', row.id);


                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<a href="javascript:void(0)" class="user-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="deleteUserFun(\'{0}\');" >删除</a>', row.id);

                    return str;
                }
            } */] ],
            onBeforeLoad: function (param) {
            	updateDatagridHeader(this);        	
            	
            },
            onLoadSuccess: function (data) {            	
            /*     var body = $(this).datagrid('getPanel').find('.datagrid-body');
            	body.css({"overflow-x":"hidden"}); */
            }
        });
       
        
        $('#medicinetEditForm').form({
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
                     if(result.success)
                 	{
                  	   hideDiv2();
                  	 medicineDataGrid.datagrid('load', $.serializeObject($('#searchMedicineForm')));
                  	 $.messager.alert( '提示',result.msg, 'warning');
                 	}
                     else
                 	{
                     	parent.$.messager.alert('提示', result.msg, 'warning');
                 	}
                 }
      	 });
        
       	$('#medicineaddForm').form({
      		 url : '${path }/medicine/add',
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
                  	 medicineDataGrid.datagrid('load', $.serializeObject($('#searchMedicineForm')));
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
            height : 400,
            href : '${path }/medicine/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = medicineDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#medicineAddForm');
                    f.submit();
                }
            } ,{
                text : '取消',
                handler : function() {
                	parent.$.modalDialog.handler.dialog('close');

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
         var rows = $('#medicineDataGrid').datagrid('getSelections');
         if(rows.length<1){
        	 $.messager.alert("最少选一行");
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
                    $.post('${path }/medicine/delete', {
                        id : ss
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            medicineDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
               
            }
        });
    }
    
    function editFun() {
    	var id;
    	 var ss = [];
         var rows = $('#medicineDataGrid').datagrid('getSelections');
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
        //location.href='${path }/medicine/editPage?medicineId='+id+"&id="+pageId+"&pid="+pagepId+"&ppid="+pageppId;
       
  /*       parent.$.modalDialog({
            title : '编辑',
            width : 800,
            height : 400,
            href : '${path }/medicine/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = medicineDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#medicineEditForm');
                    f.submit();
                }
            } ,{
                text : '取消',
                handler : function() {
                	parent.$.modalDialog.handler.dialog('close');

                }
            } ]
        }); */
        
      	 $.post('${path }/medicine/editPage', {
      		medicineId : id
          }, function(result) {
         	 showDiv2(); 
              $('#id').val(result.id);
              $('#ypdm2').val(result.ypdm);
              $('#ypmc2').val(result.ypmc);
              $('#yptym2').val(result.yptym);
              $('#ypbm2').val(result.ypbm);
              $('#gg2').val(result.gg);
              $('#dw2').val(result.dw);
              $('#jx2').val(result.jx);
              $('#jldw2').val(result.jldw);
              $('#ypxdl2').val(result.ypxdl);
              $('#mlylb2').val(result.mlylb);
              $('#ypfldm2').val(result.ypfldm);
              $('#ypflmc2').val(result.ypflmc);
              $('#kjywjb2').val(result.kjywjb);
              
              $('#sfjbyw2').val( result.sfjbyw);
              $('#zxybz2').val(result.zxybz);
              $('#yplbbz2').val(result.yplbbz);
              $('#kjywbz2').val(result.kjywbz);
              $('#zlyybz2').val(result.zlyybz);
              $('#zyzsjbz2').val(result.zyzsjbz);
              $('#fzzlywbz2').val(result.fzzlywbz);
              $('#jsbz2').val(result.jsbz);
       //       $('#diseaseMode').combobox('setValue', result.diseaseMode);
          
              
              
          }, 'JSON');
    }
    
    function searchUserFun() {
    	medicineDataGrid.datagrid('load', $.serializeObject($('#searchMedicineForm')));
    }
    function cleanUserFun() {
        $('#searchMedicineForm input').val('');
        $('#searchMedicineForm select').val('');
        medicineDataGrid.datagrid('load', {});
    }
    function addMedicine() {
		$.ajax({
			type: "post",
	 		url: '${path }/medicine/add',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#medicinetEditForm').serialize()  ,	
	 	    success: function (result) {
	 	    	 result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv1").css(display,"none");
	                	 $(".DialogDiv1").css("display", "none")
		            	 $.messager.alert( '提示',result.msg, 'warning');
	                } else {
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                }
	 	    }
		})
		
    	
	}
    function addMedicine() {
		$.ajax({
			type: "post",
	 		url: '${path }/medicine/add',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#medicinetEditForm').serialize()  ,	
	 	    success: function (result) {
	 	    
	                if (result.success) {
	                	$(".BgDiv1").css(display,"none");
	               	 $(".DialogDiv1").css("display", "none")
	            	 $.messager.alert( '提示',result.msg, 'warning');
	                } else {
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                }
	 	    }
		})
		
    	
	}
    function editMedicine() {
		$.ajax({
			type: "post",
	 		url: '${path }/medicine/edit',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#medicinetEditForm').serialize()  ,	
	 	    success: function (result) {
	 	    
	                if (result.success) {
	                	  $(".BgDiv2").css("display", "none");
	                      $(".DialogDiv2").css("display", "none");
		            	 $.messager.alert( '提示',result.msg, 'warning');
	                } else {
	               	 $.messager.alert( '提示',result.msg, 'warning');
	                }
	 	    }
		})
		
    	
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
     <div class="body-width fs_18 bold header-color">药品字典</div>
	   <div class="header-input" style="height: 110px">
	   <form action="" id="searchMedicineForm">
        <div class="float margin-top15" style="width: 82%">
            <table class="jk-sh-table">
                <tbody>
                <tr>
                        <td class="padding-left10 fs_16">
                                   药品名称
                    </td>
                    <td>
                        <input style="width: 120px" name="ypmc" id="ypmc"  />
                    </td>
                     <td>
                                             药物分类名称        
                    </td>
                    <td style="text-align:left">
                       <input style="width: 120px;text-align:left" name="ypflmc" id="ypflmc" />
                    </td>
                    <td>
                        抗菌药物标志
                    </td>
                    <td>
                       <select style="width: 120px" name="kjywbz" id="kjywbz"  >
                        <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                    </select>
                    </td>
                    <td>
                        肿瘤用药标志
                    </td>
                    <td>
                       <select style="width: 120px" name="zlyybz" id="zlyybz"  >
                         <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                    </select>
                    </td>
         
                
                </tr>
                <tr>
            
                       <td>
                                           中药注射剂标志
                    </td>
                    <td>
                        <select style="width: 120px" name="zyzsjbz" id="zyzsjbz" >
                          <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                     
                       </select>
                    </td>
                    <td>
                                                         激素标志
                    </td>
                    <td>
                        <select style="width: 120px" name="jsbz" id="jsbz"   >
                          <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                    </select>
                    </td>
                     <td>
                        辅助治疗药物标志
                    </td>
                    <td>
                        <select style="width: 120px" name="fzzlywbz" id="fzzlywbz" >
                     <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                    
                    </select>
                    </td>
     
                    <td>
                        是否基本药物
                    </td>
                    <td>
                       <select style="width: 120px" name="sfjbyw" id="sfjbyw" >
                         <option value="" style="width: 190px">-请选择- </option>
                          <option value="是" style="width: 190px">是  </option>
                          <option value="否"  style="width: 190px">否</option>
                    </select>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div class=" btn-div" style="float: right;width: 170px;margin-right: 10px !important;">
            <div class="float"><input type="text"  style="text-align: center;" onclick="searchUserFun()"  value="查询" class="btn-ok fs_16 float"></div>
            <div style="float: right;"><input type="text" onclick="cleanUserFun()"  style="text-align: center;"  value="重置"  class="btn-ok fs_16 float"></div>

        </div>
        </form>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>

    <div class="header-div-tj bg-color3 margin-top21">
        <table id="btn-table" class="margin-left10 float margin-top10" style="width: 25%;">
            <tr>
                <td>
                    <button class="btn-ok fs_16" id="increase">新增</button>
                </td>
                <td>
                    <button class="btn-ok fs_16" onclick="editFun()"  id="update">修改</button>
                </td>
                <td>
                    <button class="btn-ok fs_16">删除</button>
                </td>
               <!--  <td>
                    <button class="btn">导出</button>
                </td> -->
            </tr>
        </table>
    </div>

    <div class="body-width   margin-top15" style="height: 615px;overflow-x:auto;">
        <table id="medicineDataGrid" class="yz-msg-table border-val" style="width: 100%">
          
        </table>
    </div>
    <!--增加-弹出层-->
    <div class="BgDiv1"></div>
    <form action="" id="medicineaddForm"  method="post">
    <div class="DialogDiv1" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">药品字典新增</span>
        </div>

        <!--table数据-->
     <div class="body-width border-val" style="height: 300px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table " style="width: 96% !important;">
                <tbody>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>药品编码
                    </td>
                    <td>
                        <input name="ypdm"  validateOnCreate="false"  style="width: 148px;"   id="ypdm"  type="text" class="easyui-validatebox"  validType="account[1,20]"  data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>药品名称
                    </td>
                    <td>
                        <input name="ypmc" validateOnCreate="false" style="width: 148px;"     id="ypmc" type="text"  class="easyui-validatebox"  validType="length[1,30]"   data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>药品通用名
                    </td>
                    <td>
                        <input id="yptym" validateOnCreate="false"style="width: 148px;"     name="yptym" data-options="required:true" class="easyui-validatebox"  validType="length[1,15]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        药品别名
                    </td>
                    <td>
                        <input id="ypbm" validateOnCreate="false" style="width: 148px;"    name="ypbm"  class="easyui-validatebox"  validType="length[1,15]" />
                    </td>
                    <td>
                        药品规格
                    </td>
                    <td>
                        <input  id="gg" validateOnCreate="false"style="width: 148px;"     name="gg" lass="easyui-validatebox"  validType="length[1,15]" />
                    </td>
                    <td>
                        单位
                    </td>
                    <td>
                        <input id="dw" validateOnCreate="false" style="width: 148px;"     name="dw" class="easyui-numberbox" validType="length[1,10]"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        剂型
                    </td>
                    <td>
                        <input  id="jx"  validateOnCreate="false" style="width: 148px;"   name="jx" class="easyui-validatebox"  validType="length[1,20]"/>
                    </td>
                    <td>
                        剂量单位
                    </td>
                    <td>
                        <input id="jldw"  validateOnCreate="false" style="width: 148px;"   name="jldw"  class="easyui-validatebox"  validType="length[1,4]"/>
                    </td>
                    <td>
                        药品限定量
                    </td>
                    <td>
                        <input id="ypxdl"  validateOnCreate="false" style="width: 148px;"  name="ypxdl" class="easyui-validatebox"  validType="length[1,5]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        是否基本药物
                    </td>
                    <td>
                       <select id="sfjbyw" style="width: 148px;"  name="sfjbyw" >
                        <option value="" >-请选择- </option>
                          <option value="是" >是</option>
                          <option value="否"  >否</option>
                     
                     </select>
                    </td>
                    <td>
                        中西药标识
                    </td>
                    <td>
                        <select id="zxybz" name="zxybz" style="width: 148px;"  validType="length[1,2]" >
                           <option value="">-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0" >否</option>
                     
                    </select>
                    </td>
                    <td>
                        目录药类别
                    </td>
                    <td>
                        <!-- <select>
                            <option>请选择</option>
                            <option>请选择1</option>
                        </select> -->
                        <input id="muybz" style="width: 148px;"  name="mlylb" validateOnCreate="false"    class="easyui-validatebox"  validType="length[1,2]"  />
                    </td>
                </tr>
                <tr>
                    <td>
                        药品类别标志
                    </td>
                    <td>
                        <select id="yplbbz"style="width: 148px;"  name="yplbbz" >
                      <option value="" >-请选择- </option>
                          <option value="是" >是  </option>
                          <option value="否"  >否</option>
                     
                    </select>
                    </td>
                    <td>
                        药品分类代码
                    </td>
                    <td>
                        <input id="ypfldm"  validateOnCreate="false" style="width: 148px;"   name="ypfldm"  class="easyui-validatebox"  validType="account[1,20]"    />
                    </td>
                    <td>
                        药品分类名称
                    </td>
                    <td>
                        <input id="ypflmc"  validateOnCreate="false"style="width: 148px;"   name="ypflmc" class="easyui-validatebox"  validType="length[1,10]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        抗菌药物标志
                    </td>
                    <td>
                       <select id="kjywbz"style="width: 148px;"  name="kjywbz" >
                      <option value="" >-请选择- </option>
                          <option value="0" >是  </option>
                          <option value="1"  >否</option>        
                    </select>
                    </td>
                    <td>
                        抗菌药物级别
                    </td>
                    <td>
                        <input id="kjyjb" name="kjyjb" class="easyui-validatebox" style="width: 148px;"  validateOnCreate="false"    validType="length[1,4]" />
                    </td>
                    <td>
                        肿瘤用药标志
                    </td>
                    <td>
                       <select id="zlyybz"style="width: 148px;"  name="zlyybz" >
                    <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                     
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        中药注射剂标志
                    </td>
                    <td>
                      <select id="zyzsjbz" name="zyzsjbz"style="width: 148px;"  validType="length[1,2]" >
                       <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0" >否</option>
                     
                    </select>
                    </td>
                    <td>
                        激素标志
                    </td>
                    <td>
                       <select id="jsbz" style="width: 148px;"  name="jsbz" >
                       <option value="">-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                     
                     </select>
                    </td>
                    <td>
                        辅助药物标注
                    </td>
                    <td>
                       <select id="fzzlywbz"style="width: 148px;"  name="fzzlywbz" >
                     <option value="" >-请选择- </option>
                          <option value="1">是  </option>
                          <option value="0"  >否</option>
                     </select>
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
                    <td colspan="1"style="text-align:center;">    
                     <input id="ok" style="width: 80px"  type="submit"  value="确认" class="btn-ok fs_16"/>
                        <input id="back" style="width: 80px" type="button" value="取消" class="btn-cancel fs_16"/>
                    </td>
                    <td colspan="2">
                    
                        
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
 </form>
    <!--修改-弹出层-->
    <div class="BgDiv2"></div>
    <form action="" id="medicinetEditForm" method="post">
    <div class="DialogDiv2" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">药品字典修改</span>
        </div>

        <!--table数据-->
         
        <div class="body-width border-val" style="height: 300px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
           
            <table class="bz-zd-table " style="width: 96% !important;">
                <tbody>
                <tr>
                    <td>
                    <input name="id"   id="id"  type="hidden"    <%-- value="${medicine.id} --%>"/>
                        <span class="bz-zd-table-span">*</span>药品编码
                    </td>
                    <td>
                        <input name="ypdm"    validateOnCreate="false"  id="ypdm2"  type="text" style="width: 148px;"  class="easyui-validatebox"  validType="account[1,20]"  <%-- value="${medicine.ypdm}"  --%> data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>药品名称
                    </td>
                    <td>
                        <input name="ypmc"    validateOnCreate="false"    id="ypmc2" type="text" style="width: 148px;"  class="easyui-validatebox"  <%-- value="${medicine.ypmc}" --%>  validType="length[1,30]"   data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>药品通用名
                    </td>
                    <td>
                        <input id="yptym2"   validateOnCreate="false"  name="yptym" style="width: 148px;" data-options="required:true" class="easyui-validatebox" <%-- value="${medicine.yptym}" --%>   validType="length[1,15]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        药品别名
                    </td>
                    <td>
                        <input id="ypbm2"  name="ypbm"  class="easyui-validatebox"<%--  value="${medicine.ypbm}" --%>style="width: 148px;"    validType="length[1,15]" />
                    </td>
                    <td>
                        药品规格
                    </td>
                    <td>
                        <input  id="gg2" name="gg"  class="easyui-validatebox" <%--  value="${medicine.gg}" --%>style="width: 148px;"  validType="length[1,15]" />
                    </td>
                    <td>
                        单位
                    </td>
                    <td>
                        <input id="dw2"  <%-- value="${medicine.dw}" --%>  name="dw" style="width: 148px;"  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')" validType="length[1,10]"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        剂型
                    </td>
                    <td>
                        <input  id="jx2"  <%-- value="${medicine.jx}" --%> name="jx"style="width: 148px;"  class="easyui-validatebox"  validType="length[1,20]"/>
                    </td>
                    <td>
                        剂量单位
                    </td>
                    <td>
                        <input id="jldw2"  <%--  value="${medicine.jldw}" --%>name="jldw" class="easyui-validatebox"style="width: 148px;"   validType="length[1,4]"/>
                    </td>
                    <td>
                        药品限定量
                    </td>
                    <td>
                        <input id="ypxdl2"  <%-- value="${medicine.ypxdl}" --%> name="ypxdl" style="width: 148px;" class="easyui-validatebox"  validType="length[1,5]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        是否基本药物
                    </td>
                    <td>
                      <select id="sfjbyw2"  name="sfjbyw"style="width: 148px;"  <%-- value="${medicine.sfjbyw}" --%> > 
                     
                    <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                          </select>
                    </td>
                    <td>
                        中西药标识
                    </td>
                    <td>
                       <select id="zxybz2" name="zxybz" style="width: 148px;"   <%-- value="${medicine.zxybz}" --%>  >
                           <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                    </select>
                    </td>
                    <td>
                        目录药类别
                    </td>
                    <td>
                        <!-- <select>
                            <option>请选择</option>
                            <option>请选择1</option>
                        </select> -->
                       <input id="mlylb2" style="width: 148px;"  name="mlylb" class="easyui-validatebox" validType="length[1,2]"  <%-- value="${medicine.mlylb}" --%> />
                    </td>
                </tr>
                <tr>
                    <td>
                        药品类别标志
                    </td>
                    <td>
                       <select id="yplbbz2" style="width: 148px;"  name="yplbbz"  <%-- value="${medicine.yplbbz}" --%> >
                          <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                       </select>
                    </td>
                    <td>
                        药品分类代码
                    </td>
                    <td>
                        <input id="ypfldm2"  name="ypfldm"  class="easyui-validatebox  " style="width: 148px;" <%-- value="${medicine.ypfldm}" --%> validType="account[1,20]"    />
                    </td>
                    <td>
                        药品分类名称
                    </td>
                    <td>
                        <input id="ypflmc2" name="ypflmc" class="easyui-validatebox" style="width: 148px;"  <%-- value="${medicine.ypflmc}" --%> validType="length[1,10]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        抗菌药物标志
                    </td>
                    <td>
                     <select id="kjywbz2" name="kjywbz"  style="width: 148px;"  <%-- value="${medicine.kjywbz}"  --%> >
                         <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                     </select>
                    </td>
                    <td>
                        抗菌药物级别
                    </td>
                    <td>
                       <input id="kjywjb2" name="kjywjb" class="easyui-validatebox" style="width: 148px;"  validType="length[1,4]" <%-- value="${medicine.kjywjb}" --%> />
                    </td>
                    <td>
                        肿瘤用药标志
                    </td>
                    <td>
                    <select id="zlyybz2" name="zlyybz" style="width: 148px;"  <%-- value="${medicine.zlyybz}" --%>  >
                       <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                    </select>
                    </td>
                </tr>
                <tr>
                    <td>
                        中药注射剂标志
                    </td>
                    <td>
                     <select id="zyzsjbz2" name="zyzsjbz" style="width: 148px;"   <%-- value="${medicine.zyzsjbz} --%> >
                        <option value="" >-请选择- </option>
                          <option value="1" >是  </option>
                          <option value="0"  >否</option>
                     </select>
                    </td>
                    <td>
                        激素标志
                    </td>
                    <td>
                      <select id="jsbz2"  name="jsbz"  style="width: 148px;"  <%--  value="${medicine.jsbz}" --%>  >
                      
                         <option value="" >-请选择- </option>
                          <option value=1 >是  </option>
                          <option value=0  >否</option>
                      </select>
                    </td>
                    <td>
                        辅助药物标注
                    </td>
                    <td>
                      <select id="fzzlywbz2" name="fzzlywbz" style="width: 148px;"   <%--  value="${medicine.fzzlywbz}" --%>>
                         <option value="" >-请选择- </option>
                          <option value=1 >是  </option>
                          <option value=0  >否</option>
                      </select>
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
                    <td colspan="2"style="text-align:center;">    
                    
                       <input id="ok" style="width: 80px" type="submit"  value="确认" class="btn-ok"/>
                        <input id="back" style="width: 80px" type="button" value="取消" class="btn-cancel"/>
                    </td>
                    <td colspan="1">
                    
                      
                    </td>
                </tr>
                </tbody>
            </table>
          
        </div>
        
    </div>
	   </form>
	 
<!-- <div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 150px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                    <th>药品名称:</th>
                    <td><input name="ypmc" id="ypmc" placeholder="请输入名称" style="width: 120px;" /></td>
                     <th>药品通用名:</th>
                    <td><input name="yptym" id="yptym" placeholder="请输入名称"/></td> 
                    <th>药品分类名称:</th>
                    <td><input name="ypflmc" id="ypflmc" placeholder="请输入名称"/></td>   
                    <th>是否基本药:</th>
                    <td><select name="sfjbyw" id="sfjbyw" placeholder="请输入名称">
                         <option value="" style="width: 190px">-请选择- </option>
                          <option value="是" style="width: 190px">是  </option>
                          <option value="否"  style="width: 190px">否</option>
                    </select></td> 
                </tr>
                <tr>
                    <th>抗菌药物标志:</th>
                    <td><select name="kjywbz" id="kjywbz" placeholder="请输入名称" style="width: 120px;">
                        <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                    </select></td>
                     <th>肿瘤药物标志:</th>
                    <td><select name="zlyybz" id="zlyybz" placeholder="请输入名称">
                         <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                    </select></td> 
                    <th>中药注射剂标志:</th>
                    <td><select name="zyzsjbz" id="zyzsjbz" placeholder="">
                          <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                     
                       </select></td>   
                    <th>激素标志:</th>
                    <td><select name="jsbz" id="jsbz"  style="width: 190px  placeholder="请输入名称"/>
                          <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                    </select></td> 
                </tr>
                <tr>
                
                <th>辅助治疗药物标志:</th>
                    <td><select name="fzzlywbz" id="fzzlywbz" placeholder="请输入名称">
                     <option value="" style="width: 190px">-请选择- </option>
                          <option value="1" style="width: 190px">是  </option>
                          <option value="0"  style="width: 190px">否</option>
                    
                    </select></td> 
                
                </tr>
                  <tr><td>
                        
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">重置</a>
                    </td></tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'项目列表'" >
        <table id="medicineDataGrid" data-options="fit:true,border:false"></table>
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
            $("#").click(function () {
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