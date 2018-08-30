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
    <title>门规患者登记</title>
    <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <style>
        .sf-msg-table th {
            border-top: none !important;
        }
        .fw-target-div {
            margin-top: 10px;
            margin-right: 0!important;
        }
        .tab-div-box {
            width: 50.5%;
            float: left;
        }
        .ks-fy-zb {
            margin: 10px 0 0;
            height: auto;
            border: #e7ecf3 1px solid;
            border-bottom: 1px solid #d4d4d4;
        }
        input,label{vertical-align:text-bottom}
        label{font-weight: 500}
        #add_div {
            padding: 0 16px;
            width: 100%;;
            margin-top: 4px
        }
        .gauge-title-div table tr >td{padding: 2px 10px}
    </style>

</head>
<body>

<!--病种设定-->
<div class="tab-div-box">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb bg-color" style="height: 590px">
                <div class="gauge-title-div margin-top10">
                    <table class="float-right" width="100%">
                        <tr>
                            <td class="left">门规患者列表</td>
                            <td class="text-right">
                                <button class="btn btn-sm btn-xinzeng" id="add"><img src="${staticPath }/static/img/menu/xinzeng-icon.png"><span>新增</span></button>
                                <button class="btn btn-sm btn-del del" id="del"><img src="${staticPath }/static/img/menu/del.png"><span>删除</span></button>
                                <button class="btn btn-sm btn-primary "><img src="${staticPath }/static/img/menu/btn1-icon.png"><span>导出</span></button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="clear"></div>
                <div class="body-width padding10 padding-top0">
                    <div class="ys-rc-div">
                        <table class="zy-table body-width common-table on-style">
                            <tbody>
                            <tr class="th-bg">
                                <th>参保类型</th>
                                <th>患者姓名</th>
                                <th>身份证号</th>
                                <th>单位或地址</th>
                                <th>门规病种类型</th>
                                <th>疾病名称</th>
                                <th>门规疾病名称</th>
                                <th>是否介入治疗</th>
                                <th>患者状态</th>
                                <th>生效时间</th>
                                <th>失效时间</th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="fw-target-div bz-div" style="overflow-x: auto;height: 590px">
    <div class="gauge-title-div margin-top10">
        <table class=" float-right" width="100%">
            <tr>
                <td class="left">门规患者登记</td>
                <td class="text-right">
                </td>
            </tr>
        </table>
        <div class="clear"></div>
    </div>
    <div class="clear"></div>
    <table class="input-table" id="input-table1">
        <tr>
            <td>参保类型</td>
            <td>
                <select class="xm-type">
                    <option>城镇职工</option>
                    <option>城乡居民</option>
                </select>
            </td>

        </tr>
        <tr>
            <td>患者姓名</td>
            <td>
                <input type="text" class="xm-nm">
            </td>
            <td>身份证号</td>
            <td>
                <input type="text" class="xu-hao">
            </td>
        </tr>
        <tr>
            <td>单位或住址</td>
            <td colspan="3">
                <input type="text" class="yp-nm">
            </td>
        </tr>
        <tr>
            <td>病种分类</td>
            <td>
                <select class="xd-nm">
                    <option value="0">请选择</option>
                    <option value="1">I类</option>
                    <option value="2">II类</option>
                    <option value="3">III类</option>
                </select>
            </td>
            <td>门规病种类型</td>
            <td>
                <select id="ml_select">

                </select>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>疾病名称</td>
            <td>
                <select id="selected">

                </select>
            </td>
            <td class="padding-left10" style="text-align: left;padding-top: 12px;">
                <button class="add-tr"></button>
            </td>
        </tr>
        <tr>
            <td>门规疾病名称</td>
            <td colspan="3" id="add_div" >
            </td>
        </tr>
        <tr>
            <td>是否介入治疗</td>
            <td>
                <input type="radio" name="zl" value="是"><label class="padding-left5">是</label>
                <span class="padding-left20">&nbsp;</span>
                <input type="radio" name="zl" value="是" ><label class="padding-left5">否</label>
            </td>
        </tr>
        <tr>
            <td>患者状态</td>
            <td colspan="3">
                <input type="radio" name="zt" value="在管"><label class="padding-left5">在管</label>
                <span class="padding-left5">&nbsp;</span>
                <input type="radio" name="zt" value="转入" ><label class="padding-left5">转入</label>
                <span class="padding-left5">&nbsp;</span>
                <input type="radio" name="zt" value="转出" ><label class="padding-left5">转出</label>
                <span class="padding-left5">&nbsp;</span>
                <input type="radio" name="zt" value="死亡" ><label class="padding-left5">死亡</label>
            </td>
        </tr>
        <tr>
            <td>生效时间</td>
            <td>
                <div class="input-group date form_date" style="float: right">
                    <input class="padding-left4 str-date" size="10" type="text" value="2017-08-21"  style="width: 100%"/>
                    <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                </div>
            </td>
            <td>失效时间</td>
            <td>
                <div class="input-group date form_date" style="float: right">
                    <input class="padding-left4 end-date" size="10" type="text" value="2017-08-31"  style="width: 100%"/>
                    <span class="input-group-addon"><span class="glyphicon-calendar"></span></span>
                </div>
            </td>
        </tr>

    </table>
    <div class="hr-div" style="margin-top:10px">
        <button class="btn btn-primary margin-right10 fs_16" id="update">保存</button>
        <button class="btn btn-primary margin-right10 fs_16" id="cancel">取消</button>
    </div>
</div>
</div>
<div class="clear"></div>


<script>

    $(function () {
        /*初始化*/
        $(document).ready(function () {
            $("input[name='zl']").attr("disabled", "true");
            active_tr();
        });

        /* 日期插件*/
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            todayBtn: true//显示今日按钮
        });

        /*表格鼠标事件*/
        function active_tr(){
            $(".on-style tr").on({
                "mouseenter": function () {
                    var index = $(this).index();
                    if (index != 0) {
                        $(this).addClass("on-tr");
                        $(this).addClass("on-td");
                        $(this).prev().addClass("on-tr");
                    }

                },
                "mouseleave": function () {
                    $(this).removeClass("on-tr");
                    $(this).removeClass("on-td");
                    $(this).prev().removeClass("on-tr");
                },
                "click": function () {
                    var index = $(this).index();
                    if (index != 0) {
                        $(this).addClass("active-tr").siblings().removeClass("active-tr");
                        $(this).prev().addClass("border-color").siblings().removeClass("border-color");

                        var list = [];
                        var list_length = $(this).find('td').length;
                        for (var i = 1; i < list_length; i++) {
                            list.push($(this).find('td')[i].innerHTML);
                        }

                        $("#input-table1").find('select').get(0).options[0].selected = true;
                        $("#input-table1").find('select').get(1).options[1].selected = true;
                        $("input[name='zt']").get(0).checked=true;
                        var table_list = [];
                        table_list = $("#input-table1").find('input[type=text]');

                        for (var i = 0; i < table_list.length; i++) {
                            table_list.eq(i).attr("value", list[i]);
                        }

                        table_list.eq(3).attr("value", list[8]);
                        table_list.eq(4).attr("value", list[9]);
                    }
                }
            });
        }

        /*病种分类下拉点击事件*/
        $(".xd-nm").on({
            "change": function () {
                var sel_val = $(".xd-nm option:selected").index();
                var html_type;
                var html_name;

                if(sel_val==1){
                    html_type = "<option>恶性肿瘤</option>";
                    html_name = "<option>鼻咽恶性肿瘤</option><option>食管恶性肿瘤</option><option>直肠恶性肿瘤</option><option>肺恶性肿瘤</option>";
                    $("input[name='zl']").attr("disabled", "true");
                }
                else if(sel_val==2){
                    html_type = "<option>肝硬化</option>";
                    html_name = "<option>肝炎后肝硬变</option><option>肝硬变</option>";
                    $("input[name='zl']").attr("disabled", "true");
                }
                else if(sel_val==3){
                    html_type = "<option>冠心病</option>";
                    html_name = "<option>冠心病</option>";
                    $("input[name='zl']").removeAttr("disabled");
                }
                $("#ml_select").children().remove();
                $("#selected").children().remove();
                $("#ml_select").append(html_type);
                $("#selected").append(html_name);
            }
        });


        /*加号点击事件*/
        $(".add-tr").click(function () {
            var sel_val = $("#selected option:selected").index();
            var select_text = $("#selected option:selected").text();
            var len = $("#selected option").length;
            //x上限，y下限
            var x = 20000;
            var y = 10000;
            var rand = parseInt(Math.random() * (x - y + 1) + y);

            if (len > 0) {

                    var html_td = "<div class='add_div del_div'> <span>" + select_text + "：￥"+rand+";</span>" +
                             "<button class='del-div'></button>" + "</div>";
                    $("#add_div").append(html_td);
                    /*费用选项下拉框中	删除选中的费用*/
                    $("#selected option")[sel_val].remove();
            }
            else{
                alert("请选择疾病名称");
            }

        });

        /*叉号点击事件*/
        $("#add_div").on("click", ".del-div", function () {
            $(this).parent().remove();
            var del_div_val = $(this).parent().text();
            var options_val = del_div_val.substring(0, del_div_val.indexOf("："));
            var select_html = "<option>" + options_val + "</option>";
            $("#selected").append(select_html);
        });

        /*点击新增按钮事件*/
        $("#add").click(function () {
            $(".on-style tr").removeClass("active-tr");
            $(".on-style tr").removeClass("border-color");
            add();
        });
        function add(){
            $("#input-table1").find('select').get(0).options[0].selected = true;
            $("#input-table1").find('select').get(1).options[0].selected = true;
            $("input[name='zt']").get(0).checked=true;
            var table_list = [];
            table_list = $("#input-table1").find('input[type=text]');

            for (var i = 0; i < table_list.length; i++) {
                table_list.eq(i).val(" ");
            }
        }

        /*点击修改按钮事件*/
        $("#update").click(function () {
            if($(".on-style tr").hasClass("active-tr")){
            var xm_type_val = $(".xm-type option:selected").text();
            var xm_nm = $(".xm-nm").val();
            var xm_xu_hao = $(".xu-hao").val();
            var xm_yp_nm = $(".yp-nm").val();
            var xm_yb_je = $(".yb-je").val();
            var xm_yb_xe = $(".yb-xe").val();
            var ra_val1;
            var ra_val2;
            var xm_zl = $('input:radio[name="zl"]:checked').val();
            var xm_zt = $('input:radio[name="zt"]:checked').val();
            var xm_str_date = $(".str-date").val();
            var xm_end_date = $(".end-date").val();
            if(xm_zl == null){
                ra_val1 = "-";
            }
            else{
                ra_val1=xm_zl;
            }
            if(xm_zt == null){
                ra_val2 = "-";
            }
            else{
                ra_val2=xm_zt;
            }

            var list = [xm_type_val,xm_nm,xm_xu_hao,xm_yp_nm,xm_yb_je,xm_yb_xe,ra_val1,ra_val2,xm_str_date,xm_end_date];

            var table_list = [];
            table_list = $(".active-tr").find('td');

            for (var i = 0; i < table_list.length; i++) {
                table_list.eq(i).text(list[i]);
            }
            }
            else{
                var xm_type_val = $(".xm-type option:selected").text();
                var xm_nm = $(".xm-nm").val();
                var xm_xu_hao = $(".xu-hao").val();
                var xm_yp_nm = $(".yp-nm").val();
                var xm_yb_je = $("#ml_select option:selected").text();
                var xm_yb_xe = $("#selected option:selected").text();
                var xm_bz_name = $(".del_div >span").text();
                var ra_val1;
                var ra_val2;
                var xm_zl = $('input:radio[name="zl"]:checked').val();
                var xm_zt = $('input:radio[name="zt"]:checked').val();
                var xm_str_date = $(".str-date").val();
                var xm_end_date = $(".end-date").val();
                if(xm_nm == ""){
                    xm_nm = "-";
                }
                if(xm_xu_hao == ""){
                    xm_xu_hao = "-";
                }
                if(xm_yp_nm == ""){
                    xm_yp_nm = "-";
                }
                if(xm_yb_je == ""){
                    xm_yb_je = "-";
                }
                if(xm_yb_xe == ""){
                    xm_yb_xe = "-";
                }
                if(xm_bz_name == ""){
                    xm_bz_name = "-";
                }

                if(xm_zl == null){
                    ra_val1 = "-";
                }
                else{
                    ra_val1=xm_zl;
                }
                if(xm_zt == null){
                    ra_val2 = "-";
                }
                else{
                    ra_val2=xm_zt;
                }
                if(xm_str_date == ""){
                    xm_str_date = "-";
                }
                if(xm_end_date == ""){
                    xm_end_date = "-";
                }
                var add_html = "<tr> <td>" + xm_type_val + "</td>" + "<td>"+xm_nm+"</td>"+ "<td>"+xm_xu_hao+"</td>"+ "<td>"+xm_yp_nm+"</td>"
                        + "<td>"+xm_yb_je+"</td>"+ "<td>"+xm_yb_xe+"</td>"+"<td>"+xm_bz_name+"</td>"+"<td>"+ra_val1+"</td>"+ "<td>"+ra_val2+"</td>"
                        + "<td>"+xm_str_date+"</td>"+ "<td>"+xm_end_date+"</td> </tr>";
                $(".on-style").append(add_html);
                active_tr()
            }
        });


        /*取消按钮点击事件*/
        $("#cancel").click(function () {
            $(".on-style tr").removeClass("active-tr");
            $(".on-style tr").removeClass("border-color");
            add();
        });

        /*删除table数据*/
        $("#del").click(function () {
            $(".active-tr").css("display", "none");
        });

        $("a,button").focus(function () {
            this.blur()
        });
    });


</script>
</body>
</html>