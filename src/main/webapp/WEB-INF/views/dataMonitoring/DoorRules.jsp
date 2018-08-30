<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <%-- <script src="${path }/static/js/jquery-1.10.1.min.js"></script> --%>
    <!-- <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/datagrid-filter.js"></script> -->
    <!-- <script src="${path }/static/extJs.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <script src="${path}/static/js/jquery.combo.select.js"></script> -->
   <!--  <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" /> -->
    <!-- <link href="${path }/static/css/common.css" rel="stylesheet"> -->
   <%--  <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> --%>
    <title>门规汇总</title>
    <!-- <script src="${staticPath }/static/js/common.js"></script> -->
    <style>
        .sf-msg-table th {
            border-top: none !important;
        }
        label {
            font-weight: 500 !important;
            height: 100%
        }

        .see-dot-msg-table td {
            width: 8%
        }

        .jb-ul-li li:nth-child(6) {
            width: 14%
        }

        .jb-ul-li li:nth-child(4) {
            width: 15.995%
        }

        p {
            margin: 0 !important;
        }

        .main-div {
            min-height:88.5%
        }

       /*  select {
           width: auto !important;
           margin-left: 0;
       } */
      /*   .ys-table tbody tr >td{
            width: 5% !important;
        } */
        .radio-table td {
            color: #2a425a;
        }

        .radio-table td:nth-child(1) {
            width: 24% !important;
            color: #666;
            white-space: nowrap;
        }
        .textarea {
            width: 99%;
            height: 120px;
            border: 1px solid #d4d4d4;
        }

        .payKe {
            vertical-align: text-bottom;
            margin-bottom: -6px !important;
            margin-right: 10px !important;
        }
        .DialogDiv2{top: 10%!important;height: 80%!important;}
        .C_hre > p {  margin-bottom: 0 !important;  line-height: 24px !important;  }
        #jbmc_sel{padding-right:20px;}
        .combo-select{display:inline-block;}
    </style>
</head>
<body>
<!--筛选条件-->
<div class="header-div bg-color margin-top6">
    <form id="dataSearchForm" method="post" class="margin-left20">
                <select id="selectYear" name="syear" style="text-align:left">
                </select>               
    	
            <span class="fs_16 pdr3p">年</span>

                <select id="selectMonth" name="smonth" style="text-align:left">
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
          
            <span class="fs_16">月</span>
             <span class="fs_16 ksAndys_hidden pdl3p">科室</span>                 
                 
                  <select id="depart" name="ksbm"></select>

                <span class="fs_16 ksAndys_hidden pdl3p">
                    医师
                </span>
                <select id="doctor" name="ysgh"></select>
                <span class=" fs_16 pdl3p">参保类型</span>
        
                    <select id="cblxbm" name="cblxbm">
                        <option value="000">全部</option>
                         <option value="390">城乡居民</option>
                         <option value="391">城镇职工</option>
                         <option value="392">省直医保</option>
                    </select>

                <span class="fs_16 hz_hid hidden pdl3p">
                    患者姓名
                </span>

                    <input class="hz_hid hidden" type="text" placeholder="输入患者姓名" size="19" style="width: 100px" name="hzxm" id="hzxm" >
            
                <div style="display:inline-block;margin-left:2%" id="search">
                     <button class="btn btn-info btn-sm " type="button" onclick="serchdata()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
                </div>

            </tr>
            </tbody>
        </table>
        <input type="hidden" name="exportData_details" id="exportData_details"/>
        <input type="hidden" name="exportData" id="exportData"/>
    </form>
</div>
<div class="bg-color main-div margin-top10">
    <div class="tab-menu-l border-bom">
        <ul class="padding-left10" id='tab1'>
            <li class="fs_16 on">门规关键指标</li>
            <li class="fs_16">门规病种统计</li>
            <li class="fs_16">门规患者监控</li>
            <li class="fs_16">违规汇总</li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="tab-div-boxs" >
            <!--门规关键指标-->
            <div class="ks-fy-zb">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="right fs_16" style="padding-right:0">
                                 <%-- <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png" >导出</button> --%>
                             </td>
                        </tr>
                    </table>
                </div>
                <div class="ScrLts">
                    <table class="body-width">
                        <tr>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/series/icon01.png"/></div>
                                    <div class="C_hre">
                                        <p id="jzrc">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">就诊人数</span>
                                            
                                        </p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon02.png"/></div>
                                    <div class="C_hre">
                                        <p id="ylf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">医疗费(元)</span>
                                            
                                        </p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon03.png"/></div>
                                    <div class="C_hre">
                                        <p id="ybtczf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">医保统筹支付(元)</span><br/>
                                        </p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon04.png"/></div>
                                    <div class="C_hre">
                                        <p id="hzfd">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">患者负担(元)</span>
                                            
                                        </p>
                                    </div>
                                </li>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon15.png"/></div>
                                    <div class="C_hre">
                                        <p id="wgdjs">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">违规单据数</span><br/>                                        
                                        </p>
                                        
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon13.png"/></div>
                                    <div class="C_hre">
                                        <p id="cjfy">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">次均费用（元）</span><br/>
                                            
                                        </p>
                                        
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon06.png"/></div>
                                    <div class="C_hre">
                                        <p id="cjyf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">次均药费（元）</span><br/>
                                            
                                        </p>
                                        
                                    </div>
                                </li>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
            </div>
            <!--门规病种统计-->
        <div style="display: none;">           
            <div class="yb-jj-div">
                <div class="padding10">
                    <div>
                        <table class="body-width">
                            <tr>                          
                                <td class="right">
                                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('bz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <!-- 在真正的datagrid前面设置一个空的datagrid,用来解决datagrid初次加载错位的问题 -->
                    <table class="body-width common-table easyui-datagrid" id="bug">
                    </table>
                    <table id="mgquotaDataGrid" class="body-width common-table easyui-datagrid" >
                        <tbody>
                        </tbody>
                    </table>        
                </div>                
            </div>                          
            <div class="clear module-hr"></div>
            <!--月度变化趋势-->
            <div class="line1">
                <div class="main-ys-fy">
                    <div class="ks-fy-zb" style="height:auto">
                        <div class="gauge-title-div margin-top21">
                            <table class=" float-right" width="100%">
                                <tr>
                                    <td class="left ">月度变化趋势</td>
                                    <td class="text-right">
                                        <table class="two-table">
                                            <tr>
                                                <td>门规类别</td>
                                                <td>
                                                    <select style="padding-right: 20px" id="btype"> 
                                                        <option value="1">I类</option>
                                                        <option value="2">II类</option>
                                                        <option value="3">III类</option>
                                                    </select>
                                                </td>
                                                <td>门规病种类型</td>
                                                <td>
                                                    <select id="jbmc_sel">
                                                        
                                                    </select>
                                                </td>
                                                <td>
                                                    <%-- <button class="btn btn-sm btn-info margin-right10"><img
                                                            src="${staticPath }/static/img/menu/btn1-icon.png">导出
                                                    </button> --%>
                                                </td>
                                            </tr>
                                        </table>

                                    </td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>

                        <div class="body-width fy-line-div">
                            <div class="fy-bar-div" id="line1">

                            </div>
                        </div>
                        <!--表格数据-->
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--门规患者监控-->
        <div style="display: none">
            <div class="yb-jj-div">
                <div class="padding10 " >
                    <div>
                        <table class="body-width">
                            <tr>
                                <td>
                                    患者列表
                                </td>
                                <td class="right fs_16 padding-top10">
                                    <button class="btn btn-sm btn-info" style="margin-bottom:4px" type="button" onclick="excelExport('hz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <table class="body-width common-table easyui-datagrid" id="mgpatientDataGrid" >
                         <tbody>
                        </tbody> 
                    </table>
                </div>
                
            </div>
        </div>
        <!--违规汇总-->
        <div style="display: none">
            <!--选项卡-->
            <div class="gauge-title-div ">
                <table class="body-width">
                    <tr>
                        <td>
                            <div class="tab-tables-l" style="padding-left: 2%">
                                <ul class="tab2s">
                                    <li class="on padding-left0 margin-left0">违规规则排序</li>
                                    <li id="doctor_depart"></li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-table-box2s">
                <!--违规规则排序-->
                <div class="ks-fy-zb">
                    <div class="body-width fy-line-div">
                        <div class="fy-bar-div" id="bar5">

                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="ks-fy-zb">
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                 <table class="body-width common-table easyui-datagrid" id="wggzOrderTable">
                                    <tbody >
                                   
                                    </tbody>
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
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                  <table class="body-width common-table easyui-datagrid" id="wgdjDocuments">
                                    <tbody>
                                    </tbody>
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
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                <table class="body-width common-table easyui-datagrid" id="mzmgdetails">
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--医师违规情况-->
                <div class="ks-fy-zb" style="display: none">
                    <div class="ks-fy-zb" style="padding-bottom: 0">
                        <div class="body-width fy-line-div">
                            <div class="fy-bar-div" id="bar6">

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!--科室违规-->
                    <div class="ks-fy-zb ks-tables">
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                <table class="common-table easyui-datagrid"  id="wgdepartOrderTable">
                                    <tbody >
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                    <!--违规单据  科室-->
                    <div class="ks-fy-zb ks-nm-div" style="display: none">
                        <div class="gauge-title-div">
                            <table class="body-width" >
                                <tr>
                                    <td class="left fs_16 table-title">违规单据汇总</td>
                                    <td class="right">
                                    	<button class="btn btn-sm btn-info" type="button" onclick="excelExport_wghz()"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                	</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                <table class="body-width common-table easyui-datagrid" id="wgdjDocuments_dapart">
                                    <tbody>
                                    
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
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                <table class="body-width common-table easyui-datagrid" id="mgdetails_depart">
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
<!--弹出层-->
<div class="BgDiv3"></div>
<div class="DialogDiv3" style="display: none;width:1150px;">
    <div class="pop-up bg-color1">
        <table class="body-width">
            <tr>
                <td class="text-right padding-right20">
                    <img src="${staticPath }/static/img/close.png" id="closes">
                </td>
            </tr>
        </table>
    </div>
    <div class="tab-table-boxs">
        <!--门规病种统计-->
            <div class="ks-fy-zb ks-nm-div">
                <div class="gauge-title-div" >
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">违规单据汇总</td>
                        </tr>
                    </table>
                </div>
                <div class="body-width padding10 pad-top0">
                    <div class="ys-rc-div" style="height: auto;width: auto;">
                        <table class="body-width common-table easyui-datagrid" id="mzViolationsDocuments">
                            <tbody>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <!--违规信息-->
            <div class="ks-fy-zb ks-nm-div-name-div" style="display: none">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">违规详情</td>
                        </tr>
                    </table>
                </div>
                <div class="body-width padding10 pad-top0">
                    <div class="ys-rc-div" style="height: auto;width: auto;margin-top: 10px;">
                        <table class="body-width common-table easyui-datagrid" id="mzViolationdetails">
                            <tbody>
                            
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
    </div>
</div>

<!--增加-弹出层-->
<div class="BgDiv2"></div>
<div class="DialogDiv2" style="display: none; height:500px;">
    <div class="pop-up bg-color1">
        <table class="body-width">
            <tr>
                <td class="text-left"><span class="padding-left10 width-color fs_16">患者视图</span></td>
                <td class="text-right padding-right20">
                    <img src="${staticPath }/static/img/close.png" id="closes1">
                </td>
            </tr>
        </table>
    </div>
    <div class="body-width margin-top10" style="padding: 10px">
        <div class="hz-msg-div padding10">
            <div class="float" style="margin-left: 2%; padding-top: 40px;width: 10%">
                <table>
                    <tr>
                        <td class="hz-img" style="padding-top: 0px">
                            <img src="${staticPath }/static/img/bianshi/Op.png" /><br>
                            <span class="fs_16 name"></span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="float" style="padding-top: 70px;width: 30%">
                <table>
                    <tr>
                        <td ><span>性别：</span><font class="sex"></font></td>
                    </tr>
                    <tr>
                        <td><span>年龄(岁)：</span><font class="age"></font></td>
                    </tr>
                    <tr>
                        <td><span>身份证号：</span> <font class="sfzhm"></font></td>
                    </tr>

                    <tr>
                        <td><span>门规病种类型：</span><font class="zdmc"></font></td>
                    </tr>
                </table>
            </div>
            <div  style="padding-top: 30px;width: 50%;float:  right;" >
                <table style="margin: 0 auto">
                    <tr>
                        <td>
                            <div id="bar1" style="height: 100px;min-width: 300px"></div>
                            <div id="bar2" style="height: 100px;min-width: 300px"></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div  class="hz-msg-div" style="margin-left: 1%;width: 39%">
            <table class="zy-table body-width common-table" style="width: 100%">
                <tbody>
                <tr class="th-bg">
                    <th>分析指标(本月)</th>
                    <th>实际值</th>
                    <th>限定值</th>
                </tr>
                <tr>
                    <td>就诊次数</td>
                    <td class="right" id="jzcs">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>医疗费(元)</td>
                    <td class="right" id="zfy">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>医保内金额(元)</td>
                    <td class="right" id="ybtczff">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>药品费(元)</td>
                    <td class="right" id="ypf">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>次均费用(元)</td>
                    <td class="right warning1" id="cjfy1">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>次均药费(元)</td>
                    <td class="right" id="cjyf1">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>违规次数</td>
                    <td class="right" id="wgcs">-</td>
                    <td class="right">-</td>
                </tr>
                <tr>
                    <td>目录外金额</td>
                    <td class="right" id="mlwje">-</td>
                    <td class="right">-</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!--月度指标趋势-->
    <div class="clear"></div>
    <div class="ks-fy-zb margin-top10" style="height: 380px">
        <div class="gauge-title-div">
            <table class="body-width">
                <tr>
                    <td class="left fs_16 table-title">月度指标趋势</td>
                    <td class="right fs_16">
                        <%-- <button class="btn btn-info btn-sm"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                    </td>
                </tr>
            </table>
        </div>
        <div id="num3">
            <div id="line">

            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!--就诊记录-->
    <div class="ks-fy-zb" style="height: 130px;">
        <div class="gauge-title-div ">
            <table class="body-width">
                <tr>
                    <td class="left fs_16 table-title">就诊记录</td>
                    <td class="right fs_16">
                        <button class="btn btn-info btn-sm" type="button" onclick="excelExport('jz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                    </td>
                </tr>
            </table>
        </div>
        <div class="body-width padding10 padding-top0">
            <div class="ys-rc-div" style="height: auto;width: auto;">
                <table class="body-width common-table easyui-datagrid" id="medicalRecords">
                    <tbody>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <!--处方明细-->
    <div class="ks-fy-zb recipe-div" style="height: auto;margin-top: 120px;display: none">
        <div class="gauge-title-div ">
            <table class="body-width">
                <tr>
                    <td class="left fs_16 table-title">处方明细</td>
                    <td class="right fs_16">
                        <%-- <button class="btn btn-info btn-sm"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="body-width padding10 padding-top0">
            <div class="ys-rc-div" style="height: auto;width: auto;">
                <table class="body-width common-table easyui-datagrid" id="prescription">
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>

    <!--收费明细-->
    <div class="ks-fy-zb cost_div" style="height: 290px;margin-top: 120px;display: none">
        <div class="gauge-title-div ">
            <table class="body-width">
                <tr>
                    <td class="left fs_16 table-title">收费明细</td>
                    <td class="right fs_16">
                        <%-- <button class="btn btn-info btn-sm"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                    </td>
                </tr>
            </table>
        </div>
        <div class="body-width padding10 padding-top0">
            <div class="ys-rc-div" style="height: auto;width: auto;">
                <table class="body-width common-table easyui-datagrid" id="charges">
                    <tbody>
                    
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/extJs.js"></script>
<script src="${path }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script type="text/javascript">
var x_data1;//病种类型
var bar_data;//病种人次
var Chart_bar1;//柱状图1
var Chart_radar;//雷达图
var Chart_bar2;//柱状图2
var myChartBar;//违规规则排序-柱状图
var myChartBar1;//违规科室-柱状图
var Chart_bar1_hz;//患者柱状图
var Chart_bar2_hz;//
var Chart_line_hz;//月度指标趋势
var model={
    echartsData:"",
    params:{
        gzbm:""
    },
    //url
    urls:[
            '${path }/mgquota/mgquotaDataGrid',  //门规病种统计 0
            '${path }/costStruct/SelectCostStruct?methodFlag=mgPatientDataGrid', //门规患者监控 1
            '${path }/mgquota/mgViolationsDocumentsBZ', //门规病种统计-违规单据汇总(弹窗) 2
            '${path }/mgquota/mzmgdetails', //门规病种统计-违规单据汇总(弹窗)-违规详情/违规汇总-违规规则排序-违规单据汇总-违规详情/违规汇总-科室违规情况-违规单据汇总-违规详情 3
            '${path }/mgquota/wggzOrderTable', //违规汇总-违规规则排序 4
            '${path }/mgquota/mgViolationsDocuments',  //违规汇总-违规规则排序-违规单据汇总 5
            '${path }/mgquota/wgdepartOrderTable', //违规汇总-科室违规情况 6
            '${path }/mgquota/mgViolationsDocumentsDepart', //违规汇总-科室违规情况-违规单据汇总/违规汇总-医师违规情况-违规单据汇总 7
            '${path }/mgquota/mgwgDoctorOrderTable', //违规汇总-医师违规情况 8
            '${path }/costStruct/SelectCostStruct?methodFlag=medicalRecords', //门规患者监控-就诊记录 9
            '${path }/costStruct/SelectCostStruct'  //门规患者监控-就诊记录-处方明细/收费明细 10
        ], 
    //列
    cols:[
        //门规病种统计
        [[{width : '15%',title : '门诊病种类型',field : 'mzbzlx' },
            {width : '10%',title : '登记例数',field : 'hzls'}, 
            {width : '10%',title : '就诊人数',field : 'jzrs'}, 
            {width : '10%',title : '就诊人次',field : 'jzrc'}, 
            {width : '10%',title : '医疗费',field : 'ylf'},
            {width : '10%',title : '医保内金额(元)',field : 'ybnje'},
            {width : '10%',title : '月度超额人次',field : 'ydcerc'},
            {width : '10%',title : '月度超额人数',field : 'ydcers'},
            {width : '10%',title : '违规单据数',field : 'wgdjs',
                formatter: function (value, rowData, rowIndex) {       
                    return "<a  href='javascript:void(0);' onclick=mgViolationsDocuments('"+rowData.mzbzlx+"')>" + value + "</a>";
                }
            }, 
            {width : '10%',title : '次均费用',field : 'cjfy'},
            {width : '10%',title : '次均药费',field : 'cjyf'}, 
            {width : '10%',title : '次均检查检验费',field : 'cjjcjyf'}]],  
        //门规患者监控
        [[
            {width : '15%',title : '身份证号',field : 'SFZHM',
                formatter: function (value, rowData, rowIndex) {       
                  return "<a   href='javascript:void(0)'; onclick=getPatient('"+rowData.SFZHM+"','"+rowData.JZRQ+"');>" + value + "</a>";                 
                }
            },
            {width : '8%',title : '患者姓名',field : 'HZXM'}, 
            {width : '6%',title : '年龄',field : 'NL'},
            {width : '10%', title : '参保类型', field : 'CBLX',
                formatter: function (value, rowData, rowIndex) {       
                    switch (value) {
                       case 390:
                           return '城乡居民';
                       case 391:
                           return '城镇职工';
                       case 392:
                           return '省直医保';
                       default:
                        return '-';
                    }
                }
            }, 
            {width : '23%',title : '门规病种类型',field : 'JBMC',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            },
            {width : '8%',title : '就诊次数',field : 'JZCS'},
            {width : '8%',title : '违规次数',field : 'WGCS'},
            {width : '8%',title : '医疗费',field : 'YLF'},
            {width : '10%',title : '医保内金额(元)',field : 'YBNJE'},
            {width : '',field : 'XB',hidden:true},
            {width : '',field : 'MZLSH',hidden:true}]],
        //门规病种统计-违规单据汇总(弹窗)
        [[{width : '10%',title : '就诊日期',field : 'jzrq' },
            {width : '18%',title : '身份证号',field : 'sfzhm',
                formatter: function (value, rowData, rowIndex) {       
                 return "<a   href='javascript:void(0);' onclick=mgViolationdetails('"+rowData.mzlsh+"','" + rowData.jbmc + "');>" + value + "</a>";
                }
            },  
            {width : '10%',title : '患者姓名',field : 'hzxm'}, 
            {width : '10%',title : '年龄',field : 'nl'},  
            {width : '10%',title : '参保类型',field : 'cblx',
                formatter: function (value, rowData, rowIndex) {       
                    switch (value) {
                    case 390:
                        return '城乡居民';
                    case 391:
                        return '城镇职工';
                    case 392:
                        return '省直医保';
                    default:
                        return '-';
                    }
                }
            }, 
            {width : '15%',title : '门规病种类型',field : 'jbmc',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            },
            {width : '15%',title : '整单违反规则',field : 'ifzdwg'},
            {width : '10%',title : '开立原因',field : 'klyy',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>"; 
                    } 
                }   
            },
            {width : '10%',title : '科室',field : 'ksmc'}, 
            {width : '10%',title : '医师',field : 'ysxm'}, 
            {width : '10%',title : '医疗费(元)',field : 'ylf'}, 
            {width : '10%',title : '医保内金额(元)',field : 'ybnje'},
            {width : '',field : 'mzlsh',hidden:true}]],
        //门规病种统计-违规单据汇总(弹窗)-违规详情/违规汇总-违规规则排序-违规单据汇总-违规详情/违规汇总-科室违规情况-违规单据汇总-违规详情
        [[{width : '10%',title : '日期',field : 'rq'},
            {width : '10%',title : '时间',field : 'sj'},
            {width : '10%',title : '项目编码',field :'xmbm'},
            {width : '10%',title : '项目名称',field : 'xmmc',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
     
            } , 
            {width : '10%',title : '违反规则',field : 'wfgz',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            }, 
            {width : '10%',title : '提示说明',field : 'tssm',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            }, 
            {width : '10%',title : '科室',field : 'ksmc'},
            {width : '10%',title : '医师',field : 'ysxm'}, 
            {width : '10%',title : '规格',field : 'ypgg'}, 
            {width : '10%',title : '单位',field : 'dw'}, 
            {width : '10%',title : '用法',field : 'yf'},
            {width : '10%',title : '用量',field : 'yl'}, 
            {width : '10%',title : '单价(元)',field : 'dj'},
            {width : '10%',title : '数量',field : 'sl'}, 
            {width : '10%',title : '金额(元)',field : 'je'}, 
            {width : '10%',title : '医保内金额(元)',field : 'ybnje'}] ],    
        //违规汇总-违规规则排序
        [ [{width : '50%',title : '违规规则',field : 'gzmc'},  
            {width : '50%',title : '违规单据数',field : 'wgdjs',
                formatter: function (value, rowData, rowIndex) {       
                    return "<a style='color:green' href='javascript:void(0);' onclick=wgdjDocuments('" + rowData.gzbm + "');>" + value + "</a>";
                }
            },  
            { hidden:true,field :'gzbm'}] ],
        //违规汇总-违规规则排序-违规单据汇总/违规汇总-医师违规情况-违规单据汇总
        [ [{width : '15%',title : '就诊日期',field : 'jzrq'},
            {width : '15%',title : '身份证号',field : 'sfzhm'},  
            {width : '10%',title : '患者姓名',field : 'hzxm',
                formatter: function (value, rowData, rowIndex) {   
                     return "<a style='color:green' href='javascript:void(0);' onclick=mzmgdetails('"+rowData.mzlsh+"','"+model.params.gzbm+"');>" + value + "</a>";

                }
            }, 
            {width : '10%',title : '年龄',field : 'nl'},
            {width : '10%',title : '参保类型',field : 'cblx'} , 
            {width : '10%',title : '科室',field : 'ksmc'}, 
            {width : '10%',title : '医师',field : 'ysxm'}, 
            {width : '15%',title : '门规病种类型',field : 'jbmc'}, 
            {width : '10%',title : '开立原因',field : 'klyy',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            },
            {width : '10%',title : '医疗费(元)',field : 'ylf'}, 
            {width : '10%',title : '医保内金额(元)',field : 'ybnje'},
            {hidden : true,field : 'mzlsh'}] ],
        //违规汇总-科室违规情况
        [ [{width : '50%',title : '科室名称',field : 'ksmc'},
            {width : '50%',title : '违规单据数',field : 'wgdjs',
                formatter: function (value, rowData, rowIndex) {       
                     return "<a style='color:green' href='javascript:void(0);' onclick=mzwgdjDocuments_dapart('" + rowData.ksbm + "');>"    + value + "</a>";;
                }
            } ,
            {hidden:true,field : 'ksbm'}] ],  
        //违规汇总-科室违规情况-违规单据汇总     
        [ [{width : '13%',title : '就诊日期',field : 'jzrq' },
            {width : '15%',title : '身份证号',field : 'sfzhm'},  
            {width : '10%',title : '患者姓名',field : 'hzxm',
                formatter: function (value, rowData, rowIndex) {       
                    return "<a style='color:green' href='javascript:void(0);' onclick=mgdetails_depart('"+rowData.mzlsh+"','"+model.params.gzbm+"');>" +      value + "</a>";;
                }
            }, 
            {width : '10%',title : '参保类型',field : 'cblx'} , 
            {width : '10%',title : '科室',field : 'ksmc'}, 
            {width : '10%',title : '医师',field : 'ysxm'}, 
            {width : '15%',title : '门规病种类型',field : 'jbmc'},
            {width : '15%',title : '整单违反规则',field : 'ifzdwg'}, 
            {width : '10%',title : '开立原因',field : 'klyy',
                formatter: function (value){
                   if(value==null){
                       return '-'; 
                   }else{
                       return "<span title='" + value + "'>" + value + "</span>" 
                   }
                }
            }, 
            {width : '10%',title : '医疗费(元)',field : 'ylf'}, 
            {width : '10%',title : '医保内金额(元)',field : 'ybnje'}, 
            {width : '',hidden : true,field : 'mzlsh'}] ],
        //违规汇总-医师违规情况
        [ [{width : '50%',title : '医师名称',field : 'ysxm'},  
            {width : '50%',title : '违规单据数',field : 'wgdjs',
                formatter: function (value, rowData, rowIndex) {       
                     return "<a style='color:green' href='javascript:void(0);' onclick=mgwgdjDocuments_doctor('" + rowData.ysbm + "');>"     + value + "</a>";
                }
            } ,
            {width : '',hidden:true,field : 'ysbm'}] ],
        //门规患者监控-就诊记录
        [ [{width : '10%',   field : 'MZLSH',title : '门诊流水号',checkbox:true },
            {width : '10%',title : '就诊日期',field : 'JZRQ'},
            {width : '10%',title : '科室',field : 'KSMC'},
            {width : '10%',title : '医师',field : 'YSXM'},
            {width : '10%',title : '医疗费',field : 'YLF'},
            {width : '10%',title : '医保内金额(元)',field : 'YBNJE'},
            {width : '10%',title : '目录外费用',field : 'MLWJE'},
            {width : '10%',title : '药品费(元)',field : 'YFZE'},
            {width : '10%',title : '诊疗费(元)',field : 'ZLF'},
            {width : '10%',title : '违规状态',field : 'WGZT'},
            {width : '10%',title : '明细',field : 'MX',
                formatter: function (value, rowData, rowIndex) {       
                    return "<a href='javascript:void(0);' class='recipe' onclick=prescription('"+rowData.MZLSH+"')>处方</a>/<a href='javascript:void(0);' class='cost' onclick=charges('"+    rowData.MZLSH+"')>收费</a>";
                }
            }] ],
        //门规患者监控-就诊记录-处方明细
        [ [{width : '10%',title : '项目编码',field : 'XMBM'},
            {width : '10%',title : '项目名称',field : 'XMMC',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            },
            {width : '10%',title : '违规规则',field : 'WFGZ'},            
            {width : '10%',title : '提示说明',field : 'TSSM',
                formatter: function (value){
                    if(value==null){
                        return '-'; 
                    }else{
                        return "<span title='" + value + "'>" + value + "</span>" 
                    }
                }
            },
            {width : '10%',title : '违规金额(元)',field : 'WGJE'},
            {width : '10%',title : '科室',field : 'KS'},
            {width : '150',title : '医师',field : 'YS'},
            {width : '150',title : '规格',field : 'GG'},
            {width : '150',title : '单位',field : 'DW'},
            {width : '10%',title : '用法',field : 'YF'},
            {width : '10%',title : '用量',field : 'YL'},
            {width : '150',title : '单价',field : 'DJ'}, 
            {width : '10%',title : '数量',field : 'SL'},
            {width : '10%',title : '金额(元)',field : 'JE'},
            {width : '150',title : '医保内金额(元)',field : 'YBNJE'}]],    
         //门规患者监控-就诊记录-收费明细    
        [ [{width : '10%',title : '项目编码',field : 'XMBM'},
            {width : '20%',title : '医院项目名称',field : 'XMMC'},
            {width : '20%',title : '数量',field : 'SL'},
            {width : '20%',title : '金额(元)',field : 'JE'},
            {width : '20%',title : '医保内金额(元)',field : 'YBNJE'},
            {width : '10%',title : '执行科室',field : 'KS'}]],
    ]
}

$(function() {
    getQueryData(); 
    selectRender("${path}/department/getDepartmentOfUser?kslx=mzsy","#depart",{});
    var ksbm = $("#depart").val();
    selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor",{});
    $("#depart").change(function(){        
        var ksbm=$(this).val();
        selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor",{});
        if($("#tab1>.on").index()==3&&$(".tab2s>.on").index()==1){
            ifDepartDoctor();
        }
    });
    $('#selectMonth,#selectYear,#cblxbm,#depart').comboSelect();
    $("#selectYear").parent().css({"width":"8%"});
    $("#selectMonth").parent().css({"width":"6%"});
    $("#cblxbm").parent().css({"width":"10%"});
    $("#depart,#doctor").parent().addClass("ksAndys_hidden");
    departZB();
    //门规类别下拉框改变
    $("#btype").change(function(){
        getbzmc();
        findmonthcostofMg();
    });
    //门规病种类型下拉框改变
    $("#jbmc_sel").change(function(){
        findmonthcostofMg();
    });
    //选项卡
    $("#tab1 li").click(function () {
            hiddenFrame();
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-div-boxs > div").eq(index).css("display", "block").siblings().css("display", "none");
             if(index == 0){
                $(".hz_hid").addClass("hidden").parents("table").css({"width":"85%"});
                $("#search").css({"padding-right":"0"});               
                $('.ksAndys_hidden').css({"display":"inline-block"});
                departZB();
            } else if(index == 1){
                $(".hz_hid").addClass("hidden").parents("table").css({"width":"85%"});
                $("#search").css({"padding-right":"0"});
                $('.ksAndys_hidden').css({"display":"inline-block"});
                findmonthcostofMg();
                getbzmc();
                getmgquotaDataGrid();                                                             
            } else if(index == 2){
                $(".hz_hid").removeClass("hidden").parents("table").css({"width":"100%"});
                $("#search").css({"padding-right":"20px"});
                $('.ksAndys_hidden').css({"display":"none"});
                getmgpatientDataGrid();
            } else if(index == 3){
                $(".hz_hid").addClass("hidden").parents("table").css({"width":"85%"});
                $("#search").css({"padding-right":"0"});
                $('.ksAndys_hidden').css({"display":"inline-block"});
                $(".tab2s li").eq(0).trigger('click');
                wgDocuments();
            }
    }); 
    //违规汇总
    $(".tab2s li").click(function () {
            hiddenFrame();
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-table-box2s > div").eq(index).css("display", "block").siblings().css("display", "none");
            if (index == 0) {
                bar2();
               wggzOrderTable();
                $(".ks-nm-div").css("display","none");
                $(".ks-nm-div-name-div").css("display","none");
            }
            else if (index == 1){
                //bar3();
                //wgdepartOrder();
                ifDepartDoctor();
                $(".nm-div").css("display","none");
                $(".nm-div-name-div").css("display","none");
            }
    });
     /*弹出框*/
    $(".BgDiv3,#closes").click(function () {
        $(".BgDiv3").css("display", "none");
        $(".DialogDiv3").css("display", "none");
        $(".ks-nm-div-name-div").css("display","none");
    });      
    $(".BgDiv2,#closes1").click(function () {
        $(".BgDiv2").css("display", "none");
        $(".DialogDiv2").css("display", "none");
    });
    /*处方点击事件*/
    $(".recipe").click(function () {
        $(".recipe-div").css("display", "block");
        $(".cost_div").css("display", "none");
    });
    /*费用点击事件*/
    $(".cost").click(function () {
        $(".cost_div").css("display", "block");
        $(".recipe-div").css("display", "none");
    });
    $("a,button").focus(function () {
        this.blur()
    });
});
//下拉框渲染
function selectRender(url,id,datas){
    $.ajax({
        type:"POST",
        url:url,
        cache:false,
        async:false,
        dataType:"json",
        data:datas,
        success:function(data){
            var str="";
            if(id=="#depart"){
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].ksdm+"'>"+data[i].ksmc+"</option>";
                }  
                $(id).empty().append($(str));             
            }else if(id=="#doctor"){
                for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].gh+"'>"+data[i].xm+"</option>";
                }
                $(id).empty().append($(str));
                $(id).comboSelect();
                $(id).parent().css({"width":"8%"});
            }                        
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
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
//datagrid-门规病种统计/门规患者监控
function datagridRender(id,url,col,params){
    $(id).datagrid({
        url:url,
        fit:false,
        striped:false,
        queryParams:params,
        pagination : true,
        rownumbers:true,
        singleSelect : true,
        //checkOnSelect:true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns:col,
        onBeforeLoad: function (param) {
            updateDatagridHeader(this);
            changeRowHeader(this); 
        },
        onLoadSuccess:function(data){
            window.onresize=function(){                            
                $(id).datagrid('resize');//列表随屏幕大小变化
            };
            if(id.indexOf("Document")>0){
            	$("#exportData").val(JSON.stringify(params));
            }
            if(id.indexOf("details")>0){
            	$("#exportData_details").val(JSON.stringify(params));
            }
        }
    })
}
//门规病种统计
function getmgquotaDataGrid(){
    datagridRender("#mgquotaDataGrid",model.urls[0],model.cols[0],$("#dataSearchForm").serializeObject());
}
//门规病种统计-违规单据汇总(弹窗)
function mgViolationsDocuments(mzbzlx) {
    /* $(".DialogDiv3").css("top", "15%");
     $(".DialogDiv3").css("display", "block");*/
     $(".DialogDiv3").css({"top":"15%","display":"block"});
     $(".ks-nm-div").css("display","block");
     datagridRender("#mzViolationsDocuments",model.urls[2],model.cols[2],$.extend($("#dataSearchForm").serializeObject(),{bzmc:mzbzlx}));
}
//门规病种统计-违规单据汇总(弹窗)-违规详情
function mgViolationdetails(mzlsh) {
    $(".ks-nm-div-name-div").css("display","block");
    var cblxbm=$('#cblxbm').val();
    var ksbm=$("#depart").val();
    var ysgh=$("#doctor").val();
    datagridRender("#mzViolationdetails",model.urls[3],model.cols[3],{mzlsh:mzlsh});
}
//门规患者监控
function getmgpatientDataGrid(){
    datagridRender("#mgpatientDataGrid",model.urls[1],model.cols[1],$("#dataSearchForm").serializeObject());
}
// 门规患者监控-就诊记录
function medicalRecords(sfzhm,jzrq){
    datagridRender("#medicalRecords",model.urls[9],model.cols[9],{ 
            sfzhm:sfzhm,
            syearmonthday:jzrq})
}
//门规关键指标
function departZB() {   
    $.ajax({
        type: "POST",
        url:"${path }/mgquota/mgquotadepartZB",
        cache: false,
        async : false,
        dataType: "json",   
        data:$('#dataSearchForm').serialize(),  //form表单
        success:function(data){         
             $("#jzrc,#ylf,#ybtczf,#wgdjs,#hzfd,#cjfy,#cjyf").text("0");
            if(data!=""&&JSON.stringify(data) != "{}"){
                var shuju=data[0];
                if(typeof(shuju.jzrc)!='undefined'){
                $('#jzrc').html(shuju.jzrc);
                }
                if(typeof(shuju.ylf)!='undefined'){
                $('#ylf').html(shuju.ylf);
                }
                if(typeof(shuju.ybtczf)!='undefined'){
                $('#ybtczf').html(shuju.ybtczf);
                }
                if(typeof(shuju.wgdjs)!='undefined'){
                $('#wgdjs').html(shuju.wgdjs);
                }               
                if(typeof(shuju.hzfd)!='undefined'){
                $('#hzfd').html(shuju.hzfd);
                } 
                if(typeof(shuju.cjfy)!='undefined'){
                $('#cjfy').html(shuju.cjfy);
                } 
                if(typeof(shuju.cjyf)!='undefined'){
                $('#cjyf').html(shuju.cjyf);
                } 
                
            }
        }        
    });
}
//门规病种统计-门规病种类型(下拉框) 
function getbzmc(){
    var btype=$("#btype").val();
    $.ajax({
          type:"POST",                      //请求类型
          url:'${path }/mglimit/getJbmcByfl', //URL
          data:{fl:btype},   //传递的参数
          dataType:"json",                 //返回的数据类型
          success:function(data){
              $("#jbmc_sel").empty();
              for(var i=0;i<data.length;i++){
                  var op='<option>'+data[i].jbmc+'</option>'
                  $("#jbmc_sel").append(op);
              }
          },
          error:function(data) {
          }
    });
}
//ajax请求获取数据
function ajaxData(url,params){
    $.ajax({
        type:"POST",
        url:url,
        cache:false,
        async:false,
        dataType:"json",
        data:params,
        success:function(data){
            model.echartsData=data;
        },
        error:function(){

        }
    })
}

function getQueryData(){
    //  年份下拉选项 往回倒推三年
    var date = new Date();
    var syy= date.getFullYear();
    for(var sy=0;sy<3;sy++){        
        $('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
    }   
    var month=date.getMonth()+1
    month=month<10?"0"+month:String(month); 
    $('#selectMonth').val(month);
}
//违规汇总-违规规则排序
function wggzOrderTable(){
    datagridRender('#wggzOrderTable',model.urls[4],model.cols[4],$("#dataSearchForm").serializeObject());
}
//违规汇总-违规规则排序-违规单据汇总
function wgdjDocuments(gzbm) {
    $(".nm-div").css("display","block");
    $(".nm-div-name-div").css("display","none");
    model.params.gzbm=gzbm;
    datagridRender('#wgdjDocuments',model.urls[5],model.cols[5],$.extend($("#dataSearchForm").serializeObject(),{gzbm:gzbm}));
}
//违规汇总-违规规则排序/规则违规-违规单据汇总-违规详情
function mzmgdetails(mzlsh,gzbm) {
    $(".nm-div-name-div").css("display","block");
    datagridRender('#mzmgdetails',model.urls[3],model.cols[3],{mzlsh:mzlsh,gzbm:gzbm});
}


//违规汇总-科室违规情况
function wgdepartOrderTable() {
    datagridRender('#wgdepartOrderTable',model.urls[6],model.cols[6],{syear:$('#selectYear').val(),
        smonth:$('#selectMonth').val(),
        cblxbm:$('#cblxbm').val()});
}
//违规汇总-医师违规情况
function mgwgDoctorOrderTable() {
    datagridRender('#wgdepartOrderTable',model.urls[8],model.cols[8],$("#dataSearchForm").serializeObject());
}

//违规汇总-医师违规情况-违规单据汇总 
function mgwgdjDocuments_doctor(ysgh) {
    $(".ks-nm-div-name-div").css("display","none");
     $(".ks-nm-div").css("display","block");
     model.params.gzbm=ysgh;
     datagridRender('#wgdjDocuments_dapart',model.urls[7],model.cols[7],{  syear:$('#selectYear').val(),
        smonth:$('#selectMonth').val(),
        cblxbm:$('#cblxbm').val(),
        ysgh:ysgh});
} 

//违规汇总-科室违规情况-违规单据汇总
function mzwgdjDocuments_dapart(ksbm) {
    $(".ks-nm-div-name-div").css("display","none");
    $(".ks-nm-div").css("display","block");
    model.params.gzbm=ksbm;
    datagridRender('#wgdjDocuments_dapart',model.urls[7],model.cols[7],{syear:$('#selectYear').val(),
        smonth:$('#selectMonth').val(),
        cblxbm:$('#cblxbm').val(),
        ksbm:ksbm});
} 

//违规汇总-科室违规情况-违规单据汇总-违规详情
function mgdetails_depart(mzlsh,gzbm) {
    $(".ks-nm-div-name-div").css("display","block");
    datagridRender('#mgdetails_depart',model.urls[3],model.cols[3],{mzlsh:mzlsh,gzbm:""});
} 

function getPatient(sfzhm,jzrq){
    $(".cost_div").css("display", "none");  
    $(".recipe-div").css("display", "none");
        $.ajax({
            url:'${path }/mgquota/selectPatient',
            data:{sfzhm:sfzhm,syearmonth:jzrq},
            success:function(data){
                data=JSON.parse(data);  
                 $(".sex").text(data.XB);
                 $(".name").text(data.NAME);
                 $(".age").text(data.AGE);
                 $(".zdmc").text(data.MZBZLX);
                 $(".sfzhm").text(data.SFZHM);
                 cumulativeMonthly(data.SFZHM,jzrq);
                 cumulativeYear(data.SFZHM);
                 analysisIndicators(data.SFZHM,jzrq);
                 monthlyIndicatorTrend(data.SFZHM,jzrq);
                 medicalRecords(data.SFZHM,jzrq);
            } 
       });
    $(".DialogDiv2").css("display", "block");
    hz_char();
}


// 月累计额
function cumulativeMonthly(sfzhm,jzrq){
    $.ajax({
        type: "POST",
        url:"${path }/mgquota/cumulativeMonthly",               
        cache: false,
        async : false,
        dataType: "json",   
        data:{"sfzhm": sfzhm,"syearmonth":jzrq},  
        success:function(data){ 
            option_bar1_hz.series[1].data[0].value=data;//需转换为数值型
            option_bar1_hz.series[0].data[0]=null;
            option_bar1_hz.series[0].markPoint.data[0].value=null;
            option_bar1_hz.series[0].markPoint.data[0].xAxis=null;
            option_bar1_hz.series[1].data[0].itemStyle.normal.color=changeColor(2,1);
            Chart_bar1_hz.setOption(option_bar1_hz);
        }
    
    }); 
}

//年累计额
function cumulativeYear(sfzhm){
    $.ajax({
        type: "POST",
        url:"${path }/mgquota/cumulativeYear",              
        cache: false,
        async : false,
        dataType: "json",   
        data:{"sfzhm": sfzhm,"syear":$('#selectYear').val()},   
        success:function(data){ 
            option_bar2_hz.series[1].data[0].value=data;
            option_bar2_hz.series[0].data[0]=null;
            option_bar2_hz.series[0].markPoint.data[0].value=null;
            option_bar2_hz.series[0].markPoint.data[0].xAxis=null;
            option_bar2_hz.series[1].data[0].itemStyle.normal.color=changeColor(2,1);
            Chart_bar2_hz.setOption(option_bar2_hz);
        }
    
    }); 
}

//分析指标
function analysisIndicators(sfzhm,jzrq){
    $.ajax({
        type: "POST",
        url:"${path }/mgquota/analysisIndicators",              
        cache: false,
        async : false,
        dataType: "json",   
        data:{"sfzhm": sfzhm,"syearmonth":jzrq},  
        success:function(data){
            $("#jzcs").text(data.JZRC);
            $("#zfy").text(data.ZFY);
            $("#ybtczff").text(data.YBNJE);
            $("#ypf").text(data.YF);
            $("#cjfy1").text(data.CJFY);
            $("#cjyf1").text(data.CJYF);
            $("#wgcs").text(data.WGCS);
            $("#mlwje").text(data.MLWJE);
        }
    
    }); 
}

// 月度变化趋势--门规患者
function monthlyIndicatorTrend(sfzhm,jzrq) {    
    $.ajax({
        type: "POST",
        url:"${path }/costStruct/selectEcharsData?methodFlag=monthlyIndicatorTrend",
        cache: false,
        async : false,
        dataType: "json",   
        data:{"sfzhm": sfzhm,"syear":$('#selectYear').val()},  
        success:function(data){
            if(JSON.stringify(data) == "{}"){
            option_line_hz.series[0].data=[0];
            option_line_hz.series[1].data=[0];
            option_line_hz.series[2].data=[0];
            option_line_hz.series[3].data=[0];
            option_line_hz.series[4].data=[0];
            option_line_hz.series[5].data=[0];
            option_line_hz.series[6].data=[0];
            option_line_hz.series[7].data=[0];
            Chart_line_hz.setOption(option_line_hz);
            }else{      
                option_line_hz.series[0].data=data.monthlyIndicatorTrend_value3;
                option_line_hz.series[1].data=data.monthlyIndicatorTrend_value4;
                option_line_hz.series[2].data=data.monthlyIndicatorTrend_value5;
                option_line_hz.series[3].data=data.monthlyIndicatorTrend_value6;
                option_line_hz.series[4].data=data.monthlyIndicatorTrend_value7;
                option_line_hz.series[5].data=data.monthlyIndicatorTrend_value8;
                option_line_hz.series[6].data=data.monthlyIndicatorTrend_value1;
                option_line_hz.series[7].data=data.monthlyIndicatorTrend_value2;
                option_line_hz.xAxis[0].data = data.monthlyIndicatorTrend_value0;
                    Chart_line_hz.setOption(option_line_hz);
                }

            }
        })
    }
    
  
//门规患者监控-就诊记录-处方明细
function prescription(lsh){
        $(".cost_div").css("display", "none");  
        $(".recipe-div").css("display", "block");
        datagridRender("#prescription",model.urls[10],model.cols[10],{lsh:lsh,
                methodFlag:'getYZMXByLSH'});   
}
    
//门规患者监控-就诊记录-收费明细
function charges(lsh){
        $(".recipe-div").css("display", "none");
        $(".cost_div").css("display", "block");
        datagridRender("#charges",model.urls[10],model.cols[11],{lsh:lsh,
                methodFlag:'getFYMXByLSH'});
}   
function changeColor(x, s) {
        var mouth_s_color;
        var normal_color = "#92D050";
        var abnormal_color = "#FF0000";
        if (x > s) {
            mouth_s_color = normal_color
        } else {
            mouth_s_color = abnormal_color
        }
        return mouth_s_color;
}

function hiddenFrame(){
    $(".ks-nm-div-name-div").css("display","none");
    $(".ks-nm-div").css("display","none");
    $(".nm-div-name-div").css("display","none");
    $(".nm-div").css("display","none");
}   
function wgDocuments(){
        var index1 = $(".tab2s .on").index();
        var ksbm = $("#depart").val();
        if(ksbm==0){
            $("#doctor_depart").text("科室违规情况");
        }else {
            $("#doctor_depart").text("医师违规情况");
        }
        if(index1==0){
            bar2();
            wggzOrderTable();           
        }else if(index1==1){
            bar3();
            if(ksbm==0){
                wgdepartOrderTable();
            }else {                
                mgwgDoctorOrderTable();
            }
        } 
}    
function serchdata(){
        hiddenFrame();
        var index = $("#tab1 .on").index();
        if(index==0){
            departZB();
        }else if(index==1){
            getmgquotaDataGrid();
            //searchbzrcECharts();
            //searchbzxeECharts(); 
            getbzmc();
            findmonthcostofMg();
        }else if(index==2){
            getmgpatientDataGrid()
        }else if(index==3){
            wgDocuments();
        }
}
 // 科室违规？医师违规
function ifDepartDoctor(){
            var ksbm = $("#depart").val();
            bar3();
            if(ksbm==0){
                $("#doctor_depart").text("科室违规情况");
                wgdepartOrderTable();
            }else {
                $("#doctor_depart").text("医师违规情况");
                // mgwgDoctorOrder();
                mgwgDoctorOrderTable();
            }
}        
/*违规汇总-违规规则排序-柱状图*/
function bar2(){
            // 柱状图2
            var params=$('#dataSearchForm').serialize();
            var url="${path }/costStruct/selectEcharsData?methodFlag=wggzOrder";
            ajaxData(url,params);
            myChartBar = echarts.init(document.getElementById('bar5'));
            // 指定图表的配置项和数据
            option_bar3 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    right: '10%',
                    top: 0,
                    itemWidth:10,
                    itemHeight:10,
                    data: [ '违规单据数'],
                    selectedMode:'single'
                },
                grid: {
                    top: 54,
                    left: '3%',
                    right: '3%',
                    bottom: '25%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        axisPointer: {
                            type: 'shadow'
                        },
                        data: model.echartsData.wggzOrder_value1,
                        axisLabel: {
                            textStyle: {
                                color: '#333333',
                                fontWeight:700
                            },
                            rotate: -30,//-30度角倾斜显示
                            interval:0 
                        },
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '单据数',
                        boundaryGap: [0, 0.01],
                        splitLine: {
                            lineStyle: {
                                type: 'dashed'
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '违规单据数',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#41AFD6',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 20,
                        barGap: 0.1,
                        data: model.echartsData.wggzOrder_value0
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChartBar.setOption(option_bar3);
            window.addEventListener("resize", function () {
                myChartBar.resize();
            });
}; 
/*违规汇总-科室违规情况/医师违规情况-柱状图*/
function bar3(){
            var url="";
            var xAxisData=[];
            var seriesData=[];
            var params=$('#dataSearchForm').serialize();
            var ksbm=$("#depart").val();
            if(ksbm==0){
                url="${path }/costStruct/selectEcharsData?methodFlag=wgdepartOrder";
                ajaxData(url,params);
                xAxisData=model.echartsData.wgdepartOrder_value1;
                seriesData=model.echartsData.wgdepartOrder_value0;
            }else{
                url="${path }/costStruct/selectEcharsData?methodFlag=mgwgDoctorOrder";
                ajaxData(url,params);
                xAxisData=model.echartsData.mgwgDoctorOrder_value1;
                seriesData=model.echartsData.mgwgDoctorOrder_value0;
            }
            
            // 柱状图2
            myChartBar1 = echarts.init(document.getElementById('bar6'));
            // 指定图表的配置项和数据
            option_bar4 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    right: '10%',
                    top: 0,
                    itemWidth:10,
                    itemHeight:10,
                    data: [ '违规单据数'],
                    selectedMode:'single'
                },
                grid: {
                    top: 54,
                    left: '2%',
                    right: '3%',
                    bottom: '15%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        axisPointer: {
                            type: 'shadow'
                        },
                        data:xAxisData,
                        axisLabel: {
                            textStyle: {
                                color: '#333333',
                                fontWeight:700
                            },
                            rotate: -30,//-30度角倾斜显示
                            interval:0 
                        },
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '单据数',
                        boundaryGap: [0, 0.01],
                        splitLine: {
                            lineStyle: {
                                type: 'dashed'
                            }
                        }
                    }
                ],
                series: [
                    {
                        name: '违规单据数',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#41AFD6',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 20,
                        barGap: 0.1,
                        data: seriesData
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChartBar1.setOption(option_bar4);

            window.addEventListener("resize", function () {
                myChartBar1.resize();
            });
};
//月度变化趋势-图表
function findmonthcostofMg(){
    var jbmc=$("#jbmc_sel option:selected").text();
    var params=$.extend($("#dataSearchForm").serializeObject(),{mzjbmc:jbmc});
    var url="${path }/costStruct/selectEcharsData?methodFlag=findmonthcostofMg";
    ajaxData(url,params);
    Chart_bar2 = echarts.init(document.getElementById('line1'));
    // 指定图表的配置项和数据
    option_bar1 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    right: '30%',
                    top: 20,
                    itemWidth:10,
                    itemHeight:10,
                    data: ['就诊人次', '月度超额人次','问题单据数','次均费用', '次均药费','次均检查检验费']
                },
                grid: {
                    top: 80,
                    left: '2%',
                    right: '6%',
                    bottom: '2%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        nameRotate: 50,
                        axisPointer: {
                            type: 'shadow'
                        },
                        data:model.echartsData.findmonthcostofMg_value0,
                        axisLabel: {
                            textStyle: {
                                color: '#333333'
                            }
                        },
                        axisLine:{
                            lineStyle:{
                                color:'#dedede'}
                        }

                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        name: '金额(元)',
                        boundaryGap: [0, 0.01],
                        axisLine: {show: true,lineStyle:{color:'#666666'}},
                        axisTick: {show: false },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                type: 'dashed',
                                color:'#dedede'
                            }
                        },
                        axisLabel: {
                            formatter: '{value}',
                            textStyle: {
                                color: '#999'
                            }

                        }
                    },
                    {
                        type: 'value',
                        name: '人次',

                        axisTick: {
                            show: false
                        },
                        splitLine: {
                            show: false
                        },
                        axisLine: {show: false,lineStyle:{color:'#666666'}},
                        axisLabel: {
                            formatter: '{value}',
                            textStyle: {
                                color: '#999'
                            }

                        }
                    }
                ],
                series: [
                    {
                        name: '就诊人次',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#5ea2d7',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 12,
                        data: model.echartsData.findmonthcostofMg_value1

                    },
                    {
                        name: '月度超额人次',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#e8a839',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 12,
                        data: model.echartsData.findmonthcostofMg_value2
                    },
                    {
                        name: '次均费用',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#bb870a'
                            }
                        },
                        data: model.echartsData.findmonthcostofMg_value3
                    },
                    {
                        name: '次均药费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#1f83ff'
                            }
                        },
                        data: model.echartsData.findmonthcostofMg_value4
                    },
                    {
                        name: '次均检查检验费',
                        type: 'line',
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#bd3232'
                            }
                        },
                        barGap: 0.1,
                        data:model.echartsData.findmonthcostofMg_value5

                    },

                    {
                        name: '问题单据数',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#8ba621',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 12,
                        data:model.echartsData.findmonthcostofMg_value6
                    }
                ]
    };
    // 使用刚指定的配置项和数据显示图表。
    Chart_bar2.setOption(option_bar1);
    window.addEventListener("resize", function () {
        Chart_bar2.resize();
    });
};
/*患者视图*/
function hz_char(){
        var mouth_s_color;
        var year_s_color;
        var normal_color = "#92D050";
        var abnormal_color = "#FF0000";

        //柱状图1
        Chart_bar1_hz = echarts.init(document.getElementById('bar1'));
        var mouth_x_date;//限额
        var mouth_s_date ;//使用
        if(mouth_x_date > mouth_s_date){
            mouth_s_color = normal_color
        }
        else{
            mouth_s_color = abnormal_color
        }
        // 指定图表的配置项和数据
        option_bar1_hz = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '2%',
                right: '24%',
                bottom: '3%',
                top:'10%',
                containLabel: true
            },
            xAxis: {
                type: 'value',
                axisTick: {show: false},
                show: false
            },
            yAxis: {
                type: 'category',
                splitLine: {show: false},
                data: [{value:'月累计',textStyle:{fontSize:14}}],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                }
            },
            series: [{
                name: '限额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#E9E9E9',
                        barBorderRadius: [80]
                    }
                },
                barWidth: 12,
                barGap: '-100%', // Make series be overlap
                data: [mouth_x_date],
                markPoint : {
                    data : [
                        {name : '限额', value :mouth_x_date, xAxis: mouth_x_date},
                    ],
                    label:{
                        normal:{
                            show:true,
                            formatter: '限额:{c}元',
                            textStyle:{
                                color:"#000",
                                fontSize:14
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#C6C6C6'
                        }
                    }
                }
            }, {
                name: '实际使用',
                type: 'bar',
                barWidth: 14,
                z: 10,
                data: [{value: mouth_s_date, itemStyle: {normal: {color: mouth_s_color,barBorderRadius:80}}}
                ],
                label:{
                    normal:{
                        show:true,
                        position:'right',
                        formatter: '使用{c}元',
                        offset:[-64,20],
                        textStyle:{
                            color:mouth_s_color,
                            fontSize:14
                        }
                    }
                }
            }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_bar1_hz.setOption(option_bar1_hz);

        //柱状图2
        Chart_bar2_hz = echarts.init(document.getElementById('bar2'));
        var year_x_date = 560;
        var year_s_date = 460;
        if(year_x_date > year_s_date){
            year_s_color = normal_color
        }
        else{
            year_s_color = abnormal_color
        }
        // 指定图表的配置项和数据
        option_bar2_hz = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                right: 10,
                top: 10
            },
            grid: {
                left: '2%',
                right: '24%',
                bottom: '3%',
                top:'10%',
                containLabel: true
            },
            xAxis: {
                type: 'value',

                axisTick: {show: false},
                show: false
            },
            yAxis: {
                type: 'category',
                splitLine: {show: false},
                data: [{value:'年累计',textStyle:{fontSize:14}}],
                axisLine: {
                    show: false
                },
                axisTick: {
                    show: false
                }
            },
            series: [{
                name: '定额',
                type: 'bar',
                itemStyle: {
                    normal: {
                        color: '#E9E9E9',
                        barBorderRadius: [80]
                    }
                },
                silent: true,
                barWidth: 12,
                barGap: '-100%', // Make series be overlap
                data: [year_x_date],
                markPoint : {
                    data : [{ value : year_x_date, xAxis: year_x_date}],
                    label:{
                        normal:{
                            show:true,
                            formatter: '定额:{c}元',
                            textStyle:{
                                color:"#000",
                                fontSize:14
                            }
                        }
                    },
                    itemStyle: {
                        normal: {
                            color: '#C6C6C6'
                        }
                    }
                }
            }, {
                name: '实际使用',
                type: 'bar',
                barWidth: 14,
                z: 10,
                data: [{value: year_s_date, itemStyle: {normal: {color: year_s_color, barBorderRadius: [80]}}}
                ],
                label:{
                    normal:{
                        show:true,
                        position:'right',
                        formatter: '使用{c}元',
                        offset:[-42,20],
                        textStyle:{
                            color:year_s_color,
                            fontSize:14
                        }
                    }
                }
            }]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_bar2_hz.setOption(option_bar2_hz);
        Chart_line_hz = echarts.init(document.getElementById('line'));
        // 指定图表的配置项和数据
        option_line_hz = {
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            legend: {
                right: 10,
                top: 20,
                data: ['就诊次数', '违规次数','医疗费', '医保内金额', '药品费', '次均费用', '次均药费', '目录外金额']
            },
            grid: {
                top: 80,
                left: '2%',
                right: '2%',
                bottom: '10%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    nameRotate: 50,
                    axisPointer: {
                        type: 'shadow'
                    },
                    data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
                }
            ],
            yAxis: [
                {
                    type: 'value',
                    name: '金额(元)',
                    boundaryGap: [0, 0.01],
                    splitLine: {
                        lineStyle: {
                            type: 'dashed'
                        }
                    }
                },
                {
                    type: 'value',
                    name: '次数',
                    axisLine: {
                        lineStyle: {
                            width: 0
                        }
                    },
                    axisTick: {
                        show: false
                    },
                    splitLine: {
                        show: false
                    }
                }
            ],
            series: [
                {
                    name: '医疗费',
                    type: 'line',
                    data: [346, 185, 362, 162, 193, 373, 175]
                },
                {
                    name: '医保内金额',
                    type: 'line',
                    data: [275, 175, 283, 132, 152, 296, 139]
                },
                {
                    name: '药品费',
                    type: 'line',
                    data: [178, 132, 226, 89, 126, 264, 107]
                },
                {
                    name: '次均费用',
                    type: 'line',
                    data: [78, 32, 26, 59, 12, 64, 17]
                },
                {
                    name: '次均药费',
                    type: 'line',
                    data: [17, 32, 42, 29, 56, 12, 10]
                },
                {
                    name: '目录外金额',
                    type: 'line',
                    data: [71, 40, 79, 30, 39, 77, 36]
                },
                {
                    name: '就诊次数',
                    type: 'bar',
                    yAxisIndex: 1,
                    itemStyle: {
                        normal: {
                            color: '#037FF4',
                            barBorderRadius: [80]
                        }
                    },
                    barWidth: 12,
                    data: [5, 21, 12, 16, 8, 5,16]
                },
                {
                    name: '违规次数',
                    type: 'bar',
                    yAxisIndex: 1,
                    itemStyle: {
                        normal: {
                            color: '#FA5654',
                            barBorderRadius: [80]
                        }
                    },
                    barWidth: 12,
                    data: [1, 7, 4, 2, 1, 6,3]
                }
            ]
        };
        // 使用刚指定的配置项和数据显示图表。
        Chart_line_hz.setOption(option_line_hz);

        window.addEventListener("resize", function () {
            Chart_bar2_hz.resize();
            Chart_bar1_hz.resize();
            Chart_line_hz.resize();
        });
};

//导出excel
function excelExport(flag){
	var url;
	if(flag!='jz'){
		
		if(flag=='bz'){
			url = "${path }/excel/mgbzInfo";
		}else if(flag=='hz'){
			url = "${path }/excel/mghzInfo";
		}
	    $("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}else{
		
		var rows = $("#medicalRecords").datagrid('getSelections');
		if(rows.length==1){
			var lsh = rows[0].MZLSH;
			window.location.href = "${path }/excel/mgjzInfo?lsh="+lsh;
		}else{
			$.messager.alert('消息','请选择一条就诊记录','info');
		}
	}
}
	//违规汇总导出
	function excelExport_wghz(){
		var url = "${path }/excel/mgbz_wghz";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
	//违规详情导出
	function excelExport_wghzDetails(){
		var url = "${path }/excel/mgbz_wghzDetails";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}

</script>
</body>
</html>