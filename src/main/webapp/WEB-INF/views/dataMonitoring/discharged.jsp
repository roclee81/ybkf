<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<%-- <%@ include file="/commons/basejs.jsp" %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>出院评价</title>
    <!-- <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
 	<script src="${path }/static/js/jquery.easyui.min.js"></script>
  	<script src="${path }/static/js/datagrid-filter.js"></script> -->
    <!-- <script src="${path }/static/extJs.js"></script> -->
  <!--   <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" /> -->
    <!-- <link href="${path }/static/css/common.css" rel="stylesheet"> -->
    <%-- <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> --%>
    <style>
        .sf-msg-table td {
            text-align: left;
        }

        .ys-table .td-width {
            width: 58px;
        }

        .rules-table .td-width {
            width: 56px;
        }

        .border-btm2 tbody tr > th {
            font-size: 14px;
            font-weight: bold;
            color: #657d98
        }

        .border-btm2 tbody tr > td {
            height: 46px;
            border-bottom: 1px solid #dde5ef;
        }

        .sf-msg-table tr:nth-child(odd) {

            background-color: #f9f9f9;
        }
        .gauge-div{border: none!important;margin: 0!important;}
        #zy_Gauge1{height: 200px!important;}
        #zy_Gauge2{height: 200px!important;}
        #pie{height: 220px !important;}
        #line{height: 320px !important;}
        .table-title{height: 30px!important;}
        .ks-fy-zb{padding-bottom: 0 !important;}
        .mouth-rj,.mouth-fy{width: 90px !important;}
        .combo-select{display:inline-block;}
    </style>
</head>
<body>
<div class="header-div bg-color">
  <form id="dataSearchForm" method="post" class="padding-left20">
 
                <select id="selectYear" name="syear">
                </select>

            <span class="fs_16 pdr3p" >
                年
            </span>
 
                 <select id="selectMonth" name="smonth">
                    <option value="01">01</option>
                    <option value="02">02</option>
                    <option value="03">03</option>
                    <option value="04">04</option>
                    <option value="05">05</option>
                    <option value="06">06</option>
                    <option value="07">07</option>
                    <option value="08">08</option>
                    <option value="09">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select> 
                <input type="hidden" id="hid" name="lmonth"/>
            <span class="fs_16 pdr3p" >月</span>
            <span class="fs_16">
                科室
            </span>
  
               <select id="depart" name="ksbm"></select>

            <span class="fs_16 pdl3p" >
                参保类型
            </span>
 
                  <select id="cblxbm" name="cblxbm" onchange='cblxChange(this[selectedIndex].value)'>
	                    <option value="000">全部</option>
	                    <option value="390">城乡居民</option>
	                    <option value="391">城镇职工</option>
	                    <option value="392">省直医保</option>
	             </select> 
             <span class="fs_16 pdl3p qy" >
                区域
            </span>
            <span class="qy">
                <select id="qy" name="qybm" class="qy">
                   
                </select>
			</span>	             
     
            <!-- <td class="td-width"></td> -->
            <div style="display:inline-block;margin-left:2%">
               
                <button class="btn btn-info btn-sm " type="button" onclick="serchdata()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
            </div>
            <input type="hidden" name="exportData" id="exportData"/>
            <input type="hidden" name="exportData_details" id="exportData_details"/>
  </form>  
</div>

<div class="bg-color main-div margin-top10">
    <div class="tab-tables border-bom" style="padding-bottom: 10px">
        <ul class="padding-left10" id="pageItems">
            <li class="fs_16 on">科室指标</li>
            <li class="fs_16">费用统计</li>
            <li class="fs_16">违规汇总</li>
            <li class="fs_16">医师绩效</li>
            <!-- <li class="fs_16">单项目控费</li> -->
            <li class="fs_16">重点监控</li>
        </ul>
        <div class="clear"></div>
    </div>

    <div class="tab-div-box">
        <!--科室指标-->
        <div class="margin-top10">
            <div class="yb-jj-div">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">预算监控</td>
                        </tr>
                    </table>
                </div>
                <div class="gauge-div float">
                    <div id="num1">
                        <div id="zy_Gauge1">

                        </div>
                    </div>

                    <div class="gauge-bom">
                        <table class="ks-gauge-div">
                            <tr>
                            	<td class="center-td fs_16">预算额度:<span id="budgetM">-</span> 万元</td>
                                <td class="center-td fs_16"></td>
                                <td class="center-td fs_16">可用额度:<span id="availableCreditM">-</span> 万元 &nbsp;</td>

                            </tr>
                        </table>
                    </div>
                </div>
                <div class="gauge-div float" style="margin-left: 2%">
                    <div id="num2">
                        <div id="zy_Gauge2">

                        </div>
                    </div>
                    <div class="gauge-bom">
                        <table class="ks-gauge-div">
                            <tr>
                            	<td class="center-td fs_16" >预算额度：<span id="budgetY">-</span> 万元</td>
                                <td class="center-td fs_16" >可用额度：<span id="availableCreditY">-</span> 万元</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">评价指标</td>
                        </tr>
                    </table>
                </div>
                <div class="yb-jj-div body-width">
                    <div class="pj-zb">
                        <table class="common-table" id="kszbTable">
                            <tr>
                                <th>指标类型</th>
                                <th>指标名称</th>
                                <th>实际值</th>
                                <th>与上月比</th>
                                <th>限定值</th>
                                <th>与限定值比</th>
                            </tr>
                            <tr>
                                <td rowspan="2">负荷效率指标</td>
                                <td id="CYRC">出院人次</td>
                                <td>-</td>
                                <td class="abnormal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="PJZYR">平均住院日</td>
                                <td>-</td>
                                <td class="abnormal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td rowspan="4">费用指标</td>
                                <td id="YLF">医疗总费用(元)</td>
                                <td>-</td>
                                <td class="abnormal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="YBTCZF">医保负担(元)</td>
                                <td>-</td>
                                <td class="normal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="HZFD">患者负担(元)</td>
                                <td>-</td>
                                <td class="abnormal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="YLZF">乙类自付金额(元)</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>

                            <tr class="bg-color">
                                <td rowspan="8">费用结构</td>
                                <td id="YPFZB">药品费(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="ZFJEZB">自费金额(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="JCJYFZB">检查检验费(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="ZLFZB">诊疗费(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="SSFZB">手术费(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="CLFZB">材料费(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="YLZFZB">乙类自付(元)/占比</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                        </table>
                    </div>
                    <div class="pj-zb">
                        <table class="common-table">
                            <tr>
                                <th>指标类型</th>
                                <th>指标名称</th>
                                <th>实际值</th>
                                <th>与上月比</th>
                                <th>限定值</th>
                                <th>与限定值比</th>
                            </tr>
                            <tr>
                                <td rowspan="5">人均费用指标</td>
                                <td id="RJYLF">人均医疗费(元)</td>
                                <td>-</td>
                                <td class="abnormal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="RJTCZF">人均医保统筹支付(元)</td>
                                <td>-</td>
                                <td class="abnormal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="RJYPF">人均药品费(元)</td>
                                <td>-</td>
                                <td class="normal-span">-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="RJCLF">人均材料费(元)</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="RJFD">人均负担(元)</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td rowspan="2">违规指标</td>
                                <td id="WGDJS">违规单据数</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td id="ZYCS">住院时间超过30天患者数</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clear"></div>
        </div>
        <!--费用统计-->
        <div class="main-ks-zb" style="display: none">
            <div class="ks-fy-zb body-width">
                <div class="fy-type-div ks-fy-zb">
                    <table class="common-table">
                        <tbody>
                        <tr class="th-bg">
                            <th>费用类别</th>
                            <th>实际值</th>
                            <th>限定值</th>
                            <th>是否超额</th>
                            <th>与上月比</th>
                            <th>费用占比</th>
                        </tr>
                        <tr>
                            <td id="YPF_C">药品费</td>
                            <td>-</td>
                            <td class="right">-</td>
<!--                             <td><label class="abnormal"></label></td> -->
							<td><label>-</label></td>
                            <td class="right"><font class="abnormal-span padding-left4">-</font></td>
                            <td class="right" id="YPFZB_C">-</td>

                        </tr>
                        <tr>
                            <td id="JCJYF_C">检查检验费</td>
                            <td>-</td>
                            <td class="right">-</td>
<!--                             <td><label class="abnormal"></label></td> -->
							<td><label>-</label></td>
                            <td class="right"><font class=" padding-left4">-</font></td>
                            <td class="right" id="JCJYFZB_C">-</td>
                        </tr>
                        <tr>
                            <td id="ZLF_C">诊疗费</td>
                            <td>-</td>
                            <td class="right">-</td>
<!--                             <td><label class="normal"></label></td> -->
							<td><label>-</label></td>
                            <td class="right"><font class=" padding-left4">-</font></td>
                            <td class="right" id="ZLFZB_C">-</td>

                        </tr>
                        <tr>
                            <td id="SSF_C">手术费</td>
                            <td>-</td>
                            <td class="right">-</td>
<!--                             <td><label class="normal"></label></td> -->
							<td><label>-</label></td>
                            <td class="right"><font class=" padding-left4">-</font></td>
                            <td class="right" id="SSFZB_C">-</td>
                        </tr>
                        <tr>
                            <td id="HCF_C">耗材费</td>
                            <td>-</td>
                            <td class="right">-</td>
<!--                             <td><label class="normal"></label></td> -->
							<td><label>-</label></td>
                            <td class="right"><font class=" padding-left4">-</font></td>
                            <td class="right" id="HCFZB_C">-</td>

                        </tr>
                        <tr>
                            <td id="QTFY_C">其他费用</td>
                            <td>-</td>
                            <td class="right">-</td>
<!--                             <td><label class="normal"></label></td> -->
							<td><label>-</label></td>
                            <td class="right"><font class="normal-span padding-left4">-</font></td>
                            <td class="right" id="QTFYZB_C">-</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="ty-type-pie">
                    <div id="pieChart">

                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="gauge-title-div margin-top21">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title">月度变化趋势</td>
                    </tr>
                </table>
            </div>
            <div class="body-width fy-line-div" id="num3">
                <div class="fy-bar-div" id="line">

                </div>
            </div>
        </div>
        <!--违规分析-->
        <div class="main-rj-zb" style="display: none">
            <!--选项卡-->
            <div class="gauge-title-div ">
                <table class="body-width">
                    <tr>
                        <td>
                            <div class="tab-menu" style="margin-left:0">
                                <ul class="card1">
                                    <li class="on padding-left0 margin-left0">违规规则排序</li>
                                    <li id="doctor_depart">医师违规情况</li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-table-boxs">
                <!--违规规则排序-->
                <div class="ks-fy-zb">
                    <div class="body-width fy-line-div" id="num7">
                        <div class="fy-bar-div" id="bar3">

                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="ks-fy-zb">
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="body-width common-table" id="zywggzOrderTable">
                                    
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!--违规单据-->
                    <div class="ks-fy-zb nm-div" style="display: none">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title">违规单据汇总</td>
                                    <td class="right">
                                    	<button class="btn btn-sm btn-info" type="button" onclick="excelExport_wghz()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                	</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="body-width common-table" id="zywgDocument">
                                    
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!--违规信息-->
                    <div class="ks-fy-zb nm-div-name-div" style="margin-bottom: 10px;display: none">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title">违规详情</td>
                                    <td class="right">
                                    	<button class="btn btn-sm btn-info" type="button" onclick="excelExport_wghzDetails()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                	</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="body-width common-table" id="zywgDetails">
                                    
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--医师违规情况-->
                <div style="display: none">
                    <!--科室规则排序-->
                    <div class="ks-fy-zb">
                        <div class="body-width fy-line-div" id="num8">
                            <div class="fy-bar-div" id="bar4">

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="ks-fy-zb">
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="body-width common-table" id="zywgdepartOrderTable">
                                    
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!--违规单据-->
                    <div class="ks-fy-zb ks-nm-div" style="display: none">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title">违规单据汇总</td>
                                    <td class="right">
                                    	<button class="btn btn-sm btn-info" type="button" onclick="excelExport_wghz()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                	</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="body-width common-table" id="zyDepartDocument">
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!--违规信息-->
                    <div class="ks-fy-zb ks-nm-div-name-div" style="margin-bottom: 10px;display: none">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title">违规详情</td>
                                    <td class="right">
                                    	<button class="btn btn-sm btn-info" type="button" onclick="excelExport_wghzDetails()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                	</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="body-width common-table zyDepartDetails" id="zyDepartDetails">
                                    
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--医师绩效-->
        <div class="main-ys-fy" style="display: none">
            <div class="ks-fy-zb">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title ">医师绩效指标</td>
                            <td class="padding-left20">
                                <input class="radios lj-rad " type="radio" value="lj" name="type" checked/><span class="radio-span">累计指标</span>
                                <input class="radios rj-rad " type="radio" value="rj" name="type"/><span class="radio-span">人均指标</span>
                                <input class="radios zb-rad " type="radio" value="zb" name="type"/><span class="radio-span">占比指标</span>
                            </td>
                            <td class="right" style="width: 76%">
                                <button class="btn btn-sm btn-info"  onclick="excelExport()" type="button"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="yb-jj-div">
                    <div class="ys-rc-div ">
                    	<div class="jx_lj">
                    		<table class="body-width common-table lj" id="doctorPerformance">
	                            
	                        </table>
                    	</div>
                    	<div class="jx_rj">
                    		<table class="body-width common-table rj">
	                            
	                        </table>
                    	</div>
                    	<div class="jx_zb">
                    		<table class="body-width common-table zb">
	                        
	                        </table>
                    	</div>
                    </div>
                </div>
                <!--违规单据-->
                <div class="yb-jj-div wg-bill2s-div" style="display: none">
                    <div class=" margin-top21">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title">违规单据汇总</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width pad-top0">

                        <div class="ys-rc-div">
                            <table class="common-table" id="docwgDocument">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--违规信息-->
                <div class="yb-jj-div wg-bill2s-div-name-div" style="margin-bottom: 10px;display: none">
                    <div class=" margin-top21">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title">违规详情</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width pad-top0">
                        <div class="ys-rc-div">
                            <table class="common-table" id="zykswgdetails">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
        <!--重点监控-->
        <div style="display: none">
            <!--选项卡-->
            <div class="gauge-title-div ">
                <table class="body-width">
                    <tr>
                        <td>
                            <div class="tab-menu ">
                                <ul class="card3">
                                    <li class="on padding-left0 margin-left0">住院费用超额</li>
                                    <li>住院时间超长</li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-table-box3s">
                <!--住院费用超额-->
                <div class="ks-fy-zb">
                    <div class="ks-fy-zb" style="height: 380px">
                        <div class="gauge-title-div ">
                            <table class="body-width">
                                <tr>
                                    <td class="right">
                                        <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <div id="bar">

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>

                    <div class="main-ys-fy">
                        <div>
                            <div class="ks-fy-zb" style="height:370px">
                                <div class="gauge-title-div ">
                                    <table class="body-width">
                                        <tr>
                                            <td class="left ">
                                                科室名称：<input type="text"/>
                                                患者姓名：<input type="text"/>
                                                <button class="btn btn-info btn-sm margin-left50"><img src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="clear"></div>
                                </div>
                                <div class="body-width padding10">
                                    <div class="ys-rc-div">
                                        <table class="zy-table body-width common-table" style="width: 100%" id="gkxmSet">
                                            <tbody>
                                            <tr class="th-bg">
                                                <th>科室名称</th>
                                                <th>患者姓名</th>
                                                <th>医保卡号</th>
                                                <th>入院时间</th>
                                                <th>出院时间</th>
                                                <th>出院诊断</th>
                                                <th>住院天数(天)</th>
                                                <th>住院医疗费用(元)</th>
                                                <th>医保统筹支付(元)</th>
                                                <th>药品费(元)</th>
                                                <th>检查检验费(元)</th>
                                                <th>材料费(元)</th>
                                                <th>诊疗费(元)</th>
                                                <th>护理费(元)</th>
                                                <th>其他费用(元)</th>
                                            </tr>
                                            <tr>
                                                <td>血液内科</td>
                                                <td>张素</td>
                                                <td>2341569</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>糖尿病</td>
                                                <td class="right">10</td>
                                                <td class="right">13423</td>
                                                <td class="right">10517.5</td>
                                                <td class="right">2905.5</td>
                                                <td class="right">135.5</td>
                                                <td class="right">5319.7</td>
                                                <td class="right">329.9</td>
                                                <td class="right">129.3</td>
                                                <td class="right">467.2</td>
                                            </tr>
                                            <tr>
                                                <td>骨科</td>
                                                <td>刘南</td>
                                                <td>3625425</td>
                                                <td>2016/5/1</td>
                                                <td>2016/5/7</td>
                                                <td>腓骨骨折</td>
                                                <td class="right">6</td>
                                                <td class="right">6353.8</td>
                                                <td class="right">4137.3</td>
                                                <td class="right">2216.5</td>
                                                <td class="right">1037.1</td>
                                                <td class="right">3004.7</td>
                                                <td class="right">121.3</td>
                                                <td class="right">43.4</td>
                                                <td class="right">78.8</td>
                                            </tr>
                                            <tr>
                                                <td>消化内科</td>
                                                <td>王允</td>
                                                <td>4909281</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>阑尾炎</td>
                                                <td class="right">12</td>
                                                <td class="right">2491.6</td>
                                                <td class="right">1376.4</td>
                                                <td class="right">1115.2</td>
                                                <td class="right">572.9</td>
                                                <td class="right">241.3</td>
                                                <td class="right">957.8</td>
                                                <td class="right">248.4</td>
                                                <td class="right">454</td>
                                            </tr>

                                            <tr>
                                                <td>妇科</td>
                                                <td>秦婷婷</td>
                                                <td>7476993</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>子宫肌瘤</td>
                                                <td class="right">13</td>
                                                <td class="right">4152.1</td>
                                                <td class="right">3336</td>
                                                <td class="right">816.1</td>
                                                <td class="right">496.3</td>
                                                <td class="right">688</td>
                                                <td class="right">492.7</td>
                                                <td class="right">194.7</td>
                                                <td class="right">61.3</td>
                                            </tr>
                                            <tr>
                                                <td>骨科</td>
                                                <td>杜和发</td>
                                                <td>8760849</td>
                                                <td>2016/5/1</td>
                                                <td>2016/5/7</td>
                                                <td>锁骨骨折</td>
                                                <td class="right">11</td>
                                                <td class="right">3200.6</td>
                                                <td class="right">2932.6</td>
                                                <td class="right">268</td>
                                                <td class="right">250.9</td>
                                                <td class="right">1973.3</td>
                                                <td class="right">892.3</td>
                                                <td class="right">232.1</td>
                                                <td class="right">94.5</td>
                                            </tr>
                                            <tr>
                                                <td>消化内科</td>
                                                <td>杨生刚</td>
                                                <td>1004470</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>慢性胆囊炎</td>
                                                <td class="right">11</td>
                                                <td class="right">1147</td>
                                                <td class="right">666.4</td>
                                                <td class="right">480.6</td>
                                                <td class="right">160.3</td>
                                                <td class="right">653.1</td>
                                                <td class="right">269.9</td>
                                                <td class="right">54</td>
                                                <td class="right">261.2</td>
                                            </tr>
                                            <tr>
                                                <td>妇科</td>
                                                <td>李芳</td>
                                                <td>1132856</td>
                                                <td>2016/5/1</td>
                                                <td>2016/5/7</td>
                                                <td>子宫肌瘤</td>
                                                <td class="right">16</td>
                                                <td class="right">2090.3</td>
                                                <td class="right">1700</td>
                                                <td class="right">390.3</td>
                                                <td class="right">113.7</td>
                                                <td class="right">408.7</td>
                                                <td class="right">618.9</td>
                                                <td class="right">218</td>
                                                <td class="right">66.4</td>
                                            </tr>
                                            <tr>
                                                <td>骨科</td>
                                                <td>李强</td>
                                                <td>1261241</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>锁骨骨折</td>
                                                <td class="right">12</td>
                                                <td class="right">3192.9</td>
                                                <td class="right">604.3</td>
                                                <td class="right">2588.6</td>
                                                <td class="right">1979.8</td>
                                                <td class="right">326.5</td>
                                                <td class="right">150.5</td>
                                                <td class="right">40.3</td>
                                                <td class="right">246.9</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--住院时间超长-->
                <div class="ks-fy-zb" style="display: none">
                    <div class="ks-fy-zb" style="height: 380px">
                        <div class="gauge-title-div ">
                            <table class="body-width">
                                <tr>
                                    <td class="right fs_16">
                                        <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div >
                            <div id="bar1" style="height: 320px">

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>

                    <div class="main-ys-fy">
                        <div>
                            <div class="ks-fy-zb" style="height:370px">
                                <div class="gauge-title-div">
                                    <table id="btn-table" class="body-width">
                                        <tr>
                                            <td class="left">
                                                科室名称：<input type="text"/>
                                                患者姓名：<input type="text"/>
                                                <button class="btn btn-primary btn-sm1 margin-left50"><img src="${staticPath }/static/img/menu/search.png"><span>查询</span></button>
                                            </td>
                                        </tr>
                                    </table>
                                    <div class="clear"></div>
                                </div>
                                <div class="body-width padding10">
                                    <div class="ys-rc-div">
                                        <table class="zy-table body-width common-table" style="width: 100%">
                                            <tbody>
                                            <tr class="th-bg">
                                                <th>科室名称</th>
                                                <th>患者姓名</th>
                                                <th>医保卡号</th>
                                                <th>入院时间</th>
                                                <th>出院时间</th>
                                                <th>出院诊断</th>
                                                <th>住院天数(天)</th>
                                                <th>住院医疗费用(元)</th>
                                                <th>医保统筹支付(元)</th>
                                                <th>药品费(元)</th>
                                                <th>检查检验费(元)</th>
                                                <th>材料费(元)</th>
                                                <th>诊疗费(元)</th>
                                                <th>护理费(元)</th>
                                                <th>其他费用(元)</th>
                                            </tr>
                                            <tr>
                                                <td>血液内科</td>
                                                <td>张素</td>
                                                <td>2341569</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>糖尿病</td>
                                                <td class="right">10</td>
                                                <td class="right">13423</td>
                                                <td class="right">10517.5</td>
                                                <td class="right">2905.5</td>
                                                <td class="right">135.5</td>
                                                <td class="right">5319.7</td>
                                                <td class="right">329.9</td>
                                                <td class="right">129.3</td>
                                                <td class="right">467.2</td>
                                            </tr>
                                            <tr>
                                                <td>骨科</td>
                                                <td>刘南</td>
                                                <td>3625425</td>
                                                <td>2016/5/1</td>
                                                <td>2016/5/7</td>
                                                <td>腓骨骨折</td>
                                                <td class="right">6</td>
                                                <td class="right">6353.8</td>
                                                <td class="right">4137.3</td>
                                                <td class="right">2216.5</td>
                                                <td class="right">1037.1</td>
                                                <td class="right">3004.7</td>
                                                <td class="right">121.3</td>
                                                <td class="right">43.4</td>
                                                <td class="right">78.8</td>
                                            </tr>
                                            <tr>
                                                <td>消化内科</td>
                                                <td>王允</td>
                                                <td>4909281</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>阑尾炎</td>
                                                <td class="right">12</td>
                                                <td class="right">2491.6</td>
                                                <td class="right">1376.4</td>
                                                <td class="right">1115.2</td>
                                                <td class="right">572.9</td>
                                                <td class="right">241.3</td>
                                                <td class="right">957.8</td>
                                                <td class="right">248.4</td>
                                                <td class="right">454</td>
                                            </tr>

                                            <tr>
                                                <td>妇科</td>
                                                <td>秦婷婷</td>
                                                <td>7476993</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>子宫肌瘤</td>
                                                <td class="right">13</td>
                                                <td class="right">4152.1</td>
                                                <td class="right">3336</td>
                                                <td class="right">816.1</td>
                                                <td class="right">496.3</td>
                                                <td class="right">688</td>
                                                <td class="right">492.7</td>
                                                <td class="right">194.7</td>
                                                <td class="right">61.3</td>
                                            </tr>
                                            <tr>
                                                <td>骨科</td>
                                                <td>杜和发</td>
                                                <td>8760849</td>
                                                <td>2016/5/1</td>
                                                <td>2016/5/7</td>
                                                <td>锁骨骨折</td>
                                                <td class="right">11</td>
                                                <td class="right">3200.6</td>
                                                <td class="right">2932.6</td>
                                                <td class="right">268</td>
                                                <td class="right">250.9</td>
                                                <td class="right">1973.3</td>
                                                <td class="right">892.3</td>
                                                <td class="right">232.1</td>
                                                <td class="right">94.5</td>
                                            </tr>
                                            <tr>
                                                <td>消化内科</td>
                                                <td>杨生刚</td>
                                                <td>1004470</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>慢性胆囊炎</td>
                                                <td class="right">11</td>
                                                <td class="right">1147</td>
                                                <td class="right">666.4</td>
                                                <td class="right">480.6</td>
                                                <td class="right">160.3</td>
                                                <td class="right">653.1</td>
                                                <td class="right">269.9</td>
                                                <td class="right">54</td>
                                                <td class="right">261.2</td>
                                            </tr>
                                            <tr>
                                                <td>妇科</td>
                                                <td>李芳</td>
                                                <td>1132856</td>
                                                <td>2016/5/1</td>
                                                <td>2016/5/7</td>
                                                <td>子宫肌瘤</td>
                                                <td class="right">16</td>
                                                <td class="right">2090.3</td>
                                                <td class="right">1700</td>
                                                <td class="right">390.3</td>
                                                <td class="right">113.7</td>
                                                <td class="right">408.7</td>
                                                <td class="right">618.9</td>
                                                <td class="right">218</td>
                                                <td class="right">66.4</td>
                                            </tr>
                                            <tr>
                                                <td>骨科</td>
                                                <td>李强</td>
                                                <td>1261241</td>
                                                <td>2016/6/27</td>
                                                <td>2016/7/7</td>
                                                <td>锁骨骨折</td>
                                                <td class="right">12</td>
                                                <td class="right">3192.9</td>
                                                <td class="right">604.3</td>
                                                <td class="right">2588.6</td>
                                                <td class="right">1979.8</td>
                                                <td class="right">326.5</td>
                                                <td class="right">150.5</td>
                                                <td class="right">40.3</td>
                                                <td class="right">246.9</td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/extJs.js"></script>
<script src="${staticPath }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script>
	var Chart_zy_Gauge1;    //指标	
	var Chart_zy_Gauge2;	//年度指标
	var Chart_pie;			//费用--饼图	
	var myChart_cost;       //费用--月度变化趋势
	var myChart_control_m;	//单项目控费--月度费用
	var myChart_control_p;  //单项目控费--人均趋势
	var myChartBar_order;	//违规规则排序
	var myChartBar_depart;	//科室违规情况
	var Chart_bar_time;		//住院时间超长
	var Chart_bar_cost;		//住院费用超额
	
	var data;  //  违规传入数据
	var lx;	   //  违规传入数据类型
	var exportData;	// 违规汇总导出 查询数据
	var exportData_details;	//违规详情导出	查询数据
    function selectRender(url,id){
        $.ajax({
            type:"POST",
            url:url,
            cache:false,
            async:false,
            dataType:"json",
            success:function(data){
                var str="";
                if(id=="#depart"){
	                for(var i=0;i<data.length;i++){
	                    str+="<option value='"+data[i].ksdm+"'>"+data[i].ksmc+"</option>";
	                }  
	                $(id).empty().append($(str));                       
                }else if(id="#qy"){
                	var obj = data.obj;
                	for(var i=0;i<obj.length;i++){
	                    str+="<option value='"+obj[i].ID+"'>"+obj[i].MC+"</option>";
	                }  
	                $(id).empty().append($(str));                       
                }
            }
        })
    }
	/* 查询 */
	function serchdata(){
		var index = $("#pageItems .on").index();
		if(index==0){
			monitorBudget();
			evaluationIndex();
		}else if(index==1){
			costtSatistics();
			monthlyTrend();
		}else if(index==2){
			hiddenInterface();
			wgDocuments();
		}else if(index==3){
			$(".jx_rj").css("display", "none");
	        $(".jx_zb").css("display", "none");
	        $(".jx_lj").css("display", "block");
	        $(".wg-bill2s-div").css("display", "none");
			$(".wg-bill2s-div-name-div").css("display", "none");
	        $("input[name='type']").attr("checked",false);
	        $(".lj-rad").prop("checked",true);
			physicianPerformanceLJ();
		}else if(index==6){
			var index1 = $(".card2 .on").index();
			if(index1==0){
				monthlyTrendControl();
			}else if(index1==1){
				trendPerCapitaExpenditure();
			}
			controlProjectSet(); 
		}else if(index==4){
			var index1 = $(".card3 .on").index();
			if(index1==0){
				//overhospitalization();
			}else {
				//hospitalStay();
			}
			//inpatientEnquiry();
		}
	} 
	
	//科室指标
	function monitorBudget(){
		$.ajax({
			type: "POST",
			url:"${path }/inHospital/monitorBudget",
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	//form表单
			success:function(data){	
				if(data.constructor.toString().indexOf("Array")>-1){
					$("#availableCreditM").text(data[0].AVAILABLECREDIT);
					$("#budgetM").text(data[0].BUDGET);
					option_zy_Gauge1.series[0].data[0].value = data[0].UMONTH;
					Chart_zy_Gauge1.setOption(option_zy_Gauge1);
					
					$("#availableCreditY").text(data[1].AVAILABLECREDIT);
					$("#budgetY").text(data[1].BUDGET);
					option_zy_Gauge2.series[0].data[0].value = data[1].UMONTH;
					Chart_zy_Gauge2.setOption(option_zy_Gauge2);
				}													
			}
		});
		
	}
	
	function evaluationIndex(){
		
		$.ajax({
			type: "POST",
			url:"${path }/inHospital/evaluationIndex",
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	//form表单
			success:function(data){	
				clearTable();
				if(JSON.stringify(data)=='{}'){
					clearTable();
				}else{
					var values = data.trueData
					var plans = data.planData;
					if(plans!=undefined){
						// 限定值
						for(var i=0;i<7;i++){
							var temp = "#"+plans[i].key;
							$(temp).nextAll().eq(2).text(plans[i].value);
							compareLastMon(plans,temp,i, 3);
						} 
					}
					// 实际值
					for(var i=0;i<20;i++){
						var temp = "#"+values[i].key;
						$(temp).nextAll().eq(0).text(values[i].value);
						compareLastMon(values,temp,i, 1);
					} 
				}
				
			}	
		});
	}
	
	//费用统计
	function costtSatistics(){
		$.ajax({
			type: "POST",
			url:"${path }/inHospital/costtSatistics",
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	//form表单
			success:function(data){
				if(data.length!=0){
					var arr1 = new Array("JCJYF_C","YPF_C","ZLF_C","SSF_C","HCF_C","QTFY_C");
					var arr2 = new Array(6);
					for(var i=0;i<6;i++){
						//实际值
						var temp = "#"+data[i].key;
						$(temp).nextAll().eq(0).text(data[i].value);
						compareLastMon(data,temp,i, 3);
						//饼图
						for(var j=0;j<6;j++){
							if(arr1[j]==data[i].key){
								arr2[j]=data[i].value;
							}
						}
					}
					for(var i=0;i<6;i++){
						optionPie.series[0].data[i].value=arr2[i];
					}
					Chart_pie.setOption(optionPie);
					//费用占比
					for(var i=6;i<12;i++){
						var temp = "#"+data[i].key;
						$(temp).text(data[i].value);
					}
				}
				
			}	
		});
		
	}
	
	//与上月的循环赋值比较
	// data 数据； temp id值； i 具体的数据下标； n 表格的第几列；
	function compareLastMon(data,temp,i,n){
		// flag 1 增长 	-1 下降  	0 持平 	other 比对无数据（eg：上月此项无数据）
		var flag = data[i].flag;
		switch (flag) {
		case 1:
			$(temp).nextAll().eq(n).text('↑'+data[i].gain);
			$(temp).nextAll().eq(n).removeClass();
			$(temp).nextAll().eq(n).addClass("abnormal-span");
			break;
		case -1:
			$(temp).nextAll().eq(n).text('↓'+data[i].gain);
			$(temp).nextAll().eq(n).removeClass();
			$(temp).nextAll().eq(n).addClass("normal-span");
			break;
		case 0:
			$(temp).nextAll().eq(n).text('0.00%');
			$(temp).nextAll().eq(n).removeClass();
			$(temp).nextAll().eq(n).addClass("normal-span");
			break;
		default:
			$(temp).nextAll().eq(n).text('-');
			$(temp).nextAll().eq(n).removeClass();
			break;
		}
	}
	
	function monthlyTrend(){	
		//line
		 $.ajax({
			type: "POST",
			url:"${path }/costStruct/selectEcharsData?methodFlag=monthlyTrendCost",
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	
			success:function(data){
				//console.log(data);
	 	    	if(JSON.stringify(data) == "{}"){
	 	    		for(var i=0;i<12;i++){
	 	    			optionCost.series[i].data=[0];
	 	    		}
	 	    		myChart_cost.setOption(optionCost); 
	 	    	}else{
	 	    		optionCost.series[0].data=data.monthlyTrendCost_value0;
	 	    		optionCost.series[1].data=data.monthlyTrendCost_value1;
	 	    		optionCost.series[2].data=data.monthlyTrendCost_value2;
	 	    		optionCost.series[3].data=data.monthlyTrendCost_value3;
	 	    		optionCost.series[4].data=data.monthlyTrendCost_value4;
	 	    		optionCost.series[5].data=data.monthlyTrendCost_value5;
	 	    		optionCost.series[6].data=data.monthlyTrendCost_value6;
	 	    		optionCost.series[7].data=data.monthlyTrendCost_value7;
	 	    		optionCost.series[8].data=data.monthlyTrendCost_value8;
	 	    		optionCost.series[9].data=data.monthlyTrendCost_value9;
	 	    		optionCost.series[10].data=data.monthlyTrendCost_value10;
	 	    		optionCost.series[11].data=data.monthlyTrendCost_value11; 	 	    	
	 	    		optionCost.xAxis[0].data=data.monthlyTrendCost_value12;
	 	    		myChart_cost.setOption(optionCost); 
				}

			}
		 }); 
	}
	//违规汇总
	function wgDocuments(){
		var index1 = $(".card1 .on").index();
        var ksbm = $("#depart").val();
		if(ksbm==0){
			$("#doctor_depart").text("科室违规情况");
		}else {
			$("#doctor_depart").text("医师违规情况");
		}
		if(index1==0){
			zywggzOrder();
			zywggzOrderTable();
		}else if(index1==1){
			if(ksbm==0){
				zywgdepartOrder();
				zywgdepartOrderTable();
			}else {
				zywgDoctorOrder();
				zywgDoctorOrderTable();
			}
		} 
	}
	
	function zywggzOrder(){
		$.ajax({
			type: "POST",
			url:"${path }/costStruct/selectEcharsData?methodFlag=zywggzOrder",
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	
			success:function(data){	
				if(JSON.stringify(data) == "{}"){
					option_order.xAxis[0].data=[];
					option_order.series[0].data=[0]; 	
					myChartBar_order.setOption(option_order);	
				    $("#zywggzOrderTable").empty();
			 	    	}else{
		  		 			var wgdjs = data.zywggzOrder_value0;
			 	    		var wgmc = data.zywggzOrder_value1;
			 	    		option_order.xAxis[0].data=wgmc;
			 	    		option_order.series[0].data=wgdjs;		 	    		
			 	    		myChartBar_order.setOption(option_order);
			 	    		zywggzOrderTable();
			 	    	} 
			}
		
		});
	}
	
	function zywggzOrderTable(){
		var cblxbm=$('#cblxbm').val();
		var id = '#zywgDocument';
		var lx = 'order';
        var ksbm = $("#depart").val();
	  $('#zywggzOrderTable').datagrid({
		  url : '${path }/inHospital/zywgTable',
		  fit : false,
		  striped : false,
		  queryParams: {          
		     	syear:$('#selectYear').val(),
		     	smonth:$('#selectMonth').val(),
		     	cblxbm:cblxbm,
		     	ksbm:ksbm,
		     	lx:lx
		       } ,
		  singleSelect:true,
		  rownumbers:true,
		  pagination : true,
		  singleSelect : true,
		  pageSize : 10,
		  pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		  columns : [ [
		    {
		      width : '50%',
		      title : '违规规则',
		      field : 'value1'
		      
		   }, {
		      width : '50%',
		      title : '违规单据数',
		      field : 'value0',
		      formatter: function (value, rowData, rowIndex) {       
		              return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"+id+"','" + rowData.value2 + "','"+lx+"');>" + value + "</a>";
		       }
		  }    
		  ] ],
		  onBeforeLoad: function (param) {
		  	updateDatagridHeader(this);
		  	changeRowHeader(this);
		  },
		  onLoadSuccess:function(){
	            window.onresize=function(){                                
	                $('#zywggzOrderTable').datagrid('resize');//列表随屏幕大小变化
	            };
	      }
	  });
	}
	
	//科室
	function zywgdepartOrder(){
		$.ajax({
			type: "POST",
			url:"${path }/costStruct/selectEcharsData?methodFlag=zywgdepartOrder",    			
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	
			success:function(data){
				//console.log(data);
				if(JSON.stringify(data) == "{}"){
					option_depart.xAxis[0].data=[];
					option_depart.series[0].data=[0]; 	
			 	    myChartBar_depart.setOption(option_depart);	
			 	    $("#zywgdepartOrderTable").empty();
		 	    	}else{	 	    		
	  		 			var wgdjs = data.zywgdepartOrder_value0;
		 	    		var ksmc = data.zywgdepartOrder_value1;
		 	    		option_depart.xAxis[0].data=ksmc;
		 	    		option_depart.series[0].data=wgdjs;
		 	    		myChartBar_depart.setOption(option_depart);
		 	    		zywgdepartOrderTable();
		 	    	}
			}
		});
	}
	
	function zywgdepartOrderTable(){
		var cblxbm=$('#cblxbm').val();
        var ksbm = $("#depart").val();
		var id = '#zyDepartDocument';
		var lx = 'depart';
	  $('#zywgdepartOrderTable').datagrid({
		  url : '${path }/inHospital/zywgTable',
		  fit : false,
		  striped : false,
		  queryParams: {          
		     	syear:$('#selectYear').val(),
		     	smonth:$('#selectMonth').val(),
		     	cblxbm:cblxbm,
		     	ksbm:ksbm,
		     	lx:'depart'
		       } ,
		  singleSelect:true,
		  rownumbers:true,
		  rownumberHeader:'序号',
		  pagination : true,
		  singleSelect : true,
		  pageSize : 10,
		  pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		  columns : [ [
		    {
		      width : '50%',
		      title : '科室名称',
		      field : 'value1'
		      
		   }, {
		      width : '50%',
		      title : '违规单据数',
		      field : 'value0',
		      formatter: function (value, rowData, rowIndex) {       
		              return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"+id+"','" + rowData.value2 + "','"+lx+"');>" + value + "</a>";
		       }
		  }    
		  ] ],
		  onBeforeLoad: function (param) {
		  	updateDatagridHeader(this);
		  	changeRowHeader(this);
		  },
		  onLoadSuccess:function(){
	            window.onresize=function(){                                
	                $('#zywgdepartOrderTable').datagrid('resize');//列表随屏幕大小变化
	            }
	      }
	  });
	}
	
	//医师
	function zywgDoctorOrder(){
		$.ajax({
			type: "POST",
			url:"${path }/costStruct/selectEcharsData?methodFlag=zywgDoctorOrder",    			
		    cache: false,
		    async : false,
		    dataType: "json",	
			data:$('#dataSearchForm').serialize(),	
			success:function(data){
				//console.log(data);
				if(JSON.stringify(data) == "{}"){
					option_depart.xAxis[0].data=[];
					option_depart.series[0].data=[0]; 	
			 	    myChartBar_depart.setOption(option_depart);	
			 	    $("#zywgdepartOrderTable").empty();
		 	    	}else{	 	    		
	  		 			var wgdjs = data.zywgDoctorOrder_value0;
		 	    		var ksmc = data.zywgDoctorOrder_value1;
		 	    		option_depart.xAxis[0].data=ksmc;
		 	    		option_depart.series[0].data=wgdjs;
		 	    		myChartBar_depart.setOption(option_depart);
		 	    		zywgDoctorOrderTable();
		 	    	}
				}
		});	
	}
		
	function zywgDoctorOrderTable(){
		var cblxbm=$('#cblxbm').val();
		var lx = 'doctor';
		var id = '#zyDepartDocument';
		// var ksbm = $("#depart").combobox("getValue");
        var ksbm = $("#depart").val();
	  $('#zywgdepartOrderTable').datagrid({
		  url : '${path }/inHospital/zywgTable',
		  fit : false,
		  striped : false,
		  queryParams: {          
		     	syear:$('#selectYear').val(),
		     	smonth:$('#selectMonth').val(),
		     	cblxbm:cblxbm,
		     	ksbm:ksbm,
		     	lx:'doctor'
		       } ,
		  singleSelect:true,
		  rownumbers:true,
		  rownumberHeader:'序号',
		  pagination : true,
		  singleSelect : true,
		  pageSize : 10,
		  pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		  columns : [ [
		    {
		      width : '50%',
		      title : '医师名称',
		      field : 'value1'
		      
		   }, {
		      width : '50%',
		      title : '违规单据数',
		      field : 'value0',
		      formatter: function (value, rowData, rowIndex) {       
		              return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"+id+"','" + rowData.value2 + "','"+lx+"');>" + value + "</a>";
		       }
		  }    
		  ] ],
		  onBeforeLoad: function (param) {
		  	updateDatagridHeader(this);
		  	changeRowHeader(this);
		  },
		  onLoadSuccess:function(){
	            window.onresize=function(){                                
	                $('#zywgdepartOrderTable').datagrid('resize');//列表随屏幕大小变化
	            }
	      }
	  });
	}

	function illegalDocuments(id,data1,lx1){
		$(".ks-nm-div-name-div").css("display", "none");
		$(".nm-div-name-div").css("display", "none");
		$(".wg-bill2s-div-name-div").css("display", "none");
		$(".wg-bill2s-div ").css("display", "block");
		 showOrHidden(lx1);
		 data = data1;
		 lx = lx1;
	 	 var cblxbm=$('#cblxbm').val();
         var ksbm = $("#depart").val();
         if(lx=='order'){
        	col_order[9].hidden=true;
         }else{
        	col_order[9].hidden=false;
         }
         var col=col_order;
	 	 $(id).datagrid({
	      url : '${path }/inHospital/illegalDocuments',
	      fit : false,
	      striped : false,
	      queryParams: {          
	      	syear:$('#selectYear').val(),
	      	smonth:$('#selectMonth').val(),
	      	cblxbm:cblxbm,
	      	data:data,
	      	ksbm:ksbm,
	      	lx:lx
	        } ,
	      rownumbers:true,
	      rownumberHeader:'序号',
	      pagination : true,
	      singleSelect : true,
	      pageSize : 10,
	      pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	      columns : [col],
	      onBeforeLoad: function (param) {
	      	updateDatagridHeader(this);
	     	changeRowHeader(this);
	      },
	      onLoadSuccess:function(data){
	    	  exportData = {
	    			syear:$('#selectYear').val(),
    		      	smonth:$('#selectMonth').val(),
    		      	cblxbm:cblxbm,
    		      	data:data1,
    		      	ksbm:ksbm,
    		      	lx:lx	  
	    	  }
	    	  $("#exportData").val(JSON.stringify(exportData));
	      }
	  });  
	}
	var col_order=[
	 	      {
		          width : '13%',
		          title : '入院日期',
		          field : 'RYRQ' 
		      },{
		          width : '15%',
		          title : '住院号',
		          field : 'ZYH'
		          
		      },  {
		          width : '10%',
		          title : '姓名',
		          field : 'XM',
		          formatter: function (value, rowData, rowIndex) {       
		                  return "<a style='color:green' href='javascript:void(0);' onclick=violationDetails('" + rowData.ZYH + "','"+lx+"','"+data+"');>" + value + "</a>";;
		           }
		      }, {
		          width : '10%',
		          title : '性别',
		          field : 'XB'
		      } , {
		          width : '15%',
		          title : '身份证号码',
		          field : 'SFZHM'
		     
		      }, {
		          width : '10%',
		          title : '年龄',
		          field : 'NL'
		     
		      }, {
		          width : '10%',
		          title : '医保卡号',
		          field : 'YBKH'
		     
		      }, {
		          width : '15%',
		          title : '科室 ',
		          field : 'KS'
		     
		      },
		      {
		          width : '15%',
		          title : '医师 ',
		          field : 'YS'
		     
		      }
		      ,{
		          width : '10%',
		          title : '是否整单违规',
		          field : 'IFZDWG',
		          hidden: true
		      }
		      ,{
		          width : '10%',
		          title : '入院诊断',
		          field : 'RYZD'
		     
		      },{
		          width : '10%',
		          title : '住院天数',
		          field : 'ZYTS'
		     
		      },{
		          width : '10%',
		          title : '住院医疗费用(元) ',
		          field : 'YLF'
		     
		      },{
		          width : '10%',
		          title : '医保统筹支付(元)',
		          field : 'YBTCZF'
		     
		      }   
		      ];
	
	//违规界面--违规汇总展示与隐藏
	function showOrHidden(lx){
		if(lx=='order'){
			$(".nm-div").css("display","block");
			$(".ks-nm-div").css("display","none");
		}else {
			$(".nm-div").css("display","none");
			$(".ks-nm-div").css("display","block");
		}
	};
	
	//违规界面--汇总、详情隐藏
	function hiddenInterface(){
		$(".nm-div-name-div").css("display", "none");
		$(".nm-div").css("display", "none");
		$(".ks-nm-div").css("display", "none");
		$(".ks-nm-div-name-div").css("display", "none");
	}

	// 违规详情
	function violationDetails(zyh, lx, data) {
		$(".nm-div-name-div").css("display", "block");
		$(".ks-nm-div-name-div").css("display", "block");
		$(".wg-bill2s-div-name-div").css("display", "block");
		var tempId;
		var index = $("#pageItems .on").index();
		if(index==3){
			// 医师绩效--违规详情
			tempId = "#zykswgdetails";
		}else{
			if (lx == "order") {
				// 违规汇总-- 规则违规详情
				tempId = "#zywgDetails";
			} else {
				// 违规汇总-- 医师科室违规详情
				tempId = "#zyDepartDetails";
			}
		}
		var cblxbm = $('#cblxbm').val();
		var ksbm = $("#depart").val();
		var syear = $('#selectYear').val();
		var smonth = $('#selectMonth').val();
		$(tempId).datagrid(
				{
					url : '${path }/inHospital/zyviolationDetails',
					fit : false,
					striped : false,
					queryParams : {
						zyh : zyh,
						lx : lx,
						data : data,
						syear : syear,
						smonth : smonth,
						cblxbm : cblxbm,
						ksbm : ksbm
					},
					rownumbers : true,
					rownumberHeader : '序号',
					pagination : true,
					singleSelect : true,
					pageSize : 10,
					pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
					columns : [ [
							{
								width : '10%',
								title : '日期',
								field : 'RQ'
							},
							{
								width : '10%',
								title : '时间',
								field : 'SJ',
							},
							{
								width : '10%',
								title : '项目编码',
								field : 'XMBM'

							},
							{
								width : '10%',
								title : '项目名称',
								field : 'XMMC',
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
								width : '10%',
								title : '违反规则',
								field : 'WFGZ',
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
								width : '10%',
								title : '提示说明',
								field : 'TSSM',
								formatter : function(value) {
									if (value == null) {
										return '-';
									} else {
										return "<span title='" + value + "'>"
												+ value + "</span>"
									}
								}

							}, {
								width : '10%',
								title : '科室',
								field : 'KSMC'

							}, {
								width : '10%',
								title : '医师',
								field : 'YSXM'

							}, {
								width : '10%',
								title : '规格',
								field : 'YPGG'

							}, {
								width : '10%',
								title : '单位',
								field : 'DW'

							}, {
								width : '10%',
								title : '用法',
								field : 'YF'
							}, {
								width : '10%',
								title : '用量',
								field : 'YL'
							}, {
								width : '10%',
								title : '单价(元)',
								field : 'DJ'
							}, {
								width : '10%',
								title : '数量',
								field : 'SL'
							}, {
								width : '10%',
								title : '金额(元)',
								field : 'JE'
							}, {
								width : '10%',
								title : '医保内金额(元)',
								field : 'YBNJE'
							}] ],
					onBeforeLoad : function(param) {
						updateDatagridHeader(this);
					},
					onLoadSuccess:function(data){
				    	  exportData_details = {
				    			zyh : zyh,
								lx : lx,
								data : data,
								syear : syear,
								smonth : smonth,
								cblxbm : cblxbm,
								ksbm : ksbm	  
				    	  };
				    	  $("#exportData_details").val(JSON.stringify(exportData_details));
				      }
				});
	}

	//医师绩效
	function physicianPerformanceLJ() {
		var cblxbm = $('#cblxbm').val();
		var ksbm = $("#depart").val();
		var lx = 'doctor';
		var id = '#docwgDocument';
		$('#doctorPerformance')
				.datagrid(
						{
							url : '${path }/inHospital/physicianPerformance',
							fit : false,
							striped : false,
							queryParams : {
								syear : $('#selectYear').val(),
								smonth : $('#selectMonth').val(),
								cblxbm : cblxbm,
								ksbm : ksbm,
								lx : 'lj'
							},
							pagination : true,
							singleSelect : true,
							pageSize : 10,
							pageList : [ 10, 20, 30, 40, 50, 100, 200, 300,
									400, 500 ],
							columns : [ [
									{
										width : '10%',
										field : 'GH',
										title : '工号'
									},
									{
										width : '10%',
										title : '医师 ',
										field : 'YS'
									},
									{
										width : '10%',
										title : '收治人次 ',
										field : 'SZRC',

									},
									{
										width : '10%',
										title : '平均住院日 ',
										field : 'PJZYR',

									},
									{
										width : '10%',
										title : '医疗总费用(元)',
										field : 'YLF',

									},
									{
										width : '10%',
										title : '医保统筹支付(元)',
										field : 'YBTCZF'

									},
									{
										width : '10%',
										title : '超额人次 ',
										field : 'CERC',

									},
									{
										width : '10%',
										title : '超定额总费用(元)',
										field : 'CDEZFY'
									},
									{
										width : '10%',
										title : '违规单据数 ',
										field : 'WGDJS',
										formatter : function(value, rowData,
												rowIndex) {
											return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"
													+ id
													+ "','"
													+ rowData.GH
													+ "','"
													+ lx
													+ "');>"
													+ value + "</a>";
										}
									}, {
										width : '10%',
										title : '检查费(元)',
										field : 'JCF',

									}, {
										width : '10%',
										title : '检验费(元)',
										field : 'JYF'
									}, {
										width : '10%',
										title : '手术麻醉费(元)',
										field : 'MZF'
									}, {
										width : '10%',
										title : '药品费(元)',
										field : 'YPF'
									}, {
										width : '10%',
										title : '医用耗材费(元)',
										field : 'YYHCF'
									}, {
										width : '10%',
										title : '治疗费(元) ',
										field : 'ZLF'
									}, {
										width : '10%',
										title : '输血费(元)',
										field : 'SXF'
									} ] ],
							onBeforeLoad : function(param) {
								updateDatagridHeader(this);
							},
							onLoadSuccess : function(data) {
								window.onresize = function() {
									$('#doctorPerformance').datagrid('resize');//列表随屏幕大小变化
							
								}
							}
						});
	}

	function physicianPerformanceRJ() {
		var cblxbm = $('#cblxbm').val();
		var ksbm = $("#depart").val();
		var lx = 'doctor';
		var id = '#docwgDocument';
		$('.rj').datagrid({
			url : '${path }/inHospital/physicianPerformance',
			fit : false,
			striped : false,
			queryParams : {
				syear : $('#selectYear').val(),
				smonth : $('#selectMonth').val(),
				cblxbm : $('#cblxbm').val(),
				ksbm : ksbm,
				lx : 'rj'
			},
			pagination : true,
			singleSelect : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				width : '10%',
				field : 'GH',
				title : '工号'
			}, {
				width : '10%',
				title : '医师 ',
				field : 'YS'
			}, {
				width : '10%',
				title : '收治人次 ',
				field : 'SZRC',

			}, {
				width : '10%',
				title : '平均住院日 ',
				field : 'PJZYR',

			}, {
				width : '10%',
				title : '医疗总费用(元)',
				field : 'YLF',

			}, {
				width : '10%',
				title : '医保统筹支付(元)',
				field : 'YBTCZF'
			}, {
				width : '10%',
				title : '超额人次 ',
				field : 'CERC',

			}, {
				width : '10%',
				title : '超定额总费用(元)',
				field : 'CDEZFY'
			}, {
				width : '10%',
				title : '违规单据数 ',
				field : 'WGDJS',
				formatter : function(value, rowData,
						rowIndex) {
					return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"
							+ id
							+ "','"
							+ rowData.GH
							+ "','"
							+ lx
							+ "');>"
							+ value + "</a>";
				}
			}, {
				width : '10%',
				title : '人均药费(元)',
				field : 'RJYF',
			}, {
				width : '10%',
				title : '人均检查检验费(元)',
				field : 'RJJCJYF'
			}, {
				width : '10%',
				title : '人均手术麻醉费(元)',
				field : 'RJMZF'
			}, {
				width : '10%',
				title : '人均医用耗材费(元)',
				field : 'RJYYHCF'
			}, {
				width : '10%',
				title : '人均治疗费(元)',
				field : 'RJZLF'
			}, {
				width : '10%',
				title : '人均输血费(元)',
				field : 'RJSXF'
			} ] ],
			onBeforeLoad : function(param) {
				updateDatagridHeader(this);
			},
			onLoadSuccess : function() {
				window.onresize = function() {
					$('.rj').datagrid('resize');//列表随屏幕大小变化
				}
			}
		});
	}
	function physicianPerformanceZB() {
		var cblxbm = $('#cblxbm').val();
		var ksbm = $("#depart").val();
		var lx = 'doctor';
		var id = '#docwgDocument';
		$('.zb').datagrid({
			url : '${path }/inHospital/physicianPerformance',
			fit : false,
			striped : false,
			queryParams : {
				syear : $('#selectYear').val(),
				smonth : $('#selectMonth').val(),
				cblxbm : $('#cblxbm').val(),
				ksbm : ksbm,
				lx : 'zb'
			},
			pagination : true,
			singleSelect : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				width : '10%',
				field : 'GH',
				title : '工号'
			}, {
				width : '10%',
				title : '医师 ',
				field : 'YS'
			}, {
				width : '10%',
				title : '收治人次 ',
				field : 'SZRC',

			}, {
				width : '10%',
				title : '平均住院日 ',
				field : 'PJZYR',

			}, {
				width : '10%',
				title : '医疗总费用(元)',
				field : 'YLF',

			}, {
				width : '10%',
				title : '医保统筹支付(元)',
				field : 'YBTCZF'

			}, {
				width : '10%',
				title : '超额人次 ',
				field : 'CERC',

			}, {
				width : '10%',
				title : '超定额总费用(元)',
				field : 'CDEZFY'
			}, {
				width : '10%',
				title : '违规单据数 ',
				field : 'WGDJS',
				formatter : function(value, rowData,
						rowIndex) {
					return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"
							+ id
							+ "','"
							+ rowData.GH
							+ "','"
							+ lx
							+ "');>"
							+ value + "</a>";
				}
			}, {
				width : '10%',
				title : '自费占比',
				field : 'ZFZB',

			}, {
				width : '10%',
				title : '药占比',
				field : 'YZB'
			}, {
				width : '10%',
				title : '检查检验占比',
				field : 'JCJYZB'
			}, {
				width : '10%',
				title : '诊疗占比',
				field : 'ZLZB'
			}, {
				width : '10%',
				title : '材料占比',
				field : 'CLZB'
			} ] ],
			onBeforeLoad : function(param) {
				updateDatagridHeader(this);
			},
			onLoadSuccess : function() {
				window.onresize = function() {
					$('.zb').datagrid('resize');//列表随屏幕大小变化
				}
			}
		});
	}

	//单项目控费
	function monthlyTrendControl() {
		alert("月度变化趋势");
		option.series[0].data = [ 320, 700, 670, 488, 654, 646, 935, 700, 532,
				320, 264, 433 ];
		option.series[1].data = [ 320, 700, 670, 488, 654, 646, 935, 700, 532,
				320, 264, 433 ];
		option.series[2].data = [ 320, 700, 670, 488, 654, 646, 935, 700, 532,
				320, 264, 433 ];
		option.series[3].data = [ 320, 700, 670, 488, 654, 646, 935, 700, 532,
				320, 264, 433 ];
		option.series[4].data = [ 320, 700, 670, 488, 654, 646, 935, 700, 532,
				320, 264, 433 ];
		myChart_control_m.setOption(option);
		$
				.ajax({
					type : "POST",
					url : "${path }/costStruct/selectEcharsData?methodFlag=monthlyTrendControl",
					cache : false,
					async : false,
					dataType : "json",
					data : {
						"sfzhm" : sfzhm,
						"bzmc" : bzmc,
						"syear" : $('#selectYear').val(),
						"smonth" : $('#selectMonth').val()
					},
					success : function(data) {
						if (JSON.stringify(data) == "{}") {
							option.series[0].data = [ 0 ];
							option.series[1].data = [ 0 ];
							option.series[2].data = [ 0 ];
							option.series[3].data = [ 0 ];
							option.series[4].data = [ 0 ];
							option.series[5].data = [ 0 ];
							option.series[6].data = [ 0 ];
							option.series[7].data = [ 0 ];
							Chart_line_hz.setOption(option_line_hz);
						} else {

						}

					}
				})
	}

	function trendPerCapitaExpenditure() {

		alert("人均变化趋势");
		var data1 = [ 120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33 ];
		option.series[0].data = data1;
		option.series[1].data = data1;
		option.series[2].data = data1;
		option.series[3].data = data1;
		option.series[4].data = data1;
		myChart_control_p.setOption(option);
		$
				.ajax({
					type : "POST",
					url : "${path }/costStruct/selectEcharsData?methodFlag=monthlyTrendControl",
					cache : false,
					async : false,
					dataType : "json",
					data : {
						"sfzhm" : sfzhm,
						"bzmc" : bzmc,
						"syear" : $('#selectYear').val(),
						"smonth" : $('#selectMonth').val()
					},
					success : function(data) {
						if (JSON.stringify(data) == "{}") {
							option.series[0].data = [ 0 ];
							option.series[1].data = [ 0 ];
							option.series[2].data = [ 0 ];
							option.series[3].data = [ 0 ];
							option.series[4].data = [ 0 ];
							option.series[5].data = [ 0 ];
							option.series[6].data = [ 0 ];
							option.series[7].data = [ 0 ];
							Chart_line_hz.setOption(option_line_hz);
						} else {

						}

					}
				})
	}

	function controlProjectSet() {
		alert("管控项目设定");
	}
	//重点监控
	function overhospitalization() {
		$
				.ajax({
					type : "POST",
					url : "${path }/costStruct/selectEcharsData?methodFlag=overhospitalization",
					cache : false,
					async : false,
					dataType : "json",
					data : $('#dataSearchForm').serialize(),
					success : function(data) {
						//console.log(data);
						/* if (JSON.stringify(data) == "{}") {
							option_bar_cost.series[0].data = [ 0 ];
							option_bar_cost.xAxis[0].data = [];
							Chart_bar_cost.setOption(option_bar_cost);
						} else {
							var cerc = data.overhospitalization_value0;
							var ksmc = data.overhospitalization_value1;
							option_bar_cost.xAxis[0].data = ksmc;
							option_bar_cost.series[0].data = cerc;
							Chart_bar_cost.setOption(option_bar_cost);
						} */

					}
				});
	}

	function hospitalStay() {
		$
				.ajax({
					type : "POST",
					url : "${path }/costStruct/selectEcharsData?methodFlag=hospitalStay",
					cache : false,
					async : false,
					dataType : "json",
					data : $('#dataSearchForm').serialize(),
					success : function(data) {
						/* if (JSON.stringify(data) == "{}") {
							option_bar_time.series[0].data = [ 0 ];
							option_bar_time.xAxis[0].data = [];
							Chart_bar_time.setOption(option_bar_time);
						} else {
							var csrc = data.hospitalStay_value0;
							var ksmc = data.hospitalStay_value1;
							option_bar_time.xAxis[0].data = ksmc;
							option_bar_time.series[0].data = csrc;
							Chart_bar_time.setOption(option_bar_time);
						} */

					}
				});
	}

	function inpatientEnquiry() {
		// var ksbm = $("#depart").combobox("getValue");
		var ksbm = $("#depart").val();
		var cblxbm = $("#cblxbm").val();
		$('#gkxmSet').datagrid({
			url : '${path }/inHospital/inpatientEnquiry',
			fit : false,
			striped : false,
			queryParams : {
				syear : $('#selectYear').val(),
				smonth : $('#selectMonth').val(),
				cblxbm : cblxbm,
				ksbm : ksbm
			},
			pagination : true,
			singleSelect : true,
			pageSize : 10,
			pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			columns : [ [ {
				width : '10%',
				field : 'KSMC',
				title : '科室名称'
			}, {
				width : '10%',
				title : '患者姓名',
				field : 'HZXM'
			}, {
				width : '10%',
				title : '医保卡号 ',
				field : 'YBKH',

			}, {
				width : '10%',
				title : '入院时间  ',
				field : 'RYSJ',

			}, {
				width : '10%',
				title : '出院时间 ',
				field : 'CYSJ',

			}, {
				width : '10%',
				title : '出院诊断',
				field : 'CYZD'

			}, {
				width : '10%',
				title : '住院天数(天)',
				field : 'ZYTS',

			}, {
				width : '10%',
				title : '住院医疗费用(元)',
				field : 'YLF',

			}, {
				width : '10%',
				title : '医保统筹支付(元)',
				field : 'YBTCZF'
			}, {
				width : '10%',
				title : '药品费(元) ',
				field : 'YPF'
			}, {
				width : '10%',
				title : '检查检验费(元) ',
				field : 'JCJYF',

			}, {
				width : '10%',
				title : '材料费(元)',
				field : 'CLF'
			}, {
				width : '10%',
				title : '诊疗费(元) ',
				field : 'ZLF'
			}, {
				width : '10%',
				title : '护理费(元) ',
				field : 'HLF'
			}, {
				width : '10%',
				title : '其他费用(元)',
				field : 'QTFY'
			} ] ],
			onBeforeLoad : function(param) {
				updateDatagridHeader(this);
			}
		});

	}

	$(function() {
		/*初始化*/
		$(document).ready(function() {
			Gauge();
			getQueryData();
			selectDepart();
			$("#selectYear,#depart,#selectMonth,#cblxbm,#qy").comboSelect();
			$("#selectYear").parent().css({
				"width" : "8%"
			});
			$("#selectMonth").parent().css({
				"width" : "6%"
			});
			$("#cblxbm").parent().css({
				"width" : "10%"
			});
			$("#depart").parent().css({
				"width" : "12%"
			});
			$("#qy").parent().css({
				"width" : "10%"
			});
			$(".jx_rj").css("display", "none");
			$(".jx_zb").css("display", "none");
			$(".qy").hide();
		});

		function selectDepart() {
			/*$('#depart').combobox({   
				url:'${path}/department/getDepartmentOfUser?kslx=zysy',
			     valueField:'ksdm',   
			     textField:'ksmc',
			     onLoadSuccess: function () { 
			    	 var val = $(this).combobox('getData');  
			         for (var item in val[0]) 
			         {  
			             if (item == 'ksdm') 
			             {  
			                 $(this).combobox('select', val[0][item]); 	
			                 department = val[0][item];
			             }  
			         }
			         monitorBudget();
					 evaluationIndex();
			     }
			 });*/
			selectRender('${path}/department/getDepartmentOfUser?kslx=zysy',
					'#depart');
			selectRender('${path}/department/sbInfo',
				'#qy');
			monitorBudget();
			evaluationIndex();
		}

		function getQueryData() {
			//  年份下拉选项 往回倒推三年
			var date = new Date();
			var syy = date.getFullYear();
			for (var sy = 0; sy < 3; sy++) {
				$('#selectYear').append(
						"<option value='" + (syy - sy) + "'>" + (syy - sy)
								+ "</option>");
			}
			var month = date.getMonth() + 1;
			month = month < 10 ? "0" + month : String(month);
			$('#selectMonth').val(month);
		}

		//选项卡
		$(".tab-tables ul li").click(
				function() {
					$(this).addClass("on").siblings().removeClass("on");
					//切换选中的按钮高亮状态
					var index = $(this).index();
					//获取被按下按钮的索引值，需要注意index是从0开始的
					$(".tab-div-box > div").eq(index).css("display", "block")
							.siblings().css("display", "none");

					if (index == 0) {
						Gauge();
						$(".ks-nm-div").css("display", "none");
						$(".ks-nm-div-name-div").css("display", "none");
						$(".nm-div").css("display", "none");
						$(".nm-div-name-div").css("display", "none");
						$(".wg-bill2s-div").css("display", "none");
						$(".wg-bill2s-div-name-div").css("display", "none");
						monitorBudget();
						evaluationIndex();
					} else if (index == 1) {
						pie();
						line();
						$(".ks-nm-div").css("display", "none");
						$(".ks-nm-div-name-div").css("display", "none");
						$(".nm-div").css("display", "none");
						$(".nm-div-name-div").css("display", "none");
						$(".wg-bill2s-div").css("display", "none");
						$(".wg-bill2s-div-name-div").css("display", "none");
						costtSatistics();
						monthlyTrend();
					} else if (index == 2) {
						bar2();
						$(".wg-bill2s-div").css("display", "none");
						$(".wg-bill2s-div-name-div").css("display", "none");
						hiddenInterface();
						wgDocuments();
					} else if (index == 3) {
						$(".ks-nm-div").css("display", "none");
						$(".ks-nm-div-name-div").css("display", "none");
						$(".nm-div").css("display", "none");
						$(".nm-div-name-div").css("display", "none");
						$(".wg-bill2s-div").css("display", "none");
						$(".wg-bill2s-div-name-div").css("display", "none");
						physicianPerformanceLJ();
					} else if (index == 4) {
						bar();
						bar1();

						$(".card3 li").eq(0).trigger('click');
						var index1 = $(".card3 .on").index();
						if (index1 == 0) {
							//overhospitalization();
						} else {
							//hospitalStay();
						}
						//inpatientEnquiry();
					}
					/* else{
					    line1();
					    $(".ks-nm-div").css("display", "none");
					    $(".ks-nm-div-name-div").css("display", "none");
					    $(".nm-div").css("display", "none");
					    $(".nm-div-name-div").css("display", "none");
					    $(".wg-bill2s-div").css("display", "none");
					    $(".wg-bill2s-div-name-div").css("display", "none");
					    var index1 = $(".card2 .on").index();
						if(index1==0){
							monthlyTrendControl();
						}else if(index1==1){
							trendPerCapitaExpenditure();
						}
						controlProjectSet();
					} */
				});

		
	/*违规分析选项卡*/
		$(".card1 li").click(
						function() {
							$(this).addClass("on").siblings().removeClass("on");
							//切换选中的按钮高亮状态
							var index = $(this).index();
							//获取被按下按钮的索引值，需要注意index是从0开始的
							$(".tab-table-boxs > div").eq(index).css("display",
									"block").siblings().css("display", "none");
							hiddenInterface();
							if (index == 0) {
								bar2();
								$("#bar4").remove();
								var bar4_html = "<div class='fy-bar-div' id='bar4'></div>";
								$("#num8").append(bar4_html);
								zywggzOrder();
								zywggzOrderTable();
							} else if (index == 1) {
								bar3();
								$("#bar3").remove();
								var bar3_html = "<div class='fy-bar-div' id='bar3'></div>";
								$("#num7").append(bar3_html);
								var ksbm = $("#depart").val();
								if (ksbm == 0) {
									zywgdepartOrder();
									zywgdepartOrderTable();
								} else {
									zywgDoctorOrder();
									zywgDoctorOrderTable();
								}
							}
						});
		/*违规分析-违规规则排序-违规单据数点击事件*/
		$(".nm").click(function() {
			$(".nm-div").css("display", "block");
		});
		$(".nm-div-name").click(function() {
			$(".nm-div-name-div").css("display", "block");
		});
		$(".ks-nm").click(function() {
			$(".ks-nm-div").css("display", "block");
		});
		$(".ks-nm-div-name").click(function() {
			$(".ks-nm-div-name-div").css("display", "block");
		});
		/*医师绩效-单选框点击事件*/
		$(".rj-rad").click(function() {
			$(".jx_lj").css("display", "none");
			$(".jx_zb").css("display", "none");
			$(".jx_rj").css("display", "block");
			$(".wg-bill2s-div").css("display", "none");
			$(".wg-bill2s-div-name-div").css("display", "none");
			physicianPerformanceRJ();
		});
		$(".lj-rad").click(function() {
			$(".jx_rj").css("display", "none");
			$(".jx_zb").css("display", "none");
			$(".jx_lj").css("display", "block");
			$(".wg-bill2s-div").css("display", "none");
			$(".wg-bill2s-div-name-div").css("display", "none");
			physicianPerformanceLJ();
		});
		$(".zb-rad").click(function() {
			$(".jx_lj").css("display", "none");
			$(".jx_rj").css("display", "none");
			$(".jx_zb").css("display", "block");
			$(".wg-bill2s-div").css("display", "none");
			$(".wg-bill2s-div-name-div").css("display", "none");
			physicianPerformanceZB();
		});

		$(".wg-bill2s").click(function() {
			$(".wg-bill2s-div").css("display", "block");
		});
		$(".wg-bill2s-div-name").click(function() {
			$(".wg-bill2s-div-name-div").css("display", "block");
		});

		/*单项目控费-选项卡*/
		$(".card2 li")
				.click(
						function() {
							$(this).addClass("on").siblings().removeClass("on");
							//切换选中的按钮高亮状态
							var index = $(this).index();
							//获取被按下按钮的索引值，需要注意index是从0开始的
							$(".tab-table-box2s > div").eq(index).css(
									"display", "block").siblings().css(
									"display", "none");

							if (index == 0) {
								line1();
								$("#line2").remove();
								var line2_html = "<div class='fy-bar-div' id='line2'></div>";
								$("#num10").append(line2_html);
							} else if (index == 1) {
								line2();
								$("#line1").remove();
								var line1_html = "<div class='fy-bar-div' id='line1'></div>";
								$("#num9").append(line1_html);
							}
						});
		/*管控项目设定-添加事件*/
		$(".add-btn")
				.click(
						function() {
							var len = $(".add-table tr").length;
							var nb = 0;
							if (len > 1) {
								nb = Number($(".add-table tr").eq(len - 1)
										.children().eq(0).text());
							}

							var num = "0" + (nb + 1);
							var fy_type = $("#sf-type option:selected").text();
							var sf_type = $("#fy-type option:selected").text();
							var sf_name = $("#sf-name option:selected").text();
							var mouth_fy = $(".mouth-fy").val();
							var mouth_rj = $(".mouth-rj").val();

							var add_html = "<tr> <td>"
									+ num
									+ "</td>"
									+ "<td>"
									+ sf_type
									+ "</td>"
									+ "<td>"
									+ fy_type
									+ "</td>"
									+ "<td>"
									+ sf_name
									+ "</td>"
									+ "<td>"
									+ mouth_fy
									+ "</td><td>"
									+ mouth_rj
									+ "</td><td><button class='btn btn-sm btn-success del-btn'>删除</button></td></tr>";
							$(".add-table").append(add_html);
						})
		/*管控项目设定-删除事件*/
		$(".add-table").on("click", ".del-btn", function() {
			$(this).parent().parent().remove();
		});
		/*重点监控-选项卡*/
		$(".card3 li").click(
				function() {
					$(this).addClass("on").siblings().removeClass("on");
					//切换选中的按钮高亮状态
					var index = $(this).index();
					//获取被按下按钮的索引值，需要注意index是从0开始的
					$(".tab-table-box3s > div").eq(index).css("display",
							"block").siblings().css("display", "none");

					if (index == 0) {
						 bar();
						//overhospitalization();
						//inpatientEnquiry();
					} else if (index == 1) {
						 bar1();
						//hospitalStay();
						//inpatientEnquiry();
					}
				});
		/*科室汇总-仪表盘*/
		function Gauge() {
			//仪表图1
			Chart_zy_Gauge1 = echarts
					.init(document.getElementById('zy_Gauge1'));
			var gauge1_date = 45.33;
			var gauge1_ze = 155;
			var colors;
			var gauge1_percent = Number((gauge1_date / gauge1_ze)
					.toPrecision(2));
			if (gauge1_date > gauge1_ze) {
				gauge1_ze = gauge1_date;
			}
			if (gauge1_percent < 0.75) {
				colors = '#9BD572';
			} else if (gauge1_percent > 0.75 && gauge1_percent < 1) {
				colors = '#FFA31C';
			} else if (gauge1_percent > 1 || gauge1_percent == 1) {
				colors = '#FF0000';
			}
			// 指定图表的配置项和数据
			option_zy_Gauge1 = {
				tooltip : {
					formatter : "{a} <br/>{b} : {c}(万元)"
				},
				series : [ {
					name : '本月使用额度',
					type : 'gauge',
					center : [ '50%', '58%' ], // 默认全局居中
					radius : '98%',
					min : 0, // 最小值
					max : gauge1_ze, // 最大值
					splitNumber : 10, // 分割段数，默认为5
					axisLine : { // 坐标轴线
						show : true, // 默认显示，属性show控制显示与否
						lineStyle : { // 属性lineStyle控制线条样式
							color : [ [ gauge1_percent, colors ],
									[ 1, '#E6F1DF' ] ],
							width : 25
						}
					},
					axisTick : { // 坐标轴小标记
						show : false
					// 属性show控制显示与否，默认不显示
					},
					axisLabel : { // 坐标轴文本标签，详见axis.axisLabel
						show : false
					},
					splitLine : { // 分隔线
						show : false
					// 默认显示，属性show控制显示与否
					},
					pointer : {
						show : false
					},
					title : {
						show : true,
						offsetCenter : [ 0, '-14%' ],
						textStyle : {
							color : '#333',
							fontSize : 14
						}
					},
					detail : {
						show : true,
						backgroundColor : 'rgba(0,0,0,0)',
						borderWidth : 0,
						borderColor : '#ccc',
						offsetCenter : [ 0, '10%' ],
						formatter : '{value}(万元)',
						textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
							color : colors,
							fontSize : 16
						}
					},
					data : [ {
						value : gauge1_date,
						name : '本月使用'
					} ]
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			Chart_zy_Gauge1.setOption(option_zy_Gauge1);

			//仪表图2
			Chart_zy_Gauge2 = echarts
					.init(document.getElementById('zy_Gauge2'));
			// 指定图表的配置项和数据
			var gauge2_date = 2859.71;
			var gauge2_ze = 6000;
			var gauge2_percent = Number((gauge2_date / gauge2_ze)
					.toPrecision(2));
			var color2s;
			if (gauge2_date > gauge2_ze) {
				gauge2_ze = gauge2_date;
			}
			if (gauge2_percent < 0.75) {
				color2s = '#9BD572';
			} else if (gauge2_percent > 0.75 && gauge2_percent < 1) {
				color2s = '#FFA31C';
			} else if (gauge2_percent > 1 || gauge2_percent == 1) {
				color2s = '#FF0000';
			}

			option_zy_Gauge2 = {
				tooltip : {
					formatter : "{a} :<br/> {c}(万元)"
				},
				series : [ {
					name : '年度使用额度',
					type : 'gauge',
					center : [ '50%', '58%' ], // 默认全局居中
					radius : '98%',
					min : 0, // 最小值
					max : gauge2_ze, // 最大值
					precision : 0, // 小数精度，默认为0，无小数点
					splitNumber : 10, // 分割段数，默认为5
					axisLine : { // 坐标轴线
						show : true, // 默认显示，属性show控制显示与否
						lineStyle : { // 属性lineStyle控制线条样式
							color : [ [ gauge2_percent, color2s ],
									[ 1.0, '#E6F1DF' ] ],
							width : 25
						}
					},
					axisTick : { // 坐标轴小标记
						show : false
					// 属性show控制显示与否，默认不显示
					},
					axisLabel : { // 坐标轴文本标签，详见axis.axisLabel
						show : false
					},
					splitLine : { // 分隔线
						show : false
					},
					pointer : {
						show : false
					},
					title : {
						show : true,
						offsetCenter : [ 0, '-14%' ],
						textStyle : {
							color : '#333',
							fontSize : 14
						}
					},
					detail : {
						show : true,
						backgroundColor : 'rgba(0,0,0,0)',
						borderWidth : 0,
						borderColor : '#ccc',
						width : 100,
						height : 40,
						offsetCenter : [ 0, '10%' ],
						formatter : '{value}(万元)',
						textStyle : { // 其余属性默认使用全局文本样式，详见TEXTSTYLE
							color : color2s,
							fontSize : 16
						}
					},
					data : [ {
						value : gauge2_date,
						name : '年度使用'
					} ]
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			Chart_zy_Gauge2.setOption(option_zy_Gauge2);

			window.addEventListener("resize", function() {
				Chart_zy_Gauge1.resize();
				Chart_zy_Gauge2.resize();
			});
		}
		;
		/*费用类别-饼图*/
		function pie() {
			Chart_pie = echarts.init(document.getElementById('pieChart'));
			// 指定图表的配置项和数据
			optionPie = {
				tooltip : {
					trigger : 'item',
					formatter : "{a} <br/>{b}: {c} ({d}%)"
				},
				legend : {
					orient : 'vertical',
					bottom : '0%',
					right : '12%',
					itemWidth : 10,
					itemHeight : 10,
					data : [ '检查检验费', '药品费', '诊疗费', '手术费', '其他费用', '耗材费' ]
				},
				series : [ {
					name : '费用类别',
					type : 'pie',
					center : [ '35%', '55%' ],
					radius : [ '52%', '82%' ],
					avoidLabelOverlap : false,
					label : {
						normal : {
							show : false,
							position : 'center'
						},
						emphasis : {
							show : true,
							textStyle : {
								fontSize : '18',
								fontWeight : 'bold'
							}
						}
					},
					labelLine : {
						normal : {
							show : false
						}
					},
					data : [ {
						value : 232,
						name : '检查检验费',
						itemStyle : {
							normal : {
								color : '#d9608c'
							}
						}
					}, {
						value : 123,
						name : '药品费',
						itemStyle : {
							normal : {
								color : '#a8ce67'
							}
						}
					}, {
						value : 231,
						name : '诊疗费',
						itemStyle : {
							normal : {
								color : '#efb04f'
							}
						}
					}, {
						value : 231,
						name : '手术费',
						itemStyle : {
							normal : {
								color : '#ece362'
							}
						}
					},
					/* {value: 221, name: '自费金额', itemStyle: {normal: {color: '#4cb5e3'}}}, */
					{
						value : 21,
						name : '耗材费',
						itemStyle : {
							normal : {
								color : '#71659d'
							}
						}
					}, {
						value : 21,
						name : '其他费用',
						itemStyle : {
							normal : {
								color : '#4cb5e3'
							}
						}
					} ]
				} ]
			};

			// 使用刚指定的配置项和数据显示图表。
			Chart_pie.setOption(optionPie);
			window.addEventListener("resize", function() {
				Chart_pie.resize();
			});
		}
		/*费用类别-月度变换趋势-折线图*/
		function line() {
			// 基于准备好的dom，初始化echarts图表
			myChart_cost = echarts.init(document.getElementById('line'));
			optionCost = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					top : '0%',
					right : "14%",
					width : '66%',
					itemWidth : 10,
					itemHeight : 10,
					data : [ {
						name : '药品费',
						icon : 'roundRect'
					}, {
						name : '检查检验费',
						icon : 'roundRect'
					}, {
						name : '诊疗费',
						icon : 'roundRect'
					}, {
						name : '手术费',
						icon : 'roundRect'
					}, {
						name : '耗材费',
						icon : 'roundRect'
					}, {
						name : '自费金额',
						icon : 'roundRect'
					}, {
						name : '',
						textStyle : '',
						icon : ''
					}, {
						name : '药品占比',
						icon : 'roundRect'
					}, {
						name : '检查检验占比',
						icon : 'roundRect'
					}, {
						name : '诊疗占比',
						icon : 'roundRect'
					}, {
						name : '手术占比',
						icon : 'roundRect'
					}, {
						name : '耗材占比',
						icon : 'roundRect'
					}, {
						name : '自费占比',
						icon : 'roundRect'
					} ]
				},
				grid : {
					top : '28%',
					left : '2%',
					right : '2%',
					bottom : '1%',
					containLabel : true
				},
				toolbox : {
					show : true,
					left : "20%",
					top : "0%",
					feature : {
						magicType : {
							type : [ 'line', 'bar' ]
						}
					}
				},
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
							"9月", "10月", "11月", "12月" ],
					axisLabel : {
						textStyle : {
							color : '#333333'
						}
					},
					axisLine : {
						lineStyle : {
							color : '#dedede'
						}
					}
				} ],
				yAxis : [ {
					type : 'value',
					name : '金额(元)',
					boundaryGap : [ 0, 0.01 ],
					axisLine : {
						show : true,
						lineStyle : {
							color : '#666666'
						}
					},
					axisTick : {
						show : false
					},
					splitLine : {
						show : true,
						lineStyle : {
							type : 'dashed',
							color : '#dedede'
						}
					},
					axisLabel : {
						formatter : '{value}',
						textStyle : {
							color : '#999'
						}

					}
				}, {
					type : 'value',
					name : '占比',
					axisLine : {
						show : false,
						lineStyle : {
							color : '#666666'
						}
					},
					axisTick : {
						show : false
					},
					splitLine : {
						show : false
					}
				} ],
				itemStyle : {
					normal : {
						//柱形图圆角，初始化效果
						barBorderRadius : [ 10, 10, 10, 10 ]
					}
				},

				series : [ {
					name : "药品费",
					type : "line",
					itemStyle : {
						normal : {
							color : '#45C8DB'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "检查检验费",
					type : "line",
					itemStyle : {
						normal : {
							color : '#FF9948'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "诊疗费",
					type : "line",
					itemStyle : {
						normal : {
							color : '#45C8DB'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "手术费",
					type : "line",
					itemStyle : {
						normal : {
							color : '#E27AB0'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "耗材费",
					type : "line",
					itemStyle : {
						normal : {
							color : '#7A8BE2'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "自费金额",
					type : "line",
					itemStyle : {
						normal : {
							color : '#E27AB0'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "药品占比",
					type : "line",
					yAxisIndex : 1,
					itemStyle : {
						normal : {
							color : '#5FC14C'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "检查检验占比",
					type : "line",
					yAxisIndex : 1,
					itemStyle : {
						normal : {
							color : '#C085E4'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "诊疗占比",
					type : "line",
					yAxisIndex : 1,
					itemStyle : {
						normal : {
							color : '#F1082E'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "手术占比",
					type : "line",
					yAxisIndex : 1,
					itemStyle : {
						normal : {
							color : '#BFE26C'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "耗材占比",
					type : "line",
					yAxisIndex : 1,
					itemStyle : {
						normal : {
							color : '#3366CC'
						}
					},
					symbolSize : 2,
					data : []
				}, {
					name : "自费占比",
					type : "line",
					yAxisIndex : 1,
					itemStyle : {
						normal : {
							color : '#FF9900'
						}
					},
					symbolSize : 2,
					data : []
				},

				]
			};
			// 为echarts对象加载数据
			myChart_cost.setOption(optionCost);

			var triggerAction = function(action, selected) {
				legend = [];

				for (name in selected) {
					if (selected.hasOwnProperty(name)) {
						legend.push({
							name : name
						});
					}
				}
				myChart_cost.dispatchAction({
					type : action,
					batch : legend
				});
			};

			var isFirstUnSelect = function(selected) {
				var unSelectedCount = 0;

				for (name in selected) {
					if (!selected.hasOwnProperty(name)) {
						continue;
					}

					else if (selected[name] == false) {
						++unSelectedCount;
					}
				}

				return unSelectedCount == 1;
			};

			var isAllUnSelected = function(selected) {
				var selectedCount = 0;
				for (name in selected) {
					if (!selected.hasOwnProperty(name)) {
						continue;
					}

					// 所有 selected Object 里面 true 代表 selected， false 代表 unselected
					if (selected[name] == true) {
						++selectedCount;
					}
				}
				return selectedCount == 0;
			};

			myChart_cost.on('legendselectchanged', function(obj) {
				var selected = obj.selected;
				var legend = obj.name;
				// 使用 legendToggleSelect Action 会重新触发 legendselectchanged Event，导致本函数重复运行
				// 使得 无 selected 对象
				if (selected != undefined) {
					if (isFirstUnSelect(selected)) {
						triggerAction('legendToggleSelect', selected);
					} else if (isAllUnSelected(selected)) {
						triggerAction('legendSelect', selected);
					}
				}

			});

			window.addEventListener("resize", function() {
				myChart_cost.resize();
			});
		}
		/*违规分析-违规规则排序-柱状图*/
		function bar2() {
			// 柱状图2
			myChartBar_order = echarts.init(document.getElementById('bar3'));
			// 指定图表的配置项和数据
			option_order = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					right : '10%',
					top : 0,
					itemWidth : 11,
					itemHeight : 11,
					data : [ '违规单据数' ],
					selectedMode : 'single'
				},
				grid : {
					top : 54,
					left : '3%',
					right : '3%',
					bottom : '20%',
					containLabel : true
				},
				xAxis : [ {
					type : 'category',
					axisPointer : {
						type : 'shadow'
					},
					data : [ '超适应症用药', '限性别', '限儿童', '限就医方式', '重复收费', '重复取药' ],
					axisLabel: {
                        textStyle: {
                            color: '#333333',
                            fontWeight:700
                        },
                        rotate: -30,//-30度角倾斜显示
                        interval:0 
                    },
					
				} ],
				yAxis : [ {
					type : 'value',
					name : '单据数',
					boundaryGap : [ 0, 0.01 ],
					splitLine : {
						lineStyle: {
	                        type: 'dashed'
	                    }
					},
					axisLabel : {
						formatter : '{value}',
						textStyle : {
							color : '#999'
						}

					}
				} ],
				series : [ {
					name : '违规单据数',
					type : 'bar',
					itemStyle : {
						normal : {
							color : '#41AFD6',
							barBorderRadius : [ 80 ]
						}
					},
					barWidth : 12,
					barGap : 0.1,
					data : []
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChartBar_order.setOption(option_order);

			window.addEventListener("resize", function() {
				myChartBar_order.resize();
			});
		}
		;
		/*违规分析-科室违规情况-柱状图*/
		function bar3() {
			// 柱状图2
			myChartBar_depart = echarts.init(document.getElementById('bar4'));
			// 指定图表的配置项和数据
			option_depart = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					right : '10%',
					top : 0,
					itemWidth : 11,
					itemHeight : 11,
					data : [ '违规单据数' ],
					selectedMode : 'single'
				},
				grid : {
					top : 54,
					left : '3%',
					right : '3%',
					bottom : '20%',
					containLabel : true
				},
				xAxis : [ {
					type : 'category',
					axisPointer : {
						type : 'shadow'
					},
					data : [ '王刚', '郝红梅', '李芳', '李强', '王玉兰', '高宝强' ],
					axisLabel: {
                        textStyle: {
                            color: '#333333',
                            fontWeight:700
                        },
                        rotate: -30,//-30度角倾斜显示
                        interval:0 
                    },
					
				} ],
				yAxis : [ {
					type : 'value',
					name : '单据数',
					boundaryGap : [ 0, 0.01 ],
					splitLine: {
	                    lineStyle: {
	                        type: 'dashed'
	                    }
	                },
					axisLabel : {
						formatter : '{value}',
						textStyle : {
							color : '#999'
						}

					}
				} ],
				series : [ {
					name : '违规单据数',
					type : 'bar',
					itemStyle : {
						normal : {
							color : '#41AFD6',
							barBorderRadius : [ 80 ]
						}
					},
					barWidth : 12,
					barGap : 0.1,
					data : [ 50, 40, 34, 28, 21, 19 ]
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			myChartBar_depart.setOption(option_depart);

			window.addEventListener("resize", function() {
				myChartBar_depart.resize();
			});
		}
		;
		/*单项目控费-月费用月度变化趋势-折线图*/
		function line1() {
			// 基于准备好的dom，初始化echarts图表
			myChart_control_m = echarts.init(document.getElementById('line1'));
			var data1 = [ 320, 700, 670, 488, 654, 646, 935, 700, 532, 320,
					264, 433 ];
			var data2 = [ 436, 526, 640, 458, 634, 776, 535, 460, 627, 361,
					243, 743 ];
			var data3 = [ 720, 600, 570, 185, 354, 486, 635, 800, 532, 620,
					464, 633 ];
			var data4 = [ 1040, 2100, 1070, 1288, 954, 886, 1235, 1500, 1732,
					1320, 964, 1233 ];
			var data5 = [ 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000, 2000,
					2000, 2000, 2000 ];
			option = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					top : '3%',
					right : "20%",
					width : '66%',
					itemWidth : 10,
					itemHeight : 10,
					data : [ {
						name : '阿莫西林胶囊',
						icon : 'roundRect'
					}, {
						name : '心脑康',
						icon : 'roundRect'
					}, {
						name : '人参健脾片(益气药)',
						icon : 'roundRect'
					}, {
						name : '兰索拉唑',
						icon : 'roundRect'
					}, {
						name : '月度费用限额',
						icon : 'roundRect'
					} ]
				},
				grid : {
					top : '28%',
					left : '10%',
					right : '10%',
					bottom : '1%',
					containLabel : true
				},
				toolbox : {
					show : true,
					left : "22%",
					top : "3%",
					feature : {
						magicType : {
							type : [ 'line', 'bar' ]
						}
					}
				},
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
							"9月", "10月", "11月", "12月" ],
					axisLabel : {
						textStyle : {
							color : '#333333'
						}
					},
					axisLine : {
						lineStyle : {
							color : '#dedede'
						}
					}
				} ],
				yAxis : [ {
					type : 'value',
					name : '金额(元)',
					boundaryGap : [ 0, 0.01 ],
					axisLine : {
						show : true,
						lineStyle : {
							color : '#666666'
						}
					},
					axisTick : {
						show : false
					},
					splitLine : {
						show : true,
						lineStyle : {
							type : 'dashed',
							color : '#dedede'
						}
					},
					axisLabel : {
						formatter : '{value}',
						textStyle : {
							color : '#999'
						}

					}
				} ],
				itemStyle : {
					normal : {
						//柱形图圆角，初始化效果
						barBorderRadius : [ 10, 10, 10, 10 ]
					}
				},
				series : [ {
					name : "阿莫西林胶囊",
					type : "line",
					itemStyle : {
						normal : {
							color : '#45C8DB'
						}
					},
					symbolSize : 2,
					data : data1
				}, {
					name : "心脑康",
					type : "line",
					itemStyle : {
						normal : {
							color : '#FF9948'
						}
					},
					symbolSize : 2,
					data : data2
				}, {
					name : "人参健脾片(益气药)",
					type : "line",
					itemStyle : {
						normal : {
							color : '#45C8DB'
						}
					},
					symbolSize : 2,
					data : data3
				}, {
					name : "兰索拉唑",
					type : "line",
					itemStyle : {
						normal : {
							color : '#E27AB0'
						}
					},
					symbolSize : 2,
					data : data4
				}, {
					name : "月度费用限额",
					type : "line",
					itemStyle : {
						normal : {
							color : 'red'
						}
					},
					lineStyle : {
						normal : {
							color : 'red',
							type : 'dashed'
						}
					},
					symbolSize : 2,
					data : data5
				} ]
			};
			// 为echarts对象加载数据
			myChart_control_m.setOption(option);

			var triggerAction = function(action, selected) {
				legend = [];

				for (name in selected) {
					if (selected.hasOwnProperty(name)) {
						legend.push({
							name : name
						});
					}
				}
				myChart_control_m.dispatchAction({
					type : action,
					batch : legend
				});
			};

			var isFirstUnSelect = function(selected) {
				var unSelectedCount = 0;

				for (name in selected) {
					if (!selected.hasOwnProperty(name)) {
						continue;
					}

					else if (selected[name] == false) {
						++unSelectedCount;
					}
				}

				return unSelectedCount == 1;
			};

			var isAllUnSelected = function(selected) {
				var selectedCount = 0;
				for (name in selected) {
					if (!selected.hasOwnProperty(name)) {
						continue;
					}

					// 所有 selected Object 里面 true 代表 selected， false 代表 unselected
					if (selected[name] == true) {
						++selectedCount;
					}
				}
				return selectedCount == 0;
			};

			myChart_control_m.on('legendselectchanged', function(obj) {
				var selected = obj.selected;
				var legend = obj.name;
				// 使用 legendToggleSelect Action 会重新触发 legendselectchanged Event，导致本函数重复运行
				// 使得 无 selected 对象
				if (selected != undefined) {
					if (isFirstUnSelect(selected)) {
						triggerAction('legendToggleSelect', selected);
					} else if (isAllUnSelected(selected)) {
						triggerAction('legendSelect', selected);
					}
				}

			});

			window.addEventListener("resize", function() {
				myChart_control_m.resize();
			});
		}
		/*单项目控费-人均费用月度变化趋势-折线图*/
		function line2() {
			// 基于准备好的dom，初始化echarts图表
			myChart_control_p = echarts.init(document.getElementById('line2'));
			var data1 = [ 120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33 ];
			var data2 = [ 36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73 ];
			var data3 = [ 48, 10, 70, 48, 34, 46, 35, 19, 22, 29, 44, 53 ];
			var data4 = [ 560, 400, 470, 588, 354, 286, 735, 500, 332, 120,
					564, 333 ];
			var data5 = [ 200, 200, 200, 200, 200, 200, 200, 200, 200, 200,
					200, 200 ];
			option = {
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					top : '3%',
					right : "20%",
					width : '66%',
					itemWidth : 10,
					itemHeight : 10,
					data : [ {
						name : '阿莫西林胶囊',
						icon : 'roundRect'
					}, {
						name : '心脑康',
						icon : 'roundRect'
					}, {
						name : '人参健脾片(益气药)',
						icon : 'roundRect'
					}, {
						name : '兰索拉唑',
						icon : 'roundRect'
					}, {
						name : '人均费用限额',
						icon : 'roundRect'
					} ]
				},
				grid : {
					top : '28%',
					left : '10%',
					right : '10%',
					bottom : '1%',
					containLabel : true
				},
				toolbox : {
					show : true,
					left : "20%",
					top : "3%",
					feature : {
						magicType : {
							type : [ 'line', 'bar' ]
						}
					}
				},
				xAxis : [ {
					type : 'category',
					boundaryGap : false,
					data : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月",
							"9月", "10月", "11月", "12月" ]
				} ],
				yAxis : [ {
					type : 'value',
					name : '金额(元)',
					boundaryGap : [ 0, 0.01 ],
					splitLine : {
						lineStyle : {
							type : 'dashed'
						}
					}
				} ],
				itemStyle : {
					normal : {
						//柱形图圆角，初始化效果
						barBorderRadius : [ 10, 10, 10, 10 ]
					}
				},
				series : [ {
					name : "阿莫西林胶囊",
					type : "line",
					itemStyle : {
						normal : {
							color : '#45C8DB'
						}
					},
					symbolSize : 2,
					data : data1
				}, {
					name : "心脑康",
					type : "line",
					itemStyle : {
						normal : {
							color : '#FF9948'
						}
					},
					symbolSize : 2,
					data : data2
				}, {
					name : "人参健脾片(益气药)",
					type : "line",
					itemStyle : {
						normal : {
							color : '#45C8DB'
						}
					},
					symbolSize : 2,
					data : data3
				}, {
					name : "兰索拉唑",
					type : "line",
					itemStyle : {
						normal : {
							color : '#E27AB0'
						}
					},
					symbolSize : 2,
					data : data4
				}, {
					name : "人均费用限额",
					type : "line",
					itemStyle : {
						normal : {
							color : 'red'
						}
					},
					lineStyle : {
						normal : {
							color : 'red',
							type : 'dashed'
						}
					},
					symbolSize : 2,
					data : data5
				} ]
			};
			// 为echarts对象加载数据
			myChart_control_p.setOption(option);

			var triggerAction = function(action, selected) {
				legend = [];

				for (name in selected) {
					if (selected.hasOwnProperty(name)) {
						legend.push({
							name : name
						});
					}
				}
				myChart_control_p.dispatchAction({
					type : action,
					batch : legend
				});
			};

			var isFirstUnSelect = function(selected) {
				var unSelectedCount = 0;

				for (name in selected) {
					if (!selected.hasOwnProperty(name)) {
						continue;
					}

					else if (selected[name] == false) {
						++unSelectedCount;
					}
				}

				return unSelectedCount == 1;
			};

			var isAllUnSelected = function(selected) {
				var selectedCount = 0;
				for (name in selected) {
					if (!selected.hasOwnProperty(name)) {
						continue;
					}

					// 所有 selected Object 里面 true 代表 selected， false 代表 unselected
					if (selected[name] == true) {
						++selectedCount;
					}
				}
				return selectedCount == 0;
			};

			myChart_control_p.on('legendselectchanged', function(obj) {
				var selected = obj.selected;
				var legend = obj.name;
				// 使用 legendToggleSelect Action 会重新触发 legendselectchanged Event，导致本函数重复运行
				// 使得 无 selected 对象
				if (selected != undefined) {
					if (isFirstUnSelect(selected)) {
						triggerAction('legendToggleSelect', selected);
					} else if (isAllUnSelected(selected)) {
						triggerAction('legendSelect', selected);
					}
				}

			});

			window.addEventListener("resize", function() {
				myChart_control_p.resize();
			});
		}
		/*重点监控-费用超额-柱状图*/
		function bar() {
			//柱状图
			Chart_bar_cost = echarts.init(document.getElementById('bar'));
			// 指定图表的配置项和数据
			option_bar_cost = {
				title : {
					text : '住院患者费用超额情况',
					left : 'center',
					textStyle : {
						color : '#666666',
						fontSize : 14,
						fontWeight : 500
					}
				},
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					show : false,
					right : '10%',
					top : 20,
					itemWidth : 10,
					itemHeight : 10,
					data : [ '人次' ]
				},
				grid : {
					top : 80,
					left : '3%',
					right : '3%',
					bottom : '20%',
					containLabel : true
				},
				xAxis : [ {
					type : 'category',
					nameRotate : 50,
					axisPointer : {
						type : 'shadow'
					},
					data : [],
					axisLabel: {
                        textStyle: {
                            color: '#333333',
                            fontWeight:700
                        },
                        rotate: -30,//-30度角倾斜显示
                        interval:0 
                    }
					
				} ],
				yAxis : [ {
					type : 'value',
					name : '人次',
					boundaryGap : [ 0, 0.01 ],
					
					splitLine: {
	                    lineStyle: {
	                        type: 'dashed'
	                    }
	                },
					axisLabel : {
						formatter : '{value}',
						textStyle : {
							color : '#999'
						}

					}
				} ],
				series : [ {
					name : '人次',
					type : 'bar',
					itemStyle : {
						normal : {
							color : '#41AFD6',
							barBorderRadius : [ 80 ]
						}
					},
					barWidth : 12,
					barGap : 0.1,
					data : [ 54, 23, 12, 65, 95, 37 ]
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			Chart_bar_cost.setOption(option_bar_cost);
			window.addEventListener("resize", function() {
				Chart_bar_cost.resize();
			});
		}

		/*重点监控-住院时间超长-柱状图*/
		function bar1() {
			//柱状图
			Chart_bar_time = echarts.init(document.getElementById('bar1'));
			// 指定图表的配置项和数据
			option_bar_time = {
				title : {
					text : '住院患者时间超长情况',
					left : 'center',
					textStyle : {
						color : '#666666',
						fontSize : 14,
						fontWeight : 500
					}
				},
				tooltip : {
					trigger : 'axis',
					axisPointer : { // 坐标轴指示器，坐标轴触发有效
						type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
					}
				},
				legend : {
					show : false,
					right : 10,
					top : 20,
					itemWidth : 10,
					itemHeight : 10,
					data : [ '人次' ]
				},
				grid : {
					top : 80,
					left : '3%',
					right : '3%',
					bottom : '20%',
					containLabel : true
				},
				xAxis : [ {
					type : 'category',
					nameRotate : 50,
					axisPointer : {
						type : 'shadow'
					},
					data : [],
					axisLabel: {
                        textStyle: {
                            color: '#333333',
                            fontWeight:700
                        },
                        rotate: -30,//-30度角倾斜显示
                        interval:0 
                    }
				} ],
				yAxis : [ {
					type : 'value',
					name : '人次',
					boundaryGap : [ 0, 0.01 ],
					splitLine: {
	                    lineStyle: {
	                        type: 'dashed'
	                    }
	                },
					axisLabel : {
						formatter : '{value}',
						textStyle : {
							color : '#999'
						}

					}
				} ],
				series : [ {
					name : '人次',
					type : 'bar',
					itemStyle : {
						normal : {
							color : '#41AFD6',
							barBorderRadius : [ 80 ]
						}
					},
					barWidth : 12,
					barGap : 0.1,
					data : []
				} ]
			};
			// 使用刚指定的配置项和数据显示图表。
			Chart_bar_time.setOption(option_bar_time);
			window.addEventListener("resize", function() {
				Chart_bar_time.resize();
			});
		}
		$("a,button").focus(function() {
			this.blur()
		});
	});
	
	//导出excel
	function excelExport(){
		var flag = $(".radios:checked").val();
		var url = "${path }/excel/exportDocPerformance?flag="+flag;
	    $("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
	
	// 参保类型变化
	function cblxChange(val){
		var index = $("#pageItems .on").index();
		if(index==0){
			if(val=='390'){
				$('.qy').show();
			}else{
				$('.qy').hide();
			}	
		}
	}
	
	// 点击 除科室指标外页面 隐藏 区域
	$("#pageItems").find('li').click(function () {
		var cblxbm = $("#cblxbm").val();
		if($(this).text()=='科室指标'){
			if(cblxbm=='390'){
				$('.qy').show();
			}else{
				$('.qy').hide();
			}
		}else{
			$('.qy').hide();
		}
	});
	
	// 科室指标 数据清空
	function clearTable(){
		var arr = ["RJCLF","ZYCS","ZLFZB","YBTCZF","RJFD","RJYPF","YLF","HZFD","PJZYR","RJTCZF",
		           "YLZF","SSFZB","CLFZB","WGDJS","CYRC","JCJYFZB","YPFZB","RJYLF","ZFJEZB","YLZFZB"];	
		for(var i=0;i<20;i++){
			var temp = '#'+arr[i];
			$(temp).nextAll().text('-');
			$(temp).nextAll().removeClass();
		} 
	}
	
	//违规汇总导出
	function excelExport_wghz(){
		var url = "${path }/excel/cypj_wghz";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
	//违规详情导出
	function excelExport_wghzDetails(){
		var url = "${path }/excel/cypj_wghzDetails";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
	
	
	
</script>
</body>
</html>