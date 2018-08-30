<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
<meta charset="UTF-8">
<title>自定义报表</title>
<script src="${staticPath }/static/js/common.js"></script>
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

        .float-right {
            float: right
        }
		.Report_t .LeftOpt .topText{ background-color:#268eb1}
    </style>
</head>

<body>
<div class="header-div bg-color margin-top10">
    <table class="ys-table tiaojian margin-left20" style="width: 95%">
        <tbody>
        <tr>
        	<td class="td-width fs_16" >日期</td>
            <td>
                <table>
                    <tr>
                        <td style="padding-top: 0">
                            <div class="input-group date form_date" style="float: right">
                                <input class="padding-left4" size="10" type="text" placeholder="2017-08-13">
                                <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                                &nbsp;至&nbsp;
                            </div>
                        </td>
                        <td style="padding-top: 0;padding-left: 0">
                            <div class="input-group date form_date" style="float: right">
                                <input class="padding-left4" size="10" type="text" placeholder="2017-08-13">
                                <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                            </div>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="td-width fs_16">
                科室
            </td>
            <td>
                <select style="width: 86px;" id="switch-select">
                    <option value="0">全院</option>
                    <option value="1">内科</option>
                    <option value="2">外科</option>
                </select>
            </td>
            <td class="td-width fs_16">
                医疗组
            </td>
            <td>
                <select style="width:115px;">
                    <option value="0">血液内科1组</option>
                    <option value="1">血液内科2组</option>
                </select>
            </td>
            <td class="td-width"></td>
            <td>
                <button class="btn btn-primary"><img src="${staticPath }/static/img/menu/search.png"> 查询</button>
            </td>
            <td style="width: auto"></td>
        </tr>
        </tbody>
    </table>
</div>
<div class="Report_t margin-bottom20">
    <!--左侧选择-->
    <div class="LeftOpt">
        <div class="ServeText">
            <div class="topText">服务能力</div>
            <ul>
                <li><input type="checkbox" checked="checked"/>门诊人次</li>
                <li><input type="checkbox" checked="checked"/>住院人次</li>
                <li><input type="checkbox"/>手术人次</li>
            </ul>
        </div>
        <div class="ServeText">
            <div class="topText">服务效率</div>
            <ul>
                <li><input type="checkbox" checked="checked"/>平均住院日</li>
                <li><input type="checkbox"/>床位周转率</li>
            </ul>
        </div>
        <div class="ServeText">
            <div class="topText">总费用</div>
            <ul>
                <li><input type="checkbox" checked="checked"/>医疗总费用</li>
                <li><input type="checkbox" checked="checked"/>医保统筹费用</li>
                <li><input type="checkbox"/>患者自付</li>
                <li><input type="checkbox"/>自费金额</li>
            </ul>
        </div>
        <div class="ServeText">
            <div class="topText">人均费用指标</div>
            <ul>
                <li><input type="checkbox"/>人均医疗费用</li>
                <li><input type="checkbox"/>人均医保统筹</li>
                <li><input type="checkbox"/>人均药费</li>
                <li><input type="checkbox"/>人均检查检验费</li>
                <li><input type="checkbox"/>人均诊疗费</li>
            </ul>
        </div>
        <div class="ServeText">
            <div class="topText">单病种指标</div>
            <ul>
                <li><input type="checkbox"/>单病种名称</li>
                <li><input type="checkbox"/>单病种医疗总费用</li>
                <li><input type="checkbox"/>单病种超限患者人次</li>
            </ul>
        </div>
        <div class="ServeText">
            <div class="topText">门特病指标</div>
            <ul>
                <li><input type="checkbox"/>门特病名称</li>
                <li><input type="checkbox"/>门特病人次</li>
                <li><input type="checkbox"/>门特病医疗总费用</li>
                <li><input type="checkbox"/>门特病统筹支付</li>
                <li><input type="checkbox"/>门特病个人负担</li>
                <li><input type="checkbox"/>门特病次均费用</li>
                <li><input type="checkbox"/>门特病次均药费</li>
            </ul>
        </div>
        <div class="ServeText">
            <div class="topText">违规指标</div>
            <ul>
                <li><input type="checkbox"/>违规规则</li>
                <li><input type="checkbox"/>违规单据数量</li>
                <li><input type="checkbox"/>违规金额</li>
            </ul>
        </div>
    </div>
    <!-- 展示列表 -->
    <div class="RightLay">
        <div class="tab-div-box bg-color">
            <div class="main-ys-fy">
                <div>
                    <div class="ks-fy-zb1" style="height:auto;margin-top:0">
                        <div class="gauge-title-div border-bom">
                            <span class="statData">统计日期：2016-06-03至2016-07-03</span>
                            <table id="btn-table" class="margin-top10 float-right">
                                <tr>
                                    <td>
                                        <button class="btn btn-sm btn-primary margin-right10"><img
                                                src="${staticPath }/static/img/menu/btn1-icon.png">导出
                                        </button>
                                    </td>
                                </tr>
                            </table>
                            <div class="clear"></div>
                        </div>

                        <div class="body-width padding10">
                            <div class="ys-rc-div">
                                <table class="zy-table body-width common-table">
                                    <tbody>
                                    <tr class="th-bg">
                                        <th class="left">科室</th>
                                        <th class="left">医疗组</th>
                                        <th class="right">门诊人次</th>
                                        <th class="right">住院人次</th>
                                        <th class="right">平均住院日</th>
                                        <th class="right">医疗总费用(元)</th>
                                        <th class="right">医保统筹费用(元)</th>
                                    </tr>
                                    <tr>
                                        <td class="left">眼科</td>
                                        <td class="left">眼科1组</td>
                                        <td class="right">567</td>
                                        <td class="right">260</td>
                                        <td class="right">300</td>
                                        <td class="right">1500</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">血液内科</td>
                                        <td class="left">血液内科1组</td>
                                        <td class="right">463</td>
                                        <td class="right">300</td>
                                        <td class="right">160</td>
                                        <td class="right">2400</td>
                                        <td class="right">3958</td>
                                    </tr>
                                    <tr>
                                        <td class="left">骨科</td>
                                        <td class="left">骨科3组</td>
                                        <td class="right">762</td>
                                        <td class="right">342</td>
                                        <td class="right">650</td>
                                        <td class="right">4200</td>
                                        <td class="right">6523</td>
                                    </tr>
                                    <tr>
                                        <td class="left">内科</td>
                                        <td class="left">内科6组</td>
                                        <td class="right">268</td>
                                        <td class="right">360</td>
                                        <td class="right">435</td>
                                        <td class="right">6982</td>
                                        <td class="right">5693</td>
                                    </tr>
                                    <tr>
                                        <td class="left">呼吸内科</td>
                                        <td class="left">呼吸内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">310</td>
                                        <td class="right">456</td>
                                        <td class="right">2690</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">心血管内科</td>
                                        <td class="left">心血管内科2组</td>
                                        <td class="right">320</td>
                                        <td class="right">410</td>
                                        <td class="right">423</td>
                                        <td class="right">2890.36</td>
                                        <td class="right">4256.33</td>
                                    </tr>
                                    <tr>
                                        <td class="left">消化内科</td>
                                        <td class="left">消化内科1组</td>
                                        <td class="right">567</td>
                                        <td class="right">260</td>
                                        <td class="right">300</td>
                                        <td class="right">1500</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">血液内科</td>
                                        <td class="left">血液内科1组</td>
                                        <td class="right">463</td>
                                        <td class="right">300</td>
                                        <td class="right">160</td>
                                        <td class="right">2400</td>
                                        <td class="right">3958</td>
                                    </tr>
                                    <tr>
                                        <td class="left">风湿免疫科</td>
                                        <td class="left">风湿免疫科3组</td>
                                        <td class="right">256</td>
                                        <td class="right">325</td>
                                        <td class="right">125</td>
                                        <td class="right">2658.36</td>
                                        <td class="right">4563.25</td>
                                    </tr>
                                    <tr>
                                        <td class="left">肾内科</td>
                                        <td class="left">肾内科6组</td>
                                        <td class="right">478</td>
                                        <td class="right">235</td>
                                        <td class="right">123</td>
                                        <td class="right">4563.01</td>
                                        <td class="right">5896.03</td>
                                    </tr>
                                    <tr>
                                        <td class="left">呼吸内科</td>
                                        <td class="left">呼吸内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">356</td>
                                        <td class="right">425</td>
                                        <td class="right">7895.01</td>
                                        <td class="right">8964.23</td>
                                    </tr>
                                    <tr>
                                        <td class="left">心血管内科</td>
                                        <td class="left">心血管内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">310</td>
                                        <td class="right">456</td>
                                        <td class="right">2690</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">眼科</td>
                                        <td class="left">眼科1组</td>
                                        <td class="right">567</td>
                                        <td class="right">260</td>
                                        <td class="right">300</td>
                                        <td class="right">1500</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">血液内科</td>
                                        <td class="left">血液内科1组</td>
                                        <td class="right">463</td>
                                        <td class="right">300</td>
                                        <td class="right">160</td>
                                        <td class="right">2400</td>
                                        <td class="right">3958</td>
                                    </tr>
                                    <tr>
                                        <td class="left">骨科</td>
                                        <td class="left">骨科3组</td>
                                        <td class="right">762</td>
                                        <td class="right">342</td>
                                        <td class="right">650</td>
                                        <td class="right">4200</td>
                                        <td class="right">6523</td>
                                    </tr>
                                    <tr>
                                        <td class="left">内科</td>
                                        <td class="left">内科6组</td>
                                        <td class="right">268</td>
                                        <td class="right">360</td>
                                        <td class="right">435</td>
                                        <td class="right">6982</td>
                                        <td class="right">5693</td>
                                    </tr>
                                    <tr>
                                        <td class="left">呼吸内科</td>
                                        <td class="left">呼吸内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">310</td>
                                        <td class="right">456</td>
                                        <td class="right">2690</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">心血管内科</td>
                                        <td class="left">心血管内科2组</td>
                                        <td class="right">320</td>
                                        <td class="right">410</td>
                                        <td class="right">423</td>
                                        <td class="right">2890.36</td>
                                        <td class="right">4256.33</td>
                                    </tr>
                                    <tr>
                                        <td class="left">消化内科</td>
                                        <td class="left">消化内科1组</td>
                                        <td class="right">567</td>
                                        <td class="right">260</td>
                                        <td class="right">300</td>
                                        <td class="right">1500</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">血液内科</td>
                                        <td class="left">血液内科1组</td>
                                        <td class="right">463</td>
                                        <td class="right">300</td>
                                        <td class="right">160</td>
                                        <td class="right">2400</td>
                                        <td class="right">3958</td>
                                    </tr>
                                    <tr>
                                        <td class="left">风湿免疫科</td>
                                        <td class="left">风湿免疫科3组</td>
                                        <td class="right">256</td>
                                        <td class="right">325</td>
                                        <td class="right">125</td>
                                        <td class="right">2658.36</td>
                                        <td class="right">4563.25</td>
                                    </tr>
                                    <tr>
                                        <td class="left">肾内科</td>
                                        <td class="left">肾内科6组</td>
                                        <td class="right">478</td>
                                        <td class="right">235</td>
                                        <td class="right">123</td>
                                        <td class="right">4563.01</td>
                                        <td class="right">5896.03</td>
                                    </tr>
                                    <tr>
                                        <td class="left">呼吸内科</td>
                                        <td class="left">呼吸内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">356</td>
                                        <td class="right">425</td>
                                        <td class="right">7895.01</td>
                                        <td class="right">8964.23</td>
                                    </tr>
                                    <tr>
                                        <td class="left">心血管内科</td>
                                        <td class="left">心血管内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">310</td>
                                        <td class="right">456</td>
                                        <td class="right">2690</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">呼吸内科</td>
                                        <td class="left">呼吸内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">310</td>
                                        <td class="right">456</td>
                                        <td class="right">2690</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">心血管内科</td>
                                        <td class="left">心血管内科2组</td>
                                        <td class="right">320</td>
                                        <td class="right">410</td>
                                        <td class="right">423</td>
                                        <td class="right">2890.36</td>
                                        <td class="right">4256.33</td>
                                    </tr>
                                    <tr>
                                        <td class="left">消化内科</td>
                                        <td class="left">消化内科1组</td>
                                        <td class="right">567</td>
                                        <td class="right">260</td>
                                        <td class="right">300</td>
                                        <td class="right">1500</td>
                                        <td class="right">3600</td>
                                    </tr>
                                    <tr>
                                        <td class="left">血液内科</td>
                                        <td class="left">血液内科1组</td>
                                        <td class="right">463</td>
                                        <td class="right">300</td>
                                        <td class="right">160</td>
                                        <td class="right">2400</td>
                                        <td class="right">3958</td>
                                    </tr>
                                    <tr>
                                        <td class="left">风湿免疫科</td>
                                        <td class="left">风湿免疫科3组</td>
                                        <td class="right">256</td>
                                        <td class="right">325</td>
                                        <td class="right">125</td>
                                        <td class="right">2658.36</td>
                                        <td class="right">4563.25</td>
                                    </tr>
                                    <tr>
                                        <td class="left">呼吸内科</td>
                                        <td class="left">呼吸内科2组</td>
                                        <td class="right">100</td>
                                        <td class="right">356</td>
                                        <td class="right">425</td>
                                        <td class="right">7895.01</td>
                                        <td class="right">8964.23</td>
                                    </tr>


                                    <tr>
                                        <td class="left">血液内科</td>
                                        <td class="left">血液内科1组</td>
                                        <td class="right">463</td>
                                        <td class="right">300</td>
                                        <td class="right">160</td>
                                        <td class="right">2400</td>
                                        <td class="right">3958</td>
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
    <div class="clear"></div>
</div>

</body>
<script>
/* 日期插件*/
$('.form_date').datetimepicker({
	format: 'yyyy-mm-dd',
	minView: 'month',
	language: 'zh-CN',
	autoclose: true,
	todayBtn: true//显示今日按钮
});
</script>
</html>