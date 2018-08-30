function updateDatagridHeader(datagrid)
{
	var panel = $(datagrid).datagrid('getPanel');
 	var tr = panel.find('.datagrid-header-row');
 	tr.css({"background":"#f0f7ff","height":"36px","text-align":"center","font-size":"14px","font-family": "MyriadPro-Regular","color": "#276AB0","font-weight": "500"});
}
function updateDatagridPager(datagrid)
{
	var pager= $(datagrid).datagrid('getPager');
	 $(pager).pagination({
			layout:['first','prev','next','last']
	 });
}
function changeRowHeader(datagrid){
  	var opts = $(datagrid).datagrid('options');
    if(opts.rownumbers){
        var dgPanel = $(datagrid).datagrid('getPanel');
        var tdRownumber = dgPanel.find('.datagrid-header-rownumber').html("序号");
    }
}