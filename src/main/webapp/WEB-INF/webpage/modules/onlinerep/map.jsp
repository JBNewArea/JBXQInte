<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.map.title"/></title>
<html:css  name="online_rep_reset,online_rep_common,online_rep_icon,online_rep_map"/>
<html:js   name="online_rep_jquery"/>
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
<div class="map_box">
    <h3 class="title">办事大厅分布及简介</h3>
    <div class="left l" id="map">

    </div>
    <div class="right">
        <h4 class="intro">服务简介</h4>
        <p>江北新区行政审批局于2017年8月3日正式挂牌成立，同时加挂江北新区政务服务中心牌子，内设5个机构，分别为：综合办、监督管理办、经济事务审批办、投资项目审批办和城管环保审批办，同时承担新区投资建设代办服务中心、“12345”政务热线中心和公共资源交易分中心的职能。实行“一个部门对外、一份清单服务、一枚印章审批”。</p>
        <p>行政审批局负责统筹推进新区行政审批制度改革，在直管区范围内推行相对集中行政许可权改革试点，着力打造“535”工程：即落实“一局负责、一窗受理、一人专办、一站审批、一网服务”的“五个一”总体要求，兑现“专责专办、预审代办、特事特办”三项服务承诺，实现“减事项、减材料、减环节、减评估、减费用”的“五个减”改革成效。</p>
        <p>江北新区政务服务中心是管委会为改善新区营商环境打造的、面向直管区企业和群众的审批综合服务平台。旨在通过中心建设，规范权力运行，强化权力监督，提高审批效能，方便群众办事。新区目前共设有两处政务大厅，分别为丽景路大厅和园西路大厅。丽景路大厅占地面积1470平方米，设置政务服务窗口48个，进驻部门14个，入厅事项194项，内部共分为六大功能区，分别为：经济事务审批区、知识产权综合受理区、政务网咖自助服务区、投资项目综合受理区、社保大厅和商务休闲区。</p>
		
		<h5>联系我们：</h5>
       <p> 1.南京市江北新区管理委员会行政审批局</p>
       <p> 地址：南京市浦口区丽景路2号</p>
        <p>2.南京江北新区政务服务中心（丽景路）</p>
        <p>地址：南京市浦口区丽景路2号</p>
        <p>3. 南京江北新区政务服务中心（园西路）</p>
        <p>地址：南京市六合区园西路180号</p>
    </div>
</div>
<html:js name="online_rep_405,online_rep_echarts,online_rep_nj,online_rep_mustache,online_rep_hall,online_rep_common"/>
</body>
</html>