<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head lang="en">
    <meta charset="UTF-8">
    <title>病种指标设定</title>

    <link href="${path }/static/css/common.css" rel="stylesheet">
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
    </style>
</head>
<body>
<form id="dataSearchForm" class="margin-left20">
	<span class="fs_16">疾病名称</span>
   <input type="fs_16 text"  name="jbmc" class="mid">
   <span class="fs_16 pdl3p">治疗方式</span>
   <input type="fs_16 text"  name="zlfsmc">
   <div style="display:inline-block;margin-left:2%" id="search">
       <button class="btn btn-info btn-sm " type="button" onclick="datagridRender()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
   </div>
</form>
<!--病种设定-->
<div>
<div class="tab-div-box">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb bg-color" style="height: 540px">
                <div class="gauge-title-div">
                    <table class="margin-top10 float-right" width="100%">
                        <tr>
                            <td class="left">病种指标设定</td>
                            <td class="text-right">
                                <button class="btn btn-sm btn-info "><img src="${path }/static/img/menu/btn1-icon.png">导出
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="body-width padding10 padding-top0">
                    <div class="ys-rc-div">
                        <table class="zy-table body-width common-table on-style" id="bzzbsd">
                            
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fw-target-div bz-div" style="overflow-x: auto;height: 540px">
	<form id="bzsdForm" method="post">
	    <table class="input-table" id="input-table1">
	        <tr>
	            <td>病种分类</td>
	            <td>
	                <select name="bzfl">
	                    <option value="0">请选择</option>
	                    <option value="1">神经系统疾病</option>
	                    <option value="2">呼吸系统疾病</option>
	                    <option value="3">消化系统疾病</option>
	                </select>
	                <input type="hidden" name="id" id="id"/>
	            </td>
	            <td>病种序号</td>
	            <td>
	                <input type="text" class="xu-hao" name="bzxh">
	            </td>
	
	        </tr>
	         <tr>
	            <td>疾病编码</td>
	            <td>
	                <input type="text" name="jbbm">
	            </td>
	            <td>疾病名称</td>
	            <td>
	                <input type="text" name="jbmc">
	            </td>
	
	        </tr>
	        <tr>
	            <td>治疗方式编码</td>
	            <td>
	                <input type="text" name="zlfsbm">
	            </td>
	            <td>治疗方式名称</td>
	            <td>
	                <input type="text" name="zlfsmc">
	            </td>
	        </tr>
	        <tr>
	            <td>医疗总费用限额</td>
	            <td>
	                <input type="text" name="ylfxe">
	            </td>
	            <td class="padding-left20">医保统筹支付限额</td>
	            <td>
	                <input type="text" name="ybtcfxe">
	            </td>
	            <td>&nbsp;</td>
	        </tr>
	        <tr>
	            <td>限定住院时间</td>
	            <td>
	                <input type="text" name="xdzyts">
	            </td>
	            <td>药品费</td>
	            <td>
	                <input type="text" name="ypf">
	            </td>
	        </tr>
	        <tr>
	            <td>手术费</td>
	            <td>
	                <input type="text" name="ssf">
	            </td>
	            <td>麻醉费</td>
	            <td>
	                <input type="text" name="mzf">
	            </td>
	        </tr>
	        <tr>
	            <td>检查费</td>
	            <td>
	                <input type="text" name="jcf">
	            </td>
	            <td>检验费</td>
	            <td>
	                <input type="text" name="jyf">
	            </td>
	        </tr>
	        <tr>
	            <td>诊疗费</td>
	            <td>
	                <input type="text" name="zlf">
	            </td>
	            <td>材料费</td>
	            <td>
	                <input type="text" name="clf">
	            </td>
	        </tr>
	        <tr>
	            <td>生效时间</td>
	            <td>
	               <!--  <input type="date" style="width: 124px" name="effectime"> -->
	               <div class="input-group date form_date">
                     <input  name="effectime" type="text" id="sxsj"  style="width:120px;height: 32px;padding-left:10px" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" /> 
                	</div>
	            </td>
	            <td>失效时间</td>
	            <td>
	                <!-- <input type="date" style="width: 124px" name="failuretime"> -->
	                 <div class="input-group date form_date">
                     <input  name="failuretime" id="sxsj1" type="text" style="width:120px;height: 32px;padding-left:10px" placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd'})" readonly="readonly" />
                	</div>
	            </td>
	
	        </tr>
	    </table>
	</form>
    <div class="hr-div" style="margin-top:10px">
        <button class="btn btn-primary margin-right10 fs_16 " type="button" id="insert">新增</button>
        <button class="btn btn-primary margin-right10 fs_16 " id="add1">保存</button>
        <button class="btn btn-primary margin-right10 fs_16 " id="del1">删除</button>
    </div>
</div>
</div>
</div>
<div class="clear"></div>
<!--临床路径医嘱收费项目维护-->
<div class="tab-div-box margin-bottom20">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb bg-color" style="height:auto">
                <div class="gauge-title-div">
                    <table id="btn-table" class="margin-top10 float-right" width="100%">
                        <tr>
                            <td class="left">临床路径医嘱收费项目维护</td>
                            <td class="text-right">
                                <button class="btn btn-sm btn-info "><img src="${path }/static/img/menu/btn1-icon.png">导出
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="body-width padding10 padding-top0">
                    <div class="ys-rc-div">
                        <table class="zy-table body-width common-table on-style1">
                            <tbody>
                            <tr>
                                <th>临床路径编码</th>
                                <th>病种序号</th>
                                <th>病种名称</th>
                                <th>项目类型</th>
                                <th>项目编码</th>
                                <th>项目名称</th>
                                <th>药品限定用量</th>
                                <th>限定次数</th>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>麻醉用药</td>
                                <td>Y00000000244</td>
                                <td>氟吗西尼注射液</td>
                                <td>-</td>
                                <td>3</td>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>麻醉用药</td>
                                <td>Y00000000436</td>
                                <td>盐酸托烷司琼注射液</td>
                                <td>-</td>
                                <td>3</td>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>消化系统用药</td>
                                <td>Y00000000578</td>
                                <td>10%氯化钾注射液</td>
                                <td>-</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>呼吸系统用药</td>
                                <td>Y00000000702</td>
                                <td>盐酸氨溴索针</td>
                                <td>-</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>麻醉用药</td>
                                <td>Y00000000436</td>
                                <td>盐酸托烷司琼注射液</td>
                                <td>-</td>
                                <td>1</td>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>消化系统用药</td>
                                <td>Y00000000578</td>
                                <td>10%氯化钾注射液</td>
                                <td>-</td>
                                <td>2</td>
                            </tr>
                            <tr>
                                <td>-</td>
                                <td>00001</td>
                                <td>阑尾炎</td>
                                <td>解热镇痛药物</td>
                                <td>Y00000010221</td>
                                <td>氟比洛芬酯(凯纷)</td>
                                <td>-</td>
                                <td>3</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fw-target-div"
     style="overflow-x:auto; overflow-y:auto; margin-right:0;min-height: 182px; max-height: 336px">
    <table id="add-table" class="input-table input-table2">
        <tr>
            <td>临床路径编码</td>
            <td>
                <input type="text">
            </td>
            <td>项目类型</td>
            <td>
                <select class="xm-type" style="width: auto !important;padding-right: 20px;height: 32px">
                    <option>政策内药品目录</option>
                    <option>政策内诊疗项目</option>
                </select>
            </td>
            <td>项目编码</td>
            <td>
                <input type="text" class="xm-nm" placeholder="0256"/>
            </td>

        </tr>
        <tr>
            <td>项目名称</td>
            <td>
                <input type="text" class="xm-name" placeholder="输液">
            </td>
            <td>药品限定用量</td>
            <td>
                <input type="text" class="yp-nm" placeholder="100ml/瓶"/>
            </td>
            <td>限定次数</td>
            <td>
                <input type="text" class="xd-nm" placeholder="3">
            </td>

            <td>
                <button class="add-tr" style="width:18px!important"></button>
            </td>
        </tr>
    </table>
    <div class="hr-div">
        <button class="btn btn-primary margin-right10 fs_16" id="add2">保存</button>
        <button class="btn btn-primary margin-right10 fs_16" id="del2">删除</button>
    </div>
</div>
</div>
<div class="clear"></div>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/js/common.js"></script>
<%-- <script src="${path}/static/js/jquery.combo.select.js"></script> --%>
<script>
    /*初始化*/
    $(document).ready(function () {
    	 clearForm(true);
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
                $("#del2").removeAttr("disabled");
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
    	
    	datagridRender();
    	
    	/* 新增数据 */
    	$('#insert').click(function (){
    		// 清空表格
    		clearForm(false);
    		// 校验数据
    	})

        $("#add1").click(function () {
            updateDisease();
        });
        /*删除table数据*/
        $("#del1").click(function () {
        	clearForm(true);
        	deleteData('diseaseSet/del');
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
    
    // 查询病种指标设定
	function datagridRender(){
	     $('#bzzbsd').datagrid({
	        url:'diseaseSet/diseaseSetDatagrid',
	        fit:false,
	        striped:false,
	        pagination : true,
	        rownumbers:true,
	        singleSelect : true,
	        queryParams:$('#dataSearchForm').serializeObject(),
	        pageSize : 10,
	        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [
							{
								width : '15%',
								title : '病种分类',
								field : 'bzfl'
							},
							{
								width : '15%',
								title : '病种序号',
								field : 'bzxh'
							},
							{
								width : '15%',
								title : '疾病编码',
								field : 'jbbm'
							},
							{
								width : '15%',
								title : '疾病名称',
								field : 'jbmc',
								formatter : function(value) {
									if (value == null) {
										return '-';
									} else {
										return "<span title='" + value + "'>"
												+ value + "</span>"
									}
								}

							},
							{
								width : '15%',
								title : '治疗方式编码',
								field : 'zlfsbm',
								formatter : function(value) {
									if (value == null) {
										return '-';
									} else {
										return "<span title='" + value + "'>"
												+ value + "</span>"
									}
								}
							},
							{
								width : '15%',
								title : '治疗方式名称',
								field : 'zlfsmc',
								formatter : function(value) {
									if (value == null) {
										return '-';
									} else {
										return "<span title='" + value + "'>"
												+ value + "</span>"
									}
								}
							}, {
								width : '15%',
								title : '医疗总费用限额(元)',
								field : 'ylfxe'
							}, {
								width : '15%',
								title : '医保统筹费用限额(元)',
								field : 'ybtcfxe'
							}, {
								width : '15%',
								title : '限定住院时间(天)',
								field : 'xdzyts'
							}, {
								width : '15%',
								title : '药品费',
								field : 'ypf'
							}, {
								width : '15%',
								title : '手术费',
								field : 'ssf'
							}, {
								width : '15%',
								title : '麻醉费',
								field : 'mzf'
							}, {
								width : '15%',
								title : '检查费',
								field : 'jcf'
							}, {
								width : '15%',
								title : '检验费',
								field : 'jyf'
							}, {
								width : '15%',
								title : '诊疗费',
								field : 'zlf'
							}, {
								width : '15%',
								title : '材料费',
								field : 'clf'
							}, {
								width : '15%',
								title : '生效时间',
								field : 'effectime'
							} , {
								width : '15%',
								title : '失效时间',
								field : 'failuretime'
							}  
							] ],
					onBeforeLoad : function(param) {
						updateDatagridHeader(this);
						changeRowHeader(this);
					},
					onClickRow	 : function(index, row){
						clearForm(false);
						$.each(row,function(id,data){
							$('#bzsdForm input[name='+id+']').val(data);
						});
					},
					onLoadSuccess : function(data) {
						window.onresize = function() {
							$('#bzzbsd').datagrid('resize');//列表随屏幕大小变化
						}
					}
				}) 
	}
    
    // 删除
	function deleteData(url){
		var id = null;
        var rows = $('#bzzbsd').datagrid('getSelections');
        if(rows.length<1)
        {
          	 $.messager.alert( '提示', "请至少选一行", 'warning');
          	 return false;
        }else
        {
        	id=rows[0].id; 
        }
         
        $.messager.confirm('提示', '确定删除选中行', function(result){
        	if(result){
        		 $.post(url, {
           		     id : id
                  }, function(result) {
                	  datagridRender();
                  }, 'JSON');
        	}
        });
	}
    
	function clearForm(formFlag)
	{
		$('#bzsdForm').form('clear');
		$('#bzsdForm input[type="date"]').val("");
		$('#bzsdForm select').val(0);
		$('#bzsdForm input').attr("disabled", formFlag);
	}
	
	function updateDisease()
	{
		$.ajax({
	        type:"POST",
	        url:'${path}/diseaseSet/change',
	        cache:false,
	        async:false,
	        dataType:"json",
	        data:$("#bzsdForm").serializeObject(),
	        success:function(result){
	            $.messager.alert('通知',result.msg,'info');
	            datagridRender();
	        }
	    })
	}
	
	//form表单数据格式化
	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name] !== undefined) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
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