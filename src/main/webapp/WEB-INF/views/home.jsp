<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发票管理系统</title>
<script type="text/javascript">
    //var layout_west_tree;
    var menuData;
    $(function() {
        $('#index_layout').layout({fit : true});
        $('#main_layout').layout({fit : true});
        
        $.ajax({
            url:'${path }/resource/tree',
            type:'POST', //GET
            async:true,    //或false,是否异步
            dataType:'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success:function(data,textStatus,jqXHR){
               	menuData = data;
               	$("#left_menu_area").find("ul").remove();
               	var isFirst = true;
               	
                $.each(data,function(){
                	if(this.pid == -1){
                		//Dumper.alert(this); 
                		if(this.id ==0){
                		$("#left_menu_area").append($('<li id='+this.id+'l ><a href="#" onclick="goPage(\''+this.attributes+'\','+this.id+');">'+this.text+'</a></li>'));
                		}else{
                		
                		$("#left_menu_area").append($('<li id='+this.id+'l ><a href="#" onclick="showLv2Menu(\''+this.id+'\');">'+this.text+'</a></li>'));
						}
						
						if(isFirst){
							showLv2Menu(this.id);
							isFirst = false; 
						}
                	}
                });
            }
        });
    });
    
    function showLv2Menu(id){
      var zj=   $("#"+id+"l").find("ul");
      if(zj.length!=0){
    	$("#"+id+"l").find("ul").remove();
    	}else{
    //	$("#"+id+"l").find("ul").remove();
    	$("#"+id+"l").append($('<ul style="ist-style:none"></ul>'));
    	$.each(menuData,function(){
        	if(this.pid == id){
        	  
        		$("#"+id+"l").find("ul").append($('<li style="list-style:none"><a href="#" onclick="goPage(\''+this.attributes+'\','+this.id+');">'+this.text+'</a></li>'));
        	}
        });
        }
    }
    
    function goPage(url,id){
        if (url && url.indexOf("http") == -1) {
        	if(url!=null && url.charAt(0)!="/"){
        		url = '${path }/' + url+"?id="+id;
        	}else{
        		url = '${path }' + url+"?id="+id;
        	}
        }
        console.log(url);
        $('#maincontainer').attr('src',url);
    }

    
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
<style>


</style>
</head>
<body>
    <div id="loading" style="position: fixed;top: -50%;left: -50%;width: 200%;height: 200%;background: #fff;z-index: 100;overflow: hidden;">
        <img src="${staticPath }/static/style/images/ajax-loader.gif" style="position: absolute;top: 0;left: 0;right: 0;bottom: 0;margin: auto;"/>
    </div>
    <div id="index_layout">
        <div class="header_banner" data-options="region:'north',border:false" style="overflow: hidden">
            <div>
                <span style="float: right; padding-right: 20px; margin-top: 15px; color: #333">
                    <i class="fi-torso"></i><b style="color: white;">&nbsp;<shiro:principal/></b>&nbsp;&nbsp; 
                  <%--   <shiro:hasPermission name="/user/editPwdPage"> --%>
                        <a href="javascript:void(0)" onclick="editUserPwd()" class="easyui-linkbutton" plain="true" icon="fi-unlock" title="修改密码"></a>
               <%--      </shiro:hasPermission> --%>&nbsp;&nbsp;
                    <a href="javascript:void(0)" onclick="logout()" class="easyui-linkbutton" plain="true" icon="fi-x" title="安全退出"></a>
                </span>
                <span class="header"></span>
            </div>
        </div>
        <div data-options="region:'center',border:false" style="overflow: hidden;">
            <div id="main_layout">
		     <!--    <div class="top_menu_bar" data-options="region:'north',border:false" style="overflow: hidden;">
	                <span class="top_menu_block"></span>
	                <div class="top_menu">
				        <ul id="top_menu_area" style="margin: 0px;padding:0;"> </ul>
				    </div>
		        </div>  -->
		        <div data-options="region:'west',split:false,border:false" title="" style="width: 231px; overflow: hidden;overflow-y:auto; padding:0px; background-color: #039fe9;">
		            <div class="well well-small" style="padding: 3px 3px 3px 3px;background-color: #FFFFFF;">
		            </div>
		            	<div class="left_menu">
			            	<ul id="left_menu_area" style="margin: 0px;padding:0;">
			                </ul>
		            	</div>
		        </div>
		        <div data-options="region:'center',border:false" style="overflow: hidden; padding: 5px 5px 5px 5px">
		            <iframe id="maincontainer" frameborder=0 width=100% height=100% ></iframe>
		        </div>
		    </div>
        </div>
        <div data-options="region:'south',border:false" style="height: 30px;line-height:30px; overflow: hidden;text-align: center;background-color: #eee" ><!-- 技术支持&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;济南铁路局信息技术所&nbsp;&nbsp;  --><a href="#" target="_blank">济南数昕医疗信息技术有限公司版权所有</a></div>
    </div>
    
    <!--[if lte IE 7]>
    <div id="ie6-warning"><p>您正在使用 低版本浏览器，在本页面可能会导致部分功能无法使用。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank">Internet Explorer 8</a> 或以下浏览器：
    <a href="http://www.mozillaonline.com/" target="_blank">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> / <a href="http://www.operachina.com/" target="_blank">Opera</a></p></div>
    <![endif]-->
    <style>
        /*ie6提示*/
        #ie6-warning{width:100%;position:absolute;top:0;left:0;background:#fae692;padding:5px 0;font-size:12px}
        #ie6-warning p{width:960px;margin:0 auto;}
    </style>
</body>
</html>