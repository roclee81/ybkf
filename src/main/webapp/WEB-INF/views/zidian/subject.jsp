<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
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
    var userDataGrid;
    var organizationTree;
    $(function() { 	   
     /*   $('#ksbm').combobox({
       url:'${path }/department/getType?ksbm',
       valueField:'ksbm',
       textField:'ksbm'
     }); */
        $('#xmlb').combobox({
           url:'${path }/subject/getType?clum=xmlb',
           valueField:'xmlb',
           textField:'xmlb'
         }); 
       /*  $('#xmmc').combobox({
           url:'${path }/subject/getType?clum=xmmc',
           valueField:'xmmc',
           textField:'xmmc'
         }); */
      
    	 $('#xmlb2').combobox({
             url:'${path }/subject/getType?clum=xmlb',
             valueField:'xmlb',
             textField:'xmlb'
           }); 
    	 $('#xmlb3').combobox({
             url:'${path }/subject/getType?clum=xmlb',
             valueField:'xmlb',
             textField:'xmlb'
           }); 
         $('#zzksmc').combobox({
             url:'${path }/subject/getType?clum=zzksmc',
             valueField:'zzksmc',
             textField:'zzksmc'
           });
         
         
         $('#xmlb2').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
        
         $('#xmlb3').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
        
         
         $('#ssdj').combobox({
     		 onHidePanel: function () {
     			 checkCombobox(this);
     		 }
     	 });
         $('#ssdj2').combobox({
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
        subjectDataGrid = $('#subjectDataGrid').datagrid({
            url : '${path }/subject/dataGrid',
            fit : true,
            striped : true,
            rownumbers : true,
            pagination : true,
           singleSelect : false,
       //     idField : 'id',
       //    sortName : 'xmbm',
            CheckOnSelect:false,
            SelectOnCheck:false,
	        sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [{
            	field:'ck',
            	checkbox : true
            	
             }, {
                width : '10%',
                title : '<font size="3px">项目分类</font>',
                field : 'xmlb'
           
            }, {
                width : '10%',
                title : '<font size="3px">项目编码</font>',
                field : 'xmbm'
          
            },{
                width : '10%',
                title : '<font size="3px">项目名称</font>',
                field : 'xmmc'
           
            }, {
                width : '10%',
                title : '<font size="3px">项目规格</font>',
                field : 'xmgg'
              
            }, {
                width : '10%',
                title : '<font size="3px">执行科室代码</font>',
                field : 'zxksdm'
            
            }, {
                width : '10%',
                title : '<font size="3px">执行科室名称</font>',
                field : 'zxksmc'
              
            },{
                width : '10%',
                title : '<font size="3px">单位</font>',
                field : 'dw'
               
            }, {
                width : '10%',
                title : '<font size="3px">数量</font>',
                field : 'sl'
              
            }, {
                width : '10%',
                title : '<font size="3px">频次</font>',
                field : 'pc'
              
            }, {
                width : '10%',
                title : '<font size="3px">计价费用</font>',
                field : 'jjfy'
             
            }, {
                width : '10%',
                title : '<font size="3px">实收费用</font>',
                field : 'ssfy'
             
            }, {
                width : '10%',
                title : '<font size="3px">单价</font>',
                field : 'Dj'
            
            }, {
                width : '10%',
                title : '<font size="3px">费用类别编码</font>',
                field : 'fylbbm'
              
            }, {
                width : '10%',
                title : '<font size="3px">费用类别名称</font>',
                field : 'fylbmc'
               
            },  {
                width : '10%',
                title : '<font size="3px">费用类别名称2</font>',
                field : 'fylbmc2'
              
            },   {
                width : '10%',
                title : '<font size="3px">费用类别名称3</font>',
                field : 'fylbmc3'
              
            },   {
                width : '10%',
                title : '<font size="3px">手术等级</font>',
                field : 'ssdj'
             
            },   {
                width : '10%',
                title : '<font size="3px">切口等级</font>',
                field : 'qkdj'
             
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
            	
            }
           
        });
        
        
        $('#subjecteditForm').form({
     		 url : '${path }/subject/edit',
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
                 		subjectDataGrid.datagrid('load', $.serializeObject($('#searchSubjectForm')));
                 	 $.messager.alert( '提示',result.msg, 'warning');
                	}
                    else
                	{
                    	parent.$.messager.alert('提示', result.msg, 'warning');
                	}
                }
     	 });
       
      	$('#subjectAddForm').form({
     		 url : '${path }/subject/add',
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
                 		subjectDataGrid.datagrid('load', $.serializeObject($('#searchSubjectForm')));
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
            href : '${path }/subject/addPage',
            buttons : [ {
                text : '添加',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = subjectDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#subjectAddForm');
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
         var rows = $('#subjectDataGrid').datagrid('getSelections');
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
                    $.post('${path }/subject/delete', {
                        id : ss
                    }, function(result) {
                        if (result.success) {
                            parent.$.messager.alert('提示', result.msg, 'info');
                            subjectDataGrid.datagrid('reload');
                        }
                        progressClose();
                    }, 'JSON');
               
            }
        });
    }
    
    function editUserFun() {
    	var id;
    	 var ss = [];
         var rows = $('#subjectDataGrid').datagrid('getSelections');
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
        
       // location.href='${path }/subject/editPage?subjectId=' + id+"&id="+pageId+"&pid="+pagepId+"&ppid="+pageppId;
        /* parent.$.modalDialog({
            title : '编辑',
            width : 800,
            height : 400,
            href : '${path }/subject/editPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = subjectDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#subjectEditForm');
                    f.submit();
                }
            },{
                text : '取消',
                handler : function() {
                	parent.$.modalDialog.handler.dialog('close');

                }
            }  ]
        }); */
        
       	 $.post('${path }/subject/editPage', {
       		subjectId : id
          }, function(result) {
         	 showDiv2(); 
              $('#id').val(result.id);
              $('#xmlb3').val(result.xmlb);
              $('#xmbm2').val(result.xmbm);
              $('#xmmc2').val(result.xmmc);
              $('#xmgg2').val(result.xmgg);
              $('#zxksdm2').val(result.zxksdm);
              $('#zxksmc2').val(result.zxksmc);
              $('#dw2').val(result.dw);
              $('#sl2').val(result.sl);
              $('#pc2').val(result.pc);
              $('#jjfy2').val(result.jjfy);
              $('#ssfy2').val(result.ssfy);
              $('#dj2').val(result.dj);
              $('#fylbbm2').val(result.fylbbm);
              $('#fylbmc12').val(result.fylbmc);
              $('#fylbmc22').val(result.fylbmc2);
              $('#fylbmc32').val(result.fylbmc3);
              $('#xmlb3').combobox('setValue',result.xmlb);
              $('#ssdj2').combobox('setValue', result.ssdj);
              $('#qkdj2').combobox('setValue',result.qkdj);
     
            	            
              
              
          }, 'JSON');
    }
    
    function searchUserFun() {
    	subjectDataGrid.datagrid('load', $.serializeObject($('#searchSubjectForm')));
    }
    function cleanUserFun() {
        $('#searchSubjectForm input').val('');
        subjectDataGrid.datagrid('load', {});
    }
    function addSubject() {
		$.ajax({
			type: "post",
	 		url: '${path }/subject/add',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#subjectAddForm').serialize()  ,	
	 	    success: function (result) {
	 	    //	 result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv1").css("display","none");
	                	 $(".DialogDiv1").css("display", "none")
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                } else {
	                	 $.messager.alert( '提示',result.msg, 'warning');
	                }
	 	    }
		})
		
    	
	}
    function editSubject() {
		$.ajax({
			type: "post",
	 		url: '${path }/subject/edit',
	 	    cache: false,
	 	    async : false,
	 	    dataType: "json",
	 	    data: $('#subjecteditForm').serialize()  ,	
	 	    success: function (result) {
	 	    //	 result = $.parseJSON(result);
	                if (result.success) {
	                	$(".BgDiv2").css("display","none");
	                	 $(".DialogDiv2").css("display", "none")
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
 <div class="body-width fs_18 bold header-color">项目字典</div>
    <div class="header-div-tj bg-color3 margin-top21">
        <form action="" id="searchSubjectForm" method="post">
        <div style="width: 80%;float: left">
            <table class="margin-left10 margin-top6">
                <tbody>
                <tr style="display: block;margin-top: 8px">
                    <td class="input-td">项目类别</td>
                    <td>
                        <input name="xmlb" id="xmlb" class=""   style="width:120px;height: 30px;"  />
                    </td>
                    <td class="input-td" style="padding-left: 48px">项目名称</td>
                    <td>
                        <input name="xmmc" id="xmmc"    style="width:140px;height: 30px;"  />
                    </td>
                    
                </tr>
                </tbody>
            </table>
        </div>
        <div style="float: right;margin-right:34px;margin-top: 10px ">
            <input type="text" onclick="searchUserFun()" style="text-align: center;"  value="查询" class="btn-ok fs_16">
            <input type="text" onclick="cleanUserFun()" style="text-align: center;"  value="重置" class="btn-ok fs_16">
        </div>
        </form>
    </div>

    <div class="header-div-tj bg-color3 margin-top21">
        <table  id="btn-table" class="margin-left10 float margin-top10" style="width: 25%;">
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
              <!--   <td>
                    <button class="btn">导出</button>
                </td> -->
            </tr>
        </table>
    </div>

    <div class="body-width   margin-top15" style="height: 615px;overflow-x:auto;">
        <table id="subjectDataGrid" class="yz-msg-table border-val" style="width: 100%">
            
        </table>
    </div>
    <!--弹出层-->
    <div class="BgDiv1"></div>
    <div class="DialogDiv1" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">项目字典新增</span>
        </div>

        <!--table数据-->
        <form id="subjectAddForm" method="post">
        <div  class="body-width border-val" style="height: 300px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                        <span class="bz-zd-table-span">*</span>项目类别
                    </td>
                    <td>
                        <input  name="xmlb"  validateOnCreate="false"   id="xmlb2"  type="text"  style="width: 148px;"      data-options="required:true"  validType="account[1,10]"  data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>项目编码
                    </td>
                    <td>
                        <input name="xmbm" validateOnCreate="false"   id="xmbm" type="text"  style="width: 148px;"  class="easyui-validatebox"  validType="account[1,20]"    data-options="required:true" />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>项目名称
                    </td>
                    <td>
                        <input  id="xmmc" validateOnCreate="false"   name="xmmc" style="width: 148px;"   data-options="required:true" class="easyui-validatebox"  validType="length[1,50]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span></span>项目规格
                    </td>
                    <td>
                      <input id="xmgg"  validateOnCreate="false"  name="xmgg"  style="width: 148px;"  class="easyui-validatebox"  validType="length[1,10]"  />
                    </td>
                    <td>
                        <span></span>执行科室代码
                    </td>
                    <td>
                        <input id="zxksdn" validateOnCreate="false"  name="zxksdm" style="width: 148px;"   class="easyui-validatebox"  validType="account[1,10]"  />
                    </td>
                    <td>
                        <span></span>执行科室名称
                    </td>
                    <td>
                        <input type="text" validateOnCreate="false"  name="zxksmc" style="width: 148px;"   class="easyui-validatebox"  validType="length[1,5]"    />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>单位
                    </td>
                    <td>
                      <input id="dw"  name="dw" validateOnCreate="false" style="width: 148px;"   class="easyui-validatebox"  validType="length[1,5]"  />
                    </td>
                    <td>
                        <span></span>数量
                    </td>
                    <td>
                        <input id="sl" validateOnCreate="false" style="width: 148px;"   name="sl" class="easyui-numberbox"   />
                    </td>
                    <td>
                        <span></span>频次
                    </td>
                    <td>
                        <input  id="pc" validateOnCreate="false" style="width: 148px;"   name="pc" class="easyui-validatebox"  validType="length[1,5]"   />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>计价费用
                    </td>
                    <td>
                      <input id="jjfy"  validateOnCreate="false" style="width: 148px;"  name="jjfy" class="easyui-numberbox"  />
                    </td>
                    <td>
                        <span></span>实收费用
                    </td>
                    <td>
                        <input id="ssfy" validateOnCreate="false" style="width: 148px;"  name="ssfy"  class="easyui-numberbox"  />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>单价
                    </td>
                    <td>
                        <input  id="dj" validateOnCreate="false"style="width: 148px;"   name="dj" class="easyui-numberbox" data-options="required:true"  />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>费用类别编码
                    </td>
                    <td>
                      <input id="fylbbm" validateOnCreate="false" style="width: 148px;"     name="fylbbm" class="easyui-validatebox"  validType="account[1,20]" />
                    </td>
                    <td>
                        <span></span>费用类别名称
                    </td>
                    <td>
                        <input id="fylbmc" validateOnCreate="false"style="width: 148px;"   name="fylbmc"  class="easyui-validatebox"  validType="length[1,10]"  />
                    </td>
                    <td>
                        <span></span>费用类别名称2
                    </td>
                    <td>
                        <input id="fylbmc2"  validateOnCreate="false" style="width: 148px;"  name="fylbmc2"  class="easyui-validatebox"  validType="length[1,10]"  />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>费用类别名称3
                    </td>
                    <td>
                      <input id="fylbmc3" validateOnCreate="false" style="width: 148px;"  name="fylbmc3"  class="easyui-validatebox"  validType="length[1,10]" />
                    </td>
                    <td>
                        <span></span>手术等级
                    </td>
                    <td>
                        <input id="ssdj"validateOnCreate="false" style="width: 148px;"   name="ssdj" class="easyui-combobox"  validType="length[1,10]"
                     data-options="
                    url:'${path }/paramter/getType?clum=ssjb',
                    method:'post',
                   
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'100px',"
                    />
                    
                    
                    </td>
                    <td>
                        <span></span>切口等级
                    </td>
                    <td>
                       <select id="qkdj"  style="width: 148px;"  name="qkdj" >
                         <option value="1" >一级</option>
                          <option value="2" >二级  </option>
                          <option value="3"  >三级</option>        
                     </select>
                    </td>
                </tr>
             <!--    <tr>
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
                    <td colspan="1"style="text-align:center;">    
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
            <span class="float pop-up-span width-color dis-block">项目字典修改
            </span>
        </div>

        <!--table数据-->
        <form id="subjecteditForm" method="post">
        <div  class="body-width border-val" style="height: 300px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                    <input name="id"   id="id"  validateOnCreate="false"   type="hidden"  class="easyui-validatebox"    data-options="required:true" <%-- value="${subject.id }" --%>/> 
                        <span class="bz-zd-table-span">*</span>项目类别
                    </td>
                    <td>
                        <input  name="xmlb" validateOnCreate="false"   style="width: 148px;"   id="xmlb3"  type="text"  <%--   value="${subject.xmlb }"  --%> data-options="required:true"  validType="account[1,10]"  data-options="required:true"/>
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>项目编码
                    </td>
                    <td>
                        <input name="xmbm" validateOnCreate="false"  style="width: 148px;"  id="xmbm2" type="text"  <%-- value="${subject.xmbm }" --%> class="easyui-validatebox"  validType="account[1,20]"    data-options="required:true" />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>项目名称
                    </td>
                    <td>
                        <input  id="xmmc2" validateOnCreate="false"  style="width: 148px;"  name="xmmc"  data-options="required:true" class="easyui-validatebox"  <%-- value="${subject.xmmc }" --%> validType="length[1,50]" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <span></span>项目规格
                    </td>
                    <td>
                      <input id="xmgg2"  validateOnCreate="false"style="width: 148px;"   name="xmgg"  <%--   value="${subject.xmgg}"  --%>class="easyui-validatebox"  validType="length[1,10]"  />
                    </td>
                    <td>
                        <span></span>执行科室代码
                    </td>
                    <td>
                        <input id="zxksdm2" validateOnCreate="false" style="width: 148px;"  name="zxksdm"  <%-- value="${subject.zxksdm }"  --%>  class="easyui-validatebox"  validType="account[1,10]"  />
                    </td>
                    <td>
                        <span></span>执行科室名称
                    </td>
                    <td>
                        <input id="zxksmc2" validateOnCreate="false"style="width: 148px;"   name="zxksmc" <%--  value="${subject.zxksmc }" --%> class="easyui-validatebox"  validType="length[1,5]"    />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>单位
                    </td>
                    <td>
                      <input id="dw2"  validateOnCreate="false" style="width: 148px;"   name="dw" class="easyui-validatebox"  <%--  value="${subject.dw }"  --%>  validType="length[1,5]"  />
                    </td>
                    <td>
                        <span></span>数量
                    </td>
                    <td>
                        <input id="sl2" validateOnCreate="false" style="width: 148px;"  name="sl"  onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"   <%--  value="${subject.sl }" --%>  />
                    </td>
                    <td>
                        <span></span>频次
                    </td>
                    <td>
                        <input  id="pc2" validateOnCreate="false" style="width: 148px;"  name="pc" class="easyui-validatebox" <%-- value="${subject.pc }"  --%>  validType="length[1,5]"   />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>计价费用
                    </td>
                    <td>
                      <input id="jjfy2" validateOnCreate="false" style="width: 148px;"  style="width: 148px;"   <%-- value="${subject.jjfy}" --%>  name="jjfy" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  />
                    </td>
                    <td>
                        <span></span>实收费用
                    </td>
                    <td>
                        <input id="ssfy2" validateOnCreate="false"style="width: 148px;"  style="width: 148px;"  name="ssfy"  <%-- value="${subject.ssfy }" --%> onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  />
                    </td>
                    <td>
                        <span class="bz-zd-table-span">*</span>单价
                    </td>
                    <td>
                        <input  id="dj2"validateOnCreate="false"  style="width: 148px;"  name="dj"onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')"  <%-- value="${subject.dj }" --%> data-options="required:true"  />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>费用类别编码
                    </td>
                    <td>
                      <input id="fylbbm2"  validateOnCreate="false" style="width: 148px;"    name="fylbbm" <%-- value="${subject.fylbbm}" --%> class="easyui-validatebox"  validType="account[1,20]" />
                    </td>
                    <td>
                        <span></span>费用类别名称
                    </td>
                    <td>
                        <input id="fylbmc12" validateOnCreate="false"style="width: 148px;"   name="fylbmc"  class="easyui-validatebox" <%--  value="${subject.fylbmc}"  --%>validType="length[1,10]"  />
                    </td>
                    <td>
                        <span></span>费用类别名称2
                    </td>
                    <td>
                        <input id="fylbmc22" validateOnCreate="false" style="width: 148px;"  name="fylbmc2"  class="easyui-validatebox" <%--  value="${subject.fylbmc2}"  --%> validType="length[1,10]"  />
                    </td>
                </tr>
              <tr>
                    <td>
                        <span></span>费用类别名称3
                    </td>
                    <td>
                      <input id="fylbmc32"  validateOnCreate="false" style="width: 148px;"  name="fylbmc3"   <%-- value="${subject.fylbmc3}" --%> class="easyui-validatebox"  validType="length[1,10]" />
                    </td>
                    <td>
                        <span></span>手术等级
                    </td>
                    <td>
                        <input id="ssdj2" validateOnCreate="false"style="width: 148px;"   name="ssdj" class="easyui-combobox" <%-- value="${subject.ssdj}" --%>   validType="length[1,10]"
                     data-options="
                    url:'${path }/paramter/getType?clum=ssjb',
                    method:'post',
                  
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'100px',"
                    />
                    
                    
                    </td>
                    <td>
                        <span></span>切口等级
                    </td>
                    <td>
                      <input id="qkdj2"  validateOnCreate="false" style="width: 148px;"   name="qkdj" class="easyui-combobox" <%-- value="${subject.qkdj}"  --%>
                      data-options="
                    url:'${path }/paramter/getType?clum=ssjb',
                    method:'post',
                    required:true,
                    valueField:'pValue',
                    textField:'pName',
                    panelHeight:'100px',
                   
                    "  />
                    </td>
                </tr>
                <!-- <tr>
                    <td colspan="2" style="text-align: center;color:#DF2828">
                        注：(*为必须项)
                    </td>
                    <td colspan="2"></td>
                    <td colspan="1">
                        <input id="ok" type="submit" value="确认" class="ok btn"/>
                        
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
                    <td colspan="1"style="text-align:center;"> 
                    
                         <input id="ok" type="submit" style="width: 80px"  value="确认" class="btn-ok"/>
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
<!-- <div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 50px; overflow: hidden;background-color: #fff">
        <form id="searchUserForm">
            <table>
                <tr>
                    <th>项目类别:</th>
                    <td><select name="xmlb" id="xmlb" placeholder="-请选择-" style="width: 120px;"></select></td>
                     <th>项目名称:</th>
                    <td><input name="xmmc" id="xmmc" placeholder="请输入名称"/></td> 
                  
                </tr>
                  <tr><td>
                        
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="searchUserFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="cleanUserFun();">重置</a>
                    </td></tr>
            </table>
        </form>
    </div>
    <div data-options="region:'center',border:true,title:'项目列表'" >
        <table id="subjectDataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div data-options="region:'west',border:true,split:false,title:'组织机构'"  style="width:150px;overflow: hidden; ">
        <ul id="organizationTree" style="width:160px;margin: 10px 10px 10px 10px"></ul>
    </div>
</div>
<div id="userToolbar" style="display: none;">
  
        <a onclick="addDepartFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-plus icon-green'">添加</a>
        <a onclick="editUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-pencil icon-blue'">编辑</a>
        <a onclick="deleteUserFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-x icon-red'">删除</a>

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