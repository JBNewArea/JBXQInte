/**
 * 注册页面数据获取js
 */
$(function() {
	
	//个人注册用户名判断
	$("#login_name").blur(function(){
		if($("#login_name").val()){
			var reg = /^[0-9a-zA-Z]+$/
			var str = $("#login_name").val();
			if(!reg.test(str)){
				layer.msg('登录名只能由数字或者字母组成', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
						$("#login_name").val("");
				}); 
				return false;
			}
		}
	});
	
	//个人用户注册  确认密码失去焦点事件
	$("#confirm_user_pwd").blur(function () {
		if($("#user_password").val() != $("#confirm_user_pwd").val())
		{
			$(this).val("");
			$(this).attr('placeholder',"请确认两次密码相同").addClass("error");
		}
	});
	//个人用户注册  提交按钮事件
	$("#user_btn").click(function() {
		if(showEffect("person"))
		{
			register("person");
		}
	});
	//企业用户注册  确认密码失去焦点事件
	$("#confirm_company_pwd").blur(function () {
		if($("#company_password").val() != $("#confirm_company_pwd").val())
		{
			$(this).val("");
			$(this).attr('placeholder',"请确认两次密码相同").addClass("error");
		}
	});
	//企业用户注册  提交按钮事件
	$("#company_btn").click(function() {
		if(showEffect("company"))
		{
			register("company");
		}
	});
})
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
/**
 * 注册方法
 */
function register(type){
	var code = $("#"+type+"_code").val();
	var data = $("#"+type).serialize();
	data += "&code=" + code;
	var path = '';
	if(type == "person")
	{
		path = "/JBXQInte/admin/xjlu/doRegister";
	}
	else
	{
		path = "f/front/legalPerson/insert"
	}
	$.ajax({
		type : "post",
		url : path,
		data : data,
		success : function(result){
			var json = eval("("+result+")");
			if(json.message == "fail")
			{
				layer.msg('注册失败', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
				return false;
			}
			else if(json.message == "null")
			{
				layer.msg('验证码为空', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
				return false;
			}
			else if(json.message == "error")
			{
				layer.msg('验证码错误', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
				return false;
			}
			else if(json.message == "reLoginName")
			{
				layer.msg('该证件号码已注册过账号，请直接登陆！', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
				setTimeout("location.href = 'login.html'",3000);
				return false;
			}
			else
			{
				layer.msg('注册成功，请登录', {icon: 1});
				window.location.href="login.html";
			}
		}
	});
}

/**
 * 获取手机验证码
 * @author mawenxia
 * @param flag 区分个人（1）、企业（2）
 */
function getPhoneVerificationCode(flag){
	var telephone = $("#telephone_"+flag).val();
	getVerificationCode(telephone,flag);
}