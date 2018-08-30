<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctxPath"  value="${pageContext.request.contextPath}" />
<%--项目路径 --%>
<c:set var="path"  value="${ctxPath}" />
<%--静态文件目录 --%>
<c:set var="staticPath" value="${ctxPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <meta charset="UTF-8">
    <title>医保数据监控</title>
        <script src="${path }/static/js/jquery-1.10.1.min.js"></script>
        <script src="${path }/static/js/jquery.easyui.min.js"></script>

    <script src="${path }/static/js/echarts.js"></script>
    <script src="${path }/static/js/bootstrap.min.js"></script>
    <script src="${path }/static/js/jquery.mousewheel.js"></script>
    <script src="${path }/static/js/perfect-scrollbar.js"></script>
    <script src="${path }/static/js/window.js"></script>

    <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/js/common.js"></script>


<script src="${path }/static/js/jquery.easyui.min.js"></script>
  <script src="${path }/static/js/datagrid-filter.js"></script>
    <script src="${path }/static/js/common.js"></script>


	<link rel="shortcut icon" href="${staticPath }/static/style/images/favicon.ico" />
	<script type="text/javascript" src="${staticPath }/static/My97DatePicker/WdatePicker.js" charset="utf-8"></script>
	
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
<script type="text/javascript" src="${staticPath }/static/extJs.js" charset="utf-8"></script>
    
    
    
    <link href="${path }/static/css/bootstrap.min.css" rel="stylesheet" rel="stylesheet">
    <link href="${path }/static/css/perfect-scrollbar.css" rel="stylesheet" rel="stylesheet">
    <link href="${path }/static/css/common.css" type="text/css" rel="stylesheet">
    <link href="${path }/static/css/style.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
    	//var path="${path}";
        $(document).ready(function ($) {
            var $container = $('#description');
            var $status = $('#status');
            $container.perfectScrollbar({minScrollbarLength:100});
        });
        $(function(){
        	
        	 $.extend($.fn.validatebox.defaults.rules, {  
       	   		
     	   		 pwd: {//value值为文本框中的值  
     	   		        validator: function (value) {  
     	   		        	
     	   		            //var reg =$('#pwd').val(); 
     	   		        return $("#pwd").val() == value;  	            
     	   		           // return reg.test(value);  
     	   		           
     	   		        },  
     	   		        message: '两次输入的密码不一致!'  
     	   		    },
     	   
     	   	    });
        	
        	var menu=${menu};
        	for (var i = 0; i < menu.length; i++) {
        		var m= menu[i];
        		//1级菜单中能直接点的（菜单等级为1，没有子元素）
        		if(m.levels==1 && m.ishaschildren==0){
        			var temp= '<li><a href="#" data-rel="${path}'+m.url+'"><em class="'+m.iconCls+'"></em><span class="span-font">'+m.name+'</span></a></li>';
        			$('.xMenu').append(temp);
        		}
        		//1级菜单中，有子菜单的（菜单等级为1，菜单地址为空）
        		if(m.levels==1 && m.ishaschildren==1){
        			var temp='<li><a href="#" class="xMenuOne"><em class="'+m.iconCls+'"></em><span class="span-font">'+m.name+'</span><em class="em-up"></em></a><ul></ul></li>';
        			temp=$(temp);
        			//将二级菜单循环添加到1级菜单中
        			for (var j = 0; j < menu.length; j++) {
        				//二级菜单中，没有3级子菜单的菜单，直接添加
						if(menu[j].pid==m.id && menu[j].ishaschildren==0){
							var temp1='<li><a href="#" data-rel="${path}'+menu[j].url+'" class="xMenuTwo span-font1">'+menu[j].name+'</a></li>';
							var k= $(temp).find("ul");
							$(k[0]).append(temp1);
						}
        				//二级菜单中，有3级子菜单，添加的内容会不同
        				if(menu[j].pid==m.id && menu[j].ishaschildren==1){
        					var temp2='<li><a href="#" class="xMenuThree span-font1"><span class="">'+menu[j].name+'</span><em class="em-up2"></em></a><ul></ul></li>';
        					temp2=$(temp2);
        					var p=$(temp2).find("ul");
        					var k= $(temp).find("ul");
        					//增加三级菜单
        					for (var o = 0; o < menu.length; o++) {
								if(menu[o].pid==menu[j].id){
									var m3='<li><a href="#" data-rel="${path}'+menu[o].url+'" class="xMenuThree span-font1" style="padding-left: 84px !important;">'+menu[o].name+'</a></li>';
									$(p[0]).append(m3);
								}
							}
							$(k[0]).append(temp2);
        				}
					}
        			$('.xMenu').append(temp);
        		}
			}
        	a();
        })
        
   function logout(){
    $.messager.confirm('提示','确定要退出?',function(r){
        if (r){
            progressLoad();
            $.post('${path }/logout', function(result) {
                if(result.success){
                    progressClose();
                    window.location.href='${path }';
                }
            }, 'json');
        }
    });
}
        function editUserPwd() {
            parent.$.modalDialog({
                title : '修改密码',
                width : 300,
                height : 250,
                href : '${path }/user/editPwdPage',
                buttons : [ {
                    text : '确定',
                    handler : function() {
                        var f = parent.$.modalDialog.handler.find('#editUserPwdForm');
                        f.submit();
                    }
                } ]
            });
        }
    </script>
</head>
<body>
<div class="xPage">
    <div class="header-title">
        <div class="float logo-div">
            <img class="header-title-img1" src="static/img/logo.png" alt="数盺医疗"/>
        </div>

        <div class="float header-title-div">
            <img src="static/img/header.png">
        </div>
        <div class="admin-div">
                <img src="static/img/usericon.png"  onclick="editUserPwd()"alt="用户头像" class="img1"/>
                <span class="fs_14" onclick="editUserPwd()"><shiro:principal/></span>
                <span class="cursor fs_14"><img src="static/img/msg.png" alt="信息" class="img3">&nbsp;信息</span>
                <span class="cursor fs_14"><img src="static/img/help.png" alt="帮助" class="img4">&nbsp;帮助</span>
                <span onclick='logout()' class="cursor fs_14"><img src="static/img/exit.png" alt="退出" class="img2">&nbsp;退出</span>
        </div>

    </div>
    <div class="xMain">
        <div class="xLeftbox" id="description">
            <ul class="xMenu">

            </ul>
        </div>
        <div class="xRightbox">

        </div>
    </div>
</div>
<script src="static/js/index.js"></script>
<script>
    /*一级菜单鼠标事件*/
    $(".xMenu>li").on({
        "mouseenter": function () {
            $(this).addClass("xMenuonefocus1");
            $(this).addClass("on-bg-li")
        },
        "mouseleave": function () {
            $(this).removeClass("xMenuonefocus1");
            $(this).removeClass("on-bg-li");
        }
    });
    /*二级菜单鼠标事件*/
    $(".xMenuTwo,.xMenuThree").on({

        "mouseenter": function () {
            $(this).addClass("on-bg-two");
        },
        "mouseleave": function () {
            $(this).removeClass("on-bg-two");
        }
    });
    $("a,button").focus(function () {
        this.blur()
    });

</script>
</body>
</html>