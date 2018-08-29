/**
 * 办事指南页面数据获取js
 * @author mawenxia
 * 2017-12-25
 */

$(function(){
	//checksIsLogin();
	findTransById();
});

/**
 * 通过事项id查询事项的详细信息方法（办事指南）
 */
function findTransById(){
	var id = guide.id;
	$.ajax({
		type : "post",
		dataType : "json",
		url : "/JBXQInte/admin/onlinerep/getTrans",
		data : {
			"id" : id
		},
		success : function(result){
			var myobj=eval("(" + result.data + ")");
			$("#wy_banli").attr("onclick","OnlineTransact('trans_id','"+myobj.id+"','zx_banli.html')");
			$("#trans_name").text(myobj.transName);
			$("#trans_basecode").text(myobj.transBaseCode);
			$("#trans_nature").text(myobj.transNature);
			$("#office_name").text(myobj.office.name);
			$("#trans_type").text(myobj.transType);
			$("#service_object").text(myobj.serviceObject);
			$("#work_level").text(myobj.workLevel);
			$("#promise_day,#promise_day_1").text(myobj.itemguide.promiseDay);
			//是否收费
			if(myobj.itemguide.chargeStandard){
				$("#charge_standard").text(myobj.itemguide.chargeStandard);
			}
			$("#legal_day").text(myobj.itemguide.legalDay);
			$("#apply_time").text(myobj.itemguide.applyTime);
			//办事地址
			if(myobj.office.address)
			{
				$("#address").text(myobj.office.address);
			}
			//监督电话
			if(myobj.itemguide.supervisePhone)
			{
				$("#supervise_phone").text(myobj.itemguide.supervisePhone);
			}
			//是否支持预约办理
			if(myobj.itemguide.isAppointment)
			{
				$("#is_appointment").text(myobj.itemguide.isAppointment);
			}
			//是否支持网上支付
			if(myobj.itemguide.isWebpay)
			{
				$("#is_webpay").text(myobj.itemguide.isWebpay);
			}
			$("#is_courier").text(myobj.itemguide.isCourier);
			//咨询电话
			if(myobj.office.phone){
				$("#office_phone").text(myobj.office.phone);
			}
			//事项行使依据
			if(myobj.itemguide.actBase){
				queryActBase(myobj.itemguide.actBase);
			}
			//事项申请材料
			if(myobj.materialIds){
				queryMaterial(myobj.materialIds);
			}
			//申请条件
			if(myobj.itemguide.applyCondition){
				$("#apply_condition").append("<li>"+myobj.itemguide.applyCondition+"</li>");
			}else{
				$("#apply_condition").append("<li>暂无</li>");
			}
			//受理条件
			if(myobj.itemguide.acceptCondition){
				$("#accept_condition").append("<li>"+myobj.itemguide.acceptCondition+"</li>");
			}else{
				$("#accept_condition").append("<li>暂无</li>");
			}
			//常见问题
			if(myobj.itemguide.commonProblem){
				$("#bs_zhinan6").append(myobj.itemguide.commonProblem);
			}else{
				$("#bs_zhinan6").append("暂无");
			}
			//结果文件
			if(myobj.itemguide.transactResultDemo){
				$("#result_file").attr("src",myobj.itemguide.transactResultDemo);
			}else{
				$("#bs_zhinan7").append("暂无");
			}
			
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
		url : "/JBXQInte/admin/onlinerep/getMaterial",
		success : function (result){
			var myobj=eval("(" + result.data + ")");
			console.log(myobj);
			$.each(myobj,function(index,element){
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
		url : "/JBXQInte/admin/onlinerep/getMaterial",
		success : function (result){
			var myobj=eval("(" + result.data + ")");
			$.each(myobj,function(index,element){
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