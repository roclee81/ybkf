<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
 <script src="${path }/static/js/jquery.easyui.min.js"></script>
  <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
    <title>决策分析-出院查询</title>
    <style>
        input,select{
            width: 130px;
        }
        .panel-body{
        	padding: 0px;
        }
    </style>
    <script type="text/javascript">
    $(function() {
    	
    	
        $.extend($.fn.validatebox.defaults.rules, {    		
    		    floatdata: {//value值为文本框中的值  
    		        validator: function (value) {  
    		            var reg = /^\d+(\.\d+)?$/;
    		             return reg.test(value)
    		            },		           
    			        message: '请输入数字'  
    		    }
         });
    	
		
	})
    
    </script>
</head>
<body>
    <div class="body-width fs_18 bold header-color">出院查询</div>
    <div class="fy-ce-header">
        <div class="float" style="width: 90%">
            <table class="yb-ce-table">
                <tbody>
                <tr>
                    <td class="fs_16">
                       出院日期
                    </td>
                    <td>
                        <input id='ldate' type="date" style="width: 130px">
                    </td>
                    <td class="fs_16">
                        至&nbsp;
                        <input id='hdate' type="date" style="width: 130px">
                    </td>
                    <td class="fs_16 right">
                        科室
                       <input id="depart"  class="easyui-combobox"  style="width:100px;">
                    </td>
                    <td class="fs_16 padding-left30">
                        医生组
                    </td>
                    <td>
						<input id="dg"  class="easyui-combobox"  style="width:100px;">
                    </td>
                    <td class="fs_16 padding-left30">
                        医保卡号
                    </td>
                    <td>
                        <input id='ybkhin' type="text" placeholder="3435**34"/>
                    </td>
                    <td class="padding-left10">
                        <button class="btn-ok fs_16" onclick="searchAll()">查询</button>
                    </td>
                </tr>
                <tr>
                    <td class="fs_16">
                        选项
                    </td>
                    <td>
                        <select id="selected">
                            <option value="ylfy">医疗费用</option>
                            <option value="ybtczfed">医保统筹支付额度</option>
                            <option value="zysj">住院时间</option>
                            <option value="yzb">药占比</option>
                        </select>
                    </td>
                    <td class="fs_16">
                        区间
                        <input type="text"  validType="floatdata" class="easyui-validatebox" validateOnCreate="false"  id="qj1" value="1">
                    </td>
                    <td class="fs_16">
                        -
                        <input   type="text" validType="floatdata" class="easyui-validatebox" validateOnCreate="false" id="qj2" value="100">
                        <span class="span1">元</span>
                    </td>
                    <td class="padding-left10" style="text-align: left;padding-top: 12px">
                        <button id="addbutton" class="add-tr"></button>
                    </td>
                </tr>
                </tbody>
            </table>
            <div id="add_div" style="width: 88%;margin-left: 6px">

            </div>
        </div>
        <div class="clear"></div>
    </div>

    <!--出院患者信息-->
    <div class="body-width margin-top20">
        <table class="body-width">
            <tr>
                <td class="half-body-width fs_16 bold padding-top">出院患者信息</td>
            </tr>
        </table>
    </div>
    <div class="ks-fy-line-div border-val" style="height:352px">
        <table id='dgresult' class="body-width sf-msg-table">
            
        </table>
    </div>
    <script>
    
    var a={};
        $(function() {
    		$('#depart').combobox({
    			url:'${path}/department/getDepartmentOfUser',
    		     valueField:'ksbm',
    		     textField:'ksmc',
    			onLoadSuccess: function () {
    				chooseFirstOption(this);
    			},
    			onChange:function(newValue,oldValue){
    				loadylz(newValue);
    			}
    		});
            /*费用区间、增加按钮事件*/
            $("#selected").change(function () {
                var sel_val = $("#selected option:selected").val();
                if (sel_val == 'zysj'){
                    $(".span1").eq(0).text('天');
                    console.log($(".span1").text());
                }
                else if (sel_val == 'yzb'){
                    $(".span1").text('%');
                }
                else{
                    $(".span1").text('元');
                }
            });

            /*增加按钮点击事件*/
            $(".add-tr").click(function () {
                var sel_val = $("#selected option:selected").index();
                var select_text = $("#selected option:selected").text();
                var select_value = $("#selected option:selected").val();              
                var money1_val = $("#qj1").val();
                var money2_val = $("#qj2").val();
                if(select_value=='yzb'){
                	if(money1_val>100||money2_val>100){
                     	 $.messager.alert( '提示', "请输入正确的区间值！", 'warning');
                     	 return
                	}
                }
                
                var unit_val = $(".span1").text();            
                if(parseInt(money2_val) > parseInt(money1_val)){
                    var html_td = "<div class='add_div del_div add'>" + select_text + "：￥"
                            + money1_val + "-" + money2_val + unit_val + ".<button class='del-div'></button>" + "</div>";
                    $("#add_div").append(html_td);
                    /*费用选项下拉框中	删除选中的费用*/
                    $("#selected option")[sel_val].remove();
                    checkedSelect();
                }
                else{
                  
                  	 $.messager.alert( '提示', "请输入正确的区间值！", 'warning');

                }

            });

            /*点击删除事件*/
            $("#add_div").on("click",".del-div",function(){
                $(this).parent().remove();
                var del_div_val = $(this).parent().text();
                var options_val = del_div_val.substring(0,del_div_val.indexOf("："));
                var  optionvalue="";
                	if(options_val=='药占比'){
                		optionvalue='yzb';
            		}
    				if(options_val=='住院时间'){
    					optionvalue='zysj';
            		}
    				if(options_val=='医保统筹支付额度'){
    					optionvalue='ybtczfed';
            		}
    				if(options_val=='医疗费用'){
    					optionvalue='ylfy';
            		}
                var select_html = "<option value="+optionvalue+" >"+options_val+"</option>"
                $("#selected").append(select_html);
                checkedSelect();
            });
        });
        $("a,button").focus(function(){this.blur()});
        
       	$('#dgresult').datagrid({
	          //url : '${path }/costoverfulfil/postin',
	    	  columns:[[
    	              {field:'KSMC',title:'科室',width:100},
    	              {field:'XM',title:'姓名',width:100},
    	              {field:'XB',title:'性别',width:100},
    	              {field:'NL',title:'年龄',width:100},
    	              {field:'YBKH',title:'医保卡号',width:100},
    	              {field:'RYRQ',title:'入院日期',width:100},
    	              {field:'CYRQ',title:'出院日期',width:100},
    	              {field:'CYZYZD',title:'出院主要诊断',width:100},
    	              {field:'ZYTS',title:'住院天数',width:100},
    	              {field:'YBNZJE',title:'医保统筹支付(元)',width:100},
    	              {field:'ZFZE',title:'个人自付(元)',width:100},
    	              {field:'ZFZJE',title:'自费金额 (元)',width:100},
    	              {field:'YFZE',title:'药品费(元)',width:100},
    	              {field:'JCJYF',title:'检查检验费(元)',width:100},
    	              {field:'ZLF1',title:'诊疗费(元)',width:100},
    	              {field:'CLF',title:'材料费(元)',width:100},
    	              {field:'ZFZB',title:'自费占比',width:100},
    	              {field:'YZB',title:'药占比',width:100},
    	              {field:'JCJYZB',title:'检查检验占比 ',width:100},
    	              {field:'ZLZB',title:'诊疗占比',width:100},
    	              {field:'CLZB',title:'材料占比',width:100,align:'right'}
	    	    ]],
	          //striped : true,
	            rownumbers : true,
	            pagination : true,
	            remoteFilter: true,//这里设置成true时，会向后台发送一个filterRules的参数
	            singleSelect : false,
	           // idField : 'rybh',
	           fit:true,
	    		sortName : 'cyrq',
	        	sortOrder : 'desc',
	            pageSize : 10,
	            pageList : [10],
	            onBeforeLoad: function (param) {
	              	  updateDatagridHeader(this);
	            }

		});
        
   
        
        function searchAll(){

        	
    		
        	var condition=[];
        	a={};

        	
        	for (var i = 0; i < $('.add').length; i++) {
        		var c={};
        		var str= $($('.add')[i]).html();
        		c.min=str.substring(str.indexOf('￥')+1,str.indexOf('-'));
        		c.max=str.substring(str.indexOf('-')+1,str.indexOf('.')-1);

        		var it=str.substring(0,str.indexOf('：'));

         		if(it=='药占比'){
        			c.id='YZB';
        		}
				if(it=='住院时间'){
        			c.id='ZYTS';
        		}
				if(it=='医保统筹支付额度'){
        			c.id='YBNZJE';
        		}
				if(it=='医疗费用'){
        			c.id='ZFY';
        		}

        		condition.push(c); 
			}
         	a.condition=condition;
         	if($('#ldate').val()!=''){
         		
         		a.ldate=$('#ldate').val();
         	}
         	if($('#hdate').val()!=''){
         		
         		a.hdate=$('#hdate').val();
         	}

			a.ksbm=$('#depart').combobox('getValue');
			if($('#dg').combobox('getValue')!=''){
				a.ylzbm=$('#dg').combobox('getValue');
			}
			
			if($('#ybkhin').val()!=null){
				a.ybkh=$('#ybkhin').val();
			}
			

   	        var myloader=function(param,success,error){
   				a.page=param.page;
   				a.rows=param.rows;
   				a.sort=param.sort;
   				a.order=param.order;
   				a.filterRules=param.filterRules;
   				a.methodFlag='aaa';

   		        $.ajax({
   			             url:"${path}/searchLeave/postin",
   			             data:JSON.stringify(a),
   			             type:"post",
   			             dataType:"json",
   			             contentType:'application/json;charset=UTF-8',
   			             //jsonpCallback:"callback",
   			             success: function(data){
   			            	 success(data);
   			             }
   			         })
   			     }; 
   	   	  		$('#dgresult').datagrid({
   	   	 			loader:myloader
   	   	 		}); 
        }
        
        function loadylz(did){
        	//加载医疗组下拉框的方法
        		$.ajax({
        			url:'${path}/doctorGroup/findByksbm',
        			data:{ksbm:did},
        			success:function(data){

        				$('#dg').combobox({
       				     	 data:JSON.parse(data),
        				     valueField:'ylzbm',
        				     textField:'ylzmc'
        				});
        			}
        		})
        }
        
      function  checkedSelect() {
    	  var sel_val = $("#selected option:selected").val();
          if (sel_val == 'zysj'){
              $(".span1").eq(0).text('天');
              console.log($(".span1").text());
          }
          else if (sel_val == 'yzb'){
              $(".span1").text('%');
          }
          else{
              $(".span1").text('元');
          }
          if(sel_val==null ||sel_val==''||typeof(sel_val)=='undefined'){
        	 $("#addbutton").attr('disabled',true);
          }else{
        	  $("#addbutton").attr('disabled',false);
          }
	} 
        
    </script>
</body>
</html>