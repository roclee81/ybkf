<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- 单据审核页面 -->
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>单据审核</title>
   
    <style>
        .sf-msg-table th{
            border-top: none !important;
        }
        label{font-weight: 500 !important;height: 100%}
        .jz-msg td{ white-space: nowrap;}
        ul, ol{margin-top: 2px margin-bottom: 4px !important;}
        .radio-table td:nth-child(1){ width: 4%!important;}
        .panel-body{
        	padding: 0px;
        }
    </style>
</head>
<script>
function InvoiceExport() {
	  var ldate=$('#ldate').val();
	 var	hdate=$('#hdate').val();
	 var	department=$('#depart').val();
	var	docname =$('#docname').val();
	var	patname=$('#patname').val();
	var	miid=$('#miid').val();
	var	mitype=$('#mitype').val();
	var	mctype=$('#mctype').val();
	var	machinestatus="";
	var	personstatus="";
	var	illegalrule=$('#illegalrule').val();
	$('input[class="machinestatus"]:checked').each(function(){ 
		machinestatus+=$(this).val()+",";
	}); 
	$('input[class="personstatus"]:checked').each(function(){ 
		personstatus+=$(this).val()+",";
	}); 
	
	location.href="${path }/invoiceCheck/invoiceExport?ldate="+ldate+"&hdate="
	+hdate+"&department="+department+"&docname="+docname+"&patname="+patname+"&miid="
	+miid+"&mitype="+mitype+"&mctype="
	+mctype+"&machinestatus="+machinestatus+"&personstatus="+personstatus+"&illegalrule="+illegalrule
	
	
	
}
  

</script>
<body>
    <!--筛选条件-->
    <div class="body-width fs_18 bold header-color">单据审核</div>
    <div class="body-width border-val xy-div-bg margin-top6">
        <table class="ys-table" style="width:66%">
            <tbody>
            <tr>
                <td class="padding-left10 fs_16">
                	结算日期
                </td>
                <td colspan="2">
                    <input id='ldate'placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd '})" readonly="readonly" style="width: 124px" value=""/>&nbsp;至&nbsp;<input id='hdate' placeholder="点击选择时间" onclick="WdatePicker({readOnly:true,dateFmt:'yyyy-MM-dd '})" readonly="readonly" style="width: 124px"value=""/>
                </td>
                <td class="td-width fs_16">
                    科室
                </td>
                <td>
                  <input id="depart"  class="easyui-combobox"  style="width:100px;">
                </td>
                <td class="td-width fs_16">
                    医师
                </td>
                <td><input id='docname' type="text"></td>
                <td class="td-width fs_16">
                    患者姓名
                </td>
                <td><input id='patname' type="text"></td>
                <td class="td-width fs_16">
                    医保卡号
                </td>
                <td><input id='miid' type="text" placeholder="3***8343"></td>
                </tr>
                <tr>
                <td class="td-width fs_16">
                    &nbsp;&nbsp;参保类型
                </td>
                <td style="padding-left: 2px!important;">
                    <select id='mitype' style="width: 92px;">
                        <option value="390">城乡居民</option>
                        <option value="391">城镇职工</option>
                    </select>
                </td>
                <td class="td-width fs_16">
                    就医方式
                    <select id='mctype'>
                    	<option value="0">全部</option>
                        <option value='11'>普通门诊</option>
                        <option value="13">门诊大病</option>
                        <option value="15">异地门诊</option>
                        <option value="21">普通住院</option>
                        <option value="22">特殊病种住院</option>
                        <option value="25">异地住院</option>
                        <option value="51">生育门诊</option>
                        <option value="52">生育住院</option>
                        <option value="71">工伤门诊</option>
                        <option value="72">工伤住院</option>
                    </select>
                </td>
                <td class="td-width fs_16 right">
                    机审范围
                </td>
                <td colspan="1">
                    <div style="display:inline-block;"><input value="1" class='machinestatus' type="checkbox" style="width:16px;float:left; margin-top:6px;"/><span style="float:left; margin-top:9px;">违规</span></div>
                    <div style="display:inline-block;"><input value="2" class='machinestatus' type="checkbox" style="width:16px;float:left; margin-top:6px;"/><span style="float:left; margin-top:9px;">可疑</span></div>
                </td>
                <td class="td-width fs_16 ">
                    人审状态
                </td>
                <td colspan="3">
                    <div style="display:inline-block;float: left;margin-top:-2px;"><input value='3' class='personstatus' type="checkbox" style="width:16px;float:left; margin-top:6px;"/><span style="float:left; margin-top:9px;">违规</span></div>
                    <div style="display:inline-block;float: left;margin-top:-2px;"><input value='2' class='personstatus' type="checkbox" style="width:16px;float:left; margin-top:6px;"/><span style="float:left; margin-top:9px;">符合临床诊疗</span></div>
                    <div style="display:inline-block;float: left;margin-top:-2px;"><input value='1' class='personstatus' type="checkbox" style="width:16px;float:left; margin-top:6px;"/><span style="float:left; margin-top:9px;">待审核</span></div>
                </td>
                <td class="td-width fs_16 warning1 ">
                    违规规则
                </td>
                <td style="text-align: left;padding-left: 2px !important;">
                    <select id='illegalrule' style="width:90px;">
                    	<option value="0">全部</option>
                    	<option value="1">超量用药</option> 	 	 	 	 	
                        <option value='2'>费用超限规则</option>
                        <option value="3">临床诊疗规则</option>
                        <option value='4'>合理用药规则</option>
                        <option value="5">自费项目提醒</option>
                    </select>
                </td>
                <td style="text-align:left;">
                    <button onclick="dosearch()" class="btn-ok fs_16">查询</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    <!--指标展示-->
    
    <!--患者监控信息-->
    <div class="clear"></div>
    <div style='width:75%;float:left'>
    <div class="body-width margin-top20">
        <table class="body-width">
            <tr>
            	<td style="width: 34%"></td>
                <td class="fs_14 padding-top tab-color">医保限定规则</td>
                <td class="fs_14 padding-top tab-color">费用超限规则</td>
                <td class="fs_14 padding-top tab-select">临床诊疗规则</td>
                <td class="fs_14 padding-top tab-color">合理用药规则</td>
                <td class="fs_14 padding-top tab-color">出院带药规则</td>
                <td class="fs_14 padding-top tab-color">自费项目提醒</td>
                
                <td class="btn-td" style="padding-left:15px;">
                    <input type="button"  onclick="InvoiceExport()" class="update btn-update" value="导出"/>
                </td>
            </tr>
        </table>
    </div>
    <div class="ks-fy-line-div border-val" style="height: 248px;margin-bottom: 0px;border: 0px;overflow: hidden;">
        <table id='dgFirst'>
		
        </table>
    </div>
	</div>
    <div style='' class="Rule_t">
    	<div class="ks-fy-line-div border-val" style="height: 248px">
            <table class="body-width sf-msg-table">
                <tbody>
                <tr class="th-bg" >
                    <th style="text-align:center">规则审核</th>
                </tr>
                <tr>
                <td id='brokenrules' style="padding-top:10px;">
                	
                </td>
                </tr>
                </tbody>
            </table>
        </div> 
    </div>
    <div class="clear"></div>
    <!--选项卡数据展示-->
    <div class="body-width margin-top21">
        <div class="body-width">
            <div class="float tab-div body-width" style="width:30%;">
                <div class="tab-div-menu jb-ul-li">
                    <ul class="ul-style" id="ul-two">
                        <li style="width:33%;">
                            <label class="border-val height_40 x-on fs_16">就诊信息</label>
                         </li>
                        <li style="width:33%;">
                            <label class="border-val fs_16">医嘱明细</label>
                        </li>
                        <li style="width:34%;">
                            <label class="border-val">费用明细</label>
                        </li>
                    </ul>
                </div>
            </div>
            <div class=" float border-bom height_40" style="width: 70%"></div>
        </div>
        <div class="clear"></div>
        <div class="tab-div-box1 border-val margin-top10" style="margin-bottom: 20px">
            <!--就诊信息-->
            <div class="margin-top10" >
            	<div style="width:79%; float:left;overflow:scroll; ">
                	<div class="body-width margin-left10 see-dot-msg-header fs_16">
                    就诊信息
                </div>
                <table class="see-dot-msg-table jz-msg body-width margin-top10">
                    <tr>
                        <td>单据号:</td>
                        <td id='jzlsh'></td>
                        <td>医保卡号:</td>
                        <td id='ybkh'></td>
                        <td>患者姓名:</td>
                        <td id='xm'></td>
                        <td>人员类别:</td>
                        <td id='ylfkfs'></td>
                        <td>身份证:</td>
                        <td id='zjhm'></td>
                        <td>出生日期:</td>
                        <td id='csrq'></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td id='xb'></td>
                        <td>年龄:</td>
                        <td id='nl'></td>
                        <td>就医方式:</td>
                        <td id='cblx'></td>
                        <td>入院日期:</td>
                        <td id='ryrq'></td>
                        <td>出院日期:</td>
                        <td id='cyrq'></td>
                        <td>住院天数:</td>
                        <td id='zyts'></td>
                    </tr>
                    <tr>
                        <td>总金额(元):</td>
                         <!-- xyz -->
                        <td id='zfy'></td>
                        <td>医保内金额(元):</td>
                        <td id='ybnzje'></td>
                        <td>费用结算日期:</td>
                        <td id='jsrq'></td>
                        <td>系统审核日期:</td>
                        <td id='xtshsj'></td>
                        <td>人工审核日期:</td>
                        <td id='rgshsj'></td>
                        <td>审核状态:</td>
                        <td id='shzt'></td>
                    </tr>
                </table>
                <div class="body-width margin-left10 see-dot-msg-header">
                    诊断信息
                </div>
                <table class="zd-table body-width margin-top10 margin-left10">
                    <tr>
                        <td style="text-align:left">入院诊断:</td>
                        <td id='zdmc'></td>
                    </tr>
                    <tr id='fzds'>

                    </tr>
                </table>
                </div>
                <div class="border-lef" style="width:20%; float:right; background: #E6E6E6;margin-top: -10px">
            	<table class="see-dot-msg-table radio-table body-width margin-top10">
                    <tr>
                        <td style="text-align:left; padding-left:10px;">审核结果：</td>
                        <td><input type="radio" value="2" name="payMethod" style="float:left; margin:0 4px"/><span style="float:left; margin-top:4px; margin-right:8px;">正常</span>&nbsp;&nbsp;
                        <input type="radio" value="3" style="float:left; margin:0 4px" name="payMethod"/><span style="float:left; margin-top:4px;">违规</span></td>
                    </tr>
                    <tr>
                        <td style="text-align:left; padding-left:10px;">责任单位：</td>
                        <td><input value='1' type="radio" name="payKe" style="float:left; margin:0 4px"/><span style="float:left; margin-top:4px; margin-right:8px;">科室</span>&nbsp;&nbsp;<input type="radio" style="float:left; margin:0 4px" name="payKe"  value='2'/><span  style="float:left; margin-top:4px;">医师</span></td>
                    </tr>
                    <tr>
                    	<td style="text-align:left; padding-left:10px;">审核意见：</td>
                        <td></td>
                    </tr>
                    <tr>
                    	<td colspan="2" style="padding-left: 10px;padding-right: 10px">
                        	<textarea id='checkopinion' style="width: 99%; height:120px;"></textarea>
                        </td>
                    </tr>
                    <tr>
                    	<td colspan="2">
                        	<input onclick="changeCheck()" type="button" class="update btn-update" value="保存"/>&nbsp;<input type="button" class="update btn-update" value="完成"/>&nbsp;
                            <input onclick="cancelOK()" type="button" class="update btn-update" style="background-color:#999; width:auto; padding:0 15px; margin-rigth:20px !important;" value="取消完成"/>&nbsp;&nbsp;
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear"></div>
            </div>
            
            <!--医嘱明细-->
            <div style="display: none;height: 256px;overflow-x: auto">
		        <table id='dgSecond'>
					<!-- yyy -->
		        </table>
            </div>
            <!--费用明细-->
            <div style="display: none;height: 256px;overflow-x: auto">
                <table id='dgThird'>	
					<!-- yyy -->
		        </table>
            </div>
        </div>
    </div>

    <script>
    
    var lsh;
        $(function () {
            $(".tab-div-menu ul li").click(function () {
                //切换选中的按钮高亮状态
                var index=$(this).index();
                $("#ul-two li").eq(index).find('label').addClass("x-on height_40");
                $("#ul-two li").eq(index) .siblings().children().removeClass("x-on height_40");
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-div-box1 > div").eq(index).show().siblings().hide();
                
                if(index==1){
                	loadgrid2(lsh);
                }
                if(index==2){
                	loadgrid3(lsh);
                }
            });
			$("#a2").click(function(){
				$("#vi1").css('display','block'); 
			});
			//加载datagrid的事件
			loadgrid1();
			$('#depart').combobox({
				url:'${path}/department/getDepartmentOfUser',
			     valueField:'ksbm',
			     textField:'ksmc',
				onLoadSuccess: function () {
					chooseFirstOption(this);
				}
			});
        });
        $("a,button").focus(function(){this.blur()});
		

    function dosearch(){
    	var machinestatus ="";
    	var personstatus="";
    	$('input[class="machinestatus"]:checked').each(function(){ 
    		machinestatus+=$(this).val()+",";
    	}); 
    	$('input[class="personstatus"]:checked').each(function(){ 
    		personstatus+=$(this).val()+",";
    	}); 
		loadgrid1($('#ldate').val(),$('#hdate').val(),$('#depart').val(),$('#docname').val(),$('#patname').val(),$('#miid').val(),$('#mitype').val(),$('#mctype').val(),machinestatus,personstatus,$('#illegalrule').val())
    }
        
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
	function loadgrid1(ldate,hdate,depart,docname,patname,miid,mitype,mctype,machinestatus,personstatus,illegalrule){
    	$('#dgFirst').datagrid({
      		 url : '${path }/costStruct/SelectCostStruct',
      		 queryParams : {
      			ldate:ldate,
      			hdate:hdate,
      			department:depart,
      			docname:docname,
      			patname:patname,
      			miid:miid,
      			mitype:mitype,
      			mctype:mctype,
      			machinestatus:machinestatus,
      			personstatus:personstatus,
      			illegalrule:illegalrule,
	     	 	methodFlag:'getInvoiceByCondition'
      		 },
      		 rownumbers:true,
      		 singleSelect:true,
      		 rownumberHeader:'序号',
             fit : true,
             striped : true,
             pagination : true,
             nowrap : false,
             pageSize : 5,
             pageList : [ 5 ],
             columns : [ [
          	     {
                     width : '55',
                     title : '机审结果',
                     field : 'value0'
                 },{
                     width : '55',
                     title : '违规金额',
                     field : 'value1'
                 },{
                     width : '10%',
                     title : '医保卡号',
                     field : 'value2'
                 },
                 {
                     width : '10%',
                     title : '患者姓名',
                     field : 'value3'
                 },
                 {
                     width : '10%',
                     title : '性别',
                     field : 'value4'
                 },
                 {
                     width : '10%',
                     title : '年龄',
                     field : 'value5'
                 },
                 {
                     width : '10%',
                     title : '就医方式',
                     field : 'value6',
         			 formatter: function(value,row,index){
        				if (row.value6=='11'){
        					return '普通门诊';
        				}
        				if (row.value6=='13'){
        					return '门诊大病';
        				}
        				if (row.value6=='15'){
        					return '异地门诊';
        				}
        				if (row.value6=='21'){
        					return '普通住院';
        				}
        				if (row.value6=='22'){
        					return '特殊病种住院';
        				}
        				if (row.value6=='25'){
        					return '异地住院';
        				}
        				if (row.value6=='51'){
        					return '生育门诊';
        				}
        				if (row.value6=='52'){
        					return '生育住院';
        				}
        				if (row.value6=='71'){
        					return '工伤门诊';
        				}
        				if (row.value6=='72'){
        					return '工伤住院';
        				}
        			 }
                 },
                 {
                     width : '10%',
                     title : '就诊日期',
                     field : 'value7'
                 },
                 {
                     width : '10%',
                     title : '结算日期',
                     field : 'value8'
                 },
                 {
                     width : '150',
                     title : '科室',
                     field : 'value9'
                 },
                 {
                     width : '10%',
                     title : '入院诊断',
                     field : 'value10'
                 },
                 {
                     width : '10%',
                     title : '出院诊断',
                     field : 'value11'
                 },
                 {
                     width : '10%',
                     title : '主治医师',
                     field : 'value12'
                 },
                 {
                     width : '10%',
                     title : '审核状态',
                     field : 'value13',
         			 formatter: function(value,row,index){
         				if (row.value13=='1'){
         					return '未审核';
         				}
         				if (row.value13=='2'){
         					return '正常';
         				}
         				if (row.value13=='3'){
         					return '违规';
         				}
         			 }
                 },
                 {
                     width : '10%',
                     title : '流水号',
                     field : 'value14',
                     hidden:true
                 }
             ]],
             onBeforeLoad: function (param) {
                 updateDatagridHeader(this);
              	 updateDatagridPager(this);
              	 changeRowHeader(this);
            },
            onClickRow:function (index,row){
       		 $("#ul-two li").eq(0).find('label').addClass("x-on height_40");
             $("#ul-two li").eq(0) .siblings().children().removeClass("x-on height_40");

             //获取被按下按钮的索引值，需要注意index是从0开始的
             $(".tab-div-box1 > div").eq(0).show().siblings().hide();
         	    lsh=row.value14;
            	$.ajax({
            		url:'${path }/invoiceCheck/selectByLsh',
            		data:{lsh:row.value14},
            		success:function(data){
            			data=JSON.parse(data);
            			$('#jzlsh').html(data.JZLSH);
            			$('#ybkh').html(data.YBKH);
            			$('#xm').html(data.XM);
            			$('#ylfkfs').html(data.YLFKFS);
            			$('#zjhm').html(data.ZJHM);
            			$('#csrq').html(data.CSRQ);
            			$('#xb').html(data.XB);
            			$('#nl').html(data.NL);
            			$('#xb').html(data.XB);
            			$('#cblx').html(data.CBLX);
            			if(data.RYRQ!=null){
            				$('#ryrq').html(data.RYRQ.substring(0,10));
            			}
            			if(data.CYRQ!=null){
            				$('#cyrq').html(data.CYRQ.substring(0,10));
            			}
            			//yyy
            			if(data.SHZT!=null && data.SHZT!=1){
            				$('input[name="payMethod"][value='+data.SHZT+']').prop('checked', 'checked');
	            			if(data.KSBM!=undefined){
	            				$('input[name="payKe"][value="1"]').prop('checked', 'checked');
	            			}else{
	            				$('input[name="payKe"][value="2"]').prop('checked', 'checked');
	            			}
	            			$('#checkopinion').text(data.SHYJ);
	            			$('input[name="payKe"]').attr("disabled", true);
	            			$('input[name="payMethod"]').attr("disabled", true);
	            			$('#checkopinion').attr("disabled", true);
            			}else{
	            			$('#checkopinion').text("");
	            			$('input[name="payKe"]').attr("disabled", false);
	            			$('input[name="payMethod"]').attr("disabled", false);
            			}
            			
            			$('#zyts').html(data.ZYTS);
            			$('#zfy').html(data.ZFY);
            			$('#ybnzje').html(data.YBNZJE);
            			$('#jsrq').html(data.JSRQ.substring(0,10));
            			$('#xtshsj').html(data.XTSHSJ);
            			$('#rgshsj').html(data.RGSHSJ);
            			$('#shzt').html(data.SHZT);
            			$('#zdmc').html(data.ZDMC);
            			if(data.fzds!=null){
            				$('#fzds').empty();
                			for(var ci=1;ci<=data.fzds.length;ci++){
                				$('#fzds').append('<td style="text-align:left">第'+ci+'副诊断:'+data.fzds[ci-1]+'</td>');
                			}
            			}

            		}
            	});
               	$.ajax({
               		url:'${path }/invoiceCheck/selectBreakingRule',
               		data:{lsh:row.value14},
               		success:function(data){
               			data=JSON.parse(data);
               			for (var m = 0; m < data.length; m++) {
               				$('#brokenrules').empty();
							$('#brokenrules').append("<a href='javascript:void(0)' id='a2'>"+(m+1)+"、"+data[0].GZMC+":"+data[0].CS+"次</a><br/>");
						}
               		}
               	});
            }
      	});
    }
	function loadgrid2(l){
    	$('#dgSecond').datagrid({
     		 url : '${path }/costStruct/SelectCostStruct',
     		 queryParams : {
     			lsh:l,
	     	 	methodFlag:'selectDoctorAdviceByLsh'
     		 },
     		 singleSelect:true,
            fit : true,
            striped : true,
            pagination : true,
            nowrap : false,
            pageSize : 5,
            pageList : [ 5 ],
            columns : [ [
         	     {
                    width : '55',
                    title : '序号',
                    field : 'YZLSH'
                },{
                    width : '55',
                    title : '日期',
                    field : 'YZKLSJ'
                },{
                    width : '10%',
                    title : '时间',
                    field : 'YZZXSJ'
                },
                {
                    width : '10%',
                    title : '项目编码',
                    field : 'XMBM'
                },
                {
                    width : '10%',
                    title : '违反规则',
                    field : 'WFGZ'
                },
                {
                    width : '10%',
                    title : '提示说明',
                    field : 'TSXX'
                },
                {
                    width : '10%',
                    title : '违规金额(元)',
                    field : 'WGJE'
                },
                {
                    width : '10%',
                    title : '实际数量',
                    field : 'SL'
                },
                {
                    width : '10%',
                    title : '实际金额(元)',
                    field : 'JE'
                },
                {
                    width : '150',
                    title : '科室',
                    field : 'KSBM'
                },
                {
                    width : '10%',
                    title : '医师',
                    field : 'KLYSGH'
                },
                {
                    width : '10%',
                    title : '给药途径',
                    field : 'YYTJ'
                },
                {
                    width : '10%',
                    title : '用法',
                    field : 'YF'
                },
                {
                    width : '10%',
                    title : '用量',
                    field : 'YL'
                },
                {
                    width : '10%',
                    title : '规格',
                    field : 'YPGG'
                },
                {
                    width : '10%',
                    title : '单位',
                    field : 'FYSLDW'
                },
                {
                    width : '10%',
                    title : '单位(元)',
                    field : 'DJ'
                },
                {
                    width : '10%',
                    title : '数量',
                    field : 'SL'
                },
                {
                    width : '10%',
                    title : '金额(元)',
                    field : 'JE'
                },
                {
                    width : '10%',
                    title : '医保内金额',
                    field : 'YBNJE'
                }
            ]],
            onBeforeLoad: function (param) {
                 updateDatagridHeader(this);
             	 updateDatagridPager(this);
             	 changeRowHeader(this);
           }
           
     	});
    }
	function loadgrid3(l){
    	$('#dgThird').datagrid({
     		 url : '${path }/costStruct/SelectCostStruct',
     		 queryParams : {
     			lsh:l,
	     	 	methodFlag:'selectCostDetailByLsh'
     		 },
     		 singleSelect:true,
            fit : true,
            striped : true,
            pagination : true,
            nowrap : false,
            pageSize : 5,
            pageList : [ 5 ],
            columns : [ [
         	     {
                    width : '55',
                    title : '序号',
                    field : 'DJXBM'
                },{
                    width : '55',
                    title : '项目编码',
                    field : 'XMBM'
                },{
                    width : '10%',
                    title : '医院项目名称',
                    field : 'XMMC'
                },{
                    width : '10%',
                    title : '数量',
                    field : 'SL'
                },{
                    width : '10%',
                    title : '金额(元)',
                    field : 'JE'
                },{
                    width : '10%',
                    title : '医保内金额(元)',
                    field : 'YBNJE'
                }
            ]],
            onBeforeLoad: function (param) {
                updateDatagridHeader(this);
             	 updateDatagridPager(this);
            }
     	});
    }
	function changeCheck(){
		var shjg= $('input[name="payMethod"]:checked').val();
		var zrdw=$('input[name="payKe"]:checked').val();
		var shyj=$('#checkopinion').val();
		var ksbm=$('#depart').combobox('getValue');
		if(zrdw==undefined || shjg==undefined){
			alert('审核信息不全');
			return;
		}
 		$.ajax({
			url:'${path}/invoiceCheck/changeCheckStatu',
			data:{
				shzt:shjg,
				zrdw:zrdw,
				shyj:shyj,
				ksbm:ksbm,
				lsh:lsh
			},
			success:function(){
				alert('审核成功');
			}
		});
	}
	function cancelOK(){
		$('input[name="payKe"]').attr("disabled", false);
		$('input[name="payMethod"]').attr("disabled", false);
		$('#checkopinion').attr("disabled", false);
	}
    </script>
</body>
</html>