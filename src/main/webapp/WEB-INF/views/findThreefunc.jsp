<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/commons/basejs.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>三级菜单</title>
</head>
<body class="f2f2f2">

   	<div class="width:1200px;margin:15px auto;background:#fff;position:relative;">
		<div class="margin:0 auto;width:1198px;border:1px ;border-top:none;padding:0;border-top:1px solid #d6d6d6">
			<div style="width:1180px;margin:0 auto">
				<ul style="list-style-type: none">
				<c:if test="${empty page}"><span>没参数</span></c:if>
				 <c:forEach items="${page}" var="m" varStatus="vs">
					<li style="float:left;padding-top:6px;padding-left: 6px"><a href="#">
							<div style="width:265px;height:160px;overflow:hidden;position:relative">
								<a href="#"   onclick="goPage(${m.url})" ><img src="#"  style="width:265px;height:160px"/></a>
							</div>
							<h5>${m.name}</h5> <!--<div class="j_price">￥700</div>-->
							 <div style="height:20px;width:240px;padding:10px 15px 10px 10px;overflow:hidden;line-height:20px">
								<div style="float:left;padding-left:12px;background:url(../images/star01.png) no-repeat left center;font-size:12px;color:#999;width:88px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis"></div>
								<div style="float:right">
									
								</div>
								<div style="clear:both"></div>
							</div> 
					</a></li> 
					</c:forEach> 
				</ul>
			</div>
		</div>
	</div>

</body>
<script>
function goPage(url){
    if (url && url.indexOf("http") == -1) {
    	if(url!=null && url.charAt(0)!="/"){
    		url = '${path }/' + url+"?id="+id;
    	}else{
    		url = '${path }' + url+"?id="+id;
    	}
    }
    console.log(url);
    $('#maincontainer').attr('src',url);
};

</script>


</html>