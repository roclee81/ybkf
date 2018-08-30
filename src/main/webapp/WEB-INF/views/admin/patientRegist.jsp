<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="/commons/global.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <title>门规患者登记</title>
   <style>
        .sf-msg-table th {
            border-top: none !important; 
        }

        .fw-target-div {
            margin-top: 10px;
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
        input,label{vertical-align:text-bottom}
        label{font-weight: 500}
        #add_div input[type="button"] {
            width: 18px!important;
        }
        .combo-select{display:inline-block;vertical-align:middle}
   		.mid{vertical-align:middle}
   		input[name="sfzhm"]{width:150px;}
   		input[name="mzjbmc"]{width:130px;padding-left:6px}
    </style>
	<%-- <script src="${path }/static/js/jquery.easyui.min.js"></script>
  	<script src="${path }/static/js/datagrid-filter.js"></script> --%>
  	<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
  	<script src="${path }/static/js/jquery.easyui.min.js"></script>
  	<script src="${path }/static/js/datagrid-filter.js"></script>
   <script src="${path }/static/extJs.js"></script>
   <script src="${path }/static/js/common.js"></script>
    <script src="${path}/static/js/jquery.combo.select.js"></script>
    <script type="text/javascript"> 
 $(function () {
	   $.extend($.fn.validatebox.defaults.rules, {   		
   		 sfz: {//value值为文本框中的值  
   		        validator: function (value) {  
   		            var reg = /^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/; 
   		            return reg.test(value);  
   		        },  
   		        message: '请输入准确的身份证号！'  
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
	   makedisable(true);
	   $("#cblxbm").comboSelect().parent().css({"width":"10%"});
       $(".textbox").addClass('hide'); //删掉莫名多出的下拉框
       $("#cblx,#bzfl,#bzmc,#zdmc").comboSelect().parent().find("input").attr("disabled","disabled");
       $("#cblx,#bzfl,#bzmc,#zdmc").parent().find(".combo-dropdown").addClass("hide");
	 doorpatientDataGrid  = $('#doorpatientDataGrid').datagrid({
            url : '${path }/patientRegist/patientregislist',
            // fit : true,
            striped : true,
           // rownumbers : true,
            pagination : true,
           singleSelect : true,
          //  idField : 'id',
            sortName : 'bzbm',
            sortOrder : 'asc',
            pageSize : 20,
            queryParams:$("#dataSearchForm").serializeObject(),
            pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
            columns : [ [
             {
                width : '15%',
                title : '参保类型',
                field : 'cblx',
                	  formatter : function(value, row, index) {  
                     	 switch (value) {
                          case "390":
                              return '城乡居民';
                          case "391":
                              return '城镇职工';
                          case "392":
                              return '省直医保';
                          }
                     	 
                     }
            },{
                width : '15%',
                title : '患者姓名',
                field : 'hzxm',
            
            },{
                width : '30%',
                title : '身份证号码',
                field : 'sfzhm',
               
            }, 
            {
                width : '25%',
                title : '单位或地址',
                field : 'dwhzz',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
             
            },  {
                width : '20%',
                title : '门规病种类型',
                field : 'mgjblx',
            
            },  {
                width : '20%',
                title : '门规疾病名称',
                field : 'mgjbmc',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
           
            },{
                width : '25%',
                title : '是否介入治疗',
                field : 'sfjrzl',
                formatter : function(value, row, index) {  
                	 switch (value) {
                     case "0":
                         return '否';
                     case "1":
                         return '是';
                     }
                }  
            },{
                width : '20%',
                title : '患者状态',
                field : 'hzzt',
                formatter : function(value, row, index) {  
               	 switch (value) {
                    case "1":
                        return '在管';
                    case "2":
                        return '转入';
                    case "3":
                        return '转出';
                    case "4":
                        return '死亡';
                    }
                }
            },{
                width : '25%',
                title : '生效时间',
                field : 'sxsj',
           
            },{
                width : '25%',
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
		
    	 $('#patientRegistForm').form({
             url : '${path }/patientRegist/updatePatient',
             onSubmit : function() {
            	 var mgjbbm=$('#mgjbbm').val();
            	 if(mgjbbm==''||mgjbbm==null){
            		 $.messager.alert('提示', "病种不能为空", 'info');
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
                	  $('#doorpatientDataGrid').datagrid('reload');
                	  cancle();
                	  } else {
                     $.messager.alert('错误', result.msg, 'error');
                 }
             }
         });
	})
  function bzmcbyfl() {
	 
	 /*$('#zdmc').combobox('clear');
		var fl=$("#bzfl").val();
		if(fl!=''){			
			$('#bzmc').combobox({
    	    	url:'${path }/mglimit/getbzmcbyfl?bzfl='+fl,
    	        valueField:'bzxh',
    	        textField:'bzmc', 
    	    	onChange: function (n,o) {	   
    	    		zdmcbybzxh();
 	    		}
    	 	 })
		}*/
        var fl=$("#bzfl").val();
        //$("#add_div").empty();
        //$("#mgjbbm").removeAttr("value");
        if(fl!=''){
            $("#bzmc,#zdmc").parent().find("input").removeAttr("disabled");
            $("#bzmc,#zdmc").parent().find(".combo-dropdown").removeClass("hide");
            selectRender('${path }/mglimit/getbzmcbyfl?bzfl='+fl,"#bzmc",null);
            zdmcbybzxh();
        }else{ //下拉框内容清空并失效
            $("#bzmc,#zdmc").val("").comboSelect();
            $("#bzmc,#zdmc").parent().find("input").attr("disabled",true);
            $("#bzmc,#zdmc").parent().find(".combo-dropdown").addClass("hide");
        }

	}

    function selectRender(url,id,bzmc){
    $.ajax({
        type:"POST",
        url:url,
        cache:false,
        async:false,
        dataType:"json",
        data:{"bzmc":bzmc},
        success:function(data){
            var str="";
             // console.log(data);      
            if(id=="#bzmc"){
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].jbmc+"'>"+data[i].jbmc+"</option>";
                }    
               
            }else if(id=="#zdmc"){
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].zdbm+"'>"+data[i].zdmc+"</option>";
                }                
            }
            $(id).empty().append($(str));
            $(id).comboSelect();
            $(id).parent().addClass('show');                       
        }
    })
}
	function zdmcbybzxh() {
		/*var bzxh=$("#bzmc").combobox('getValue');
		if(bzxh!=''){			
			$('#zdmc').combobox({
    	    	url:'${path }/mglimit/getbybzxh?bzxh='+bzxh,
    	        valueField:'zdbm',
    	        textField:'zdmc'
    	 	 })
		}*/
        var bzmc=$("#bzmc").val();
        //$("#add_div").empty();
        //$("#mgjbbm").removeAttr("value");
        if(bzmc!=''){
            selectRender('${path }/mglimit/getbybzmc',"#zdmc",bzmc);
        }
	}
	function addmgjb() {		
		/*var zdbm=$('#zdmc').combobox('getValue');
		var zdmc=$('#zdmc').combobox('getText');*/		
        var zdbm=$("#zdmc").val();
        var zdmc=$("#zdmc").find("option:selected").text()
		if(zdbm!=""&&zdmc!=""){
		var mgjbbm=$('#mgjbbm').val();
		if(mgjbbm ==''||typeof(mgjbbm)=='undefined'){
							 mgjbbm=zdbm;
					 $('#mgjbbm').val(mgjbbm);
			  var add_html = " <div class='add_div' ><input value="+zdbm+"  type='hidden'> </input> <span>" + zdmc + "</span><input type='button' class='del-div' /></div>";
	           $("#add_div").append(add_html);				
		}else{
			var mgarr=mgjbbm.split(",");
			var flag=0;
			  for (var i=0;i<mgarr.length ;i++ )  {  
	            if(mgarr[i]==zdbm){
	            	$.messager.alert('提示', "已选！", 'info');
	            	flag=1;
	            }
			  } 
			 if(flag==1){
				 return false;
			 } else{
				   mgjbbm=mgjbbm+","+zdbm;
				   $('#mgjbbm').val(mgjbbm);
			 	   var add_html = " <div class='add_div' > <input value="+zdbm+"  type='hidden'> </input> <span>" + zdmc + "</span><input type='button' class='del-div' /></div>";
	              $("#add_div").append(add_html);
				 
			 }
		}
	  }
	}
	
/* 	function removetemp() {
        console.log($(this));
		 $(this).parent().parent().remove();
	} */
	    function cancle() {
	    	 makedisable(true) ;
	    	 cleanForm() ;
			$("#cblx,#bzfl,#bzmc,#zdmc").parent().find("input").attr("disabled","disabled");
            $("#cblx,#bzfl,#bzmc,#zdmc").parent().find(".combo-dropdown").addClass("hide");
		}
	    function cleanForm() {
	        $('#input-table1 input[type=text]').val("");
	        $('#input-table1 input[type=hidden]').val("");
	        $('#add_div').html("");
	        $('#input-table1  select').val("");
	        $('input[name=sfjrzl]').attr("checked",false);
	        $('input[name=hzzt]').attr("checked",false);
	  	}
	    function add() {
	    	 makedisable(false) ;
	    	 cleanForm() ;
			$("#cblx,#bzfl").parent().find("input").removeAttr("disabled");
            $("#cblx,#bzfl").parent().find(".combo-dropdown").removeClass("hide");
		}
	    function makedisable( param) {
	        $(".xm-type").attr("disabled", param);
	        $(".xm-nm").attr("disabled", param);
	        $(".xu-hao").attr("disabled", param);
	        $(".yp-nm").attr("disabled", param);
	        $(".xd-nm").attr("disabled", param);
	        $(".yb-je").attr("disabled", param);
	        $(".yl-da").attr("disabled", param);
	        $(".yb-xe").attr("disabled", param);
	      /* $('#bzmc').combobox({disabled:param});
	       $('#zdmc').combobox({disabled:param});*/
	        $("#cancel").attr("disabled", param);
	        $("#update").attr("disabled", param); 
	        $("#addzdmc").attr("disabled", param); 
		}
	    
		function deletepatient() {    	 
	    	 var ss = "";
	    	  var rows = $('#doorpatientDataGrid').datagrid('getSelections');
	    	  if(rows.length<1){
	    	 	 $.messager.alert( '提示', "至少选一行", 'warning');
	    	 	 return;
	    	  }else{
	    	  for(var i=0; i<rows.length; i++){
	    	      var row = rows[i].sfzhm;
	    	      if(i==0){
	    	     	 
	    	     	 ss=ss+row; 
	    	      }else{
	    	      ss=ss+","+row;
	    	      }
	    	  }
	    	  }  
	    	     $.messager.confirm('询问', '您是否要删除当前记录？', function(b) {
	    	    
	    	             if (b) {
	    	                 
	    	                 $.post('${path }/patientRegist/deletePatient', {
	    	                     sfzhm : ss
	    	                 }, function(result) {
	    	                     if (result.success) {
	    	                         parent.$.messager.alert('提示', result.msg, 'info');
	    	                         cleanForm();
	    	                         $('#doorpatientDataGrid').datagrid('reload');
	    	                     }
	    	                     
	    	                 }, 'JSON');
	    	             }
	    	         
	    	     });
	    	 
	    	 
	    	 
		}
	    function updatemg() {
            cleanForm() ;
            $("#cblx,#bzfl,#bzmc,#zdmc").parent().find("input").attr("disabled","disabled");
            $("#cblx,#bzfl,#bzmc,#zdmc").parent().find(".combo-dropdown").addClass("hide");
	      	 var rows = $('#doorpatientDataGrid').datagrid('getSelections');
	    	  //var id=$('#Id').val();
	    	 if(rows.length==1){
	    		 $('#add_div').html('')
	    		 makedisable(false) ;
                $("#cblx,#bzfl,#bzmc,#zdmc").parent().find("input").removeAttr("disabled");
                $("#cblx,#bzfl,#bzmc,#zdmc").parent().find(".combo-dropdown").removeClass("hide");
                $("#cblx").val(rows[0].cblx).comboSelect();
                // $("#bzfl").val(rows[0].bzxh).comboSelect();
	    		$('#id').val(rows[0].id);
	    		//$('#bzfl').val(rows[0].bzfl);
	    		$('#hzxm').val(rows[0].hzxm);
	    		$('#sfzhm').val(rows[0].sfzhm);
	    		$('#dwhzz').val(rows[0].dwhzz);
	    		bzmcbyfl();
	    		$('#cblx').val(rows[0].cblx);
	    	//	$('#bzmc').combobox('setValue', rows[0].bzmc);
	    		zdmcbybzxh()
	    	//	$('#zdmc').combobox('setValue', rows[0].zdmc);
	    		
	    		$('#mgjbbm').val(rows[0].mgjbbm);
	    		$('#sxsj').val(rows[0].sxsj);
	    		$('#sxsj1').val(rows[0].sxsj1);
	    		$("input:radio[name=hzzt][value="+rows[0].hzzt+"]").attr("checked","true");
	    		$("input:radio[name=sfjrzl][value="+rows[0].sfjrzl+"]").attr("checked","true");

	    		 $("#add_div").val("");
	    		var mgjbmcarr=rows[0].mgjbmc.split(",");
	    		var mgjbbmarr=rows[0].mgjbbm.split(",");
	    		if(mgjbmcarr.length>0){    		
	   			  for (var i=0;i<mgjbmcarr.length ;i++ )  {  
	   				  var add_html = " <div class='add_div' > <input value="+ mgjbbmarr[i]+"  type='hidden' />  <span>" + mgjbmcarr[i] + "</span><input type='button'     class='del-div'  /></div>";
		              $("#add_div").append(add_html);
	   				  } 	    
	    		}
	    		  
	    	 }
	   	}
    </script>
</head>
<body>
<!--病种设定-->
<div class="header-div bg-color margin-top6">
<form id="dataSearchForm" class="margin-left20">
   <span class="fs_16">姓名</span>
   <input type="text" placeholder="输入姓名" size="10"  name="hzxm"  class="mid">
   <span class="pdl3p fs_16">身份证号</span>
   <input type="text" placeholder="输入身份证号码" size="19" style="width:10%" name="sfzhm"  class="mid">
   <span class="fs_16 pdl3p">疾病名称</span>
   <input type="fs_16 text"  name="mgjbmc" class="mid">
   <span class="fs_16 pdl3p">参保类型</span>
   <select  name="cblx">
       <option value="000">全部</option>
       <option value="390">城乡居民</option>
       <option value="391">城镇职工</option>
       <option value="392">省直医保</option>
   </select>
   <div style="display:inline-block;id="search">
       <button class="btn btn-info btn-sm " type="button" onclick="serchdata()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
   </div>
</form>
</div>

<div>
<div class="tab-div-box" style="float: left">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb bg-color">
                <div class="gauge-title-div border-bom">
                    <table class="margin-top10 float-right" width="100%">
                        <tr>
                            <td class="left"><label class="radius"></label>门规患者列表</td>
                            <td class="text-right">
                                <button class="btn btn-info btn-sm" id="add" onclick="add()"><img src="${staticPath }/static/img/menu/xinzeng-icon.png"><span>新增</span></button>
                                <button class="btn btn-primary btn-sm" id="del" onclick="deletepatient()"  ><img src="${staticPath }/static/img/menu/del.png"><span>删除</span></button>
                                <button class="btn btn-success btn-sm margin-right10"><img src="${staticPath }/static/img/menu/btn1-icon.png"><span>导出</span></button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="body-width padding10">
                    <div class="ys-rc-div">
                        <table id="doorpatientDataGrid" style="max-height:530px" class="zy-table body-width common-table on-style">
                         	<tbody>
                         	</tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fw-target-div bz-div" style="overflow-x: auto;height: 613px;"> 
    <div class="gauge-title-div border-bom">
        <table class=" float-right" width="100%">
            <tr>
                <td class="left"><label class="radius"></label>门规患者登记</td>
                <td class="text-right">
                </td>
            </tr>
        </table>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <form  id="patientRegistForm"   method="post">
    <table class="input-table" id="input-table1">
        <tr>
            <td>参保类型</td>
            <td>
                <select id="cblx" name="cblx" class="xm-type" data-options="required:true">
                   <option value="000">请选择</option>
                    <option value="390">城乡居民</option>
                    <option value="391">城镇职工</option>
                    <option value="392">省直医保</option>
                </select>
            </td>

        </tr>
        <tr>
            <td>患者姓名</td>
            <td>
                <input name="hzxm" id="hzxm"style="width:120px;"  data-options="required:true" type="text" validType="length[1,20]"  class="easyui-validatebox xm-nm">
            </td>
            <td>身份证号</td>
            <td>
                <input id="sfzhm" name="sfzhm" type="text" data-options="required:true"   style="width:160px;"  validateOnCreate="false"
                           validType="sfz"  class="easyui-validatebox xm-nm"  class="xu-hao">
            </td>
        </tr>
        <tr>
            <td>单位或住址</td>
            <td colspan="3">
             <input name="id"   id="id"  type="hidden"   />
                <input type="text"  style="width:260px;" validType="length[1,40]" id="dwhzz"  name="dwhzz" class="easyui-validatebox yp-nm">
            </td>
        </tr>
        <tr>
            <td>病种分类</td>
            <td>
                <select   id="bzfl" onchange="bzmcbyfl()">
                    <option value="">请选择</option>
                    <option value="1">I类</option>
                    <option value="2">II类</option>
                    <option value="3">III类</option>
                </select>
            </td>
            <td>门规病种类型</td>
            <td>
           
   <!--  <input   id="bzmc" name="bzmc"    style="width: 120px" class=" easyui-validatebox xd-nm"   type="text" > -->
                
            <select name="bzmc" id="bzmc" onchange="zdmcbybzxh()"></select>
            </td> 
            <!-- <td>&nbsp;</td> -->
        </tr>
        <tr>
            <td>疾病名称</td>
            <td>         
                <!-- <input type="text"  id="zdmc"    name="zdmc"  style="width: 120px"  class=" easyui-validatebox xd-nm" style="width: 120px" > -->
                <select name="zdmc" id="zdmc"></select>
            </td>
            <td class="padding-left10" style="text-align: left;padding-top: 12px;">
                
                <img style="height: 18px;width: 18px;" src="${path }/static/img/new_img/add.png" onclick="addmgjb()" class="add-tr"/>
            </td>
        </tr>
        <tr>
            <td>门规疾病名称               <input type="hidden" id="mgjbbm"  name="mgjbbm"    />
            </td> 
            
            <td colspan="3"    id="add_div" >
            </td>
        </tr>
        <tr>
            <td>是否介入治疗</td>
            <td>
                <input type="radio" name="sfjrzl" value="1"><label class="padding-left5">是</label>
                <span class="padding-left20">&nbsp;</span>
                <input type="radio" name="sfjrzl" value="0" ><label class="padding-left5">否</label>
            </td>
        </tr>
        <tr>
            <td>患者状态</td>
            <td colspan="3">
                <input type="radio" name="hzzt" value="1"><label class="padding-left5">在管</label>
                <span class="padding-left5">&nbsp;</span>
                <input type="radio" name="hzzt" value="2" ><label class="padding-left5">转入</label>
                <span class="padding-left5">&nbsp;</span>
                <input type="radio" name="hzzt" value="3" ><label class="padding-left5">转出</label>
                <span class="padding-left5">&nbsp;</span>
                <input type="radio" name="hzzt" value="4" ><label class="padding-left5">死亡</label>
            </td>
        </tr>
        <tr>
            <td>生效时间</td>
            <td>
                <div class="input-group date form_date">
                     <input  name="sxsj" type="text" id="sxsj"  style="width:120px;height: 32px;padding-left:10px" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" /> 
                </div>
            </td>
            <td>失效时间</td>
            <td>
                <div class="input-group date form_date">
          			 <input  name="sxsj1" id="sxsj1" type="text" style="width:120px;height: 32px;padding-left:10px" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />
      			</div>
            </td>
        </tr>

    </table>
    </form>
    <div class="hr-div" style="margin-top:10px">
        <button class="btn btn-primary margin-right10 fs_16" onclick="$('#patientRegistForm').submit()"  id="update">保存</button>
        <button class="btn btn-primary margin-right10 fs_16" onclick="cancle()"  id="cancel">取消</button>
    </div>
</div>
</div>
<div class="clear"></div>



<script>

    $(function () {
        $("#add_div").on("click", ".del-div", function () { 
        	var  zdbm=   $(this).parent().find('input[type=hidden]').val();        	
        	var mgjbbm=$('#mgjbbm').val();
        	var mgarr=mgjbbm.split(",");
        	
			  for (var i=0;i<mgarr.length ;i++ )  {  
	            if(mgarr[i]==zdbm){
	            	
	            	mgarr.splice(i,1);
	            }
			  } 			  
			  $('#mgjbbm').val(mgarr.toString());			  
            $(this).parent().remove();          
        });
        

        //下来框选项
        $('.yb-xe').bind({
            blur:function(){
                if (this.value == "冠心病"){
                    $("input[name='zl']").removeAttr("disabled");
                }
                else{
                    $("input[name='zl']").attr("disabled", "true");
                }
            }
        });

        /*表格鼠标事件*/
        function active_tr(){
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

                        var list = [];
                        var list_length = $(this).find('td').length;
                        for (var i = 1; i < list_length; i++) {
                            list.push($(this).find('td')[i].innerHTML);
                        }

                        $("#input-table1").find('select').get(0).options[0].selected = true;
                        $("#input-table1").find('select').get(1).options[0].selected = true;
                        $("input[name='zt']").get(0).checked=true;


                        var table_list = [];
                        table_list = $("#input-table1").find('input[type=text]');
                        var table_date = $("#input-table1").find('input[type=date]');
                        table_date.eq(0).attr("value", list[8]);
                        table_date.eq(0).attr("value", list[9]);

                        for (var i = 0; i < table_list.length; i++) {
                            table_list.eq(i).attr("value", list[i]);
                        }
                    }
                }
            });
        }

        /*点击新增按钮事件*/
        $("#add").click(function () {
            var xm_type_val = $(".xm-type option:selected").text();
            var xm_nm = $(".xm-nm").val();
            var xm_xu_hao = $(".xu-hao").val();
            var xm_yp_nm = $(".yp-nm").val();
            var xm_nm_val = $(".xd-nm option:selected").text();
            var xm_yb_je = $(".yb-je").val();
            var xm_yb_xe = $(".yb-xe").val();
            var ra_val1;
            var ra_val2;
            var xm_zl = $('input:radio[name="zl"]:checked').val();
            var xm_zt = $('input:radio[name="zt"]:checked').val();
            var xm_str_date = $(".str-date").val();
            var xm_end_date = $(".end-date").val();
            if(xm_zl == null){
                ra_val1 = "-";
            }
            else{
                ra_val1=xm_zl;
            }
            if(xm_zt == null){
                ra_val2 = "-";
            }
            else{
                ra_val2=xm_zt;
            }

            var add_html = "<tr> <td>" + xm_type_val + "</td>" + "<td>"+xm_nm+"</td>"+ "<td>"+xm_xu_hao+"</td>"+ "<td>"+xm_yp_nm+"</td>"
                    + "<td>"+xm_nm_val+"</td>"+ "<td>"+xm_yb_je+"</td>"+ "<td>"+xm_yb_xe+"</td>"+ "<td>"+ra_val1+"</td>"+ "<td>"+ra_val2+"</td>"
                    + "<td>"+xm_str_date+"</td>"+ "<td>"+xm_end_date+"</td> </tr>";
            $(".on-style").append(add_html);
            active_tr()
        });

        /*点击修改按钮事件*/
        $("#update").click(function () {
            var xm_type_val = $(".xm-type option:selected").text();
            var xm_nm = $(".xm-nm").val();
            var xm_xu_hao = $(".xu-hao").val();
            var xm_yp_nm = $(".yp-nm").val();
            var xm_nm_val = $(".xd-nm option:selected").text();
            var xm_yb_je = $(".yb-je").val();
            var xm_yb_xe = $(".yb-xe").val();
            var ra_val1;
            var ra_val2;
            var xm_zl = $('input:radio[name="zl"]:checked').val();
            var xm_zt = $('input:radio[name="zt"]:checked').val();
            var xm_str_date = $(".str-date").val();
            var xm_end_date = $(".end-date").val();
            if(xm_zl == null){
                ra_val1 = "-";
            }
            else{
                ra_val1=xm_zl;
            }
            if(xm_zt == null){
                ra_val2 = "-";
            }
            else{
                ra_val2=xm_zt;
            }

            var list = [xm_type_val,xm_nm,xm_xu_hao,xm_yp_nm,xm_nm_val,xm_yb_je,xm_yb_xe,ra_val1,ra_val2,xm_str_date,xm_end_date];

            var table_list = [];
            table_list = $(".active-tr").find('td');

            for (var i = 0; i < table_list.length; i++) {
                table_list.eq(i).text(list[i]);
            }

        });
        /*删除table数据*/
        $("#del1").click(function () {
            $(".active-tr").css("display", "none");
        });
        $('input[type="button"]').click(function(){$(this).parent().remove();})
        
       
    });
    
    $("a,button").focus(function () {
        this.blur()
    });
    
    function serchdata(){
    	$('#doorpatientDataGrid').datagrid('load',$("#dataSearchForm").serializeObject());
    }
    
  //form表单数据格式化
    $.fn.serializeObject = function() {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
    
</script>
</body>
</html>