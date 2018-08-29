<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.guide.title" /></title>
<html:css name="online_rep_reset,online_rep_zhinan"/>
<html:js name="online_rep_jquery"/>
</head>
<body>
<div class="top">
    <div class="top_12">
        <a href="javascript:" class="logo">
            <img src="${staticPath}/vendors/online-rep/images/logo.png" alt="">
        </a>
         <div class="user_info">
            <a href="${adminPath}/onlinerep/tolineLogin" id="js_denglu">登录</a>
            <button id="exit" onclick="ExitUser()" style="display:none;">退出</button>
        </div>
    </div>
</div>
<div class="path_nav">
    当前位置： <a href="${adminPath}/onlinerep/index">首页 > </a><a href="${adminPath}/onlinerep/matter">网上办事 > </a><a href="#" class="on">办事指南</a>
</div>
<div class="content">
    <div class="top_box">
        <h2 id="trans_name"></h2>
        <ul>
            <li class="on" id="li-1" onclick="Tab(1)">基本信息</li>
            <li style="left: 120px;" id="li-2" onclick="Tab(2)">办理依据</li>
            <li style="left: 240px;" id="li-3" onclick="Tab(3)">办理条件</li>
            <li style="left: 360px;" id="li-4" onclick="Tab(4)">申请材料</li>
            <li style="left: 480px;" id="li-5" onclick="Tab(5)">办理流程</li>
            <li style="left: 600px;" id="li-6" onclick="Tab(6)">常见问题</li>
            <li style="left: 720px;" id="li-7" onclick="Tab(7)">结果文件</li>
        </ul>
    </div>
    <!--1.基本信息-->
    <div class="bs_zhinan" id="bs_zhinan1">
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 175px;">事项编码</td>
                <td style="width: 280px;" id="trans_basecode"></td>
                <td style="width: 175px;">事项性质</td>
                <td id="trans_nature"></td>
            </tr>
            <tr>
                <td style="width: 175px;">办理主体</td>
                <td style="width: 280px;" id="office_name"></td>
                <td style="width: 175px;">事项分类</td>
                <td id="trans_type"></td>
            </tr>
            <tr>
                <td style="width: 175px;">办理对象</td>
                <td style="width: 280px;" id="service_object"></td>
                <td style="width: 175px;">行使层级</td>
                <td id="work_level"></td>
            </tr>
            <tr>
                <td style="width: 175px;">承诺期限</td>
                <td style="width: 280px;" id="promise_day"></td>
                <td style="width: 175px;">是否收费</td>
                <td id="charge_standard"></td>
            </tr>
            <tr>
                <td style="width: 175px;">法定期限</td>
                <td style="width: 280px;" id="legal_day"></td>
                <td style="width: 175px;">办公时间</td>
                <td id="apply_time"></td>
            </tr>
            <tr>
                <td style="width: 175px;">办事地址</td>
                <td style="width: 280px;" colspan="3" id="address"></td>
            </tr>
            <tr>
                <td style="width: 175px;">监督电话</td>
                <td style="width: 280px;" id="supervise_phone"></td>
                <td style="width: 175px;">是否支持预约办理</td>
                <td id="is_appointment"></td>
            </tr>
            <tr>
                <td style="width: 175px;">是否支持网上支付</td>
                <td id="is_webpay" colspan="3"></td>
            </tr>
            <tr>
                <td style="width: 175px;">是否支持物流快递</td>
                <td style="width: 280px;" id="is_courier"></td>
                <td style="width: 175px;">咨询电话</td>
                <td id="office_phone"></td>
            </tr>
        </table>
    </div>
    <!--2.办理依据-->
    <div class="bs_zhinan" id="bs_zhinan2" style="display: none">
        <table cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <td style="width: 70px;">序号</td>
                    <td>法律法规名称</td>
                    <td style="width: 100px">附件下载</td>
                </tr>
            </thead>
            <tbody id="act_base">
              <!--   <tr>
                    <td>1</td>
                    <td>外商投资、重大企业投资项目核准-权限内重大企业投资项目核准-职权依据-《国务院关于发布＜政府核准的投资项目目录（2014年本）＞的通知》（国发〔2014〕53号）</td>
                    <td>
                        <button></button>
                    </td>
                </tr> -->
            </tbody>
        </table>
    </div>
    <!--3.办理条件-->
    <div class="bs_zhinan" id="bs_zhinan3" style="display: none">
        <ul>
            <li>
                <span>申请条件</span>
                <i class="pull-down"></i>
                <i class="pull-up"></i>
                <div class="tj_box">
                    <ul id="apply_condition">
                        
                    </ul>
                </div>
            </li>
            <li>
                <span>受理条件</span>
                <i class="pull-down"></i>
                <i class="pull-up"></i>
                <div class="tj_box">
                    <ul id="accept_condition">
                        
                    </ul>
                </div>
            </li>
        </ul>
    </div>
    <!--4.申请材料-->
    <div class="bs_zhinan" id="bs_zhinan4" style="display: none">
        <table cellspacing="0" cellpadding="0">
            <thead>
                <tr>
                    <td style="width: 70px;">序号</td>
                    <td>所需材料</td>
                    <td style="width: 100px">空表下载</td>
                    <td style="width: 100px">样表下载</td>
                </tr>
            </thead>
            <tbody id="apply_material">
                <!-- <tr>
                    <td>1</td>
                    <td>申请报告（正式文件）</td>
                    <td><button></button></td>
                    <td><button></button></td>
                </tr> -->

            </tbody>
        </table>
    </div>
    <!--5.办理流程-->
    <div class="bs_zhinan" id="bs_zhinan5" style="display: none">

    </div>
    <!--6.常见问题-->
    <div class="bs_zhinan" id="bs_zhinan6" style="display: none">
		
    </div>

    <!--7.结果文件-->
    <div class="bs_zhinan" id="bs_zhinan7" style="display: none">
		<div style="width:930px;">
			<img id="result_file" style="width:100%; height:auto;"/>
		</div>
    </div>
    
    <a href="javascript:void(0)" class="wy_banli" id="wy_banli">我要办理</a>
    <div class="cn_qixian">
        <p>承诺期限（工作日）</p>
        <i id="promise_day_1"></i>
    </div>
</div>
<html:js name="online_rep_405,online_rep_zhinan,online_rep_common"/>
<script>
var guide = {
		id:'${id}'
}
function Tab(num) {
    for(var i=0;i<=7;i++){
        if(i==num){
            $("#li-"+i).addClass("on");
            $("#bs_zhinan"+i).show();
        }else {
            $("#li-"+i).removeClass("on");
            $("#bs_zhinan"+i).hide();
        }
    }
}
$("#bs_zhinan3 ul li .pull-down").click(function (){
    $(this).hide().siblings(".pull-up").show().siblings(".tj_box").slideDown().parents("li").siblings("li").find(".pull-up").hide().siblings(".pull-down").show().siblings(".tj_box").slideUp();
});
$("#bs_zhinan3 ul li .pull-up").click(function () {
    $(this).hide().siblings(".pull-down").show().siblings(".tj_box").slideUp();
});
</script>
</body>
</html>