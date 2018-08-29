/**
 * 公共js
 * @author mawenxia
 */
var copyright = "主办：南京市江北新区管理委员会行政审批局 版权所有";
var management = "运行管理：南京市江北新区管理委员会行政审批局";
var dt_address = "地址：江苏省南京市浦口区丽景路2号";

$(function(){
	$("#copyright").text(copyright);
	$("#management").text(management);
	$("#dt_address").text(dt_address);
});
//获取url参数的方法
(function($){
	$.getUrlParam = function(name)
	{
	var reg = new RegExp("(^|&)"+name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!=null)
		return unescape(getCharFromUtf8(r[2])); 
		return null;
	}
})(jQuery);

//将URL中的UTF-8字符串转成中文字符串 
function getCharFromUtf8(str) {  
	var cstr = "";  
	var nOffset = 0;  
	if (str == "")  
	return "";  
	    str = str.toLowerCase();  
	    nOffset = str.indexOf("%e");  
	if (nOffset == -1)  
	return str;  
	while (nOffset != -1) {  
	        cstr += str.substr(0, nOffset);  
	        str = str.substr(nOffset, str.length - nOffset);  
	if (str == "" || str.length < 9)  
	return cstr;  
	        cstr += utf8ToChar(str.substr(0, 9));  
	        str = str.substr(9, str.length - 9);  
	        nOffset = str.indexOf("%e");  
	    }  
	return cstr + str;  
	}
//将编码转换成字符 
function utf8ToChar(str) {  
	var iCode, iCode1, iCode2;  
	    iCode = parseInt("0x" + str.substr(1, 2));  
	    iCode1 = parseInt("0x" + str.substr(4, 2));  
	    iCode2 = parseInt("0x" + str.substr(7, 2));  
	return String.fromCharCode(((iCode & 0x0F) << 12) | ((iCode1 & 0x3F) << 6) | (iCode2 & 0x3F));  
} 


//获取cookies中参数的方法
function getParameter(name){
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	if(arr !=null){
		return unescape(arr[2]); 
	}
	return null;
}

/**
 * 判断用户是否登陆
 */
function checksIsLogin(){
	$.ajax({
		type : "post",
		dataType : "json",
		url : "f/front/jump/checksIsLogin",
		success : function(result) {
			if(result.type == 1){
				$("#js_denglu").html(result.loginname);
				document.cookie = "user_id" + "="+ escape (result.id);
				document.cookie = "user_type" + "="+ escape (result.type);
				$("#js_denglu").attr("href","gr_zhongxin.html");
				$("#exit").show();
			}else if(result.type == 2){
				$("#js_denglu").html(result.loginname)
				document.cookie = "legal_id" + "="+ escape (result.id);
				document.cookie = "user_type" + "="+ escape (result.type);
				$("#js_denglu").attr("href","gr_zhongxin.html");
				$("#exit").show();
			}
		}
	});
}

/**
 * 用户注销方法
 */
function ExitUser(){
	$.ajax({
		type : "post",
		url : "f/front/jump/userExit",
		success : function(){
			$("#js_denglu").html("登录");
			$("#exit").hide();
		}
	});
}

/**
 * 删除cookie
 * @param name
 */
function delCookie(name) {
  var exp = new Date();
  exp.setTime(exp.getTime() - 1);
  var cval = getParameter(name);
  if (cval != null)
    document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
}
