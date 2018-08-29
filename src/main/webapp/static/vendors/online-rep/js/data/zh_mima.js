var user_type = '';

$(function(){
	//确认点击事件
	$("#save_btn").click(function(){
		if($(".pass_type ul li#user_type").hasClass("on")){
    		user_type = 1;
    	}
    	if($(".pass_type ul li#company_type").hasClass("on")){
    		user_type = 2;
    	}
    	
		if(checkNull())
		{
			updatePassword();
		}
	});
});

/**
 * 判断非空
 * @returns {Boolean}
 */
function checkNull(){
	var input_out = $(".tab-style");
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

/**
 * 手机号码找回密码方法
 */
function updatePassword(){
	var path = '';
	var yzm = $("#person_code").val();
	var telephone = $("#telephone_1").val();
	var password = $("#new_password").val();
	if(user_type == 1){
		path = "f/front/xzWebUser/updatePwd";
	}else{
		path = "f/front/legalPerson/updatePwd";
	}
	$.ajax({
		type : "post",
		dataType : "json",
		url : path,
		data : {
			"loginName" : telephone,
			"plainPassword" : password,
			"yzm" : yzm
		},
		success : function(result){
			if(result.type == "1"){
				layer.msg('修改成功，请登录', {icon: 1});
				window.location.href="login.html";
			}
			else if(result.type == "2")
			{
				layer.msg('验证码错误', {icon: 2});
				$("#person_code").val("");
			}
			else if(result.type == "3")
			{
				layer.msg('验证码为空', {icon: 2});
			}
			else if(result.type == "4")
			{
				layer.msg('该手机号码下没有用户信息，请重新输入', {icon: 2});
				$("#telephone_1").val("");
			}
		},
		error : function(){
			
		}
	});
}