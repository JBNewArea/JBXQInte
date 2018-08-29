/**
 * 登录页面方法js
 * @author mawenxia
 * 2017-12-16
 */
var type = '';
/**
 * 页面加载执行方法
 */
$(function() {
	//选择个人按钮事件
	$("#user_type").click(function(){
		$("#login_name").attr("placeholder","请输入用户名/手机号码");
	});
	//选择法人按钮事件
	$("#company_type").click(function(){
		$("#login_name").attr("placeholder","请输入组织机构代码证/手机号码");
	});
	
	//立即登陆点击事件
    $(".login_btn").click(function() {
    	if($(".login_type ul li#user_type").hasClass("on")){
    		type = 1;
    	}
    	if($(".login_type ul li#company_type").hasClass("on")){
    		type = 2;
    	}
    	
        var login_name = $("#login_name").val();
    	var password = $("#password").val()
    	if(login_name && password)
    	{
    		//登录名、密码不为空则执行登陆方法
    		login();
    	}
    	else
    	{
    		if(login_name == "")
    		{
	    	    $("#login_name").attr('placeholder',"用户名不能为空").addClass("error");
    		}
			else
			{
				$("#password").attr('placeholder',"密码不能为空").addClass("error");
			}
		}
	});
})

/**
 * 用户登录方法
 */
function login(){
	var path = '';
	if(type == 1){
		path = "f/front/xzWebUser/login";
	}else{
		path = 'f/front/legalPerson/login'
	}
    var login_name = $("#login_name").val();
	var password = $("#password").val();
	var VerificationCode = $("#VerificationCode_input").val();
	var url = window.location.href;
	var temp = url.split('?');
	var realurl = "";
	if(temp.length > 1)
	{
		var param = temp[1].split('=');
		realurl = param[1];
	}
	$.ajax({
		type : "post",
		dataType : "json",
		url : path,
		data : {
			"loginName" : login_name,
			"plainPassword" : password,
			"VerificationCode" : VerificationCode,
			"realurl" : realurl
		},
		success : function(result){
			if(result.message == "fail")
			{
				layer.msg('用户名或密码错误', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, 
					function(){
						$("#login_name").val("");
						$("#password").val("");
				    }); 
				return false;
			}
			else if(result.message == "null")
			{
				layer.msg('验证码为空', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
				return false;
			}
			else if(result.message == "error")
			{
				layer.msg('验证码错误', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, 
					function(){
						$("#VerificationCode_input").val("");
						refreshVerificationCode()
				    }); 
				return false;
			}
			else if(result.message == "errorPwd")
			{
				layer.msg('密码错误', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, 
					function(){
						$("#password").val("");
					}); 
				return false;
			}
			else{
				if(user_type == 1){
					document.cookie = "user_id" + "="+ escape (result.id);
					document.cookie = "user_type" + "="+ escape (1);
					location.href = result.path ;
				}else{
					document.cookie = "legal_id" + "="+ escape (result.id);
					document.cookie = "user_type" + "="+ escape (2);
					location.href = result.path ;
				}
			}
		}
	});
}

/**
 * 刷新二维码方法
 */
function refreshVerificationCode(){
	$("#VerificationCode").attr('src','/JBXQInte/admin/onlinerep/createImg?'+new Date().getTime());
}
