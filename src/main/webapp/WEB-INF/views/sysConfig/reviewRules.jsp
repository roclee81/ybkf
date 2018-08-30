<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>审核规则</title>
    <script src="${path }/static/js/bootstrap-datetimepicker.js"></script>
    <script src="${path }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
    <link href="${path }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="${path }/static/js/common.js"></script>
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
        .float_right {
            float: right;
        }
        .ys-table input,select{
        	margin:0 8px;
        }
    </style>
</head>
<body>
<div class="header-div bg-color">
    <table class="ys-table tiaojian margin-left20" style="width:60%">
        <tbody>
        <tr>
            <td class="padding-left10 fs_16">
                医保规则名称
            </td>
            <td>
                <input type="text"/>
            </td>

            <td class="td-width fs_16">
                医保规则类型
            </td>
            <td>
				<select>
                    <option value="0">-请选择-</option>
                    <option value="1">限适应症用药规则</option>
                    <option value="3">00003</option>
                    <option value="4">00004</option>
                </select>
            </td>
            <td style="padding-left: 0px">
				医保规则启用标
            </td>
            <td class="td-width">
                <select>
                    <option value="0">启用</option>
                    <option value="1">停止</option>
                </select>
            </td>
            <td>
                <button class="btn btn-primary"><img style="padding: 0" src="${path }/static/img/menu/search.png"><span>查询</span></button>
            </td>
        </tr>
        </tbody>
    </table>
</div>
<div class="tab-div-box bg-color" style="min-height: 94.5%">
    <div class="main-ys-fy">
        <div>
            <div class="ks-fy-zb1 " style="min-height:480px">
                <div class="gauge-title-div margin-top21">
                    <table id="btn-table" class="margin-top10 float_right">
                        <tr>
                            <td class="fs_16">
                                <button class="btn btn-primary margin-right10" id="increase"><img
                                        src="${path }/static/img/menu/xinzeng-icon.png"><span>新增</span>
                                </button>
                            </td>
                            <td>
                                <button class="btn btn-sm btn-success " id="update"><img
                                        src="${path }/static/img/menu/correct.png"><span>修改</span>
                                </button>
                            </td>
                        </tr>
                    </table>
                    <div class="clear"></div>
                </div>
                <div class="body-width padding10 padding-top0">
                    <div class="ys-rc-div">
                        <table class="body-width common-table" style="width: 100%">
                           <tbody>
                            <tr class="th-bg">
                                <th class="padding-left10">
                                    <input id="chk-qx" class="checkbox-qx" type="checkbox">
                                </th>
                                <th>医保规则编号</th>
                                <th>医保规则名称</th>
                                <th>医保规则类型</th>
                                <th>医保规则启用标志</th>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1001</td>
                                <td>限适应症用药规则</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1002</td>
                                <td>限适应症用药可疑</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1003</td>
                                <td>中药饮片超量</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1004</td>
                                <td>中药饮片审核</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1005</td>
                                <td>重复超量用药</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1006</td>
                                <td>提前取药违规</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1007</td>
                                <td>提前取药可疑</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>
                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1008</td>
                                <td>超量取药违规</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
                            </tr>

                            <tr>
                                <td class="padding-left10 padding-top">
                                    <input type="checkbox" class="checkbox-qx" name="diseases">
                                </td>
                                <td>1009</td>
                                <td>超量取药可疑</td>
                                <td>医保限制规则</td>
                                <td>启用</td>
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
<!--弹出层-->
<!--
<div class="BgDiv"></div>
<div class="DialogDiv" style="display: none; width:50%; height:360px; left:30%;">
    <div class="pop-up bg-color1">
        <table class="body-width">
            <tr>
                <td class="left padding-left20 fs_16">用户新增</td>
                <td class="text-right padding-right20">
                    <img src="img/close.png" id="closes">
                </td>
            </tr>
        </table>
    </div>

    
    <div class="" style="height: 240px;">
        <table class="bz-zd-table">
            <tbody>
            <tr>
                <td colspan="4" style="text-align: right;color:#DF2828">
                    注：* 为必须项
                </td>
            </tr>
            <tr>
                <td>
                    <span>*</span>登录名
                </td>
                <td>
                    <input type="text"/>
                </td>
                <td>
                    <span>*</span>姓名
                </td>
                <td>
                    <input type="text"/>
                </td>

            </tr>
            <tr>
                <td>
                    <span>*</span>密码
                </td>
                <td style="padding-left: 6px!important;">
                    <input type="text"/>
                </td>
                <td>
                    <span>*</span>性别
                </td>
                <td>
                    <input type="text"/>
                </td>

            </tr>
            <tr>
                <td>
                    年龄
                </td>
                <td>
                    <input type="text"/>
                </td>
                <td><span>*</span>科室</td>
                <td>
                    <select>
                        <option value="0">全院</option>
                        <option value="1">普通外科</option>
                        <option value="2">妇产科</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <span>*</span>角色
                </td>
                <td>
                    <input type="text"/>
                </td>
                <td>
                    电话
                </td>
                <td>
                    <input type="text"/>
                </td>

            </tr>
            <tr>
                <td><span>*</span>用户状态</td>
                <td>
                    <select>
                        <option value="0">正常</option>
                        <option value="1">停用</option>
                    </select>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4" class="center-td padding-top20">
                    <button id="ok" class=" btn btn-primary">确认</button>
                    <button id="back" class="btn btn-primary">取消</button>
                </td>
            </tr>
            </tbody>
        </table>
    </div>

</div>-->
<script>
    $(function () {
        //全选,取消全选
        $("#chk-qx").click(function () {
            // var str = "我是弹出对话框";
            if ($(this).hasClass("checked") == false) {
                $(this).closest(".common-table").find("input[type=checkbox]").prop("checked", true);
                $(this).addClass("checked");
            } else {
                $(this).closest(".common-table").find("input[type=checkbox]").prop("checked", false);
                $(this).removeClass("checked");
            }
        });

        <!--增加-弹出层-->
/*        $("#increase").click(function () {
            // var str = "我是弹出对话框";
            $(".BgDiv").css("z-index", "100");
            $(".BgDiv").css({display: "block", height: $(document).height()});
            $(".DialogDiv").css("top", "20%");
            $(".DialogDiv").css("display", "block");
            document.documentElement.scrollTop = 0;
        });
        $(".BgDiv,#back,#closes").click(function () {
            $(".BgDiv").css("display", "none");
            $(".DialogDiv").css("display", "none");
        });*/
    });

    $("a,button").focus(function () {
        this.blur()
    });
    $(function () {
        /* 日期插件*/
        $('.form_date').datetimepicker({
            format: 'yyyy-mm-dd',
            minView: 'month',
            language: 'zh-CN',
            autoclose: true,
            todayBtn: true//显示今日按钮
        });
    });
</script>
</body>
</html>