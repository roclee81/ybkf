<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%--ctxPath--%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<%--项目路径 --%>
<c:set var="path" value="${ctxPath}" />
<%--静态文件目录 --%>
<c:set var="staticPath" value="${ctxPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>医保数据监控</title>
    <script src="${staticPath }/static/js/jquery-1.10.1.min.js"></script>
    <script src="${staticPath }/static/js/echarts.min.js"></script>
    <script src="${staticPath }/static/js/bootstrap.min.js"></script>
    <script src="${staticPath }/static/js/jquery.mousewheel.js"></script>
    <script src="${staticPath }/static/js/perfect-scrollbar.js"></script>
    <script src="${staticPath }/static/js/window.js"></script>
    <script src="${path }/static/js/jquery.easyui.min.js"></script>
  <!--   <script src="${staticPath }/static/js/bootstrap-datetimepicker.js"></script>
  <script src="${staticPath }/static/js/locales/bootstrap-datetimepicker.zh-CN.js"></script> -->
    <script src="${staticPath }/static/js/jquery.params.js"></script>
	<script src="${staticPath }/static/My97DatePicker/WdatePicker.js"></script>
	<link href="${path }/static/My97DatePicker/skin/WdatePicker.css" rel="stylesheet">
    <link href="${staticPath }/static/css/bootstrap.min.css" type="text/css" rel="stylesheet">
   <!--  <link href="${staticPath }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet"> -->
    <link href="${staticPath }/static/css/perfect-scrollbar.css" type="text/css" rel="stylesheet">
    <link href="${staticPath }/static/css/common.css" type="text/css" rel="stylesheet">
    <link href="${staticPath }/static/css/style.css" type="text/css" rel="stylesheet">
    <link href="${staticPath }/static/css/window.css" type="text/css" rel="stylesheet">
    <link href="${staticPath }/static/css/zTreeStyle.css" rel="stylesheet">
	<link rel="stylesheet" href="${staticPath }/static/css/combo.select.css">
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/gray/easyui.css" />
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${staticPath }/static/easyui/themes/icon.css" />
	<script type="text/javascript">
        $(document).ready(function ($) {
            var $container = $('#description');
            var $status = $('#status');
            $container.perfectScrollbar({minScrollbarLength: 100});
            
        	var menu=${menu};
	       	var c= 0;
	       	for (var i = 0; i < menu.length; i++) {
	       		var m= menu[i];	       		
	       		//1级菜单
	       		if(m.levels==1){
	       			c=c+1;
	       			var temp= '<li class="fs_16" >'+m.name+'</li>';
	       			$('.index-header-ul').append(temp);
	       			  for(var j = 0; j < menu.length; j++){	       
	       				if(m.id==menu[j].pid && c==1){	       					
	       					var temp2='<li><a href="#" data-rel=${path}'+menu[j].url+' class="xMenuThree span-font1  li-left">'+menu[j].name+'<em></em></a></li>'
	       					$('.xLeftbox').find("ul").eq(c-1).append(temp2);
	       					
	       				} else if(m.id==menu[j].pid && c!=1){
	       					var temp2='<li><a href="#" data-rel=${path}'+menu[j].url+' class="xMenuThree span-font1  li-left">'+menu[j].name+'<em></em></a></li>'	       					
	       					$('.xLeftbox').find("ul").eq(c-1).append(temp2);
	       				}
	       			} 
	       			$('.xLeftbox ul').eq(c-1).find("a:first").addClass("once");
	       		}	
			}
	       	 $("#out").click(function(){
	       		$.ajax({
	       		  type: 'POST',
	       		  url: '${ctxPath}/logout',
	       		  success: function(result){
	       			  result = $.parseJSON(result);
	       			  if(result.success){
	       				  window.location.href='login';
	       			  }
	       		  }
	       		});
	       	}) 
        });
         
    </script>
    <style>
        .tab-menu{position: static !important;margin-left:400px;}
    </style>
</head>
<body>
 <div class="xPage">
    <div class="header-title">
        <div class="logo-div"></div>
        <div class="tab-menu" >
            <ul class="index-header-ul">          	
            </ul>
        </div>

         <div class="admin-div">
            <span class="editUser">
            	<span class="fs_14"><img src="${staticPath }/static/img/menu/msg.png" alt="信息" class="img3 go-admin-msg">&nbsp;</span>
	            <img src="${staticPath }/static/img/menu/admin.png" alt="用户头像" class="img1 go-admin-msg"/>
	            <span class="fs_14 go-admin-msg" >${userName}</span>
	            <input type="hidden" id="userId" value="${userId}"/>
            </span>
            <span style="height: 70px" class="border-rgt padding-left10"></span>
            <button type="button" id="out" class="btn out-btn">退出</button>
        </div> 
    </div>
    <div class="xMain">
        <div class="xLeftbox" id="description">
        	 <ul class="xMenu margin-top21" ></ul>
        	 <ul class="xMenu margin-top21" ></ul>
        	 <ul class="xMenu margin-top21" ></ul>
        	 <ul class="xMenu margin-top21" ></ul>
        	 <ul class="xMenu margin-top21" ></ul>
        	 <ul class="xMenu margin-top21" ></ul>
        </div>
        <div class="xRightbox"></div>
    </div>
</div>
<!--个人中心-弹出层-->
<div class="adminBgDiv"></div>
<div class="adminDialogDiv" style="display: none; ">
    <div class="pop-up bg-color1">
        <table class="body-width admin-table">
            <tr>
                <td>用户中心</td>
                <td class="text-right padding-right20">
                    <img src="${staticPath }/static/img/close.png" id="admin-closes">
                </td>
            </tr>
        </table>
    </div>
    <!--选项卡-->
    <div class="gauge-title-div  padding-bom6">
        <table class="body-width">
            <tr>
                <td>
                    <div class="tab-tables" style="padding-left: 2%">
                        <ul class="admin-tab">
                            <li class="on padding-left0 margin-left0">个人信息</li>
                            <li>修改密码</li>
                        </ul>
                        <div class="clear"></div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="admin-tab-boxs">
        <!--用户信息-->
        <div class="ks-fy-zb">
            <table class="admin-msg-table">
                <tr>
                    <td rowspan="3" class="text-center">
                        <img src="${staticPath }/static/img/user-icon.png" alt="">
                        <p>${userName}</p>
                    </td>
                    <td>用户名：<span>${userName}</span></td>
                    <td>性别：<span id="sex"></span></td>
                    <td>年龄：<span id="age"></span></td>
                </tr>
                <tr>
                    <td>科室名：<span id="ksmc"></span></td>
                    <td>角色：<span id="role"></span></td>
                </tr>
                <tr>
                    <td colspan="2">手机号<input type="text" style="width:158px;"id="phone"  name="phone" /></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3"><button class="save-msg-btn" type="button" onclick="savePerInfo()">保存</button></td>
                </tr>
            </table>
        </div>
        <!--修改密码-->
        <div class="ks-fy-zb" style="display: none">
            <table class="update-psd-table">
                <tr>
                    <td><span>*</span>原始密码</td>
                    <td><input type="password" id="oldPassword"></td>
                </tr>
                <tr>
                    <td><span>*</span>重置密码</td>
                    <td><input name="userPassword" id="password" style="width:158px;" type="password" validateOnCreate="false"
                       class="easyui-validatebox" validType="length[1,16]"  data-options="required:true"></td>
                </tr>
                <tr>
                    <td><span>*</span>确认密码</td>
                    <td><input type="password" name="repassword" id="repassword" required="true" class="easyui-validatebox" 
                    	validType="equalTo['#password']" invalidMessage="两次输入密码不匹配"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button class="save-msg-btn" type="button" onclick="savePasswordInfo()">保存</button></td>
                </tr>
            </table>
        </div>
    </div>
</div>
<script src="${staticPath }/static/js/index.js"></script>
<script>
    $(function() {
    	var id = ${index};
        //var id = $.query.get("id");
        $(".index-header-ul li").eq(id).addClass("on").siblings().removeClass("on");
        $(".xLeftbox > ul").eq(id).css("display", "block").siblings().css("display", "none");
        $(".xLeftbox > ul").eq(id).find('a').eq(0).trigger('click');
        $(".xLeftbox > ul").eq(id).find('a').eq(0).find("em").addClass("xMenuonefocus");

        //选项卡
        $(".tab-menu ul li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".xLeftbox > ul").eq(index).css("display", "block").siblings().css("display", "none");
            $(".xLeftbox > ul").eq(index).find('a').eq(0).trigger('click');
            $(".xMenuonefocus").removeClass("xMenuonefocus");
            $(".xLeftbox > ul").eq(index).find('a').eq(0).find("em").addClass("xMenuonefocus").trigger('click');
        });

        $(".xMenu>li").click(function () {
            var index = $(this).index();
            $(".xMenuonefocus").removeClass("xMenuonefocus");
            $(this).find("em").addClass("xMenuonefocus");
        });
        
        /*弹出框*/
        $(".go-admin-msg").click(function () {
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".adminBgDiv").css({display: "block", height: $(document).height()});
            $(".adminDialogDiv").css("display", "block");
            document.documentElement.scrollTop = 0;
			getUserInfo();
        });
        $(".adminBgDiv,#admin-closes").click(function () {
            $(".adminBgDiv").css("display", "none");
            $(".adminDialogDiv").css("display", "none");
        });
        /*弹出层选项卡*/
        $(".admin-tab>li").click(function () {
            $(this).addClass("on").siblings().removeClass("on");
            //切换选中的按钮高亮状态
            var index = $(this).index();
            //获取被按下按钮的索引值，需要注意index是从0开始的
            $(".admin-tab-boxs > div").eq(index).css("display", "block").siblings().css("display", "none");

        });
        
        $.extend($.fn.validatebox.defaults.rules, {  
   		    /*必须和某个字段相等*/
   		    equalTo: {
	   		    validator:function(value,param){
	   		    return $(param[0]).val() == value;
   		    },
   		    	message:'字段不匹配'
   		    }
         });
        
        $("a,button").focus(function () {
            this.blur()
        });     
        
    });
    
    function getUserInfo(){
    	$.ajax({
  		  type: 'POST',
  		  url: '${path}/user/getUserInfo',
  		  success: function(result){
  			var data = $.parseJSON(result);
			$.each(data,function(index,value){
				if(index=='phone'){
					$("#"+index).val(value);
				}
				$("#"+index).text(value);
			});
  		  }
  		});
    }
    // 个人信息保存按钮
    function savePerInfo(){
    	var phone = $("#phone").val();
    	$.ajax({
  		  type: 'POST',
  		  url: '${path}/user/savePerInfo',
  		  data:{'phone':phone},
  		  success: function(result){
  			$.messager.alert('消息','修改成功','info');
  		  },
  		  datatype:'json'
  		});
    }
    // 密码查询保存按钮
    function savePasswordInfo(){
    	var oldPassword = $("#oldPassword").val();
    	var password = $("#password").val();
    	var repassword = $("#repassword").val();
    	if(oldPassword==''||oldPassword==null){
    		$.messager.alert('消息','请输入原始密码','warn');
    		return false;
    	}
    	if(password==''||password==null){
    		$.messager.alert('消息','请输入重置密码','warn');
    		return false;
    	}
    	if(password==repassword){
        	$.ajax({
        		type:"post",
        		url:'${path}/user/editUserPwd',
        		data:{'oldPwd':oldPassword,'pwd':password},
        		success:function(result){
        			var data = $.parseJSON(result);
        			if(data.success)
        			{
        				$.messager.alert('消息',data.msg,'info');
        			}else{
        				$.messager.alert('消息',data.msg,'info');
        			}
        		}
        	});
    	}

    }
</script> 
</body>
</html>
