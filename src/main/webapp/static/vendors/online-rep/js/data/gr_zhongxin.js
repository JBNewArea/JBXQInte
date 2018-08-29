/**
 * 会员中心页面数据获取js
 * @author mawenxia
 * 2017-12-18
 */

//全局变量  用户证件号码
var id_card = '';
//用户编号ID
var user_id = '';
//用户类型（1、个人，2、企业）
var user_type = '';

var isOver = true;

//我的办件信息
var my_application = null;


$(function(){

	//评价星星初始化
	$.fn.raty.defaults.path = 'raty/img';
	  	$('#function-demo').raty({
		number: 3,//多少个星星设置
		score: 2,//初始值设置
		targetType: 'hint',//类型选择，number是数字值，hint是设置的数组值
		path      : 'raty/img',    //图标文件夹
		hints     : ['不满意','基本满意','满意'],   //设置hint数组
		size      : 24,       //大小，与hint的距离
		starHalf  : 'star-half-big.png',    //半个星星图标
		starOff   : 'star-off-big.png',		//未选中图标
		starOn    : 'star-on-big.png',      //选中图表
		target    : '#function-hint',
		targetKeep: true,
		targetText: '请选择评分',
		
		click: function(score, evt) {
		  $("#stars-input").val(score + 1);
		}
	});
  
	user_type = getParameter("user_type");
	if(user_type == 2){
		findLegalPerson();
		$("#user_div").hide();
		$("#company_div").show();
		$("#li-1").click(function(){
			$("#company_div").show();
			$(".xg_pass,.xg_phone").hide();
			$("#gr_box1 h3").html("账号信息");
		})
		$("#real_company").show();
		$("#real_person").hide();
		threeSelect("CompanyReal")
	}else{
		//findUser();
		$("#li-1").click(function(){
			$("#user_div").show();
			$(".xg_pass,.xg_phone").hide();
			$("#gr_box1 h3").html("账号信息");
		})
		
		$("#real_person").show();
		$("#real_company").hide();
		threeSelect("UserReal")
	}
	
	//保存密码点击事件
	$("#save_pwd_btn").click(function(){
		var password = '';
		if(!$("#old_password").val())
		{
			$("#old_password").attr('placeholder',"请输入原密码").addClass("error");
		}
		if($("#new_password").val())
		{
			if($("#new_password").val() != $("#re_new_password").val())
			{
				$("#re_new_password").val("");
				$("#re_new_password").attr('placeholder',"请确认两次密码相同").addClass("error");
			}
			updataPassword();
		}
		else
		{
			$("#new_password").attr('placeholder',"请输入新密码").addClass("error");
		}
	});
	
	//修改手机号码点击事件
    $("#next_telephone_btn").click(function () {
        var telephone = "";
        if(user_type == 1)
        {
        	telephone = $("#user_telephone").val();
        }
        else
        {
        	telephone = $("#company_telephone").val();
        }
        if($("#old_telephone").val())
        {
        	if(telephone == $("#old_telephone").val())
        	{
        		 $(".phone_2").show();
        	     $(".phone_1").hide();
        	}
        	else
        	{
        		$("#old_telephone").val("");
        		$("#old_telephone").attr('placeholder',"请输入原手机号码").addClass("error");
        	}
        }
        else
        {
        	$("#old_telephone").attr('placeholder',"请输入原手机号码").addClass("error");
        }
    });
    
    //保存修改手机号码的点击事件
    $("#save_telephone_btn").click(function(){
    	var telephone = $("#telephone_1").val();
    	var yzm = $("#yzm_code").val();
    	if($("#telephone_1").val())
    	{
    		if($("#yzm_code").val())
    		{
    			if(validateTelephoneCode(yzm))
    			{
    				updateMessage('telphone',telephone);
    			}
    			else
    			{
    				layer.msg('验证码输入错误', {icon: 2});
    				$("#yzm_code").val("");
    			}
    		}
    		else
    		{
    			layer.msg('验证码不能为空', {icon: 2});
    		}
    	}
    	else
    	{
    		$("#telephone_1").attr('placeholder',"请输入新手机号码").addClass("error");
    	}
    });
    
    //email保存点击事件
    $("#email_save_btn").click(function(){
    	var email = $("#email").val();
    	updateMessage('email',email);
    });
    
    //个人实名认证点击事件
    $(".realname").click(function(){
    	var classname = '';
    	if(user_type == 1){
    		classname = 'user-realname';
    	}else{
    		classname = 'company-realname';
    	}
    	if(showEffect(classname)){
    		realName();
    	}
    });
    
	
});

/**
 * 输入框是否为空页面显示效果
 * @param type(person、company)
 */
function showEffect(type){
	var input_out = $(".tab-"+type);
	for (var i = 0; i <= input_out.length; i++) {
		if ($(input_out[i]).val() == "") {
			$(input_out[i]).css("border", "1px solid red");
			return false;
		} else {
			$(input_out[i]).css("border", "1px solid #cccccc");
		}
	}
	return true;
}

//地址框效果
$(".bj-site").click(function () {
    OpenSite();
    $(".add-site h3 .title").html("编辑收货地址");
})

/**
 * 查询用户信息方法
 */
function findUser(){
	var id = getParameter("user_id");
	$.ajax({
		type : "post",
		data : {
	        "id" : id
		},
		url : "f/front/xzWebUser/findUserById",
		success : function(result){
			id_card = result.idcard;
			user_id = result.id;
			$("#user_name").val(result.userName);
			$("#login_name_1,#login_name_2").text(result.loginName);
			$("#user_idcard").val(result.idcard);
			$("#email").val(result.email);
			$("#user_telephone").val(result.telphone);
			if(result.status == 2)
			{
				$("#real_name_authentication_1").addClass("on");
				$("#name_authentication_type_1").html("已实名认证");
			}
			if(result.telphone)
			{
				$("#telephone_authentication_1").addClass("on");
				$("#telephone_authentication_type_1").html("手机已认证");
			}
		}
	});
}

/**
 * 通过法人id查询法人信息
 * @param id
 */
function findLegalPerson(){
	var id = getParameter("legal_id");
	$.ajax({
		type : "post",
		data : {
			"id" : id
		},
		url : "f/front/legalPerson/findLegalPersonById",
		success : function(legalPerson){
			user_id = legalPerson.id;
			id_card = legalPerson.socialCreditCode;
			if(legalPerson.type == 2)
			{
				$("#real_name_authentication_2").addClass("on");
				$("#name_authentication_type_2").html("已实名认证");
			}
			if(legalPerson.telphone)
			{
				$("#telephone_authentication_2").addClass("on");
				$("#telephone_authentication_type_2").html("手机已认证");
			}
			$("#login_name_1,#company_loginname_1").text(legalPerson.organizationName);
			$("#company_password").val(legalPerson.pwd);
			$("#company_idcard").val(legalPerson.socialCreditCode);
			$("#company_name").val(legalPerson.organizationName);
			$("#legal_representative").val(legalPerson.legalRepresentative);
			$("#company_telephone").val(legalPerson.telphone);
			$("#legal_representative_idcard").val(legalPerson.idCard);
			$("#company_address").val(legalPerson.registerAddress);
			
		},
		error : function(){
			alert("获取数据失败！");
		}
	});
}

/**
 * 查询用户身份证下的办件信息
 */
function findApplicationByIdCard(){
	Tab(2);
	var radio = $('input:radio[name="inp"]:checked');
	var status = radio.val();
	var keyword = "";
	if($("#application_keyword").val()){
		keyword = $("#application_keyword").val();
	}
	$.ajax({
		type : "post",
		dataType : "json",
		data : {
			"applicantDocumentNumber" : id_card,
			"status" : status,
			"transName" : keyword,
			"applicantDocumentType" : user_type
		},
		url : "/JBXQInte/admin/onlinerep/getListApplicationByIdCard",
		success : function(result){
			console.log(result.data);
			var myobj=eval("(" + result.data + ")");
			if(status == 2){
				result = findSPApplication();
			}
			$("#application").empty();
			$.each(myobj,function(index,element){
				var parmas = '';
				parmas = "<tr>"
                    +"<td style='width: 160px;'>"+element.officeNumber+"</td>"
				    +"<td style='width: 345px;'><a href='bj_xiangqing.html?id="+element.id+"'>"+element.trans.transName+"</a></td>"
					+"<td style='width: 135px;'>"+element.shouliTime+"</td>";
				if(element.status)
				{
					parmas += "<td style='width: 125px;'>"+element.status+"</td>";
				}
				else
				{
					parmas += "<td style='width: 125px;'>"+element.checkStatus+"</td>";
				}
				if(element.status == "已办结")
				{
					if(element.callFlag == '0'){
						parmas += "<td><a href='javascript:void(0)' onclick=\"OpenPj('"+element.id+"');\">我要评价</a></td>";
					}
					else
					{
						parmas += "<td><a href='javascript:void(0)' style='background-color:#dedede;'>已评价</a></td>";
					}
				}
				else
				{
					parmas += "<td></td>";
				}
				parmas += "</tr>";
				$("#application").append(parmas);
			});
			$("#application_keyword").val("");
		}
	});
}

/**
 * 查询审批中的办件
 */
function findSPApplication(){
	$.ajax({
		type : "post",
		async : false,
		dataType : "json",
		data : {
			"applicantDocumentNumber" : id_card,
			"applicantDocumentType" : user_type
		},
		url : "/JBXQInte/admin/onlinerep/getSPApplication",
		success : function(result){
			console.log(result);
			my_application =  result;
		}
	});
	return my_application;
}

/**
 * 通过用户编号id查询用户地址信息
 */
function findAddressByUserId(){
	Tab(3)
	threeSelect("Address")
	$.ajax({
		type : "post",
		data : {
			"userId" : user_id
		},
		url : "f/front/address/findListByUserId",
		success : function(result){
			$("#user_address").empty();
			$.each(result,function(index,element){
				$("#user_address").append("<tr>"
                    +"<td>"+element.name+"</td>"
                    +"<td>"+element.telphone+"</td>"
                    +"<td>"+element.address+element.street+"</td>"
                    +"<td>"
                    +"<button style='background-color: #FF7500;' onclick=\"findAddressById('"+element.id+"')\">编辑</button>"
					+"<button style='background-color: #999999;' onclick=\"deleteAddress('"+element.id+"')\">删除</button>"
					+"</td>"
					+"</tr>");
			});
		}
	});
}

/**
 * 编辑保存地址
 */
function addAddress(){
	var address =  $("#Select_Address_1").find("option:selected").text();
	address +=  "/" + $("#Select_Address_2").find("option:selected").text();
	address +=  "/" + $("#Select_Address_3").find("option:selected").text();
	var data = $("#address_form").serialize();
	data += "&address=" + address + "&userId=" + user_id;
	$.ajax({
		type : "post",
		data : data,
		url : "f/front/address/save",
		success : function (data){
			if(data == "success"){
				layer.msg('添加成功', {icon: 1});     
				findAddressByUserId();
				$("#address_id,#address_street,#postcode,#address_username,#address_telephone").val("");
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
 * 通过地址id查询地址详细信息
 */
function findAddressById(id){
    $(".add-site h3 .title").html("编辑收货地址");
	$.ajax({
		type : "post",
		url : "f/front/address/get",
		data : {
			"id" : id
		},
		success : function(result){
			var str = result.address;
			var address = str.split("/");
			$("#Select_Address_1").find("option:selected").text(address[0]);
//			$("#Select1").change();
			$("#Select_Address_2").find("option:selected").text(address[1]);
//			$("#Select2").change();
			$("#Select_Address_3").find("option:selected").text(address[2]);
			$("#address_id").val(result.id);
			$("#postcode").val(result.postcode);
			$("#address_username").val(result.name);
			$("#address_telephone").val(result.telphone);
			$("#address_street").val(result.street);
		}
	});
}

/**
 * 通过地址的id删除该条信息
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
					findAddressByUserId();
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
 * 通过身份证号码查询办件材料
 */
function findMaterialByIdCard(){
	Tab(4)
	$.ajax({
		type : "post",
		dataType : "json",
		url : "/JBXQInte/admin/onlinerep/getMaterialsByUserIdList",
		data : {
			"userIdCard" : id_card,
			"userType" : user_type
		},
		success : function(result){
			var myobj=eval("(" + result.data + ")");
			$("#material").empty();
			$.each(myobj,function(index,element){
				$("#material").append("<tr>"
					+"<td style='width: 95px;'>"+(index+1)+"</td>"
					+"<td style='width: 460px;'>"+element.materialNameget+"</td>"
					+"<td style='width: 165px;'>"+element.createDate+"</td>"
					+"<td>"
					+"<button onclick=\"javascript:openDialogView('附件管理','"+element.id+"','80%','80%',1)\"></button>"
					+"</td>"
					+"</tr>");
			});
		}
	});
}

/**
 * 修改密码方法
 */
function updataPassword(){
	var path = "";
	if(user_type == 1)
	{
		path = "f/front/xzWebUser/updatePassword";
	}
	else
	{
		path = "f/front/legalPerson/updatePassword";
	}
	var new_password = $("#new_password").val();
	var old_password = $("#old_password").val();
	$.ajax({
		type : "post",
		dataType : "json",
		url : path,
		data : {
			"id" : user_id,
			"plainPassword" : new_password,
			"oldPassword" : old_password
		},
		success : function(result){
			if(result.type == 0)
			{
				layer.msg('密码修改成功', {icon: 1});
				$("#new_password").val("");
				$("#old_password").val("");
				$("#re_new_password").val("");
			}
			else if(result.type == 1)
			{
				layer.msg('密码修改失败', {icon: 2});
			}else if(result.type == 2)
			{
				layer.msg('输入的旧密码错误', {icon: 2});
				$("#old_password").val("");
				$("#old_password").attr('placeholder',"请确认输入旧密码").addClass("error");
			}
		},
		error : function(){
			layer.msg('系统出错', {icon: 2});
		}
	});
}

/**
 * 单个参数修改用户基本信息方法
 */
function updateMessage(name,value){
	var path = "";
	if(user_type == 1)
	{
		path = "f/front/xzWebUser/update";
	}
	else
	{
		path = "f/front/legalPerson/update";
	}
	$.ajax({
		type : "post",
		url : path,
		data : "id=" + user_id + "&" + name + "=" + value,
		success : function(result){
			if(result == "success")
			{
				layer.msg('修改成功', {icon: 1});
				if(user_type == 2){
					$("#company_div").show();
					//findLegalPerson();
				}else{
					$("#user_div").show();
					findUser();
				}
				$(".xg_phone").hide();
			}
		},
		error : function(){
			layer.msg('系统出错', {icon: 2});
		}
	});
}

/**
 * 验证手机验证码方法
 */
function validateTelephoneCode(yzm){
	$.ajax({
		type : "post",
		async : false,
		data : {
			"input" : yzm
		},
		url : "f/front/note/checkMessage",
		success : function(result){
			if(result == "success")
			{
				return isOver;
			}
			else
			{
				isOver = false;
				return isOver;
			}
		},
		error : function (){
			
		}
	});
	return isOver;
}


/**
 * 添加评价方法
 */
function addAppraise(){
	var officeNumber = $("#office_number").val();
	var raty = $("#stars-input").val();
	var ratyContent = $("#raty_content").val();
	$.ajax({
		type : "post",
		data : {
			"officeNumber" : officeNumber,
			"applyCantIdCard" : id_card,
			"level" : raty,
			"content" : ratyContent
		},
		url : "f/front/interfaceweb/interfaceCallRecord/callOne",
		success : function (data){
			if("success" == data){
				ClosePj();
				findApplicationByIdCard();
			}else{
				alert("添加评价失败");
			}
		},
		error : function (){
			alert("系统出错，请联系管理员");
		}
	});
}

/**
 * 控制评价弹窗的隐藏和显示
 */
function OpenPj(id) {
    $(".Pj-dialogs").show();
    $("body").css({"overflow":"hidden"});
    $.ajax({
    	type : "post",
    	dataType : "json",
    	url : "f/front/interfaceweb/interfaceApplication/findOne",
    	data : {
    		"id" : id
    	},
    	success : function(result){
    		$("#office_number").val(result.officeNumber);
    		$("#applicant_name").val(result.applicantName);
    		$("#trans_name").val(result.trans.transName);
    		$("#office_name").val(result.trans.office.name);
    	}
    });
}

/**
 * 用户注销方法
 */
function userExit(){
	$.ajax({
		type : "post",
		url : "f/front/jump/userExit",
		success : function(result){
			location.href = "index.html";
		}
	});
}

/**
 * 实名认证方法
 */
function realName(){
	var idcard = '';
	var name = '';
	if(user_type == 1){
		idcard = $("#real_user_idcard").val();
		name = $("#real_user_name").val();
	}
	else if(user_type == 2)
	{
		idcard = $("#real_company_idcard").val();
		name = $("#real_company_name").val();
	}
	$.ajax({
		type : "post",
		dataType : "json",
		url : "/JBXQInte/admin/onlinerep/doRealName",
		data : {
			"idCard" : idcard,
			"type": user_type 
		},
		success : function(result){
			console.log(result);
			if(user_type == 1)
			{
				if(result.applicationDocumentNumber){
					if(result.applicationDocumentNumber == idcard && result.applicationName == name	){
						alert("认证成功");
						//updateUserMoreParmas();
					}else{
						alert("填写的信息有误，请重新填写");
						$("#real_user_idcard").val("");
						$("#real_user_name").val("");
					}
				}
				else
				{
					alert("由于您尚未在柜台有过办件，导致系统不能核验验证您的真实身份，请到柜台做相关处理。");
				}
			}
			else
			{
				if(result.applicationDocumentNumber){
					if(result.applicationDocumentNumber == idcard && result.applicationName == name	){
						alert("认证成功");
						updateCompanyMoreParmas();
					}else{
						alert("填写的信息有误，请重新填写");
						$("#real_company_idcard").val("");
						$("#real_company_name").val("");
					}
				}
				else
				{
					alert("由于您尚未在柜台有过办件，导致系统不能核验验证您的真实身份，请到柜台做相关处理。");
				}
			}
		},
		error : function(){
			
		}
	});
}

/**
 * 个人用户修改信息、多个参数
 */
function updateUserMoreParmas(){
	var name = $("#real_user_name").val();
	var idcard = $("#real_user_idcard").val();
	var address =  $("#Select_UserReal_1").find("option:selected").text();
	address += $("#Select_UserReal_2").find("option:selected").text();
	address += $("#Select_UserReal_3").find("option:selected").text();
	address += $("#real_user_address").val();
	$.ajax({
		type : "post",
		url : "f/front/xzWebUser/update",
		data : {
			"userName" : name,
			"idcard" : idcard,
			"address" : address,
			"status" : "2",
			"id" : user_id
		},
		success : function(result){
			if(result == "success"){
				alert("信息更新成功");
				$("#gr_box1").show();
				$("#gr_box5").hide();
				$("#gr_box1 h3").html("账号信息");
			}
		},
		error : function(){
			
		}
	});
}

/**
 * 企业用户修改信息、多个参数
 */
function updateCompanyMoreParmas(){
	var organizationName = $("#real_company_name").val();
	var socialCreditCode = $("#real_company_idcard").val();
	var address =  $("#Select_CompanyReal_1").find("option:selected").text();
	address += $("#Select_CompanyReal_2").find("option:selected").text();
	address += $("#Select_CompanyReal_3").find("option:selected").text();
	address += $("#real_company_address").val();
	var legalRepresentative = $("#legal_name").val();
	var idCard = $("#legal_idcard").val();
	$.ajax({
		type : "post",
		url : "f/front/legalPerson/update",
		data : {
			"organizationName" : organizationName,
			"socialCreditCode" : socialCreditCode,
			"idCard" : idCard,
			"registerAddress" : address,
			"id" : user_id,
			"legalRepresentative" : legalRepresentative,
			"type" : "2"
		},
		success : function(result){
			if(result == "success"){
				alert("信息更新成功");
				$("#gr_box1").show();
				$("#gr_box5").hide();
				$("#gr_box1 h3").html("账号信息");
			}
		},
		error : function(){
			
		}
	});
}