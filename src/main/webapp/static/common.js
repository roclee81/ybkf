function updateDatagridHeader(datagrid)
{
	var panel = $(datagrid).datagrid('getPanel');
 	var tr = panel.find('.datagrid-header-row');
 	tr.css({"background":"#DCDCDC","height":"38px","text-align":"left"});
}
function updateDatagridPager(datagrid)
{
	var pager= $(datagrid).datagrid('getPager');
	 $(pager).pagination({
			layout:['first','prev','next','last']
	 });
}