<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>his连接超时 违规信息展示页面</title>
</head>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/extJs.js"></script>
<script src="${path }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<body>
	<table id="auditViolations">
		
	</table>
	<input type="hidden" value="${zyh}" id="zyh"/>
</body>
<script>  
	
	$(function(){
		var zyh = $("#zyh").val();
		if(zyh==null||zyh==''){
			alert('请传入住院号');
		}else{
			auditViolations(zyh);
		}
	});

	//住院审核违规
	function auditViolations(zyh){
		$('#auditViolations').datagrid({
            url : '${path }/costStruct/SelectCostStruct',
            queryParams : {
            	lsh:zyh,
                methodFlag:'getWGXXByLSH',
                jyfs:'zyhz',	//就医方式:住院患者
                flag:"to_64"
            },
            rownumbers:true,
            singleSelect:true,
            rownumberHeader:'序号',
            fit : false,
            striped : true,
            pagination : true,
            nowrap : true,
            pageSize : 10,
            pageList : [ 10, 20, 50, 100 ],
            columns : [ [
                {
                    width : '10%',
                    title : '项目时间',
                    field : 'KFSJ'
                },{
                    width : '10%',
                    title : '项目编码',
                    field : 'XMBM'
                },{
                    width : '10%',
                    title : '项目名称',
                    field : 'XMMC',
                    formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
                },
                {
                    width : '10%',
                    title : '违反规则',
                    field : 'WFGZ',
                    formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
                },
                {
                    width : '10%',
                    title : '提示说明',
                    field : 'TSSM',
                    formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
                },
                {
                    width : '10%',
                    title : '违规金额(元)',
                    field : 'WGJE'
                },
                {
                    width : '10%',
                    title : '科室',
                    field : 'KS'
                },
                {
                    width : '10%',
                    title : '医师',
                    field : 'YS'
                },
                {
                    width : '10%',
                    title : '规格',
                    field : 'GG'
                },
                {
                    width : '10%',
                    title : '单位',
                    field : 'DW'
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
                    title : '单价(元)',
                    field : 'DJ'
                },
                {
                    width : '10%',
                    title : '数量',
                    field : 'SL'
                },{
                    width : '10%',
                    title : '金额(元)',
                    field : 'JE'
                },
                {
                    width : '10%',
                    title : '医保内金额(元)',
                    field : 'YBNJE'
                }
            ]],
            onBeforeLoad: function (param) {
            	changeRowHeader(this);
                changeRowHeader(this);
            },
            onLoadSuccess:function(data){
            	$("#zyh").val('');
            }
        });
	    
	}

</script> 
</html>