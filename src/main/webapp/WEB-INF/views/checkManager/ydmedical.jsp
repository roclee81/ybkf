<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><%@ include file="/commons/global.jsp" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>异地就医</title>
</head>
     <style>
        .sf-msg-table th{
            border-top: none !important;
        }
        .sf-msg-table td{
            text-align: left;
        }
        .ys-table .td-width{
            width: 58px;
        }
        .rules-table .td-width{
            width: 56px;
        }
        .j-fp-td-gauge{
            width: 40%;
        }
        .j-fp-td{
            width: 28%;
            padding-top: 6px;
        }
        .j-fp-div{
            border-bottom: none;
        }
        .border-val{
            border-radius: 4px;
        }
            .panel-body{
        	padding: 0px;
        }
        .ed-table{ margin-bottom: 0px}
        .table-center th:nth-child(2){text-align: right !important;}
        .table-center th:nth-child(3){text-align: right !important;}
        .table-center td:nth-child(2){text-align: right !important;}
        .table-center td:nth-child(3){text-align: right}
    </style>
<script type="text/javascript">
$(function() {
	setYearMonth();
	 $('#ksbm').combobox({   
			url:'${path}/department/getDepartmentOfUser',
		     valueField:'ksbm',   
		     textField:'ksmc',
		     onLoadSuccess: function () { 
		    	 var val = $(this).combobox('getData');  
		         for (var item in val[0]) 
		         {  
		             if (item == 'ksbm') 
		             {  
		                 $(this).combobox('select', val[0][item]); 	
		                 department = val[0][item];
		             }  
		         }	 
		        
		     }
		 });
	 
	 ydMedicalDataGrid = $('#ydMedicalDataGrid').datagrid({
        url : '${path }/ydmedical/ydMedicalDataGrid',
        fit : true,
        striped : true,
       // rownumbers : true,
        pagination : true,
       //singleSelect : true,
      //  idField : 'id',
        sortName : 'createTime',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [/*  {
        	field:'ck',
        	checkbox : true,
        	 width : ''
         }, */{
            width : '4%',
            title : '序号',
            field : 'ROW_ID'
         
        }, {
            width : '10%',
            title : '患者ID',
            field : 'hzid'
        
        },{
            width : '10%',
            title : '患者姓名',
            field : 'xm'
      
        },  {
            width : '10%',
            title : '患者就医方式',
            field : 'jylx',
       
        }, {
            width : '10%',
            title : '医疗总费用 ',
            field : 'ylzfy',
        
        },{
            width : '10%',
            title : '医保统筹支付费用',
            field : 'ybtczffy',
           
        }, 
        {
            width : '10%',
            title : '报销比例',
            field : 'bxbl',
         
        },{
            width : '10%',
            title : '医保拒付金额(元)',
            field : 'ybjfje',
       
        },{
            width : '10%',
            title : '药品总费用(元)',
            field : 'ypzfy',
       
        },{
            width : '10%',
            title : '检查检验总费用(元)',
            field : 'jcjyzfy',
       
        },{
            width : '10%',
            title : '诊疗总费用(元)',
            field : 'zlzfy',
       
        },{
            width : '10%',
            title : '材料总费用(元)',
            field : 'clzfy',
       
        }  ] ],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);        	
        	
        },
       
    });
    
	
	
});

function setYearMonth()
{
	var date=new Date;
	year=date.getFullYear();
	for(var i=0;i<4;i++) 
	{
		var temp = year-i;
		$('#syear').append("<option value='"+temp+"'>"+temp+"</option>");
	}
	
	month=date.getMonth()+1
	month=month<10?"0"+month:String(month);
	$("#smonth").val(month);
	
	
	
}

function serchFun() {
	ydMedicalDataGrid.datagrid('load',$.serializeObject($('#searchForm')));     
}
</script>
<body>

     <div class="body-width fs_18 bold header-color">异地就医统计</div>
<div class="header-div bg-color1 border-val">
 <form id="searchForm" action="">
    <table class="ys-table" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
                年度
            </td>
            <td>
                <select id="syear" name="syear">
                  
                </select>
            </td>
            <td class="td-width fs_16">
                月份
            </td>
            <td style="width: 44px">
                <select style="width: 44px" id="smonth"  name="smonth" >
                  <option value="01">1</option>
                        <option value="02">2</option>
                        <option value="03">3</option>
                        <option value="04">4</option>
                        <option value="05">5</option>
                        <option value="06">6</option>
                        <option value="07">7</option>
                        <option value="08">8</option>
                        <option value="09">9</option>
                        <option value="10">10</option>
                        <option value="11">11</option>
                        <option value="12">12</option>
                </select>
            </td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
                <select id="ksbm" name="ksbm" style="width: 104px;height: 24px" >
                
                </select>
            </td>
            <td class="td-width fs_16">
                就医类型
            </td>
            <td>
                <select id="jylxbm"  name="jylxbm">
                    <option value="0">全部</option>
                    <option value="1">省内</option>
                    <option value="2">省外</option>
                </select>
            </td>
            <td class="td-width"></td>
            <td>
                <input  type="text" value="查询"  style="text-align: center;" onclick="serchFun()"  class="btn-ok fs_16">
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
    </form>
</div>

<div class="body-width   margin-top15" style="height: 500px;overflow-x:auto;">
    <table class="sf-msg-table border-val" id="ydMedicalDataGrid" style="width: 100%">
      
    </table>
</div>
      

    <script>
    $("a,button").focus(function(){this.blur()});
    </script>

</body>
</html>