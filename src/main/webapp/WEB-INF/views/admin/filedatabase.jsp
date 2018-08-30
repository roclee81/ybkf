<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ include file="/commons/global.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${path }/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="${path }/static/css/zTreeStyle.css" rel="stylesheet">
<script src="${path }/static/js/jquery-1.10.1.min.js"></script>
<script src="${path }/static/js/Wen_js/jquery.ztree.core.js"></script>
<script src="${path }/static/js/Wen_js/jquery.ztree.excheck.min.js"></script>
<script src="${path }/static/js/Wen_js/jquery.ztree.exedit.min.js"></script>



<style>
.floatR{ float:right;}
.ztree li span.button.add {margin-left:2px; margin-right:4px; background-position:-144px 0;}
input{background: #FFFFFF !important;}
.Rename{overflow:hidden; height:0;}
.Rename input{width:80%; border:1px solid #d2d2d2; padding-left:10px; height:28px; font-size:12px;}
.Rename button{width:19%; border:none; height:26px; line-height:26px; margin-left:1%; border-radius:4px; background:url(img/menu/buton.png) no-repeat; color:#fff;}
.Rename p{color:#C23531 !important; font-size:12px; display:none;}
</style>

 <title>决策分析-审核违规</title>
    <style>
        .float-right {
            float: right;
        }

        .gauge-div {
            margin-left: 8px;
        }
        </style>
</head>
<script type="text/javascript">


</script>
<body>

<div class="bg-color" style="min-height:100%;">
    <div class="ys-rc-div Left_Tarr">
    	<div class="H_text">
        	资料目录
        </div>
        <div class="Search">
        	<input type="text" placeholder="搜索资料目录名"/><i></i>
        </div>
        <P id='Add_to'><img src="img/Search/new_t.png" />新建一级目录</P>
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
            	<li><img src="img/Search/new_y.png"/><a href="javascript:;">上传</a></li>
                <li><img src="img/Search/new_v.png"/><a href="javascript:;">下载</a></li>
                <li><img src="img/Search/new_d.png"/><a href="javascript:;">删除</a></li>
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
	<SCRIPT type="text/javascript">
 
	$("#Add_to").click(function () {
			$('.Rename').animate({height:'32px'})
		

			});
	$('#Qd').click(function(){
		var Int=$('#Int').val();
		if(Int!=''&&Int!='请输入目录名'){
			
			var treeNode = 0;
			var treeNode = 0;
			var newCount = 1;
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:Int});
			$('.Rename').animate({height:'0px'});
			$('#Int').val('');
			return false;
			}else{
			$('.Rename').animate({height:'58px'})
			$('.T_we').css({'display':'block'})
				}
		
		});
		<!--
		var setting = {
			view: {
				addHoverDom: addHoverDom,
				removeHoverDom: removeHoverDom,
				selectedMulti: false
			},
			edit: {
				enable: true,
				editNameSelectAll: true,
				showRemoveBtn: true,
				showRenameBtn: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				beforeDrag: beforeDrag,
				beforeEditName: beforeEditName,
				beforeRemove: beforeRemove,
				beforeRename: beforeRename,
				onRemove: onRemove,
				onRename: onRename
			}
		};

		var zNodes =[
			{ id:1, pId:0, name:"济南医保规则", open:true},
			{ id:11, pId:1, name:"济南医保规则-详情"},
			{ id:12, pId:1, name:"济南医保规则-详情"},
			{ id:13, pId:1, name:"济南医保规则-详情"},
			{ id:2, pId:0, name:"济南医保规则", open:false},
			{ id:21, pId:2, name:"济南医保规则-详情"},
			{ id:22, pId:2, name:"济南医保规则-详情"},
			{ id:23, pId:2, name:"济南医保规则-详情"},
			{ id:3, pId:0, name:"济南医保规则", open:false},
			{ id:31, pId:3, name:"济南医保规则-详情"},
			{ id:32, pId:3, name:"济南医保规则-详情"},
			{ id:33, pId:3, name:"济南医保规则-详情"}
		];
		var log, className = "dark";
		function beforeDrag(treeId, treeNodes) {
			return false;
		}
		function beforeEditName(treeId, treeNode) {
			
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeEditName ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			setTimeout(function() {
				
					setTimeout(function() {
						zTree.editName(treeNode);
					
				});
			});
			return false;
		}
		function beforeRemove(treeId, treeNode) {
			className = (className === "dark" ? "":"dark");
			showLog("[ "+getTime()+" beforeRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.selectNode(treeNode);
			return confirm("确认删除" + treeNode.name + " 吗？");
		}
		function onRemove(e, treeId, treeNode) {
			showLog("[ "+getTime()+" onRemove ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name);
		}
		function beforeRename(treeId, treeNode, newName, isCancel) {
			
			className = (className === "dark" ? "":"dark");
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" beforeRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
			if (newName.length == 0) {
				setTimeout(function() {
					var zTree = $.fn.zTree.getZTreeObj("treeDemo");
					zTree.cancelEditName();
					alert("资料名称不能为空.");
				}, 0);
				return false;
			}
			return true;
		}
		function onRename(e, treeId, treeNode, isCancel) {
			showLog((isCancel ? "<span style='color:red'>":"") + "[ "+getTime()+" onRename ]&nbsp;&nbsp;&nbsp;&nbsp; " + treeNode.name + (isCancel ? "</span>":""));
		}
		function showRemoveBtn(treeId, treeNode) {
			return !treeNode.isFirstNode;
		}
		function showRenameBtn(treeId, treeNode) {
			return !treeNode.isLastNode;
		}
		function showLog(str) {
			if (!log) log = $("#log");
			log.append("<li class='"+className+"'>"+str+"</li>");
			if(log.children("li").length > 8) {
				log.get(0).removeChild(log.children("li")[0]);
			}
		}
		function getTime() {
			var now= new Date(),
			h=now.getHours(),
			m=now.getMinutes(),
			s=now.getSeconds(),
			ms=now.getMilliseconds();
			return (h+":"+m+":"+s+ " " +ms);
		}
		
		
				
			

		var newCount = 1;
		function addHoverDom(treeId, treeNode) {
			
			var sObj = $("#" + treeNode.tId + "_span");
			if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
			var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
				+ "' title='add node' onfocus='this.blur();'></span>";
			sObj.after(addStr);
			var btn = $("#addBtn_"+treeNode.tId);
			if (btn) btn.bind("click", function(){
				var zTree = $.fn.zTree.getZTreeObj("treeDemo");
				zTree.addNodes(treeNode, {id:(100 + newCount), pId:treeNode.id, name:"新增文件夹" + (newCount++)});
				return false;
				
			});

		};
		function removeHoverDom(treeId, treeNode) {
			$("#addBtn_"+treeNode.tId).unbind().remove();
		};
		function selectAll() {
			var zTree = $.fn.zTree.getZTreeObj("treeDemo");
			zTree.setting.edit.editNameSelectAll =  $("#selectAll").attr("checked");
		}
		
		$(document).ready(function(){
			$.fn.zTree.init($("#treeDemo"), setting, zNodes);
			$("#selectAll").bind("click", selectAll);
			var H_i=$('.bg-color').height();
			$('.Left_Tarr').css({'height':H_i});
		});
		//-->
	</SCRIPT>
</body>
</html>