<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.register.title"/></title>
<html:css name="online_rep_icon,online_rep_reset,online_rep_register,online_rep_reset"/>
<html:js name="online_rep_jquery,online_rep_common,online_rep_layer"/>
</head>
<body>
<div class="top">
    <div class="top_12">
        <a href="${adminPath}/onlinerep/index" class="logo">
            <img src="${staticPath}/vendors/online-rep/img/logo2.png" alt="">
        </a>
        <h1>用户注册</h1>
        <a href="${adminPath}/onlinerep/index" class="back_home">返回网站首页</a>
    </div>
</div>
<div class="reg_box">
	<h2 class="reg_top">
        <ul>
            <li class="on" id="reg_user">个人注册<div></div></li>
            <li id="reg_copany">法人注册<div></div></li>
        </ul>
        <p>以下带<i>*</i>为必填项</p>
    </h2>
    <div class="user_box">
        <form id="person" target="user_register">
            <ul>
                <li>
                    <span>用户名：<i>*</i></span>
                    <input type="text" class="tab-person" id="login_name" name="loginName" placeholder="请输入登录名">
                </li>
                <li>
                    <span>密码：<i>*</i></span>
                    <input type="password" class="pass_inp tab-person" id="user_password" name="plainPassword" placeholder="请输入密码">
                </li>
                <li>
                    <div class="pass_level">
                        <dl>
                            <dd>弱</dd>
                            <dd>中</dd>
                            <dd>强</dd>
                        </dl>
                    </div>
                </li>
                <li>
                    <span>确认密码：<i>*</i></span>
                    <input type="password" id="confirm_user_pwd" class="tab-person" placeholder="请再次输入密码">
                </li>
                <li>
                    <span>手机号码：<i>*</i></span>
                    <input type="text" class="tab-person" name="telphone" id="telephone_1" placeholder="请输入你的手机号">
                </li>
                <li>
                    <span>短信验证码：<i>*</i></span>
                    <input type="text" class="tab-person" id="person_code" placeholder="请输入短信验证码">
                    <input class="get_yzcode" type="button" id="j_getVerifyCode_1" onclick="getVerificationCode(1,1)" value="获取短信验证码">
                </li>
            </ul>
            <button class="reg_btn" id="user_btn" type="button">立即注册</button>
        </form>
        <iframe name="user_register" style="display:none;"></iframe>
    </div>
     <div class="company_box">
        <form id="company">
            <ul>
                <li style="width:800px;">
                    <span>社会统一信用代码：<i>*</i></span>
                    <input type="text" class="tab-company" name="socialCreditCode" placeholder="请输入社会统一信用代码">
                   	<span style="float:right;color:#999;text-align: left;">此账号用于登录</span>
                </li>
                
                <li>
                    <span>密码：<i>*</i></span>
                    <input type="password" id="company_password" class="pass_inp tab-company" name="plainPassword" placeholder="请输入密码">
                </li>
                <li>
                    <div class="pass_level">
                        <dl>
                            <dd>弱</dd>
                            <dd>中</dd>
                            <dd>强</dd>
                        </dl>
                    </div>
                </li>
                <li>
                    <span>确认密码：<i>*</i></span>
                    <input type="text" class="tab-company" id="confirm_company_pwd" placeholder="请再次输入密码">
                </li>
                <li>
                    <span>企业名称：<i>*</i></span>
                    <input type="text" class="tab-company" name="organizationName" placeholder="请输入企业名称">
                </li>
                <li>
                    <span>手机号码：<i>*</i></span>
                    <input type="text" class="tab-company" name="telphone" placeholder="请输入您的手机号" id="telephone_2">
                </li>
                <li>
                    <span>短信验证码：<i>*</i></span>
                    <input type="text" class="tab-company" id="company_code" placeholder="请输入短信验证码">
                    <input class="get_yzcode" type="button" id="j_getVerifyCode_2" onclick="getVerificationCode(2,1)" value="获取短信验证码">
                </li>
            </ul>
            <button class="reg_btn" type="button" id="company_btn">立即注册</button>
        </form>
    </div>
</div>
<html:js name="online_rep_405,online_rep_passlevel,online_rep_register,online_rep_verification_code"/>
<script>
    $("#reg_user").click(function () {
        $(this).addClass("on").siblings("li").removeClass("on");
        $(".user_box").show().siblings(".company_box").hide();
    });
    $("#reg_copany").click(function () {
        $(this).addClass("on").siblings("li").removeClass("on");
        $(".user_box").hide().siblings(".company_box").show();
    })
</script>
</body>
</html>