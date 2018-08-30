<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
	<script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />

<link href="${path }/static/zTree/css/zTreeStyle/zTreeStyle.css" rel="stylesheet">
<script src="${path }/static/zTree/js/jquery.ztree.core.js"></script>
<script src="${path }/static/zTree/js/jquery.ztree.exedit.js"></script>
<script src="${path }/static/zTree/js/jquery.ztree.excheck.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 
        #btn-table td{
            padding-right:20px;
        }
        .yz-msg-table th{
            box-shadow: 0px 2px 0px #cdcdcd;
            opacity: 1.0;
        }
        #btn-table .btn{
            background: #4bacd1;
            color: #ffffff;
        }
        .btn1{
            color: #005FD5;
        }
        .btn1:hover{
            color: #1E1E1E;
        }
     /*    #btn-table .btn:hover{
            color: #1E1E1E;
        }
         */
        #back{
          /* background: #DFDFDF; */
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
        .DialogDiv2{
        	height:450px;
        	width:900px;
        }
        .bz-zd-table{width: 77% !important; margin-left: 10%!important;}
        .l-btn-small{width:40px;}
        input{
           margin: 0;
	       font: inherit;
	       color: black;
	       padding-left:8px;
        }
        .user-name{margin-left: 2px;width:158px !important;}
    </style>
<script type="text/javascript">
    var roleDataGrid;
    $(function() {
        roleDataGrid = $('#roleDataGrid').datagrid({
            url : '${path }/role/dataGrid',
            striped : true,
           // rownumbers : true,
            pagination : true,
            singleSelect : true,
            idField : 'id',
            sortName : 'id',
            sortOrder : 'asc',
            pageSize : 20,
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            frozenColumns : [ [ /* {
                width : '100',
                title : 'id',
                field : 'id',
                sortable : true
            }, */ {
                width : '25%',
                title : '名称',
                field : 'name'
                //sortable : true
            }, {
                width : '25%',
                title : '描述',
                field : 'description'
            } , {
                width : '25%',
                title : '状态',
                field : 'status',
                //sortable : true,
                //将0-1转化成 正常-不正常
                formatter : function(value, row, index) {
                    switch (value) {
                    case 0:
                        return '正常';
                    case 1:
                        return '停用';
                    }
                }
            }, {
                field : 'action',
                title : '操作',
                width : '25%',
                formatter : function(value, row, index) {
                    var str = '';
                        
                            str += $.formatString('<input style="width:35px;" class="btn1 " type="button" onclick="grantRoleFun(\'{0}\');" value="授权">', row.id);
                        
                       
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<input style="width:35px;" class="btn1 " type="button" onclick="editRoleFun(\'{0}\');" value="编辑">', row.id);
                     
                       
                            str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                            str += $.formatString('<input style="width:35px;" class="btn1 " type="button" onclick="deleteRoleFun(\'{0}\');" value="删除">', row.id);
                     
                    return str;
                }
            } ] ],
            onBeforeLoad: function (param) {
          	  updateDatagridHeader(this);
          	},
            onLoadSuccess:function(data){
                $('.role-easyui-linkbutton-ok').linkbutton({text:'授权'});
                $('.role-easyui-linkbutton-edit').linkbutton({text:'编辑'});
                $('.role-easyui-linkbutton-del').linkbutton({text:'删除'});
            },
            toolbar : '#roleToolbar'
        });
        
        $('#roleAddForm').form({
            url : '${path }/role/add',
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
                	parent.$.messager.alert('提示', '添加成功', 'info');
                	$('#roleDataGrid').datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
       	         $(".BgDiv").css("display", "none");
    	         $(".DialogDiv").css("display", "none");
    	         $(".DialogDiv2").css("display", "none");
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
        $(".BgDiv,#back,#closes,#close1s").click(function() {
	       	 $('#name').val('');
	    	 $('#text').val('');
	    	// $('#status').combobox('setValue','0');
	         $(".BgDiv").css("display", "none");
	         $(".DialogDiv").css("display", "none");
	         $(".DialogDiv2").css("display", "none");
        });
        
        $('#roleEditForm').form({
            url : '${path }/role/edit',
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
                	parent.$.messager.alert('提示', '修改成功', 'info');
                	$('#roleDataGrid').datagrid('reload');
	       	         $(".BgDiv").css("display", "none");
	    	         $(".DialogDiv").css("display", "none");
	    	         $(".DialogDiv2").css("display", "none");
                } else {
                    parent.$.messager.alert('错误', result.msg, 'error');
                }
            }
        });
    });

    function addRoleFun() {//显示了添加角色的弹出DIV
        $(".BgDiv").css("z-index","100");
        $(".BgDiv").css({ display: "block", height: $(document).height()});
        $(".DialogDiv").css("top", "5%");
        $(".DialogDiv").css("display", "block");
        $("#name").val('');
        $("#text").val('');
        $("#status").val('0');
        document.documentElement.scrollTop = 0;
    }

    function editRoleFun(id) {
        if (id != undefined) {
           // var rows = roleDataGrid.datagrid('getSelections');
           // id = rows[0].id;
            $(".BgDiv").css("z-index","100");
            $(".BgDiv").css({ display: "block", height: $(document).height()});
            $(".DialogDiv2").css("top", "10%");
            $(".DialogDiv2").css("left", "15%");
            $(".DialogDiv2").css("display", "block");
            document.documentElement.scrollTop = 0;
            $.ajax({
        		type: "POST",
                url: '${path }/role/editPageNew?id=' + id,
                dataType: "json",
                success: function(data){
                	$('#eid').val(data.id);
                	$('#ename').val(data.name);
                	$('#eroleEditStatus').combobox('setValue',data.status);
                	$('#etext').val(data.description);
                }
            });
        } else {
            roleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        
    }

    function deleteRoleFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = roleDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            roleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/role/delete', {
                    id : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        roleDataGrid.datagrid('reload');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }

    function grantRoleFun(id) {
        if (id == undefined) {
            var rows = roleDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            roleDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        
        parent.$.modalDialog({
            title : '授权',
            width : 500,
            height : 500,
            href : '${path }/role/grantPage?id=' + id,
            buttons : [ {
                text : '确定',
                handler : function() {
                    parent.$.modalDialog.openner_dataGrid = roleDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#roleGrantForm');
                    f.submit();
                }
            } ]
        });
    }
    
    function cloose(){
	         $(".BgDiv").css("display", "none");
	         $(".DialogDiv").css("display", "none");
	         $(".DialogDiv2").css("display", "none");
    }
</script>
</head>
<body>   
      <table id="btn-table" class="float margin-top10" style="width: 25%;">
        <tr>
            <td>
               <button class="btn btn-info btn-sm" onclick="addRoleFun()"><img src="${staticPath }/static/img/menu/xinzeng-icon.png"><span>新增</span></button>
            </td>
        </tr>
    </table>
     <div class="body-width   margin-top15" style="height: 430px;overflow-x:auto;">
    <table id='roleDataGrid' class="sf-msg-table border-val" style="width: 100%">
        
    </table>
    </div>

	<div class="BgDiv"></div>
    <div class="DialogDiv" style="display: none">
    	<div class="pop-up bg-color1">
	        <table class="body-width">
	            <tr>
	                <td class="left padding-left20 fs_16">新增角色</td>
	                <td class="text-right padding-right20">
	                   <img src="${staticPath }/static/img/close.png" id="closes">
	                </td>
	            </tr>
	        </table>
    	</div>
        
        <!--table数据-->
        <div class="margin-top32 border-val" style="height: 300px;width:80%;margin-left:10%">
        <form id="roleAddForm" method="post">
            <table class="bz-zd-table margin-top21" style="width: 81%;">
                <tbody>
                <tr>
                    <td >
                        <span >*</span>角色名称
                    </td>
                    <td style="text-align: left !important;">
                    	<input id='name' maxlength="8" name="name" type="text" placeholder="请输入角色名称" class="easyui-validatebox span2 user-name" data-options="required:true,validateOnCreate:false" value="">
					</td>
                    <td >
                        <span >*</span>状态
                    </td>
                    <td style="">
                        <select id='status'  style="margin-left:2px" name="status" >
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                   
                    </tr>
                <tr>
                    <td>备注</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="5">
                        <textarea id='text' maxlength="50" name="description" cols="50" rows="8" ></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center;color:#DF2828">
                        注：(*为必须项)
                    </td>

                    <td colspan="2">
                    	<input type="button" id='ok' onclick="$('#roleAddForm').submit()" class="btn-ok" value='确认'>
                    	<input type="button" id='back' class="btn-cancel" value='取消'>
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
    </div>

    <div class="DialogDiv2" style="display: none">
    	<div class="pop-up bg-color1">
	        <table class="body-width">
	            <tr>
	                <td class="left padding-left20 fs_16">修改角色</td>
	                <td class="text-right padding-right20">
	                   <img src="${staticPath }/static/img/close.png" id="close1s">
	                </td>
	            </tr>
	        </table>
    	</div>
       
        <!--table数据-->
        <div class="border-val margin-top32" style="height: 300px;width:80%;margin-left:10%">
        <form id="roleEditForm" method="post">
            <table class="bz-zd-table margin-top21" style="width: 81%;">
                <tbody>
                <tr>
                    <td>
                        <span >*</span>角色名称
                    </td>
                    <td style="text-align: left;">
                    	<input id='eid' name="id" type="hidden">
                    	<input id='ename' maxlength="8" name="name" type="text" placeholder="请输入角色名称" class="easyui-validatebox user-name" data-options="required:true,validateOnCreate:false">
					</td>
                    <td>
                        <span >*</span>状态
                    </td>
                    <td>
                        <select id="eroleEditStatus" name="status" >
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                <tr>
                    <td>备注</td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="5">
                        <textarea id='etext' maxlength="50" name="description" cols="50" rows="8" ></textarea>
                    </td>
                </tr>

                <tr>
                    <td colspan="2" style="text-align: center;color:#DF2828">
                        注：(*为必须项)
                    </td>

                    <td colspan="2">
                    	<input type="button" id='ok' onclick="$('#roleEditForm').submit()" class="btn-ok" value='确认'/>
                    	<input id='back1' onclick="cloose()" type="button" class="btn-cancel" value="取消" />
                    </td>
                </tr>
                </tbody>
            </table>
            </form>
        </div>
    </div>

</body>
</html>