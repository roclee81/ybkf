<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>异地就医</title>
    <script src="${staticPath }/static/js/common.js"></script>
    <style>
        .yz-msg-table th {
            box-shadow: 0px 2px 0px #cdcdcd;
            opacity: 1.0;
        }

        #btn-table .btn {
            color: #ffffff;
        }

        #btn-table .btn:hover {
            color: #1E1E1E;
        }

        .ys-table select {
            width: 68px;
        }

        th {
            border: 1px solid #D6D3D6 !important;
        }

        .float-right {
            float: right
        }
		.text-center{background-color:#fff; margin-top:10px; margin-bottom:0 !important}
		
		.exes{color:#666; margin-left:5px;}
    </style>
</head>
<body>
<div class="header-div bg-color">
    <table class="ys-table tiaojian margin-left20" style="width: 95%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
                年度
            </td>
            <td>
                <select>
                    <option>2016</option>
                    <option>2017</option>
                </select>
            </td>
            <td class="td-width fs_16">
                月份
            </td>
            <td style="width: 44px">
                <select style="width: 44px">
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
            <td class="td-width fs_16">
                科室
            </td>
            <td>
                <select>
                    <option value="0">全院</option>
                    <option value="1">内科</option>
                    <option value="1">外科</option>
                </select>
            </td>
            <td class="td-width fs_16">
                就医类型
            </td>
            <td>
                <select>
                    <option value="0">全部</option>
                    <option value="1">省内</option>
                    <option value="1">省外</option>
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
<div class="ScrLts" style="padding:0 !important;">
    <table class="body-width">
        <tr style="margin-bottom: 10px">
            <td>
                <li class="text-center" style="margin-right:0 !important;">
                    <p><span class="zy-style">100</span>例</p>
                    <p class="nowrap">
                        <font class="nowrap">省内患者</font>
                    </p>
                </li>
            </td>
            <td>
            <li class="text-center">
                    <p><span class="zy-style">36000</span></p>
                    <p class="nowrap">
                        <font class="nowrap">医疗总费用</font>
                        <span class="exes">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                    </p>
                </li>
            </td>
            <td>
                <li class="text-center" style="margin-right:0 !important;">
                    <p><span class="zy-style">80</span>例</p>
                    <p class="nowrap">
                        <font class="nowrap">省外患者</font>
                    </p>
                </li>
                
            </td>
            <td>
            <li class="text-center" style="margin-right:0 !important;">
                    <p><span class="zy-style">28000</span></p>
                    <p class="nowrap">
                        <font class="nowrap">医疗总费用</font>
                        <span class="exes">与上月比<font class="normal-span padding-left4">↓ 20%</font></span>
                    </p>
                </li>
            </td>
        </tr>
    </table>
    <div class="clear"></div>
</div>

<div class="tab-div-box bg-color" style="min-height: 94.5%">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb1" style="height:550px">
                <div class="gauge-title-div">
                    <table id="btn-table" class="margin-top10 float-right">
                        <tr>
                            <td class="right">
                                <button class="btn btn-sm btn-primary"><img src="${staticPath }/static/img/menu/btn1-icon.png">导出
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="body-width padding10 padding-top0">
                    <div class="ys-rc-div">
                        <table class="zy-table body-width common-table" style="width: 100%">
                            <tbody>
                            <tr class="th-bg">
                                <th>患者ID</th>
                                <th>患者姓名</th>
                                <th>患者就医方式</th>
                                <th>医疗费(元)</th>
                                <th>医保统筹支付(元)</th>
                                <th>报销比例</th>
                                <th>医保拒付金额(元)</th>
                                <th>药品总费(元)</th>
                                <th>检查检验总费(元)</th>
                                <th>诊疗总费(元)</th>
                                <th>材料总费(元)</th>
                            </tr>
                            <tr>
                                <td>21284939</td>
                                <td>张军</td>
                                <td>省外</td>
                                <td class="right">7551.6</td>
                                <td class="right">5059.57</td>
                                <td class="right">0.67</td>
                                <td class="right">2187.64</td>
                                <td class="right">2243.13</td>
                                <td class="right">422.34</td>
                                <td class="right">2790.81</td>
                                <td class="right">1370.05</td>
                            </tr>
                            <tr>
                                <td>21384114</td>
                                <td>赵旭</td>
                                <td>省内</td>
                                <td class="right">9938.61</td>
                                <td class="right">6460.1</td>
                                <td class="right">65%</td>
                                <td class="right">122.13</td>
                                <td class="right">5314.36</td>
                                <td class="right">536.07</td>
                                <td class="right">1586.4</td>
                                <td class="right">646.72</td>
                            </tr>
                            <tr>
                                <td>21428378</td>
                                <td>陈宏子</td>
                                <td>省外</td>
                                <td class="right">7911.96</td>
                                <td class="right">7358.12</td>
                                <td class="right">93%</td>
                                <td class="right">38.43</td>
                                <td class="right">1757.91</td>
                                <td class="right">468.78</td>
                                <td class="right">1458.99</td>
                                <td class="right">1200.78</td>
                            </tr>
                            <tr>
                                <td>21523565</td>
                                <td>秦婷婷</td>
                                <td>省内</td>
                                <td class="right">7919.27</td>
                                <td class="right">6968.96</td>
                                <td class="right">88%</td>
                                <td class="right">817.43</td>
                                <td class="right">3911.68</td>
                                <td class="right">255.5</td>
                                <td class="right">1723.5</td>
                                <td class="right">746.27</td>
                            </tr>
                            <tr>
                                <td>21537923</td>
                                <td>曹丽娜</td>
                                <td>省外</td>
                                <td class="right">1997.92</td>
                                <td class="right">1458.48</td>
                                <td class="right">73%</td>
                                <td class="right">78.61</td>
                                <td class="right">1307.08</td>
                                <td class="right">593.08</td>
                                <td class="right">87.01</td>
                                <td class="right">343.74</td>
                            </tr>
                            <tr>
                                <td>21577912</td>
                                <td>李娜</td>
                                <td>省外</td>
                                <td class="right">7516.88</td>
                                <td class="right">4209.45</td>
                                <td class="right">56%</td>
                                <td class="right">1417.02</td>
                                <td class="right">4954.41</td>
                                <td class="right">654.45</td>
                                <td class="right">1100.31</td>
                                <td class="right">424.28</td>
                            </tr>
                            <tr>
                                <td>21669546</td>
                                <td>姜钰</td>
                                <td>省外</td>
                                <td class="right">8165.27</td>
                                <td class="right">3102.8</td>
                                <td class="right">38%</td>
                                <td class="right">2782.81</td>
                                <td class="right">1788.3</td>
                                <td class="right">122.98</td>
                                <td class="right">1503.09</td>
                                <td class="right">2073.98</td>
                            </tr>
                            <tr>
                                <td>21718066</td>
                                <td>魏天霞</td>
                                <td>省内</td>
                                <td class="right">3124.14</td>
                                <td class="right">1749.52</td>
                                <td class="right">56%</td>
                                <td class="right">237.07</td>
                                <td class="right">1949.63</td>
                                <td class="right">215.53</td>
                                <td class="right">106.19</td>
                                <td class="right">170.63</td>
                            </tr>
                            <tr>
                                <td>21761524</td>
                                <td>王红梅</td>
                                <td>省外</td>
                                <td class="right">9586.72</td>
                                <td class="right">2971.88</td>
                                <td class="right">31%</td>
                                <td class="right">2482.45</td>
                                <td class="right">1809.51</td>
                                <td class="right">415.97</td>
                                <td class="right">3098.62</td>
                                <td class="right">2126.73</td>
                            </tr>
                            <tr>
                                <td>21849471</td>
                                <td>郭淑慧</td>
                                <td>省内</td>
                                <td class="right">5363.58</td>
                                <td class="right">4076.32</td>
                                <td class="right">76%</td>
                                <td class="right">1128.7</td>
                                <td class="right">3974.21</td>
                                <td class="right">399.44</td>
                                <td class="right">916.08</td>
                                <td class="right">635.96</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("a,button").focus(function () {
        this.blur()
    });
</script>
</body>
</html>