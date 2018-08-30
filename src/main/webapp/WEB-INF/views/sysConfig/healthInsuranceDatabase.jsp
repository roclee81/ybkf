<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
<link href="${path }/static/css/zTreeStyle.css" rel="stylesheet">
<script src="${path }/static/js/Wen_js/jquery.ztree.core.js"></script>
<script src="${path }/static/js/Wen_js/jquery.ztree.excheck.min.js"></script>
<script src="${path }/static/js/Wen_js/jquery.ztree.exedit.min.js"></script>
    <script src="${path }/static/js/ziliaoku.js"></script>
    <script src="${path }/static/js/common.js"></script>
<style>
.floatR{ float:right;}
.ztree li span.button.add {margin-left:2px; margin-right:4px; background-position:-144px 0;}
input{background: #FFFFFF !important;}
.Rename{overflow:hidden; height:0;}
.Rename input{width:80%; border:1px solid #d2d2d2; padding-left:10px; height:28px; font-size:12px;}
.Rename button{width:19%; border:none; height:26px; line-height:26px; margin-left:1%; border-radius:4px; background:url(img/menu/buton.png) no-repeat; color:#fff;}
.Rename p{color:#C23531 !important; font-size:12px; display:none;}
</style>
<title>实时提醒</title>
</head>

<body>
<div class="bg-color" style="min-height:100%;">
    <div class="ys-rc-div Left_Tarr">
    	<div class="H_text">
        	资料目录
        </div>
        <div class="Search">
        	<input type="text" placeholder="搜索资料目录名"/><i></i>
        </div>
        <P id='Add_to'><img src="${path }/static/img/Search/new_t.png" />新建一级目录</P>
        <div class="Rename">
        	<input type="text" id='Int' placeholder="请输入目录名"/><button id="Qd">确 定</button>
            <p class="T_we">目录名不能为空或请输入目录名！</p>
        </div>
        <div class="content_wrap">
            <div class="zTreeDemoBackground left">
                <ul id="treeDemo" class="ztree"></ul>
            </div>
        </div>
    </div>
   	<div class="ys-rc-div Right_Text ">
    	<div class="Op_W">
        	<ul>
            	<li><img src="${path }/static/img/Search/new_y.png"/><a href="javascript:;">上传</a></li>
                <li><img src="${path }/static/img/Search/new_v.png"/><a href="javascript:;">下载</a></li>
                <li><img src="${path }/static/img/Search/new_d.png"/><a href="javascript:;">删除</a></li>
            </ul>
            <div class="clear"></div>
        </div>
        <div class="MicA">
        	<ul>
            	<li>资料目录<i></i></li>
            	<li>济南市医保规则<i></i></li>
                <li>济南市医保规则-详情</li>
            </ul>
            <div class="Search floatR">
                <input type="text" placeholder="搜索资料"/><i></i>
            </div>
            <div class="clear"></div>
        </div>
        <div class="body-width padding10">
            <div class="ys-rc-div">
                <table class="body-width common-table" style="height:auto">
                    <tbody>
                        <tr>
                            <th><input type="checkbox"/></th>
                            <th>资料名</th>
                            <th>管理员</th>
                            <th>上传时间</th>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="check" class="subcheck"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="check"/></td>
                            <td class="left">济南市医保规则</td>
                            <td>龙陵</td>
                            <td>2017-08-23</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        
        
    </div>
    <div class="clear"></div>
</div>

</body>
</html>