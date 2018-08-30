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
    <%-- <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/datagrid-filter.js"></script>
    <link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
    <link href="${path }/static/css/common.css" rel="stylesheet">
    <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
   <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath }/static/dataMonitoring/violationSummary.js"></script>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> --%>	   
    <title>全院概览</title>
    <style>
        .ys-table tbody tr td > select {
            width: auto !important;
        }
        #bar1 {
            height: 90px
        }
        #bar2 {
            height: 90px
        }
        #line1{
            height: 300px !important;
        }
        .C_hre > p {
            margin-bottom: 0 !important;
            line-height: 24px !important;
        }
        .gauge-div{margin-bottom: 20px !important;}
        .pop-up{height: auto!important;}
        .DialogDiv3{top: 5%!important;height: 90%!important;width: 80%!important;left: 10%!important;}
        #closes{cursor: pointer}
        .tab-menu-l ul >li{font-size: 14px !important;}
        .combo-select{display:inline-block;}
    </style>
</head>
<body>
<div class="tab-table bg-color padding10 " id="tabs">
    <ul class="queryclass">
        <li class=" on" id="li0" value="0">普通住院</li>
        <li class="" id="li1" value="1">住院病种</li>
        <li class="" id="li2" value="2">门规病种</li>
        <li class="" id="li3" value="3">普通门诊</li>
    </ul>
    <div class="clear"></div>
</div>
<div class="header-div bg-color margin-top0">
   <form id="dataSearchForm" method="post" class="padding-left20">
       
 
                <select id="selectYear" name="syear"></select>
        
             		   <span class="fs16 pdr3p">年</span>
   
 
                <select id="selectMonth"  name="smonth">
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
            	<span class="fs16 pdr3p">月</span>
            	<span class="fs16">参保类型</span>	
                        
                <select id="cblxbm" name="cblxbm">
	                    <option value="000">全部</option>
	                    <option value="390">城乡居民</option>
	                    <option value="391">城镇职工</option>
	                    <option value="392">省直医保</option>
	             </select> 

            
            	<div style="margin-left:2%;display:inline-block"> <button class="btn btn-info btn-sm serchdata" type="button"><img style="padding: 0" src="${staticPath }/static/img/menu/search.png"><span>查询</span></button></div>	
                 
                                
          
</form>
</div>

<div class="tab-table-box bg-color margin-bottom20 margin-top10">
    <!--普通住院-->
    <div>
        <div class="tab-menu-l border-bom">
            <ul class="padding-left10" id='tab1'>
                <li class="fs_16 on" value='0'>预算监控</li>
                <li class="fs_16" value='1'>关键指标</li>
                <li class="fs_16" value='2'>违规汇总</li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="tab-div-box1">
                <!--预算监控-->
                <div class="ks-fy-zb">
                    <div class="gauge-title-div">
                        <div class="qy-jj-bar">
                            <div id="bar1" style="width: 92%">

                            </div>
                            <div id="bar2">

                            </div>
                        </div>
                    </div>
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="right fs_16">
                                    <%-- <button class="btn btn-info btn-sm"  type="button"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="yb-jj-div">
                        <div class="ys-rc-div ">
                            <table class="body-width common-table" id="quotaGrid">
                                
                            </table>
                        </div>
                    </div>
                </div>
                <!--住院关键指标-->
                <div class="zy-div1">
                    <div class="ks-fy-zb">
                        <div class="ScrLts">
                            <table class="body-width">
                                <tr>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon01.png"/></div>
                                            <div class="C_hre CYRC_ZY">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">出院人次</span>
                                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon02.png"/></div>
                                            <div class="C_hre YLF_ZY">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">医疗总费用</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon03.png"/></div>
                                            <div class="C_hre YBTCZF_ZY">
                                                <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">医保统筹支付</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li class="margin-rgt0">
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon04.png"/></div>
                                            <div class="C_hre HZFDB_ZY">
                                                <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">患者总负担比</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon05.png"/></div>
                                            <div class="C_hre WGDJS_ZY">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">违规单据数</span>
                                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                                </p>

                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon06.png"/></div>
                                            <div class="C_hre RJYLF_ZY">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">人均医疗费用</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon07.png"/></div>
                                            <div class="C_hre RJYF_ZY">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">人均药费</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li class="margin-rgt0">
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon08.png"/></div>
                                            <div class="C_hre RJHCF_ZY">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">人均耗材费</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon16.png"/></div>
                                            <div class="C_hre YLZFB_ZY">
                                                <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">乙类自付比</span>
                                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                                </p>

                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/icon17.png"/></div>
                                            <div class="C_hre ZFB_ZY">
                                                <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">自费比</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="module-hr"></div>
                    <!--月度变化趋势-->
                    <div class="ks-fy-zb" style="display:none">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">月度变化趋势</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width fy-line-div" id="num1">
                            <div class="fy-bar-div" id="line1">

                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--违规汇总-->
                <div class="zy-div2" style="display:none">
                    <!--选项卡-->
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td>
                                    <div class="tab-tables-l" style="padding-left: 2%">
                                        <ul class="tab1s">
                                            <li class="on padding-left0 margin-left0" value="0">违规规则排序</li>
                                            <li value="1">科室违规情况</li>
                                        </ul>
                                        <div class="clear"></div>
                                    </div>
                                </td>
                                <td class="right">
                                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('zy_wghz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="tab-table-box1s">
                        <!--违规规则排序-->
                        <div class="ks-fy-zb">

                            <div class="body-width fy-line-div">
                                <div class="fy-bar-div" id="bar3">

                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="ks-fy-zb">
                                <div class="body-width pad-top0">
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
                                        </tr>
                                    </table>
                                </div>
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="zyDetails">
                                            
                                        </table>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <!--科室违规情况-->
                        <div class="ks-fy-zb" style="display: none">
                            <!--科室规则排序-->
                            <div class="ks-fy-zb" style="padding-bottom: 0">

                                <div class="body-width fy-line-div">
                                    <div class="fy-bar-div" id="bar4">

                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                            <!--科室违规-->
                            <div class="ks-fy-zb ks-tables">
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="common-table" id="zywgOrderTable_depart">
                                            
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
                                        </tr>
                                    </table>
                                </div>
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="zyDocument_depart">
                                           
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
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="zyDetails_depart">
                                           
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
    <!--住院病种-->
    <div style="display: none">
        <div class="tab-menu-l border-bom">
            <ul class="padding-left10" id='tab2'>
                <li class="fs_16 on" value="0">病种汇总</li>
                <li class="fs_16" value="1">病种指标</li>
                <li class="fs_16" value="2">违规汇总</li>
                <li class="fs_16" value="3">介入治疗</li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="tab-div-box2">
                <!--单病种汇总-->
                <div class="ks-fy-zb">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="right">
                                    <%-- <button class="btn btn-info btn-sm"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="ScrLts">
                        <table class="body-width">
                            <tr>
                                <td>
                                    <li>
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/entity/icon01.png"/></div>
                                        <div class="C_hre SZRC_BZ">
                                            <p>-</p>
                                            <p class="nowrap">
                                                <span class="nowrap zb-font">收治人次</span>
                                                <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                                <td>
                                    <li>
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/entity/icon02.png"/></div>
                                        <div class="C_hre YLF_BZ">
                                            <p>-</p>
                                            <p class="nowrap ">
                                                <span class="nowrap zb-font">医疗总费用</span>
                                                <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                                <td>
                                    <li>
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/entity/icon03.png"/></div>
                                        <div class="C_hre CDERC_BZ">
                                            <p>-</p>
                                            <p class="nowrap ">
                                                <span class="nowrap zb-font">超定额人次</span>
                                                <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                                <td>
                                    <li class="margin-rgt0">
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/entity/icon04.png"/></div>
                                        <div class="C_hre CDEFY_BZ">
                                            <p>-</p>
                                            <p class="nowrap">
                                                <span class="nowrap zb-font">超定额总费用</span>
                                                <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <li class="margin-rgt0">
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/icon04.png"/></div>
                                        <div class="C_hre HZFD_BZ">
                                            <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                            <p class="nowrap">
                                                <span class="nowrap zb-font">患者总负担比</span>
                                                <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                                <td>
                                    <li>
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/icon16.png"/></div>
                                        <div class="C_hre YLZF_BZ">
                                            <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                            <p class="nowrap">
                                                <span class="nowrap zb-font">乙类自付比</span>
                                                <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                            </p>

                                        </div>
                                    </li>
                                </td>
                                <td>
                                    <li>
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/icon17.png"/></div>
                                        <div class="C_hre ZFB_BZ">
                                            <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                            <p class="nowrap zfb_bz">
                                                <span class="nowrap zb-font">自费比</span>
                                                <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                                <td>
                                    <li class="margin-rgt0">
                                        <div class="L_img"><img src="${staticPath }/static/img/survey/icon18.png"/></div>
                                        <div class="C_hre JCB_BZ">
                                            <p>-<font class=" padding-left10" style="color: #999999;font-size: 12px">限定值:-</font></p>
                                            <p class="nowrap">
                                                <span class="nowrap zb-font">大型检查比</span>
                                                <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                            </p>
                                        </div>
                                    </li>
                                </td>
                            </tr>
                        </table>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--病种指标-->
                <div class="bz-div1">
                    <div class="ks-fy-zb">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">病种指标</td>
                                    <td class="padding-left20">
                                        <input class="radios lj-rad" type="radio" name="type" checked/><span class="radio-span">累计指标</span>
                                        <input class="radios rj-rad" type="radio" name="type"/><span class="radio-span">人均指标</span>
                                    </td>
                                    <td class="right" style="width: 76%">
                                       <%--  <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="yb-jj-div">
                            <div class="ys-rc-div ">
                            	<div id="bzzb_lj">
                            		<table class="body-width common-table lj" id="diseaseIndexLJ">
                                    
                                	</table>
                            	</div>
                            	<div id="bzzb_rj">
	                            	<table class="body-width common-table rj" id="diseaseIndexRJ">
	                                    
	                                </table>
                            	</div>
                            </div>
                        </div>
                    </div>
                    <div class="module-hr"></div>
                    <!--月度变化趋势-->
                    <div class="ks-fy-zb">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">月度变化趋势</td>
                                    <td class="right">
                                    	<span>病种</span>
                                    	<select style="padding-right:20px">
                                            <option value="0">膝关节骨性关节炎</option>
                                            <option value="1">肺曲菌病</option>
                                            <option value="2">心脏病</option>
                                            <option value="1">法乐氏四联症</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width fy-line-div" id="num2">
                            <div class="fy-bar-div" id="line2">
                
                            </div>
                        </div>
                        <!--表格数据-->
                        <div class="clear"></div>
                    </div>
                </div>
                <!--违规汇总-->
                <div class="bz-div2">
                    <!--选项卡-->
                    <div class="gauge-title-div ">
                        <table class="body-width">
                            <tr>
                                <td>
                                    <div class="tab-tables-l" style="padding-left: 2%">
                                        <ul class="tab2s">
                                            <li class="on padding-left0 margin-left0" value="0">违规规则排序</li>
                                            <li value="1">科室违规情况</li>
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
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="bzwggzOrderTable">
                                            
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
                                        </tr>
                                    </table>
                                </div>
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="bzDocument">
                                            
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
                                        </tr>
                                    </table>
                                </div>
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="bzDetails">
                                            
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
                            <!--医师违规-->
                            <div class="ks-fy-zb ys-tables">
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="common-table" id="bzwgOrderTable_depart">
                                             
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
                                        </tr>
                                    </table>
                                </div>
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="bzDocument_depart">
                                            
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
                                <div class="body-width padding10 pad-top0">
                                    <div class="ys-rc-div">
                                        <table class="body-width common-table" id="bzDetails_depart">
                                            
                                        </table>
                                    </div>
                                </div>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--介入治疗-->
                <div class="bz-div3">
                    <!--介入治疗汇总-->
                    <div class="ks-fy-zb" style="margin-top: 0">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">介入治疗汇总</td>
                                    <td class="right">
                                        <%-- <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="ScrLts">
                            <table class="body-width">
                                <tr>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/treat/icon01.png"/></div>
                                            <div class="C_hre ZLRC_ZL">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">治疗人次</span>
                                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/treat/icon02.png"/></div>
                                            <div class="C_hre PJZYR_ZL">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">平均住院日</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/treat/icon03.png"/></div>
                                            <div class="C_hre YLF_ZL">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">年累积医疗总费用</span>
                                                    <span class="nowrap">与上月比<font class="abnormal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/treat/icon04.png"/></div>
                                            <div class="C_hre TCZF_ZL">
                                                <p>-<font class="fs_14 padding-left10" style="color: #999999;font-size: 12px">限定总量：-</font></p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">年累积统筹支付费用</span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/treat/icon05.png"/></div>
                                            <div class="C_hre CDERC_ZL">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">超定额人次</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                    <td>
                                        <li>
                                            <div class="L_img"><img src="${staticPath }/static/img/survey/treat/icon06.png"/></div>
                                            <div class="C_hre CDEFY_ZL">
                                                <p>-</p>
                                                <p class="nowrap">
                                                    <span class="nowrap zb-font">超定额总费用</span>
                                                    <span class="nowrap">与上月比<font class="normal-span padding-left4">-</font></span>
                                                </p>
                                            </div>
                                        </li>
                                    </td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <div class="module-hr"></div>
                    <!--介入治疗关键指标-->
                    <div class="ks-fy-zb">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">介入治疗指标</td>
                                    <td class="padding-left20">
                                        <input class="radios lj-rad1" type="radio" name="j-type" checked /><span class="radio-span">累计指标</span>
                                        <input class="radios rj-rad1" type="radio" name="j-type"/><span class="radio-span">人均指标</span>
                                    </td>
                                    <td class="right" style="width: 76%">
                                        <%-- <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="yb-jj-div">
                            <div class="ys-rc-div ">
                            	<div id="jrzl_lj">
                            		<table class="body-width common-table lj1" id="treatmentIndicatorsLJ">
                                    
                                	</table>
                            	</div>
                            	<div id="jrzl_rj">
                            		<table class="body-width common-table rj1" id="treatmentIndicatorsRJ">
                                    
                                	</table>
                            	</div>
                            </div>
                        </div>
                    </div>
                </div>
        </div>
    </div>
    <!--门规-->
    <div style="display: none">
        <div class="tab-menu-l border-bom">
            <ul class="padding-left10" id='tab3'>
                <li class="fs_16 on" value="0">门规汇总</li>
                <li class="fs_16" value="1">门规病种统计</li>
                <li class="fs_16" value="2">违规汇总</li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="tab-div-box3">
            <!--门规汇总-->
            <div class="ks-fy-zb">
<!--                 <div class="gauge-title-div"> -->
<!--                     <table class="body-width"> -->
<!--                         <tr> -->
<!--                             <td class="right"> -->
<%--                                 <button class="btn btn-sm btn-info"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
<!--                             </td> -->
<!--                         </tr> -->
<!--                     </table> -->
<!--                 </div> -->
                <div class="ScrLts">
                    <table class="body-width">
                       <tr>
                            <td>
								<li>
                                    <div class="L_img"><img src="${staticPath }/static/img/survey/series/icon01.png"/></div>
                                    <div class="C_hre">
                                        <p id="jzrcmg">-</p>
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
                                    	<p id="ylfmg">-</p>
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
                                    	<p id="ybtczfmg">-</p>
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
                                    	<p id="hzfdmg">-</p>
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
                                    	<p id="wgdjsmg">-</p>
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
                                    	<p id="cjfymg">-</p>
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
                                    	<p id="cjyfmg">-</p>
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
             <div class="mg-div1" style="display:none">
                <div class="ks-fy-zb">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title ">门规病种统计</td>

                                <td class="right" style="width: 76%">
                                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('mg')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="yb-jj-div">
                        <div class="ys-rc-div ">
                            <table id="mgquotaDataGrid" class="body-width common-table">
                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="module-hr"></div>
              
               
                <!--月度变化趋势-->
                <div class="ks-fy-zb">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title ">月度变化趋势</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width fy-line-div" id="num6">
                        <div class="fy-bar-div" id="line4">

                        </div>
                    </div>
                    <!--表格数据-->
                    <div class="clear"></div>
                </div>
            </div>
            <!--违规汇总-->
            <div class="mg-div2" style="display:none">
                <!--选项卡-->
                <div class="gauge-title-div padding-bom6">
                    <table class="body-width">
                        <tr>
                            <td>
                                <div class="tab-tables-l" style="padding-left: 2%">
                                    <ul class="tab3s">
                                        <li class="on padding-left0 margin-left0" value="0">违规规则排序</li>
                                        <li value="1">科室违规情况</li>
                                    </ul>
                                    <div class="clear"></div>
                                </div>
                            </td>
                            <td class="right">
                                <button class="btn btn-sm btn-info" type="button" onclick="excelExport('mg_wghz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="tab-table-box3s">
                    <!--违规规则排序-->
                    <div class="ks-fy-zb">
                        <div class="body-width fy-line-div">
                            <div class="fy-bar-div" id="bar9">

                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="ks-fy-zb">
                            <div class="body-width padding10 pad-top0">
                                <div class="ys-rc-div">
                                    <table class="body-width common-table" id="wggzOrderTable">
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
                                    </tr>
                                </table>
                            </div>
                            <div class="body-width padding10 pad-top0">
                                <div class="ys-rc-div">
                                    <table class="body-width common-table" id="wgdjDocuments">
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
                                    </tr>
                                </table>
                            </div>
                            <div class="body-width padding10 pad-top0">
                                <div class="ys-rc-div">
                                    <table class="body-width common-table" id="mgdetails">
                                        <tbody>
                                        
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                    <!--科室违规情况-->
                    <div class="ks-fy-zb" style="display: none">
                        <div class="ks-fy-zb" style="padding-bottom: 0">
                            <div class="body-width fy-line-div">
                                <div class="fy-bar-div" id="bar10">

                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <!--医师违规-->
                        <div class="ks-fy-zb ys-tables">
                            <div class="body-width padding10 pad-top0">
                                <div class="ys-rc-div">
                                    <table class="common-table" id="wgdepartOrderTable">
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
                                    </tr>
                                </table>
                            </div>
                            <div class="body-width padding10 pad-top0">
                                <div class="ys-rc-div">
                                    <table class="body-width common-table" id="mgwgdjDocuments_dapart">
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
                                    </tr>
                                </table>
                            </div>
                            <div class="body-width padding10 pad-top0">
                                <div class="ys-rc-div">
                                    <table class="body-width common-table" id="mgdetails_depart">
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
    <!--普通门诊-->
    <div style="display: none">
        <div class="tab-menu-l border-bom" >
            <ul class="padding-left10" id='tab4'>
                <li class="fs_16 on" value="0">汇总指标</li>
                <li class="fs_16" value="1">关键指标</li>
                <li class="fs_16" value="2">违规汇总</li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="tab-div-box4" >
                <!--汇总指标-->
                <div class="ks-fy-zb" style="margin-top: 0">
<!--                     <div class="gauge-title-div"> -->
<!--                         <table class="body-width"> -->
<!--                             <tr> -->
<!--                                 <td class="right"> -->
<%--                                     <button class="btn btn-sm btn-info" type="button"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button> --%>
<!--                                 </td> -->
<!--                             </tr> -->
<!--                         </table> -->
<!--                     </div> -->
                    <div class="ScrLts">
                        <table class="body-width">
	                        <tr>
	                            <td>
	                            	<ul>
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
	                                </ul>
	                            </td>
	                            <td>
	                            	<ul>
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
	                                </ul>
	                            </td>
	                            <td>
	                            	<ul>
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
	                                </ul>
	                            </td>
	                           
	                        </tr>
	                        <tr>
	                            <td>
	                            	<ul>
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
	                                </ul>
	                            </td>
	                            <td>
	                            	<ul>
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
	                                </ul>
	                            </td>
	                            <td>
	                            	<ul>
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
	                            </td>
	                        </tr>
	                    </table>
                        <div class="clear"></div>
                    </div>
                </div>
                <!--关键指标-->
                <div class="mt-div1">
                    <div class="ks-fy-zb">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">关键指标</td>
                                    <td class="right" style="width: 76%">
                                        <button class="btn btn-sm btn-info" type="button" onclick="excelExport('mz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="yb-jj-div">
                            <div class="ys-rc-div " style="width: auto;">
            					<table class="body-width common-table "id="mzTable">
                                    <tbody>
                                    
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="module-hr"></div>
                    <!--月度变化趋势-->
                    <div class="ks-fy-zb">
                        <div class="gauge-title-div">
                            <table class="body-width">
                                <tr>
                                    <td class="left fs_16 table-title ">月度变化趋势</td>
                                </tr>
                            </table>
                        </div>
                        <div class="body-width fy-line-div" id="num3">
                            <div class="fy-bar-div" id="line3">

                            </div>
                        </div>
                        <!--表格数据-->
                        <div class="clear"></div>
                    </div>
                </div>
	            <!--违规汇总-->
	            <div class="mt-div2">
	                <!--选项卡-->
	                <div class="gauge-title-div  padding-bom6">
	                    <table class="body-width">
	                        <tr>
	                            <td>
	                                <div class="tab-tables-l" style="padding-left: 2%">
	                                    <ul class="tab4s">
	                                        <li class="on padding-left0 margin-left0" value="0">违规规则排序</li>
	                                        <li value="1">科室违规情况</li>
	                                    </ul>
	                                    <div class="clear"></div>
	                                </div>
	                            </td>
	                            <td class="right">
                                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('mz_wghz')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                                </td>
	                        </tr>
	                    </table>
	                </div>
	                <div class="tab-table-box4s">
	                    <!--违规规则排序-->
	                    <div class="ks-fy-zb">
	                        <div class="body-width fy-line-div">
	                            <div class="fy-bar-div" id="bar7">
	
	                            </div>
	                        </div>
	                        <div class="clear"></div>
	                        <div class="ks-fy-zb">
	                            <div class="body-width padding10 pad-top0">
	                                <div class="ys-rc-div" style="width: auto;">
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
	                                    </tr>
	                                </table>
	                            </div>
	                            <div class="body-width padding10 pad-top0">
	                                <div class="ys-rc-div" style="height: 370px;width: auto;">
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
	                                    </tr>
	                                </table>
	                            </div>
	                            <div class="body-width padding10 pad-top0">
	                                <div class="ys-rc-div" style="height: 370px;width: auto;">
	                                    <table class="body-width common-table" id="mzdetails">
                                		</table>
	                                </div>
	                            </div>
	                            <div class="clear"></div>
	                        </div>
	                    </div>
	                    <!--科室违规情况-->
	                    <div class="ks-fy-zb" style="display: none">
	                        <!--科室规则排序-->
	                        <div class="ks-fy-zb" style="padding-bottom: 0">
	                            <div class="body-width fy-line-div">
	                                <div class="fy-bar-div" id="bar8">
	
	                                </div>
	                            </div>
	                            <div class="clear"></div>
	                        </div>
	                        <!--科室违规-->
	                        <div class="ks-fy-zb ks-tables">
	                            <div class="body-width padding10 pad-top0">
	                                <div class="ys-rc-div" style="height: 370px;width: auto;" >
	                                    <table class="common-table"  id="mzwgdepartOrderTable" >
	                                        <tbody>
	                                        
	                                        </tbody>
	                                    </table>
	                                </div>
	                            </div>
	                            <div class="clear"></div>
	                        </div>
	                        <!--违规单据-->
	                        <div class="ks-fy-zb ks-nm-div" style="display: none">
	                            <div class="gauge-title-div" >
	                                <table class="body-width">
	                                    <tr>
	                                        <td class="left fs_16 table-title">违规单据汇总</td>
	                                    </tr>
	                                </table>
	                            </div>
	                            <div class="body-width padding10 pad-top0">
	                                <div class="ys-rc-div"  style="height: 370px;width: auto;">
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
	                                    </tr>
	                                </table>
	                            </div>
	                            <div class="body-width padding10 pad-top0">
	                                <div class="ys-rc-div" style="height: 370px;width: auto;">
	                                    <table class="body-width common-table" id="mzdetails_depart">
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
   <!--弹出层1-->
    <div class="BgDiv3"></div>
    <div class="DialogDiv3" style="display: none; height:500px">
        <div class="pop-up bg-color1">
            <table class="body-width">
                <tr>
                    <td class="text-right padding-right20">
                        <img src="${staticPath }/static/img/close.png" id="closes">
                    </td>
                </tr>
            </table>
        </div>
        <!--选项卡-->
        <div class="gauge-title-div  padding-bom6">
            <table class="body-width">
                <tr>
                    <td>
                        <div class="tab-tables" style="padding-left: 2%">
                            <ul class="tk-tabs">
                                <li class="on padding-left0 margin-left0">违规规则排序</li>
                                <li>医师违规情况</li>
                            </ul>
                            <div class="clear"></div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-table-box5s">
            <!--违规规则排序-->
            <div class="ks-fy-zb">
                <div class="body-width fy-line-div" id="num7">
                    <div class="fy-bar-div" id="bar11">

                    </div>
                </div>
                <div class="clear"></div>
                <div class="ks-fy-zb">
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="wggzOrderLayer">
                                
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
                            </tr>
                        </table>
                    </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table zy-table1" id="violationSummaryLayer">
                                
                            </table>
                            <table class="body-width common-table mg-table1">
                                
                            </table>
                            <table class="body-width common-table mz-table1">
                                
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
                            </tr>
                        </table>
                    </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table" id="violationDetailsLayer">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
            <!--科室违规情况-->
            <div class="ks-fy-zb" style="display: none">
                <!--科室规则排序-->
                <div class="ks-fy-zb" style="padding-bottom: 0">
                    <div class="body-width fy-line-div" id="num8">
                        <div class="fy-bar-div" id="bar12">

                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--科室违规-->
                <div class="ks-fy-zb ks-tables" style="display: none;">
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="common-table" id="wgDepartLayer">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--医师违规-->
                <div class="ks-fy-zb ys-tables" style="display: none;">
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="common-table" id="wgDoctorLayer">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                <!--违规单据-->
                <div class="ks-fy-zb ks-nm-div" style="display: none">
                    <div class="gauge-title-div">
                        <table class="body-width" id="wgDocumentLayer_doc">
                            <tr>
                                <td class="left fs_16 table-title">违规单据汇总</td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table zy-table1">
                               
                            </table>
                            <table class="body-width common-table mz-table1">
                                
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
                    <div class="body-width padding10 pad-top0">
                        <div class="ys-rc-div">
                            <table class="body-width common-table">
                                
                            </table>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
        </div>
    </div>
    <!--弹出层2-->
</div>
    <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
    <script src="${path }/static/js/jquery.easyui.min.js"></script>
    <script src="${path }/static/js/common.js"></script>
    <script src="${staticPath }/static/dataMonitoring/violationSummary.js"></script>
    <script src="${path }/static/js/jquery.combo.select.js"></script>   
    <script>
    
    var myChartBarmwggz;// 违规规则排序
	var myChartBar2kswgqk;// 科室违规情况
	var myChart;		//门规病种--月度变化趋势
  	var myChartBarline8;//门规病种--违规规则排序
  	var myChartBarline9;//门规病种--科室违规情况
  	var Chart_bar1_ptzy;//普通住院--预算监控--月使用额度
  	var Chart_bar2_ptzy;//普通住院--预算监控--年累计额度
	var myChart_ptzy_zb;//普通住院--关键指标--月度变化趋势
	var myChartBar_zyDepart;//普通住院--违规汇总--科室违规
	var myChartBar_zyOrder;//普通住院--违规汇总--规则违规
	var myChart_bzzb;//住院病种--病种指标--月度变化趋势
	var myChartBar_upLayer_docOrDepart;//普通门诊--弹出层医师/科室违规
	var myChartBar_upLayer_order;//普通门诊--弹出层规则违规
	// 弹出层  弹出时携带的参数
	var paramName;  //参数名称
	var data;		//参数具体数据
	var methodFlag;	//柱图的请求
	var url;		//datagrid请求
	var lx;			//规则、科室、医师违规？
	var numLX;		//0--住院、1--门规、2--门诊
	var title;		//对应类型的title
	var field;		//获取后台参数
    var monthlyTrendZY_data={};   //普通住院-关键指标-月度变化趋势数据
    var monthlyTrendBZ_data=[];   //住院病种-病种指标-月度变化趋势数据
    
    
        $(function () {
        	getQueryData();
            $("#selectYear,#selectMonth,#cblxbm").comboSelect();
            $("#selectYear").parent().css({"width":"8%"});
            $("#selectMonth").parent().css({"width":"6%"});
            $("#cblxbm").parent().css({"width":"10%"});
            var x_data1;
            var bar_data;
            var ks_ys_data = ['心血管内科', '消化内科', '呼吸科', '肾内科', '血液科', '骨科'];
            /*初始化*/
            $(document).ready(function () {
                $(".rj").css("display","none");
                $(".rj1").css("display","none");
                $(".zy-div1").css("display","none");
                $(".zy-div2").css("display","none");
                $(".bz-div1").css("display","none");
                $(".bz-div2").css("display","none");
                $(".bz-div3").css("display","none");
                $(".mt-div1").css("display","none");
                $(".mt-div2").css("display","none");
                $(".mg-div1").css("display","none");
                $(".mg-div2").css("display","none");
                departmentaamount();
                bar();
                monitorBudget();
                x_data1 = ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'];
                bar_data = [22, 14, 10, 7, 6,5 ];
            });
            //获取浏览器滚动条宽度
            function getScrollWidth() {
                var noScroll, scroll, oDiv = document.createElement("DIV");
                oDiv.style.cssText = "position:absolute;top:-1000px;width:100px;height:100px;   overflow:hidden;";
                noScroll = document.body.appendChild(oDiv).clientWidth;
                oDiv.style.overflowY = "scroll";
                scroll = oDiv.clientWidth;
                document.body.removeChild(oDiv);
                return noScroll-scroll;
            }
            /*累计人均单选框事件*/
            //病种指标
            $(".rj-rad").click(function () {
                $("#bzzb_lj").css("display","none");
                $("#bzzb_rj").css("display","block");
                diseaseIndexRJ();
            });
            $(".lj-rad").click(function () {
                $("#bzzb_rj").css("display","none");
                $("#bzzb_lj").css("display","block");
                diseaseIndexLJ();
            });
            //介入治疗单选框
            $(".rj-rad1").click(function () {
                $("#jrzl_lj").css("display","none");
                $("#jrzl_rj").css("display","block");
                treatmentIndicatorsRJ();
            });
            $(".lj-rad1").click(function () {
                $("#jrzl_rj").css("display","none");
                $("#jrzl_lj").css("display","block");
                treatmentIndicatorsLJ();
            });
            /*一级选项卡*/
            $(".tab-table ul li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-table-box > div").eq(index).css("display", "block").siblings().css("display", "none");
                
                if (index == 0) {
                    $("#tab1 li").eq(0).trigger('click');
                    $(".zy-div1").css("display","none");
                    $(".zy-div2").css("display","none");
                    bar();
                    departmentaamount();
                }
                else if (index == 1){
                    $("#tab2 li").eq(0).trigger('click');
                    $(".bz-div1").css("display","none");
                    $(".bz-div2").css("display","none");
                    $(".bz-div3").css("display","none");
                     keyIndexBZ();
                }
                else if (index == 3){
                	
                    $("#tab4 li").eq(0).trigger('click');
                    summaryIndicators();
                }
                else if(index == 2){
                    $("#tab3 li").eq(0).trigger('click');
                    departZB();
                }

            });
            //普通住院选项卡
            $("#tab1 li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                hiddenInterface();
                $(".tab-div-box1 > div").eq(index).css("display", "block").siblings().css("display", "none");
                if(index == 1){
                    
                    keyIndexZY();
                    // monthlyTrendZY();
                    line1()                   
                }
                else if(index == 2){
                    bar2();
                    zywgDocument();
                    $(".tab1s li").eq(0).trigger('click');
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            //普通住院-违规汇总
            $(".tab1s li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-table-box1s > div").eq(index).css("display", "block").siblings().css("display", "none");
                if (index == 0) {
                    bar2();
                    zywgDocument();
                    $(".ks-nm-div").css("display","none");
                    $(".ks-nm-div-name-div").css("display","none");
                }
                else if (index == 1){
                    bar3();
                    zywgDocument();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            //住院病种选项卡
            $("#tab2 li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-div-box2 > div").eq(index).css("display", "block").siblings().css("display", "none");
                if(index==0){
                     keyIndexBZ();
                }
                else if(index == 1){
                    diseaseIndexLJ();
                    line2();
                }
                else if(index == 2){
                    $(".tab2s li").eq(0).trigger('click');
                    bar4();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }else if(index==3){
                    treatmentIndicatorsLJ();
                }
            });
            //住院病种-违规汇总
            $(".tab2s li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-table-box2s > div").eq(index).css("display", "block").siblings().css("display", "none");
                if (index == 0) {
                    bar4();
                    $(".ks-nm-div").css("display","none");
                    $(".ks-nm-div-name-div").css("display","none");
                }
                else if (index == 1){
                    bar5();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            //门规病种选项卡
            $("#tab3 li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-div-box3 > div").eq(index).css("display", "block").siblings().css("display", "none");
                
                if(index==0){
                	departZB();
                }else if(index == 1){
                    line4();
                    bar10();
                    $(".tk-tabs li").eq(1).text("科室违规情况");
                    getmgquotaDataGrid();
                    findmonthcostofMg();
                }
                else if(index == 2){

                    $(".tab3s li").eq(0).trigger('click');
                    bar8();
                    wggzOrder();
        			wggzOrderTable();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            //门规病种-违规汇总
            $(".tab3s li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
              	
                $(".tab-table-box3s > div").eq(index).css("display", "block").siblings().css("display", "none");
                if (index == 0) {
                    bar8();
                    wggzOrder();
                    wggzOrderTable();
                    $(".ks-nm-div").css("display","none");
                    $(".ks-nm-div-name-div").css("display","none");
                }
                else if (index == 1){
                	 bar9();
                     wgdepartOrder();
                     wgdepartOrderTable();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            //门诊统筹选项卡 普通门诊
            $("#tab4 li").click(function () {
            	
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-div-box4 > div").eq(index).css("display", "block").siblings().css("display", "none");
                if(index ==0){
                	summaryIndicators();
                	line3();
                }
                if(index == 1){
                	mzTable();
                	lineChart();
                	bar10();
                	$(".tk-tabs li").eq(1).text("医师违规情况");
                }
                else if(index == 2){
                    $(".tab4s li").eq(0).trigger('click');
                    bar6();
                    mzwggzOrder();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            //门诊统筹-违规汇总
            $(".tab4s li").click(function () {
            	
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".tab-table-box4s > div").eq(index).css("display", "block").siblings().css("display", "none");
                if (index == 0) {
               		
                    bar6();
               		mzwggzOrder();
               		mzwggzOrderTable();
                    $(".ks-nm-div").css("display","none");
                    $(".ks-nm-div-name-div").css("display","none");
                }
                else if (index == 1){
                	
                    bar7();
                	mzwgdepartOrder();
                	mzwgdepartOrderTable();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            /*弹出框*/
            var  bag = false;
            $(".wg-bills , .wg-bill2s").click(function () {
                //获取被按下按钮的索引值，需要注意index是从0开始的
                $(".BgDiv3").css("z-index", "100");
                $(".BgDiv3").css({display: "block", height: $(document).height()});
                $(".DialogDiv3").css("top", "5%");
                $(".DialogDiv3").css("display", "block");
                document.documentElement.scrollTop = 0;
                bar10();
                if($(this).hasClass("wg-bill2s")){
                    bag=true;
                    $(".tk-tabs li").eq(1).text('医师违规情况');

                }else{
                    $(".tk-tabs li").eq(1).text('科室违规情况');

                }
                $(".tk-tabs li").eq(0).trigger('click');
            });
            $(".BgDiv3,#closes").click(function () {
                $(".BgDiv3").css("display", "none");
                $(".DialogDiv3").css("display", "none");
                $(".nm-div").css("display","none");
                $(".nm-div-name-div").css("display","none");
                $(".ks-nm-div").css("display","none");
                $(".ks-nm-div-name-div").css("display","none");
                paramName = null;
    			data = null;
    			methodFlag = null;
    			url = null;
    			lx = null;
    			title = null;
    			field = null;
            });
            /*弹出层选项卡*/
            $(".tk-tabs li").click(function () {
                $(this).addClass("on").siblings().removeClass("on");
                //切换选中的按钮高亮状态
                var index = $(this).index();
                //获取被按下按钮的索引值，需要注意index是从0开始的
                //$(".tab-table-box5s > div").eq(index).css("display", "block").siblings().css("display", "none");

                if (index == 0) {
                    bar10();
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                    clickLeft(paramName,data,lx,numLX);
                    $(".ks-nm-div").css("display","none");
                    $(".ks-nm-div-name-div").css("display","none");
                }
                else if (index == 1){
                    clickRight(paramName,data,lx,numLX);
                    $(".nm-div").css("display","none");
                    $(".nm-div-name-div").css("display","none");
                }
            });
            /*弹出层-违规规则排序-违规单据数点击事件*/
            $(".nm").click(function () {
                $(".nm-div").css("display","block");
            });
            $(".nm-div-name").click(function () {
                $(".nm-div-name-div").css("display","block");
            });
            $(".ks-nm").click(function () {
                $(".ks-nm-div").css("display","block");
            });
            $(".ks-nm-div-name").click(function () {
                $(".ks-nm-div-name-div").css("display","block");
            });
            //下拉框选项
            $("#switch-select").on({
                "change":function(){
                    var index= $('#switch-select option:selected').index();
                    if(index==2){
                        $("#radar").hide();
                        x_data1 = ['恶性肿瘤','肾功能衰竭','帕金森氏病','白血病','系统性红斑狼疮'];
                        bar_data = [12, 11, 2, 9, 4, 16];
                    }else{
                        $("#radar").show();
                        x_data1 = ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'];
                        bar_data = [22, 7, 5, 6, 14, 10];
                    }
                    line();
                }
            });
            /*普通住院-基金利用-柱状图*/
            function bar() {
                var mouth_s_color;
                var year_s_color;
                var normal_color = "#73AA4D";
                var abnormal_color = "#FF2256"
                //柱状图1
                 Chart_bar1_ptzy = echarts.init(document.getElementById('bar1'));
                var mouth_x_date = 2000000;
                var mouth_s_date = 2500000;
                if (mouth_x_date > mouth_s_date) {
                    mouth_s_color = normal_color
                }
                else {
                    mouth_s_color = abnormal_color
                }
                // 指定图表的配置项和数据
                option_bar1_ptzy = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    grid: {
                        left: '2%',
                        right: '24%',
                        bottom: '3%',
                        top: '10%',
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
                        data: [{value: '月使用额度', textStyle: {fontSize: 14}}],
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        }
                    },
                    series: [{
                        name: '月预算',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#CCCCCC',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 12,
                        barGap: '-100%', // Make series be overlap
                        data: [mouth_x_date],
                        markPoint: {
                            symbol:'rect',
                            symbolSize: [2, 26],
                            symbolOffset:[0,'70%'],
                            data: [
                                {name: '月预算', value: mouth_x_date, xAxis: mouth_x_date},
                            ],
                            label: {
                                normal: {
                                    show: true,
                                    position:'right',
                                    formatter: '月预算:{c}元',
                                    textStyle: {
                                        color: "#000",
                                        fontSize: 14
                                    }
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: '#2C92B5'
                                }
                            }
                        }
                    }, {
                        name: '月使用额度',
                        type: 'bar',
                        barWidth: 12,
                        z: 10,
                        data: [{
                            value: mouth_s_date,
                            itemStyle: {normal: {color: mouth_s_color, barBorderRadius: 80, opacity: 0.6}}
                        }
                        ],
                        label: {
                            normal: {
                                show: true,
                                position:'right',
                                formatter: '{c}元',
                                offset: [-56, -20],
                                textStyle: {
                                    color: mouth_s_color,
                                    fontSize: 14,
                                    opacity: 1
                                }
                            }
                        }
                    }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                Chart_bar1_ptzy.setOption(option_bar1_ptzy);
                //柱状图2
                 Chart_bar2_ptzy = echarts.init(document.getElementById('bar2'));
                var year_x_date = 4560000;
                var year_s_date = 4260000;
                if (year_x_date > year_s_date) {
                    year_s_color = normal_color
                }
                else {
                    year_s_color = abnormal_color
                }
                // 指定图表的配置项和数据
                option_bar2_ptzy = {
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
                        top: '10%',
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
                        data: [{value: '年累计额度', textStyle: {fontSize: 14}}],
                        axisLine: {
                            show: false
                        },
                        axisTick: {
                            show: false
                        }
                    },
                    series: [
                        {
                        name: '年累计额度',
                        type: 'bar',
                        barGap: '-100%', // Make series be overlap
                        barWidth: 12,
                        z: 10,
                        data: [{
                            value: year_s_date,
                            itemStyle: {normal: {color: year_s_color, barBorderRadius: [80], opacity: 0.6}}
                        }
                        ],
                        label: {
                            normal: {
                                show: true,
                                position: 'right',
                                formatter: '{c}元',
                                offset: [-20, -20],
                                textStyle: {
                                    color: year_s_color,
                                    fontSize: 14,
                                    opacity: 1
                                }
                            }
                        }

                    }, {
                        name: '年预算',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#CCCCCC',
                                barBorderRadius: [80]
                            }
                        },
                        silent: true,
                        barWidth: 12,

                        data: [year_x_date],
                        markPoint: {
                            symbol:'rect',
                            symbolSize: [2, 26],
                            symbolOffset:[0,'70%'],
                            data: [{value: year_x_date, xAxis: year_x_date}],
                            label: {
                                normal: {
                                    show: true,
                                    position:'right',
                                    formatter: '年预算:{c}元',
                                    textStyle: {
                                        color: "#000",
                                        fontSize: 14
                                    }
                                }
                            },
                            itemStyle: {
                                normal: {
                                    color: '#278EB1'
                                }
                            }
                        }
                    }]
                };
                // 使用刚指定的配置项和数据显示图表。
                Chart_bar2_ptzy.setOption(option_bar2_ptzy);

                window.addEventListener("resize", function () {
                	Chart_bar1_ptzy.resize();
                	Chart_bar2_ptzy.resize();
                });
            };
            
            function monitorBudget(){
            	$.ajax({
       				type: "POST",
       				url:"${path }/costStruct/selectEcharsData?methodFlag=findquota",
       			    cache: false,
       			    async : false,
       			    dataType: "json",	
       				data:$('#dataSearchForm').serialize(),	//form表单
       				success:function(data){
       					if(data=="" || JSON.stringify(data) == "{}"){
       						option_bar1_ptzy.series[0].markPoint.data[0].value = 0;//月预算
       						option_bar1_ptzy.series[0].markPoint.data[0].xAxis = 0;
       						option_bar1_ptzy.series[0].data[0] = 0;
       		             	option_bar1_ptzy.series[1].data[0].value = 0;//月使用
       		             	Chart_bar1_ptzy.setOption(option_bar1_ptzy);
       		             	
       		             	option_bar2_ptzy.series[1].markPoint.data[0].value = 0;//年预算
    						option_bar2_ptzy.series[1].markPoint.data[0].xAxis = 0;
    						option_bar2_ptzy.series[1].data[0] = year_x_date;
    		             	option_bar2_ptzy.series[0].data[0].value = 0;//年使用
    		             	Chart_bar2_ptzy.setOption(option_bar2_ptzy);
       					}else{
       						var mouth_x_data = data.findquota_value0[0];
       						var mouth_s_data = data.findquota_value1[0];
       						var year_x_date = data.findquota_value2[0];
       						var year_s_date = data.findquota_value3[0];
       						
       		                option_bar1_ptzy.series[0].markPoint.data[0].value = mouth_x_data;//月预算
       		             	option_bar1_ptzy.series[0].markPoint.data[0].xAxis = mouth_x_data;
       		             	option_bar1_ptzy.series[0].data[0] = mouth_x_data;
       		             	option_bar1_ptzy.series[1].data[0].value = mouth_s_data;//月使用
       		             	Chart_bar1_ptzy.setOption(option_bar1_ptzy);
       		             	
	       		            option_bar2_ptzy.series[1].markPoint.data[0].value = year_x_date;//年预算
	 						option_bar2_ptzy.series[1].markPoint.data[0].xAxis = year_x_date;
	 						option_bar2_ptzy.series[1].data[0] = year_x_date;
	 		             	option_bar2_ptzy.series[0].data[0].value = year_s_date; //年使用
	 		             	Chart_bar2_ptzy.setOption(option_bar2_ptzy);
       					}
       				}
            	});		
            };
            
            function departmentaamount() {
            	var cblxbm=$('#cblxbm').val();
            	$('#quotaGrid').datagrid({
                    url : '${path }/wholeHospitalOverview/quoatgrid',
                    fit : false,
                    striped : true,
                    queryParams: {          
                    	syear:$('#selectYear').val(),
                    	smonth:$('#selectMonth').val(),
                    	cblxbm:cblxbm
                      } ,
           	 	   	singleSelect:true, 
           	 		pagination : true,
                    pageSize : 10,
                    pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
                    columns : [ [
                    {
                        width : '15%',
                        title : '科室',
                        field : 'KS' 
                    },{
                        width : '15%',
                        title : '是否超额',
                        field : 'SFCE'
                  
                    },  {
                        width : '35%',
                        title : '月使用额度/月预算',
                        field : 'YSYED'
                   
                    }, {
                        width : '35%',
                        title : '年累积额度/年预算',
                        field : 'NLJED'
                        
                    } ,{
                    	hidden:true,    
                        field : 'ysgh'       
                    }     
                    ] ]                  
                });
			}
            //普通住院--关键指标
            function keyIndexZY(){
            	$.ajax({
       				type: "POST",
       				url:"${path }/wholeHospitalOverview/keyIndexZY",
       			    cache: false,
       			    async : false,
       			    dataType: "json",	
       				data:$('#dataSearchForm').serialize(),	//form表单
       				success:function(data){
       					//限定值   未写
       					if(data.length!=0){
       						for(var i=0;i<10;i++){
       							var temp = "."+data[i].key;
       							$(temp).find("p").eq(0).text(data[i].value);
       							compareLastMon(data,temp,i, 1);
       						}
       					}else{
       						var arrKey = [".CYRC_ZY",".YLF_ZY",".YBTCZF_ZY",".HZFDB_ZY",".WGDJS_ZY",".RJYLF_ZY",".RJYF_ZY",".RJHCF_ZY",".YLZFB_ZY",".ZFB_ZY"];
       						for(var i=0;i<10;i++){
       							$(arrKey[i]).find("p").eq(0).text('-');
       						}
       						compareLastMon(data,arrKey,i, 1);
       					}
       					
       				}
            	});	
            }
            
            //数据：普通住院--月度变化趋势
            function monthlyTrendZY(){
            	$.ajax({
        			type: "POST",
        			url:"${path }/costStruct/selectEcharsData?methodFlag=monthlyTrendPTZY",
        		    cache: false,
        		    async : false,
        		    dataType: "json",	
        			data:$('#dataSearchForm').serialize(),	
        			success:function(data){
        	 	    	if(JSON.stringify(data) != "{}"){
                            monthlyTrendZY_data={};
                            /* $.each(data,function(key,n){
                            	alert(key);
                                monthlyTrendZY_data.push(n);
                                console.log(monthlyTrendZY_data);
                            }); */
                            monthlyTrendZY_data=data;
        				}
        			}
        		 });
            };
           
            /*普通住院-违规汇总-违规规则排序-柱状图*/
            function bar2(){
                // 柱状图2
                myChartBar_zyOrder = echarts.init(document.getElementById('bar3'));
                // 指定图表的配置项和数据
                option_zyOrder = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 
                        }
                    },
                    legend: {
                        right: '3%',
                        top: 0,
                        itemWidth:11,
                        itemHeight:11,
                        data: [ '违规单据数'],
                        selectedMode:'single'
                    },
                    grid: {
                        top: 54,
                        left: '3%',
                        right: '6%',
                        bottom: '18%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: [],
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
                                show: true,
                                lineStyle: {
                                    /*color:'#dedede'*/
                                    type:'dashed'
                                }
                            },
                        }
                    ],
                    series: [
                        {
                            name: '违规单据数',
                            type: 'bar',
                            itemStyle: {
                                normal: {
                                    color: '#41afd6',
                                    barBorderRadius: [80]
                                }
                            },
                            barWidth: 12,
                            barGap: 0.1,
                            data: []
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar_zyOrder.setOption(option_zyOrder);

                window.addEventListener("resize", function () {
                	myChartBar_zyOrder.resize();
                });
            };
            /*普通住院-违规汇总-科室违规情况-柱状图*/
            function bar3(){
                // 柱状图2
                myChartBar_zyDepart = echarts.init(document.getElementById('bar4'));
                // 指定图表的配置项和数据
                option_zyDepart = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        right: '10%',
                        top: 0,
                        itemWidth:11,
                        itemHeight:11,
                        data: [ '规单据数'],
                        selectedMode:'single'
                    },
                    grid: {
                        top: 54,
                        left: '3%',
                        right: '3%',
                        bottom: '19%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: ks_ys_data,
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
                                show: true,
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
                            barWidth: 12,
                            barGap: 0.1,
                            data: [50, 40, 34, 28, 21, 19]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar_zyDepart.setOption(option_zyDepart);

                window.addEventListener("resize", function () {
                    myChartBar_zyDepart.resize();
                });
            };
            /*住院病种-违规汇总-违规规则排序-柱状图*/
            function bar4(){
                // 柱状图2
                myChartBar = echarts.init(document.getElementById('bar5'));
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
                        itemWidth:11,
                        itemHeight:11,
                        data: [ '违规单据数'],
                        selectedMode:'single'
                    },
                    grid: {
                        top: 54,
                        left: '3%',
                        right: '3%',
                        bottom: '19%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: [],
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
                                show: true,
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
                                    color: '#41afd6',
                                    barBorderRadius: [80]
                                }
                            },
                            barWidth: 12,
                            barGap: 0.1,
                            data: []
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar.setOption(option_bar4);

                window.addEventListener("resize", function () {
                    myChartBar.resize();
                });
            };
            /*住院病种-违规汇总-科室违规情况-柱状图*/
            function bar5(){
                // 柱状图2
                var myChartBar = echarts.init(document.getElementById('bar6'));
                // 指定图表的配置项和数据
                option_bar5 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        right: '10%',
                        top: 0,
                        itemWidth:11,
                        itemHeight:11,
                        data: [ '违规单据数'],
                        selectedMode:'single'
                    },
                    grid: {
                        top: 54,
                        left: '2%',
                        right: '3%',
                        bottom: '6%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: ks_ys_data,
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
                                show: true,
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
                            barWidth: 12,
                            barGap: 0.1,
                            data: [50, 40, 34, 28, 21, 19]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar.setOption(option_bar5);

                window.addEventListener("resize", function () {
                    myChartBar.resize();
                });
            };
            /*普通门诊-违规汇总-违规规则排序-柱状图*/
            function bar6(){
        
                // 柱状图2
                myChartBarmwggz = echarts.init(document.getElementById('bar7'));
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
                        left: '3%',
                        right: '3%',
                        bottom: '19%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: [],
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
                                show: true,
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
                                    color: '#41afd6',
                                    barBorderRadius: [80]
                                }
                            },
                            barWidth: 12,
                            barGap: 0.1,
                            data: [40, 23, 18, 17, 15, 13]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBarmwggz.setOption(option_bar4);

                window.addEventListener("resize", function () {
                	myChartBarmwggz.resize();
                });
            };
            /*普通门诊-违规汇总-科室违规情况-柱状图*/
            function bar7(){
                // 柱状图2 
                myChartBar2kswgqk = echarts.init(document.getElementById('bar8'));
                // 指定图表的配置项和数据
                option_bar5 = {
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
                        bottom: '19%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: ks_ys_data,
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
                                show: true,
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
                            barWidth: 12,
                            barGap: 0.1,
                            data: [50, 40, 34, 28, 21, 19]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar2kswgqk.setOption(option_bar5);

                window.addEventListener("resize", function () {
                	myChartBar2kswgqk.resize();
                });
            };
            /*门诊病种-违规汇总-违规规则排序-柱状图*/
            function bar8(){
                // 柱状图2
                 myChartBarline8 = echarts.init(document.getElementById('bar9'));
                // 指定图表的配置项和数据
                option_barline8 = {
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
                        bottom: '21%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: ['超适应症用药', '限性别', '限儿童', '限就医方式', '重复收费', '重复取药'],
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
                    yAxis:[
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
                    series:  [
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
                            data: [50, 40, 34, 28, 21, 19]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBarline8.setOption(option_barline8);

                window.addEventListener("resize", function () {
                	myChartBarline8.resize();
                });
            };
            /*门规病种-违规汇总-科室违规情况-柱状图*/
            function bar9(){
                // 柱状图2
                myChartBarline9 = echarts.init(document.getElementById('bar10'));
                
                // 指定图表的配置项和数据
                option_barline9 = {
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
                                data: ['心血管内科', '消化内科', '呼吸科', '肾内科', '血液科', '骨科'],
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
                                data: [50, 40, 34, 28, 21, 19]
                            }
                        ]
                    };
                // 使用刚指定的配置项和数据显示图表。
                  myChartBarline9.setOption(option_barline9);

                window.addEventListener("resize", function () {
                	myChartBarline9.resize();
                });
            };
            /*门规病种-门规病种统计-弹出框-违规规则排序-柱状图*/
            function bar10(){
                // 柱状图2
                var scrollWidth=getScrollWidth();
                var bar11_width=$(window).width()*0.8-2-scrollWidth*(1-0.02)-scrollWidth;
                $("#bar11").css({"width":bar11_width});
                myChartBar_upLayer_order = echarts.init(document.getElementById('bar11'));
                // 指定图表的配置项和数据
                option_bar4_layer = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        right: '10%',
                        top: 0,
                        itemWidth:11,
                        itemHeight:11,
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
                            data: ['超适应症用药', '限性别', '限儿童', '限就医方式', '重复收费', '重复取药'],
                            axisLabel: {
                                textStyle: {
                                    color: '#333333',
                                    fontWeight:700
                                },
                                rotate:-30,
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
                                show: true,
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
                                    color: '#41afd6',
                                    barBorderRadius: [80]
                                }
                            },
                            barWidth: 12,
                            barGap: 0.1,
                            data: [],/*[40, 23, 18, 17, 15, 13]*/
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar_upLayer_order.setOption(option_bar4_layer);

                window.addEventListener("resize", function () {
                    var bar11_resizeWidth=$(window).width()*0.8-2-scrollWidth*(1-0.02)-scrollWidth;
                    $("#bar11").css({"width":bar11_resizeWidth});  
                	myChartBar_upLayer_order.resize();
                });
            };
            /*弹出层-违规汇总-科室违规情况-柱状图*/
            function bar11(){
                monthlyTrendZY();
                // 柱状图2
                myChartBar_upLayer_docOrDepart = echarts.init(document.getElementById('bar12'));
                // 指定图表的配置项和数据
                option_bar5 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        right: '10%',
                        top: 0,
                        itemWidth:11,
                        itemHeight:11,
                        data: [ '违规单据数'],
                        selectedMode:'single'
                    },
                    grid: {
                        top: 54,
                        left: '2%',
                        right: '3%',
                        bottom: '6%',
                        containLabel: true
                    },
                    xAxis: [
                        {
                            type: 'category',
                            axisPointer: {
                                type: 'shadow'
                            },
                            data: ks_ys_data,
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
                                show: true,
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
                            barWidth: 12,
                            barGap: 0.1,
                            data: [50, 40, 34, 28, 21, 19]
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChartBar_upLayer_docOrDepart.setOption(option_bar5);

                window.addEventListener("resize", function () {
                	myChartBar_upLayer_docOrDepart.resize();
                });
            };
            /*普通住院-月度变化趋势-折线图*/
            function line1() {
               monthlyTrendZY();
                // 基于准备好的dom，初始化echarts图表
                myChart_ptzy_zb = echarts.init(document.getElementById('line1'));
                option_ptzy_zb = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross'
                        }
                    },
                    legend: {
                        right: "20%",
                        width:'60%',
                        top: '0%',
                        itemWidth:10,
                        itemHeight:10,
                        data: [
                            {
                                name: '出院人次',
                                icon: 'roundRect'
                            },
                            {
                                name: '医疗总费用',
                                icon: 'roundRect'
                            },
                            {
                                name: '医保统筹支付',
                                icon: 'roundRect'
                            },
                            {
                                name: '月度超额人次',
                                icon: 'roundRect'
                            },
                            {
                                name: '违规单据数',
                                icon: 'roundRect'
                            },
                            {
                                name : '',
                                textStyle : '',
                                icon : ''
                            },
                            {
                                name: '人均医疗费用',
                                icon: 'roundRect'
                            },

                            {
                                name: '人均药费',
                                icon: 'roundRect'
                            },
                            {
                                name: '人均检查检验费',
                                icon: 'roundRect'
                            },
                            {
                                name: '人均耗材费',
                                icon: 'roundRect'
                            },
                            {
                                name: '人均治疗费',
                                icon: 'roundRect'
                            }
                        ]
                    },
                    grid: {
                        top: '28%',
                        left: '2%',
                        right: '4%',
                        bottom: '1%',
                        containLabel: true
                    },
                    toolbox: {
                        show: true,
                        left: "20%",
                        top: "0%",
                        feature: {
                            magicType: {type: ['line', 'bar']}
                        }
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data:monthlyTrendZY_data.monthlyTrendPTZY_value10,
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
                            axisLine: {show: false,lineStyle:{color:'#666666'}},
                            axisTick: {
                                show: false
                            },
                            splitLine: {
                                show: false
                            },
                            axisLabel: {
                                formatter: '{value}',
                                textStyle: {
                                    color: '#999'
                                }

                            }
                        }
                    ],
                    itemStyle:{
                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10]
                        }
                    },
                    series: [
                        {
                            name: "出院人次",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#45C8DB'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value0

                        },
                        {
                            name: "医疗总费用",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#FF9948'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value1

                        },
                        {
                            name: "医保统筹支付",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#45C8DB'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value2

                        },
                        {
                            name: "月度超额人次",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#E27AB0'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value3
                        },
                        {
                            name: "违规单据数",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#7A8BE2'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value4
                        },
                        {
                            name: "人均医疗费用",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#E27AB0'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value5
                        },
                        {
                            name: "人均药费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#5FC14C'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value6
                        },
                        {
                            name: "人均检查检验费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#C085E4'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value7
                        },
                        {
                            name: "人均耗材费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#F1082E'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value8
                        },
                        {
                            name: "人均治疗费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#BFE26C'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendZY_data.monthlyTrendPTZY_value9
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart_ptzy_zb.setOption(option_ptzy_zb);

                var triggerAction = function (action, selected) {
                    legend = [];

                    for (name in selected) {
                        if (selected.hasOwnProperty(name)) {
                            legend.push({name: name});
                        }
                    }
                    myChart_ptzy_zb.dispatchAction({
                        type: action,
                        batch: legend
                    });
                };

                var isFirstUnSelect = function (selected) {
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

                var isAllUnSelected = function (selected) {
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

                myChart_ptzy_zb.on('legendselectchanged', function (obj) {
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

                window.addEventListener("resize", function () {
                	myChart_ptzy_zb.resize();
                });
            }
            /*单病种-月度变换趋势-折线图*/
            function line2() {
         
                monthlyTrendBZ()  
                // 基于准备好的dom，初始化echarts图表
                myChart_bzzb = echarts.init(document.getElementById('line2'));
                option_bzzb = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        top: '0%',
                        right: "10%",
                        width:'66%',
                        itemWidth:10,
                        itemHeight:10,
                        data: [
                            {
                                name: '收治人次',
                                icon: 'roundRect'
                            },
                            {
                                name: '平均住院日',
                                icon: 'roundRect'
                            },
                            {
                                name: '医疗总费用',
                                icon: 'roundRect'
                            },
                            {
                                name: '医保统筹支付',
                                icon: 'roundRect'
                            },
                            {
                                name: '超定额人次',
                                icon: 'roundRect'
                            },
                            {
                                name: '超定额总费用',
                                icon: 'roundRect'
                            },
                            {
                                name: '违规单据数',
                                icon: 'roundRect'
                            },
                            {
                                name : '',
                                textStyle : '',
                                icon : ''
                            },
                            {
                                name: '人均药费',
                                icon: 'roundRect'
                            },
                            {
                                name: '人均检查检验费',
                                icon: 'roundRect'
                            },
                            {
                                name: '人均手术麻醉费',
                                icon: 'roundRect'
                            },
                            {
                                name:'人均医用耗材费',
                                icon: 'roundRect'
                            },
                            {
                                name:'人均高值耗材费',
                                icon: 'roundRect'
                            },
                            {
                                name:'人均治疗费',
                                icon: 'roundRect'
                            }
                            ,
                            {
                                name:'人均血费',
                                icon: 'roundRect'
                            }
                        ]
                    },
                    grid: {
                        top: '28%',
                        left: '2%',
                        right: '4%',
                        bottom: '1%',
                        containLabel: true
                    },
                    toolbox: {
                        show: true,
                        left: "20%",
                        top: "0%",
                        feature: {
                            magicType: {type: ['line', 'bar']}
                        }
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: monthlyTrendBZ_data[14]
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
                            name: '人次',
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
                    itemStyle:{
                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10]
                        }
                    },
                    series: [
                        {
                            name: "收治人次",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#45C8DB'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[0]
                        },
                        {
                            name: "平均住院日",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#FF9948'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[1]
                        },
                        {
                            name: "医疗总费用",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#45C8DB'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[2]
                        },
                        {
                            name: "医保统筹支付",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#E27AB0'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[3]
                        },
                        {
                            name: "超定额人次",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#7A8BE2'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[4]
                        },
                        {
                            name: "超定额总费用",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#E27AB0'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[5]
                        },
                        {
                            name: "违规单据数",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#5FC14C'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[6]
                        },
                        {
                            name: "人均药费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#C085E4'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[7]
                        },
                        {
                            name: "人均检查检验费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#F1082E'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[8]
                        },
                        {
                            name: "人均手术麻醉费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#BFE26C'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[9]
                        },
                        {
                            name: "人均医用耗材费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#3366CC'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[10]
                        },
                        {
                            name: "人均高值耗材费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#FF9900'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[11]
                        },
                        {
                            name: "人均治疗费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#669900'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[12]
                        },
                        {
                            name: "人均血费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#999966'
                                }
                            },
                            symbolSize: 2,
                            data: monthlyTrendBZ_data[13]
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart_bzzb.setOption(option_bzzb);

                var triggerAction = function (action, selected) {
                    legend = [];

                    for (name in selected) {
                        if (selected.hasOwnProperty(name)) {
                            legend.push({name: name});
                        }
                    }
                    myChart_bzzb.dispatchAction({
                        type: action,
                        batch: legend
                    });
                };

                var isFirstUnSelect = function (selected) {
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

                var isAllUnSelected = function (selected) {
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

                myChart_bzzb.on('legendselectchanged', function (obj) {
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

                window.addEventListener("resize", function () {
                	myChart_bzzb.resize();
                });
            }
            /*门统-月度变换趋势-折线图*/
            //function line3() {
            	
            	
            	/* mzTable();
            	
            	lineChart(); */
               
            //}
            /*门统-月度变换趋势-折线图*/
            function line4() {
                // 基于准备好的dom，初始化echarts图表
                 myChart = echarts.init(document.getElementById('line4'));
                 optionline4 = {
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                            type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                        }
                    },
                    legend: {
                        top: '0%',
                        right: "24%",
                        width:'60%',
                        itemWidth:10,
                        itemHeight:10,
                        data: [
                            {
                                name: '就诊人次',
                                icon: 'roundRect'
                            },
                            {
                                name: '月度超额人次',
                                icon: 'roundRect'
                            },
                            {
                                name: '违规单据数',
                                icon: 'roundRect'
                            },
                            {
                                name : '',
                                textStyle : '',
                                icon : ''
                            },
                            {
                                name: '次均医疗费用',
                                icon: 'roundRect'
                            },
                            {
                                name: '次均药费',
                                icon: 'roundRect'
                            },
                            {
                                name: '次均检查检验费',
                                icon: 'roundRect'
                            }
                        ]
                    },
                    grid: {
                        top: '28%',
                        left: '2%',
                        right: '2%',
                        bottom: '1%',
                        containLabel: true
                    },
                    toolbox: {
                        show: true,
                        left: "33%",
                        top: "0%",
                        feature: {
                            magicType: {type: ['line', 'bar']}
                        }
                    },
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            data: ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
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
                            name: '人次',
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
                    itemStyle:{
                        normal: {
                            //柱形图圆角，初始化效果
                            barBorderRadius:[10, 10, 10, 10]
                        }
                    },
                    series: [
                        {
                            name: "就诊人次",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#45C8DB'
                                }
                            },
                            symbolSize: 2,
                            data: []
                        },
                        {
                            name: "月度超额人次",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#FF9948'
                                }
                            },
                            symbolSize: 2,
                            data: []
                        },
                        {
                            name: "违规单据数",
                            type: "line",
                            yAxisIndex: 1,
                            itemStyle: {
                                normal: {
                                    color: '#45C8DB'
                                }
                            },
                            symbolSize: 2,
                            data: []
                        },
                        {
                            name: "次均医疗费用",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#E27AB0'
                                }
                            },
                            symbolSize: 2,
                            data: []
                        },
                        {
                            name: "次均药费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#7A8BE2'
                                }
                            },
                            symbolSize: 2,
                            data: []
                        },
                        {
                            name: "次均检查检验费",
                            type: "line",
                            itemStyle: {
                                normal: {
                                    color: '#E27AB0'
                                }
                            },
                            symbolSize: 2,
                            data: []
                        }
                    ]
                };
                // 为echarts对象加载数据
                myChart.setOption(optionline4);

                var triggerAction = function (action, selected) {
                    legend = [];

                    for (name in selected) {
                        if (selected.hasOwnProperty(name)) {
                            legend.push({name: name});
                        }
                    }
                    myChart.dispatchAction({
                        type: action,
                        batch: legend
                    });
                };

                var isFirstUnSelect = function (selected) {
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

                var isAllUnSelected = function (selected) {
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

                myChart.on('legendselectchanged', function (obj) {
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

                window.addEventListener("resize", function () {
                    myChart.resize();
                });
            }

            $("a,button").focus(function () {
                this.blur()
            });
            
            
            $(".serchdata").click(function () {
            	 var value = $(".queryclass .on").attr("value");//0-普通住院  1-住院病种 2-门规病种  3-普通门诊
            	 hiddenInterface();
            	 if(value == 0){
	            		 var num =  $("#tab1 .on").attr("value");
	            		 if(num == 0){
	            			 monitorBudget();
	            			 departmentaamount();
	            		 }
	            		 if(num == 1){
	            			 keyIndexZY();
	            			 // monthlyTrendZY();
	                         line1()
	            		 }
	            		 if(num == 2){
	            			 zywgDocument();
	            		 }
            	 }
            	 if(value == 1){
	            		 var num =  $("#tab2 .on").attr("value");
	            		 if(num == 0){
	            			 keyIndexBZ();
	            		 }
	            		 if(num == 1){
	            			 diseaseIndexLJ();
	            			 // monthlyTrendBZ();
	                         line2()
	            		 }
	            		 if(num == 2){
	            			 bzwgDocument();
	            		 }
	            		 if( num == 3){
	            			 keyIndexZL();
	            			 treatmentIndicatorsLJ();
	            		 }
            	 }
            	 
            	 if(value == 2){
            		var num =  $("#tab3 .on").attr("value");
            		if(num == 0){
            			departZB();
            		}
            		if(num ==1){
            			getmgquotaDataGrid();
            			findmonthcostofMg();
            		}	
            		if(num ==2){
            			
            			var index =  $(".tab3s .on").attr("value");
            			
            			if(index ==0){
            				wggzOrder();
                			wggzOrderTable();
            			}
            			if(index ==1){
            				wgdepartOrder();
            				wgdepartOrderTable();
            			}
            		
            			
            		}
            		
            		
            	 }
            	 if (value == 3) {
	            		var num =  $("#tab4 .on").attr("value");
	            		if (num==0) {
	            			//$("#tab4 li").eq(0).trigger('click');
	            			//line3();
	            			summaryIndicators();
	            			return false; 
						}
	            		if (num ==1) {
	            			mzTable()
	            			lineChart();
	            			return false; 
						}
	            		if (num ==2) {
	            			var index =  $(".tab4s .on").attr("value");
	            			if (index ==0) {
	            				mzwggzOrder();
	                			mzwggzOrderTable();
							}
	            			if(index ==1){
	            				mzwgdepartOrder();
	            				mzwgdepartOrderTable();
	            			}
	            			return false ; 
						}
				}
                 return false ;
			})
        });
		function getQueryData(){
			var date = new Date();
			var syy= date.getFullYear();
		    for(var sy=0;sy<3;sy++){		
				$('#selectYear').append("<option value='"+(syy-sy)+"'>"+(syy-sy)+"</option>");
			}	
		    var month=date.getMonth()+1
			month=month<10?"0"+month:String(month); 
		    $('#selectMonth').val(month);
	    }
		function keyIndicators(shuju){// 关键指标 循环赋值
			for(var key in shuju){
				  if(shuju[key] != null){
					 $("#"+key).text(shuju[key]);
				  }
			  }
		}
		function keyIndicatorsBJ(data){// 循环比较
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
				  }
			  } 
		}
		function toPercent(data){// 转换成百分数
		    var strData = (data*100).toFixed(1);
		    var ret = strData.toString()+"%";
		    return ret;
		}
		
		function lineChart() {		
			$.ajax({
        		type: "POST",
        		url:"${path }/costStruct/selectEcharsData?methodFlag=mzlinechart",
        	    cache: false,
        	    async : false,
        	    dataType: "json",	
        		data:$('#dataSearchForm').serialize(),	//form表单
        		success:function(data){	
        			var data1 =[];              //data.totalPeople; //就诊人次
        			var data2 =[];              //data.totalMedicalExpenses; //医疗总费用
        			var data3 =[];              //data.totalMedicarePaymentCounts; //医保统筹支付人次
        			var data4 =[];              //data.totalMedicarePayment; //医保统筹支付
        			var data5 =[];              //data.totalViolation; //违规单据数
        			var data6 =[];              //data.averageMedicalExpenses; //次均医疗费用
        			var data7 =[];              //data.averageHerbsExpenses; //次均药费
        			var data8 =[];              //data.averageExaminationExpenses; //次均检查检验费
        			
        			var dataMonth = [];
        			var month = [];
        			if(JSON.stringify(data)!='{}')
        			{
        				 data1 =data.mzlinechart_value0;              
            			 data2 =data.mzlinechart_value1;              
            			 data3 =data.mzlinechart_value2;              
            			 data4 =data.mzlinechart_value3;              
            			 data5 =data.mzlinechart_value4;              
            			 data6 =data.mzlinechart_value5;              
            			 data7 =data.mzlinechart_value6;              
            			 data8 =data.mzlinechart_value7;              
            			
            			 dataMonth = data.mzlinechart_value8;
            			 month = [];
           				$.each(dataMonth,function(i,value){
           					
           					month.push(dataMonth[i]+"月");
           					
           				})
        			}
        			
       			  // 基于准备好的dom，初始化echarts图表
       	             myChart = echarts.init(document.getElementById('line3'));
       				 
       				/*  
       	            var data1 = [120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
       	            var data2 = [36000, 29000, 21470, 19880, 25540, 21860, 19350, 20100, 26320, 19920, 27640, 17630];
       	            var data3 = [36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73];
       	            var data4 = [26000, 27000, 19770, 19880, 17540, 14580, 21010, 22100, 21320, 19820, 22360, 19830];
       	            var data5 = [56, 40, 47, 58, 34, 26, 35, 50, 33, 20, 54, 33];
       	            var data6 = [1000, 1100, 970, 1088, 754, 686, 1135, 900, 632, 720, 464, 533];
       	            var data7 = [480, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
       	            var data8 = [1200, 1100, 1700, 988, 1054, 1186, 1035, 1000, 1320, 1200, 964, 833]; */
       	            
       	            var option = {
       	                tooltip: {
       	                    trigger: 'axis',
       	                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
       	                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
       	                    }
       	                },
       	                legend: {
       	                    top: '0%',
       	                    right: "20%",
       	                    width:'60%',
       	                    itemWidth:10,
       	                    itemHeight:10,
       	                    data: [
       	                        {
       	                            name: '就诊人次',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name: '医疗总费用',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name: '医保统筹支付人次',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name: '医保统筹支付',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name : '',
       	                            textStyle : '',
       	                            icon : ''
       	                        },
       	                        {
       	                            name: '违规单据数',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name: '次均医疗费用',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name: '次均药费',
       	                            icon: 'roundRect'
       	                        },
       	                        {
       	                            name: '次均检查检验费',
       	                            icon: 'roundRect'
       	                        }
       	                    ]
       	                },
       	                grid: {
       	                    top: '28%',
       	                    left: '2%',
       	                    right: '2%',
       	                    bottom: '1%',
       	                    containLabel: true
       	                },
       	                toolbox: {
       	                    show: true,
       	                    left: "30%",
       	                    top: "0%",
       	                    feature: {
       	                        magicType: {type: ['line', 'bar']}
       	                    }
       	                },
       	                xAxis: [
       	                    {
       	                        type: 'category',
       	                        boundaryGap: false,
       	                        data: month// ["1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"]
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
       	                        name: '人次',
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
       	                itemStyle:{
       	                    normal: {
       	                        //柱形图圆角，初始化效果
       	                        barBorderRadius:[10, 10, 10, 10]
       	                    }
       	                },
       	                series: [
       	                    {
       	                        name: "就诊人次",
       	                        type: "line",
       	                        yAxisIndex: 1,
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#45C8DB'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data1
       	                    },
       	                    {
       	                        name: "医疗总费用",
       	                        type: "line",
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#FF9948'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data2
       	                    },
       	                    {
       	                        name: "医保统筹支付人次",
       	                        type: "line",
       	                        yAxisIndex: 1,
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#45C8DB'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data3
       	                    },
       	                    {
       	                        name: "医保统筹支付",
       	                        type: "line",
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#E27AB0'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data4
       	                    },
       	                    {
       	                        name: "违规单据数",
       	                        type: "line",
       	                        yAxisIndex: 1,
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#7A8BE2'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data5
       	                    },
       	                    {
       	                        name: "次均医疗费用",
       	                        type: "line",
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#E27AB0'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data6
       	                    },
       	                    {
       	                        name: "次均药费",
       	                        type: "line",
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#5FC14C'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data7
       	                    },
       	                    {
       	                        name: "次均检查检验费",
       	                        type: "line",
       	                        itemStyle: {
       	                            normal: {
       	                                color: '#C085E4'
       	                            }
       	                        },
       	                        symbolSize: 2,
       	                        data: data8
       	                    }
       	                ]
       	            };
       	            // 为echarts对象加载数据
       	            myChart.setOption(option);

       	            var triggerAction = function (action, selected) {
       	                legend = [];

       	                for (name in selected) {
       	                    if (selected.hasOwnProperty(name)) {
       	                        legend.push({name: name});
       	                    }
       	                }
       	                myChart.dispatchAction({
       	                    type: action,
       	                    batch: legend
       	                });
       	            };

       	            var isFirstUnSelect = function (selected) {
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

       	            var isAllUnSelected = function (selected) {
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

       	            myChart.on('legendselectchanged', function (obj) {
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

       	            window.addEventListener("resize", function () {
       	                myChart.resize();
       	            });
        			
        			
        		}
			});
			
		}
		
		// 普通门诊->违规规则排序
		function mzwggzOrder() {
		    $.ajax({
				type: "POST",
				url:"${path }/costStruct/selectEcharsData?methodFlag=mzwggzOrder",    			
			    cache: false,
			    async : false,
			    dataType: "json",	
				data:$('#dataSearchForm').serialize(),	
				success:function(data){			
					if(JSON.stringify(data) == "{}"){
						option_bar4.xAxis[0].data=[];
						option_bar4.series[0].data=[0]; 	
						myChartBarmwggz.setOption(option_bar4);	
				 	    	}else{
			  		 			var wgdjs = data.mzwggzOrder_value0;
				 	    		var wgmc = data.mzwggzOrder_value1;
				 	    		option_bar4.xAxis[0].data=wgmc;
				 	    		option_bar4.series[0].data=wgdjs;		 	    		
				 	    		myChartBarmwggz.setOption(option_bar4);		 	    		
				 	    	}
				}
			
			}); 
		}
		// 普通门诊->违规规则排序 表格
		function mzwggzOrderTable() {
			   var cblxbm=$('#cblxbm').val();
			$('#mzwggzOrderTable').datagrid({
		     url : '${path }/generalclinic/mzwggzOrderTable',
		     fit : false,
		     striped : true,
		     queryParams: {          
		     	syear:$('#selectYear').val(),
		     	smonth:$('#selectMonth').val(),
		     	cblxbm:cblxbm
		       } ,
		  	 singleSelect:true,
		  	 rownumbers:true,
		  	 rownumberHeader:'序号',
		     pagination : true,
		     singleSelect : true,
		     sortName : 'wggz',
		     sortOrder : 'asc',
		     pageSize : 10,
		     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		     columns : [ [
		       {
		         width : '50%',
		         title : '违规规则',
		         field : 'gzmc'
		         
		      },  {
		         width : '50%',
		         title : '违规单据数',
		         field : 'wgdjs',
		         formatter: function (value, rowData, rowIndex) {       
		                 return "<a style='color:green' href='javacript:;' onclick=mzwgdjDocuments('" + rowData.gzbm + "');>" + value + "</a>";;
		          }
		     } ,  {
		    	 hidden:true,
		         field :'gzbm'     
		     }    
		     ] ],
		     onBeforeLoad: function (param) {
		     	updateDatagridHeader(this);
                changeRowHeader(this);
		     },
             onLoadSuccess:function(data){
                window.onresize=function(){                                
                    $('#mzwggzOrderTable').datagrid('resize');//列表随屏幕大小变化
                };
            }    
    
		 });
			
		}
		
		//违规单据汇总  规则
		function mzwgdjDocuments(gzbm) {
			$(".nm-div").css("display","block");
			$(".nm-div-name-div").css("display","none");
			var cblxbm=$('#cblxbm').val();
			$('#mzwgdjDocuments').datagrid({
		     url : '${path }/generalclinic/mzViolationsDocuments',
		     fit : false,
		     striped : true,
		     queryParams: {          
		     	syear:$('#selectYear').val(),
		     	smonth:$('#selectMonth').val(),
		     	cblxbm:cblxbm,
		     	gzbm:gzbm
		       } ,
			 pagination : true,
		     singleSelect : true,
		     //sortName : 'jzrq',
		     //sortOrder : 'asc',
		     pageSize : 10,
		     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		     columns : [ [
		     {
		         width : '10%',
		         title : '就诊日期',
		         field : 'jzrq' 
		     },{
		         width : '10%',
		         title : '身份证号',
		         field : 'sfzhm'
		         
		     },  {
		         width : '10%',
		         title : '患者姓名',
		         field : 'hzxm',
		         formatter: function (value, rowData, rowIndex) {       
		                 return "<a style='color:green' href='javacript:;' onclick=mzdetails('" + rowData.mzlsh + "');>" + value + "</a>";;
		          }
		     }, {
		         width : '10%',
		         title : '参保类型',
		         field : 'cblx'
		     } , {
		         width : '10%',
		         title : '就医方式',
		         field : 'jyfs'
		    
		     }, {
		         width : '10%',
		         title : '科室',
		         field : 'ksmc'
		    
		     }, {
		         width : '10%',
		         title : '医师',
		         field : 'ysxm'
		    
		     }, {
		         width : '10%',
		         title : '疾病名称',
		         field : 'ryzd'
		    
		     }, {
		         width : '10%',
		         title : '开立原因',
		         field : 'klyy'
		    
		     }, {
		         width : '10%',
		         title : '医疗费(元)',
		         field : 'ylf'
		    
		     }, {
		         width : '10%',
		         title : '医保内金额(元)',
		         field : 'ybtczf'
		    
		     }     
		     ] ],
		     onBeforeLoad: function (param) {
		     	updateDatagridHeader(this);
		     }, 
             onLoadSuccess:function(data){
                window.onresize=function(){                                
                    $('#mzwgdjDocuments').datagrid('resize');//列表随屏幕大小变化
                };
           }      
		 });
			
		}
		

		//违规详情  规则
		function mzdetails(mzlsh) {
			$(".nm-div-name-div").css("display","block");
			var cblxbm=$('#cblxbm').val();
			
			$('#mzdetails').datagrid({
		     url : '${path }/generalclinic/getwholedocumentdetails',
		     fit : false,
		     striped : true,
		     queryParams: {          
		     	syear:$('#selectYear').val(),
		     	smonth:$('#selectMonth').val(),
		     	cblxbm:cblxbm,
		     	mzlsh:mzlsh
		     } ,
		     rownumbers:true,
		     rownumberHeader:'序号',
		     pagination : true,
		     singleSelect : true,
		     pageSize : 10,
		     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		     columns : [ [
             {
                 width : '10%',
                 title : '日期',
                 field : 'rq' 
             },{
                 width : '10%',
                 title : '时间',
                 field : 'sj',
             },  {
                 width : '10%',
                 title : '项目编码',
                 field : 'xmbm'
            
             }, {
                 width : '10%',
                 title : '项目名称',
                 field : 'xmmc',
             } , {
                 width : '10%',
                 title : '违反规则',
                 field : 'wfgz'
            
             }, {
                 width : '10%',
                 title : '提示说明',
                 field : 'tssm'
            
             }, {
                 width : '10%',
                 title : '科室',
                 field : 'ksmc'
            
             }, {
                 width : '10%',
                 title : '医师',
                 field : 'ysxm'
            
             }, {
                 width : '10%',
                 title : '规格',
                 field : 'ypgg'
            
             }, {
                 width : '10%',
                 title : '单位',
                 field : 'dw'
            
             },{
                 width : '10%',
                 title : '用法',
                 field : 'usage',
                 formatter: function (value){
                	 if(value==null){
                		 return '-'; 
                	 }else{
                		 return "<span title='" + value + "'>" + value + "</span>" 
                	 }
                 }
             },/* {
                 width : '10%', '给药途径',规则、单位、用法、用量、单价、数量
                 title : '给药途径',
                 field : 'gytj'   
             },  */ {
                 width : '10%',
                 title : '用量',
                 field : 'yl'   
             },  {
                 width : '10%',
                 title : '单价(元)',
                 field : 'dj'
            
             }, {
                 width : '10%',
                 title : '数量',
                 field : 'sl'   
             }, {
                 width : '10%',
                 title : '金额(元)',
                 field : 'je'   
             }, {
                 width : '10%',
                 title : '医保内金额(元)',
                 field : 'ybnje'   
             }     
             ] ],
		     onBeforeLoad: function (param) {
		    	 updateDatagridHeader(this); 
                 changeRowHeader(this);
		     },
             onLoadSuccess:function(data){
                window.onresize=function(){                                
                    $('#mzdetails').datagrid('resize');//列表随屏幕大小变化
                };
            }                    
		 });
			
		}
		  function mzwgdepartOrder() {
			   	$.ajax({
			   		type: "POST",
			   		url:"${path }/costStruct/selectEcharsData?methodFlag=mzwgdepartOrder",    			
			   	    cache: false,
			   	    async : false,
			   	    dataType: "json",	
			   		data:$('#dataSearchForm').serialize(),	
			   		success:function(data){
			   			if(JSON.stringify(data) == "{}"){
			   				option_bar5.xAxis[0].data=[];
			   				option_bar5.series[0].data=[0]; 	
			   				myChartBar2kswgqk.setOption(option_bar5);	
			   	 	    	}else{	 	    		
			     		 		var wgdjs = data.mzwgdepartOrder_value0;
			   	 	    		var ksmc = data.mzwgdepartOrder_value1;
			   	 	    			option_bar5.xAxis[0].data=ksmc;
			   	 	    			option_bar5.series[0].data=wgdjs;
			   	 	    	myChartBar2kswgqk.setOption(option_bar5);	 	    		
			   	 	    	}
			   			
			   		} 	
			   	}); 	
			 }
		   
		  function mzwgdepartOrderTable() {
			
		   	   var cblxbm=$('#cblxbm').val();
		   	  
		   	$('#mzwgdepartOrderTable').datagrid({
		        url : '${path }/generalclinic/mzwgdepartOrderTable',
		        fit : true,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	cblxbm:cblxbm
		        
		          } ,
		        rownumbers:true,
		   		rownumberHeader:'序号',
		        pagination : true,
		        singleSelect : true,
		        //sortName : 'ksmc',
		        //sortOrder : 'asc',
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		          {
		            width : '50%',
		            title : '科室名称',
		            field : 'ksmc'
		            
		         },  {
		            width : '46%',
		            title : '违规单据数',
		            field : 'wgdjs',
		            formatter: function (value, rowData, rowIndex) {       
		                    return "<a style='color:green' href='javacript:;' onclick=mzwgdjDocuments_dapart('" + rowData.ksbm + "');>" + value + "</a>";;
		             }
		        } ,{
		            width : '',
		            hidden:true,
		            field : 'ksbm'
		         }   
		        ] ],
		        onBeforeLoad: function (param) {
		        	updateDatagridHeader(this);
                    changeRowHeader(this);        	     	
		        },
                onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#mzwgdepartOrderTable').datagrid('resize');//列表随屏幕大小变化
                    };
                }                       
		    });
		   	
		   }
		  // 普通门诊->科室违规汇总
		  function mzwgdjDocuments_dapart(ksbm) {
			  $(".ks-nm-div-name-div").css("display","none");
			  $(".ks-nm-div").css("display","block");
		   	   var cblxbm=$('#cblxbm').val();
		   	 $('#mzwgdjDocuments_dapart').datagrid({
		        url : '${path }/generalclinic/mzViolationsDocuments',
		        fit : true,
		        striped : true,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	cblxbm:cblxbm,
		        	ksbm:ksbm
		          } ,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		        {
		            width : '10%',
		            title : '就诊日期',
		            field : 'jzrq' 
		        },{
		            width : '10%',
		            title : '身份证号',
		            field : 'sfzhm'
		            
		        },  {
		            width : '10%',
		            title : '患者姓名',
		            field : 'hzxm',
		            formatter: function (value, rowData, rowIndex) {       
		                    return "<a style='color:green' href='javacript:;' onclick=mzdetails_depart('" + rowData.mzlsh + "');>" + value + "</a>";;
		             }
		        }, {
		            width : '10%',
		            title : '参保类型',
		            field : 'cblx'
		        } , {
		            width : '10%',
		            title : '就医方式',
		            field : 'jyfs',
		            formatter:function(value,row,index){
			        	 switch (value) {
			        	 case 11:
			        	 	return "普通门诊";
			        	 case 13:
				        	 return "门诊大病";
			        	 case 15:
				        	 return "异地门诊";
			        	 case 21:
				        	 return "普通住院";
			        	 case 22:
				        	 return "特殊病种住院";
			        	 case 25:
				        	 return "异地住院";
			        	 case 51:
				        	 return "生育门诊";
			        	 case 52:
				        	 return "生育住院";
			        	 case 71:
				        	 return "工伤门诊";
			        	 case 72:
				        	 return "工伤住院";
				         default:
				        	 return "-";
			        	 }
			         }
		       
		        }, {
		            width : '10%',
		            title : '科室',
		            field : 'ksmc'
		       
		        }, {
		            width : '10%',
		            title : '医师',
		            field : 'ysxm'
		       
		        }, {
		            width : '10%',
		            title : '疾病名称',
		            field : 'ryzd'
		       
		        }, {
		            width : '10%',
		            title : '开立原因',
		            field : 'klyy'
		       
		        }, {
		            width : '10%',
		            title : '医疗费(元)',
		            field : 'ylf'
		       
		        }, {
		            width : '10%',
		            title : '医保内金额(元)',
		            field : 'ybtczf'
		       
		        }   
		        ] ],
		        onBeforeLoad: function (param) {
		        	updateDatagridHeader(this);        	     	
		        },
                onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#mzwgdjDocuments_dapart').datagrid('resize');//列表随屏幕大小变化
                    };
                }                       
		    }); 
		   	
		 } 
		  // 科室违规详情  -- 普通门诊
		  function mzdetails_depart(mzlsh) {
				$(".ks-nm-div-name-div").css("display","block");
				   var cblxbm=$('#cblxbm').val();
			  	$('#mzdetails_depart').datagrid({
			       url : '${path }/generalclinic/mzViolationdetails',
			       fit : false,
			       striped : true,
			       queryParams: {          
			       	syear:$('#selectYear').val(),
			       	smonth:$('#selectMonth').val(),
			       	cblxbm:cblxbm,
			       	mzlsh:mzlsh
			         } ,
			       rownumbers:true,
			       rownumberHeader:'序号',
			       pagination : true,
			       singleSelect : true,
			       pageSize : 10,
			       pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			       columns : [ [
			       {
			           width : '10%',
			           title : '日期',
			           field : 'rq' 
			       },{
			           width : '10%',
			           title : '时间',
			           field : 'sj',
			       },  {
			           width : '10%',
			           title : '项目编码',
			           field : 'xmbm'
			      
			       }, {
			           width : '10%',
			           title : '项目名称',
			           field : 'xmmc',
			       } , {
			           width : '10%',
			           title : '违反规则',
			           field : 'wfgz',
			           formatter: function (value){
		             	 if(value==null){
		             		 return '-'; 
		             	 }else{
		             		 return "<span title='" + value + "'>" + value + "</span>" 
		             	 }
		              }
			      
			       }, {
			           width : '10%',
			           title : '提示说明',
			           field : 'tssm',
			           formatter: function (value){
			             	 if(value==null){
			             		 return '-'; 
			             	 }else{
			             		 return "<span title='" + value + "'>" + value + "</span>" 
			             	 }
			            }
			      
			       }, {
			           width : '10%',
			           title : '科室',
			           field : 'ksmc'
			      
			       }, {
			           width : '10%',
			           title : '医师',
			           field : 'ysxm'
			      
			       }, {
			           width : '10%',
			           title : '规格',
			           field : 'ypgg'
			      
			       }, {
			           width : '10%',
			           title : '单位',
			           field : 'dw'
			      
			       }, {
			           width : '10%',
			           title : '单价(元)',
			           field : 'dj'
			      
			       }, {
			           width : '10%',
			           title : '给药途径',
			           field : 'gytj'   
			       }, {
			           width : '10%',
			           title : '用量',
			           field : 'yl'   
			       }, {
			           width : '10%',
			           title : '数量',
			           field : 'sl'   
			       }, {
			           width : '10%',
			           title : '金额(元)',
			           field : 'je'   
			       }, {
			           width : '10%',
			           title : '医保内金额(元)',
			           field : 'ybnje'   
			       }     
			       ] ],
			       onBeforeLoad: function (param) {
			    	   updateDatagridHeader(this);
                       changeRowHeader(this); 
			       },
                   onLoadSuccess:function(data){
                        window.onresize=function(){                                
                            $('#mzdetails_depart').datagrid('resize');//列表随屏幕大小变化
                        };
                    }                
			   });
			  	
			  } 
		   
		  
		  
		  
		 
		 
		  
		// 普通住院->违规汇总
          function zywgDocument(){
          	var index =  $(".tab1s .on").attr("value");
  			hiddenInterface();
  			if(index ==0){
  				zywggzOrder();
      			zywggzOrderTable();
  			}
  			if(index ==1){
  				zywgdepartOrder();
  				zywgdepartOrderTable();
  			}
          }
          //  规则违规--住院
			function zywggzOrder() {
				$.ajax({
					type: "POST",
					url:"${path }/costStruct/selectEcharsData?methodFlag=zywggzOrder",
				    cache: false,
				    async : false,
				    dataType: "json",	
					data:$('#dataSearchForm').serialize(),	
					success:function(data){	
						if(JSON.stringify(data) == "{}"){
							option_zyOrder.xAxis[0].data=[];
							option_zyOrder.series[0].data=[0]; 	
							myChartBar_zyOrder.setOption(option_zyOrder);	
						    $("#zywggzOrderTable").empty();
					 	    	}else{
				  		 			var wgdjs = data.zywggzOrder_value0;
					 	    		var wgmc = data.zywggzOrder_value1;
					 	    		option_zyOrder.xAxis[0].data=wgmc;
					 	    		option_zyOrder.series[0].data=wgdjs;		 	    		
					 	    		myChartBar_zyOrder.setOption(option_zyOrder);
					 	    		zywggzOrderTable();
					 	    	} 
					}
				
				}); 
			}
		  
		  
		  //违规规则排序--住院
		  function zywggzOrderTable() {
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
				              return "<a style='color:green' href='javascript:void(0);' onclick=zyIllegalDocuments('"+id+"','" + rowData.value2 + "','"+lx+"');>" + value + "</a>";
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
		  
		//科室违规 -- 住院
		function zywgdepartOrder() {
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
						option_zyDepart.xAxis[0].data=[];
						option_zyDepart.series[0].data=[0]; 	
						myChartBar_zyDepart.setOption(option_zyDepart);	
				 	    $("#zywgdepartOrderTable").empty();
			 	    	}else{	 	    		
		  		 			var wgdjs = data.zywgdepartOrder_value0;
			 	    		var ksmc = data.zywgdepartOrder_value1;
			 	    		option_zyDepart.xAxis[0].data=ksmc;
			 	    		option_zyDepart.series[0].data=wgdjs;
			 	    		myChartBar_zyDepart.setOption(option_zyDepart);
			 	    		zywgdepartOrderTable();
			 	    	}
				}
			});
		}
		
		  function zywgdepartOrderTable() {
			    var cblxbm=$('#cblxbm').val();
		        var ksbm = $("#depart").val();
				var id = '#zyDocument_depart';
				var lx = 'depart';
			  $('#zywgOrderTable_depart').datagrid({
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
				              return "<a style='color:green' href='javascript:void(0);' onclick=zyIllegalDocuments('"+id+"','" + rowData.value2 + "','"+lx+"');>" + value + "</a>";
				       }
				  }    
				  ] ],
				  onBeforeLoad: function (param) {
				  	updateDatagridHeader(this);
				  	changeRowHeader(this);
				  },
				  onLoadSuccess:function(){
			            window.onresize=function(){                                
			                $('#zywgOrderTable_depart').datagrid('resize');//列表随屏幕大小变化
			            }
			      }
			  });
			}
		  //病种汇总--关键指标
          function keyIndexBZ(){
          	$.ajax({
     				type: "POST",
     				url:"${path }/wholeHospitalOverview/keyIndexBZ",
     			    cache: false,
     			    async : false,
     			    dataType: "json",	
     				data:$('#dataSearchForm').serialize(),	//form表单
     				success:function(data){
     					if(data.length!=0){
       						for(var i=0;i<8;i++){
       							var temp = "."+data[i].key;
       							$(temp).find("p").eq(0).text(data[i].value);
       							compareLastMon(data,temp,i, 1);
       						}
       					};
     				}
          	});	
          }
		  //病种指标
		  function diseaseIndexLJ(){
			  var cblxbm=$('#cblxbm').val();
				var lx = 'doctor';
				var id = '#docwgDocument';
				$('#diseaseIndexLJ').datagrid({
			        url : '${path }/inHospital/physicianPerformance',
			        fit : false,
			        striped : false,
			        queryParams: {          
			        	syear:$('#selectYear').val(),
			        	smonth:$('#selectMonth').val(),
			        	cblxbm:$('#cblxbm').val(),
			        	lx:'lj'
			          },
			        pagination : true,
			        singleSelect : true,
			        pageSize : 10,
			        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			        columns : [ [
			          {
			        	 width : '10%',   
			        	 field : 'GH',
			        	 title : '病种'
				      },{
			            width : '10%',
			            title : '治疗方式',
			            field : 'YS'
			        },{
			            width : '10%',
			            title : '收治人次 ',
			            field : 'SZRC',
			       
			        },{
			            width : '10%',
			            title : '平均住院日 ',
			            field : 'PJZYR',
			       
			        },{
			            width : '10%',
			            title : '医疗总费用(元)',
			            field : 'YLF',
			       
			        },{
			            width : '10%',
			            title : '医保统筹支付(元)',
			            field : 'YBTCZF'
			       
			        },{
			            width : '10%',
			            title : '病种定额(元)',
			            field : 'BZDE',
			       
			        },{
			            width : '10%',
			            title : '超额人次 ',
			            field : 'CERC',
			       
			        },{
			            width : '10%',
			            title : '超定额总费用(元)',
			            field : 'CDEZFY'
			        },{
			            width : '10%',
			            title : '违规单据数 ',
			            field : 'WGDJS',
			            formatter: function (value, rowData, rowIndex) {       
				              return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"+id+"','" + rowData.GH + "','"+lx+"');>" + value + "</a>";
				       }
			        },{
			            width : '10%',
			            title : '检查费(元)',
			            field : 'JCF',
			       
			        },{
			            width : '10%',
			            title : '检验费(元)',
			            field : 'JYF'
			        },{
			            width : '10%',
			            title : '手术麻醉费(元)',
			            field : 'MZF'
			        },{
			            width : '10%',
			            title : '药品费(元)',
			            field : 'YPF'
			        },{
			            width : '10%',
			            title : '医用耗材费(元)',
			            field : 'YYHCF'
			        },{
			            width : '10%',
			            title : '治疗费(元) ',
			            field : 'ZLF'
			        },{
			            width : '10%',
			            title : '输血费(元)',
			            field : 'SXF'
			        }
			        ] ],
			        onBeforeLoad: function (param) {
			        	updateDatagridHeader(this);        	
			        },
			        onLoadSuccess:function(){
			            window.onresize=function(){                                
			                $('#diseaseIndexLJ').datagrid('resize');//列表随屏幕大小变化
			            }
			       }
			    }); 
		  }
		  
		  function diseaseIndexRJ(){
				$('#diseaseIndexRJ').datagrid({
			        url : '${path }/inHospital/physicianPerformance',
			        fit : false,
			        striped : false,
			        queryParams: {          
			        	syear:$('#selectYear').val(),
			        	smonth:$('#selectMonth').val(),
			        	cblxbm:$('#cblxbm').val(),
			        	lx:'rj'
			          },
			        pagination : true,
			        singleSelect : true,
			        pageSize : 10,
			        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			        columns : [ [
			          {
			        	 width : '10%',   
			        	 field : 'GH',
			        	 title : '病种'
				      },{
			            width : '10%',
			            title : '医师 ',
			            field : '治疗方式'
			        },{
			            width : '10%',
			            title : '收治人次 ',
			            field : 'SZRC',
			       
			        },{
			            width : '10%',
			            title : '平均住院日 ',
			            field : 'PJZYR',
			       
			        },{
			            width : '10%',
			            title : '医疗总费用(元)',
			            field : 'YLF',
			       
			        },{
			            width : '10%',
			            title : '医保统筹支付(元)',
			            field : 'YBTCZF'
			        },{
			            width : '10%',
			            title : '病种定额(元)',
			            field : 'BZDE',
			       
			        },{
			            width : '10%',
			            title : '超额人次 ',
			            field : 'CERC',
			       
			        },{
			            width : '10%',
			            title : '超定额总费用(元)',
			            field : 'CDEZFY'
			        },{
			            width : '10%',
			            title : '违规单据数 ',
			            field : 'WGDJS'
			        },{
			            width : '10%',
			            title : '人均药费(元)',
			            field : 'RJYF',
			        },{
			            width : '10%',
			            title : '人均检查检验费(元)',
			            field : 'RJJCJYF'
			        },{
			            width : '10%',
			            title : '人均手术麻醉费(元)',
			            field : 'RJMZF'
			        },{
			            width : '10%',
			            title : '人均医用耗材费(元)',
			            field : 'RJYYHCF'
			        },{
			            width : '10%',
			            title : '人均治疗费(元)',
			            field : 'RJZLF'
			        },{
			            width : '10%',
			            title : '人均输血费(元)',
			            field : 'RJSXF'
			        }
			        ] ],
			        onBeforeLoad: function (param) {
			        	updateDatagridHeader(this);        	
			        },
			        onLoadSuccess:function(){
			            window.onresize=function(){                                
			                $('#diseaseIndexRJ').datagrid('resize');//列表随屏幕大小变化
			            }
			       }
			    });  
		  }
		  //数据:病种指标-月度变化趋势
		  function monthlyTrendBZ(){
			  $.ajax({
      			type: "POST",
      			url:"${path }/costStruct/selectEcharsData?methodFlag=monthlyTrendZYBZ",
      		    cache: false,
      		    async : false,
      		    dataType: "json",	
      			data:$('#dataSearchForm').serialize(),	
      			success:function(data){
      	 	    	if(JSON.stringify(data) != "{}"){
                        monthlyTrendBZ_data=[];
                        $.each(data,function(key,n){
                            monthlyTrendBZ_data.push(n);
                        })
                        
      				}
      			}
      		 });
		  }
		  //违规汇总--病种指标
          function bzwgDocument(){
          	var index =  $(".tab2s .on").attr("value");
  			
  			if(index ==0){
  				bzwggzOrder();
      			bzwggzOrderTable();
  			}
  			if(index ==1){
  				bzwgdepartOrder();
  				bzwgdepartOrderTable();
  			}
          }
          //  规则违规--病种指标
			function bzwggzOrder() {
			    $.ajax({
					type: "POST",
					url:"${path }/costStruct/selectEcharsData?methodFlag=wggzOrder",    			
				    cache: false,
				    async : false,
				    dataType: "json",	
					data:{syear:$('#selectYear').val(),
						  smonth:$('#selectMonth').val(),
						  cblxbm:$('#cblxbm').val(),
						 },	
					success:function(data){	
							
						if(JSON.stringify(data) == "{}"){
								/* option_barline8.xAxis[0].data=[];
								option_barline8.series[0].data=[0]; 	
								myChartBarline8.setOption(option_barline8);	 */
			 	    	}else{
			  		 			/* var wgdjs = data.wggzOrder_value0;
				 	    		var wgmc = data.wggzOrder_value1;
				 	    		option_barline8.xAxis[0].data=wgmc;
				 	    		option_barline8.series[0].data=wgdjs;		 	    		
				 	    		myChartBarline8.setOption(option_barline8); */
				 	    }
					}
				
				}); 
			}
		  
		  
		  //违规规则排序--病种指标
		  function bzwggzOrderTable() {
		  	$('#bzwggzOrderTable').datagrid({
		    url : '${path }/mgquota/wggzOrderTable',
		    fit : false,
		    striped : false,
		    queryParams: {syear:$('#selectYear').val(),
				  smonth:$('#selectMonth').val(),
				  cblxbm:$('#cblxbm').val(),
				 },
		  	 singleSelect:true,
		  	 rownumbers:true,
		  	 rownumberHeader:'序号',
		    pagination : true,
		    singleSelect : true,
		    //sortName : 'wggz',
		    //sortOrder : 'asc',
		    pageSize : 10,
		    pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		    columns : [ [
		      {
		        width : '50%',
		        title : '违规规则',
		        field : 'gzmc'
		        
		     },  {
		        width : '50%',
		        title : '违规单据数',
		        field : 'wgdjs',
		        formatter: function (value, rowData, rowIndex) {       
		                return "<a style='color:green' href='javascript:void(0);' onclick=wgdjDocuments('" + rowData.gzbm + "');>" + value + "</a>";;
		         }
		    } ,  {
		   	 hidden:true,
		        field :'gzbm'     
		    }    
		    ] ],
		    onBeforeLoad: function (param) {
		    	updateDatagridHeader(this);
		    	changeRowHeader(this);
		    }
		  });
		  	
		  }
		  
		//科室违规 -- 病种指标
		function bzwgdepartOrder() {
				$.ajax({
					type: "POST",
					url:"${path }/costStruct/selectEcharsData?methodFlag=wgdepartOrder",    			
				    cache: false,
				    async : false,
				    dataType: "json",	
					data:{
						syear:$('#selectYear').val(),
			     	  	smonth:$('#selectMonth').val(),
			     	  	cblxbm:$('#cblxbm').val()
					},	
					success:function(data){
								
						 if(JSON.stringify(data) == "{}"){
							/* option_barline9.xAxis[0].data=[];
							option_barline9.series[0].data=[0]; 
							myChartBarline9.setOption(option_barline9); */	
				 	    }else{	 	    
				 	    	//console.log(data)
				 	    	
				 	    	/* var wgdjs = data.wgdepartOrder_value0;
			 	    		var wgmc = data.wgdepartOrder_value1;
			 	    		option_barline9.xAxis[0].data=wgmc;
			 	    		option_barline9.series[0].data=wgdjs;
			 	    		
			 	    		myChartBarline9.setOption(option_barline9); */
				 	    		
				 	    } 
					}
				});
			}
		
		  function bzwgdepartOrderTable() {
				$('#bzwgOrderTable_depart').datagrid({
			     url : '${path }/mgquota/wgdepartOrderTable',
			     fit : false,
			     striped : false,
			     queryParams: {          
			     	syear:$('#selectYear').val(),
			     	smonth:$('#selectMonth').val(),
			     	cblxbm:$('#cblxbm').val()
			       } ,
			     rownumbers:true,
			     rownumberHeader:'排序',
			     pagination : true,
			     singleSelect : true,
			     pageSize : 10,
			     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			     columns : [ [
			       {
			         width : '50%',
			         title : '科室名称',
			         field : 'ksmc'
			         
			      },  {
			         width : '50%',
			         title : '违规单据数',
			         field : 'wgdjs',
			         formatter: function (value, rowData, rowIndex) {       
			                 return "<a style='color:green' href='javascript:void(0);' onclick=mgwgdjDocuments_dapart('" + rowData.ksbm + "');>" + value + "</a>";;
			          }
			     } ,{
			         hidden:true,
			         field : 'ksbm'
			      }   
			     ] ],
			     onBeforeLoad: function (param) {
			     	updateDatagridHeader(this); 
			    	changeRowHeader(this);
			     } 
			 });
				
			}
		//介入治疗汇总--关键指标
          function keyIndexZL(){
          	$.ajax({
     				type: "POST",
     				url:"${path }/wholeHospitalOverview/keyIndexZL",
     			    cache: false,
     			    async : false,
     			    dataType: "json",	
     				data:$('#dataSearchForm').serialize(),	//form表单
     				success:function(data){
     					//  限定总量  未写
     					if(data.length!=0){
       						for(var i=0;i<6;i++){
       							var temp = "."+data[i].key;
       							$(temp).find("p").eq(0).text(data[i].value);
       							compareLastMon(data,temp,i, 1);
       						}
       					};
     				}
          	});	
          }
		//介入治疗汇总--累计指标、人均指标
		function treatmentIndicatorsLJ(){
			$('#treatmentIndicatorsLJ').datagrid({
		        url : '${path }/inHospital/physicianPerformance',
		        fit : false,
		        striped : false,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	cblxbm:$('#cblxbm').val(),
		        	lx:'lj'
		          },
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		          {
		        	 width : '10%',   
		        	 field : 'GH',
		        	 title : '病种'
			      },{
		            width : '10%',
		            title : '治疗方式',
		            field : 'YS'
		        },{
		            width : '10%',
		            title : '收治人次 ',
		            field : 'SZRC',
		       
		        },{
		            width : '10%',
		            title : '平均住院日 ',
		            field : 'PJZYR',
		       
		        },{
		            width : '10%',
		            title : '医疗总费用(元)',
		            field : 'YLF',
		       
		        },{
		            width : '10%',
		            title : '医保统筹支付(元)',
		            field : 'YBTCZF'
		       
		        },{
		            width : '10%',
		            title : '病种定额(元)',
		            field : 'BZDE',
		       
		        },{
		            width : '10%',
		            title : '超额人次 ',
		            field : 'CERC',
		       
		        },{
		            width : '10%',
		            title : '超定额总费用(元)',
		            field : 'CDEZFY'
		        },{
		            width : '10%',
		            title : '违规单据数 ',
		            field : 'WGDJS',
		            formatter: function (value, rowData, rowIndex) {       
			              return "<a style='color:green' href='javascript:void(0);' onclick=illegalDocuments('"+/* id */+"','" + rowData.GH + "','"+/* lx */+"');>" + value + "</a>";
			       }
		        },{
		            width : '10%',
		            title : '检查费(元)',
		            field : 'JCF',
		       
		        },{
		            width : '10%',
		            title : '检验费(元)',
		            field : 'JYF'
		        },{
		            width : '10%',
		            title : '手术麻醉费(元)',
		            field : 'MZF'
		        },{
		            width : '10%',
		            title : '药品费(元)',
		            field : 'YPF'
		        },{
		            width : '10%',
		            title : '医用耗材费(元)',
		            field : 'YYHCF'
		        },{
		            width : '10%',
		            title : '治疗费(元) ',
		            field : 'ZLF'
		        },{
		            width : '10%',
		            title : '输血费(元)',
		            field : 'SXF'
		        }
		        ] ],
		        onBeforeLoad: function (param) {
		        	updateDatagridHeader(this);        	
		        },
		        onLoadSuccess:function(){
		            window.onresize=function(){                                
		                $('#treatmentIndicatorsLJ').datagrid('resize');//列表随屏幕大小变化
		            }
		       }
		    });
		}
		function treatmentIndicatorsRJ(){
			$('#treatmentIndicatorsRJ').datagrid({
		        url : '${path }/inHospital/physicianPerformance',
		        fit : false,
		        striped : false,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	cblxbm:$('#cblxbm').val(),
		        	lx:'rj'
		          },
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		          {
		        	 width : '10%',   
		        	 field : 'GH',
		        	 title : '病种'
			      },{
		            width : '10%',
		            title : '医师 ',
		            field : '治疗方式'
		        },{
		            width : '10%',
		            title : '收治人次 ',
		            field : 'SZRC',
		       
		        },{
		            width : '10%',
		            title : '平均住院日 ',
		            field : 'PJZYR',
		       
		        },{
		            width : '10%',
		            title : '医疗总费用(元)',
		            field : 'YLF',
		       
		        },{
		            width : '10%',
		            title : '医保统筹支付(元)',
		            field : 'YBTCZF'
		        },{
		            width : '10%',
		            title : '病种定额(元)',
		            field : 'BZDE',
		       
		        },{
		            width : '10%',
		            title : '超额人次 ',
		            field : 'CERC',
		       
		        },{
		            width : '10%',
		            title : '超定额总费用(元)',
		            field : 'CDEZFY'
		        },{
		            width : '10%',
		            title : '违规单据数 ',
		            field : 'WGDJS'
		        },{
		            width : '10%',
		            title : '人均药费(元)',
		            field : 'RJYF',
		        },{
		            width : '10%',
		            title : '人均检查检验费(元)',
		            field : 'RJJCJYF'
		        },{
		            width : '10%',
		            title : '人均手术麻醉费(元)',
		            field : 'RJMZF'
		        },{
		            width : '10%',
		            title : '人均医用耗材费(元)',
		            field : 'RJYYHCF'
		        },{
		            width : '10%',
		            title : '人均治疗费(元)',
		            field : 'RJZLF'
		        },{
		            width : '10%',
		            title : '人均输血费(元)',
		            field : 'RJSXF'
		        }
		        ] ],
		        onBeforeLoad: function (param) {
		        	updateDatagridHeader(this);        	
		        },
		        onLoadSuccess:function(){
		            window.onresize=function(){                                
		                $('#treatmentIndicatorsRJ').datagrid('resize');//列表随屏幕大小变化
		            }
		       }
		    });
		}
		
		// 门规病种-> 门规汇总
		function departZB() {	
			$.ajax({
				type: "POST",
				url:"${path }/mgquota/mgquotadepartZB",
			    cache: false,
			    async : false,
			    dataType: "json",	
				data:$('#dataSearchForm').serialize(),	//form表单
				success:function(data){		  	
					 $('#jzrcmg').text("0");
					 $('#ylfmg').text("0");
					 $('#ybtczfmg').text("0");
					 $('#wgdjsmg').text("0");			 
					 $('#hzfdmg').text("0");
					 $('#cjfymg').text("0");
					 $('#cjyfmg').text("0");
					if(data!=""&&JSON.stringify(data) != "{}"){
						var shuju=data[0];
						if(typeof(shuju.jzrc)!='undefined'){
					    $('#jzrcmg').html(shuju.jzrc);
						}
						if(typeof(shuju.ylf)!='undefined'){
					    $('#ylfmg').html(shuju.ylf);
						}
						if(typeof(shuju.ybtczf)!='undefined'){
					    $('#ybtczfmg').html(shuju.ybtczf);
						}
						if(typeof(shuju.wgdjs)!='undefined'){
					    $('#wgdjsmg').html(shuju.wgdjs);
						}				
						if(typeof(shuju.hzfd)!='undefined'){
					    $('#hzfdmg').html(shuju.hzfd);
						} 
						if(typeof(shuju.cjfy)!='undefined'){
					    $('#cjfymg').html(shuju.cjfy);
						} 
						if(typeof(shuju.cjyf)!='undefined'){
					    $('#cjyfmg').html(shuju.cjyf);
						} 
						
					}
				}
				
			});
		} 
	  
	  //门规病种统计
	  function getmgquotaDataGrid() {
		  var cblxbm = $('#cblxbm').val();
			$('#mgquotaDataGrid').datagrid({
	        url : '${path }/mgquota/mgquotaDataGrid',
	        fit : false,
	        striped : false,
	        queryParams: {
	        	syear:$('#selectYear').val(),
	        	smonth:$('#selectMonth').val(),
	        	cblxbm:cblxbm
	        },
	        pagination : true,
	        singleSelect : true,
	        pageSize : 10,
	        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	        columns : [ [
	        {
	            width : '15%',
	            title : '门诊病种类型',
	            field : 'mzbzlx'   
	        },{
	            width : '10%',
	            title : '登记例数',
	            field : 'hzls'
	      
	        },  {
	            width : '10%',
	            title : '就诊人数',
	            field : 'jzrs',
	       
	        }, {
	            width : '10%',
	            title : '就诊人次',
	            field : 'jzrc',
	           
	        }, {
	            width : '10%',
	            title : '医疗费',
	            field : 'ylf',
	        
	        }, {
	            width : '10%',
	            title : '医保内金额(元)',
	            field : 'ybnje',
	         
	        }, {
	            width : '10%',
	            title : '月度超额人次',
	            field : 'ydcerc',
	       
	        },{
	            width : '10%',
	            title : '月度超额人数',
	            field : 'ydcers',
	       
	        },{
	            width : '10%',
	            title : '违规单据数',
	            field : 'wgdjs',
	            formatter: function (value, rowData, rowIndex) {       
	                return "<a  href='javascript:void(0);' onclick=clickLeft('bzmc','" + rowData.mzbzlx + "','ks',1);>" + value + "</a>";
	         }
	           
	        }, {
	            width : '10%',
	            title : '次均费用',
	            field : 'cjfy',
	       
	        },{
	            width : '10%',
	            title : '次均药费',
	            field : 'cjyf',
	           
	        }, {
	            width : '10%',
	            title : '次均检查检验费',
	            field : 'cjjcjyf',      
	        }      
	        ] ],
	        onBeforeLoad: function (param) {
	        	updateDatagridHeader(this); 
	        },
	        onLoadSuccess:function(){
	            window.onresize=function(){                                
	                $('#mgquotaDataGrid').datagrid('resize');//列表随屏幕大小变化
	            }
	        }  
	    });
		
	}
	// 门规病种->违规单据汇总
	  function mgViolationsDocuments(mzbzlx) {
	  	 $(".DialogDiv3").css("top", "15%");
	       $(".DialogDiv3").css("display", "block");
	       $(".ks-nm-div").css("display","block");
	  	 var cblxbm= $('#cblxbm').val();
	  	$('#mzViolationsDocuments').datagrid({
	       url : '${path }/mgquota/mgViolationsDocumentsBZ',
	       fit : false,
	       striped : false,
	       queryParams: {          
	    	   syear:$('#selectYear').val(),
	        	smonth:$('#selectMonth').val(),
	        	cblxbm:cblxbm,
	        	bzmc:mzbzlx
	         } ,
	       pagination : true,
	       singleSelect : true,
	       pageSize : 10,
	       pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	       columns : [ [
	       {
	           width : '10%',
	           title : '就诊日期',
	           field : 'jzrq' 
	       },{
	           width : '18%',
	           title : '身份证号',
	           field : 'sfzhm',
	           formatter: function (value, rowData, rowIndex) {       
	               return "<a   href='javascript:void(0);' onclick=mgViolationdetails('"+rowData.mzlsh+"','" + rowData.jbmc + "');>" + value + "</a>";
	        }
	           
	       },  {
	           width : '10%',
	           title : '患者姓名',
	           field : 'hzxm',
	          
	       }, {
	           width : '10%',
	           title : '年龄',
	           field : 'nl'
	       },  {
	           width : '10%',
	           title : '参保类型',
	           field : 'cblx',
	           formatter: function (value, rowData, rowIndex) {       
	          	 switch (value) {
	               case '390':
	                   return '城乡居民';
	               case '391':
	                   return '城镇职工';
	               case '392':
	                   return '省直医保';
	               default:
	              	 return '-';
	               }
	        }
	       } , {
	           width : '15%',
	           title : '门规病种类型',
	           field : 'jbmc',
	           formatter: function (value){
	              if(value==null){
	                  return '-'; 
	              }else{
	                  return "<span title='" + value + "'>" + value + "</span>" 
	              }
	          }
	      
	       }, {
	           width : '15%',
	           title : '整单违反规则',
	           field : 'ifzdwg'
	      
	       },{
	           width : '10%',
	           title : '开立原因',
	           field : 'klyy',
	           formatter: function (value){
	          	 if(value==null){
	          		 return '-'; 
	          	 }else{
	          		 return "<span title='" + value + "'>" + value + "</span>"; 
	          	 } 
	           }	 
	       },{
	           width : '10%',
	           title : '科室',
	           field : 'ksmc'
	      
	       }, {
	           width : '10%',
	           title : '医师',
	           field : 'ysxm'
	      
	       }, {
	           width : '10%',
	           title : '医疗费(元)',
	           field : 'ylf'
	       }, {
	           width : '10%',
	           title : '医保内金额(元)',
	           field : 'ybnje'
	       }, {
	           width : '',
	           field : 'mzlsh',
	           hidden:true
	       }     
	       ] ],
	       onBeforeLoad: function (param) {
	       	updateDatagridHeader(this);        	     	
	       } ,
	   });
	  	
	  }
	//违规详情
	  function mgViolationdetails(mzlsh) {
	      $(".ks-nm-div-name-div").css("display","block");
	  	var cblxbm=$('#cblxbm').val();
	  	$('#mzViolationdetails').datagrid({
	       url : '${path }/mgquota/mzmgdetails',
	       fit : false,
	       striped : false,
	       queryParams: {          
	       	mzlsh:mzlsh
	         } ,
	       rownumbers:true,
	       rownumberHeader:'序号',  
	       pagination : true,
	       singleSelect : true,
	       //sortName : 'jzrq',
	       //sortOrder : 'asc',
	       pageSize : 10,
	       pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	       columns : [ [
	       {
	           width : '10%',
	           title : '日期',
	           field : 'rq' 
	       },{
	           width : '10%',
	           title : '时间',
	           field : 'sj',
	       },  {
	           width : '10%',
	           title : '项目编码',
	           field : 'xmbm'
	      
	       }, {
	           width : '10%',
	           title : '项目名称',
	           field : 'xmmc',
	           formatter: function (value){
	          	 if(value==null){
	          		 return '-'; 
	          	 }else{
	          		 return "<span title='" + value + "'>" + value + "</span>" 
	          	 }
	           }
	       
	       } , {
	           width : '10%',
	           title : '违反规则',
	           field : 'wfgz',
	           formatter: function (value){
	          	 if(value==null){
	          		 return '-'; 
	          	 }else{
	          		 return "<span title='" + value + "'>" + value + "</span>" 
	          	 }
	           }
	      
	       }, {
	           width : '10%',
	           title : '提示说明',
	           field : 'tssm',
	           formatter: function (value){
	          	 if(value==null){
	          		 return '-'; 
	          	 }else{
	          		 return "<span title='" + value + "'>" + value + "</span>" 
	          	 }
	           }
	      
	       }, {
	           width : '10%',
	           title : '科室',
	           field : 'ksmc'
	      
	       }, {
	           width : '10%',
	           title : '医师',
	           field : 'ysxm'
	      
	       }, {
	           width : '10%',
	           title : '规格',
	           field : 'ypgg'
	      
	       }, {
	           width : '10%',
	           title : '单位',
	           field : 'dw'
	      
	       }, {
	           width : '10%',
	           title : '用法',
	           field : 'yf'   
	       },{
	           width : '10%',
	           title : '用量',
	           field : 'yl'   
	       }, {
	           width : '10%',
	           title : '单价(元)',
	           field : 'dj'
	       }, {
	           width : '10%',
	           title : '数量',
	           field : 'sl'   
	       }, {
	           width : '10%',
	           title : '金额(元)',
	           field : 'je'   
	       }, {
	           width : '10%',
	           title : '医保内金额(元)',
	           field : 'ybnje'   
	       }     
	       ] ],
	       onBeforeLoad: function (param) {
	      	updateDatagridHeader(this); 
	       }    
	   });
	  	
	  }
	
	  function findmonthcostofMg() {	
			var cblxbm=$('#cblxbm').val();
		
			$.ajax({
				type: "POST",
				url:"${path }/costStruct/selectEcharsData?methodFlag=findmonthcostofMg",
			    cache: false,
			    async : false,
			    dataType: "json",	
				data:{syear:$('#selectYear').val(),
					  smonth:$('#selectMonth').val(),
					  cblxbm:$('#cblxbm').val(),
					 },	
				success:function(data){		
		    		 var months = data.findmonthcostofMg_value0; 	    		 
					 var jzrc = data.findmonthcostofMg_value1;
					 var ydcerc = data.findmonthcostofMg_value2;			 
					 var wgdjs = data.findmonthcostofMg_value3;			 
					 var cjfy = data.findmonthcostofMg_value4;			 
					 var cjyf = data.findmonthcostofMg_value5;			 
					 var cjjcjyf = data.findmonthcostofMg_value6;
					 optionline4.series[0].data=jzrc;
					 optionline4.series[1].data=ydcerc;
					 optionline4.series[2].data=wgdjs;
					 optionline4.series[3].data=cjfy;
					 optionline4.series[4].data=cjyf;
					 optionline4.series[5].data=cjjcjyf;
					 optionline4.xAxis[0].data = months;
					 myChart.setOption(optionline4);

				},
		        error:function(){}
			})	
		}
		// 门规病种->违规规则排序
	  	function wggzOrder() {
		    $.ajax({
				type: "POST",
				url:"${path }/costStruct/selectEcharsData?methodFlag=wggzOrder",    			
			    cache: false,
			    async : false,
			    dataType: "json",	
				data:{syear:$('#selectYear').val(),
					  smonth:$('#selectMonth').val(),
					  cblxbm:$('#cblxbm').val(),
					 },	
				success:function(data){	
						
					if(JSON.stringify(data) == "{}"){
							option_barline8.xAxis[0].data=[];
							option_barline8.series[0].data=[0]; 	
							myChartBarline8.setOption(option_barline8);	
		 	    	}else{
		  		 			var wgdjs = data.wggzOrder_value0;
			 	    		var wgmc = data.wggzOrder_value1;
			 	    		option_barline8.xAxis[0].data=wgmc;
			 	    		option_barline8.series[0].data=wgdjs;		 	    		
			 	    		myChartBarline8.setOption(option_barline8);
			 	    }
				}
			
			}); 
		}
	  
	  
	  //违规规则排序--表格
	  function wggzOrderTable() {
	  	var cblxbm=$('#cblxbm').val();
	  	
	  	$('#wggzOrderTable').datagrid({
	    url : '${path }/mgquota/wggzOrderTable',
	    fit : false,
	    striped : false,
	    queryParams: {syear:$('#selectYear').val(),
			  smonth:$('#selectMonth').val(),
			  cblxbm:$('#cblxbm').val(),
			 },
	  	 singleSelect:true,
	  	 rownumbers:true,
	  	 rownumberHeader:'序号',
	    pagination : true,
	    singleSelect : true,
	    //sortName : 'wggz',
	    //sortOrder : 'asc',
	    pageSize : 10,
	    pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	    columns : [ [
	      {
	        width : '50%',
	        title : '违规规则',
	        field : 'gzmc'
	        
	     },  {
	        width : '50%',
	        title : '违规单据数',
	        field : 'wgdjs',
	        formatter: function (value, rowData, rowIndex) {       
	                return "<a style='color:green' href='javascript:void(0);' onclick=wgdjDocuments('" + rowData.gzbm + "');>" + value + "</a>";;
	         }
	    } ,  {
	   	 hidden:true,
	        field :'gzbm'     
	    }    
	    ] ],
	    onBeforeLoad: function (param) {
	    	updateDatagridHeader(this);
	    	changeRowHeader(this);
	    },
        onLoadSuccess:function(data){
            window.onresize=function(){                                
                $('#wggzOrderTable').datagrid('resize');//列表随屏幕大小变化
            };
        }
	  });
	  	
	  }

	  //违规单据汇总  规则 --门规
	  function wgdjDocuments(gzbm) {
	  	$(".nm-div").css("display","block");
	  	$(".nm-div-name-div").css("display","none");
	  	$('#wgdjDocuments').datagrid({
	       url : '${path }/mgquota/mgViolationsDocuments',
	       fit : false,
	       striped : false,
	       queryParams: {          
	      		syear:$('#selectYear').val(),
	     	  	smonth:$('#selectMonth').val(),
	     	  	cblxbm:$('#cblxbm').val(),
	       		gzbm:gzbm
	         } ,
	       rownumbers:true,
	       rownumberHeader:'序号',
	  	 pagination : true,
	       singleSelect : true,
	       //sortName : 'jzrq',
	       //sortOrder : 'asc',
	       pageSize : 10,
	       pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	       columns : [ [
	       {
	           width : '15%',
	           title : '就诊日期',
	           field : 'jzrq' 
	       },{
	           width : '15%',
	           title : '身份证号',
	           field : 'sfzhm'
	           
	       },  {
	           width : '10%',
	           title : '患者姓名',
	           field : 'hzxm',
	           formatter: function (value, rowData, rowIndex) {       
	                   return "<a style='color:green' href='javascript:void(0);' onclick=mgdetails('"+rowData.mzlsh+"','"+gzbm+"');>" + value + "</a>";;
	            }
	       }, {
	           width : '10%',
	           title : '参保类型',
	           field : 'cblx',
	           formatter: function (value, rowData, rowIndex) {       
	          	 switch (value) {
	               case '390':
	                   return '城乡居民';
	               case '391':
	                   return '城镇职工';
	               case '392':
	                   return '省直医保';
	               default:
	              	 return '-';
	               }
	        }
	       } , {
	           width : '10%',
	           title : '科室',
	           field : 'ksmc'
	      
	       }, {
	           width : '10%',
	           title : '医师',
	           field : 'ysxm'
	      
	       }, {
	           width : '15%',
	           title : '门规病种类型',
	           field : 'jbmc'
	      
	       }, {
	           width : '10%',
	           title : '开立原因',
	           field : 'klyy',
	           formatter: function (value){
	          	 if(value==null){
	          		 return '-'; 
	          	 }else{
	          		 return "<span title='" + value + "'>" + value + "</span>" 
	          	 }
	           }
	      
	       },{
	           width : '10%',
	           title : '医疗费(元)',
	           field : 'ylf'
	      
	       }, {
	           width : '10%',
	           title : '医保内金额(元)',
	           field : 'ybnje'
	      
	       },{
	           hidden : true,
	           field : 'mzlsh'   
	       }     
	       ] ],
	       onBeforeLoad: function (param) {
	      	 updateDatagridHeader(this);
	        	changeRowHeader(this);
	       },
           onLoadSuccess:function(data){
                window.onresize=function(){                                
                    $('#wgdjDocuments').datagrid('resize');//列表随屏幕大小变化
                };
           }    
	   });
	  	
	  }


		 //违规详情  规则--门规
		 function mgdetails(mzlsh,gzbm) {
		 	$(".nm-div-name-div").css("display","block");	
		 	$('#mgdetails').datagrid({
		      url : '${path }/mgquota/mzmgdetails',
		      rownumbers:true,
		      rownumberHeader:'序号',
		      fit : false,
		      striped : false,
		      queryParams: {
		     	mzlsh:mzlsh,
		     	gzbm:gzbm
		        } ,
		      pagination : true,
		      singleSelect : true,
		      pageSize : 10,
		      pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		      columns : [ [
		      {
		          width : '10%',
		          title : '日期',
		          field : 'rq' 
		      },{
		          width : '10%',
		          title : '时间',
		          field : 'sj',
		      },  {
		          width : '10%',
		          title : '项目编码',
		          field : 'xmbm'
		     
		      }, {
		          width : '10%',
		          title : '项目名称',
		          field : 'xmmc',
		          formatter: function (value){
		         	 if(value==null){
		         		 return '-'; 
		         	 }else{
		         		 return "<span title='" + value + "'>" + value + "</span>" 
		         	 }
		          }
		      } , {
		          width : '10%',
		          title : '违反规则',
		          field : 'wfgz',
		          formatter: function (value){
		         	 if(value==null){
		         		 return '-'; 
		         	 }else{
		         		 return "<span title='" + value + "'>" + value + "</span>" 
		         	 }
		          }
		     
		      }, {
		          width : '10%',
		          title : '提示说明',
		          field : 'tssm',
		          formatter: function (value){
		         	 if(value==null){
		         		 return '-'; 
		         	 }else{
		         		 return "<span title='" + value + "'>" + value + "</span>" 
		         	 }
		          }
		     
		      }, {
		          width : '10%',
		          title : '科室',
		          field : 'ksmc'
		     
		      }, {
		          width : '10%',
		          title : '医师',
		          field : 'ysxm'
		     
		      }, {
		          width : '10%',
		          title : '规格',
		          field : 'ypgg'
		     
		      }, {
		          width : '10%',
		          title : '单位',
		          field : 'dw'
		     
		      }, {
		          width : '10%',
		          title : '用法',
		          field : 'yf'   
		      },{
		          width : '10%',
		          title : '用量',
		          field : 'yl'   
		      },{
		          width : '10%',
		          title : '单价(元)',
		          field : 'dj'
		      }, {
		          width : '10%',
		          title : '数量',
		          field : 'sl'   
		      }, {
		          width : '10%',
		          title : '金额(元)',
		          field : 'je'   
		      }, {
		          width : '10%',
		          title : '医保内金额(元)',
		          field : 'ybnje'   
		      }     
		      ] ],
		      onBeforeLoad: function (param) {
		      	updateDatagridHeader(this); 
		     	changeRowHeader(this);
		      },
              onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#mgdetails').datagrid('resize');//列表随屏幕大小变化
                    };
                }    
    
		  });
		 	
		 }
		
     	
     	//门规病种->科室违规情况
     	function wgdepartOrder() {
			$.ajax({
				type: "POST",
				url:"${path }/costStruct/selectEcharsData?methodFlag=wgdepartOrder",    			
			    cache: false,
			    async : false,
			    dataType: "json",	
				data:{
					syear:$('#selectYear').val(),
		     	  	smonth:$('#selectMonth').val(),
		     	  	cblxbm:$('#cblxbm').val()
				},	
				success:function(data){
							
					 if(JSON.stringify(data) == "{}"){
						option_barline9.xAxis[0].data=[];
						option_barline9.series[0].data=[0]; 
						myChartBarline9.setOption(option_barline9);	
			 	    }else{	 	    
			 	    	var wgdjs = data.wgdepartOrder_value0;
		 	    		var wgmc = data.wgdepartOrder_value1;
		 	    		option_barline9.xAxis[0].data=wgmc;
		 	    		option_barline9.series[0].data=wgdjs;
		 	    		myChartBarline9.setOption(option_barline9);
			 	    } 
				}
			});
		}
     	//门规病种->科室违规表格
		  function wgdepartOrderTable() {
				$('#wgdepartOrderTable').datagrid({
			     url : '${path }/mgquota/wgdepartOrderTable',
			     fit : false,
			     striped : false,
			     queryParams: {          
			     	syear:$('#selectYear').val(),
			     	smonth:$('#selectMonth').val(),
			     	cblxbm:$('#cblxbm').val()
			       } ,
			     rownumbers:true,
			     rownumberHeader:'排序',
			     pagination : true,
			     singleSelect : true,
			     pageSize : 10,
			     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
			     columns : [ [
			       {
			         width : '50%',
			         title : '科室名称',
			         field : 'ksmc'
			         
			      },  {
			         width : '50%',
			         title : '违规单据数',
			         field : 'wgdjs',
			         formatter: function (value, rowData, rowIndex) {       
			                 return "<a style='color:green' href='javascript:void(0);' onclick=mgwgdjDocuments_dapart('" + rowData.ksbm + "');>" + value + "</a>";;
			          }
			     } ,{
			         hidden:true,
			         field : 'ksbm'
			      }   
			     ] ],
			     onBeforeLoad: function (param) {
			     	updateDatagridHeader(this); 
			    	changeRowHeader(this);
			     },
                 onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#wgdepartOrderTable').datagrid('resize');//列表随屏幕大小变化
                    };
                }    
 
			 });
				
			}
		//门规病种->科室违规汇总
		  function mgwgdjDocuments_dapart(ksbm) {
		  	$(".ks-nm-div-name-div").css("display","none");
		  	 $(".ks-nm-div").css("display","block");
		   	 var cblxbm=$('#cblxbm').val();
		   	 $('#mgwgdjDocuments_dapart').datagrid({
		        url : '${path }/mgquota/mgViolationsDocumentsDepart',
		        fit : false,
		        striped : false,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$('#selectMonth').val(),
		        	cblxbm:$('#cblxbm').val(),
		        	ksbm:ksbm
		          } ,
		        rownumbers:true,
		        rownumberHeader:'序号',
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
		        {
		            width : '13%',
		            title : '就诊日期',
		            field : 'jzrq' 
		        },{
		            width : '15%',
		            title : '身份证号',
		            field : 'sfzhm'
		            
		        },  {
		            width : '10%',
		            title : '患者姓名',
		            field : 'hzxm',
		            formatter: function (value, rowData, rowIndex) {       
		                    return "<a style='color:green' href='javascript:void(0);' onclick=mgdetails_depart('" + rowData.mzlsh + "');>" + value + "</a>";;
		             }
		        }, {
		            width : '10%',
		            title : '参保类型',
		            field : 'cblx',
		            formatter: function (value, rowData, rowIndex) {       
		           	 switch (value) {
		                case '390':
		                    return '城乡居民';
		                case '391':
		                    return '城镇职工';
		                case '392':
		                    return '省直医保';
		                default:
		               	 return '-';
		                }
		         }
		        } , {
		            width : '10%',
		            title : '科室',
		            field : 'ksmc'
		       
		        }, {
		            width : '10%',
		            title : '医师',
		            field : 'ysxm'
		       
		        }, {
		            width : '15%',
		            title : '门规病种类型',
		            field : 'jbmc'
		       
		        },{
		            width : '15%',
		            title : '整单违反规则',
		            field : 'ifzdwg'
		       
		        }, {
		            width : '10%',
		            title : '开立原因',
		            field : 'klyy',
		            formatter: function (value){
		           	 if(value==null){
		           		 return '-'; 
		           	 }else{
		           		 return "<span title='" + value + "'>" + value + "</span>" 
		           	 }
		            }
		       
		        }, {
		            width : '10%',
		            title : '医疗费(元)',
		            field : 'ylf'
		       
		        }, {
		            width : '10%',
		            title : '医保内金额(元)',
		            field : 'ybnje'   
		        }, {
		            width : '',
		            hidden : true,
		            field : 'mzlsh'   
		        }    
		        ] ],
		        onBeforeLoad: function (param) {
		        	updateDatagridHeader(this);
		       	    changeRowHeader(this);
		        },
                onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#mgwgdjDocuments_dapart').datagrid('resize');//列表随屏幕大小变化
                    };
                }    
    
		    }); 
		   	
		  } 

		  //门规病种->科室违规详情
		  function mgdetails_depart(mzlsh) {
		  	$(".ks-nm-div-name-div").css("display","block");
		  	$('#mgdetails_depart').datagrid({
		       url : '${path }/mgquota/mzmgdetails',
		       rownumbers:true,
		       rownumberHeader:'序号',
		       fit : false,
		       striped : false,
		       queryParams: {
		      	mzlsh:mzlsh
		         } ,
		       pagination : true,
		       singleSelect : true,
		       pageSize : 10,
		       pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		       columns : [ [
		       {
		           width : '10%',
		           title : '日期',
		           field : 'rq' 
		       },{
		           width : '10%',
		           title : '时间',
		           field : 'sj',
		       },  {
		           width : '10%',
		           title : '项目编码',
		           field : 'xmbm'
		      
		       }, {
		           width : '10%',
		           title : '项目名称',
		           field : 'xmmc',
		           formatter: function (value){
		          	 if(value==null){
		          		 return '-'; 
		          	 }else{
		          		 return "<span title='" + value + "'>" + value + "</span>" 
		          	 }
		           }
		       } , {
		           width : '10%',
		           title : '违反规则',
		           field : 'wfgz',
		           formatter: function (value){
		          	 if(value==null){
		          		 return '-'; 
		          	 }else{
		          		 return "<span title='" + value + "'>" + value + "</span>" 
		          	 }
		           }
		      
		       }, {
		           width : '10%',
		           title : '提示说明',
		           field : 'tssm',
		           formatter: function (value){
		          	 if(value==null){
		          		 return '-'; 
		          	 }else{
		          		 return "<span title='" + value + "'>" + value + "</span>" 
		          	 }
		           }
		      
		       }, {
		           width : '10%',
		           title : '科室',
		           field : 'ksmc'
		      
		       }, {
		           width : '10%',
		           title : '医师',
		           field : 'ysxm'
		      
		       }, {
		           width : '10%',
		           title : '规格',
		           field : 'ypgg'
		      
		       }, {
		           width : '10%',
		           title : '单位',
		           field : 'dw'
		      
		       }, {
		           width : '10%',
		           title : '用法',
		           field : 'yf'   
		       },{
		           width : '10%',
		           title : '用量',
		           field : 'yl'   
		       }, {
		           width : '10%',
		           title : '单价(元)',
		           field : 'dj'
		      
		       }, {
		           width : '10%',
		           title : '数量',
		           field : 'sl'   
		       }, {
		           width : '10%',
		           title : '金额(元)',
		           field : 'je'   
		       }, {
		           width : '10%',
		           title : '医保内金额(元)',
		           field : 'ybnje'   
		       }     
		       ] ],
		       onBeforeLoad: function (param) {
		       	updateDatagridHeader(this); 
		      	changeRowHeader(this);
		       },
               onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#mgdetails_depart').datagrid('resize');//列表随屏幕大小变化
                    };
                }    
    
		   });
		  	
		  } 
     	
		//普通门诊-汇总指标
		function summaryIndicators(){
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
	     		url:"${path }/wholeHospitalOverview/outpatientSummaryInformation",
	     	    cache: false,
	     	    async : false,
	     	    dataType: "json",	
	     		data:$('#dataSearchForm').serialize(),	//form表单
	     		success:function(data){	
	     			 $(".gjzb").removeClass("abnormal-span");
	     			 $(".gjzb").removeClass("normal-span");
	     			 var myArray=new Array("#jzrc","#ylf","#ybtczf","#cjjcjyf","#cjfy","#cjyf");
	     			 for(var i=0;i<6;i++){
	     				 $(myArray[i]).text("-");
	     				 $(myArray[i]).nextAll().find("font").text("-");
	     			 }
         			if(data!=""&&JSON.stringify(data) != "{}"){
         				var shuju=data[0];
         				if(data.length==1){
         					if(shuju.smonth==s){
         					   keyIndicators(shuju);
         					}
         				}else if(data.length==2){
         					keyIndicators(shuju);
         					keyIndicatorsBJ(data);
         				}	
         			}
	     		}
	     		
	     	});  
		};  
		
		// 普通门诊->关键指标
		function mzTable() {
			   var cblxbm=$('#cblxbm').val();
			   
				var s= $('#selectMonth').val();
				var monthStr=''
				for(var i=1;i<=12;i++){
					if(parseInt(s)==i){
						var temp = i;
						if(temp<10){
							monthStr=0+temp.toString();
							
						}else {
							monthStr=temp.toString();
							
						}			
					}
				}
			  
			$('#mzTable').datagrid({
		        url : '${path }/generalclinic/mzquotaKeyIndexGrid',
		        fit : false,
		        queryParams: {          
		        	syear:$('#selectYear').val(),
		        	smonth:$("#selectMonth").val(),
		        	cblxbm:cblxbm
		          } ,
		        striped : false,
		        pagination : true,
		        singleSelect : true,
		        pageSize : 10,
		        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
		        columns : [ [
                 {
                     width : '25%',
                     title : '科室',
                     field : 'ksmc' 
                 },{
                     width : '25%',
                     title : '医保支付人次',
                     field : 'ybtczfrc'
               
                 },  {
                     width : '25%',
                     title : '医保支付金额(元)',
                     field : 'ybtczf'
                
                 }, {
                     width : '25%',
                     title : '违规单据数',
                     field : 'wgdjs',
                     formatter: function (value, rowData, rowIndex) {       
                             return "<a style='color:green' href='javascript:void(0);' onclick=clickLeft('ksbm','" + rowData.ksbm + "','ys',2);>" + value + "</a>";
                      }
                 }    
                 ] ],
		        onBeforeLoad: function (param) {
		        	updateDatagridHeader(this);
		        },
                onLoadSuccess:function(data){
                    window.onresize=function(){                                
                        $('#mzTable').datagrid('resize');//列表随屏幕大小变化
                    };
                }    

		    });
			
		};
		
		//与上月的循环赋值比较
		function compareLastMon(data,temp,i,n){
			if(data.length==0)
			{
				for(var i=0;i<temp.length;i++){
					$(temp[i]).find("font").text('-');
					$(temp[i]).find("font").removeClass();
				}
			}else
			{
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
		}
		
    	//导出excel
    	function excelExport(type){
    		var url ;
    		if(type=="mg")
    		{
    			url = "${path }/excel/exportWholeHosOfMg";
    		}else if (type=="mz")
    		{
    			url = "${path }/excel/exportWholeHosOfMz";
    		}else if (type=='zy_wghz')
    		{
    			url = "${path }/excel/exportZy_wghz?flag="+'ptzy';
    		}else if (type=='mg_wghz')
    		{
    			url = "${path }/excel/exportZy_wghz?flag="+'mgbz';
    		}else if (type=='mz_wghz')
    		{
    			url = "${path }/excel/exportZy_wghz?flag="+'ptmz';
    		}
    	    $("#dataSearchForm").attr("action", url);
    	    $("#dataSearchForm").submit();
    	}
		
    </script>
</body>
</html>