<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.person.title" /></title>
<html:css  name="online_rep_reset,online_rep_gr_zhongxin,online_rep_icon,online_rep_iconfont,online_rep_raty_common,online_rep_raty_demo,online_rep_raty_font-awesome"/>
<html:js name="online_rep_jquery,online_rep_raty_jqueryraty,online_rep_areadata,online_rep_live,online_rep_layer"/>
</head>
<body>
<div class="top">
    <div class="top_12">
        <a href="${adminPath}/onlinerep/index" class="logo">
            <img src="${staticPath}/vendors/online-rep/img/logo2.png" alt="">
        </a>
        <h1>个人中心</h1>
        <a href="${adminPath}/onlinerep/index" class="back_home">返回网站首页</a>
    </div>
</div>
<div class="content">
    <div class="cot_left">
        <div class="user_box">
            <i class="icon_box">
                <img src="${staticPath}/vendors/online-rep/img/user_icon.png" alt="">
            </i>
            <p>您好， <span id="login_name_1"></span></p>
            <p class="state"><a href="javascript:void(0)" onclick="userExit()">注销</a></p>
        </div>
        <ul>
            <li class="on" id="li-1" onclick="Tab(1)">
                账号信息
                <i></i>
            </li>
            <li id="li-2" onclick="findApplicationByIdCard()">
                我的办件
                <i></i>
            </li>
            <li id="li-3" onclick="findAddressByUserId()">
                我的地址
                <i></i>
            </li>
            <li id="li-4" onclick="findMaterialByIdCard()">
                我的材料
                <i></i>
            </li>
            <li id="li-5" onclick="Tab(5)">
                实名认证
                <i></i>
            </li>
        </ul>
    </div>
    <div class="cot_right">
        <div class="gr_box1" id="gr_box1">
        
            <h3>账号信息</h3>
            <!--个人账号信息-->
            <div class="zh_info_user zh_info" id="user_div">
                <div class="icon_box">
                <div class="icon_left">
                    <img src="${staticPath}/vendors/online-rep/img/user_icon.png" alt="">
                </div>
                <div class="icon_right">
                    <p>您好，<span id="login_name_2"></span>！</p>
                    <ul>
                        <li id="real_name_authentication_1">
                            <i></i>
                           <span id="name_authentication_type_1">未实名认证</span>
                        </li>
                        <li id="telephone_authentication_1">
                            <i></i>
                           <span id="telephone_authentication_type_1"> 手机未认证</span>
                        </li>
                        <!-- <li>
                            <i></i>
                            <span>邮箱未绑定</span>
                        </li> -->
                    </ul>
                </div>
            </div>
                <div class="info_box">
                    <ul>
                        <li>
                            <span>真实姓名</span>
                            <input type="text" id="user_name" readonly="readonly">
                        </li>
                        <li>
                            <span>修改密码</span>
                            <button class="xg_pass_btn">修改密码</button>
                        </li>
                      <!--   <li>
                            <span>实名认证</span>
                            <button class="sm_btn">实名认证</button>
                        </li> -->
                        <li>
                            <span>手机号码</span>
                            <input type="text" id="user_telephone">
                            <button class="xg_phone_btn">修改手机号码</button>
                        </li>
                        <li>
                            <span>电子邮箱</span>
                            <input type="text" id="email" disabled="disabled">
                            <button class="xg_btn">绑定邮箱地址</button>
                            <button class="save_btn" id="email_save_btn">保存</button>
                        </li>
                    </ul>
                </div>
            </div>
            <!--法人账号-->
            <div class="zh_info zh_info_company" id="company_div" style="display: none">
                <div class="icon_box">
                    <div class="icon_left">
                        <img src="${staticPath}/vendors/online-rep/img/user_icon.png" alt="">
                    </div>
                    <div class="icon_right">
                        <p>上午好，<span id="company_loginname_1"></span>！</p>
                        <ul>
                             <li id="real_name_authentication_2">
                            <i></i>
                           <span id="name_authentication_type_2">未实名认证</span>
                        </li>
                        <li id="telephone_authentication_2">
                            <i></i>
                           <span id="telephone_authentication_type_2"> 手机未认证</span>
                        </li>
                        </ul>
                    </div>
                </div>
                <div class="info_box">
                    <ul>
                        <li>
                            <span>企业名称</span>
                            <input type="text" id="company_name" value="">
                        </li>
                        <li>
                            <span>社会统一信用代码</span>
                            <input type="text" id="company_idcard" value="">
                        </li>
                        <li>
                            <span>密码</span>
                            <button class="xg_pass_btn">修改密码</button>
                        </li>
                        <li>
                            <span>法定代表人</span>
                            <input type="text" id="legal_representative" value="">
                            
                        </li>
                        <li>
                            <span>法定代表人身份证号码</span>
                            <input type="text" id="legal_representative_idcard" value="">
                        </li>
                        <li>
                            <span>手机号码</span>
                            <input type="text" id="company_telephone">
                            <button  class="xg_phone_btn">修改手机号码</button>
                        </li>
                    </ul>
                </div>
            </div>
            <!--修改密码-->
            <div class="xg_pass" style="display: none">
                <ul>
                    <li>
                        <span>原密码：</span>
                        <input type="password" id="old_password">
                    </li>
                    <li>
                        <span>新密码：</span>
                        <input type="password" class="pass_inp" id="new_password">
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
                        <span>确认新密码：</span>
                        <input type="password" id="re_new_password">
                    </li>
                    
                </ul>
                <button id="save_pwd_btn" type="button">保存</button>
            </div>
            <!--修改密码end-->
            <!--修改手机号码-->
            <div class="xg_phone" style="display: none">
                <div class="phone_1">
                    <ul>
                        <li>
                            <span>原手机号码：</span>
                            <input type="text" id="old_telephone">
                        </li>
                       <!--  <li>
                            <span>验证码：</span>
                            <input type="text">
                            <button>获取验证码</button>
                        </li> -->
                    </ul>
                    <button id="next_telephone_btn">下一步</button>
                </div>
                <div class="phone_2" style="display: none">
                    <ul>
                        <li>
                            <span>新手机号码：</span>
                            <input type="text" id="telephone_1">
                        </li>
                        <li>
                            <span>验证码：</span>
                            <input type="text" id="yzm_code">
                            <button id="j_getVerifyCode_1" onclick="getVerificationCode(1)" type="button">获取验证码</button>
                        </li>
                    </ul>
                    <button type="button" id="save_telephone_btn">保存</button>
                </div>
        </div>
        <!--修改手机号码end-->
        </div>
        <div class="gr_box2" id="gr_box2">
            <div class="box_top">
                我的办件
                <ul>
                    <li>
                        <input type="radio" id="all" name="inp" value="" onclick="findApplicationByIdCard()" checked="checked"/>
                        <label for="all">全部</label>
                    </li>
                    <li>
                        <input type="radio" id="finish" name="inp" value="2" onclick="findApplicationByIdCard()" >
                        <label for="finish">办理中</label>
                    </li>
                  <!--   <li>
                        <input type="radio" id="process" value="3" name="inp" onclick="findApplicationByIdCard()" >
                        <label for="process">待办结</label>
                    </li> -->
                    <li>
                        <input type="radio" id="backTo" value="4" name="inp" onclick="findApplicationByIdCard()">
                        <label for="backTo">已办结</label>
                    </li>
                    <li>
                        <input type="text" id="application_keyword" placeholder="输入事项名称">
                        <button type="button" onclick="findApplicationByIdCard()">搜索</button>
                    </li>
                </ul>
            </div>
            <div class="tab_head">
                <ul>
                    <li style="width: 160px;">办件编号</li>
                    <li style="width: 345px;">事项名称</li>
                    <li style="width: 135px;">受理时间</li>
                    <li style="width: 125px;">办理状态</li>
                    <li style="width: 96px;">操作</li>
                </ul>
            </div>
            <div class="tab_box">
                <table cellspacing="0" cellpadding="0">
                    <tbody id="application">
                        <!-- <tr>
                            <td style="width: 160px;">64010201702201155</td>
                            <td style="width: 345px;">改动、处置、利用文物保护单位或文物的审批</td>
                            <td style="width: 135px;">2017-02-24</td>
                            <td style="width: 125px;">已办结</td>
                            <td>
                                <a href="javascript:">查看详情</a>
                            </td>
                        </tr>-->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="gr_box3" id="gr_box3">
            <h3>我的地址</h3>
            <div class="tab_box">
                <table cellpadding="0" cellspacing="0">
                    <thead>
                        <tr>
                            <td style="width: 120px;">收件人</td>
                            <td style="width: 160px;">联系电话</td>
                            <td style="width: 430px;">收件地址</td>
                            <td>操作</td>
                        </tr>
                    </thead>
                    <tbody id="user_address">
                        <!-- <tr>
                            <td>张三</td>
                            <td>12346588978978</td>
                            <td>陕西省,西安市,某某区,某某街道</td>
                            <td>
                                <button style="background-color: #FF7500;">编辑</button>
                                <button style="background-color: #999999;">删除</button>
                            </td>
                        </tr> -->   
                 </tbody>
                </table>
                <div class="add_dz">
                <form id="address_form">
                    <ul>
                        <li>
                            <span><i>* </i>收件人：</span>
                            <input type="hidden" name="id" id="address_id">
                            <input type="text" name="name" id="address_username">
                        </li>
                        <li>
                            <span><i>* </i>所在地区：</span>
                            <select id="Select_Address_1">

                            </select>
                            <select id="Select_Address_2">

                            </select>
                            <select id="Select_Address_3" onchange="show(this.value)">

                            </select>

                        </li>
                        <li>
                            <span><i>* </i>详细地址：</span>
                            <input type="text" name="street" id="address_street">
                        </li>
                        <li>
                            <span>手机号码：</span>
                            <input type="text" name="telphone" id="address_telephone">
                        </li>
                        <li>
                            <span>邮政编码：</span>
                            <p><input type="text" id="postcode" name="postcode"></p>
                        </li>

                    </ul>
                    </form>
                    <button onclick="addAddress()" type="button">保存</button>
                </div>
            </div>
        </div>
        <div class="gr_box4" id="gr_box4">
            <h3>我的材料</h3>
            <div class="tab_head">
                <ul>
                    <li style="width: 95px;">材料编号</li>
                    <li style="width: 460px;">材料名称</li>
                    <li style="width: 165px;">上传时间</li>
                    <li style="width: 142px;">查看资料</li>
                </ul>
            </div>
            <div class="tab_box">
                <table cellspacing="0" cellpadding="0">
                    <tbody id="material">
                  <!--   <tr>
                        <td style="width: 195px;">64010201702201155</td>
                        <td style="width: 360px;">改动、处置、利用文物保护单位或文物的审批</td>
                        <td style="width: 165px;">2017-02-24</td>
                        <td>
                            <button></button>
                        </td>
                    </tr>
 -->
                    </tbody>
                </table>
            </div>
        </div>
        <div class="gr_box5" id="gr_box5" style="display: none">
    <h3>实名认证</h3>
    <div class="ge_ren ren_zheng" id="real_person" style="display: none">
        <ul>
            <li>
                <span>姓名</span>
                <input type="text" id="real_user_name" class="tab-user-realname" placeholder="请输入姓名">
            </li>
            <li>
                <span>身份证号</span>
                <input type="text" class="tab-user-realname" id="real_user_idcard" placeholder="请输入身份证号码">
            </li>
            <li>
                <span>联系地址</span>
                <select id="Select_UserReal_1"></select>
                <select id="Select_UserReal_2"></select>
                <select id="Select_UserReal_3"></select>
            </li>
            <li>
                <span>详细地址</span>
                <input type="text" id="real_user_address" class="tab-user-realname" placeholder="请输入详细地址">
            </li>
        </ul>
        <button class="realname" type="button">认证</button>
    </div>
    <div class="fa_ren ren_zheng" id="real_company">
        <ul>
            <li>
                <span>企业名称</span>
                <input type="text" id="real_company_name" class="tab-company-realname" placeholder="请输入企业名称">
            </li>
            <li>
                <span>社会统一信用代码</span>
                <input type="text" id="real_company_idcard" class="tab-company-realname" placeholder="请输入社会统一信用代码">
            </li>
            <li>
                <span>法定代表人</span>
                <input type="text" id="legal_name" class="tab-company-realname" placeholder="请输入法定代表人姓名">
            </li>
            <li>
                <span>身份证号</span>
                <input type="text" id="legal_idcard" class="tab-company-realname" placeholder="请输入法定代表人身份证号码">
            </li>
            <li>
                <span>联系地址</span>
                <select id="Select_CompanyReal_1"></select>
                <select id="Select_CompanyReal_2"></select>
                <select id="Select_CompanyReal_3"></select>
            </li>
            <li>
                <span>详细地址</span>
                <input type="text" id="real_company_address" class="tab-company-realname" placeholder="请输入联系地址">
            </li>
        </ul>
        <button class="realname" type="button">认证</button>
    </div>
</div>
</div>
</div>
<!-- demo -->
<div class="Pj-dialogs">
    <div class="Pj-box">
        <h3>服务质量反馈 <i class="close-Pj" onclick="ClosePj()"></i></h3>
        <div class="Pj-tab">
        	<input type="hidden" id="office_number">
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 13%">申报人</td>
                    <td style="width: 26%"><input type="text" id="applicant_name"></td>
                    <td style="width: 35%; text-align: right; padding-right: 10px;">受理部门</td>
                    <td style="width: 26%"><input type="text" id="office_name"></td>
                </tr>
                <tr>
                    <td style="width: 13%">事项名称</td>
                    <td colspan="4"><input type="text" id="trans_name"></td>
                    
                </tr>
                <tr>
                    <td style="width: 13%">星级评价</td>
                    <td colspan="4">
                        <div class="demo">
						    <div id="function-demo" class="target-demo"></div>
						    <div id="function-hint" class="hint"></div>
						    <input type="hidden" id="stars-input" value="3" size="2">
						</div>
                    </td>
                </tr>
                <tr>
                    <td style="padding-left: 15px; padding-right: 15px;">您的建议或者意见</td>
                    <td colspan="4">
                        <textarea id="raty_content"></textarea>
                    </td>
                </tr>
            </table>
        </div>
        <button class="submit" type="button" id="appraise_btn" onclick="addAppraise()">提交</button>
    </div>
</div>
<html:js name="online_rep_405,online_rep_gr_zhongxin,online_rep_common,online_rep_bs_filedownloadView,online_rep_verification_code,online_rep_passlevel"/>
<script type="text/javascript">
$(".xg_btn").click(function () {
	debugger;
    $(this).hide();
    $(this).siblings("input").removeAttr("disabled");
    $(this).siblings(".save_btn").show().siblings("input").focus().addClass("on");
    var Ipt_val=$(this).siblings("input").val();
    $(this).siblings("input").val("");
    $(this).siblings("input").val(Ipt_val);
});
$(".save_btn").click(function () {
    $(this).hide();
    $(this).siblings(".xg_btn").show().siblings("input").focus().removeClass("on");;
});
var fanxiBox = $(".gr_box2 input:checkbox");
fanxiBox.click(function () {
    if(this.checked || this.checked=='checked'){

        fanxiBox.removeAttr("checked");
        $(this).prop("checked", true);
    }
});
function Tab(num) {
    for(var i=1; i<=5;i++){
        if(i==num){
            $("#li-"+i).addClass("on");
            $("#gr_box"+i).show();
        }else {
            $("#li-"+i).removeClass("on");
            $("#gr_box"+i).hide();
        }
    }
}
/*点击修改密码效果*/
$(".xg_pass_btn").click(function () {
    $(".zh_info_user").hide();
    $(".zh_info_company").hide();
    $(".gr_box1 h3").html("修改密码");
    $(".xg_pass").show();
});
/*点击修改手机号效果*/
$(".xg_phone_btn").click(function () {
    $(".zh_info_user").hide();
    $(".zh_info_company").hide();
    $(".gr_box1 h3").html("修改手机号码");
    $(".xg_phone").show();
});

/*第一步上传图片的方法*/
function showImage1() {
    $(".sm_renzheng1 .img_box h5").hide();
    $(".sm_renzheng1 .file_box").hide();
    var r= new FileReader();
    f=document.getElementById('file1').files[0];
    r.readAsDataURL(f);
    r.onload=function  (e) {
        document.getElementById('show1').src=this.result;
    };
    $(".sm_renzheng1 .file_box_again").show();
}
function showImagAgain1() {
  
    var r= new FileReader();
    f=document.getElementById('file1_again').files[0];
    r.readAsDataURL(f);
    r.onload=function  (e) {
        document.getElementById('show1').src=this.result;
    };
}
/*第一步上传图片的方法end*/
/*第二步上传图片的方法*/
function showImage2() {
    $(".sm_renzheng2 .img_box h5").hide();
    $(".sm_renzheng2 .file_box").hide();
    var r= new FileReader();
    f=document.getElementById('file2').files[0];
    r.readAsDataURL(f);
    r.onload=function  (e) {
        document.getElementById('show2').src=this.result;
    };
    $(".sm_renzheng2 .file_box_again").show();
}
function showImagAgain2() {
    var r= new FileReader();
    f=document.getElementById('file2_again').files[0];
    r.readAsDataURL(f);
    r.onload=function  (e) {
        document.getElementById('show2').src=this.result;
    };
}
/*第二步上传图片的方法end*/
/*第三步上传图片的方法*/
function showImage3() {
    $(".sm_renzheng3 .img_box h5").hide();
    $(".sm_renzheng3 .file_box").hide();
    var r= new FileReader();
    f=document.getElementById('file3').files[0];
    r.readAsDataURL(f);
    r.onload=function  (e) {
        document.getElementById('show3').src=this.result;
    };
    $(".sm_renzheng3 .file_box_again").show();
}
function showImagAgain3() {

    var r= new FileReader();
    f=document.getElementById('file3_again').files[0];
    r.readAsDataURL(f);
    r.onload=function  (e) {
        document.getElementById('show3').src=this.result;
    };
}
/*第三步上传图片的方法end*/
/*实名认证*/
$(".sm_btn").click(function () {
    $("#li-1").removeClass("on");
    $("#li-5").addClass("on");
    $(".gr_box1").hide();
    $(".gr_box5").show()
});
$(".sm1_nextbtn").click(function () {
    $(".sm_renzheng1").hide();
    $(".sm_renzheng2").show();
});
$(".sm2_nextbtn").click(function () {
    $(".sm_renzheng1").hide();
    $(".sm_renzheng2").hide();
    $(".sm_renzheng3").show();
})
/*控制评价弹窗的隐藏和显示*/
function ClosePj() {
    $(".Pj-dialogs").hide();
    $("body").css({"overflow":"auto"});
}

</script>
</body>
</html>