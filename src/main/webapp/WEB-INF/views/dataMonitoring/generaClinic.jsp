<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <%-- <script src="${path }/static/js/jquery-1.10.1.min.js"></script> --%>
    <!-- <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/extJs.js"></script> -->
   <!--  <script src="${path }/static/js/common.js"></script>
    <script src="${path}/static/js/jquery.combo.select.js"></script> -->
   <!--  <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" /> -->
    <%-- <link href="${path }/static/css/common.css" rel="stylesheet"> --%>
    <%--  <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> --%>
    <title>普通门诊</title>
    <style>
        .ys-table tbody tr td > select {  width: auto !important;  }
        .C_hre > p {  margin-bottom: 0 !important;  line-height: 24px !important;  }
        .pop-up{height: auto!important;}
        .DialogDiv3{top: 5%!important;height: 90%!important;width: 80%!important;left: 10%!important;}
        #closes{cursor: pointer}
        .radio-table td {  color: #2a425a;  }
        .radio-table td:nth-child(1) {  width: 24% !important;  color: #666;  white-space: nowrap;  }
        label {font-weight: 500 !important;  height: 100%  }
        ul, ol {  margin-top: 2px margin-bottom : 4 px !important;  }
        .radio-table td {  color: #2a425a;  }
        .radio-table td:nth-child(1) {  width: 24% !important;  color: #666;  white-space: nowrap;  }
        .td-width { width: 50px;  }
        .ScrLts ul li{
            width: 300px;            
        }
    </style>
</head>

<body>
<div class="header-div bg-color margin-top10">
<form id="dataSearchForm" method="post" class="padding-left20">
    <table class="ys-table tiaojian" style="width: 70%">
        <tbody>
        <tr>
            <td style="text-align:left">
                <select id="selectYear" name="syear">
                </select>
            </td>
            <td class="fs_16" style="width:5%;padding-left:6px">
                年
            </td>
            <td style="text-align:left">
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
            </td>
            <td class="fs_16" style="width:5%;padding-left:6px">月</td>
            <td class="fs_16" style="padding-right:6px">
                科室
            </td>
            <td>
               <!-- <input  type="text"  id="depart"  name="ksbm"  style="width: 120px" class=" easyui-validatebox xd-nm" /> -->
               <select id="depart" name="ksbm"></select>
            </td>
            <td class="fs_16" style="width:11%;padding-right:6px">
                参保类型
            </td>
            <td>
                  <select id="cblxbm" name="cblxbm">
                        <option value="0">全部</option>
                        <option value="1">城乡居民</option>
                        <option value="2">城镇职工</option>
                        <option value="3">省直医保</option>
                 </select> 
            </td>
            <!-- <td class="td-width"></td> -->
            <td style="width:12%;padding-left:3%;text-align:left">
               <!--  <input type="button" value="查询"  onclick="serchdata()"  class="btn btn-primary"> -->
                <button class="btn btn-info btn-sm " type="button" onclick="serchdata()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button> 
            </td>
           <!--  <td style="width: auto"></td> -->
        </tr>
        </tbody>
    </table>
    <input type="hidden" name="exportData_details" id="exportData_details"/>
    <input type="hidden" name="exportData" id="exportData"/>
</form>
</div>
<div class="bg-color main-div margin-top10">
    <div class="tab-menu-l border-bom">
        <ul class="padding-left10" id='tab0'>
            <li class="fs_16 on">关键指标</li>
            <li class="fs_16">违规汇总</li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="tab-div-boxs" >
        <!--关键指标-->
        <div class="ks-fy-zb">
            <!--关键指标-->
            <div class="ks-fy-zb" style="margin-top: 0">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">关键指标</td>
                            <td class="right">
                                <%-- <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ScrLts">
                    <ul class="body-width" style="display:flex;flex-wrap:wrap">
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/series/icon01.png"/></div>
                                    <div class="C_hre">
                                        <p id="jzrc">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">就诊人数</span>
                                            <span class="nowrap">与上月比<font class="abnormal-span padding-left4 gjzb" id="jzrcBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>
                           
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/series/icon02.png"/></div>
                                    <div class="C_hre">
                                        <p id="ylf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">医疗总费用</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4 gjzb" id="ylfBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>
                           
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon03.png"/></div>
                                    <div class="C_hre">
                                        <p id="ybtczf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">医保统筹支付</span>
                                            <span class="nowrap">与上月比<font class="abnormal-span padding-left4 gjzb" id="ybtczfBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>
                            
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon09.png"/></div>
                                    <div class="C_hre">
                                        <p id="wgdjs">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">违规单据数</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4 gjzb" id="wgdjsBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon10.png"/></div>
                                    <div class="C_hre">
                                        <p id="cjfy">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">次均医疗费</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4 gjzb" id="cjfyBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>
                           
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon11.png"/></div>
                                    <div class="C_hre">
                                        <p id="cjyf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">次均药费</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4 gjzb" id="cjyfBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>
                                <li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/icon12.png"/></div>
                                    <div class="C_hre">
                                        <p id="cjjcjyf">-</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">次均检查检验费</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4 gjzb" id="cjjcjyfBJ">-</font></span>
                                        </p>
                                    </div>
                                </li>                         
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
            <!--关键指标-->
            <div class="ks-fy-zb">
                <div class="gauge-title-div margin-top10">
                    <table class="body-width">
                        <tr>
                            <td class="right fs_16" style="width: 76%">
                                <%-- <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="yb-jj-div">
                    <div class="ys-rc-div" style="height: auto;width: auto;">
                        <table class="body-width common-table" id="mzTable">
                            <tbody >
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="ks-fy-zb ks-nm-div" style="display:none;">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title">违规单据汇总</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width  pad-top0">
                        <div class="ys-rc-div" style="height: auto;width: auto;">
                            <table class="body-width common-table" id="mzViolationsDocuments">
                                <tbody > 
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
                            </tr>
                        </table>
                    </div>
                    <div class="body-width pad-top0">
                        <div class="ys-rc-div" style="height: auto;width: auto;">
                            <table class="body-width common-table" id="mzViolationdetails">
                                <tbody >
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
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
                            <div class="tab-tables-l" style="padding-left: 2%" id="tab1">
                                <ul class="tab2s">
                                    <li class="on padding-left0 margin-left0">违规规则排序</li>
                                    <li id="doctor_depart">-</li>
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
                                <table class="body-width common-table" id="mzwggzOrderTable">
                                    <tbody>
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
                                <table class="body-width common-table" id="mzwgdjDocuments">
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
                                <table class="body-width common-table" id="mzmgdetails">
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
                                <table class="common-table" id="mzwgdepartOrderTable">
                                    <tbody>
                                    </tbody>
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
                            <div class="ys-rc-div" style="height: auto;width: auto;">
                                <table class="body-width common-table" id="mzwgdjDocuments_dapart">
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
                                <table class="body-width common-table" id="mzmgdetails_depart">
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
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/jquery.easyui.min.js"></script>
<script src="${path }/static/js/common.js"></script>
<script src="${path}/static/js/jquery.combo.select.js"></script>
<script type="text/javascript">
var model={
	gzbm:"",
    urls:[
        //关键指标
        '${path }/generalclinic/mzquotaDataGrid',
        //违规单据汇总
        '${path }/generalclinic/mzViolationsDocuments',
        //关键指标-违规单据汇总-违规详情、违规汇总-科室违规情况-违规单据汇总-违规详情、违规汇总-医师违规违规单据汇总违规详情
        '${path }/generalclinic/mzViolationdetails',
        //违规汇总-违规规则排序--表格
        '${path }/generalclinic/mzwggzOrderTable',
        //违规汇总-违规规则排序-违规单据汇总-违规详情
        '${path }/generalclinic/getwholedocumentdetails',
        //违规汇总-科室违规情况
        '${path }/generalclinic/mzwgdepartOrderTable',
        // 违规汇总-医师违规情况
        '${path }/generalclinic/mzwgDoctorOrderTable',
        //违规规则排序-条形图
        "${path }/costStruct/selectEcharsData?methodFlag=mzwggzOrder",
        //科室违规情况-条形图
        "${path }/costStruct/selectEcharsData?methodFlag=mzwgdepartOrder",
        //医师违规情况-条形图
        "${path }/costStruct/selectEcharsData?methodFlag=mzwgDoctorOrder"
    ],
    cols:[
        //关键指标
        [ [{width : '25%',title : '医师',field : 'ysxm'},
                {width : '25%',title : '医保支付人次',field : 'ybtczfrc'},  
                {width : '25%',title : '医保支付金额(元)',field : 'ybtczf'}, 
                {width : '25%',title : '违规单据数',field : 'wgdjs',
                    formatter: function (value, rowData, rowIndex) {       
                        return "<a style='color:green' href='javascript:void(0);' onclick=mzViolationsDocuments('" + rowData.ysgh + "');>" + value + "</a>";
                    }
                } ,
                {hidden:true,field : 'ysgh'}] ],
        //关键指标-违规单据汇总、违规汇总-科室违规情况-违规单据汇总、违规汇总-医师违规情况-违规单据汇总
        [ [{width : '10%',title : '就诊日期',field : 'jzrq'},
                {width : '15%',title : '身份证号',field : 'sfzhm'}, 
                {width : '10%',title : '患者姓名',field : 'hzxm',
                    formatter: function (value, rowData, rowIndex) {       
                        return "<a style='color:green' href='javascript:void(0);' onclick=mzViolationdetails('" + rowData.mzlsh+ "');>" + value + "</a>";;
                    }
                }, 
                {width : '10%',title : '参保类型',field : 'cblx'} , 
                {width : '10%',title : '科室',field : 'ksmc'}, 
                {width : '10%',title : '医师',field : 'ysxm'}, 
                {width : '10%',title : '疾病名称',field : 'ryzd'}, 
                {width : '10%',title : '开立原因',field : 'klyy',
                    formatter: function (value){
                        if(value==null){
                            return '-'; 
                        }else{
                            return "<span title='" + value + "'>" + value + "</span>" 
                        }
                    }
                }, 
                {width : '10%',title : '整单违反规则',field : 'gzmc',
                    formatter: function (value){
                        if(value==null){
                            return '-'; 
                        }else{
                             return "<span title='" + value + "'>" + value + "</span>" 
                        }
                    }
                },
                {width : '10%',title : '医疗费(元)',field : 'ylf'}, 
                {width : '10%',title : '医保内金额(元)',field : 'ybtczf'}] ],
        //违规详情
        [ [{width : '10%',title : '日期',field : 'rq' },
                {width : '10%',title : '时间',field : 'sj'},  
                {width : '10%',title : '项目编码',field : 'xmbm'}, 
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
                {width : '10%',title : '用法',field : 'usage',
                    formatter: function (value){
                        if(value==null){
                            return '-'; 
                        }else{
                            return "<span title='" + value + "'>" + value + "</span>" 
                        }
                    }
                },
                {width : '10%',title : '用量',field : 'yl'},
                {width : '10%',title : '单价(元)',field : 'dj'},
                {width : '10%',title : '数量',field : 'sl'},
                {width : '10%',title : '金额(元)',field : 'je'}, 
                {width : '10%',title : '医保内金额(元)',field : 'ybnje'}]],
        //违规汇总-违规规则排序
        [ [{width : '50%',title : '违规规则',field : 'gzmc'},  
                {width : '50%',title : '违规单据数',field : 'wgdjs',
                    formatter: function (value, rowData, rowIndex) {       
                        return "<a style='color:green' href='javascript:void(0);' onclick=mzwgdjDocuments('" + rowData.gzbm + "');>" + value + "</a>";;
                    }
                },  
                {hidden:true,field :'gzbm'}] ],
        //违规汇总-违规规则排序-违规单据汇总
        [ [{width : '10%',title : '就诊日期',field : 'jzrq' },
                {width : '15%',title : '身份证号',field : 'sfzhm'},  
                {width : '10%',title : '患者姓名',field : 'hzxm',
                    formatter: function (value, rowData, rowIndex) {       
                        return "<a style='color:green' href='javascript:void(0);' onclick=mzmgdetails('" + rowData.mzlsh+ "','"+model.gzbm+"');>" + value + "</a>";;
                    }
                }, 
                {width : '10%',title : '参保类型',field : 'cblx'} , 
                {width : '10%', title : '科室',field : 'ksmc'}, 
                {width : '10%',title : '医师',field : 'ysxm'}, 
                {width : '10%',title : '疾病名称',field : 'ryzd'}, 
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
                {width : '10%',title : '医保内金额(元)',field : 'ybtczf'}] ],
        //违规汇总-科室违规情况
        [ [{width : '50%',title : '科室名称',field : 'ksmc'},  
                {width : '50%',title : '违规单据数',field : 'wgdjs',
                    formatter: function (value, rowData, rowIndex) {       
                        return "<a style='color:green' href='javascript:void(0);' onclick=mzwgdjDocuments_dapart('" + rowData.ksbm + "');>" + value + "</a>";;
                    }
                } ,
                {width : '',hidden:true,field : 'ksbm'}] ],
        // 违规汇总-医师违规情况
        [ [{width : '50%',title : '医师名称',field : 'ysxm'},  
                {width : '50%',title : '违规单据数',field : 'wgdjs',
                    formatter: function (value, rowData, rowIndex) {       
                        return "<a style='color:green' href='javascript:void(0);' onclick=mzwgdjDocuments_doctor('" + rowData.ysbm + "');>" + value + "</a>";;
                    }
                },
                {width : '',hidden:true,field : 'ysbm'}] ]
    ]
};
// 科室违规？医师违规
function ifDepartDoctor(){
    var ksbm = $("#depart").val();
    if(ksbm==0){
        $("#doctor_depart").text("科室违规情况");
        mzwgdepartOrder();
        mzwgdepartOrderTable();
    }else {
        $("#doctor_depart").text("医师违规情况");
        mzwgDoctorOrder();
        mzwgDoctorOrderTable();
    }
}
//条形图渲染
function barRender(id,xData,seriesData){
    var chartBar=echarts.init(document.getElementById(id));
    var options={
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
                bottom: '20%',
                containLabel: true
        },
        xAxis: [
                {
                    type: 'category',
                    axisPointer: {type: 'shadow'},
                    data: xData,
                    axisLabel: {
                        textStyle: {
                            color: '#333333',
                            fontWeight:700
                        },
                        rotate: -30,//-30度角倾斜显示
                        interval:0 
                    }
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
                barWidth: 15,
                barGap: 0.1,
                data:seriesData
            }
        ]
    };
    chartBar.setOption(options);
    window.addEventListener("resize", function () {
        chartBar.resize();
    });
}
function getQueryData(){
    //  年份下拉选项 往回倒推三年
    var date = new Date();
    var syy= date.getFullYear();
    for(var sy=0;sy<3;sy++){        
        $('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
    }   
    var month=date.getMonth()+1;
    month=month<10?"0"+month:String(month); 
    $('#selectMonth').val(month);
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
//datagrid渲染
function datagridRender(id,url,col,params){
    $(id).datagrid({
        url:url,
        fit:false,
        striped:false,
        queryParams:params,
        pagination : true,
        rownumbers:true,
        singleSelect : true,
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
            if(id.indexOf("ocument")>0){
            	$("#exportData").val(JSON.stringify(params));
            };
            if(id.indexOf("etails")>0){
            	$("#exportData_details").val(JSON.stringify(params));
            };
        }
    })
}
//ajax获取图表的数据
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
        }
    })
};
//门诊关键指标
function departZB() {
    var s= $("#selectMonth").val();
    for(var i=1;i<=12;i++){
        if(parseInt(s)==i){
            var temp = i-1;
            if(temp<10){
                var temp1=0+temp.toString();
                $("#hid").val(temp1);
            }else {
                var temp1=temp.toString();
                $("#hid").val(temp1);
            }           
        }
    }
    $.ajax({
        type: "POST",
        url:"${path }/generalclinic/mzquotadepartZB",
        cache: false,
        async : false,
        dataType: "json",   
        data:$('#dataSearchForm').serialize(),  //form表单
        success:function(data){
             $(".gjzb").removeClass("abnormal-span");
             $(".gjzb").removeClass("normal-span");
             $('#jzrc').text("-");
             $('#ylf').text("-");
             $('#ybtczf').text("-");
             $('#wgdjs').text("-");          
             $('#cjjcjyf').text("-");
             $('#cjfy').text("-");
             $('#cjyf').text("-");
             $(".gjzb").text("-");
            if(data!=""&&JSON.stringify(data) != "{}"){
                var shuju=data[0];  
                keyIndicators(shuju);
                keyIndicatorsBJ(data);
            }
        }       
    });
};
// 关键指标 循环赋值
function keyIndicators(shuju){
    for(var key in shuju){      
          if(shuju[key] != null){
             $("#"+key).text(shuju[key]);
          }
      }
};
// 循环比较
function keyIndicatorsBJ(data){
    if(data[0].jzrc!=0&&data[1].jzrc!=0){
        for(var key in data[0]){                
              if(data[1][key] != 0){
                  var bj = data[0][key]-data[1][key];
                    
                  var value = ((Math.abs(bj))/data[1][key]).toFixed(3);
            
                  if(bj>=0){
                      $("#"+key+"BJ").text("↑"+toPercent(value));
                      $("#"+key+"BJ").addClass("abnormal-span");
                  }else {
                      
                      $("#"+key+"BJ").text("↓"+toPercent(value)); 
                      $("#"+key+"BJ").addClass("normal-span");
                  }
              }else{
                  var bj = data[0][key]-data[1][key]
                    
                   if(bj>=0){
                      $("#"+key+"BJ").text("↑"+toPercent(1));
                      $("#"+key+"BJ").addClass("abnormal-span"); 
                   }
              }
          }
    }else{
    
        for(var key in data[0]){
                
         $("#"+key+"BJ").text("↓"+toPercent(1)); 
          $("#"+key+"BJ").addClass("normal-span");
        }
        
    }     
};
// 转换成百分数
function toPercent(data){
    var strData = (data*100).toFixed(1);
    var ret = strData.toString()+"%";
    return ret;
}
//关键指标--表格
function mzTable() {
    datagridRender('#mzTable',model.urls[0],model.cols[0],$("#dataSearchForm").serializeObject());
}
//关键指标-违规单据汇总
function mzViolationsDocuments(ysgh) {
    $(".ks-nm-div-name-div").css("display","none");
    $(".ks-nm-div").css("display","block");
    datagridRender('#mzViolationsDocuments',model.urls[1],model.cols[1],$.extend($("#dataSearchForm").serializeObject(),{ysgh:ysgh}));
}
//关键指标-违规单据汇总-违规详情、违规汇总-科室违规情况-违规单据汇总-违规详情、违规汇总-医师违规情况-违规单据汇总-违规详情
function mzViolationdetails(mzlsh) {
    $(".ks-nm-div-name-div").css("display","block");
    var cblxbm=$('#cblxbm').val();
    if($("#tab0>.on").index()==0){
        datagridRender('#mzViolationdetails',model.urls[2],model.cols[2],{cblxbm:cblxbm,mzlsh:mzlsh});
    }
    if($("#tab0>.on").index()==1&&$("#depart").val()==0){
        datagridRender('#mzmgdetails_depart',model.urls[2],model.cols[2],{cblxbm:cblxbm,mzlsh:mzlsh});
    }
    if($("#tab0>.on").index()==1&&$("#depart").val()!=0){
        datagridRender('#mzmgdetails_depart',model.urls[2],model.cols[2],{cblxbm:cblxbm,mzlsh:mzlsh});
    }       
}
// 违规规则排序-条形图
function mzwggzOrder() {
    ajaxData(model.urls[7],$('#dataSearchForm').serialize());
    barRender("bar5",model.echartsData.mzwggzOrder_value1,model.echartsData.mzwggzOrder_value0)
}
// 违规汇总-违规规则排序--表格
function mzwggzOrderTable() {
    datagridRender('#mzwggzOrderTable',model.urls[3],model.cols[3],$("#dataSearchForm").serializeObject());
}
//违规汇总-违规规则排序-违规单据汇总
function mzwgdjDocuments(gzbm) {
    $(".nm-div-name-div").css("display","none");
    $(".nm-div").css("display","block");
    model.gzbm = gzbm;
    datagridRender('#mzwgdjDocuments',model.urls[1],model.cols[4],$.extend($("#dataSearchForm").serializeObject(),{gzbm:gzbm}));
}
//违规汇总-违规规则排序-违规单据汇总-违规详情
function mzmgdetails(mzlsh,gzbm) {
    $(".nm-div-name-div").css("display","block");
    var cblxbm=$('#cblxbm').val();
    var ksbm=$("#depart").val();
    datagridRender('#mzmgdetails',model.urls[4],model.cols[2],{cblxbm:cblxbm,ksbm:ksbm,mzlsh:mzlsh,gzbm:gzbm });  
}
// 科室违规情况-条形图
function mzwgdepartOrder() {
    ajaxData(model.urls[8],$('#dataSearchForm').serialize());
    barRender("bar6",model.echartsData.mzwgdepartOrder_value1,model.echartsData.mzwgdepartOrder_value0);
}
//医师违规情况-条形图
function mzwgDoctorOrder() {
    ajaxData(model.urls[9],$('#dataSearchForm').serialize());
    barRender("bar6",model.echartsData.mzwgDoctorOrder_value1,model.echartsData.mzwgDoctorOrder_value0);   
}
// 违规汇总-科室违规情况
function mzwgdepartOrderTable() { 
    datagridRender('#mzwgdepartOrderTable',model.urls[5],model.cols[5],$("#dataSearchForm").serializeObject());
}   
//违规汇总-医师违规情况
   function mzwgDoctorOrderTable() {
    datagridRender('#mzwgdepartOrderTable',model.urls[6],model.cols[6],$("#dataSearchForm").serializeObject());
}
//违规汇总-科室违规情况-违规单据汇总
function mzwgdjDocuments_dapart(ksbm) {
      $(".ks-nm-div-name-div").css("display","none");
      $(".ks-nm-div").css("display","block");
      datagridRender('#mzwgdjDocuments_dapart',model.urls[1],model.cols[1],$.extend($("#dataSearchForm").serializeObject(),{ksbm:ksbm}));  
} 
 
//违规汇总-医师违规情况-违规单据汇总
function mzwgdjDocuments_doctor(ysbm) {
    $(".ks-nm-div").css("display","block");
    $(".ks-nm-div-name-div").css("display","none");
    datagridRender('#mzwgdjDocuments_dapart',model.urls[1],model.cols[1],$.extend($("#dataSearchForm").serializeObject(),{ysgh:ysbm}));   
}
   
function hiddenFrame(){
    $(".ks-nm-div-name-div").css("display","none");
    $(".ks-nm-div").css("display","none");
    $(".nm-div-name-div").css("display","none");
    $(".nm-div").css("display","none");
}
function serchdata(){
    hiddenFrame();
    var index=$("#tab0 li.on").index();
    if(index==0){           
        mzTable();
        departZB();
    }else if(index==1){
        var index1=$("#tab1 li.on").index();
        // var ksbm = $("#depart").combobox("getValue");
        var ksbm = $("#depart").val();
        if(ksbm==0){
            $("#doctor_depart").text("科室违规情况");
        }else {
            $("#doctor_depart").text("医师违规情况");
        }
        if(index1==0){
            mzwggzOrder();
            mzwggzOrderTable();
        }else if(index1==1){
            if(ksbm==0){
                mzwgdepartOrder();
                mzwgdepartOrderTable();
            }else {
                mzwgDoctorOrder();
                mzwgDoctorOrderTable();
            }
        }
    } 
}    
$(function() {
    getQueryData();   
    $.ajax({
        type:"POST",
        url:"${path}/department/getDepartmentOfUser?kslx=mzsy",
        cache:false,
        async:false,
        dataType:"json",
        success:function(data){
            var str=""
            for(var i=0;i<data.length;i++){
                    str+="<option value='"+data[i].ksdm+"'>"+data[i].ksmc+"</option>";
            }
            $("#depart").append($(str));  
        }
    });
    $("#selectYear,#selectMonth,#depart,#cblxbm").comboSelect();
    $("#selectYear").parent().find("input").css({"width":"100px"});
    $("#selectMonth").parent().find("input").css({"width":"60px"});
    $("#cblxbm").parent().find("input").css({"width":"110px"});
    departZB();
    mzTable();
        /*选项卡*/
        $("#tab0 li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-div-boxs > div").eq(index).css("display", "block").siblings().css("display", "none");
            if(index == 0){
                departZB();
                mzTable();
                hiddenFrame();
            }else if(index == 1){
                ifDepartDoctor();
                mzwggzOrder();
                mzwggzOrderTable();
                hiddenFrame();
            }
        });

        //违规汇总
        $(".tab2s li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-table-box2s > div").eq(index).css("display", "block").siblings().css("display", "none");
            if (index == 0) {
                mzwggzOrder();
                mzwggzOrderTable();
                hiddenFrame();
            }
            else if (index == 1){
                ifDepartDoctor();
                hiddenFrame();
            }
        });
        
    

        $("a,button,td").focus(function () {
            this.blur()
        });  
});

	//违规汇总导出
	function excelExport_wghz(){
		var url = "${path }/excel/ptmz_wghz";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
	//违规详情导出
	function excelExport_wghzDetails(){
		var url = "${path }/excel/ptmz_wghzDetails";
		$("#dataSearchForm").attr("action", url);
	    $("#dataSearchForm").submit();
	}
</script>
</body>
</html>