<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/commons/global.jsp"%> 



<script type="text/javascript">
	var zTree;

	$(function() {

		var roleId = '${id}';
		
		var setting = {
				check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true
					}
				}
			};
		
		$.ajax({
			url:'${path }/resource/allMenuTree',
			type:'post',
			dataType:'json',
			data:{roleId:roleId},
			success:function(data){
				zTree = $.fn.zTree.init($("#resourceTree"), setting,data)
			}
		})

		$('#roleGrantForm').form({
			url : '${path }/role/grant',
			onSubmit : function() {
				progressLoad();
				var isValid = $(this).form('validate');
				if (!isValid) {
					progressClose();
				}
				//var checknodes = resourceTree.tree('getChecked');
				var nodes = zTree.getCheckedNodes(true);
				var ids = [];
				if (nodes && nodes.length > 0) {
					for (var i = 0; i < nodes.length; i++) {
						ids.push(nodes[i].id);
					
					}
				}
				$('#resourceIds').val(ids);
				return isValid;
			},
			success : function(result) {
				progressClose();
				result = $.parseJSON(result);
				if (result.success) {
					parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
					parent.$.modalDialog.handler.dialog('close');
				} else {
					parent.$.messager.alert('错误', result.msg, 'error');
				}
			}
		});
	});

	function checkAll() {
		/* var nodes = resourceTree.tree('getChecked', 'unchecked');
		if (nodes && nodes.length > 0) {
			for (var i = 0; i < nodes.length; i++) {
				resourceTree.tree('check', nodes[i].target);

			}
		}
		var nodes2 = resourceTree.tree('getChecked', 'unchecked'); */
		 zTree.checkAllNodes(true);
	}
	function uncheckAll() {
		zTree.checkAllNodes(false);
/* 		var nodes = resourceTree.tree('getChecked');
		if (nodes && nodes.length > 0) {
			for (var i = 0; i < nodes.length; i++) {
				resourceTree.tree('uncheck', nodes[i].target);
			}
		} */

	}
	function checkInverse() {
		var nodes = zTree.getNodes();
		if (nodes && nodes.length > 0) {
			for (var i = 0; i < nodes.length; i++) {
				
				if(nodes[i].checked){
					zTree.checkNode(nodes[i], false, true);
				}else{
					zTree.checkNode(nodes[i], true, true);
				}
				
				
			}
		}
		/* var unchecknodes = resourceTree.tree('getChecked', 'unchecked');
		var checknodes = resourceTree.tree('getChecked');
		if (unchecknodes && unchecknodes.length > 0) {
			for (var i = 0; i < unchecknodes.length; i++) {
				resourceTree.tree('check', unchecknodes[i].target);
			}
		}
		if (checknodes && checknodes.length > 0) {
			for (var i = 0; i < checknodes.length; i++) {
				resourceTree.tree('uncheck', checknodes[i].target);
			}
		}
		var nodes2 = resourceTree.tree('getChecked', 'unchecked'); */
	}
</script>
<div id="roleGrantLayout" class="easyui-layout"
	data-options="fit:true,border:false">
	<div data-options="region:'west'"
		title="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;系统资源"
		style="width: 300px; padding: 1px;">
		<div class="well well-small">
			<form id="roleGrantForm" method="post">
				<input name="id" type="hidden" value="${id}" readonly="readonly">
				<ul id="resourceTree" class="ztree"></ul>
				<input id="resourceIds" name="resourceIds" type="hidden" />
			</form>
		</div>
	</div>
	<div data-options="region:'center'" title=""
		style="overflow: hidden; padding: 10px;">
		<div>
			<button class="btn btn-success btn-sm" onclick="checkAll();">全选</button>
			<br /> <br />
			<button class="btn btn-warning btn-sm" onclick="checkInverse();">反选</button>
			<br /> <br />
			<button class="btn btn-primary btn-sm" onclick="uncheckAll();">取消</button>
		</div>
	</div>
</div>