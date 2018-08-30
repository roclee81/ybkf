<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${path }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<%@ include file="/commons/global.jsp" %>

<style>
	.C_text{padding:10px 0; text-align:center;}
	.C_text span{font-size:16px; font-weight:bold;}
	.F_wen{color:#2B425B; font-size:16px;}
	.container{margin-top:30px;}
	.btn{padding:6px 12px;}
	.btn-success2{color: #fff;background-color: #5cb85c; border-color: #4cae4c;}
	.btn-success2:hover{color: #fff;}
	.container1{width:98%; margin:20px auto;}
	.ys-rc-div p{border-top:1px solid #dde5f0; padding:10px 5px 0;}
	.ys-rc-div p .btn{float:right;}
</style>
<title>实时提醒</title>
</head>
<body>
<div class="bg-color">
    <div>
        <div class="ys-rc-div margin-bottom20">
            <div class="gauge-title-div borders">
                <table class="body-width">
                    <tr>
                        <td class="table-title">
                            <label class="radius"></label>审核提醒
                        </td>
                        <td class="right fs_16">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="C_text">该患者本月已就诊<span>3</span>次，月累计：<span style="color:#C30">390</span>元（限额290元），年度累积：<span>2750</span>元（定额3500元）</div>
                <div class="body-width padding10">
                    <div class="ys-rc-div">
                    <p>审核违规 <button class="btn btn-success"><img src="${path }/static/img/menu/btn1-icon.png">导出</button></p>
                    <table class="body-width common-table" style="height:auto">
                        <tbody>
                        <tr>
                            <th>序号</th>
                            <th>规则名称</th>
                            <th>项目编码</th>
                            <th>项目名称</th>
                            <th>违规原因</th>
                        </tr>
                         <tr>
                            <td>1</td>
                            <td>超量取药</td>
                            <td>14454</td>
                            <td>糖脉康颗粒</td>
                            <td>该药在同一天内的开药量不得超过15天</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>超量取药</td>
                            <td>316</td>
                            <td>阿托伐他汀钙片</td>
                            <td>该药在同一天内的开药量不得超过15天</td>
                        </tr>
                        </tbody>
                    </table>
                	</div>
                </div>
        </div>
    </div>
</div>
<div class="bg-color">
    <div>
        <div class="ys-rc-div margin-bottom20">
            <div class="gauge-title-div borders">
                <table class="body-width">
                    <tr>
                        <td class="table-title">
                            <label class="radius"></label>选择开立原因
                        </td>
                        <td class="right fs_16">
                            
                        </td>
                    </tr>
                </table>
            </div>
                <div class="body-width padding10">
                    <div class="ys-rc-div">
                    <table class="body-width common-table" style="height:auto">
                        <tbody>
                        <tr>
                            <th>选择</th>
                            <th>原因内容</th>
                        </tr>
                         <tr>
                        <td><input type="checkbox"/></td>
                        <td class="left">01、临床需求：<input type="text"></td>
                        
                    </tr>
                    <tr>
                        <td><input type="checkbox"/></td>
                        <td class="left">02、急重症</td>
                    </tr>
                    <tr>
                    	<td colspan="2" style="padding:10px 0;">
                            <button type="button"  class="btn btn-warning" style="margin-right: 20px">&nbsp;开立医嘱&nbsp;</button>
                            <button type="button" class="btn btn-success2" >&nbsp;返回修改&nbsp;</button>
                         </td>
                    </tr>
                    </tbody>
                    </table>
                	</div>
                </div>
        </div>
    </div>
</div>
</body>
</html>