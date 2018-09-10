<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.shixiang.title" /></title>
<html:css name="online_rep_reset,online_rep_sb_shixiang,online_rep_jquery.page,online_rep_icon"/>
<html:js name="online_rep_jquery"/>
</head>
<body>
<!--顶部-->
<div class="top">
    <div class="top_12">
        <a href="${adminPath}/onlinerep/index" class="logo">
            <img src="${staticPath}/vendors/online-rep/images/logo.png" alt="">
        </a>
        <div class="user_info">
            <a href="${adminPath}/onlinerep/tolineLogin" id="js_denglu">登录</a>
            <button id="exit" onclick="ExitUser()" style="display:none;">退出</button>
        </div>
    </div>
</div>
<!--内容区-->
<div class="content">
    <div class="cot_top">
        <h3>所有申办主题事项</h3>
        <div class="sea_box">
           <!--  <div class="xz_type">
                <div class="option_first">
                    按部门
                </div>
                <ul>
                    <li class="option">按部门</li>
                    <li class="option">按事项</li>
                </ul>
            </div> -->
            <input type="text" id="transKeyword" placeholder="输入主题事项名称">
            <button onclick="findTrans(1)" type="button">搜索</button>
        </div>
    </div>
    <div class="cot_box">
        <ul id="translist">
            <!-- <li>
                <div class="left_box">
                    <h4>对于残疾人教育有突出贡献的单位和个人的奖励</h4>
                    <p><span>受理机构：</span><span>南京市江北新区教育局</span></p>
                    <p class="btm_text">
                        <span>全程网办服务</span>
                        <span>物流快递服务</span>
                        <span>在线支付服务</span>
                        <span>在线视频服务</span>
                    </p>
                </div>
                <div class="right_box">
                    <dl>
                        <dd class="on"></dd>
                        <dd class="on"></dd>
                        <dd class="on"></dd>
                        <dd class="on"></dd>
                        <dd></dd>
                    </dl>
                    <a href="javascript:">在线办理</a>
                </div>
            </li>-->       
           </ul>
    </div>
    <div class="tcdPageCode"></div>
</div>
<div class="foot">
   <html:js name="online_rep_405"/>
</div>
</body>
 <html:js name="online_rep_jquery.page,online_rep_common,online_rep_trans_theme"/>
 <script>
    $(document).ready(function () {
        //仿select选项下拉/隐藏效果
        $(".option_first").click(function(){
            var datatype=$('.option_first').attr('datatype');
            if(datatype==1){
                $(this).css('background-position','75px top');
                $(this).attr('datatype','2');
            }else{
                $(this).css('background-position','75px bottom');
                $(this).attr('datatype','1');
            }

        });
        $(".xz_type .option").click(function(){
            $(".option_first").text($(this).text());
            $(".option_first").css('background-position','75px top');
            $(".option_first").attr('datatype','2');
        });
        $(".option_first").click(function(){
            $(".xz_type .option").stop().slideToggle(300);
        });
        $(document).click(function(event){
            if(!$(event.target).hasClass('option_first')){
                $(".xz_type .option").stop().slideUp(300);
            }
        });
    });
    function getColor() {
        for(var i=1;i<=100;i=i+2){
            $(".cot_box ul li").eq(i).css({"background-color":"white","border-color":"white"})
        }
    }
    getColor();
</script>
</html>