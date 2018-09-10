<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.login.title" /></title>
<html:css name="online_rep_icon,online_rep_reset,online_rep_login"/>
<html:js name="online_rep_jquery,online_rep_common,online_rep_layer"/>
</head>
<body>
<div class="top">
    <div class="top_12">
        <a href="${adminPath}/onlinerep/index" class="logo">
            <img src="${staticPath}/vendors/online-rep/img/logo.png" alt="">
        </a>
        <h1>用户登录</h1>
        <a href="${adminPath}/onlinerep/index" class="back_home">返回网站首页</a>
    </div>
</div>
<div class="login_box">
    <h2>用户登录</h2>
    <div class="login_type">
        <ul>
            <li class="on" id="user_type"><i></i>个人</li>
            <li id="company_type"><i></i>法人</li>
        </ul>
    </div>
    <input type="text" id="login_name" style="background-image: url('${staticPath}/vendors/online-rep/img/inp_icon01.png')" placeholder="请输入用户名/手机号码">
    <input type="password" id="password" style="background-image: url('${staticPath}/vendors/online-rep/img/inp_icon02.png')" placeholder="请输入密码">
    <div class="yz-box">
        <input type="text" class="yz-code" id="VerificationCode_input" placeholder="验证码">
        <img src="${adminPath}/onlinerep/createImg" id="VerificationCode" class="yz-img">
         <button class="huan" type="button" onclick="refreshVerificationCode()"></button>
    </div>
    <div class="jz_mima">
       <!--  <div class="jz_left">
            <i></i>
            <span>下次记住密码</span>
        </div> -->
        <a href="zh_mima.html" class="zh_mima">忘记密码？</a>
    </div>
    <button class="login_btn">立即登录</button>
    <p class="log_now">还没有账号？ <a href="${adminPath}/onlinerep/toRegister">立即注册</a></p>
</div>
<div class="foot" style="position: absolute; bottom: 0;left: 0; width: 100%;">
     <html:js name="online_rep_405"/>
</div>
</body>
    <html:js name="online_rep_login"/>
    <script type="text/javascript">
	    $(".jz_left").click(function () {
	        $(this).find("i").toggleClass("on")
	    })
	    $(".login_type ul li").click(function () {
	        $(this).addClass("on").siblings().removeClass("on");
	    })
    </script>
</html>