<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/global.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>病种限额设定</title>
  <!--   <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
    <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" /> -->
    <link href="${path }/static/css/common.css" rel="stylesheet">
    <style>
        .sf-msg-table th {
            border-top: none !important;
        }

        .fw-target-div {
            margin-top: 10px;
        }

        .input-table td.Text_12 {
            font-size: 12px;
        }

        .input-table2 select {
            width: 66px !important;
        }

        .input-table2 input {
            width: 66px !important;
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
        .ys-rc-div {
		    overflow-x: none!important;
		}
    </style>
</head>
<body>
<!--病种设定-->
<div class="tab-div-box">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb bg-color" style="height: 410px;overflow: none">
                <div class="gauge-title-div border-bom">
                    <table class="margin-top10 float-right" width="100%">
                        <tr>
                            <td class="left"><label class="radius"></label>病种限额设定</td>
                            <td class="text-right">
                            	
                            	<button class="btn btn-info btn-sm" id="add" onclick="add()"><img src="${staticPath }/static/img/menu/xinzeng-icon.png"><span>新增</span></button>
                            	 
                            	 <button class="btn btn-primary btn-sm" id="del" onclick="deleteMg()"><img src="${staticPath }/static/img/menu/del.png"><span>删除</span></button>
                                <button class="btn btn-success btn-sm margin-right10"><img src="${path }/static/img/menu/btn1-icon.png"><span>导出</span>
                                </button>
                                
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="body-width padding10">
                    <div   style="width: auto;height: 345px">
                        <table id="mglistDataGrid"  class="zy-table body-width common-table on-style">
                           <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fw-target-div bz-div" style="overflow-x: auto;height: 410px">
    <form id="diseaseLimitForm" method="post">
    <table class="input-table margin-bottom59" id="input-table1">
        <tr>
            <td>病种分类</td>
            <td>
                <!-- <div type="text" id="bzfl" name="bzfl" style="width: 140px" class=""></div> -->
                <select id="bzfl" name="bzfl"></div>
            </td>
            <td>病种序号</td>
            <td>
                <input type="text" placeholder="" id="bzxh" name="bzxh" data-options="required:true" class="easyui-validatebox xm-nm">
            </td>
        </tr>
        <tr>
            <td>疾病编码</td>
            <td>
                <input type="text" placeholder="" id="bzbm" name="bzbm" data-options="required:true" class="easyui-validatebox xm-nm" validateOnCreate="false">
            </td>
            <td>疾病名称</td>
            <td>
                <input type="text"  id="bzmc" name="bzmc" style="width:140px;" data-options="required:true" class="easyui-validatebox xm-nm" validateOnCreate="false"> 
            </td>
        </tr>
        <tr>
            <td>医疗总费用限额</td>
            <td>
                <input type="text" placeholder="" id="ylzfyxe" name="ylzfyxe" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')">
            </td>
            <td class="padding-left20">医保统筹支付限额</td>
            <td>
                <input type="text" placeholder="" id="ybtczfxe" name="ybtczfxe" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')">
            </td>

        </tr>
        <tr>
            <td>报销比例</td>
            <td>
                <input type="text" placeholder="" id="bxbl" name="bxbl" onkeyup="this.value=this.value.replace(/[^0-9.]/g,'')">
            </td>

        </tr>
        <tr> 
            <td>生效时间</td>
            <td>
                <!-- <input type="date"> -->
                <div class="input-group date form_date">
                     <input  name="sxsj" type="text" id="sxsj"  style="width:120px;height: 32px;padding-left:10px" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" /> 
                </div>
            </td>
            <td>失效时间</td>
            <td>
                <!-- <input type="date"> -->
                <div class="input-group date form_date">
                     <input  name="sxsj1" id="sxsj1" type="text" style="width:120px;height: 32px;padding-left:10px" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />
                </div>
            </td>
        </tr>
    </table>
    <div class="hr-div" style="margin-top:10px">
        <!-- <input type="button" value="新增"  onclick="add()" class="btn btn-primary margin-right10 fs_16" /> -->
        <!-- <input type="button" value="保存"  onclick="$('#diseaseLimitForm').submit()" class="btn btn-primary margin-right10 fs_16" id="save"/> -->
         <button class="btn btn-primary margin-right10 fs_16" onclick="$('#diseaseLimitForm').submit()"  id="save">保存</button>
        
    </div>
    </form>
</div>

<div class="clear"></div>
<script src="${path }/static/extJs.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script src="${path }/static/js/common.js"></script>
<script type="text/javascript">
    $(function () {
        /* $('#bzfl').combobox({
            url:'${path }/mglimit/getAllbz',
            textField:'bzfl',
            valueField:'bzfl',         
            onLoadSuccess: function (data) { 
                 var val = $(this).combobox('getData');  
                  for (var item in val[0]) 
                 {  
                     if (item == 'bzfl') 
                     {  
                         $(this).combobox('select', val[0][item]);  
                         department = val[0][item];
                     }  
                 }   
                
             }
         });*/
        selectRender("${path }/mglimit/getAllbz","#bzfl");
        mglistDataGrid = $('#mglistDataGrid').datagrid({
            url : '${path }/mglimit/mgbzlist',
            fit : true,
            striped : true,
           // rownumbers : true,
            pagination : true,
           singleSelect : true,
          //  idField : 'id',
            sortName : 'bzbm',
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
                field : 'sxsj1',
            }
            ] ],
            onBeforeLoad: function (param) {
                updateDatagridHeader(this);         
                
            },
            onClickRow:function(index,row){
                updatemg();
            },
            onLoadSuccess:function(data){
            }
        });
        makedisable( true);
          // 保存提交
        $('#diseaseLimitForm').form({
                 url : '${path }/doorPatientType/updateMgPatientType',
                 onSubmit : function() {
                    // var fl=$("#bzfl").combobox("getValue");
                    var fl=$("#bzfl").val();
                    console.log("fl的值"+fl);
                     if(fl==''||fl==null){  
                     $.messager.alert('错误',"请选择病种分类！", 'info');
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
        /*表格鼠标事件*/
        $(".on-style tr").on({
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

                $(this).addClass("active-tr").siblings().removeClass("active-tr");
                $(this).prev().addClass("border-color").siblings().removeClass("border-color");

                makedisable( false);
                
                var list = [];
                var list_length = $(this).find('td').length;
                for (var i = 2; i < list_length; i++) {
                    list.push($(this).find('td')[i].innerHTML);
                }

                $("#input-table1").find('select').get(0).options[1].selected = true;
                $("#input-table1").find('select').get(1).options[1].selected = true;
                var table_list = [];
                table_list = $("#input-table1").find('input');

                for (var i = 0; i < table_list.length; i++) {
                    table_list.eq(i).attr("value", list[i]);
                }
            }
        }
        });
        
    });
    function cleanForm() {
        $('#input-table1 input[type=text]').val("");
        $('#input-table1 input[type=hidden]').val("");
        $('#input-table1  select').val("");
    }
    function cancle() {
        makedisable(true) ;
        cleanForm() ;
    }
    function add() {
         makedisable(false) ;
         cleanForm() ;
    };
    //禁用下拉框
    function limitSelect(id){
        $(id).parent().find("input").attr("disabled","disabled");
        $(id).parent().find(".combo-dropdown").addClass("hide");
    }
    //启用下拉框
    function openSelect(id){
        $(id).parent().find("input").removeAttr("disabled");
        $(id).parent().find(".combo-dropdown").removeClass("hide");
    }
    function makedisable( param) {
        // $('#bzfl').combobox({disabled:param});
        if(param){
            limitSelect("#bzfl");
        }else{
            openSelect("#bzfl");
        }
        $('#input-table1 input[type=text]').attr("disabled", param);
        $("#save").attr("disabled", param);
    };      
    //下拉框渲染
    function selectRender(url,id){
            $.ajax({
                type:"POST",
                url:url,
                cache:false,
                async:false,
                dataType:"json",
                success:function(data){
                    var str="";
                    for(var i=0;i<data.length;i++){
                        str+="<option value='"+data[i].bzxh+"'>"+data[i].bzfl+"</option>";
                    }
                    // console.log(str);
                    $(id).empty().append($(str));
                    $(id).comboSelect();                      
                }
            })
    }      
    function deleteMg() {        
         var ss = "";
          var rows = $('#mglistDataGrid').datagrid('getSelections');
          console.log(rows);
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
    //点击行，渲染表单内容
    function updatemg() {

        var rows = $('#mglistDataGrid').datagrid('getSelections');
        if(rows.length==1){
           makedisable(false);
           $("#bzfl").val(rows[0].bzxh).comboSelect();
           $('#bzxh').val(rows[0].bzxh);
           $('#bzbm').val(rows[0].zdbm);
           $('#bzmc').val(rows[0].zdmc);
           $('#ylzfyxe').val(rows[0].ylzfyxe);
           $('#ybtczfxe').val(rows[0].ybtczfxe);
           $('#bxbl').val(rows[0].bxbl);
        }
    }
    </script>
</body>
</html>