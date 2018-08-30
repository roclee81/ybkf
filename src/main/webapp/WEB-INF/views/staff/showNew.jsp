<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#btn-table .btn
{
    background: #4373FF;
    color: #ffffff;
}
#btn-table .btn:hover
{
    color: #1E1E1E;
}
 #btn-table td{
        padding-right:20px;
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
	width: 99% !important;
	height: 30px !important;
}
.datagrid-body
{
  overflow-x:hidden;
}
.textbox-text,.textbox
{
	width: 148px !important;
	height: 30px !important;
}
</style>
<script type="text/javascript">
var staffDataGrid;
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
$(function() {
	
    staffDataGrid = $('#staffDataGrid').datagrid({
        url : '${path }/staff/selectall',
      //striped : true,
       // rownumbers : true,
        pagination : true,
       // remoteFilter: true,
        singleSelect : false,
       // idField : 'rybh',
		sortName : 'RYBH',
    	sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        onLoadSuccess:function(data){
			
        },
        onBeforeLoad: function (param) {
      	  updateDatagridHeader(this);
        },
        toolbar : '#roleToolbar'
    });
    //.datagrid('enableFilter', [{
      //  field:'rylb',
     //   type:'numberbox',
     //   options:{precision:0},
    //    op:['less','greater']
   // }]);
	$('#erylbcombox').combobox({
  		 onHidePanel: function () {
  			 checkCombobox(this);
  		 }
  	 });
   	$('#eksbmcombox').combobox({
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
					$('#rybh').val('');
					$('#xm').val('');
					$('#ksbmcombox').combobox('clear');
					$('#rylbcombox').combobox('clear');
                    $(".BgDiv1").css("display", "none");
                    $(".DialogDiv1").css("display", "none");
                    parent.$.messager.alert('提示', '添加成功', 'info');
               } else {
                   parent.$.messager.alert('错误', result.msg, 'error');
               }
           }
       });
});

</script>
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
        $(".BgDiv1,#back").click(function() {
	       	 $('#ssdm').val('');
	    	 $('#ssmc').val('');
	    	 $('#ssjb1').val('');
           $(".BgDiv1").css("display", "none");
           $(".DialogDiv1").css("display", "none");
           $(".DialogDiv2").css("display", "none");
           });
    });

    <!--弹出层-->
    $(function () {
         $("#increase").click(function () {
            // var str = "我是弹出对话框";
            $(".BgDiv1").css("z-index","100");
            $(".BgDiv1").css({ display: "block", height: $(document).height()});
            $(".DialogDiv1").css("top", "5%");
            $(".DialogDiv1").css("display", "block");
            document.documentElement.scrollTop = 0;
        });
        $(".BgDiv1 #cancel1").click(function() {
            $(".BgDiv1").css("display", "none");
            $(".DialogDiv1").css("display", "none");  
        });
        $("#edit").click(function () {
            // var str = "我是弹出对话框";

        	var rows = $('#staffDataGrid').datagrid('getSelections');
        	if(rows.length!=1){
        		parent.$.messager.alert('提示','只能一次编辑一个用户', 'info');
        	}else{
                $(".BgDiv1").css("z-index","100");
                $(".BgDiv1").css({ display: "block", height: $(document).height()});
                $(".DialogDiv2").css("top", "5%");
                $(".DialogDiv2").css("display", "block");
                document.documentElement.scrollTop = 0;
                $.ajax({
            		type: "POST",
                    url: "${path }/staff/editNew?id="+rows[0].id,
                    dataType: "json",
                    success: function(data){
                    	$('#erybh').val(data.rybh);
                    	$('#exm').val(data.xm);
                    	$('#eid').val(data.id);
                    	$('#eksbmcombox').combobox('setValue',data.ksbm);
                    	$('#erylbcombox').combobox('setValue',data.rylb);
                    }
                })
        	}

        });
        $('#staffEditForm').form({
            url : '${path }/staff/edit',
            onSubmit : function() {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success : function(result) {
            	//alert(result);
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                	parent.$.messager.alert('提示', '修改成功', 'info');
                    $('#staffDataGrid').datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    $(".BgDiv1").css("display", "none");
                    $(".DialogDiv2").css("display", "none");  
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
/* 	    $(".combo").click(function(){
	    	$(this).prev().combobox("showPanel");
	    	}) */
    });

    
    $("a,button").focus(function(){this.blur()});
    

</script>
<script type="text/javascript">
	function fuzzyquery(){
		$('#staffDataGrid').datagrid('load',$.serializeObject($('#fuzzy')));
	}
	function reload(){
		$('.input').val('');
		$('.easyui-combobox').combobox('clear');
		$('#staffDataGrid').datagrid('load',$.serializeObject($('#fuzzy')));
	}
    function addStaffFun() {
        parent.$.modalDialog({
            title : '添加',
            width : 500,
            height : 300,
            href : '${path }/staff/addPage',
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = staffDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#staffAddForm');
                    if(parent.$.modalDialog.handler.find('#msg').text()=="编号重复"){
                    	//??$.modalDialog.messager.alert('info','编号重复！');
                    	return false;
                    }
                    f.submit();
                }
            },{
                text : '取消',
                handler : function() {
                	parent.$.modalDialog.handler.dialog('close');
                }
            } ]
        });
    }
    function delStaffFun(){
    	var sel = $('#staffDataGrid').datagrid('getSelections');
    	if(sel.length==0){
    		parent.$.messager.alert('提示','请至少选择一项进行删除', 'info');
    	}else{
    	parent.$.messager.confirm('询问', '您是否要批量删除当前工作人员？', function(b) {
            if (b) {
                progressLoad();
                var rows = $('#staffDataGrid').datagrid('getSelections');
            	var str="";
            	for(var i=0; i<rows.length; i++){
            		str+=(rows[i].id+",");
                }
            	$.ajax({
            		type: "POST",
                    url: "${path }/staff/delstaff?ids="+str,
                    dataType: "json",
                    success: function(result){
                    	parent.$.messager.alert('提示', result.msg, 'info');
                    	staffDataGrid.datagrid('reload');
                    	progressClose();
                    }
            	})
            }
        });
    	}

    }
    function editStaffFun() {
    	var rows = $('#staffDataGrid').datagrid('getSelections');
    	if(rows.length!=1){
    		parent.$.messager.alert('提示','只能一次编辑一个用户', 'info');
    	}else{
	        parent.$.modalDialog({
	            title : '编辑',
	            width : 500,
	            height : 300,
	            href : '${path }/staff/editPage?id='+rows[0].id,
	            buttons : [ {
	                text : '确定',
	                handler : function() {
	                    parent.$.modalDialog.openner_dataGrid = staffDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
	                    var f = parent.$.modalDialog.handler.find('#staffEditForm');
	                    f.submit();
	                }
	            } ]
	        });
        }
    }
	var rylbjson=null;
    function transry(val,row){
    	if(rylbjson==null){
    		$.ajax({
    			type:'POST',
    			url:'${path }/staff/rylboption',
    			dataType:'JSON',
    			//如果不加async 要打印20次
    			async:false,
                success: function(data){
                	rylbjson=data;
                 }
    		})
    	}
    	for(var i=0;i<rylbjson.length;i++){
    		if(val==rylbjson[i].ID){
    			return "<span>"+rylbjson[i].NAME+"</span>"
    		}
    	}

    }
var ssksjson=null;
function transks(val,row){
    	if(ssksjson==null){
    		$.ajax({
    			type:'POST',
    			url:'${path }/staff/ssksoption',
    			dataType:'JSON',
    			//如果不加async 要打印20次
    			async:false,
                success: function(data){
                	ssksjson=data;
                 }
    		})
    	}
    	for(var i=0;i<ssksjson.length;i++){
    		if(val==ssksjson[i].ksbm){
    			return "<span>"+ssksjson[i].ksmc+"</span>"
    		}
    	}

    }
    
function checkid(){
	//this.value=this.value.replace(/[^\u0000-\u00FF]/,'');
	$.ajax({
		 type: "POST",
         url: "${path }/staff/checkid?id="+$('#rybh').val(),
         dataType: "json",
         success: function(data){
                     if(data){
                    	 
                     }else{
                    	 parent.$.messager.alert('提示','编号重复', 'info');
                    	 $('#rybh').val('');
                     }
                  }
	});
	
}

</script>
<script type="text/javascript">
$(function(){
	$('#ksbm').combobox({
        url:'${path }/staff/depoption',
        method:'get',
        valueField:'ksbm',
        textField:'ksmc',
        panelHeight:'300px',
        label: 'Language:',
        labelPosition: 'top'
	});
	$('#rylb').combobox({
        url:'${path }/staff/rylboption',
        method:'get',
        valueField:'ID',
        textField:'NAME',
        panelHeight:'300px',
        label: 'Language:',
        labelPosition: 'top'
	});
})

</script>
<script type="text/javascript">
	$(function(){
		$('#ksbmcombox').combobox({
            url:'${path }/staff/depoption',
            required:true,
            validateOnCreate:false,
            method:'get',
            valueField:'ksbm',
            textField:'ksmc',
            panelHeight:'300px',
            label: 'Language:',
            labelPosition: 'top'
		})
	})
</script>

                        <script type="text/javascript">
                        	$(function(){
                        		$('#rylbcombox').combobox({
                                    url:'${path }/staff/rylboption',
                                    method:'get',
                                    required:true,
                                    validateOnCreate:false,
                                    valueField:'ID',
                                    textField:'NAME',
                                    panelHeight:'300px',
                                    label: 'Language:',
                                    labelPosition: 'top'
                        		});
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
                        	})
                        </script>
</head>
<body>
   <div class="xPage">
<%-- <jsp:include page="../include/tophead.jsp" /> --%>
	
	 <div class="xMain">
	<%-- <jsp:include page="../include/leftMenu.jsp" /> --%>
	 <div class="xRightbox">
    <div class="pop-up bg-color1">
        <span class="float pop-up-span width-color dis-block">工作人员字典</span>
    </div>

    <div class="header-div-tj bg-color3 margin-top21">
        <div style="width: 80%;float: left">
        <form id='fuzzy' >
            <table class="margin-left10 margin-top6">
                <tbody>
                <tr style="display: block;margin-top: 8px">
                    <td class="input-td">人员编号</td>
                    <td>
						<input class='input' name="rybh" style="width:60px;">
                    </td>
                    <td class="input-td" style="padding-left: 48px">姓名</td>
                    <td>
                        <input  class='input' name="xm"  style="width:60px;">
                    </td>
                    <td class="input-td" style="padding-left: 48px">所属科室</td>
                    <td style="padding-left: 6px; text-align: left">
<input id='ksbm'  class="easyui-combobox" name="ksbm"  style="width:100px;">

                    </td>
                    <td class="input-td" style="padding-left: 48px">人员类别</td>
                    <td style="padding-left: 6px; text-align: left">
						<input id='rylb'  class="easyui-combobox" name="rylb" style="width:100px;">
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
        <div style="float: right;margin-right:34px;margin-top: 10px ">
            <button class="btn" onclick="fuzzyquery()">查询</button>
            <button class="btn" onclick="reload()">重置</button>
        </div>
    </div>

    <div class="header-div-tj bg-color3 margin-top21">
        <table id="btn-table" class="margin-left10 float margin-top10" style="width: 25%;">
            <tr>
                <td>
                    <button class="btn" id="increase" ">新增</button>
                </td>
                <td>
                    <button id='edit' class="btn">修改</button>
                </td>
                <td>
                    <button class="btn" onclick="delStaffFun()">删除</button>
                </td>

            </tr>
        </table>
    </div>

    <div class="body-width   margin-top15" style="height: 620px;width: 100%">
        <table id='staffDataGrid' class="yz-msg-table border-val" style="width: 100%%;height: 100%">
	        <thead>
	            <tr>
	                <th data-options="field:'id',checkbox:true"><font size="3px">id</font></th>
	                <th data-options="field:'rybh',width:'25%'"><font size="3px">人员编号</font></th>
	                <th data-options="field:'xm',width:'25%'"><font size="3px">姓名</font></th>
	                <th data-options="field:'ksbm',width:'25%',formatter:transks"><font size="3px">所属科室</font></th>
	                <th data-options="field:'rylb',width:'25%',formatter:transry"><font size="3px">人员类别</font></th>
	            </tr>
	        </thead>
        </table>
    </div>
    <!--弹出层-->
    <div class="BgDiv1"></div>
    <div class="DialogDiv1" style="display: none">
        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">工作人员字典新增</span>
        </div>

        <!--table数据-->
        <div class="body-width margin-top10" style="height: 416px">
        <form id="staffAddForm" method="post">
                            <div class="body-width border-val" style="height: 90px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tbody>
                <tr>
                    <td>
                        <span style="color: red">*</span>人员编号
                    </td>
                    <td>
                    	<input id='rybh' onblur="checkid()" onkeyup="this.value=this.value.replace(/[^\u0000-\u00FF]/g,'')" name="rybh" maxlength="10" type="text"  class="easyui-validatebox span2" data-options="required:true,validateOnCreate:false" value="">
					</td>
                    <td>
                        <span style="color: red">*</span>姓名
                    </td>
                    <td>
                        <input id='xm' name="xm" maxlength="10" type="text"  class="easyui-validatebox span2" data-options="required:true,validateOnCreate:false" value="">
                    </td>
                    <td>
                        <span style="color: red">*</span>所属科室
                    </td>
                    <td style="padding-left: 6px; text-align: left">
                        <input  id="ksbmcombox"  class="easyui-combobox" name="ksbm"  style="width:100px;">

                    </td>
                </tr>
                <tr>
                    <td>
                        <span style="color: red">*</span>人员类别
                    </td>
                    <td style="padding-left: 6px; text-align: left">
                        <input id='rylbcombox' class="easyui-combobox" name="rylb" style="width:100px;">

                    </td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
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
                    <td colspan="2" style="text-align:center;">
                   <input type="button" id='ok' onclick="$('#staffAddForm').submit()" class="btn" value='确认'>
                    	<input type="button" id='back' class="btn" value='取消'>
                    </td>
                    <td colspan="1">
                       
                    </td>
                </tr>
                </tbody>
            </table>
          
        </div>
            </form>
        </div>
    </div>

    <div class="DialogDiv2" style="display: none">
        <div class="body-width margin-top10" style="height: 416px">
      		        <div class="pop-up bg-color1">
            <span class="float pop-up-span width-color dis-block">工作人员字典修改</span>
        </div>

        <!--table数据-->
        <div class="body-width margin-top10" style="height: 416px">
                <form id="staffEditForm" method="post">
                            <div class="body-width border-val" style="height: 90px;margin-top: 20px !important;width: 94%;margin-left: 3%;">
            <table class="bz-zd-table">
                <tr>
                    <td>
                        <span style="color: red">*</span>人员编号
                    </td>
                    <td><input readonly="readonly" id='erybh'  name="rybh" maxlength="10" type="text"  class="easyui-validatebox span2" data-options="required:true,validateOnCreate:false">
                    	<input id='eid' type="hidden" name="id">
                    </td>
                    <td>
                    	<span style="color: red">*</span>姓名
                    </td>
                    <td><input id='exm' name="xm" maxlength="10" type="text"  class="easyui-validatebox span2" data-options="required:true,validateOnCreate:false" ></td>
                    <td>
                   		<span style="color: red">*</span>所属科室
                   		<td style="padding-left: 6px; text-align: left">
                        <input id='eksbmcombox'   class="easyui-combobox" name="ksbm"  style="width:100px;" data-options="
                    url:'${path }/staff/depoption',
                    required:true,
                    method:'get',
                    valueField:'ksbm',
                    textField:'ksmc',
                    validateOnCreate:false,
                    panelHeight:'300px',
                    label: 'Language:',
                    labelPosition: 'top'
                    "></td>
                    
                 
                </tr>
               
                <tr>
                 <td>
                    <span style="color: red">*</span>人员类别
                  </td>
                  <td style="padding-left: 6px; text-align: left" colspan="1">
                    <input id='erylbcombox'   class="easyui-combobox" name="rylb" style="width:100px;" data-options="
                    url:'${path }/staff/rylboption',
                    method:'get',
                    required:true,
                    valueField:'ID',
                    validateOnCreate:false,
                    textField:'NAME',
                    panelHeight:'300px',
                    label: 'Language:',
                    labelPosition: 'top'
                    ">
    		</td>

                </tr>
            </table>
            </div>
             <div class="margin-top10"style="width: 94%;margin-left: 3%;" >
            <table class="bz-zd-table " style="width: 96.5% !important;">
                <tbody>
                <tr>
                    <td style="text-align: left;color:#DF2828">
                        注：( * 为必须项)
                    </td>
                    <td colspan="2" style="text-align:center;">
						<input type="button" id='ok' onclick="$('#staffEditForm').submit()" class="btn" value='确认'>
                    	<input type="button" id='back' class="btn" value='取消'>
                    </td>
                    <td colspan="1">
                       
                    </td>
                </tr>
                </tbody>
            </table>
          
        </div>
        </form>
        </div>
      </div>
    </div>

</div></div></div>

</body>
</html>