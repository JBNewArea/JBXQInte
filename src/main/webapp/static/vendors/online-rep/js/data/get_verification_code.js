/**
 * 获取手机验证码js
 * @param mawenxia
 * @param id
 */

function getVerifyCode(options) {
	return function() {
		clearInterval(timer);
		if(!(options && options.callBack)) {
			throw new Error("必须传递参数及回调函数");
		}
		var that = $(this);
		if(options.isPhone){
			var phone = options.getPhone(),
				reg = options.phoneReg || /^0?1[3|4|5|7|8][0-9]\d{8}$/;
			if(!reg.test(phone)) {
				//如果手机号码不正确，则执行手机号码对应的回调函数
				options.phoneCallBack && options.phoneCallBack.call(that,phone);
				return;
			}
		}
		
		var timer = null,
			time = options.time ||60,
			unabledClass = options.unabledClass || "";
		that.off("click");
		that.addClass(unabledClass);
		timer = setInterval(function() {
			//避免重复发送
			if(time <= 0) {
				clearInterval(timer);
				time = 60;
				that.html("重新获取").removeClass(unabledClass);
				that.val("重新获取").removeClass(unabledClass);
				that.on("click", getVerifyCode(options));
			} else {
				time--;
				that.val(time + "秒后重新获取");
			}
		}, 1000);
		//执行回调函数
		options.callBack.call(that);
	}
}
/**
 * 获取手机验证码，按钮并提示60秒倒计时
 * @param mawenxia
 * @param attr id下标参数
 */
function getVerificationCode(attr,flag){
	var telephone = $("#telephone_"+attr).val();
	$("#j_getVerifyCode_"+attr).removeAttr("onclick");	
	//获取手机验证码
	$("#j_getVerifyCode_"+attr).on("click",getVerifyCode({
		callBack: function (){//按钮点击后的回调函数，--必须--
			//在这里你还是可以对你的按钮进行操作
			sendMessage($("#telephone_"+attr).val(),flag);
		},
		time: 60,//定时时间，以秒为单位，默认60秒
		isPhone: true,//是否为发送手机验证码，如果是则会验证手机号格式，--必须--
		getPhone: function (){//获取手机号，此处一定要return
			return $("#telephone_"+attr).val();
		},
		phoneReg: /^1[34578]\d{9}$/,//手机号验证正则
		phoneCallBack: function (){//当手机号有误时的回调，默认会中止操作
			alert("您输入的手机号有误");
		},
		unabledClass: "unlabed"//按钮不能用的样式，即点击按钮后的样式
	}));
	$("#j_getVerifyCode_"+attr).trigger("click");
	
	//重新绑定点击事件
	$("#j_getVerifyCode_"+attr).bind("click",getVerifyCode({
		callBack: function (){//按钮点击后的回调函数，--必须--
			//在这里你还是可以对你的按钮进行操作
			sendMessage(telephone,flag);
		},
		time: 60,//定时时间，以秒为单位，默认60秒
		isPhone: true,//是否为发送手机验证码，如果是则会验证手机号格式，--必须--
		getPhone: function (){//获取手机号，此处一定要return
			return telephone;
		},
		phoneReg: /^1[34578]\d{9}$/,//手机号验证正则
		phoneCallBack: function (){//当手机号有误时的回调，默认会中止操作
			alert("您输入的手机号有误");
		},
		unabledClass: "unlabed"//按钮不能用的样式，即点击按钮后的样式
	}));
}

/**
 * 发送短信方法
 * @param phone 手机号码
 * @param attr 区分参数
 */
function sendMessage(phone,flag){
	var noteUrl = "";
	if(flag == 1){
		noteUrl = "/JBXQInte/admin/xjlu/regVefyCode";     //阿里短信（注册验证码）
	}else if(flag == 2){
		noteUrl = "f/front/note/sendUpdatePwdValidate";     //阿里短信（修改密码验证码）
	}
	$.ajax({
		type : "post",
		data : {
			"phone" : phone
		},
		url : noteUrl,
		success : function (data){
			//阿里短信返回
			data = eval("("+data+")");
			if(data.message == "OK"){
				layer.msg('发送至手机', {
					  icon: 1,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
			}else{
				layer.msg('未送达至手机', {
					  icon: 2,
					  time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
				}); 
			}
		},
		error :function (){
			alert("发送失败");
		}
	});
}


//验证手机验证码
function telphoneCode(flag){
	/*手机验证码flag参数、1:个人注册，2:法人注册，3:个人忘记密码，4：法人忘记密码，5：个人修改密码，6：法人修改密码*/
	if(flag == 1){
		var input = $("#inputCode_1").val();
	}
	if(flag == 2){
		var input  = $("#inputCode_2").val();
	}
	if(flag == 3){
		var input = $("#smscode_1").val();
	}
	if(flag == 4){
		var input = $("#smscode_2").val();
	}
	if(flag == 5){
		var input = $("#smscode_3").val();
	}
	if(flag == 6){
		var input = $("#smscode_4").val();
	}
	/*if(flag == 7){
		var input = $("#inputCode_7").val();
	}
	if(flag == 8){
		var input = $("#inputCode_8").val();
	}*/
	if(input == null || input == ""){
		document.getElementById("sj_getVerifyCode_"+flag).style.color = "red";
		$("#sj_getVerifyCode_"+flag).empty().append("*验证码不能为空");
		return false;
	}else{
		$.ajax({
			type : "post",
			data : {
				"input" : input
			},
			async : false,
//			url : "f/front/note/checkMessage",
			url : "../f/front/sms/checkMessage",
			success : function(data){
				if(data == "success"){
					$("#sj_getVerifyCode_"+flag).empty();
					if(flag == 1){
						//registerUser()
					}
					if(flag == 2){
						//addLegalPerson()
					}
					if(flag == 3 || flag == 4){
						$(".2").hide();
						$(".3").fadeIn("fast");
					}
					if(flag == 5 || flag == 6){
						/*$(".1").hide();
						$(".2").fadeIn("fast");*/
						loadNext(1,2);
					}
					if(flag == 7 || flag == 8){
						
					}
				}else{
					document.getElementById("sj_getVerifyCode_"+flag).style.color = "red";
					$("#sj_getVerifyCode_"+flag).empty().append("*验证码错误");
					return false;
				}
			},
			error : function (){
			}
		});
	}
	//return true;
	
}