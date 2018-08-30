<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>住院审核</title>
    <%-- <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${staticPath }/static/js/common.js"></script>--%>
    <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> 
    <style>
        label {
            font-weight: 500 !important;
            height: 100%
        }

        .jz-msg td {
            white-space: nowrap;
        }
        ul, ol {
            margin-top: 2px margin-bottom : 4 px !important;
        }

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
        select{width: auto!important;}
        td{white-space: nowrap;}
        .input-group{width:70px;}
        .jb-ul-li ul > li{width:10%}
        .condition{height: 32px;}
        .condition>li{float: left}
        .ctxPadding{padding: 4px 6px 0 0;}
        .mlp3{margin-left: 3%;}
        .pl6{padding-left: 6px;}
        .wp10{width: 10%;}
        .wp12{width: 12%;}
        .condition li{color:#657D98;}
        .header-div{padding: 16px 0 12px;}
    </style>
</head>
<body>
<!--筛选条件-->
<div class="header-div bg-color padding-left10">
    <form id="dataSearchForm" method="post">
        <ul class="condition" >
            <li class="ctxPadding">入院日期</li>
            <li class="input-group date form_date">
                <input class="padding-left4" style="width:120px" size="10" type="text" name="ldate" id="ldate">
                <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                &nbsp;至&nbsp;
            </li>
            <li class="input-group date form_date">
                <input class="padding-left4" style="width:120px" size="10" type="text" type="text" name="hdate" id="hdate">
                <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
            </li>
            <li class="ctxPadding mlp3" style="padding-left:45px">出院日期</li>
            <li class="input-group date form_date">
                <input class="padding-left4" style="width:120px" size="10" type="text" name="lcyrq" id="lcyrq">
                <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                &nbsp;至&nbsp;
            </li>
            <li class="input-group date form_date">
                <input class="padding-left4" style="width:120px" size="10" type="text" type="text" name="hcyrq" id="hcyrq">
                <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
            </li>

        </ul>
        <ul class="condition">
            <li class="ctxPadding " style="padding-left:28px" >科室</li>
            <li class="wp12"><select name="ksbm" id="depart"></select></li>
            <li class="ctxPadding mlp3" style="padding-left:28px">医师</li>
            <li class="wp12"><select name="ysgh" id="doctor"></select></li>
            <li class="ctxPadding mlp3">身份证号</li>
            <li><input type="text" placeholder="请填写身份证号" style="width:140px" size="19" id="sfzhm" name="sfzhm" class="pl6"></li>
            <li class="ctxPadding  mlp3">患者姓名</li>
            <li><input type="text" id="hzxm"  name="hzxm" style="width:140px"></li>
        </ul>      
        <ul class="condition">
        	<li class="ctxPadding">参保类型</li>
            <li class="wp12">
                <select id="cblxbm" name="cblxbm">
                    <option value="000">全部</option>
                    <option value="390">城乡居民</option>
                    <option value="391">城镇职工</option>
                    <option value="392">省直医保</option>
                </select>
            </li>
            <li class="ctxPadding mlp3">就医方式</li>
            <li class="wp12">
                <select id='jyfs1' name="jyfs">
                    <option value="0">全部</option>
                    <option value="21">普通住院</option>
                    <option value="22">单病种</option>
                </select>
            </li>
            <li class="ctxPadding mlp3">入院诊断</li>
            <li><input type="text"id="ryzd" name="ryzd" style="width:140px"></li>
            <li class="ctxPadding mlp3">出院诊断</li>
            <li><input type="text"id="cyzd" name="cyzd" style="width:140px"></li>
        </ul>
        <ul class="condition">
            <li class="ctxPadding ">治疗方式</li>
            <li style="width:130px"> 
                <select id="zlfs" name="zlfs" class="inline">
                    <option value="0">全部</option>
                    <option value="1">三焦辨证治疗体系</option>
                    <option value="2">抗病毒治疗</option>
                    <option value="3">心脏支架手术</option>
                    <option value="4">胰岛素治疗</option>
                </select>
            </li>
        	<li class="ctxPadding mlp3">住院状态</li>
            <li class="wp12">
                <select id="zyzt" name="zyzt">
                    <option value="zy">在院患者</option>
                    <option value="cy">出院患者</option>
                </select>
            </li>
            <li class="ctxPadding mlp3">审核状态</li>
            <li  style="width: 140px">
                <select id="shzt" name="shzt">
                    <option value="0">全部</option>
                    <option value="1">违规</option>
                    <option value="2">正常</option>
                    <option value="3">可疑</option>
                </select>
            </li>
            <li class="mlp3">
                <button class="btn btn-info btn-sm" type="button" onclick="searchData()"><img style="padding:0" src="${staticPath }/static/img/menu/search.png">查询</button>
            </li>
        </ul>             
    </form>
</div>
<div id="as">
<div class="ys-rc-div bg-color">
    <div class="gauge-title-div">
        <table class="body-width">
            <tr>
                <td class="table-title">
                    
                </td>
                <td class="right fs_16 padding-top10">
                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('info')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="body-width padding10 padding-top0">
        <div >
    <table class="body-width common-table"  id="zypatientDataGrid">
       
    </table>
    </div>
    </div>
</div>
    <div class="gauge-title-div export">
        <table class="body-width">
            <tr>
                <td class="table-title">
                    
                </td>
                <td class="right fs_16 padding-top10">
                    <button class="btn btn-sm btn-info" type="button" onclick="excelExport('details')"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="yb-jj-div margin-top10 bg-color" style="padding:10px;">
        <div class="float tab-div" style="width: 80%;">
            <div class="tab-div-menu jb-ul-li" id="sd">
                <ul class="ul-style" id="ul-two">
                    <li>
                        <label class="x-on" style="margin-left: -2px">就诊信息</label>
                    </li>
                    <li>
                        <label>费用指标预警</label>
                    </li>
                    <li>
                        <label>审核违规</label>
                    </li>
                    <li>
                        <label>医嘱明细</label>
                    </li>
                    <li>
                        <label>费用明细</label>
                    </li>
                </ul>
            </div>
        </div>

        <div class="clear"></div>
        <div class="tab-div-box1 border-val" id="gw" style="margin-bottom: 2px; padding-bottom:10px;">
            <!--就诊信息-->
            <div class="margin-top10">
                <div class="float" style="width: 70%;">
                    <div class="margin-left10 see-dot-msg-header fs_16">
                        <label class="edges-icon1"></label>就诊信息
                    </div>
                    <table class="see-dot-msg-table margin-top10" style="width: 85%" id="jzxx">
                        <tr>
                            <td>医保卡号:</td>
                            <td id="YBKH_JZ">-</td>
                            <td >身份证号:</td>
                            <td id="SFZHM_JZ">-</td>
                            <td >参保人:</td>
                            <td id="CBR_JZ">-</td>
                            <td >人员类别:</td>
                            <td id="RYLB_JZ">-</td>
                        </tr>
                        <tr>
                            <td>年龄:</td>
                            <td id="AGE_JZ">-</td>
                            <td>性别:</td>
                            <td id="SEX_JZ">-</td>
                            <td>就医方式:</td>
                            <td id="JYFS_JZ">-</td>
                            <td>入院日期:</td>
                            <td id="RYRQ_JZ">-</td>
                        </tr>
                    </table>
                    <div class="margin-left10 see-dot-msg-header fs_16">
                        <label class="edges-icon1"></label>诊断信息
                    </div>
                    <table class="see-dot-msg-table margin-top10">
                        <tr>
                            <td>入院诊断:</td>
                            <td id="RYZD_JZ"></td>
                            
                            <td >其他诊断:</td>
                            <td id="QTZD_JZ"></td>
                            
                        </tr>
                        <tr>
                            <td>出院诊断:</td>
                            <td id="CYZD_JZ"></td>
                        </tr>
                    </table>
                </div>
                <div class="border-lef float" style="width: 30%;">
                    <table class="radio-table body-width margin-top10" style="margin-bottom: 8px;">
                        <tr>
                            <td class="left" style="padding:8px 20px">违规状态：</td>
                            <td class="left"><input type="radio" class="payKe" name="payMethod" value="0"/><span>正常</span>
                                <input type="radio" name="payMethod" class="payKe margin-left10" value="1"/><span>违规</span></td>
                        </tr>
                        <tr>
                            <td style="text-align:left; padding:10px 20px">审核意见：</td>
                            <td ></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-left: 20px;padding-right: 20px">
                                <textarea style="" class="textarea" id="checkopinion"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="padding-top10 text-right padding-right20">
                                <button type="button" class="btn btn-success btn-sm" id="save" onclick="changeCheck()">保存</button>
                                &nbsp;
                                <button class="btn btn-primary btn-sm" id="complete" onclick="complete()">完成</button>
                                &nbsp;
                                <button class="btn btn-sm btn-info" id="cancel" onclick="cancelOK()">取消完成</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="clear"></div>
            </div>
            <!--费用指标预警-->
            <div class="margin-top10" style="display: none;">
                <div style="width: 76%;">
                    <div class="margin-left10 see-dot-msg-header fs_16" style="width: 70%" id="warningInfoDataGrid">
                        <label class="edges-icon1"></label>费用指标预警
                    </div>
                    <table class="see-dot-msg-table body-width margin-top10" id="">
                        <tr>
                        	<!-- //warning1 -->
                            <td class="">医保金额(元):</td>  
                            <td class="" id="YBJE_YJ">-</td>
                            <td>人均基金限额(元):</td>
                            <td id="RJJJXE_YJ">-</td>
                        </tr>
                        <tr>
                            <td class="">住院天数:</td>
                            <td class="" id="ZYTS_YJ">-</td>
                            <td>限定住院时间:</td>
                            <td id="XDZYSJ_YJ">-</td>
                        </tr>
                        <tr>
                            <td class="">医疗总费用(元):</td>
                            <td class="" id="YLF_YJ">-</td>
                            <td>人均医疗费用(元):</td>
                            <td id="RJYLF_YJ">-</td>
                        </tr>
                        <tr>
                            <td>自费(元):</td>
                            <td id="ZF_YJ">-</td>
                            <td>自费比:</td>
                            <td id="ZFZB_YJ">-</td>
                            <td>自费比限额:</td>
                            <td id="ZFBXE_YJ">-</td>
                        </tr>
                        <tr>
                            <td>药费(元):</td>
                            <td id="YF_YJ">-</td>
                            <td>药占比:</td>
                            <td id="YZB_YJ">-</td>
                            <td>药占比限额:</td>
                            <td id="YZBXE_YJ">-</td>
                        </tr>
                        <tr>
                            <td class="">检查检验费(元):</td>
                            <td class="" id="JCJYF_YJ">-</td>
                            <td class="" >检查检验占比:</td>
                            <td class="" id="JCJYFZB_YJ">-</td>
                            <td>检查检验占比限额:</td>
                            <td id="JCJYFZBXE_YJ">-</td>
                        </tr>
                        <tr>
                            <td class="">诊疗费(元):</td>
                            <td class="" id="ZLF_YJ">-</td>
                            <td class="">诊疗占比:</td>
                            <td class="" id="ZLZB_YJ">-</td>
                            <td>诊疗占比限额:</td>
                            <td id="ZLZBXE_YJ">-</td>
                        </tr>
                        <tr>
                            <td>材料费(元):</td>
                            <td id="CLF_YJ">-</td>
                            <td>材料占比:</td>
                            <td id="CLZB_YJ">-</td>
                            <td>材料占比限额:</td>
                            <td id="CLZBXE_YJ">-</td>
                        </tr> 
                    </table>
                </div>
            </div>
            <!--审核违规-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                         <table class="common-table" id="auditViolations">
                            
                        </table>
                    </div>
                </div>
            </div>
            <!--医嘱明细-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                    <table class="common-table" id="docDetail">
                    <tbody>
                    
                    </tbody>
                </table>
                    </div>
                </div>
            </div>
            <!--费用明细-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                        <table class="common-table" id="costDetail">
                            <tbody>
                           
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>            
        </div>
    </div>
</div>
<div id="df" style="display:none">
<div class="ys-rc-div bg-color">
    <div class="gauge-title-div">
        <table class="body-width">
            <tr>
                <td class="table-title">
                    
                </td>
                <td class="right fs_16 padding-top10">
                    <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                </td>
            </tr>
        </table>
    </div>
    <div class="body-width padding10 padding-top0">
        <div class="ys-rc-div">
            <table class="body-width common-table" style="height:auto">
                <tbody>
                <tr>
                    <th>入院日期</th>
                    <th>身份证号</th>
                    <th>患者姓名</th>
                    <th>参保类型</th>
                    <th>就医方式</th>
                    <th>科室</th>
                    <th>医师</th>
                    <th>入院诊断</th>
                    <th>治疗方式</th>
                    <th>医疗费(元)</th>
                    <th>医保内金额(元)</th>
                    <th>乙类自付(元)</th>
                    <th>自费金额(元)</th>
                    <th>违规状态</th>
                    <th>审核意见</th>
                </tr>
                <tr>
                    <td>2017/08/03</td>
                    <td>530*****91</td>
                    <td><a href="javascript:;">尹爱华</a></td>
                    <td>城乡居民</td>
                    <td>普通住院</td>
                    <td>肿瘤科</td>
                    <td>龙陵</td>
                    <td>-</td>
                    <td>单膝关节置换术</td>
                    <td class="right">2217</td>
                    <td class="right">2000</td>
                    <td>1200</td>
                    <td>217</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>2017/08/12</td>
                    <td>371*****02</td>
                    <td><a href="javascript:;">李芳</a></td>
                    <td>城乡居民</td>
                    <td>普通住院</td>
                    <td>内科</td>
                    <td>旺盛</td>
                    <td>-</td>
                    <td>肺移植</td>
                    <td class="right">4599.9</td>
                    <td class="right">4102.3</td>
                    <td>497.6</td>
                    <td>408.2</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>2017/08/20</td>
                    <td>362*****23</td>
                    <td><a href="javascript:;">李强</a></td>
                    <td>城乡居民</td>
                    <td>普通住院</td>
                    <td>肿瘤科</td>
                    <td>王菲</td>
                    <td>-</td>
                    <td>肺移植</td>
                    <td class="right">5914.4</td>
                    <td class="right">5528.3</td>
                    <td>366.1</td>
                    <td>301.82</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                <tr>
                    <td>2017/08/22</td>
                    <td>236*****91</td>
                    <td><a href="javascript:;">王玉兰</a></td>
                    <td>城乡居民</td>
                    <td>普通住院</td>
                    <td>内科</td>
                    <td>龙陵</td>
                    <td>-</td>
                    <td>单膝关节置换术</td>
                    <td class="right">9994.3</td>
                    <td class="right">3867.8</td>
                    <td>366.2</td>
                    <td>1213.6</td>
                    <td>-</td>
                    <td>-</td>
                </tr>
                </tbody>
            </table>
    </div>
</div>
</div>
    <div class="yb-jj-div margin-top10 bg-color" style="padding:10px;">
        <div class="float tab-div" style="width: 80%;">
            <div class="tab-div-menu jb-ul-li" id="we">
                <ul class="ul-style" id="ul-two1">
                    <li>
                        <label class="x-on" style="margin-left: -2px">就诊信息</label>
                    </li>
                    <li>
                        <label>费用指标预警</label>
                    </li>
                    <li>
                        <label>审核违规</label>
                    </li>
                    <li>
                        <label>自费提醒</label>
                    </li>
                    <li>
                        <label>路径外收费</label>
                    </li>
                    <li>
                        <label>出院带药</label>
                    </li>
                    <li>
                        <label>医保对账</label>
                    </li>
                    <li>
                        <label>医嘱明细</label>
                    </li>
                    <li>
                        <label>费用明细</label>
                    </li>
                </ul>
            </div>
        </div>

        <div class="clear"></div>
        <div class="tab-div-box1 border-val soput" id='ng' style="margin-bottom: 2px; padding-bottom:10px;">
            <!--就诊信息-->
            <div class="margin-top10">
                <div>
                    <div class="margin-left10 see-dot-msg-header fs_16">
                        <label class="edges-icon1"></label>就诊信息
                    </div>
                    <table class="see-dot-msg-table margin-top10" style="width: 80%">
                        <tr>
                            <td>医保卡号:</td>
                            <td>530******91</td>
                            <td>身份证号:</td>
                            <td>530******91</td>
                            <td>参保人:</td>
                            <td>尹爱华</td>
                            <td>人员类别:</td>
                            <td>在职</td>
                        </tr>
                        <tr>
                            <td>年龄:</td>
                            <td>56</td>
                            <td>性别:</td>
                            <td>男</td>
                            <td>就医方式:</td>
                            <td>住院病种</td>
                            <td>入院日期:</td>
                            <td>2017/08/03</td>
                        </tr>
                    </table>
                    <div class="margin-left10 see-dot-msg-header fs_16">
                        <label class="edges-icon1"></label>诊断信息
                    </div>
                    <table class="see-dot-msg-table margin-top10">
                        <tr>
                            <td>入院诊断:</td>
                            <td></td>
                            
                            <td>其他诊断:</td>
                            <td></td>
                            
                        </tr>
                    </table>
                </div>
                
            </div>
            <!--费用指标预警-->
            <div class="margin-top10" style="display: none;">
                <div>
                    <div class="margin-left10 see-dot-msg-header fs_16">
                        <label class="edges-icon1"></label>费用指标预警
                        <button class="btn btn-sm btn-primary margin-right10" style="float:right; margin-top:-7px;"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出</button>
                    </div>
                    <table class="see-dot-msg-table body-width margin-top10">
                        <tr>
                            <td class="">医保金额(元):</td>
                            <td class="">9576</td>
                            <td>人均基金限额(元):</td>
                            <td>7885</td>
                        </tr>
                        <tr>
                            <td class="">住院天数:</td>
                            <td class="">14天</td>
                            <td>限定住院时间:</td>
                            <td>9.3天</td>
                        </tr>
                        <tr>
                            <td class="">医疗总费用(元):</td>
                            <td class="">13423</td>
                            <td>人均医疗费用(元):</td>
                            <td>12456</td>
                        </tr>
                        <tr>
                            <td>自费(元):</td>
                            <td>2505</td>
                            <td>自费比:</td>
                            <td>18%</td>
                            <td>自费比限额:</td>
                            <td>19%</td>
                        </tr>
                        <tr>
                            <td>药费(元):</td>
                            <td>5614</td>
                            <td>药占比:</td>
                            <td>17.4%</td>
                            <td>药占比限额:</td>
                            <td>23%</td>
                        </tr>
                        <tr>
                            <td class="">检查检验费(元):</td>
                            <td class="">939.6</td>
                            <td class="">检查检验占比:</td>
                            <td class="">9%</td>
                            <td>检查检验占比限额:</td>
                            <td>7%</td>
                        </tr>
                        <tr>
                            <td class="">诊疗费(元):</td>
                            <td class="">8724.95</td>
                            <td class="">诊疗占比:</td>
                            <td class="">42%</td>
                            <td>诊疗占比限额:</td>
                            <td>37%</td>
                        </tr>
                        <tr>
                            <td>材料费(元):</td>
                            <td>1476.53</td>
                            <td>材料占比:</td>
                            <td>10%</td>
                            <td>材料占比限额:</td>
                            <td>11%</td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--审核违规-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                        <table class="common-table">
                            <tbody>
                            <tr>
                                <th>序号</th>
                                <th>项目编码</th>
                                <th>项目名称</th>
                                <th>违反规则</th>
                                <th>提示说明</th>
                                <th>开立原因</th>
                                <th>违规金额(元)</th>
                                <th>科室</th>
                                <th>医师</th>
                                <th>规格</th>
                                <th>单位</th>
                                <th>单价(元)</th>
                                <th>给药途径</th>
                                <th>用法</th>
                                <th>用量</th>
                                <th>数量</th>
                                <th>金额(元)</th>
                                <th>医保内金额(元)</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>456</td>
                                <td>平消片(薄膜衣)</td>
                                <td>重复用药</td>
                                <td>患者同一天开平消片和消癌平分散片是同一最小分类下抗肿瘤药物</td>
                                <td>-</td>
                                <td>-</td>
                                <td>肿瘤科</td>
                                <td>龙陵</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>678</td>
                                <td>消癌平胶囊</td>
                                <td>药品超量</td>
                                <td>该药品在同一天内的开药量不得超过15天</td>
                                <td>-</td>
                                <td>-</td>
                                <td>内科</td>
                                <td>龙陵</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--自费提醒-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                        <table class="common-table">
                            <tbody>
                            <tr>
                                <th>序号</th>
                                <th>项目编码</th>
                                <th>项目名称</th>
                                <th>自费标识</th>
                                <th>科室</th>
                                <th>医师</th>
                                <th>规格</th>
                                <th>单位</th>
                                <th>单价</th>
                                <th>给药途径</th>
                                <th>用法</th>
                                <th>用量</th>
                                <th>数量</th>
                                <th>金额(元)</th>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>896</td>
                                <td>多西他赛</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>注射液</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>899</td>
                                <td>注射用美洛西林钠</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>注射液</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                                <td>-</td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--路径外收费-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                        <table class="common-table">
                            <tbody>
                            <tr>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                                <th></th>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--出院带药-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                        <table class="common-table">
                            <tbody>
                    <tr class="th-bg">
                        <th>序号</th>
                        <th>日期</th>
                        <th>时间</th>
                        <th>项目编码</th>
                        <th>项目名称</th>
                        <th>违反规则</th>
                        <th>提示说明</th>
                        <th>违规金额(元)</th>
                        <th>实际数量</th>
                        <th>实际金额(元)</th>
                        <th>科室</th>
                        <th>医师</th>
                        <th>给药途径</th>
                        <th>用法</th>
                        <th>用量</th>
                        <th>规格</th>
                        <th>单位</th>
                        <th>单价(元)</th>
                        <th>数量</th>
                        <th>金额(元)</th>
                        <th>医保内金额(元)</th>
                    </tr>
                    <tr>
                        <td>0001</td>
                        <td>20170202</td>
                        <td>09:36</td>
                        <td>Y00000000949</td>
                        <td>阿托伐他汀钙片</td>
                        <td>-</td>
                        <td>-</td>
                        <td class="right">0</td>
                        <td class="right">8</td>
                        <td class="right">213.84</td>
                        <td>内科</td>
                        <td>肖勇</td>
                        <td>口服</td>
                        <td>出院带药</td>
                        <td>-</td>
                        <td>40mg</td>
                        <td>7片/盒</td>
                        <td class="right">26.73</td>
                        <td class="right">8</td>
                        <td class="right">213.84</td>
                        <td class="right">213.84</td>
                    </tr>
                    <tr>
                        <td>0002</td>
                        <td>20170202</td>
                        <td>09:38</td>
                        <td>Y00000000769</td>
                        <td>精蛋白锌重组赖<br>脯胰岛素混和注<br>射液(25R)</td>
                        <td>-</td>
                        <td>-</td>
                        <td class="right">0</td>
                        <td class="right">2</td>
                        <td class="right">163.74</td>
                        <td>内科</td>
                        <td>肖勇</td>
                        <td>口服</td>
                        <td>出院带药</td>
                        <td>-</td>
                        <td>3ml:300单位(笔芯)</td>
                        <td>1支/盒</td>
                        <td class="right">81.87</td>
                        <td class="right">2</td>
                        <td class="right">163.74</td>
                        <td class="right">163.74</td>
                    </tr>
                    <tr>
                        <td>0003</td>
                        <td>20170202</td>
                        <td>9:40</td>
                        <td>Y00000000479</td>
                        <td>青霉素V钾片</td>
                        <td>-</td>
                        <td>-</td>
                        <td class="right">-</td>
                        <td class="right">1</td>
                        <td class="right">28</td>
                        <td>内科</td>
                        <td>肖勇</td>
                        <td>口服</td>
                        <td>出院带药</td>
                        <td>-</td>
                        <td>0.25g*12片/盒</td>
                        <td>盒</td>
                        <td class="right">28</td>
                        <td class="right">1</td>
                        <td class="right">28</td>
                        <td class="right">10</td>
                    </tr>
                    <tr>
                        <td>0004</td>
                        <td>20170202</td>
                        <td>9:42</td>
                        <td>Y00000000480</td>
                        <td>阿奇霉素</td>
                        <td>-</td>
                        <td>-</td>
                        <td class="right">-</td>
                        <td class="right">1</td>
                        <td class="right">36</td>
                        <td>内科</td>
                        <td>肖勇</td>
                        <td>口服</td>
                        <td>出院带药</td>
                        <td>-</td>
                        <td>0.25g*6粒/盒</td>
                        <td>盒</td>
                        <td class="right">36</td>
                        <td class="right">1</td>
                        <td class="right">36</td>
                        <td class="right">21</td>
                    </tr>
                    </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!--医保对账-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                         <table class="common-table">
                        <tbody>
                        <tr>
                            <th>单据号</th>
                            <th>患者编号/医保号</th>
                            <th>收费项目编号</th>
                            <th>项目明称</th>
                            <th>项目数量</th>
                            <th>项目金额(元)</th>
                            <th>时间</th>
                            <th>对比结果</th>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>仅服务器存在</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>服务器数据重复</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>仅本地存在</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>金额差异</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>项目编号差异</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>数量差异</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>患者信息差异</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>时间差异</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>对比正常</td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
            <!--医嘱明细-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                  <table class="common-table">
                    <tbody>
                    <tr class="th-bg">
                        <th>序号</th>
                        <th>日期</th>
                        <th>时间</th>
                        <th>项目编码</th>
                        <th>项目名称</th>
                        <th>违反规则</th>
                        <th>提示说明</th>
                        <th>违规金额(元)</th>
                        <th>实际数量</th>
                        <th>实际金额(元)</th>
                        <th>科室</th>
                        <th>医师</th>
                        <th>给药途径</th>
                        <th>用法</th>
                        <th>用量</th>
                        <th>规格</th>
                        <th>单位</th>
                        <th>单价(元)</th>
                        <th>数量</th>
                        <th>金额(元)</th>
                        <th>医保内金额(元)</th>
                    </tr>

                    <tr>
                        <td>0001</td>
                        <td>20170202</td>
                        <td>09:36</td>
                        <td>Y00000000947</td>
                        <td>糖脉康颗粒</td>
                        <td>1.超量取药</td>
                        <td>该药品在同一天<br>内的开药量不得<br>超过15天</td>
                        <td class="right">38</td>
                        <td class="right">4</td>
                        <td class="right">152</td>
                        <td>内科</td>
                        <td>肖勇</td>
                        <td>口服</td>
                        <td>-</td>
                        <td>-</td>
                        <td>5g/袋</td>
                        <td>21袋/盒</td>
                        <td class="right">38</td>
                        <td class="right">4</td>
                        <td class="right">152</td>
                        <td class="right">152</td>
                    </tr>
                    <tr>
                        <td>0002</td>
                        <td>20170202</td>
                        <td>09:38</td>
                        <td>Y00000001502</td>
                        <td>阿司匹林肠溶片</td>
                        <td>2.超量取药</td>
                        <td>该药品在同一天<br>内的开药量不得<br>超过16天</td>
                        <td class="right">54.51</td>
                        <td class="right">10</td>
                        <td class="right">181.7</td>
                        <td>内科</td>
                        <td>肖勇</td>
                        <td>口服</td>
                        <td>-</td>
                        <td>-</td>
                        <td>25mg</td>
                        <td>30片/盒</td>
                        <td class="right">18.17</td>
                        <td class="right">2</td>
                        <td class="right">36.34</td>
                        <td class="right">36.34</td>
                    </tr>
                    <tr>
                        <td>0003</td>
                        <td>20170202</td>
                        <td>10:38</td>
                        <td>Y00000010343</td>
                        <td>青霉素注射液</td>
                        <td>3.超量取药</td>
                        <td>该药品在同一天<br>内的开药量不得<br>超过2000w单位</td>
                        <td class="right">15</td>
                        <td class="right">1</td>
                        <td class="right">60</td>
                        <td>内科</td>
                        <td>许瑞才</td>
                        <td>静脉注射</td>
                        <td>-</td>
                        <td>-</td>
                        <td>80万u/支</td>
                        <td>12支/盒</td>
                        <td class="right">15</td>
                        <td class="right">4</td>
                        <td class="right">60</td>
                        <td class="right">-</td>
                    </tr>
                    </tbody>
                </table>
                    </div>
                </div>
            </div>
            <!--收费明细-->
            <div style="display: none;">
                <div class="yb-jj-div">
                    <div class="ys-rc-div margin-top20">
                        <table class="common-table">
                            <tbody>
                            <tr>
                                <th>序号</th>
                                <th>项目编码</th>
                                <th>医院项目名称</th>
                                <th>数量</th>
                                <th>金额(元)</th>
                                <th>医保内金额(元)</th>
                                <th>执行科室</th>
                            </tr>
                            <tr>
                                <td>160421</td>
                                <td>F00000001372</td>
                                <td>尿糖检查</td>
                                <td class="right">1</td>
                                <td class="right">45</td>
                                <td class="right">37</td>
                                <td>内分泌科</td>
                            </tr>
                            <tr>
                                <td>150341</td>
                                <td>F00000039347</td>
                                <td>血常规</td>
                                <td class="right">1</td>
                                <td class="right">30</td>
                                <td class="right">25</td>
                                <td>检验科</td>
                            </tr>
                            <tr>
                                <td>140261</td>
                                <td>F00000000189</td>
                                <td>葡萄糖测定(GLu)</td>
                                <td class="right">2</td>
                                <td class="right">78</td>
                                <td class="right">20</td>
                                <td>检验科</td>
                            </tr>
                            <tr>
                                <td>130181</td>
                                <td>F00000000219</td>
                                <td>淀粉酶测定(AMY)</td>
                                <td class="right">1</td>
                                <td class="right">67</td>
                                <td class="right">12</td>
                                <td>检验科</td>
                            </tr>
                            <tr>
                                <td>120101</td>
                                <td>F00000000278</td>
                                <td>钠测定(Na干化学)</td>
                                <td class="right">2</td>
                                <td class="right">100</td>
                                <td class="right">28</td>
                                <td>检验科</td>
                            </tr>
                            <tr>
                                <td>110021</td>
                                <td>F00000000277</td>
                                <td>钾测定(K干化学)</td>
                                <td class="right">1</td>
                                <td class="right">100</td>
                                <td class="right">20</td>
                                <td>检验科</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>            
        </div>
    </div>
</div>
<script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
<script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
var zyh="";  //住院号
var num = 0;
$(document).ready(function(){
    $("#citySel").on({
        "change": function () {
            var index = $('#citySel option:selected').index();
            if (index == 0) {
                $('#as').css('display','block');
                $('#df').css('display','none');
            } else {
                $('#as').css('display','none');
                $('#df').css('display','block');
            }
        }
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
        
            }                        
        }
    })
}
    $(function () {

        /* 日期插件*/
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            todayBtn: true//显示今日按钮
        });
        selectRender("${path}/department/getDepartmentOfUser?kslx=zysy","#depart",{}); 
        var ksbm=$("#depart").val();
        selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor",{});
        $("#depart,#cblxbm,#jyfs1,#zlfs,#zyzt,#shzt").comboSelect();  
        /*$("#zlfs,#jyfs1,#shzt").parent().find("input").css({"width":"100px"});
        $("#depart,#cblxbm,#zyzt").parent().find("input").css({"width":"120px"});*/
        searchData();
    })
$("#depart").change(function(){        
        var ksbm=$(this).val();
        selectRender('${path}/department/getdoctorByksbm?ksbm='+ksbm,"#doctor",{});
})
        $("#ul-two li").click(function () {
            //切换选中的按钮高亮状态
            
            var index = $(this).index();
            $("#ul-two li").eq(index).find('label').addClass("x-on");
            
            $("#ul-two li").eq(index).siblings().children().removeClass("x-on");

            //获取被按下按钮的索引值，需要注意index是从0开始的
            $("#gw > div").eq(index).show().siblings().hide();
         
            num=index;
            visitInfo(zyh);
        });
        limitForm();
        $("#ul-two1 li").click(function () {
            //切换选中的按钮高亮状态
            
            var index = $(this).index();
            $("#ul-two1 li").eq(index).find('label').addClass("x-on");
            
            $("#ul-two1 li").eq(index).siblings().children().removeClass("x-on");

            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".soput > div").eq(index).show().siblings().hide();
        });
        //柱状图1
        function bar(){
            var mouth_s_color;
            var year_s_color;
            var normal_color = "#92D050";
            var abnormal_color = "#FF0000"

            //柱状图1
            var Chart_bar1 = echarts.init(document.getElementById('bar1'));
            var mouth_x_date = 40;
            var mouth_s_date = 45;
            if(mouth_x_date > mouth_s_date){
                mouth_s_color = normal_color
            }
            else{
                mouth_s_color = abnormal_color
            }
            // 指定图表的配置项和数据
            option_bar1 = {
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
                    barWidth: 14,
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
            Chart_bar1.setOption(option_bar1);

            //柱状图2
            var Chart_bar2 = echarts.init(document.getElementById('bar2'));
            var year_x_date = 560;
            var year_s_date = 460;
            if(year_x_date > year_s_date){
                year_s_color = normal_color
            }
            else{
                year_s_color = abnormal_color
            }
            // 指定图表的配置项和数据
            option_bar2 = {
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
                    barWidth: 14,
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
            Chart_bar2.setOption(option_bar2);

            window.addEventListener("resize", function () {
                Chart_bar1.resize();
                Chart_bar2.resize();
            });
        };

        //折线图
        function line() {
            var Chart_line = echarts.init(document.getElementById('line'));
            // 指定图表的配置项和数据
            option_line = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    right: 10,
                    top: 20,
                    data: ['就诊次数', '违规次数','医疗费', '医保统筹支付费', '药品费', '次均费用', '次均药费', '目录外金额']
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
                        name: '医保统筹支付费',
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
                                color: '#037FF4'
                            }
                        },
                        barWidth: 20,
                        data: [5, 21, 12, 16, 8, 5,16]
                    },
                    {
                        name: '违规次数',
                        type: 'bar',
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#FA5654'
                            }
                        },
                        barWidth: 20,
                        data: [1, 7, 4, 2, 1, 6,3]
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_line.setOption(option_line);
            window.addEventListener("resize", function () {
                Chart_line.resize();
            });
        }
        $("a,button").focus(function () {
            this.blur()
        });
    });
    // 住院患者
    function getzypatientDataGrid() {
       var ldate=$("#ldate").val();
       var hdate=$("#hdate").val();
       var ksbm=$("#depart").val();
       var ysgh=$("#doctor").val();
       var sfzhm=$('#sfzhm').val();    
       var hzxm=$("#hzxm").val();
       var cblxbm=$('#cblxbm').val(); 
       var jyfs=$('#jyfs1').val();
       var ryzd=$('#ryzd').val();
       var cyzd=$('#cyzd').val();
       var shzt=$('#shzt').val(); 
       var zlfs=$('#zlfs').val();
       var zyzt=$("#zyzt").val();
       var lcyrq=$('#lcyrq').val();
       var hcyrq=$("#hcyrq").val();
       var methodFlag;
       if(shzt==3){
           methodFlag='mzkydjDataGrid'; 
       }else{
           methodFlag='mzdjDataGrid';  
       }
       $('#zypatientDataGrid').datagrid({
        url : '${path }/costStruct/SelectCostStruct',
        fit : false,
        striped : true,
        queryParams: {          
            ldate: ldate,
            hdate: hdate,
            ksbm : ksbm,
            ysgh : ysgh,
            sfzhm: sfzhm,
            hzxm : hzxm,
            cblxbm:cblxbm,
            jyfs : jyfs,
            ryzd : ryzd,
            cyzd : cyzd,
            zlfs : zlfs,
            shzt : shzt,
            zyzt : zyzt,
            methodFlag:methodFlag,
            lcyrq:lcyrq,
            hcyrq:hcyrq,
            flag:"to_64"
          }    ,
        pagination : true,
        singleSelect : true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [ [ 
             {
	             width : '10%',
	             title : '入院日期',
	             field : 'JZRQ' 
             },{
                 width : '10%',
                 title : '出院日期',
                 field : 'CYRQ', 
                 hidden: true
             },{
                 width : '15%',
                 title : '身份证号',
                 field : 'SFZHM'
                 
             },  {
                 width : '10%',
                 title : '患者姓名',
                 field : 'HZXM',
                 formatter: function (value, rowData, rowIndex) {       
                         return "<a style='color:green' href='javacript:;' onclick=visitInfo('" + rowData.MZLSH + "');>" + value + "</a>";
                  }
             }, {
                 width : '10%',
                 title : '参保类型',
                 field : 'CBLX'
             } , {
                 width : '10%',
                 title : '就医方式',
                 field : 'JYFS',
                 formatter:function(value,row,index){
                     switch (value) {
                     case '21':
                        return "普通住院";
                     case '22':
                        return "单病种";
                     default:
                         return "-";
                     }
                 }
            
             }, {
                 width : '10%',
                 title : '入院诊断',
                 field : 'RYZD',
                 formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
            
             },{
                 width : '10%',
                 title : '出院诊断',
                 field : 'CYZD',
                 formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                },
	             hidden:true
            
             }, {
                 width : '15%',
                 title : '治疗方式',
                 field : 'ZLFS',
                 formatter: function(value){
	                	if(value==null){
	                  		 return '-'; 
	                  	 }else{
	                  		 return "<span title='" + value + "'>" + value + "</span>"; 
	                  	 } 
	                }
             },{
                 width : '10%',
                 title : '科室',
                 field : 'KSMC'
            
             }, {
                 width : '10%',
                 title : '医师',
                 field : 'YSXM'
            
             }, 
             {width : '10%',title : '开立原因',field : 'KLYY',
	            	formatter: function (value){
	                      if(value==null){
	                          return '-'; 
	                      }else{
	                          return "<span title='" + value + "'>" + value + "</span>" 
	                      }
	                  }
	         },
             {
                 width : '6%',
                 title : '医疗费(元)',
                 field : 'YLF'
            
             }, {
                 width : '8%',
                 title : '医保内金额(元)',
                 field : 'YBNJE'
            
             },{
                 width : '8%',
                 title : '自费金额(元)',
                 field : 'ZFJE'   
             }, {
                 width : '6%',
                 title : '违规状态',
                 field : 'WGZT'
             }, {
                 width : '10%',
                 title : '审核意见',
                 field : 'SHYJ'   
             }
        ] ],
        onBeforeLoad: function (param) {
            updateDatagridHeader(this);                 
        },
        onLoadSuccess:function(data){
        	
        	if(zyzt=='cy'){
        		  $('#zypatientDataGrid').datagrid('showColumn', 'CYZD'); 
        		  $('#zypatientDataGrid').datagrid('showColumn', 'CYRQ'); 
        	}else{
        		$('#zypatientDataGrid').datagrid('hideColumn', 'CYZD'); 
      		    $('#zypatientDataGrid').datagrid('hideColumn', 'CYRQ'); 
        	}
        	
       		$('#zypatientDataGrid').datagrid("selectRow", 0);
           	var row = $('#zypatientDataGrid').datagrid("getSelections");
           	if(row[0]!=undefined)
           	{
           		visitInfo(row[0].MZLSH);
           	}
            	
        	if(jyfs!=22)
        	{
        		$("#zypatientDataGrid").datagrid("hideColumn", "ZLFS");
        	}
            window.onresize=function(){
                $("#zypatientDataGrid").datagrid('resize');
            }
        }
    });
    
}
  
    // 就诊信息
    function medicalInfor(zyh){
        if(zyh != ""){
            $.ajax({
                url:'${path }/invoiceCheck/medicalInfor',
                data:{zyh:zyh,flag:"to_64"},
                type:'post',
                success:function(data){
                    var data = JSON.parse(data);
                    $.each(data,function(index,obj){
                        $("#"+index).text(obj);
                    });
                } 
           });
        checkState();
        }else{
            var arr = new Array("#YBKH_JZ","#SFZHM_JZ","#CBR_JZ","#RYLB_JZ","#AGE_JZ",
                    "#SEX_JZ","#JYFS_JZ","#RYRQ_JZ","#RYZD_JZ","#QTZD_JZ","#CYZD_JZ"); 
            for(var i=0;i<10;i++){
                $(arr[i]).text("-");
            }  
        }
    }
    // 费用指标预警
    function costIndicator(zyh){
        if(zyh!=''){
            $.ajax({
                url:'${path }/invoiceCheck/costIndicator',
                data:{zyh:zyh,flag:"to_64"},
                type:'post',
                success:function(data){
                    var data=JSON.parse(data);  //身份证号
                    $.each(data,function(index,obj){
                        $("#"+index).text(obj);
                    });
                } 
           });
        }
    };
    // 审核违规
    function auditViolations(){
    	if(zyh!=''){
    		$('#auditViolations').datagrid({
                url : '${path }/costStruct/SelectCostStruct',
                queryParams : {
                	lsh:zyh,
                    methodFlag:'getWGXXByLSH',
                    flag:"to_64"
                },
                rownumbers:true,
                singleSelect:true,
                rownumberHeader:'序号',
                fit : false,
                striped : true,
                pagination : true,
                nowrap : true,
                pageSize : 5,
                pageList : [ 5 ],
                columns : [ [
                    {
		                width : '13%',
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
                     updateDatagridHeader(this);
                }
            });
    	}
        
    }
    
    // 医嘱明细
    function docDetail(lsh){
        if(zyh!=""){
            $('#docDetail').datagrid({
                url : '${path }/costStruct/SelectCostStruct',
                queryParams : {
                    lsh:zyh,
                    methodFlag:'docDetail',
                    flag:"to_64"
                },
                rownumbers:true,
                singleSelect:true,
                rownumberHeader:'序号',
                fit : false,
                striped : true,
                pagination : true,
                nowrap : true,
                pageSize : 5,
                pageList : [ 5 ],
                columns : [ [
                    {
                        width : '13%',
                        title : '项目时间',
                        field : 'XMSJ'
                    },         
                    {
                        width : '10%',
                        title : '项目编码',
                        field : 'XMBM'
                    },{
                        width : '20%',
                        title : '项目名称',
                        field : 'XMMC',
                        formatter:function(value){
                            if(value==null||value==""){
                                return '-';
                            }else{
                                 return "<span title='" + value + "'>" + value + "</span>" ;
                            }
                        }
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
                        width : '6%',
                        title : '规格',
                        field : 'GG'
                    },
                    {
                        width : '6%',
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
                        width : '6%',
                        title : '单价(元)',
                        field : 'DJ'
                    },
                    {
                        width : '6%',
                        title : '数量',
                        field : 'SL'
                    },{
                        width : '6%',
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
                     updateDatagridHeader(this);
                }
            });
        }
        
    }
    // 费用明细
    function costDetail(zyh){
      if(zyh!=""){
        $('#costDetail').datagrid({
            url : '${path }/costStruct/SelectCostStruct',
            queryParams : {
                lsh:zyh,
                methodFlag:'costDetail',
                flag:"to_64"
            },
            rownumbers:true,
            singleSelect:true,
            rownumberHeader:'序号',
            fit : false,
            striped : true,
            pagination : true,
            nowrap : true,
            pageSize : 5,
            pageList : [ 5 ],
            columns : [ [
                {
                    width : '15%',
                    title : '项目时间',
                    field : 'XMSJ'
                },
                {
                    width : '10%',
                    title : '项目编码',
                    field : 'XMBM'
                },
                {
                    width : '20%',
                    title : '医院项目名称',
                    field : 'XMMC',
                    formatter:function (value){
                        if(value==null||value==""){
                            return '-';
                        }else{
                            return "<span title='" + value + "'>" + value + "</span>" ;
                        }
                    }
                },
                {
                    width : '20%',
                    title : '数量',
                    field : 'SL'
                },
                {
                    width : '20%',
                    title : '金额(元)',
                    field : 'JE'
                },
                {
                    width : '20%',
                    title : '医保内金额(元)',
                    field : 'YBNJE'
                },
                {
                    width : '10%',
                    title : '执行科室',
                    field : 'KS'
                }

            ]],
            onBeforeLoad: function (param) {
                 updateDatagridHeader(this);
            }
        });
      }
    }
    function checkState(){
         
        if(zyh!=''){
            $.ajax({
                   type:"POST",
                   url:'${path}/costStruct/selectEcharsData?methodFlag=checkState',
                   data:{mzlsh:zyh,flag:"to_64"},
                   success:function(data){
                      var data=JSON.parse(data);
                      var shzt=data.checkState_value0;
                      var shyj=data.checkState_value1;
                        if(shzt[0]=='0'){
                    $(":radio[value=0]").prop("checked",true).addClass('not-allowed');
                     $("#cancel,#save,#complete,#checkopinion").attr("disabled",true).addClass('not-allowed')
                         }else if(shzt[0]=='1'){
                    $(":radio[value=1]").prop("checked",true).addClass('not-allowed');
                    $("#cancel").attr("disabled",false).removeClass('not-allowed');
                         }
                      if(shyj==undefined){
                          $("#checkopinion").empty().val("");
                      }else if(shyj!=undefined){
                          $("#checkopinion").empty().val(data.checkState_value1);
                      }
                   }
               });
            //limitForm();
        }
    }
    function cancelOK(){
    	var zyzt = $("#zyzt").val();
    	if(zyzt=="zy")
    	{
    		$.messager.alert({
                title:'消息',
                msg:'在院患者不需要审核',
                icon:'info',
                });
    		return false;
    	}
            $.ajax({
                   url:'${path}/invoiceCheck/judgeSuspicious',
                   data:{mzlsh:zyh,flag:"to_64"},
                   type:'post',
                   success:function(data){
                      if(data=="true"){
                          $("#save,#complete,#checkopinion,input:radio").attr("disabled", false)
                          $("#checkopinion,input:radio,#save,#complete").removeClass('not-allowed');
                      }else{
                          $.messager.alert({
                                title:'消息',
                                msg:'该单据不需要审核',
                                icon:'info',
                                });
                          limitForm();
                          $("#zypatientDataGrid").datagrid('reload');
                      }
                   }
               });
    };
    function complete(){
          $("#checkopinion,:radio").addClass('not-allowed').attr("disabled",true);
    }
    function changeCheck(){
        var shzt= $('input[name="payMethod"]:checked').val();//shzt  0:正常;1:违规
        var shyj=$('#checkopinion').val();
        $.ajax({
            url:'${path}/invoiceCheck/changeCheckStatu',
            type:'post',
            data:{
                shzt:shzt,
                shyj:shyj,
                mzlsh:zyh,
                flag:"to_64"
            },
            success:function(){
            	limitForm();
                getzypatientDataGrid();
            }
        }); 
    };
    function searchData() {
        getzypatientDataGrid();
        limitForm();
    };
      //禁用违规表单
      function limitForm(){
    	  zyh='';
          $("#jzxx,#warningInfoDataGrid").find("tr td:odd").empty();
          $("#auditViolations,#docDetail,#costDetail").parents(".panel").css({"display":"none"});
          $("#checkopinion").empty().val('');
          $("input[type='radio'],#checkopinion,#save,#complete,#cancel").addClass('not-allowed').attr("disabled",true);
          $("input[type='radio']").prop("checked",false);
         
      }
      
      function visitInfo(zyh1)
      {
            var index=num;
            zyh = zyh1;
            if(index==0){
                medicalInfor(zyh);
                $(".export").hide();
            }
            if(index==1){
                costIndicator(zyh);
                $(".export").hide();
            }
            if(index==2){
                auditViolations(zyh);
                $(".export").hide();
            }
            if(index==3){
                docDetail(zyh);
                $(".export").show();
            }
            if(index==4){
                costDetail(zyh);
                $(".export").show();
            }
            $("input[type='radio'],#checkopinion,#save,#complete").addClass('not-allowed').attr("disabled",true);
        }
      
  	//导出excel
  	function excelExport(flag){
  		var url;
  		if(flag=='info'){
  			url = "${path }/excel/zyshInfo?flag=to_64";
  			$("#dataSearchForm").attr("action", url);
  		    $("#dataSearchForm").submit();
  		}else{
  			window.location.href = '${path }/excel/zyshDetails?lsh='+zyh+'&flag=to_64';
  		}
  	    
  	}
</script>
</body>
</html>