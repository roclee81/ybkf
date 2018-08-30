//弹出层 违规
function wgDocuments_popLayer(name,value,flag,req,ksOrys,num,title,field){
	var model;
	getPopLayer();
	var syear = $("#selectYear").val();
	var smonth = $("#selectMonth").val();
	var cblxbm = $("#cblxbm").val();
	if(paramName=='ysgh'){
		model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,ysgh:data,"methodFlag":methodFlag}
	}
	if(paramName=='ksbm'){
		model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,ksbm:data,"methodFlag":methodFlag}
	}
	if(paramName=='bzmc'){
		model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,bzmc:data,"methodFlag":methodFlag}
	}
	$.ajax({
		type: "POST",
		url:"/ybkf/costStruct/selectEcharsData",    			
	    cache: false,
	    async : false,
	    dataType: "json",	
		data:model,	
		success:function(data){
			if(JSON.stringify(data) == "{}"){
				option_bar4_layer.xAxis[0].data=[];
				option_bar4_layer.series[0].data=[0]; 	
				myChartBar_upLayer_order.setOption(option_bar4_layer);	
		 	    	}else{
		 	    		var wgdjs;
		 	    		var wgmc;
		 	    		$.each(data,function (index,obj){
		 	    			if(index.indexOf("value0")>-1){
		 	    				wgdjs = obj;
		 	    			};
		 	    			if(index.indexOf("value1")>-1){
		 	    				wgmc  = obj;
		 	    			}
		 	    		});
		 	    		option_bar4_layer.xAxis[0].data=wgmc;
		 	    		option_bar4_layer.series[0].data=wgdjs;		 	    		
		 	    		myChartBar_upLayer_order.setOption(option_bar4_layer);		 	    		
		 	    	}
		}
	
	}); 
	
	$("#wggzOrderLayer").datagrid({
	     url : url,
	     fit : false,
	     striped : true,
	     queryParams:model,
	  	 singleSelect:true,
	  	 rownumbers:true,
	  	 rownumberHeader:'序号',
	     pagination : true,
	     singleSelect : true,
	     pageSize : 10,
	     pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
	     
	     columns : [ [
	       {
	         width : '50%',
	         title : title,
	         field : field
	         
	      },  {
	         width : '50%',
	         title : '违规单据数',
	         field : 'wgdjs',
	         formatter: function (value, rowData, rowIndex) { 
	                 return "<a field='clickDataGrid' style='color:green' href='javacript:;' >" + value + "</a>";;
	          }
	     }   
	     ] ],
	     onBeforeLoad: function (param) {
	     	updateDatagridHeader(this);
        changeRowHeader(this);
	     },
	     onLoadSuccess:function(data){
	    	 var arr = [];
	    	 if(field=="ysxm"){
	    		 for(var i=0;i<data.rows.length;i++){
					 arr.push(data.rows[i].ysbm);
				 }
	    		 for(var i=0;i<data.rows.length;i++){
		    		(function(num){
		    			 $("a[field='clickDataGrid']")[i].onclick=function(){
			    			 violationSummary(arr[num]);
			    			 hiddenViolationSummaryAndDocument();
			    		 }; 
		    		 })(i);
		    	 };
			 }else if(field=="ksmc"){
				 for(var i=0;i<data.rows.length;i++){
					 arr.push(data.rows[i].ksbm);
				 }
	    		 for(var i=0;i<data.rows.length;i++){
	    			 (function(num){
		    			 $("a[field='clickDataGrid']")[i].onclick=function(){
			    			 violationSummary(arr[num]);
			    			 hiddenViolationSummaryAndDocument();
			    		 }; 
		    		 })(i);
		    	 };
			 }else{
				 for(var i=0;i<data.rows.length;i++){
					 arr.push(data.rows[i].gzbm);
				 }
	    		 for(var i=0;i<data.rows.length;i++){
		    		(function(num){
		    			 $("a[field='clickDataGrid']")[i].onclick=function(){
			    			 violationSummary(arr[num]);
			    			 hiddenViolationSummaryAndDocument();
			    		 }; 
		    		 })(i);
		    	 };
			 };
       
	     }
	 });
};

var column1 = [
                 {
                     width : '13%',
                     title : '就诊日期',
                     field : 'jzrq' 
                 },{
                     width : '15%',
                     title : '身份证号',
                     field : 'sfzhm'
                     
                 },  {
                     width : '10%',
                     title : '患者姓名',
                     field : 'hzxm',
                     formatter: function (value, rowData, rowIndex) {       
                             return "<a style='color:green' href='javascript:void(0);' onclick=violationDetails('" + rowData.mzlsh + "');>" + value + "</a>";;
                      }
                 }, {
                     width : '10%',
                     title : '参保类型',
                     field : 'cblx',
                     formatter: function (value, rowData, rowIndex) {       
                    	 switch (value) {
                         case '390':
                             return '城乡居民';
                         case '391':
                             return '城镇职工';
                         case '392':
                             return '省直医保';
                         default:
                        	 return '-';
                         }
                  }
                 } , {
                     width : '10%',
                     title : '科室',
                     field : 'ksmc'
                
                 }, {
                     width : '10%',
                     title : '医师',
                     field : 'ysxm'
                
                 }, {
                     width : '15%',
                     title : '门规病种类型',
                     field : 'jbmc'
                
                 },{
                     width : '15%',
                     title : '整单违反规则',
                     field : 'ifzdwg',
                     hidden: true
                 }, {
                     width : '10%',
                     title : '开立原因',
                     field : 'klyy',
                     formatter: function (value){
                    	 if(value==null){
                    		 return '-'; 
                    	 }else{
                    		 return "<span title='" + value + "'>" + value + "</span>" 
                    	 }
                     }
                
                 }, {
                     width : '10%',
                     title : '医疗费(元)',
                     field : 'ylf'
                
                 }, {
                     width : '10%',
                     title : '医保内金额(元)',
                     field : 'ybnje'   
                 }    
                 ];
var column2 = [
               {
                   width : '10%',
                   title : '就诊日期',
                   field : 'jzrq' 
               },{
                   width : '15%',
                   title : '身份证号',
                   field : 'sfzhm'
                   
               },  {
                   width : '10%',
                   title : '患者姓名',
                   field : 'hzxm',
                   formatter: function (value, rowData, rowIndex) {       
                           return "<a style='color:green' href='javascript:void(0);' onclick=violationDetails('" + rowData.mzlsh+ "');>" + value + "</a>";;
                    }
               }, {
                   width : '10%',
                   title : '参保类型',
                   field : 'cblx'
               } , {
                   width : '10%',
                   title : '就医方式',
                   field : 'jyfs',
                    formatter:function(value,row,index){
                   	 switch (value) {
                   	 case 11:
                    	 	return "普通门诊";
                    	 case 13:
            	        	 return "门诊大病";
                    	 case 15:
            	        	 return "异地门诊";
                    	 case 21:
            	        	 return "普通住院";
                    	 case 22:
            	        	 return "特殊病种住院";
                    	 case 25:
            	        	 return "异地住院";
                    	 case 51:
            	        	 return "生育门诊";
                    	 case 52:
            	        	 return "生育住院";
                    	 case 71:
            	        	 return "工伤门诊";
                    	 case 72:
            	        	 return "工伤住院";
       		         default:
       		        	 return "-";
       	        	 }
       	         } 
              
               }, {
                   width : '10%',
                   title : '科室',
                   field : 'ksmc'
              
               }, {
                   width : '10%',
                   title : '医师',
                   field : 'ysxm'
              
               }, {
                   width : '10%',
                   title : '疾病名称',
                   field : 'ryzd'
              
               }, {
                   width : '10%',
                   title : '开立原因',
                   field : 'klyy',
                   formatter: function (value){
                  	 if(value==null){
                  		 return '-'; 
                  	 }else{
                  		 return "<span title='" + value + "'>" + value + "</span>" 
                  	 }
                   }
              
               }, {
                   width : '10%',
                   title : '整单违反规则',
                   field : 'gzmc',
                   hidden:true,
                   formatter: function (value){
                  	 if(value==null){
                  		 return '-'; 
                  	 }else{
                  		 return "<span title='" + value + "'>" + value + "</span>" 
                  	 }
                   }
              
               }, {
                   width : '10%',
                   title : '医疗费(元)',
                   field : 'ylf'
              
               }, {
                   width : '10%',
                   title : '医保内金额(元)',
                   field : 'ybtczf'
              
               }
                 
               ]

//弹出层->违规汇总
  function violationSummary(value) {
  	 $(".nm-div-name-div").css("display","none");
  	 $(".nm-div").css("display","block");
	var model;
	var req;
	var syear = $("#selectYear").val();
	var smonth = $("#selectMonth").val();
	var cblxbm = $("#cblxbm").val();
	$(".nm-div").css("display","block");
	if(paramName=='ksbm'){   //传递参数  科室编码
		if(numLX==2){		 //普通门诊 弹出层
			req = "/ybkf/generalclinic/mzViolationsDocuments";
			if(field=='ysxm'){
				model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,"ksbm":data,"ysgh":value};
				column2[9].hidden = false;
				
				var col = column2;
			}
			if(field=='gzmc'){
				model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,"ksbm":data,"gzbm":value}
				column2[9].hidden = true;
				
				var col = column2;
			}
		}else if(numLX==1){	 //门规病种 弹出层
			
			if(field=='ysxm'){
				req = "/ybkf/mgquota/mgViolationsDocumentsDepart";
				model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,"ksbm":data,"ysgh":value};
				column1[7].hidden = false;
				var col = column1;
			}
			if(field=='gzmc'){
				req = "/ybkf/mgquota/mgViolationsDocuments";
				model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,"ksbm":data,"gzbm":value};
				column1[7].hidden = true;
				var col = column1;
			}
		}
	}
	if(paramName=='bzmc'){   //传递参数  病种名称
		if(numLX==0){		 //住院病种 弹出层
			
		}else if(numLX==1){  //门规病种 弹出层
			if(field=='ksmc'){
				req = "/ybkf/mgquota/mgViolationsDocumentsDepart";
				model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,bzmc:data,"ksbm":value}
				column1[7].hidden = false;
				var col = column1;
			}
			if(field=='gzmc'){
				req = "/ybkf/mgquota/mgViolationsDocuments";
				model = {"syear":syear,"smonth":smonth,"cblxbm":cblxbm,bzmc:data,"gzbm":value}
				column1[7].hidden = true;
				var col = column1;
			}
		}
		
	}
   	 $('#violationSummaryLayer').datagrid({
        url : req,
        fit : false,
        striped : false,
        queryParams: model,
        rownumbers:true,
        rownumberHeader:'序号',
        pagination : true,
        singleSelect : true,
        pageSize : 10,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
        columns : [col],
        onBeforeLoad: function (param) {
        	updateDatagridHeader(this);
          changeRowHeader(this);
       	}
    }); 
   	
  };
  
// 弹出层  违规详情  
function violationDetails(mzlsh){
	$(".nm-div-name-div").css("display","block");	
	var req;
	if(numLX==0){		// 住院违规详情
		
	}else if(numLX==1){ // 门规违规详情
		req = "/ybkf/mgquota/mzmgdetails";
		model = {bzmc:data,"mzlsh":mzlsh};
	}else if(numLX==2){ // 门诊违规详情
		model = {"ksbm":data,"mzlsh":mzlsh};
		if(field=="gzmc"){
			req = "/ybkf/generalclinic/getwholedocumentdetails";
		}else{
			req = "/ybkf/generalclinic/mzViolationdetails";
		}
	} 
 	$('#violationDetailsLayer').datagrid({
      url : req,
      rownumbers:true,
      rownumberHeader:'序号',
      fit : false,
      striped : false,
      queryParams: model,
      pagination : true,
      singleSelect : true,
      pageSize : 10,
      pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
      columns : [ [
      {
          width : '10%',
          title : '日期',
          field : 'rq' 
      },{
          width : '10%',
          title : '时间',
          field : 'sj',
      },  {
          width : '10%',
          title : '项目编码',
          field : 'xmbm'
     
      }, {
          width : '10%',
          title : '项目名称',
          field : 'xmmc',
          formatter: function (value){
         	 if(value==null){
         		 return '-'; 
         	 }else{
         		 return "<span title='" + value + "'>" + value + "</span>" 
         	 }
          }
      } , {
          width : '10%',
          title : '违反规则',
          field : 'wfgz',
          formatter: function (value){
         	 if(value==null){
         		 return '-'; 
         	 }else{
         		 return "<span title='" + value + "'>" + value + "</span>" 
         	 }
          }
     
      }, {
          width : '10%',
          title : '提示说明',
          field : 'tssm',
          formatter: function (value){
         	 if(value==null){
         		 return '-'; 
         	 }else{
         		 return "<span title='" + value + "'>" + value + "</span>" 
         	 }
          }
     
      }, {
          width : '10%',
          title : '科室',
          field : 'ksmc'
     
      }, {
          width : '10%',
          title : '医师',
          field : 'ysxm'
     
      }, {
          width : '10%',
          title : '规格',
          field : 'ypgg'
     
      }, {
          width : '10%',
          title : '单位',
          field : 'dw'
     
      }, {
          width : '10%',
          title : '用法',
          field : 'yf'   
      },{
          width : '10%',
          title : '用量',
          field : 'yl'   
      },{
          width : '10%',
          title : '单价(元)',
          field : 'dj'
      }, {
          width : '10%',
          title : '数量',
          field : 'sl'   
      }, {
          width : '10%',
          title : '金额(元)',
          field : 'je'   
      }, {
          width : '10%',
          title : '医保内金额(元)',
          field : 'ybnje'   
      }     
      ] ],
      onBeforeLoad: function (param) {
      	updateDatagridHeader(this); 
     	changeRowHeader(this);
      }    
  });
}  
// 弹出层
function getPopLayer(){
	$(".BgDiv3").css("z-index", "100");
    $(".BgDiv3").css({display: "block", height: $(document).height()});
    $(".DialogDiv3").css("top", "5%");
    $(".DialogDiv3").css("display", "block");
    document.documentElement.scrollTop = 0;
}
// 弹出层 点击事件触发方法 0--住院、1--门规、2--门诊
function clickLeft(name,value,ksOrys,num){
	$(".tk-tabs li").eq(0).addClass("on").siblings().removeClass("on");
	hiddenInterface();
		paramName = name;
		data = value;
		lx = ksOrys;
		numLX = num;
		field = 'gzmc';
    	switch (numLX) {
		case 0:			
			break;
		case 1:
			methodFlag='wggzOrder';
			url = '/ybkf/mgquota/wggzOrderTable';
			break;
		case 2:
			methodFlag='mzwggzOrder';
			url = '/ybkf/generalclinic/mzwggzOrderTable';
			break;

		default:
			break;
		};
    	wgDocuments_popLayer(paramName,data,methodFlag,url,lx,numLX,'违规规则','gzmc');
    
};
function clickRight(name,value,ksOrys,num){
	paramName = name;
	data = value;
	lx = ksOrys;
	numLX = num;
	field = 'ysxm';
	if(lx=='ys'){
    	switch (numLX) {
		case 0:
			
			break;
		case 1:
			methodFlag='mgwgDoctorOrder';
			url = '/ybkf/mgquota/mgwgDoctorOrderTable';
			break;
		case 2:
			methodFlag='mzwgDoctorOrder';
			url = '/ybkf/generalclinic/mzwgDoctorOrderTable';
			break;

		default:
			break;
		};
		$(".tk-tabs li").eq(1).addClass("on").siblings().removeClass("on");
    	wgDocuments_popLayer(paramName,data,methodFlag,url,lx,numLX,'医师名称','ysxm');
    };
    if(lx=='ks'){
    	field = 'ksmc';
    	switch (numLX) {
		case 0:
			
			break;
		case 1:
			methodFlag='wgdepartOrder';
			url = '/ybkf/mgquota/wgdepartOrderTable';
			break;
		case 2:
			methodFlag='mzwgdepartOrder';
			url = '/ybkf/generalclinic/mzwgdepartOrderTable';
			break;

		default:
			break;
		};
    	wgDocuments_popLayer(paramName,data,methodFlag,url,lx,numLX,'科室名称','ksmc');
    }
    
}

// 隐藏违规单据汇总  以及违规详情
function hiddenViolationSummaryAndDocument(){
 	$(".nm-div").css("display","blcok");
 	$(".nm-div-name-div").css("display","none");
}
/***********************************************普通住院->违规汇总、违规详情 **********************************************/
//违规界面--违规汇总展示与隐藏
function showOrHidden(lx){
	if(lx=='order'){
		$(".nm-div").css("display","block");
		$(".ks-nm-div").css("display","none");
	}else {
		$(".nm-div").css("display","none");
		$(".ks-nm-div").css("display","block");
	}
};

//违规界面--汇总、详情隐藏
function hiddenInterface(){
	$(".nm-div-name-div").css("display", "none");
	$(".nm-div").css("display", "none");
	$(".ks-nm-div").css("display", "none");
	$(".ks-nm-div-name-div").css("display", "none");
}

function zyIllegalDocuments(id,data1,lx1){
	$(".ks-nm-div-name-div").css("display", "none");
	$(".nm-div-name-div").css("display", "none");
	 showOrHidden(lx1);
	 data = data1;
	 lx = lx1;
 	 var cblxbm=$('#cblxbm').val();
     var ksbm = $("#depart").val();
     if(lx=='order'){
    	col_order[8].hidden=true;
     }else{
    	col_order[8].hidden=false;
     }
     var col=col_order;
 	 $(id).datagrid({
      url : '/ybkf/inHospital/illegalDocuments',
      fit : false,
      striped : false,
      queryParams: {          
      	syear:$('#selectYear').val(),
      	smonth:$('#selectMonth').val(),
      	cblxbm:cblxbm,
      	data:data,
      	ksbm:ksbm,
      	lx:lx
        } ,
      rownumbers:true,
      rownumberHeader:'序号',
      pagination : true,
      singleSelect : true,
      pageSize : 10,
      pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
      columns : [col],
      onBeforeLoad: function (param) {
      	updateDatagridHeader(this);
     	  changeRowHeader(this);
      },
      onLoadSuccess:function(data){
         window.onresize=function(){                                
            $(id).datagrid('resize');//列表随屏幕大小变化
        }; 
      }    
  });  
}
var col_order=[
 	      {
	          width : '13%',
	          title : '入院日期',
	          field : 'RYRQ' 
	      },{
	          width : '15%',
	          title : '住院号',
	          field : 'ZYH'
	          
	      },  {
	          width : '10%',
	          title : '姓名',
	          field : 'XM',
	          formatter: function (value, rowData, rowIndex) {       
	                  return "<a style='color:green' href='javascript:void(0);' onclick=zyViolationDetails('" + rowData.ZYH + "','"+lx+"','"+data+"');>" + value + "</a>";;
	           }
	      }, {
	          width : '10%',
	          title : '性别',
	          field : 'XB'
	      } , {
	          width : '10%',
	          title : '年龄',
	          field : 'NL'
	     
	      }, {
	          width : '10%',
	          title : '医保卡号',
	          field : 'YBKH'
	     
	      }, {
	          width : '15%',
	          title : '科室 ',
	          field : 'KS'
	     
	      },
	      {
	          width : '15%',
	          title : '医师 ',
	          field : 'YS'
	     
	      }
	      ,{
	          width : '10%',
	          title : '是否整单违规',
	          field : 'IFZDWG',
	          hidden: true
	      }
	      ,{
	          width : '10%',
	          title : '入院诊断',
	          field : 'RYZD'
	     
	      },{
	          width : '10%',
	          title : '住院天数',
	          field : 'ZYTS'
	     
	      },{
	          width : '10%',
	          title : '住院医疗费用(元) ',
	          field : 'YLF'
	     
	      },{
	          width : '10%',
	          title : '医保统筹支付(元)',
	          field : 'YBTCZF'
	     
	      }, {
	          width : '10%',
	          title : '患者负担(元)',
	          field : 'HZFD'   
	      }    
	      ];

//违规详情
function zyViolationDetails(zyh, lx, data) {
	$(".nm-div-name-div").css("display", "block");
	$(".ks-nm-div-name-div").css("display", "block");
	if (lx == "order") {
		var tempId = "#zyDetails";
	} else {
		var tempId = "#zyDetails_depart";
	}
	var cblxbm = $('#cblxbm').val();
	var ksbm = $("#depart").val();
	var syear = $('#selectYear').val();
	var smonth = $('#selectMonth').val();
	$(tempId).datagrid(
			{
				url : '/ybkf/inHospital/zyviolationDetails',
				fit : false,
				striped : false,
				queryParams : {
					zyh : zyh,
					lx : lx,
					data : data,
					syear : syear,
					smonth : smonth,
					cblxbm : cblxbm,
					ksbm : ksbm
				},
				rownumbers : true,
				rownumberHeader : '序号',
				pagination : true,
				singleSelect : true,
				pageSize : 10,
				pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500 ],
				columns : [ [
						{
							width : '10%',
							title : '日期',
							field : 'RQ'
						},
						{
							width : '10%',
							title : '时间',
							field : 'SJ',
						},
						{
							width : '10%',
							title : '项目编码',
							field : 'XMBM'

						},
						{
							width : '10%',
							title : '项目名称',
							field : 'XMMC',
							formatter : function(value) {
								if (value == null) {
									return '-';
								} else {
									return "<span title='" + value + "'>"
											+ value + "</span>"
								}
							}

						},
						{
							width : '10%',
							title : '违反规则',
							field : 'WFGZ',
							formatter : function(value) {
								if (value == null) {
									return '-';
								} else {
									return "<span title='" + value + "'>"
											+ value + "</span>"
								}
							}

						},
						{
							width : '10%',
							title : '提示说明',
							field : 'TSSM',
							formatter : function(value) {
								if (value == null) {
									return '-';
								} else {
									return "<span title='" + value + "'>"
											+ value + "</span>"
								}
							}

						},{
					          width : '10%',
					          title : '开立原因',
					          field : 'KLYY',
					          formatter: function (value){
					         	 if(value==null){
					         		 return '-'; 
					         	 }else{
					         		 return "<span title='" + value + "'>" + value + "</span>" 
					         	 }
					          }
					     
					      }, {
							width : '10%',
							title : '科室',
							field : 'KSMC'

						}, {
							width : '10%',
							title : '医师',
							field : 'YSXM'

						}, {
							width : '10%',
							title : '规格',
							field : 'YPGG'

						}, {
							width : '10%',
							title : '单位',
							field : 'DW'

						}, {
							width : '10%',
							title : '用法',
							field : 'YF'
						}, {
							width : '10%',
							title : '用量',
							field : 'YL'
						}, {
							width : '10%',
							title : '单价(元)',
							field : 'DJ'
						}, {
							width : '10%',
							title : '数量',
							field : 'SL'
						}, {
							width : '10%',
							title : '金额(元)',
							field : 'JE'
						}, {
							width : '10%',
							title : '医保内金额(元)',
							field : 'YBNJE'
						} ] ],
				onBeforeLoad : function(param) {
					updateDatagridHeader(this);
					changeRowHeader(this);
				},
        onLoadSuccess:function(data){
            window.onresize=function(){                                
                $(tempId).datagrid('resize');//列表随屏幕大小变化
            };
        }
			});
}
