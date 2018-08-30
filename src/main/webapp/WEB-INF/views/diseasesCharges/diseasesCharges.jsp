<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>病种收费</title>
    <script src="${path }/static/js/common.js"></script>
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

        select {
            width: auto !important;
            margin-left: 0;
        }
        .C_hre > p {
            margin-bottom: 0 !important;
            line-height: 24px !important;
        }
        .pop-up{height: auto!important;}
        .DialogDiv3{top: 5%!important;height: 90%!important;width: 80%!important;left: 10%!important;}
        #closes{cursor: pointer}
        .main-div{padding-bottom: 0px !important;}
        .tab-menu-l  ul >li{width:82px}
    </style>
</head>
<body>
<!--筛选条件-->
<div class="header-div bg-color margin-top6">
    <table class="ys-table tiaojian margin-left20" style="width: 95%">
        <tbody>
        <tr>
            <td>
                <select>
                    <option>2016</option>
                    <option>2017</option>
                </select>
            </td>
            <td class="fs_16">
                年
            </td>
            <td style="width: 44px">
                <select style="width: 46px">
                    <option value="0">01</option>
                    <option value="2">02</option>
                    <option value="3">03</option>
                    <option value="4">04</option>
                    <option value="5">05</option>
                    <option value="6" selected>06</option>
                    <option value="7">07</option>
                    <option value="8">08</option>
                    <option value="9">09</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                </select>
            </td>
            <td class="td-width fs_16">月</td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
                <select style="width: auto">
                    <option value="0">全院</option>
                    <option value="1">内科</option>
                    <option value="1">外科</option>
                </select>
            </td>
            <td class="td-width fs_16">
                参保类型
            </td>
            <td>
                <select style="width: 86px;" id="switch-select">
                    <option value="0">城乡居民</option>
                    <option value="1">城镇职工</option>
                    <option value="2">省直医保</option>
                </select>
            </td>
            <td class="td-width"></td>
            <td>
                <button class="btn btn-primary"><img style="padding: 0" src="${path }/static/img/menu/search.png"><span>查询</span></button>
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
</div>
<div class="bg-color main-div margin-top10">
    <div class="tab-menu-l border-bom">
        <ul class="padding-left10" id=''>
            <li class="fs_16 on">病种汇总</li>
            <li class="fs_16 ">病种视图</li>
            <li class="fs_16 ">限额管理</li>
            <li class="fs_16 ">路径审核</li>
            <li class="fs_16 ">药事管理</li>
            <li class="fs_16 ">耗材管理</li>
            <li class="fs_16 ">路径优化</li>
            <li class="fs_16 ">医师视图</li>
            <li class="fs_16">违规汇总</li>
            <li class="fs_16" style="width: 96px!important;">费用明细比较</li>
        </ul>
        <div class="clear"></div>
    </div>
    <div class="tab-div-boxs" >
        <!--病种汇总-->
        <div>
            <div class="ks-fy-zb">
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>

                            <td class="right fs_16">
                                <button class="btn btn-sm btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="ScrLts">
                    <table class="body-width">
                        <tr>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/survey/icon01.png"/></div>
                                    <div class="C_hre">
                                        <p>120</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">出院人次</span>
                                            <span class="nowrap">与上月比<font class="abnormal-span padding-left4">↑ 20%</font></span>
                                        </p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/survey/icon02.png"/></div>
                                    <div class="C_hre">
                                        <p>36000</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">医疗总费用</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                        </p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li>
                                    <div class="L_img"><img src="${path }/static/img/survey/icon03.png"/></div>
                                    <div class="C_hre">
                                        <p>26000</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">医保统筹支付</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                        </p>
                                    </div>
                                </li>
                            </td>
                            <td>
                                <li class="margin-rgt0">
                                    <div class="L_img"><img src="${path }/static/img/survey/icon09.png"/></div>
                                    <div class="C_hre">
                                        <p>45</p>
                                        <p class="nowrap">
                                            <span class="nowrap zb-font">违规单据数</span>
                                            <span class="nowrap">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                                        </p>
                                    </div>
                                </li>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="gauge-title-div">
                    <table class="body-width">
                        <tr>
                            <td class="left fs_16 table-title">关键指标</td>

                            <td class="right fs_16">
                                <button class="btn btn-sm btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="yb-jj-div ScrLts">
                    <div class="ys-rc-div ">
                        <table class="body-width common-table" id="Ys_div">
                            <tbody>
                            <tr class="th-bg">
                                <th>病种类型</th>
                                <th>治疗方式</th>
                                <th>出院人次</th>
                                <th>平均住院日</th>
                                <th>医疗总费用(元)</th>
                                <th>医保统筹支付(元)</th>
                                <th>超定额人次</th>
                                <th>超定额总费用(元)</th>
                                <th>违规单据数</th>
                                <th>人均药费(元)</th>
                                <th>人均检查检验费(元)</th>
                                <th>人均手术麻醉费(元)</th>
                                <th>人均医用耗材费(元)</th>
                                <th>人均高值耗材费(元)</th>
                                <th>人均治疗费(元)</th>
                                <th>人均血费(元)</th>
                            </tr>
                            <tr>
                                <td>尿毒症</td>
                                <td>三焦辨证治疗体系</td>
                                <td class="right">20</td>
                                <td class="right">36</td>
                                <td class="right">850000</td>
                                <td class="right">750000</td>
                                <td class="right">5</td>
                                <td class="right">700000</td>
                                <td class="right"><a href="javascript:void(0)" class="wg-bills">15</a></td>
                                <td class="right">6000</td>
                                <td class="right">20000</td>
                                <td class="right">6000</td>
                                <td class="right">6000</td>
                                <td class="right">10000</td>
                                <td class="right">8000</td>
                                <td class="right">6000</td>
                            </tr>
                            <tr>
                                <td>慢性病毒性肝炎</td>
                                <td>抗病毒治疗</td>
                                <td class="right">42</td>
                                <td class="right">40</td>
                                <td class="right">800000</td>
                                <td class="right">680000</td>
                                <td class="right">3</td>
                                <td class="right">120000</td>
                                <td class="right"><a href="javascript:void(0)" class="wg-bills">16</a></td>
                                <td class="right">8000</td>
                                <td class="right">21000</td>
                                <td class="right">3000</td>
                                <td class="right">5000</td>
                                <td class="right">12000</td>
                                <td class="right">6000</td>
                                <td class="right">3000</td>
                            </tr>
                            <tr>
                                <td>冠心病</td>
                                <td>心脏支架手术</td>
                                <td class="right">20</td>
                                <td class="right">25</td>
                                <td class="right">700000</td>
                                <td class="right">600000</td>
                                <td class="right">8</td>
                                <td class="right">100000</td>
                                <td class="right"><a href="javascript:void(0)" class="wg-bills">18</a></td>
                                <td class="right">10000</td>
                                <td class="right">16000</td>
                                <td class="right">2300</td>
                                <td class="right">7000</td>
                                <td class="right">16000</td>
                                <td class="right">5000</td>
                                <td class="right">2300</td>
                            </tr>
                            <tr>
                                <td>糖尿病</td>
                                <td>胰岛素治疗</td>
                                <td class="right">15</td>
                                <td class="right">20</td>
                                <td class="right">600000</td>
                                <td class="right">500000</td>
                                <td class="right">6</td>
                                <td class="right">100000</td>
                                <td class="right"><a href="javascript:void(0)" class="wg-bills">20</a></td>
                                <td class="right">4000</td>
                                <td class="right">13000</td>
                                <td class="right">3200</td>
                                <td class="right">6000</td>
                                <td class="right">15000</td>
                                <td class="right">4000</td>
                                <td class="right">3200</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="clear module-hr"></div>
            <!--重点病种 -->
            <div class="margin-top10">
                <div class="yb-jj-div">
                    <div class="yb-jj-div">
                        <div class="gauge-div float">
                            <div class="gauge-title-div">
                                <table class="body-width">
                                    <tr>
                                        <td class="left fs_16 table-title padding-left10">重点病种月出院人次</td>
                                        <td class="right fs_16">
                                            <button class="btn btn-sm btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="num1">
                                <div id="zy_Gauge1">

                                </div>
                            </div>
                            <p class="padding10 warning1">重点病种包括：恶性肿瘤、尿毒症、慢性病毒性肝炎、冠心病、糖尿病、高血压</p>
                        </div>
                        <div id="radar" class="gauge-div float" style="margin-left: 2%">
                            <div class="gauge-title-div">
                                <table class="body-width">
                                    <tr>
                                        <td class="left fs_16 table-title padding-left10">重点病种月限额监测</td>
                                        <td class="right fs_16">
                                            <button class="btn btn-sm btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div id="num2">
                                <div id="zy_Gauge2">

                                </div>
                            </div>
                            <p class="padding10 padding-left30">&nbsp;</p>
                        </div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <div class="clear module-hr"></div>
            <!--月度变化趋势-->
            <div class="line1">
                <div class="main-ys-fy ">
                    <div class="ks-fy-zb" style="height:auto">
                        <div class="gauge-title-div margin-top32">
                            <table class=" float-right" width="100%">
                                <tr>
                                    <td class="left">月度变化趋势</td>
                                    <td class="text-right">
                                        <table class="two-table">
                                            <tr>
                                                <td>门规类别</td>
                                                <td>
                                                    <select style="padding-right: 20px">
                                                        <option value="0">I类</option>
                                                        <option value="1">II类</option>
                                                        <option value="2">III类</option>
                                                    </select>
                                                </td>
                                                <td>门规病种类型</td>
                                                <td>
                                                    <select>
                                                        <option value="0">全部</option>
                                                        <option value="1">恶性肿瘤</option>
                                                        <option value="2">尿毒症</option>
                                                        <option value="3">慢性病毒性肝炎</option>
                                                        <option value="4">冠心病</option>
                                                        <option value="5">糖尿病</option>
                                                        <option value="6">高血压</option>
                                                        <option value="7">肾功能衰竭</option>
                                                        <option value="8">帕金森氏病</option>
                                                        <option value="9">白血病</option>
                                                        <option value="10">系统性红斑狼疮</option>
                                                    </select>
                                                </td>
                                                <td>
                                                    <button class="btn btn-sm btn-primary margin-right10"><img
                                                            src="${path }/static/img/menu/btn1-icon.png">导出
                                                    </button>
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
            <div class="clear module-hr"></div>
        </div>
        <!--病种视图-->
        <div></div>
        <!--限额管理-->
        <div></div>
        <!--路径审核-->
        <div></div>
        <!--药事管理-->
        <div></div>
        <!--耗材管理-->
        <div></div>
        <!--路径优化-->
        <div></div>
        <!--医师视图-->
        <div></div>
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
                                    <li>医师违规情况</li>
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
                                <table class="body-width common-table">
                                    <tbody>
                                    <tr>
                                        <th>排序</th>
                                        <th>违规规则</th>
                                        <th>违规单据数</th>
                                    </tr>
                                    <tr>
                                        <td>01</td>
                                        <td>超适应症用药</td>
                                        <td><a href="javascript:void(0);" class="nm">40</a></td>
                                    </tr>
                                    <tr>
                                        <td>02</td>
                                        <td>限性别</td>
                                        <td><a href="javascript:void(0);" class="nm">23</a></td>
                                    </tr>
                                    <tr>
                                        <td>03</td>
                                        <td>限儿童</td>
                                        <td><a href="javascript:void(0);" class="nm">18</a></td>
                                    </tr>
                                    <tr>
                                        <td>04</td>
                                        <td>限就医方式</td>
                                        <td><a href="javascript:void(0);" class="nm">17</a></td>
                                    </tr>
                                    <tr>
                                        <td>05</td>
                                        <td>重复收费</td>
                                        <td><a href="javascript:void(0);" class="nm">15</a></td>
                                    </tr>
                                    <tr>
                                        <td>06</td>
                                        <td>重复取药</td>
                                        <td><a href="javascript:void(0);" class="nm">13</a></td>
                                    </tr>
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
                                <table class="body-width common-table">
                                    <tbody>
                                    <tr>
                                        <th>入院日期</th>
                                        <th>住院号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>医保卡号</th>
                                        <th>科室</th>
                                        <th>医师</th>
                                        <th>入院诊断</th>
                                        <th>住院天数</th>
                                        <th>住院医疗费用(元)</th>
                                        <th>医保统筹支付(元)</th>
                                        <th>患者负担(元)</th>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>6953****96</td>
                                        <td><a href="javascript:void(0);" class="nm-div-name">尹爱华</a></td>
                                        <td>女</td>
                                        <td>70</td>
                                        <td>2341569</td>
                                        <td>内分沁科</td>
                                        <td>王刚</td>
                                        <td>2型糖尿病</td>
                                        <td>14</td>
                                        <td class="right">13423</td>
                                        <td class="right">9576</td>
                                        <td class="right">1342</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>5961****56</td>
                                        <td><a href="javascript:void(0);" class="nm-div-name">姚晓红</a></td>
                                        <td>男</td>
                                        <td>32</td>
                                        <td>1543786</td>
                                        <td>-</td>
                                        <td>王玉兰</td>
                                        <td>急性阑尾炎</td>
                                        <td>7</td>
                                        <td class="right">8053.8</td>
                                        <td class="right">6573</td>
                                        <td class="right">730.3</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>7402****36</td>
                                        <td><a href="javascript:void(0);" class="nm-div-name">姜乃军</a></td>
                                        <td>男</td>
                                        <td>46</td>
                                        <td>2341637</td>
                                        <td>-</td>
                                        <td>郝红梅</td>
                                        <td>颈椎间盘突出</td>
                                        <td>12</td>
                                        <td class="right">4599.9</td>
                                        <td class="right">4102.3</td>
                                        <td class="right">497.6</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>5694****03</td>
                                        <td><a href="javascript:void(0);" class="nm-div-name">杨生刚</a></td>
                                        <td>男</td>
                                        <td>33</td>
                                        <td>1544081</td>
                                        <td>-</td>
                                        <td>李芳</td>
                                        <td>甲状腺继发恶性肿瘤</td>
                                        <td>13</td>
                                        <td class="right">9994.3</td>
                                        <td class="right">9536.8</td>
                                        <td class="right">457.5</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>3634****40</td>
                                        <td><a href="javascript:void(0);" class="nm-div-name">姚玉基</a></td>
                                        <td>男</td>
                                        <td>25</td>
                                        <td>2341808</td>
                                        <td>-</td>
                                        <td>李强</td>
                                        <td>下肢静脉曲张</td>
                                        <td>12</td>
                                        <td class="right">9368</td>
                                        <td class="right">9203.2</td>
                                        <td class="right">3291.4</td>
                                    </tr>
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
                                <table class="body-width common-table">
                                    <tbody>
                                    <tr>
                                        <th>序号</th>
                                        <th>日期</th>
                                        <th>时间</th>
                                        <th>项目编码</th>
                                        <th>项目名称</th>
                                        <th>违反规则</th>
                                        <th>提示说明</th>
                                        <th>开立原因</th>
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
                                        <td>0001</td>
                                        <td>2017-02-02</td>
                                        <td>9:36</td>
                                        <td>Y00000000947</td>
                                        <td>糖脉康颗粒</td>
                                        <td>1.超量取药</td>
                                        <td>该药品在同一天内的开药量不得超过15天</td>
                                        <td>-</td>
                                        <td>内科</td>
                                        <td>肖勇</td>
                                        <td>5g/袋</td>
                                        <td>21袋/盒</td>
                                        <td class="right">38</td>
                                        <td>口服</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td class="right">4</td>
                                        <td class="right">152</td>
                                        <td class="right">152</td>
                                    </tr>
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
                    <!--医师违规-->
                    <div class="ks-fy-zb ys-tables">
                        <div class="body-width padding10 pad-top0">
                            <div class="ys-rc-div">
                                <table class="common-table">
                                    <tbody>
                                    <tr>
                                        <th>排序</th>
                                        <th>医师</th>
                                        <th>违规单据数</th>
                                    </tr>
                                    <tr>
                                        <td>01</td>
                                        <td>王刚</td>
                                        <td><a href="javascript:void(0);" class="ks-nm">50</a></td>
                                    </tr>
                                    <tr>
                                        <td>02</td>
                                        <td>郝红梅</td>
                                        <td><a href="javascript:void(0);" class="ks-nm">40</a></td>
                                    </tr>
                                    <tr>
                                        <td>03</td>
                                        <td>李芳</td>
                                        <td><a href="javascript:void(0);" class="ks-nm">34</a></td>
                                    </tr>
                                    <tr>
                                        <td>04</td>
                                        <td>李强</td>
                                        <td><a href="javascript:void(0);" class="ks-nm">28</a></td>
                                    </tr>
                                    <tr>
                                        <td>05</td>
                                        <td>王玉兰</td>
                                        <td><a href="javascript:void(0);" class="ks-nm">21</a></td>
                                    </tr>
                                    <tr>
                                        <td>06</td>
                                        <td>高宝强</td>
                                        <td><a href="javascript:void(0);" class="ks-nm">19</a></td>
                                    </tr>
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
                                <table class="body-width common-table">
                                    <tbody>
                                    <tr>
                                        <th>入院日期</th>
                                        <th>住院号</th>
                                        <th>姓名</th>
                                        <th>性别</th>
                                        <th>年龄</th>
                                        <th>医保卡号</th>
                                        <th>科室</th>
                                        <th>医师</th>
                                        <th>入院诊断</th>
                                        <th>住院天数</th>
                                        <th>住院医疗费用(元)</th>
                                        <th>医保统筹支付(元)</th>
                                        <th>患者负担(元)</th>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>6953****96</td>
                                        <td><a href="javascript:void(0);" class="ks-nm-div-name">尹爱华</a></td>
                                        <td>女</td>
                                        <td>70</td>
                                        <td>2341569</td>
                                        <td>内分沁科</td>
                                        <td>王刚</td>
                                        <td>2型糖尿病</td>
                                        <td>14</td>
                                        <td class="right">13423</td>
                                        <td class="right">9576</td>
                                        <td class="right">1342</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>5961****56</td>
                                        <td><a href="javascript:void(0);" class="ks-nm-div-name">姚晓红</a></td>
                                        <td>男</td>
                                        <td>32</td>
                                        <td>1543786</td>
                                        <td>-</td>
                                        <td>王玉兰</td>
                                        <td>急性阑尾炎</td>
                                        <td>7</td>
                                        <td class="right">8053.8</td>
                                        <td class="right">6573</td>
                                        <td class="right">730.3</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>7402****36</td>
                                        <td><a href="javascript:void(0);" class="ks-nm-div-name">姜乃军</a></td>
                                        <td>男</td>
                                        <td>46</td>
                                        <td>2341637</td>
                                        <td>-</td>
                                        <td>郝红梅</td>
                                        <td>颈椎间盘突出</td>
                                        <td>12</td>
                                        <td class="right">4599.9</td>
                                        <td class="right">4102.3</td>
                                        <td class="right">497.6</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>5694****03</td>
                                        <td><a href="javascript:void(0);" class="ks-nm-div-name">杨生刚</a></td>
                                        <td>男</td>
                                        <td>33</td>
                                        <td>1544081</td>
                                        <td>-</td>
                                        <td>李芳</td>
                                        <td>甲状腺继发恶性肿瘤</td>
                                        <td>13</td>
                                        <td class="right">9994.3</td>
                                        <td class="right">9536.8</td>
                                        <td class="right">457.5</td>
                                    </tr>
                                    <tr>
                                        <td>2017/6/23</td>
                                        <td>3634****40</td>
                                        <td><a href="javascript:void(0);" class="ks-nm-div-name">姚玉基</a></td>
                                        <td>男</td>
                                        <td>25</td>
                                        <td>2341808</td>
                                        <td>-</td>
                                        <td>李强</td>
                                        <td>下肢静脉曲张</td>
                                        <td>12</td>
                                        <td class="right">9368</td>
                                        <td class="right">9203.2</td>
                                        <td class="right">3291.4</td>
                                    </tr>
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
                                <table class="body-width common-table">
                                    <tbody>
                                    <tr>
                                        <th>序号</th>
                                        <th>日期</th>
                                        <th>时间</th>
                                        <th>项目编码</th>
                                        <th>项目名称</th>
                                        <th>违反规则</th>
                                        <th>提示说明</th>
                                        <th>开立原因</th>
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
                                        <td>001</td>
                                        <td>2017/2/2</td>
                                        <td>09:36</td>
                                        <td>Y00000000947</td>
                                        <td>糖脉康颗粒</td>
                                        <td>1.超量取药</td>
                                        <td>该药品在同一天内的开药量不得超过15天</td>
                                        <td>-</td>
                                        <td>心血管内科</td>
                                        <td>肖勇</td>
                                        <td>5g/袋</td>
                                        <td>21袋/盒</td>
                                        <td>38</td>
                                        <td> 口服</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td class="right">4</td>
                                        <td class="right">152</td>
                                        <td class="right">152</td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>2017/2/2</td>
                                        <td>09:38</td>
                                        <td>Y00000001502</td>
                                        <td>阿司匹林肠溶片</td>
                                        <td>2.超量取药</td>
                                        <td>该药品在同一天内的开药量不得超过16天</td>
                                        <td>-</td>
                                        <td>心血管内科</td>
                                        <td>肖勇</td>
                                        <td>25mg</td>
                                        <td>30片/盒</td>
                                        <td>18.17</td>
                                        <td> 口服</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td class="right">2</td>
                                        <td class="right">36.34</td>
                                        <td class="right">36.34</td>
                                    </tr>
                                    <tr>
                                        <td>3</td>
                                        <td>2017/2/2</td>
                                        <td>10:38</td>
                                        <td>Y00000010343</td>
                                        <td>青霉素注射液</td>
                                        <td>3.超量用药</td>
                                        <td>该药品在同一天内的用药量不得超过2000w单位</td>
                                        <td>-</td>
                                        <td>心血管内科</td>
                                        <td>许瑞才</td>
                                        <td>80万u/支</td>
                                        <td>支</td>
                                        <td>15</td>
                                        <td> 静脉注射</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td class="right">4</td>
                                        <td class="right">60</td>
                                        <td class="right">30</td>
                                    </tr>
                                    <tr>
                                        <td>4</td>
                                        <td>2017/2/3</td>
                                        <td>11:38</td>
                                        <td>Y00000010344</td>
                                        <td>利巴韦林气雾剂</td>
                                        <td>4.超量用药</td>
                                        <td>该药品在同一天内的用药量不得超过2001w单位</td>
                                        <td>-</td>
                                        <td>心血管内科</td>
                                        <td>许瑞才</td>
                                        <td>10.5g:75mg/瓶</td>
                                        <td>瓶</td>
                                        <td>21</td>
                                        <td> 外用</td>
                                        <td>-</td>
                                        <td>-</td>
                                        <td class="right">2</td>
                                        <td class="right">42</td>
                                        <td class="right">16</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
            </div>
        </div>
        <!--费用明细比较-->
        <div class="ks-fy-zb" style="display: none">
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left fs_16 table-title">病例筛选</td>
                    </tr>
                </table>
            </div>
            <div class="gauge-title-div">
                <table class="body-width">
                    <tr>
                        <td class="left">
                            <ul class="sort-ul">
                                <li class="selected-li">按医疗费排序</li>
                                <li>按药品费排序</li>
                                <li>按耗材费排序</li>
                            </ul>
                        </td>
                        <td class="right fs_16">
                            <button class="btn btn-primary fy-bills" style="width: auto">两者费用比较</button>
                            <button class="btn btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="yb-jj-div ScrLts">
                <div class="ys-rc-div ">
                    <table class="body-width common-table margin-top10">
                        <tbody>
                        <tr class="th-bg">
                            <th>选择</th>
                            <th>患者住院号</th>
                            <th>患者姓名</th>
                            <th>参保类型</th>
                            <th>疾病名称</th>
                            <th>手术操作名称</th>
                            <th>出院日期</th>
                            <th>住院天数</th>
                            <th>科室</th>
                            <th>主治医师</th>
                            <th>医疗总费用(元)</th>
                            <th>医保统筹支付金额(元)</th>
                            <th>患者自付金额(元)</th>
                            <th>患者自费金额(元)</th>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkbox-qx" name="diseases" checked>
                            </td>
                            <td>160513</td>
                            <td>林静</td>
                            <td>城镇职工</td>
                            <td>创伤后单侧髋关节病</td>
                            <td>(单侧)髋关节人工置换术</td>
                            <td>2016-11-03</td>
                            <td class="right">12</td>
                            <td>骨外科</td>
                            <td>曾意荣</td>
                            <td class="right">91075.9</td>
                            <td class="right">29313.13</td>
                            <td class="right">8928.43</td>
                            <td class="right">52834.34</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkbox-qx" name="diseases" checked>
                            </td>
                            <td>160527</td>
                            <td>黄艳静</td>
                            <td>城镇职工</td>
                            <td>创伤后单侧髋关节病</td>
                            <td>(单侧)髋关节人工置换术</td>
                            <td>2016-11-26</td>
                            <td class="right">10</td>
                            <td>骨外科</td>
                            <td>方斌</td>
                            <td class="right">97108.2</td>
                            <td class="right">37756.42</td>
                            <td class="right">41174.74</td>
                            <td class="right">55933.46</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkbox-qx" name="diseases">
                            </td>
                            <td>160590</td>
                            <td>王猛</td>
                            <td>城镇职工</td>
                            <td>创伤后单侧髋关节病</td>
                            <td>(单侧)髋关节人工置换术</td>
                            <td>2016-11-05</td>
                            <td class="right">14</td>
                            <td>骨外科</td>
                            <td>曾意荣</td>
                            <td class="right">93075.9</td>
                            <td class="right">30313.13</td>
                            <td class="right">6128.43</td>
                            <td class="right">53834.34</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox" class="checkbox-qx" name="diseases">
                            </td>
                            <td>160579</td>
                            <td>张涛</td>
                            <td>城镇职工</td>
                            <td>创伤后单侧髋关节病</td>
                            <td>(单侧)髋关节人工置换术</td>
                            <td>2016-11-20</td>
                            <td class="right">11</td>
                            <td>骨外科</td>
                            <td>方斌</td>
                            <td class="right">97208.2</td>
                            <td class="right">37796.42</td>
                            <td class="right">41204.74</td>
                            <td class="right">56033.46</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--病种管理-违规单据数-弹出层-->
<div class="BgDiv3"></div>
<div class="DialogDiv3" style="display: none;">
    <div class="pop-up bg-color1">
        <table class="body-width">
            <tr>
                <td class="text-right padding-right20">
                    <img src="${path }/static/img/close.png" id="closes">
                </td>
            </tr>
        </table>
    </div>
    <!--选项卡-->
    <div class="gauge-title-div ">
        <table class="body-width">
            <tr>
                <td>
                    <div class="tab-tables" style="padding-left: 2%">
                        <ul>
                            <li class="on padding-left0 margin-left0">违规规则排序</li>
                            <li>医师违规情况</li>
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
                        <table class="body-width common-table">
                            <tbody>
                            <tr>
                                <th>排序</th>
                                <th>违规规则</th>
                                <th>违规单据数</th>
                            </tr>
                            <tr>
                                <td>01</td>
                                <td>超适应症用药</td>
                                <td><a href="javascript:void(0);" class="nm">40</a></td>
                            </tr>
                            <tr>
                                <td>02</td>
                                <td>限性别</td>
                                <td><a href="javascript:void(0);" class="nm">23</a></td>
                            </tr>
                            <tr>
                                <td>03</td>
                                <td>限儿童</td>
                                <td><a href="javascript:void(0);" class="nm">18</a></td>
                            </tr>
                            <tr>
                                <td>04</td>
                                <td>限就医方式</td>
                                <td><a href="javascript:void(0);" class="nm">17</a></td>
                            </tr>
                            <tr>
                                <td>05</td>
                                <td>重复收费</td>
                                <td><a href="javascript:void(0);" class="nm">15</a></td>
                            </tr>
                            <tr>
                                <td>06</td>
                                <td>重复取药</td>
                                <td><a href="javascript:void(0);" class="nm">13</a></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
            <!--违规单据-->
            <div class="ks-fy-zb nm-div" style="display: none">
                <div class="body-width padding10 pad-top0">
                    <div class="">
                        <table class="body-width">
                            <tr>
                                <td class="left fs_16 table-title">违规单据汇总</td>
                            </tr>
                        </table>
                    </div>
                    <div class="ys-rc-div">
                        <table class="body-width common-table">
                            <tbody>
                            <tr>
                                <th>入院日期</th>
                                <th>住院号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>医保卡号</th>
                                <th>科室</th>
                                <th>医师</th>
                                <th>入院诊断</th>
                                <th>住院天数</th>
                                <th>住院医疗费用(元)</th>
                                <th>医保统筹支付(元)</th>
                                <th>患者负担(元)</th>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>6953****96</td>
                                <td><a href="javascript:void(0);" class="nm-div-name">尹爱华</a></td>
                                <td>女</td>
                                <td>70</td>
                                <td>2341569</td>
                                <td>内分沁科</td>
                                <td>王刚</td>
                                <td>2型糖尿病</td>
                                <td>14</td>
                                <td class="right">13423</td>
                                <td class="right">9576</td>
                                <td class="right">1342</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>5961****56</td>
                                <td><a href="javascript:void(0);" class="nm-div-name">姚晓红</a></td>
                                <td>男</td>
                                <td>32</td>
                                <td>1543786</td>
                                <td>-</td>
                                <td>王玉兰</td>
                                <td>急性阑尾炎</td>
                                <td>7</td>
                                <td class="right">8053.8</td>
                                <td class="right">6573</td>
                                <td class="right">730.3</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>7402****36</td>
                                <td><a href="javascript:void(0);" class="nm-div-name">姜乃军</a></td>
                                <td>男</td>
                                <td>46</td>
                                <td>2341637</td>
                                <td>-</td>
                                <td>郝红梅</td>
                                <td>颈椎间盘突出</td>
                                <td>12</td>
                                <td class="right">4599.9</td>
                                <td class="right">4102.3</td>
                                <td class="right">497.6</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>5694****03</td>
                                <td><a href="javascript:void(0);" class="nm-div-name">杨生刚</a></td>
                                <td>男</td>
                                <td>33</td>
                                <td>1544081</td>
                                <td>-</td>
                                <td>李芳</td>
                                <td>甲状腺继发恶性肿瘤</td>
                                <td>13</td>
                                <td class="right">9994.3</td>
                                <td class="right">9536.8</td>
                                <td class="right">457.5</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>3634****40</td>
                                <td><a href="javascript:void(0);" class="nm-div-name">姚玉基</a></td>
                                <td>男</td>
                                <td>25</td>
                                <td>2341808</td>
                                <td>-</td>
                                <td>李强</td>
                                <td>下肢静脉曲张</td>
                                <td>12</td>
                                <td class="right">9368</td>
                                <td class="right">9203.2</td>
                                <td class="right">3291.4</td>
                            </tr>
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
                        <table class="body-width common-table">
                            <tbody>
                            <tr>
                                <th>序号</th>
                                <th>日期</th>
                                <th>时间</th>
                                <th>项目编码</th>
                                <th>项目名称</th>
                                <th>违反规则</th>
                                <th>提示说明</th>
                                <th>开立原因</th>
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
                                <td>0001</td>
                                <td>2017-02-02</td>
                                <td>9:36</td>
                                <td>Y00000000947</td>
                                <td>糖脉康颗粒</td>
                                <td>1.超量取药</td>
                                <td>该药品在同一天内的开药量不得超过15天</td>
                                <td>-</td>
                                <td>内科</td>
                                <td>肖勇</td>
                                <td>5g/袋</td>
                                <td>21袋/盒</td>
                                <td class="right">38</td>
                                <td>口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td class="right">4</td>
                                <td class="right">152</td>
                                <td class="right">152</td>
                            </tr>
                            </tbody>
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
                        <table class="body-width common-table">
                            <tbody>
                            <tr>
                                <th>排序</th>
                                <th>医师</th>
                                <th>违规单据数</th>
                            </tr>
                            <tr>
                                <td>01</td>
                                <td>王刚</td>
                                <td><a href="javascript:void(0);" class="ks-nm">50</a></td>
                            </tr>
                            <tr>
                                <td>02</td>
                                <td>郝红梅</td>
                                <td><a href="javascript:void(0);" class="ks-nm">40</a></td>
                            </tr>
                            <tr>
                                <td>03</td>
                                <td>李芳</td>
                                <td><a href="javascript:void(0);" class="ks-nm">34</a></td>
                            </tr>
                            <tr>
                                <td>04</td>
                                <td>李强</td>
                                <td><a href="javascript:void(0);" class="ks-nm">28</a></td>
                            </tr>
                            <tr>
                                <td>05</td>
                                <td>王玉兰</td>
                                <td><a href="javascript:void(0);" class="ks-nm">21</a></td>
                            </tr>
                            <tr>
                                <td>06</td>
                                <td>高宝强</td>
                                <td><a href="javascript:void(0);" class="ks-nm">19</a></td>
                            </tr>
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
                        <table class="body-width common-table">
                            <tbody>
                            <tr>
                                <th>入院日期</th>
                                <th>住院号</th>
                                <th>姓名</th>
                                <th>性别</th>
                                <th>年龄</th>
                                <th>医保卡号</th>
                                <th>科室</th>
                                <th>医师</th>
                                <th>入院诊断</th>
                                <th>住院天数</th>
                                <th>住院医疗费用(元)</th>
                                <th>医保统筹支付(元)</th>
                                <th>患者负担(元)</th>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>6953****96</td>
                                <td><a href="javascript:void(0);" class="ks-nm-div-name">尹爱华</a></td>
                                <td>女</td>
                                <td>70</td>
                                <td>2341569</td>
                                <td>内分沁科</td>
                                <td>王刚</td>
                                <td>2型糖尿病</td>
                                <td>14</td>
                                <td class="right">13423</td>
                                <td class="right">9576</td>
                                <td class="right">1342</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>5961****56</td>
                                <td><a href="javascript:void(0);" class="ks-nm-div-name">姚晓红</a></td>
                                <td>男</td>
                                <td>32</td>
                                <td>1543786</td>
                                <td>-</td>
                                <td>王玉兰</td>
                                <td>急性阑尾炎</td>
                                <td>7</td>
                                <td class="right">8053.8</td>
                                <td class="right">6573</td>
                                <td class="right">730.3</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>7402****36</td>
                                <td><a href="javascript:void(0);" class="ks-nm-div-name">姜乃军</a></td>
                                <td>男</td>
                                <td>46</td>
                                <td>2341637</td>
                                <td>-</td>
                                <td>郝红梅</td>
                                <td>颈椎间盘突出</td>
                                <td>12</td>
                                <td class="right">4599.9</td>
                                <td class="right">4102.3</td>
                                <td class="right">497.6</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>5694****03</td>
                                <td><a href="javascript:void(0);" class="ks-nm-div-name">杨生刚</a></td>
                                <td>男</td>
                                <td>33</td>
                                <td>1544081</td>
                                <td>-</td>
                                <td>李芳</td>
                                <td>甲状腺继发恶性肿瘤</td>
                                <td>13</td>
                                <td class="right">9994.3</td>
                                <td class="right">9536.8</td>
                                <td class="right">457.5</td>
                            </tr>
                            <tr>
                                <td>2017/6/23</td>
                                <td>3634****40</td>
                                <td><a href="javascript:void(0);" class="ks-nm-div-name">姚玉基</a></td>
                                <td>男</td>
                                <td>25</td>
                                <td>2341808</td>
                                <td>-</td>
                                <td>李强</td>
                                <td>下肢静脉曲张</td>
                                <td>12</td>
                                <td class="right">9368</td>
                                <td class="right">9203.2</td>
                                <td class="right">3291.4</td>
                            </tr>
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
                        <table class="body-width common-table">
                            <tbody>
                            <tr>
                                <th>序号</th>
                                <th>日期</th>
                                <th>时间</th>
                                <th>项目编码</th>
                                <th>项目名称</th>
                                <th>违反规则</th>
                                <th>提示说明</th>
                                <th>开立原因</th>
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
                                <td>001</td>
                                <td>2017/2/2</td>
                                <td>09:36</td>
                                <td>Y00000000947</td>
                                <td>糖脉康颗粒</td>
                                <td>1.超量取药</td>
                                <td>该药品在同一天内的开药量不得超过15天</td>
                                <td>-</td>
                                <td>心血管内科</td>
                                <td>肖勇</td>
                                <td>5g/袋</td>
                                <td>21袋/盒</td>
                                <td>38</td>
                                <td> 口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td class="right">4</td>
                                <td class="right">152</td>
                                <td class="right">152</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>2017/2/2</td>
                                <td>09:38</td>
                                <td>Y00000001502</td>
                                <td>阿司匹林肠溶片</td>
                                <td>2.超量取药</td>
                                <td>该药品在同一天内的开药量不得超过16天</td>
                                <td>-</td>
                                <td>心血管内科</td>
                                <td>肖勇</td>
                                <td>25mg</td>
                                <td>30片/盒</td>
                                <td>18.17</td>
                                <td> 口服</td>
                                <td>-</td>
                                <td>-</td>
                                <td class="right">2</td>
                                <td class="right">36.34</td>
                                <td class="right">36.34</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>2017/2/2</td>
                                <td>10:38</td>
                                <td>Y00000010343</td>
                                <td>青霉素注射液</td>
                                <td>3.超量用药</td>
                                <td>该药品在同一天内的用药量不得超过2000w单位</td>
                                <td>-</td>
                                <td>心血管内科</td>
                                <td>许瑞才</td>
                                <td>80万u/支</td>
                                <td>支</td>
                                <td>15</td>
                                <td> 静脉注射</td>
                                <td>-</td>
                                <td>-</td>
                                <td class="right">4</td>
                                <td class="right">60</td>
                                <td class="right">30</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>2017/2/3</td>
                                <td>11:38</td>
                                <td>Y00000010344</td>
                                <td>利巴韦林气雾剂</td>
                                <td>4.超量用药</td>
                                <td>该药品在同一天内的用药量不得超过2001w单位</td>
                                <td>-</td>
                                <td>心血管内科</td>
                                <td>许瑞才</td>
                                <td>10.5g:75mg/瓶</td>
                                <td>瓶</td>
                                <td>21</td>
                                <td> 外用</td>
                                <td>-</td>
                                <td>-</td>
                                <td class="right">2</td>
                                <td class="right">42</td>
                                <td class="right">16</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
</div>
<!--费用明细比较-弹出层-->
<div class="BgDiv2"></div>
<div class="DialogDiv2" style="display: none;">
    <div class="pop-up bg-color1">
        <table class="body-width">
            <tr>
                <td class="text-right padding-right20">
                    <img src="${path }/static/img/close.png" id="closes1">
                </td>
            </tr>
        </table>
    </div>
    <div class="gauge-title-div margin-top10">
        <div class="yb-jj-div">
            <table class="body-width">
                <tr>
                    <td class="left">患者费用对比</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="ks-fy-zb margin-top0" style="margin-bottom: 0;padding-bottom: 0">
        <div class="body-width padding10 pad-top0">
            <div class="ys-rc-div">
                <table class="body-width common-table">
                    <tbody>
                    <tr class="th-bg">
                        <th>患者住院号</th>
                        <th>患者姓名</th>
                        <th>参保类型</th>
                        <th>疾病名称</th>
                        <th>手术操作名称</th>
                        <th>出院日期</th>
                        <th>住院天数</th>
                        <th>科室</th>
                        <th>主治医师</th>
                        <th>医疗总费用(元)</th>
                        <th>医保统筹支付金额(元)</th>
                        <th>患者自付金额(元)</th>
                        <th>患者自费金额(元)</th>
                    </tr>
                    <tr>
                        <td>160513</td>
                        <td>林静</td>
                        <td>城镇职工</td>
                        <td>创伤后单侧髋关节病</td>
                        <td>(单侧)髋关节人工置换术</td>
                        <td>2016-11-03</td>
                        <td class="right">12</td>
                        <td>骨外科</td>
                        <td>曾意荣</td>
                        <td class="right">91075.9</td>
                        <td class="right">29313.13</td>
                        <td class="right">8928.43</td>
                        <td class="right">52834.34</td>
                    </tr>
                    <tr>
                        <td>160527</td>
                        <td>黄艳静</td>
                        <td>城镇职工</td>
                        <td>创伤后单侧髋关节病</td>
                        <td>(单侧)髋关节人工置换术</td>
                        <td>2016-11-26</td>
                        <td class="right">10</td>
                        <td>骨外科</td>
                        <td>方斌</td>
                        <td class="right">97108.2</td>
                        <td class="right">37756.42</td>
                        <td class="right">41174.74</td>
                        <td class="right">55933.46</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
    <!--饼图-->
    <div class="yb-jj-div">
        <div class="yb-jj-div">
            <div class=" gauge-div float" style="width: 34%;margin-bottom: 0">
                <div class="gauge-title-div">
                    <table class="body-width margin-top10">
                        <tr>
                            <td class="left">病人姓名：林静</td>
                            <td class="text-center">
                                <button class="btn btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="num4">
                    <div id="bz_Gauge1">

                    </div>
                </div>
            </div>
            <div class="gauge-div float" style="margin-left: 1%;width: 34%;margin-bottom: 0">
                <div class="gauge-title-div">
                    <table class="body-width margin-top10">
                        <tr>
                            <td class="left">病人姓名：黄艳静</td>
                            <td class="text-center">
                                <button class="btn btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="num5">
                    <div id="bz_Gauge2">

                    </div>
                </div>
            </div>
            <div class="gauge-div float" style="width: 30%;margin-left: 1%;margin-bottom: 0">
                <table class="body-width common-table on-style">
                    <tbody>
                    <tr>
                        <th colspan="2">费用项目</th>
                        <th>林静</th>
                        <th>黄艳静</th>
                    </tr>
                    <tr>
                        <td>药品费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">11079.71</td>
                        <td class="right">14619.73</td>
                    </tr>
                    <tr>
                        <td>手术费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">7240</td>
                        <td class="right">8140</td>
                    </tr>
                    <tr>
                        <td>化验费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">3628.4</td>
                        <td class="right">4089.2</td>
                    </tr>
                    <tr>
                        <td>治疗费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">2103</td>
                        <td class="right">5064</td>
                    </tr>
                    <tr>
                        <td>检查费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">4285.8</td>
                        <td class="right">2509</td>
                    </tr>
                    <tr>
                        <td>床位费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">1200</td>
                        <td class="right">1000</td>
                    </tr>
                    <tr>
                        <td>护理费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">236</td>
                        <td class="right">204</td>
                    </tr>
                    <tr>
                        <td>诊疗费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">72</td>
                        <td class="right">60</td>
                    </tr>
                    <tr>
                        <td>材料费</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">61192.92</td>
                        <td class="right">61395.24</td>
                    </tr>
                    <tr>
                        <td>其他</td>
                        <td><a href="javascript:void(0);" class="detail">费用明细</a></td>
                        <td class="right">39.03</td>
                        <td class="right">27.01</td>
                    </tr>
                    <tr>
                        <td>总计</td>
                        <td></td>
                        <td class="right">91075.86</td>
                        <td class="right">97108.18</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    <!--费用明细-->
    <div class="gauge-title-div margin-top10">
        <div class="yb-jj-div">
            <table class="body-width">
                <tr>
                    <td class="left">费用明细</td>
                    <td class="right">
                        <button class="btn btn-primary"><img src="${path }/static/img/menu/btn1-icon.png">导出</button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="main-ys-fy detail-div yb-jj-div">
        <div class="ks-fy-zb" style="margin-top: 0">
            <div class="body-width pad-top0">
                <div class="ys-rc-div">
                    <table class="body-width common-table on-style">
                        <tbody>
                        <tr>
                            <th colspan="2" class="center-td">费用项目</th>
                            <th colspan="3" class="center-td">林静</th>
                            <th colspan="3" class="center-td">黄艳静</th>
                        </tr>
                        <tr>
                            <th>费用类别</th>
                            <th>项目名称</th>
                            <th>项目单价</th>
                            <th>数量</th>
                            <th>项目金额</th>
                            <th>项目单价</th>
                            <th>数量</th>
                            <th>项目金额</th>
                        </tr>
                        <tr>
                            <td>材料费</td>
                            <td>Ribbed微孔柄（林克·173-383/388/35）(进口)</td>
                            <td class="right">15650</td>
                            <td class="right">2</td>
                            <td class="right">31300</td>
                            <td class="right"></td>
                            <td class="right"></td>
                            <td class="right"></td>
                        </tr>
                        <tr>
                            <td>材料费</td>
                            <td>synergy股骨柄（施乐辉·8-18号）（进口）</td>
                            <td class="right"></td>
                            <td class="right"></td>
                            <td class="right"></td>
                            <td class="right">25360</td>
                            <td class="right">1</td>
                            <td class="right">25360</td>
                        </tr>
                        <tr>
                            <td>材料费</td>
                            <td>SPS髋臼（施乐辉·臼42-76）（进口）</td>
                            <td class="right"></td>
                            <td class="right"></td>
                            <td class="right"></td>
                            <td class="right">10017.56</td>
                            <td class="right">2</td>
                            <td class="right">20035.12</td>
                        </tr>
                        <tr>
                            <td>材料费</td>
                            <td>TOP髋臼外杯（林克·290-298/40~331/62）（进口）</td>
                            <td class="right">8039</td>
                            <td class="right">2</td>
                            <td class="right">16078</td>
                            <td class="right"></td>
                            <td class="right"></td>
                            <td class="right"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
<script>
    $(function () {
        //违规汇总
        var ks_ys_data=['王刚','郝红梅','李芳','李强','王玉兰','高宝强'];
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

        /* 违规单据数-弹出框*/
        $(".wg-bills").click(function () {
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".BgDiv3").css("z-index", "100");
            $(".BgDiv3").css({display: "block", height: $(document).height()});
            $(".DialogDiv3").css("top", "15%");
            $(".DialogDiv3").css("display", "block");
            document.documentElement.scrollTop = 0;
            bar2();
            $(".tab-tables ul li").eq(0).trigger('click');
        });
        $(".BgDiv3,#closes").click(function () {
            $(".BgDiv3").css("display", "none");
            $(".DialogDiv3").css("display", "none");
            $(".nm-div").css("display","none");
            $(".nm-div-name-div").css("display","none");
            $(".ks-nm-div").css("display","none");
            $(".ks-nm-div-name-div").css("display","none");
        });
        /*弹出层选项卡*/
        $(".tab-tables ul li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-table-boxs > div").eq(index).css("display", "block").siblings().css("display", "none");

            if (index == 0) {
                bar2();
                $("#bar4").remove();
                var bar4_html = "<div class='fy-bar-div' id='bar4'></div>";
                $("#num8").append(bar4_html);
                $(".ks-nm-div").css("display","none");
                $(".ks-nm-div-name-div").css("display","none");
            }
            else if (index == 1){
                bar3();
                $("#bar3").remove();
                var bar3_html = "<div class='fy-bar-div' id='bar3'></div>";
                $("#num7").append(bar3_html);
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
        /*弹出层-违规规则排序-柱状图*/
        function bar2(){
            // 柱状图2
            var myChartBar = echarts.init(document.getElementById('bar3'));
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
                    itemWidth:11,
                    itemHeight:11,
                    data: [ '违规单据数'],
                    selectedMode:'single'
                },
                grid: {
                    top: 54,
                    left: '3%',
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
                        data: ['超适应症用药', '限性别', '限儿童', '限就医方式', '重复收费', '重复取药']
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
                        barWidth: 12,
                        barGap: 0.1,
                        data: [40, 23, 18, 17, 15, 13]
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChartBar.setOption(option_bar3);

            window.addEventListener("resize", function () {
                myChartBar.resize();
            });
        };
        /*弹出层-科室违规情况-柱状图*/
        function bar3(){
            // 柱状图2
            var myChartBar = echarts.init(document.getElementById('bar4'));
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
                    bottom: '6%',
                    containLabel: true
                },
                xAxis: [
                    {
                        type: 'category',
                        axisPointer: {
                            type: 'shadow'
                        },
                        data: ['王刚', '郝红梅', '李芳', '李强', '王玉兰', '高宝强']
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
                        barWidth: 12,
                        barGap: 0.1,
                        data: [50, 40, 34, 28, 21, 19]
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChartBar.setOption(option_bar4);

            window.addEventListener("resize", function () {
                myChartBar.resize();
            });
        };

        var x_data1;
        var bar_data;
        $(document).ready(function(){
            x_data1 = ['恶性肿瘤','尿毒症','慢性病毒性肝炎','冠心病','糖尿病','高血压'];
            bar_data = [22, 14, 10, 7, 6,5 ];
            line();
            bar();
            radar();
        });

        //选项卡
        $(".tab-menu-l ul li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".tab-div-boxs > div").eq(index).css("display", "block").siblings().css("display", "none");
            if(index == 8){
                bar4();
            }
            else if(index == 2){
                $(".tab2s li").eq(0).trigger('click');
            }
            else{
                bar();
                line();
                radar();
            }

        });

        //下来框选项
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
        //柱状图1
        function bar(){
            var myChart = echarts.init(document.getElementById('line1'));
            var data1 = [120, 100, 70, 88, 54, 86, 135, 100, 32, 20, 64, 33];
            var data2 = [36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73];
            var data3 = [36000, 29000, 21470, 19880, 25540, 21860, 19350, 20100, 26320, 19920, 27640, 17630];
            var data4 = [26000, 27000, 19770, 19880, 17540, 14580, 21010, 22100, 21320, 19820, 22360, 19830];
            var data5 = [1000, 1100, 970, 1088, 754, 686, 1135, 900, 632, 720, 464, 533];
            var data6 = [36, 26, 40, 58, 34, 76, 35, 60, 27, 61, 43, 73];
            var data7 = [720, 600, 570, 185, 354, 486, 635, 800, 532, 620, 464, 633];
            var data8 = [520, 460, 870, 584, 454, 565, 835, 1000, 732, 920, 564, 433];
            var data9 = [1040, 2100, 1070, 1288, 954, 886, 1235, 1500, 1732, 1320, 964, 1233];
            var data10 = [650, 650, 540, 781, 452, 548, 659, 808, 652, 290, 764, 543];
            var data11 = [1200, 1100, 1700, 988, 1054, 1186, 1035, 1000, 1320, 1200, 964, 833];
            var data12 = [840, 450, 660, 874, 487, 542, 763, 890, 453, 360, 544, 693];
            var data13 = [490, 850, 890, 878, 945, 454, 627, 880, 521, 160, 744, 563];
            // 指定图表的配置项和数据
            option_bar1 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                legend: {
                    top: 10,
                    right: "10%",
                    width:'70%',
                    itemWidth:10,
                    itemHeight:10,
                    data:[
                        {
                            name: '出院人次',
                            icon: 'roundRect'
                        },{
                            name: '平均住院日',
                            icon: 'roundRect'
                        },{
                            name: '医疗总费用',
                            icon: 'roundRect'
                        },{
                            name: '医保统筹支付',
                            icon: 'roundRect'
                        },{
                            name: '超定额总费用',
                            icon: 'roundRect'
                        },{
                            name: '违规单据数',
                            icon: 'roundRect'
                        },
                        {
                            name: '',
                            icon: ''
                        },
                        {
                            name: '人均药费',
                            icon: 'roundRect'
                        },{
                            name: '人均检查检验费',
                            icon: 'roundRect'
                        },{
                            name: '人均手术麻醉费',
                            icon: 'roundRect'
                        },{
                            name: '人均医用耗材费',
                            icon: 'roundRect'
                        },{
                            name: '人均高值耗材费',
                            icon: 'roundRect'
                        },{
                            name: '人均治疗费',
                            icon: 'roundRect'
                        },{
                            name: '人均血费',
                            icon: 'roundRect'
                        },
                    ]
                },
                grid: {
                    top: 100,
                    left: '2%',
                    right: '4%',
                    bottom: '2%',
                    containLabel: true
                },
                toolbox: {
                    show: true,
                    left: "16%",
                    top: 10,
                    feature: {
                        magicType: {type: ['line', 'bar']}
                    }
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
                        axisLine: {show: true,lineStyle:{color:'#666666'}},
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color:'#dedede'}
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
                        axisLine: {
                            show:false,
                            lineStyle:{color:'#666666'}
                        },
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
                series: [
                    {
                        name: '出院人次',
                        type: 'line',
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#80BFEE'
                            }
                        },
                        barWidth: 20,
                        data: data1
                    },
                    {
                        name: '平均住院日',
                        type: 'line',
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#33CC00'
                            }
                        },
                        barWidth: 20,
                        data: data2
                    },
                    {
                        name: '医疗总费用',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#CC6699'
                            }
                        },
                        barWidth: 20,
                        data: data3
                    },
                    {
                        name: '医保统筹支付',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#669999'
                            }
                        },
                        barWidth: 20,
                        data: data4
                    },
                    {
                        name: '超定额总费用',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#666666'
                            }
                        },
                        barWidth: 20,
                        barGap: 0.1,
                        data:data5
                    },
                    {
                        name: '违规单据数',
                        type: 'line',
                        yAxisIndex: 1,
                        itemStyle: {
                            normal: {
                                color: '#996633'
                            }
                        },
                        barWidth: 20,
                        data:data6
                    },
                    {
                        name: '人均药费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#009933'
                            }
                        },
                        barWidth: 20,
                        data:data7
                    },
                    {
                        name: '人均检查检验费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#CC6633'
                            }
                        },
                        barWidth: 20,
                        data:data8
                    },
                    {
                        name: '人均手术麻醉费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#3300CC'
                            }
                        },
                        barWidth: 20,
                        data:data9
                    },
                    {
                        name: '人均医用耗材费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#396BCE'
                            }
                        },
                        barWidth: 20,
                        data:data10
                    },
                    {
                        name: '人均高值耗材费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#669999'
                            }
                        },
                        barWidth: 20,
                        data:data11
                    },
                    {
                        name: '人均治疗费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#CF7142'
                            }
                        },
                        barWidth: 20,
                        data:data12
                    },
                    {
                        name: '人均血费',
                        type: 'line',
                        itemStyle: {
                            normal: {
                                color: '#669999'
                            }
                        },
                        barWidth: 20,
                        data:data13
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option_bar1);

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
        };
        /*柱状图2*/
        function line(){
            var Chart_bar2 = echarts.init(document.getElementById('zy_Gauge1'));
            // 指定图表的配置项和数据
            option_bar2 = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                grid: {
                    top: 40,
                    left: '4%',
                    right: '4%',
                    bottom: '16%',
                    containLabel: true,
                    y2: 140
                },
                xAxis: [
                    {
                        type: 'category',
                        nameRotate: 50,
                        axisPointer: {
                            type: 'shadow'
                        },
                        data: x_data1,
                        axisLabel: {
                            interval: 0,//横轴信息全部显示
                            rotate: 30,//-30度角倾斜显示
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
                        name: '人次',
                        boundaryGap: [0, 0.01],
                        axisLine: {show: false,lineStyle:{color:'#666666'}},
                        axisTick: {show: false },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color:'#dedede'
                            }
                        },
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
                        name: '人次',
                        type: 'bar',
                        itemStyle: {
                            normal: {
                                color: '#41afd6',
                                barBorderRadius: [80]
                            }
                        },
                        barWidth: 12,
                        data: bar_data
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_bar2.setOption(option_bar2);

            window.addEventListener("resize", function () {
                Chart_bar2.resize();
            });
        };
        /*雷达图*/
        function radar(){
            var Chart_radar = echarts.init(document.getElementById('zy_Gauge2'));
            option_radar = {
                title: {
                    text: '金额(元)',
                    right:'15%',
                    top:20,
                    textStyle: {
                        color:'#666666',
                        fontSize: 14,
                        fontWeight: 500
                    }
                },
                legend: {
                    top:'5%',
                    left:'10%',
                    itemWidth:11,
                    itemHeight:11,
                    data: ['实际值','限定值']
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },
                radar: {
                    shape: 'circle',
                    name: {
                        textStyle: {
                            color: '#666666'
                        }
                    },
                    splitArea: {
                        areaStyle: {
                            color: ['#ffffff']
                        }
                    },
                    indicator: [
                        { name: '恶性肿瘤', max: 4000},
                        { name: '尿毒症', max: 2000},
                        { name: '慢性病毒性肝炎', max: 1000},
                        { name: '冠心病', max: 1000},
                        { name: '糖尿病', max: 1000},
                        { name: '高血压', max: 1000}
                    ]
                },
                series: [{
                    name: '重点病种限额情况',
                    type: 'radar',
                    tooltip: {trigger: 'item'},

                    data: [
                        {
                            name: '限定值',
                            itemStyle:{
                                normal:{
                                    color:'#F6B197'
                                }
                            },
                            value : [2200, 1632, 732, 650, 525, 862]
                        },
                        {
                            name:'实际值',

                            itemStyle:{
                                normal:{
                                    color:'#92D050'
                                }
                            },
                            value : [3200, 1032, 653, 532, 576, 650]
                        }
                    ]

                }]
            };
            // 使用刚指定的配置项和数据显示图表。
            Chart_radar.setOption(option_radar);

            window.addEventListener("resize", function () {
                Chart_radar.resize();
            });
        };
        /*违规汇总-违规规则排序-柱状图*/
        function bar4(){
            // 柱状图2
            var myChartBar = echarts.init(document.getElementById('bar5'));
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
                    bottom: '6%',
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
                        name: '单据数',
                        boundaryGap: [0, 0.01],

                        axisLine: {show: false},
                        axisTick: {show: false },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color:'#dedede'
                            }
                        },
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
            myChartBar.setOption(option_bar4);

            window.addEventListener("resize", function () {
                myChartBar.resize();
            });
        };
        /*违规汇总-科室违规情况-柱状图*/
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
                        name: '单据数',
                        boundaryGap: [0, 0.01],

                        axisLine: {show: false},
                        axisTick: {show: false },
                        splitLine: {
                            show: true,
                            lineStyle: {
                                color:'#dedede'
                            }
                        },
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


        /*费用优化-弹出框*/
        $(".fy-bills").click(function () {
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".BgDiv2").css("z-index", "100");
            $(".BgDiv2").css({display: "block", height: $(document).height()});
            $(".DialogDiv2").css("top", "5%");
            $(".DialogDiv2").css("display", "block");
            document.documentElement.scrollTop = 0;
            pie1();
            pie2();
        });
        $(".BgDiv2,#closes1").click(function () {
            $(".BgDiv2").css("display", "none");
            $(".DialogDiv2").css("display", "none");
        });

        /*饼图*/
        function pie1(){
            // 耗材-饼图1
            var myChart = echarts.init(document.getElementById('bz_Gauge1'));
            // 指定图表的配置项和数据
            optionPie1 = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c}(元) ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    bottom: '4%',
                    right: '8%',
                    itemWidth: 10,
                    itemHeight: 10,
                    data: ['药品费', '手术费', '化验费', '治疗费', '检查费', '床位费', '护理费', '诊疗费', '材料费', '其他']
                },
                series: [
                    {
                        name: '费用项目',
                        type: 'pie',
                        center: ['35%', '55%'],
                        radius: ['40%', '70%'],
                        selectedMode: 'single',
                        labelLine: {
                            normal: {
                                show:false
                            }
                        },
                        data: [
                            {value: 1079.71, name: '药品费', itemStyle: {normal: {color: '#72B9E3'}}},
                            {value: 4240, name: '手术费', itemStyle: {normal: {color: '#8BCAAF'}}},
                            {value: 362, name: '化验费', itemStyle: {normal: {color: '#8CC173'}}},
                            {value: 2103, name: '治疗费', itemStyle: {normal: {color: '#A8CD64'}}},
                            {value: 1285.8, name: '检查费', itemStyle: {normal: {color: '#ECE362'}}},
                            {value: 1200, name: '床位费', itemStyle: {normal: {color: '#EFB14E'}}},
                            {value: 236, name: '护理费', itemStyle: {normal: {color: '#E45A3D'}}},
                            {value: 272, name: '诊疗费', itemStyle: {normal: {color: '#DF5D8D'}}},
                            {value: 1192.92, name: '材料费', itemStyle: {normal: {color: '#A486BC'}}},
                            {value: 139.03, name: '其他', itemStyle: {normal: {color: '#8496C4'}}}
                        ],
                        label: {
                            normal: {
                                show: false,
                                position: 'inside'
                            },
                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '18',
                                    fontWeight: 'bold'
                                }
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(optionPie1);

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
        };
        function pie2(){
            // 耗材-饼图2
            var myChart = echarts.init(document.getElementById('bz_Gauge2'));
            // 指定图表的配置项和数据
            optionPie2 = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{a} <br/>{b}: {c}(元) ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    bottom: '4%',
                    right: '8%',
                    itemWidth: 10,
                    itemHeight: 10,
                    data: ['药品费', '手术费', '化验费', '治疗费', '检查费', '床位费', '护理费', '诊疗费', '材料费', '其他']
                },
                series: [
                    {
                        name: '费用项目',
                        type: 'pie',
                        center: ['35%', '55%'],
                        radius: ['40%', '70%'],
                        selectedMode: 'single',
                        labelLine: {
                            normal: {
                                length: 10,
                                length2: 10
                            }
                        },
                        data: [
                            {value: 1619.73, name: '药品费', itemStyle: {normal: {color: '#72B9E3'}}},
                            {value: 5140, name: '手术费', itemStyle: {normal: {color: '#8BCAAF'}}},
                            {value: 3089.2, name: '化验费', itemStyle: {normal: {color: '#8CC173'}}},
                            {value: 4064, name: '治疗费', itemStyle: {normal: {color: '#A8CD64'}}},
                            {value: 2109, name: '检查费', itemStyle: {normal: {color: '#ECE362'}}},
                            {value: 900, name: '床位费', itemStyle: {normal: {color: '#EFB14E'}}},
                            {value: 184, name: '护理费', itemStyle: {normal: {color: '#E45A3D'}}},
                            {value: 60, name: '诊疗费', itemStyle: {normal: {color: '#DF5D8D'}}},
                            {value: 1695.24, name: '材料费', itemStyle: {normal: {color: '#A486BC'}}},
                            {value: 127.01, name: '其他', itemStyle: {normal: {color: '#8496C4'}}}
                        ],
                        label: {
                            normal: {
                                show: false,
                                position: 'inside'
                            },
                            emphasis: {
                                show: true,
                                textStyle: {
                                    fontSize: '18',
                                    fontWeight: 'bold'
                                }
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(optionPie2);

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
        };

        $("a,button").focus(function () {
            this.blur()
        });

    });
</script>
<script src="${path}/static/js/dis.js"></script>
</body>
</html>