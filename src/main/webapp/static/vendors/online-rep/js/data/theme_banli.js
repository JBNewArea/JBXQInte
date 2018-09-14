/**
 * 在线办理页面数据js
 * @author mawenxia
 * 2017-12-21
 */

//全局变量  用于保存用户id
var user_id = "";
var user_type = "";
var user_idcard = "";
var indextemp = "";  //全局变量，用于上传材料弹框回调
var page_view = "";  //用于区分页面显示div
var authentication_status = '2';   //用户认证状态
//个性化表单对应事项名称
var personalization_form_1 = '施工许可证的发放';
var personalization_form_2 = '商品林和公益林采伐,疫区内未发生松材线虫病的乡镇需进行松木商品材采伐的审批,因科学研究等特殊需要采伐珍贵树木的审批,采伐和采集自然保护区以外的珍贵树木和林区内具有特殊价值的植物资源审批';
var personalization_form_3 = '临时占用城市绿地审批';
var personalization_form_4 = '砍伐城市树木、迁移古树名木审批';
var personalization_form_5 = '占用、挖掘城市道路审批';
var transNames = "";
//返回办件编号
var office_number ="";
$(function(){
	
	user_type = getParameter("user_type");
	  console.log(user_type);
	//获取事项ids
      debugger;
      var transIds = getParameter("transIds");
      var strs= new Array(); //定义一数组
  	strs=transIds.split(","); //字符分割
	if(getParameter("user_type") == 1){
		$(".user_type").addClass("on").siblings("li").removeClass("on");
	    $(".user_info").show().siblings(".company_info").hide();
		$(".company_type").click(function () {
	        alert("该用户只能办理个人事项");
        });
		//无源码 无用户
		//findUser(getParameter("user_id"));
		for (i=0;i<strs.length ;i++ )
    	{
    		console.log(strs[i]); //分割后的字符输出
    		findTransById(strs[i]);
    	}
	}else{
		$(".company_type").addClass("on").siblings("li").removeClass("on");
        $(".user_info").hide().siblings(".company_info").show();
        $(".user_type").click(function () {
            alert("该用户只能办理企业事项");
        });
        //无源码 无用户
		//findLegalPerson(getParameter("legal_id"));a
    	for (i=0;i<strs.length ;i++ )
    	{
    		console.log(strs[i]); //分割后的字符输出
    		findTransById(strs[i]);
    	}
	}
	
    $("#btn1").click(function () {
    	console.log('进入方法btn1');
    	if(authentication_status){
    		if(authentication_status == 2){
        		$(".bl_box1").hide();
                $(".bl_box2").show();
                $(".bl_box3").hide();
                $(".bl_box4").hide();
                $(".bl_box5").hide();
                $(".bl_path ul li:nth-child(2)").addClass("on")
        	}else{
        		alert("用户信息认证未通过，请重新前往用户中心认证");
        		document.cookie = "user_id" + "="+ escape (user_id);
    			document.cookie = "user_type" + "="+ escape (user_type);
    			location.href = "gr_zhongxin.html" ;
        	}
    	}else{
    		alert("正在加载数据，请稍后...");
    	}
    });
    
    //btn2 下一步点击事件
    $("#btn2").click(function(){
    	var style_type = "";
    	if(user_type == 1)
    	{
    		style_type = "user";
    	}
    	else
        {
    		style_type = "company";
        }
    	if(checkNull(style_type))
		{
			$(".bl_box1").hide();
	        $(".bl_box2").hide();
	        $(".bl_box3").show();
	        $(".bl_box4").hide();
	        $(".bl_box5").hide();
	        $(".bl_path ul li:nth-child(3)").addClass("on")
		}
    });
});

/**
 * 输入框是否为空页面显示效果
 * @param type(person、company)
 */
function checkNull(type){
	var input_out = $(".tab-"+type+"-style");
	for (var i = 0; i <= input_out.length; i++) {
		if ($(input_out[i]).val() == "") {
			$(input_out[i]).attr("placeholder","*此项为必填项").addClass("error");
			return false;
		} 
//		else {
//			/*$(input_out[i]).css("border", "1px solid #cccccc");*/
//		}
	}
	return true;
}

/**
 * 通过事项id查询事项详情
 * @param id
 */
function findTransById(id){
	debugger
	console.log('comming trans');
	var themeName = getParameter("themeName");
	console.log("themeName:"+themeName);
	$.ajax({
		type : "post",
		dataType : "json",
		data : {
			"id" : id
		},
		url : "/JBXQInte/admin/onlinerep/getTrans",
		success : function(result){
			var class_name = '';
			if(user_type == 1){
				class_name = 'user';
			}else{
				class_name = 'company';
			}
			var myobj=eval("(" + result.data + ")");
			transNames = transNames+","+myobj.transName;
			transNames+= ",";
			transNames=transNames.substring(1,transNames.length-1);
			$("#trans_id").val(myobj.id);
			$("#transNames").text(transNames);
			$("#themeName").text(themeName);
			if(myobj.transName.match(personalization_form_1)){
				page_view = "1";
				$("#sq_info_1").show();
				$("#sq_info_1 table tr td input").attr("class","tab-"+class_name+"-style");
			}
			if(personalization_form_2.match(myobj.transName)){
				$("#sq_info_2").show();
				$("#sq_info_2 table tr td input").attr("class","tab-"+class_name+"-style");
			}
			if(myobj.transName.match(personalization_form_3)){
				$("#sq_info_3").show();
				$("#sq_info_3 table tr td input").attr("class","tab-"+class_name+"-style");
			}
			if(myobj.transName.match(personalization_form_4)){
				$("#sq_info_4").show();
				$("#sq_info_4 table tr td input").attr("class","tab-"+class_name+"-style");
			}
			if(myobj.transName.match(personalization_form_5)){
				$("#sq_info_5").show();
				$("#sq_info_5 table tr td input").attr("class","tab-"+class_name+"-style");
			}
			$("#office_name").text(myobj.office.name);

			queryMaterialByIds(myobj.materialIds);
		},
		error : function(){
			alert("申报事项获取失败！");
		}
	});
}
function findTransByIdData(id){
	debugger
	console.log('comming trans');
	var themeName = getParameter("themeName");
	console.log("themeName:"+themeName);
	$.ajax({
		type : "post",
		dataType : "json",
		data : {
			"id" : id
		},
		url : "/JBXQInte/admin/onlinerep/getTrans",
		success : function(result){
			var myobj=eval("(" + result.data + ")");
			transNames = transNames+","+myobj.transName;
			transNames+= ",";
			transNames=transNames.substring(1,transNames.length-1);
			$("#trans_id").val(myobj.id);
			$("#transNames").text(transNames);
		},
		error : function(){
			alert("申报事项获取失败！");
		}
	});
}

/**
 * 查询个人用户信息
 */
function findUser(id){
	$.ajax({
		type : "post",
		async: false,
		data : {
			"id" : id
		},
		url : "f/front/xzWebUser/findUserById",
		success : function(xzWebUser){
			user_id = xzWebUser.id;
			user_idcard = xzWebUser.idcard;
			$("#user_idcard").val(xzWebUser.idcard);
			$("#user_name").val(xzWebUser.userName);
			$("#user_telephone").val(xzWebUser.telphone);
			$("#address_userId_1").val(xzWebUser.id);
			$("#user_address").val(xzWebUser.address);
			authentication_status = xzWebUser.status;
			findTransById();
			queryMyaddress(xzWebUser.id);
		},
		error : function(){
			alert("获取数据失败！");
		}
	});
}

/**
 * 通过法人id查询法人信息
 * @param id
 */
function findLegalPerson(id){
	$.ajax({
		type : "post",
		async: false,
		data : {
			"id" : id
		},
		url : "f/front/legalPerson/findLegalPersonById",
		success : function(legalPerson){
			user_id = legalPerson.id;
			user_idcard = legalPerson.socialCreditCode;
			$("#company_idcard").val(legalPerson.socialCreditCode);
			$("#company_name").val(legalPerson.organizationName);
			$("#legal_representative").val(legalPerson.legalRepresentative);
			$("#company_telephone").val(legalPerson.telphone);
			$("#company_address").val(legalPerson.registerAddress);
			authentication_status = legalPerson.type;
			findTransById();
			queryMyaddress(legalPerson.id);
		},
		error : function(){
			alert("获取数据失败！");
		}
	});
}

/**
 * 通过材料ids 查询事项材料
 * @param ids
 */
function queryMaterialByIds(ids){
	$.ajax({
		type : "post",
		dataType : "json",
		url : "/JBXQInte/admin/onlinerep/getMaterial",
		data : {
			"ids" : ids
		},
		success : function(result){
			var myobj=eval("(" + result.data + ")");
			var material_ids = '';
			for(var i = 0;i<myobj.length;i++){
				console.log(myobj[i].materialName);
				material_ids += myobj[i].id +",";
				$("#material_list").append("<tr>"
                    +"<td style='width: 70px;'>"+(i+1)+"</td>"
				    +"<td>"+myobj[i].materialName
				    +"<input type='hidden' name='materialList["+i+"].material.materialName' id='material_name"+i+"' value='"+myobj[i].materialName+"'>"
					+"<input type='hidden' name='userIdCard' id='material_idcard"+i+"'>"
					+"<input type='hidden' name='materialList["+i+"].getMode' id='getMode"+i+"' value='由用户上传'>"
					+"<input type='hidden' name='materialList["+i+"].material.id' id='materialid"+i+"' value='"+myobj[i].id+"'>"
					+"<input type='hidden' name='materialList["+i+"].materialGetId' id='getMaterialId-"+i+"'>"
				    +"</td>"
				    +"<td style='width: 97px;'>"
				    +"<a class='upload_btn' onclick=\"ShowFileBox("+i+")\"></a>"
				    +"<a class='view_btn' id='file_view_"+i+"' style='display:none;'></a>"
				    +"</td>"
				+"</tr>");
			}
//			$.each(myobj,function(index,element){
//				material_ids += element.id +",";
//				$("#material_list").append("<tr>"
//                    +"<td style='width: 70px;'>"+(index+1)+"</td>"
//				    +"<td>"+element.materialName
//				    +"<input type='hidden' name='materialList["+index+"].material.materialName' id='material_name"+index+"' value='"+element.materialName+"'>"
//					+"<input type='hidden' name='userIdCard' id='material_idcard"+index+"'>"
//					+"<input type='hidden' name='materialList["+index+"].getMode' id='getMode"+index+"' value='由用户上传'>"
//					+"<input type='hidden' name='materialList["+index+"].material.id' id='materialid"+index+"' value='"+element.id+"'>"
//					+"<input type='hidden' name='materialList["+index+"].materialGetId' id='getMaterialId-"+index+"'>"
//				    +"</td>"
//				    +"<td style='width: 97px;'>"
//				    +"<a class='upload_btn' onclick=\"ShowFileBox("+index+")\"></a>"
//				    +"<a class='view_btn' id='file_view_"+index+"' style='display:none;'></a>"
//				    +"</td>"
//				+"</tr>");
//			});
			//findMaterialByIdCard(material_ids.substring(0,material_ids.length-1))
		}
	});
}

/**
 * 打开文件上传弹框
 */
function ShowFileBox(index) {
	indextemp = index;
	$("#usermaterialid").val($("#getMaterialId-"+index).val());
	$("#userIdCard").val(user_idcard);
	$("#materialId").val($("#materialid"+index).val());
	$("#getMode"+index).val("由用户上传");
	$("#userType").val(user_type);
	
    $(".file_pop").show();
    $("body").css({"overflow":"hidden"});
    
}

/**
 * 上传材料方法
 */
function saveMaterial(){
	$("#fileType").append("文件正在上传，请稍等...");
	var file = $("#file_load").val();
	if(file == null || file == ""){
		alert("上传材料不能为空");
		return;
	}
	var data = new FormData($("#material-file")[0]);
	$.ajax({
		type : "post",
		data : data,
		async: false,
		processData:false,
		contentType:false,
		url : "/JBXQInte/admin/onlinerep/doMatterUploadFile",
		success : function (data){
			data = data.substring(0,data.length-1);
			if(data == "fail"){
				alert("上传材料失败，请重新上传");
				$("#file").val("");
				return;
			}else{
				 layer.msg('上传成功', {icon: 1});
				 $("#getMaterialId-"+indextemp).val(data);
				 $("#file_view_"+indextemp).show();
				 $("#file_view_"+indextemp).attr("href","javascript:openDialogView('附件管理','"+data+"','80%','80%',1)");			        
	        	 $("#getMode"+indextemp).val("由用户上传");
	        	 $("#file_load").val("");
	        	 HideFileBox();
			}
		},
		error : function (){
			alert("保存材料系统出错了，请联系管理员!");
		}
	});
}

//通过身份证号查用户上传的材料
function findMaterialByIdCard(ids){
	$.ajax({
		type : "post",
		dataType : "json",
		async : false,
		data : {
			"userIdCard" : user_idcard,
			"userType" : user_type,
			"ids" : ids
		},
		url : "f/front/interfaceweb/interfaceUserMaterial/findMaterialsByUser",
		success : function(data){
			$.each(data,function(i,element){
				if(element){
					$("#getMaterialId-"+i).val(element.id);
					$("#file_view_"+i).show();
					$("#file_view_"+i).attr("href","javascript:openDialogView('附件管理','"+element.id+"','80%','80%',1)");			        
		        	$("#getMode"+i).val("系统自动获取");
				}else {
					return true;//在each代码块内不能使用break和continue
				}
			});
		},
		error : function (){
			alert("身份证查询材料系统出错，请联系管理员");
		}
	});
}


/**
 * 查询我的地址
 */
function queryMyaddress(userid){
	$.ajax({
		type : "post",
		data : {
			"userId" : userid
		},
		url : "f/front/address/findListByUserId",
	    success : function (result){
	    	$("#address_list").empty();
		    $.each(result,function(index,element){
		    	$("#address_list").append("<li>"
                    +"<input type='radio' id='"+element.id+"' name='rad'>"
                    +"<span>"+element.name+"</span>"
                    +"<span>"+element.telphone+"</span>"
                    +"<span class='adress'>"+element.address+"&nbsp;"+element.street+"</span>"
                    +"<button class='clean' onclick=\"deleteAddress('"+element.id+"')\">删除</button>"
                    +"<button class='edit' onclick=\"findAddressById('"+element.id+"')\">编辑</button>"
                 +"</li>");
		    });	
	   		
		},
		error : function (){
			alert("系统出错，请联系管理员");
		}
	})
}

/**
 * 根据地址id查询地址
 */
function findAddressById(id){	
	 $(".new_btn").hide();
     $(".save_btn").show();
	$.ajax({
		type : "post",
		data : {
			"id" : id
		},
		url : "f/front/address/get",
		success : function (data){
			$("#city-picker3").val(data.address);
			$("#city-picker3").next().children().first().text(data.address);
			$("#address_street").val(data.street);
			$("#address_postcode").val(data.postcode);
			$("#address_username").val(data.name);
			$("#address_telphone").val(data.telphone);
			$("#address_id").val(data.id);
		},
		error : function (){
			alert("系统出错，请联系管理员");
		}
	});
}

/**
 * 添加地址
 */
function addAddress(){
	var address = $("#city-picker3").val();
	var userId = user_id;
	var id = $("#address_id").val();
	var street = $("#address_street").val();
	var postcode = $("#address_postcode").val();
	var name = $("#address_username").val();
	var telphone = $("#address_telphone").val();
	var data ="address="+address+"&street="+street+"&userId="+userId+"&id="+id+"&postcode="+postcode+"&name="+name+"&telphone="+telphone;
	$.ajax({
		type : "post",
		data : data,
		url : "f/front/address/save",
		success : function (data){
			if(data == "success"){
				layer.msg('添加成功', {icon: 1});     
				queryMyaddress(userId);
				$("#city-picker3,#address_id,#address_street,#address_postcode,#address_username,#address_telphone").val("");
			}else{
				layer.msg('添加失败', {icon: 2});
			}
			layer.closeAll();
		},
		error : function (){
			alert("系统出错，请联系管理员");
		}
	});
}

/**
 *删除地址方法
 * @param id
 */
function deleteAddress(id){
	//layer询问框
	layer.confirm('确定要删除该地址？', {
	  btn: ['删除','取消'] //按钮
	}, function(){
		$.ajax({
			type : "post",
			data : {
				"id" : id,
			},
			url : "f/front/address/delete",
			success : function(result){
				if(result == "success")
				{
					layer.msg('删除成功', {icon: 1});
					queryMyaddress(user_id);
				}
				else
				{
					layer.msg('删除失败', {icon: 2});
				}
			}
		});
	}, function(){
	  layer.msg('取消删除', {
	    time: 2000 //2s后自动关闭
	  });
	});
}

/**
 * 事项申报方法
 */
function submitApplication(){
	debugger;
	var transIds = getParameter("transIds");
	var strs= new Array(); //定义一数组
	strs=transIds.split(","); //字符分割
	for (i=0;i<strs.length ;i++ )
	{
		console.log(strs[i]); //分割后的字符输出
	var applicant_name = "";
	var applicant_card = "";
	var applicant_telephone = "";
	var legal_representative = "";
	var applicant_postcode = "";
	var applicant_address = "";
	var applicant_card_type = "";
	var agent_name = "";
	var agent_telephone = "";
	var agent_idcard = "";
	var agent_card_type = "";
	if(user_type == 1){
		applicant_name = $("#user_name").val();
		applicant_card = $("#user_idcard").val();
		applicant_telephone = $("#user_telephone").val();
		applicant_postcode = $("#user_postcode").val();
		applicant_address = $("#user_address").val();
		applicant_card_type = "1";
		agent_name = $("#user_agent").val();
		agent_telephone = $("#user_agent_telephone").val();
		agent_idcard = $("#user_agent_card").val();
		agent_card_type = "1";
	}else{
		applicant_name = $("#company_name").val();
		applicant_card = $("#company_idcard").val();
		applicant_telephone = $("#company_telephone").val();
		legal_representative = $("#legal_representative").val();
		applicant_postcode = $("#company_postcode").val();
		applicant_address = $("#company_address").val();
		applicant_card_type = "2";
		agent_name = $("#company_agent_name").val();
		agent_telephone = $("#company_agent_telephone").val();
		agent_idcard = $("#company_agent_card").val();
		agent_card_type = "1";
	}
	findTransByIdData(strs[i]);
	//获取的事项信息
	var data1 = $("#application_form").serializeArray();
	var data = $("#application_form").serialize();
	data += "&applyPerson.applicationName=" + applicant_name +"&applicantDocumentType=" + applicant_card_type + "&legalRepresentative=" +legal_representative
	     +"&applyPerson.applicationDocumentNumber=" + applicant_card + "&applyPerson.applicationPhone=" + applicant_telephone
	     +"&applyPerson.applicationPostCode=" + applicant_postcode + "&applyPerson.applicationAddress=" + applicant_address
	     +"&agentName=" + agent_name + "&agentDocumentType=" + agent_card_type + "&agentDocumentNumber=" + agent_idcard + "&telPhone=" + agent_telephone;
	$.ajax({
		type : "post",
		async: false, 
		url : "",
		data : {
			"data" : data
		},
		success : function(data){
			data="1";
			office_number = office_number+","+data;
			office_number+= ",";
			office_number=office_number.substring(1,office_number.length-1);
			$("#office_number").append(office_number);
		},
		error : function(){
			alert("个人提交申请系统出错，请联系管理员！");
		}
	});
	}
	//返回值办件编号拼接
	alert("测试的短信发送");
	var office_numbers=$("#office_number").val();
	 //sendSms(applicant_telephone,office_number);
}

/**
 * 申报成功短信提示
 */
function sendSms(telephone,office_number){
	var transName = $("#trans_name").text();
	$.ajax({
		type : "post",
		url : "f/front/interfaceweb/interfaceApplication/SmsPrompt",
		data : {
			"phone" : telephone,
			"transName" : transName,
			"officeNumber" : office_number
		},
		success : function(result){
			
		}
	});
}