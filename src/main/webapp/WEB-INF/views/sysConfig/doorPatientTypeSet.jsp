
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>门特病设定</title>
    <link href="${path }/static/css/common.css" rel="stylesheet">
    <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
    <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
    <link href="${path }/static/css/common.css" rel="stylesheet">
    <style>
        .sf-msg-table th {
            border-top: none !important;
        }

        .fw-target-div {
            margin-top: 10px;
        }

        .fw-target-div:nth-child(odd) {
            background: none;
            overflow-x: auto;
        }

        .tab-div-box {
            width: 50.5%;
            float: left;
        }

        .ks-fy-zb {
            margin: 10px 0 0;
            height: auto;
            border: #e7ecf3 1px solid;
            border-bottom: 1px solid #d4d4d4;
        }
    </style>
</head>
<script type="text/javascript">
$(function () {
	mglistDataGrid = $('#mglistDataGrid').datagrid({
        url : '${path }/mglimit/mgbzlist',
        fit : true,
        striped : true,
        pagination : true,
       singleSelect : true,
        sortName : 'zdbm',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [ 
        {
            width : '20%',
            title : '病种分类',
            field : 'bzfl'
      
        },  {
            width : '20%',
            title : '病种序号',
            field : 'bzxh',
       
        }, {
            width : '20%',
            title : '病种编码',
            field : 'zdbm',	
        
        },
        {
            width : '25%',
            title : '疾病名称',
            field : 'zdmc',
         
        },
        {
            width : '25%',
            title : '医疗总费用限额(元)',
            field : 'ylzfyxe',
         
        },
        {
            width : '25%',
            title : '医保统筹支付限额(元)',
            field : 'ybtczfxe',
         
        },
        {
            width : '20%',
            title : '报销比例',
            field : 'bxbl',
           
        },{
            width : '25%',
            title : '生效时间',
            field : 'sxsj',
       
        },{
            width : '20%',
            title : '失效时间',
            field : 'sxsj',
        }
        ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	
        	
        },
       /*  onClickRow:function(index,row){
          	updatemg();
           } */
    });
	
	 $('#diseaseLimitForm').form({
         url : '${path }/mglimit/updateMg',
         onSubmit : function() {
        	 var fl=$("#bzfl").val();
     		if(fl==''||fl==null){	
        	 $.messager.alert('错误',"请选择药品分类！", 'info');
        	 return false;
     		}
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
            	  $.messager.alert('错误', result.msg, 'info');
            	  $('#mglistDataGrid').datagrid('reload');
            	  cancle();
            	  } else {
                 $.messager.alert('错误', result.msg, 'error');
             }
         }
     });
})


function deleteMg() {    	 
	 var ss = "";
	  var rows = $('#mglistDataGrid').datagrid('getSelections');
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
	     $.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
	    
	             if (b) {
	                 
	                 $.post('${path }/mglimit/deleteMg', {
	                     id : ss
	                 }, function(result) {
	                     if (result.success) {
	                         parent.$.messager.alert('提示', result.msg, 'info');
	                         $('#mglistDataGrid').datagrid('reload');	                    
	                         cancle();
	                         
	                     }
	                     
	                 }, 'JSON');
	             }
	         
	     });
	 
	 
	 
}

function updatemg() {
	 var rows = $('#mglistDataGrid').datagrid('getSelections');
	  //var id=$('#Id').val();
	 if(rows.length==1){
		 makedisable(false) ;
		$('#id').val(rows[0].id);
		$('#bzfl').val(rows[0].bzfl);
		bzmcbyfl();
		$('#cblx').val(rows[0].cblx);
		$('#bzmc').combobox('setValue', rows[0].bzxh);
		zdmcbybzxh();
		$('#zdmc').combobox('setValue', rows[0].zdbm);
		$('#ybtcde').val(rows[0].ybtcde);
		$('#fdxe').val(rows[0].fdxe);
		$('#ylq').val(rows[0].ylq);
		
	 }
}
function bzmcbyfl() {
	 $('#zdmc').combobox('clear');
	var fl=$("#bzfl").val();
	
	if(fl!=''){			
		$('#bzmc').combobox({
	    	url:'${path }/mglimit/getbzmcbyfl?bzfl='+fl,
	        valueField:'bzxh',
	        textField:'bzmc',
	        required:true,	 	
	    	onChange: function (n,o) {
	   
	    		zdmcbybzxh();
	    		}
	 	 })
	}
	
	
}
function zdmcbybzxh() {
	var bzxh=$("#bzmc").combobox('getValue');
	if(bzxh!=''){			
		$('#zdmc').combobox({
	    	url:'${path }/mglimit/getbybzxh?bzxh='+bzxh,
	        valueField:'zdbm',
	        textField:'zdmc',
	        required:true,	 	
	 	 })
	}
	
	
}
</script>
<body>
<!--指标展示-->
<div class="tab-div-box">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb bg-color" style="height: 386px">
                <div class="gauge-title-div">
                    <table class="margin-top10 float-right" width="100%" id="">
                        <tr>
                            <td class="left">门规病种设定</td>
                            <td class="text-right">
                                <button class="btn btn-sm btn-primary "><img src="${staticPath }/static/img/menu/btn1-icon.png">导出
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="body-width padding10 padding-top0">
                    <div class="ys-rc-div">
                        <table class="zy-table body-width common-table on-style" id="mglistDataGrid">
                            <tbody>
                            <tr class="th-bg">
                                <th>病种分类</th>
                                <th>病种序号</th>
                                <th>疾病编码</th>
                                <th>疾病名称</th>
                                <th>医疗总费用限额(元)</th>
                                <th>医保统筹支付限额(元)</th>
                                <th>报销比例</th>
                                <th>生效时间</th>
                                <th>失效时间</th>
                            </tr>
                            <tr>
                                <td>心血管内科</td>
                                <td>01</td>
                                <td>I20.900</td>
                                <td>心绞痛</td>
                                <td class="right">3060</td>
                                <td class="right">64</td>
                                <td class="right">57%</td>
                                <td class="right">2017/3/3</td>
                                <td class="right">2017/5/7</td>
                            </tr>                           
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fw-target-div" style="overflow-x: auto;height: 386px">
  <form id="diseaseLimitForm" method="post">
    <table class="input-table margin-bottom59" id="input-table1">
        <tr>
            <td>病种分类</td>
            <td>
                <select>
                    <option>请选择</option>
                    <option>神经系统疾病</option>
                    <option>呼吸系统疾病</option>
                    <option>消化系统疾病</option>
                </select>
            </td>
            <td>病种序号</td>
            <td>
                <input type="text" placeholder="01">
            </td>
        </tr>
        <tr>
            <td>疾病编码</td>
            <td>
                <input type="text" placeholder="3625">
            </td>
            <td>疾病名称</td>
            <td>
                <input type="text" placeholder="脑膜炎">
            </td>
        </tr>
        <tr>
            <td>医疗总费用限额</td>
            <td>
                <input type="text" placeholder="306">
            </td>
            <td class="padding-left20">医保统筹支付限额</td>
            <td>
                <input type="text" placeholder="64">
            </td>

        </tr>
        <tr>
            <td>报销比例</td>
            <td>
                <input type="text" placeholder="12">
            </td>
            <td>生效时间</td>
            <td>
                <input type="date">
            </td>
        </tr>
        <tr>
            <td>失效时间</td>
            <td>
                <input type="date">
            </td>
        </tr>
    </table>
  </form>
    <div class="hr-div">
        <button class="btn btn-primary margin-right10 fs_16">新增</button>
        <button class="btn btn-primary margin-right10 fs_16" id="add1">保存</button>
        <button class="btn btn-primary margin-right10 fs_16" id="del1">删除</button>
    </div>
</div>
<div class="clear"></div>
</div>
<div class="clear"></div>

<script>
    /*初始化*/
    $(document).ready(function () {
        $(".xm-type").attr("disabled", "true");
        $(".xm-nm").attr("disabled", "true");
        $(".xm-name").attr("disabled", "true");
        $(".yp-nm").attr("disabled", "true");
        $(".xd-nm").attr("disabled", "true");
        $(".add-tr").attr("disabled", "true");
        $(".del-tr").attr("disabled", "true");
        $("#add2").attr("disabled", "true");
        $("#del2").attr("disabled", "true");
        $("#del1").attr("disabled", "true");
    });

    /*表格鼠标事件*/
    $(".on-style tr").on({
        "mouseenter": function () {
            var index = $(this).index();
            if (index != 0) {
                $(this).addClass("on-tr");
                $(this).addClass("on-td");
                $(this).prev().addClass("on-tr")
            }

        },
        "mouseleave": function () {
            $(this).removeClass("on-tr");
            $(this).removeClass("on-td");
            $(this).prev().removeClass("on-tr");
        },
        "click": function () {
            var index = $(this).index();
            if (index != 0) {

                $(this).addClass("active-tr").siblings().removeClass("active-tr");
                $(this).prev().addClass("border-color").siblings().removeClass("border-color");

                $(".xm-type").removeAttr("disabled")
                $(".xm-nm").removeAttr("disabled")
                $(".xm-name").removeAttr("disabled")
                $(".yp-nm").removeAttr("disabled")
                $(".xd-nm").removeAttr("disabled")
                $(".add-tr").removeAttr("disabled")
                $(".del-tr").removeAttr("disabled")
                $("#add2").removeAttr("disabled")
                $("#del1").removeAttr("disabled")

                var list = [];
                var list_length = $(this).find('td').length;
                for (var i = 1; i < list_length; i++) {
                    list.push($(this).find('td')[i].innerHTML);
                }

                $("#input-table1").find('select').get(0).options[1].selected = true;
                var table_list = [];
                table_list = $("#input-table1").find('input');

                for (var i = 0; i < table_list.length; i++) {
                    table_list.eq(i).attr("value", list[i]);
                }
            }
        }
    });

    $(".on-style1 tr").on({
        "mouseenter": function () {
            var index = $(this).index();
            if (index != 0) {
                $(this).addClass("on-tr");
                $(this).addClass("on-td");
                $(this).prev().addClass("on-tr");
            }

        },
        "mouseleave": function () {
            $(this).removeClass("on-tr");
            $(this).removeClass("on-td");
            $(this).prev().removeClass("on-tr");
        },
        "click": function () {
            var index = $(this).index();
            if (index != 0) {
                $("#del2").removeAttr("disabled")
                var xm_type_val = $(this).find('td').eq(2).text();
                var xm_nm_val = $(this).find('td').eq(3).text();
                var xm_name_val = $(this).find('td').eq(4).text();
                var yp_nm_val = $(this).find('td').eq(5).text();
                var xd_nm_val = $(this).find('td').eq(6).text();

                $(".xm-type").get(0).options[1].selected = true;
                $(".xm-nm").attr("value", xm_nm_val);
                $(".xm-name").attr("value", xm_name_val);
                $(".yp-nm").attr("value", yp_nm_val);
                $(".xd-nm").attr("value", xd_nm_val);
                $(this).addClass("active-tr").siblings().removeClass("active-tr");
                $(this).prev().addClass("border-color").siblings().removeClass("border-color");
            }
        }
    });

    $(function () {
        /*增加一行*/
        $("#add-table").on("click", ".add-tr", function () {
            //切换选中的按钮高亮状态
            var tr_html = "<tr class='border-tp'><td>项目类型 </td> <td><select><option>请选择</option><option>请选择1</option></select></td>" +
                    "<td>项目编码</td><td><input type='text'></td><td>项目名称</td><td><input type='text'></td></tr>" +
                    "<tr><td>药品限定剂量</td><td><input type='text'></td><td>限定次数</td><td><input type='text'></td>" +
                    "<td><button class='add-tr'></button></td><td class='padding-left10'><button class='del-tr'></button></td></tr>";
            $("#add-table").append(tr_html);

        });
        /*删除一行*/
        $("#add-table").on("click", ".del-tr", function () {
            var index = $(this).parent().parent().index();
            if (index != 1) {
                $(this).parent().parent().prev().remove();
                $(this).parent().parent().remove();
            }
        });

        $("#add1").click(function () {
            var list = [];
            var list_length = $("#input-table1").find('input').length;
            for (var i = 0; i < list_length; i++) {
                list.push($("#input-table1").find('input').eq(i).val());
            }
            var xm_type_val = $("#input-table1 option:selected").text();
            $(".on-style tr").find('td').eq(0).text(xm_type_val);

            var table_list = [];
            table_list = $(".on-style").find('td');
            for (var i = 1; i < table_list.length; i++) {
                table_list.eq(i).text(list[i - 1]);
            }
            $(".on-style tr").eq(1).css("display", "");

        });
        /*删除table数据*/
        $("#del1").click(function () {
            $(".on-style tr").eq(1).css("display", "none");
        });
        /*保存到 临床路径医嘱收费项目维护 表格*/
        $("#add2").click(function () {
            var xm_type_val = $(".xm-type option:selected").text();
            var xm_nm_val = $(".xm-nm").val();
            var xm_name_val = $(".xm-name").val();
            var yp_nm_val = $(".yp-nm").val();
            var xd_nm_val = $(".xd-nm").val();

            $(".on-style1 tr").find('td').eq(2).text(xm_type_val);
            $(".on-style1 tr").find('td').eq(3).text(xm_nm_val);
            $(".on-style1 tr").find('td').eq(4).text(xm_name_val);
            $(".on-style1 tr").find('td').eq(5).text(yp_nm_val);
            $(".on-style1 tr").find('td').eq(6).text(xd_nm_val);
            $(".on-style1 tr").eq(1).css("display", "");
        });
        /*删除table数据*/
        $("#del2").click(function () {
            $(".on-style1 tr").eq(1).css("display", "none");
        });
    });
    $("a,button").focus(function () {
        this.blur()
    });
</script>
</body>
</html>