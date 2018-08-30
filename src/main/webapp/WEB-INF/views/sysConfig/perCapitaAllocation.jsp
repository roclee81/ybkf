<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>基金预算分配</title>
    <script src="${path }/static/js/common.js"></script>
    <style>
        .sf-msg-table th {
            border-top: none !important;
        }

        .ys-table .td-width {
            width: 78px;
            margin-left:6px;
        }
		.ys-table td{
			padding-top: 10px;
		}
        .rules-table .td-width {
            width: 76px;
        }
    </style>
</head>
<body>
<div class="border-bom padding10 padding-top20 bg-color">
    <table class="body-width rules-table" style="width:55%">
        <tr>
            <!-- <td></td> -->
            <td class="td-width fs_16">
                年度
            </td>
            <td>
                <select>
                    <option>2017</option>
                    <option>2016</option>
                </select>
            </td>
            <td class="td-width fs_16" style="width: 44px">
                科室
            </td>
            <td>
                <select>
                    <option value="0">全院</option>
                    <option value="1">科室</option>
                </select>
            </td>
            <td class="td-width fs_16">
                参保类型
            </td>
            <td>
                <select style="width: 86px;">
                    <option value="1">城乡居民</option>
                    <option value="2">城镇职工</option>
                </select>
            </td>
            <td>
            	 <div class="btns">
            		<button class="btn btn-primary"><img src="${path }/static/img/menu/search.png" style="padding-bottom:1px"> <span style="margin-left:-4px">查询</span></button>
            		<button class="btn btn-default"><img src="${path }/static/img/menu/reset.png"><span>重置</span></button>
        		</div>
            </td>
        </tr>
    </table>
</div>
<div class="body-width  xy-div-bg">
    <div class="body-width padding-top10">       
        <table class="ys-table">
            <tbody>
            <tr>
                <td class="fs_16 padding-left10">
                    医疗总费用
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="563">
                </td>
                <td class="fs_16">
                    住院天数
                </td>
                <td>
                    <input type="text" class="td-width" >
                </td>
                <td class="fs_16">
                    人均定额
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="479">
                </td>
                <td class="fs_16">
                    控费时间方式
                </td>
                <td >
                    <select class="td-width">
                        <option>月度</option>
                        <option>季度</option>
                    </select>
                </td>
                <td class="fs_16">
                    自费限额
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="12">
                </td>
            </tr>
            <tr>
                <td class=" fs_16">
                    药费限额
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="9.5">
                </td>
                <td class="fs_16">
                    检查检验费限额
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="23">
                </td>
                <td class="fs_16">
                    诊疗费限额
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="12">
                </td>
                <td class="fs_16">
                    耗材费限额
                </td>
                <td>
                    <input type="text" class="td-width" placeholder="14">
                </td>
                
                <td style="width: auto"></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="clear"></div>
</div>

<div class="bg-color main-div">
    <div class="tab-div-box">
        <!--人均费用计划-->
        <div class="main-rj-fy">
            <div class="yb-jj-div padding-top20">
                <div>
                    <div class="body-width">
                        <div class="ks-ys-div float">
                            <table class="body-width ks-ys-title">
                                <tr>
                                    <td class="left table-title padding-left20">科室基金分配计划</td>
                                    <td class="right fs_14">当前科室基金剩余：</td>
                                    <td class="j-fp-font fs_16">3123000<span class="fs_16">元</span></td>
                                    <td class="right fs_16">
                                        <button class="btn btn-sm btn-primary"><img src="${path }/static/img/menu/btn1-icon.png"><span>导出</span></button>
                                    </td>
                                </tr>
                            </table>
                            <div class="body-width padding10 padding-top0 over-x margin-bottom20">
                                <table class="body-width common-table border1 on-style">
                                    <tbody>
                                    <tr>
                                        <th class="padding-top">
                                            <input class="chk-qx checkbox-qx "
                                                   type="checkbox" style="margin-top: 0px">
                                        </th>
                                        <th>科室编码</th>
                                        <th>科室</th>
                                        <th>基金限额</th>
                                        <th>医疗总费用</th>
                                        <th>住院天数</th>
                                        <th>自费占比</th>
                                        <th>药占比</th>
                                        <th>检查检验占比</th>
                                        <th>诊疗占比</th>
                                        <th>耗材占比</th>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>101</td>
                                        <td>泌尿外科</td>
                                        <td class="right">479</td>
                                        <td class="right">563</td>
                                        <td class="right">-</td>
                                        <td class="right">14.92%</td>
                                        <td class="right">15.62%</td>
                                        <td class="right">1.86%</td>
                                        <td class="right">0.46%</td>
                                        <td class="right">2.36%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>102</td>
                                        <td>乳腺病科病区</td>
                                        <td class="right">262</td>
                                        <td class="right">335</td>
                                        <td class="right">-</td>
                                        <td class="right">21.79%</td>
                                        <td class="right">37.15%</td>
                                        <td class="right">1.38%</td>
                                        <td class="right">0.16%</td>
                                        <td class="right">1.50%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>103</td>
                                        <td>妇泌科</td>
                                        <td class="right">233</td>
                                        <td class="right">263</td>
                                        <td class="right">-</td>
                                        <td class="right">11.41%</td>
                                        <td class="right">25.2%</td>
                                        <td class="right">1.18%</td>
                                        <td class="right">0.85%</td>
                                        <td class="right">1.92%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>104</td>
                                        <td>宫颈科</td>
                                        <td class="right">122</td>
                                        <td class="right">166</td>
                                        <td class="right">-</td>
                                        <td class="right">26.51%</td>
                                        <td class="right">42.21%</td>
                                        <td class="right">1.17%</td>
                                        <td class="right">0.25%</td>
                                        <td class="right">1.95%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>105</td>
                                        <td>临产室</td>
                                        <td class="right">288</td>
                                        <td class="right">374</td>
                                        <td class="right">-</td>
                                        <td class="right">22.99%</td>
                                        <td class="right">32.51%</td>
                                        <td class="right">1.04%</td>
                                        <td class="right">0.3%</td>
                                        <td class="right">1.45%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>106</td>
                                        <td>内分泌科</td>
                                        <td class="right">441</td>
                                        <td class="right">564</td>
                                        <td class="right">-</td>
                                        <td class="right">21.81%</td>
                                        <td class="right">26.38%</td>
                                        <td class="right">1.81%</td>
                                        <td class="right">0.29%</td>
                                        <td class="right">2.47%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>107</td>
                                        <td>胸外科</td>
                                        <td class="right">373</td>
                                        <td class="right">450</td>
                                        <td class="right">-</td>
                                        <td class="right">17.11%</td>
                                        <td class="right">33.54%</td>
                                        <td class="right">1.4%</td>
                                        <td class="right">0.25%</td>
                                        <td class="right">2.02%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>108</td>
                                        <td>普妇科二病区</td>
                                        <td class="right">182</td>
                                        <td class="right">230</td>
                                        <td class="right">-</td>
                                        <td class="right">20.87%</td>
                                        <td class="right">27.24%</td>
                                        <td class="right">1.86%</td>
                                        <td class="right">0.7%</td>
                                        <td class="right">2.86%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>109</td>
                                        <td>呼吸内科</td>
                                        <td class="right">203</td>
                                        <td class="right">253</td>
                                        <td class="right">-</td>
                                        <td class="right">19.76%</td>
                                        <td class="right">27.48%</td>
                                        <td class="right">1.58%</td>
                                        <td class="right">0.14%</td>
                                        <td class="right">2.22%</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox-qx" name="diseases">
                                        </td>
                                        <td>110</td>
                                        <td>消化内科</td>
                                        <td class="right">294</td>
                                        <td class="right">349</td>
                                        <td class="right">-</td>
                                        <td class="right">15.76%</td>
                                        <td class="right">25.74%</td>
                                        <td class="right">1.56%</td>
                                        <td class="right">0.92%</td>
                                        <td class="right">2.51%</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="rj-fy-div float">
                            <table class="body-width ks-ys-title">
                                <tr>
                                    <td class="left table-title padding-left20">医疗组列表</td>
                                </tr>
                            </table>
                            <div class="body-width padding10 padding-top0 over-x tabs margin-bottom20">
                                <table class="body-width common-table border1 on-style">
                                    <tbody>
                                    <tr>
                                        <th>医疗组编码</th>
                                        <th>医疗组名称</th>
                                    </tr>
                                    <tr>
                                        <td>10101</td>
                                        <td>泌尿外科1组</td>
                                    </tr>
                                    <tr>
                                        <td>10102</td>
                                        <td>泌尿外科2组</td>
                                    </tr>
                                    <tr>
                                        <td>10103</td>
                                        <td>泌尿外科3组</td>
                                    </tr>
                                    <tr>
                                        <td>10104</td>
                                        <td>泌尿外科4组</td>
                                    </tr>
                                    <tr>
                                        <td>10105</td>
                                        <td>泌尿外科5组</td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>
                    <div class="clear"></div>
                </div>
                <div class="ks-fy-zb">
                    <div class="gauge-title-div">
                        <table class="body-width">
                            <tr>
                                <td class="left table-title">医疗组基金分配计划</td>
                                <td class="right fs_16">
                                    <button class="btn btn-sm btn-primary"><img src="${path }/static/img/menu/btn1-icon.png"><span>导出</span></button>
                                    <button class="btn btn-sm btn-success"><img src="${path }/static/img/menu/correct.png"><span>修改</span></button>
                                    <button class="btn btn-sm btn-del del1"><img src="${path }/static/img/menu/del.png"><span>移除</span></button>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="body-width  padding-top0">
                        <div class="ys-rc-div">
                            <table class="zy-table body-width common-table on-style rj-fy-table">
                                <tbody>
                                <tr>
                                    <th class="padding-top">
                                        <input class="chk-qx checkbox-qx" type="checkbox"
                                               style="margin-top: 0px">
                                    </th>
                                    <th>医疗组编码</th>
                                    <th>医疗组</th>
                                    <th>人均定额(元)</th>
                                    <th>住院天数</th>
                                    <th>人均医疗费用(元)</th>
                                    <th>自费限额(元)</th>
                                    <th>药费限额(元)</th>
                                    <th>检查检验费限额(元)</th>
                                    <th>诊疗费限额(元)</th>
                                    <th>耗材费限额(元)</th>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10101</td>
                                    <td>泌尿外科1组</td>
                                    <td class="right">2162.77</td>
                                    <td class="right">18</td>
                                    <td class="right">2681.54</td>
                                    <td class="right">531</td>
                                    <td class="right">844</td>
                                    <td class="right">384</td>
                                    <td class="right">260</td>
                                    <td class="right">371</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10102</td>
                                    <td>泌尿外科2组</td>
                                    <td class="right">5823.74</td>
                                    <td class="right">15</td>
                                    <td class="right">6204.29</td>
                                    <td class="right">854</td>
                                    <td class="right">324</td>
                                    <td class="right">723</td>
                                    <td class="right">357</td>
                                    <td class="right">334</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10103</td>
                                    <td>泌尿外科3组</td>
                                    <td class="right">2907.14</td>
                                    <td class="right">13</td>
                                    <td class="right">3463.85</td>
                                    <td class="right">458</td>
                                    <td class="right">860</td>
                                    <td class="right">266</td>
                                    <td class="right">273</td>
                                    <td class="right">335</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10104</td>
                                    <td>泌尿外科4组</td>
                                    <td class="right">1032.9</td>
                                    <td class="right">13</td>
                                    <td class="right">1131.81</td>
                                    <td class="right">504</td>
                                    <td class="right">265</td>
                                    <td class="right">163</td>
                                    <td class="right">376</td>
                                    <td class="right">256</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10105</td>
                                    <td>泌尿外科5组</td>
                                    <td class="right">3747.76</td>
                                    <td class="right">21</td>
                                    <td class="right">3835.87</td>
                                    <td class="right">660</td>
                                    <td class="right">536</td>
                                    <td class="right">772</td>
                                    <td class="right">463</td>
                                    <td class="right">393</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10106</td>
                                    <td>泌尿外科6组</td>
                                    <td class="right">2579.24</td>
                                    <td class="right">13</td>
                                    <td class="right">2685.27</td>
                                    <td class="right">1426</td>
                                    <td class="right">266</td>
                                    <td class="right">748</td>
                                    <td class="right">140</td>
                                    <td class="right">691</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10107</td>
                                    <td>泌尿外科7组</td>
                                    <td class="right">3761.81</td>
                                    <td class="right">5</td>
                                    <td class="right">3874.56</td>
                                    <td class="right">943</td>
                                    <td class="right">396</td>
                                    <td class="right">608</td>
                                    <td class="right">324</td>
                                    <td class="right">100</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10108</td>
                                    <td>泌尿外科8组</td>
                                    <td class="right">599.4</td>
                                    <td class="right">7</td>
                                    <td class="right">648.89</td>
                                    <td class="right">926</td>
                                    <td class="right">573</td>
                                    <td class="right">446</td>
                                    <td class="right">498</td>
                                    <td class="right">205</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10109</td>
                                    <td>泌尿外科9组</td>
                                    <td class="right">4434.76</td>
                                    <td class="right">18</td>
                                    <td class="right">4721.71</td>
                                    <td class="right">133</td>
                                    <td class="right">650</td>
                                    <td class="right">301</td>
                                    <td class="right">245</td>
                                    <td class="right">965</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="checkbox" class="checkbox-qx" name="diseases">
                                    </td>
                                    <td>10110</td>
                                    <td>泌尿外科10组</td>
                                    <td class="right">1826.46</td>
                                    <td class="right">5</td>
                                    <td class="right">2003.44</td>
                                    <td class="right">836</td>
                                    <td class="right">133</td>
                                    <td class="right">242</td>
                                    <td class="right">376</td>
                                    <td class="right">158</td>
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
</div>

<script>
    $(function () {
        //全选,取消全选
        $(".chk-qx").click(function () {
            if ($(this).hasClass("checked") == false) {
                $(this).closest(".common-table").find("input[type=checkbox]").prop("checked", true);
                $(this).addClass("checked");
                $(this).parent().parent().siblings().addClass("active-tr");

            } else {
                $(this).closest(".common-table").find("input[type=checkbox]").prop("checked", false);
                $(this).removeClass("checked");
                $(this).parent().parent().siblings().removeClass("active-tr");
                $(this).parent().parent().siblings().removeClass("border-color");
            }
        });

        /*点击删除按钮*/
        $(".del").click(function () {
            if ($("input[type='checkbox']").is(':checked')) {
                win.confirm('', '您是否移除本行？', function (r) {
                    if (r == true) {
                        $("input[class='checkbox-qx']:checked").each(function () { // 遍历选中的checkbox
                            n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                            $("table.ks-jh-table").find("tr:eq(" + n + ")").remove();

                        });

                    }
                });
            }
            else {
                win.alert('', '请选择要移除的行！');
            }
        });
        /*点击删除按钮*/
        $(".del1").click(function () {
            if ($(".rj-fy-table  input[type='checkbox']").is(':checked')) {
                win.confirm('', '您是否移除本行？', function (r) {
                    if (r == true) {
                        $("input[class='checkbox-qx']:checked").each(function () { // 遍历选中的checkbox
                            n = $(this).parents("tr").index();  // 获取checkbox所在行的顺序
                            $("table.rj-fy-table").find("tr:eq(" + n + ")").remove();
                        });
                    }
                });
            }
            else {
                win.alert('', '请选择要移除的行！');
            }
        });
    });
    $("a,button").focus(function () {
        this.blur()
    });
</script>
</body>
</html>