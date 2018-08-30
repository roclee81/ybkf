<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>医疗组字典</title>
 <script src="${path }/static/js/jquery.easyui.min.js"></script>
  <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
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
</head>
<script type="text/javascript">
$(function () {
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
   	                    $.fn.validatebox.defaults.rules.account.message = '只能由数字、字母、下划线组成.';  
   	                    return false;  
   	                } else {  
   	                    return true;  
   	                }  
   	            }  
   	        }, message: ''  ,
   	    }  
})
});
</script>
<body>
<div class="body-width fs_18 bold header-color">医疗组字典</div>
<div class="header-div bg-color1 border-rgt border-lef">
    <table class="ys-table" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
               医疗组名称
            </td>
            <td>
                <input id='dgname' type="text"/>
            </td>

            <td class="td-width fs_16">
                所属科室
            </td>
            <td>
                <input id="depart"   style="width:100px;">
            </td>

            <td class="td-width"></td>
            <td>
                <button class="btn-ok fs_16" onclick="searchAll()">查询</button>
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
</div>

    <table id="btn-table" class="float margin-top10" style="width: 25%;">
        <tr>
            <td>
                <button class="btn-ok fs_16" id="increase">新增</button>
            </td>
            <td>
                <button class="btn-ok fs_16" id="update">修改</button>
            </td>
            <td>
                <button class="btn-ok fs_16" onclick="deleteFun()">删除</button>
            </td>
        </tr>
    </table>


<div class="body-width   margin-top15" style="height: 430px;overflow-x:auto;">
    <table id='dg' class="sf-msg-table border-val" style="width: 100%">
        
    </table>
</div>

<!--弹出层-->
<div class="BgDiv"></div>
<div class="DialogDiv" id='adddiv' style="display: none">
    <div class="pop-up bg-color1">
        <span class="float pop-up-span width-color dis-block fs_16">医疗组新增</span>
    </div>

    <!--table数据-->
    <div class="margin-top32 border-val" style="height: 240px; width: 80%;margin-left: 10%">
       <form action="" id="addylzForm"  >
        <table class="bz-zd-table">
            <tbody>
            <tr>
                <td colspan="6" style="text-align: right;color:#DF2828">
                    注：* 为必须项
                </td>
            </tr>
            <tr>
                <td>
                    <span>*</span>医疗组编码
                </td>
                <td>
                    <input id='ylzbm' style="width: 120px"  type="text" class="easyui-validatebox" validateOnCreate="false"
                        validType="account[1,10]"  data-options="required:true"/>
                </td>
                <td>
                    <span>*</span>医疗组名称
                </td>
                <td>
                    <input id='ylzmc'  style="width: 120px" type="text" class="easyui-validatebox" validateOnCreate="false"
                         validType="length[1,50]"   data-options="required:true" />
                </td>
               
            </tr>
             <tr>
              <td>
                    <span>*</span>所属科室
                </td>
                <td style="padding-left: 6px!important;">
                     <input id="depart1"    style="width:100px;">
                </td>
                 <td>
                    <span>*</span>启用标志
                </td>
                <td style="padding-left: 6px!important;">
                        <select  id="qybz"style="width:100px;">
                         <option value="1">是</option>
                         <option value="0">否</option>
                        
                        </select>
                </td>
             </tr>
            <tr>
                <td colspan=""></td>
                <td colspan="1" class="center-td padding-top20">
                    <input type="button" id="ok" class="btn-ok" onclick="addylz()" value="确认" />
                    <input type="button" id="back"  class="btn-cancel" value="取消"/>
                </td>
            </tr>
            </tbody>
        </table>
        </form>
    </div>

</div>


<div class="DialogDiv" id='editdiv' style="display: none">
    <div class="pop-up bg-color1">
        <span class="float pop-up-span width-color dis-block fs_16">医疗组修改</span>
    </div>

    <!--table数据-->
    <div class="margin-top32 border-val" style="height: 240px; width: 80%;margin-left: 10%">
     <form action="" id="editylzForm"  >
        <table class="bz-zd-table">
            <tbody>
            <tr>
                <td colspan="6" style="text-align: right;color:#DF2828">
                    注：* 为必须项
                </td>
            </tr>
            <tr>
                <td>
                    <span>*</span>医疗组编码
                </td>
                <td>
                    <input id='editbm' disabled="disabled" id='ylzbm1' type="text"  />
                </td>
                <td>
                    <span>*</span>医疗组名称
                </td>
                <td>
                    <input id='editmc' type="text"class="easyui-validatebox" validateOnCreate="false"
                         validType="length[1,50]"   data-options="required:true" />
                </td>
              
            </tr>
          <tr>
              <td>
                    <span>*</span>所属科室
                </td>
                <td style="padding-left: 6px!important;">
                     <input id="depart2"    style="width:100px;">
                     <input id='editid' type="hidden">
                </td>
                 <td>
                    <span>*</span>启用标志
                </td>
                <td style="padding-left: 6px!important;">
                        <select id="editqybz" style="width:100px;">
                         <option value="1">是</option>
                         <option value="0">否</option>
                        
                        </select>
                </td>
             </tr>
            <tr>
                <td colspan=""></td>
                <td colspan="1" class="center-td padding-top20">
                    <input type="button" id="ok" class="btn-ok" onclick="editylz()"value="确认"  />
                    <input type="button" id="back1" class="btn-cancel" value="取消"  />
                </td>
            </tr>
            </tbody>
        </table>
        </form>
    </div>

</div>
<script>
    $(function () {
        //全选,取消全选
		$("#chk-qx").click(function () {
            // var str = "我是弹出对话框";
           if($(this).hasClass("checked")==false){
                $(this).closest(".sf-msg-table").find("input[type=checkbox]").prop("checked",true);
                $(this).addClass("checked");
            }else{
                $(this).closest(".sf-msg-table").find("input[type=checkbox]").prop("checked",false);
                $(this).removeClass("checked");
            }
        });
       
        <!--增加-弹出层-->
        $("#increase").click(function () {
            // var str = "我是弹出对话框";
            $(".BgDiv").css("z-index","100");
            $(".BgDiv").css({ display: "block", height: $(document).height()});
            $("#adddiv").css("top", "20%");
            $("#adddiv").css("display", "block");
            document.documentElement.scrollTop = 0;
        });
        //修改-弹出层
        $("#update").click(function () {
            // var str = "我是弹出对话框";
            $(".BgDiv").css("z-index","100");
            $(".BgDiv").css({ display: "block", height: $(document).height()});
            $("#editdiv").css("top", "20%");
            $("#editdiv").css("display", "block");
            document.documentElement.scrollTop = 0;
            var i= $('#dg').datagrid('getSelected');
            $('#editbm').val(i.YLZBM);
            $('#editmc').val(i.YLZMC);
            $('#depart2').combobox('select',i.SSKSBM);
            $('#editid').val(i.ID);
        });
        
        $(".BgDiv,#back,#back1").click(function() {
            $(".BgDiv").css("display", "none");
            $("#adddiv").css("display", "none");
            $("#editdiv").css("display", "none");
        });
    });

    $("a,button").focus(function(){this.blur()});
    
    function chooseFirstOption(comboboxId)
    {
    	 var val = $(comboboxId).combobox('getData');  
         for (var item in val[0]) 
         {  
             if (item == 'ksbm' || item == 'ID') 
             {  
                 $(comboboxId).combobox('select', val[0][item]);
             }
         }  
    }
    
    
    $(function(){
    	
    	
    	
		$('#depart').combobox({
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',
		     textField:'ksmc',
			onLoadSuccess: function () {
				chooseFirstOption(this);
			}
		});
		$('#depart1').combobox({
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',
		     textField:'ksmc',
			onLoadSuccess: function () {
				chooseFirstOption(this);
			}
		});
		$('#depart2').combobox({
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',
		     textField:'ksmc',
			onLoadSuccess: function () {
				chooseFirstOption(this);
			}
		});
		loadgrid();
    })
    
    
    function loadgrid(dg,department){
    	$('#dg').datagrid({
   		   url : '${path }/costStruct/SelectCostStruct',
   		   queryParams : {
   				dg:dg,
   			  department:department,
     	 	  methodFlag:'selectDoctorGroupInfo'
   		   },
   		   singleSelect:true,
           fit : true,
           striped : true,
           pagination : true,
           nowrap : false,
           pageSize : 10,
           pageList : [ 10 ],
           columns : [ [
        	   {
                   width : '35%',
                   title : '医疗组编码',
                   field : 'YLZBM'
               },
               {
                   width : '25%',
                   title : '医疗组名称',
                   field : 'YLZMC'
               },
               {
                   width : '25%',
                   title : '科室名称',
                   field : 'KSMC'
               },
               {
                   width : '15%',
                   title : '医疗组启用标志',
                   field : 'YLZQYBZ',
                   formatter : function(value, row, index) {
                       switch (value) {
                       case "0":
                           return '否';
                       case "1":
                           return '是';
                       }
                   }
               },
               {
                   width : '10%',
                   title : 'ID',
                   field : 'ID',
                   hidden:true
               },
               {
                   width : '10%',
                   title : '所属科室编码',
                   field : 'SSKSBM',
                   hidden:true
               }
           ]],
           onBeforeLoad: function (param) {
                 updateDatagridHeader(this);
            	 updateDatagridPager(this);
            	 changeRowHeader(this);
           }
          
    	});
    }
    function searchAll(){
    	loadgrid($('#dgname').val(), $('#depart').combobox('getValue'));
    }
    function addylz(){
    	//yyy
    	   
                  var isValid = $('#addylzForm').form('validate');
                  
                  if (!isValid) {
                	  return isValid;
                  }
               
    	
    	$.ajax({
    		url:'${path}/doctorGroup/add',
    		data:{
    			ylzmc:$('#ylzmc').val(),
    			ssksbm:$('#depart1').combobox('getValue'),
    			ylzbm:$('#ylzbm').val(),
    			ylzqybz:$('#qybz').val()
    		},
    		success:function(data){
    			var result = $.parseJSON(data);
    			if(result.success){
    				 $.messager.alert( '提示',result.msg, 'warning');
    				loadgrid($('#dgname').val(), $('#depart').combobox('getValue'));
    	            $(".BgDiv").css("display", "none");
    	            $("#adddiv").css("display", "none");
    	            $("#editdiv").css("display", "none");
    	            $('#ylzmc').val('');
        			$('#depart1').combobox('select','0000');
        			$('#ylzbm').val('')
    			}else{
    				 $.messager.alert( '提示',result.msg, 'warning');
    			}
    		}
    	})
    }
    function editylz(){
    	
    	
        var isValid = $('#editylzForm').form('validate');
        
        if (!isValid) {
        	return	isValid
        }
     
    	$.ajax({
    		url:'${path}/doctorGroup/edit',
    		data:{
    			ylzmc:$('#editmc').val(),
    			ssksbm:$('#depart2').combobox('getValue'),
    			ylzbm:$('#editbm').val(),
    			ylzqybz:$('#editqybz').val(),
    			id:$('#editid').val()
    		},
    		success:function(data){
    			var result = $.parseJSON(data);
    			if(result.success){
    				 $.messager.alert( '提示',result.msg, 'warning');
    				loadgrid($('#dgname').val(), $('#depart').combobox('getValue'));
    	            $(".BgDiv").css("display", "none");
    	            $("#adddiv").css("display", "none");
    	            $("#editdiv").css("display", "none");
    			}else{
    			
    				 $.messager.alert( '提示',result.msg, 'warning');
    			}
    		}
    	})
    }
    
    function deleteFun() {
    	var rows= $('#dg').datagrid('getSelections');
    	if(rows.length!=1){
    		alert('请选择一个，并且不能选择多个');
    		return;
    	}
    	var id=rows[0].ID;
        parent.$.messager.confirm('询问', '您是否要删除当前医疗组？', function(b) {
            if (b) {
                progressLoad();
                $.post('${path }/doctorGroup/del', {
                    id : id
                }, function(result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        $('#dg').datagrid('reload');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }

</script>
</body>
</html>