/**
 * 办事指南页面数据获取js
 * @author mawenxia
 * 2017-12-25
 */

$(function(){
	checksIsLogin();
	findTransById();
});

/**
 * 通过事项id查询事项的详细信息方法（办事指南）
 */
function findTransById(){
	var id = $.getUrlParam("id");
	$.ajax({
		type : "post",
		dataType : "json",
		url : "f/front/interfaceweb/interfaceTrans/findOne",
		data : {
			"id" : id
		},
		success : function(result){
			$("#wy_banli").attr("onclick","OnlineTransact('trans_id','"+result.id+"','zx_banli.html')");
			$("#trans_name").text(result.transName);
			$("#trans_basecode").text(result.transBaseCode);
			$("#trans_nature").text(result.transNature);
			$("#office_name").text(result.office.name);
			$("#trans_type").text(result.transType);
			$("#service_object").text(result.serviceObject);
			$("#work_level").text(result.workLevel);
			$("#promise_day,#promise_day_1").text(result.itemguide.promiseDay);
			//是否收费
			if(result.itemguide.chargeStandard){
				$("#charge_standard").text(result.itemguide.chargeStandard);
			}
			$("#legal_day").text(result.itemguide.legalDay);
			$("#apply_time").text(result.itemguide.applyTime);
			//办事地址
			if(result.office.address)
			{
				$("#address").text(result.office.address);
			}
			//监督电话
			if(result.itemguide.supervisePhone)
			{
				$("#supervise_phone").text(result.itemguide.supervisePhone);
			}
			//是否支持预约办理
			if(result.itemguide.isAppointment)
			{
				$("#is_appointment").text(result.itemguide.isAppointment);
			}
			//是否支持网上支付
			if(result.itemguide.isWebpay)
			{
				$("#is_webpay").text(result.itemguide.isWebpay);
			}
			$("#is_courier").text(result.itemguide.isCourier);
			//咨询电话
			if(result.office.phone){
				$("#office_phone").text(result.office.phone);
			}
			//事项行使依据
			if(result.itemguide.actBase){
				queryActBase(result.itemguide.actBase);
			}
			//事项申请材料
			if(result.materialIds){
				queryMaterial(result.materialIds);
			}
			//申请条件
			if(result.itemguide.applyCondition){
				$("#apply_condition").append("<li>"+result.itemguide.applyCondition+"</li>");
			}else{
				$("#apply_condition").append("<li>暂无</li>");
			}
			//受理条件
			if(result.itemguide.acceptCondition){
				$("#accept_condition").append("<li>"+result.itemguide.acceptCondition+"</li>");
			}else{
				$("#accept_condition").append("<li>暂无</li>");
			}
			
			$("#result_file").attr("src",result.itemguide.transactResultDemo);
		},
		error : function(){
			
		}
	});
}

/**
 * 行使依据方法
 */
function queryActBase(ids){
	$.ajax({
		type : "post",
		dataType : "json",
		data : {
			"ids" : ids
		},
		url : "f/front/interfaceweb/interfaceMaterial/queryMaterial",
		success : function (result){
			$.each(result,function(index,element){
				var parmas = "";
				parmas = "<tr>"
                    +"<td>"+(index+1)+"</td>"
                    +"<td>"+element.materialName+"</td>";
				if(element.sampleFileName)
				{
					parmas += "<td><a href=\"f/front/interfaceweb/interfaceApplyMaterial/sampleFileDown?id="+element.materialCode+"\"><button></button></a></td>";
				}
				else
				{
					parmas += "<td>无附件</td>";
				}
                    
				parmas += "</tr>";
				$("#act_base").append(parmas);
			});
		},
		error : function (){
			alert("获取数据失败！");
		}
	});
}

//查询材料
function queryMaterial(ids){
	$.ajax({
		type : "post",
		dataType : 'json',
		data : {
			"ids" : ids
		},
		url : "f/front/interfaceweb/interfaceMaterial/queryMaterial",
		success : function (result){
			$.each(result,function(index,element){
				parmas = "<tr>"
                    +"<td>"+(index+1)+"</td>"
                    +"<td>"+element.materialName+"</td>";
				if(element.emptyFileName)
				{
					parmas += "<td><a href=\"f/front/interfaceweb/interfaceApplyMaterial/emptyFileDown?id="+element.materialCode+"\"><button></button></a></td>";
				}
				else
				{
					parmas += "<td>暂无空表下载</td>";
				}
				
				if(element.sampleFileName)
				{
					parmas += "<td><a href=\"f/front/interfaceweb/interfaceApplyMaterial/sampleFileDown?id="+element.materialCode+"\"><button></button></a></td>";
				}
				else
				{
					parmas += "<td>暂无样表下载</td>";
				}
				parmas += "</tr>";
				$("#apply_material").append(parmas);
			});
		},
		error : function(){
			
		}
	});
}

/**
 * 判断用户是否登陆跳转
 * @param name  trans_id
 * @param value  
 * @param path  跳转路径
 */
function OnlineTransact(name,value,path){
	document.cookie = name + "="+ escape (value);
	$.ajax({
		type : "post",
		dataType : "json",
		data:{
			"tempPath":path
		},
		url : "f/front/jump/checksIsLogin",
		success : function(result) {
			if(result.type == 1){
				document.cookie = "user_id" + "="+ escape (result.id);
				document.cookie = "user_type" + "="+ escape (result.type);
//				location.href = path + "?user_id=" + result.id + "&user_type=1";
				location.href = path ;
			}else if(result.type == 2){
				document.cookie = "legal_id" + "="+ escape (result.id);
				document.cookie = "user_type" + "="+ escape (result.type);
//				location.href = path + "?legal_id=" + result.id + "&user_type=2";
				location.href = path ;
			}else if(result.type == 0){
				location.href = "login.html?url="+path;
			}
		}
	});
}