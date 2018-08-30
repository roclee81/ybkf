<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<%@ include file="/commons/basejs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <link href="${staticPath }/static/css/login.css" type="text/css" rel="stylesheet">
    <title>首页</title>
</head>
<body>
    <div class="bg">
        <div>
            <div class="headers">
                <img src="${staticPath }/static/img/login/headers.png"/>
            </div>
            <div class="title"><span style="padding-right: 100px"><img src="${staticPath }/static/img/login/title.png"></span></div>
            <div class="one-div">
                <table>
                    <tr>
                        <td>
                            <div class="img-btn1">
                                <img src="${staticPath }/static/img/login/icon-01.png" class="two-min-img">
                                <p>数据监控</p>
                            </div>
                        </td>
                        <td>
                            <div class="img-btn2">
                                <img src="${staticPath }/static/img/login/icon-02.png" class="two-min-img">
                                <p>规则审核</p>
                            </div>
                        </td>
                        <td>
                            <div class="img-btn3">
                                <img src="${staticPath }/static/img/login/icon-6.png" class="two-min-img">
                                <p>病种收费</p>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <div class="img-btn4">
                                <img src="${staticPath }/static/img/login/icon-03.png" class="two-min-img">
                                <p>决策改进</p>
                            </div>
                        </td>
                        <td>
                            <div class="img-btn5">
                                <img src="${staticPath }/static/img/login/icon-04.png" class="two-min-img">
                                <p>阶段报表</p>
                            </div>
                        </td>
                        <td>
                            <div class="img-btn6">
                                <img src="${staticPath }/static/img/login/icon-05.png" class="two-min-img">
                                <p>系统配置</p>
                            </div>
                        </td>
                        <td class="btn-td">
                            <img src="${staticPath }/static/img/login/btn.png"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

    <script>
        $(".img-btn1").click(function(){
            url = "${path}/index1?id=10";//此处拼接内容
            window.location.href = url;
        });
        $(".img-btn2").click(function(){
            url = "${path}/index1?id=20";//此处拼接内容
            window.location.href = url;
        });
        $(".img-btn3").click(function(){
            url = "${path}/index1?id=30";//此处拼接内容
            window.location.href = url;
        });
        $(".img-btn4").click(function(){
            url = "${path}/index1?id=40";//此处拼接内容
            window.location.href = url;
        });
        $(".img-btn5").click(function(){
            url = "${path}/index1?id=50";//此处拼接内容
            window.location.href = url;
        });
        $(".img-btn6").click(function(){
            url = "${path}/index1?id=60";//此处拼接内容
            window.location.href = url;
        });

    </script>
</body>
</html>