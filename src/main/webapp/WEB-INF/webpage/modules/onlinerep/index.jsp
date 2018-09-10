<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name='Maketime' content='2017-12-04 18:22:53'>
<meta name="sitename" content="南京江北新区政务服务网">
<meta name="siteurl" content="http://njjbxq.jszwfw.gov.cn/index.html">
<meta name="guild" content="">
<meta name="district" content="">
<meta name="sitecatalog" content="">
<title><spring:message code="sys.onlinerep.title" /></title>
<html:css  name="online_rep_page,online_rep_icon,online_rep_hanweb,online_rep_jszwfw"/>
<html:js name="online_rep_jquery"/>
</head>
<body>
<div id="barrierfree_container">
<!--top start-->
</div>
<div class="top"> 
<!-- 头部 -->
<html:js name="online_rep_top"/>
<!--当前站点名称-->
<div class='local_webname' title='南京江北新区政务服务网'><spring:message code="sys.onlinerep.title" /></div>
<script>
//首屏登录弹框
function jisopen(message) {
	alert(message);
}
</script>
<!--集苏活动js-->
<script src="http://www.jszwfw.gov.cn/script/0/1703241420179540.js"></script>
</div>
<!--top end-->
<div class="mian clearfloat">
	<!--要修改的部分-->
	<div class="main1_box">
		<div class="main1 clearfloat">
			<!-- slide start -->
			<div class="slide_left slideBox" id="slideBox">
				<div class="hd">
					<ul>
						<li>
							<i></i>
						</li>
						<li>
							<i></i>
						</li>
						<li>
							<i></i>
						</li>
					</ul>
				</div>
				<div class="bd">
					<div class="tempWrap">
						<ul>
							<li>
								<a href="javascript:">
									<img src="${staticPath}/vendors/online-rep/img/banner001.jpg" alt="">
								</a>
							</li>
							<li>
								<a href="javascript:">
									<img src="${staticPath}/vendors/online-rep/img/banner002.jpg" alt="">
								</a>
							</li>
							<li>
								<a href="javascript:">
									<img src="${staticPath}/vendors/online-rep/img/banner003.jpg" alt="">
								</a>
							</li>
						</ul>
					</div>
				</div>
				<a class="prev" href="javascript:void(0)"></a>
				<a class="next" href="javascript:void(0)"></a>
			</div>
			<!-- slide end -->
			<!-- right start -->
			<div class="main1_right">
				<ul>
					<li>
						<a href="${adminPath}/onlinerep/matter" target="_blank">
							<h4>单项办理</h4>
							<p>ONLINE</p>
						</a>
					</li>
					<li>
						<a href="http://221.226.86.49:8080/WebSiteIndex.aspx" target="_blank">
							<h4>数字化联合图审</h4>
							<p>Chart review</p>
						</a>
					</li>
					<li>
						<a href="${adminPath}/onlinerep/themeMatter">
							<h4>主题办事</h4>
							<p>online theme</p>
						</a>
					</li>
					<li>
						<a href="${adminPath}/onlinerep/toMap">
							<h4>服务地图</h4>
							<p>service map</p>
						</a>
					</li>
				</ul>
			</div>
			<!-- right end -->
		</div>
	</div>
	<script>
        jQuery(".slide_left").slide({mainCell:".bd ul",effect:"leftLoop",autoPlay:true});
        $(".slide_left").hover(function () {
			$(".slide_left .prev").animate({left:"0"});
            $(".slide_left .next").animate({right:"0"});
        },function () {
            $(".slide_left .prev").animate({left:"-40px"});
            $(".slide_left .next").animate({right:"-40px"});
        })
	</script>
	<!--要修改的部分-->
	<div class="main2_box">
		<ul class="main2 sc_sypage1_link">
			<li><a href="http://njjbxq.jszwfw.gov.cn/col/col125417/index.html" target="_blank" class="main2_01 sypage1_link1"></a></li>
			<li><a href="http://221.226.253.51/" target="_blank" class="main2_02 sypage1_link3"></a></li>
			<li><a href="#" target="_blank" class="main2_03 sypage1_link4"></a></li>
			<li><a href="#" target="_blank" class="main2_04"></a></li>
			<li style="margin:0px;"><a href="http://www.jsgsj.gov.cn:58888/province/login.jsp" target="_blank" class="main2_05 sypage1_link5"></a></li>
		</ul>
	</div>
	
	<div class="main3_box">
		<div class="main3">
			<ul class="main3_tab clearfloat">
				<li class="on" style="padding-left: 0;">行政服务</li>
				<li>便民服务</li>
			</ul>
			<ul class="main3_list clearfloat" style="display:block;">
				<li class="main3_list_tit">为网民提供百姓生活相关的各种服务性、提示性信息，包含政策发布、出行提示、医疗信息提示、教育信息、就业信息等内容</li>
				<li class="main3_01 clearfloat">
					<div class="main3_01_grfr clearfloat">
						<div class="main3_01_grfr_tit">个人</div>
						<ul class="main3_01_gr_main clearfloat">
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B101&deptid=" target="_blank" title="生育收养" class="clearfloat"><span></span><em>生育收养</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B102&deptid=" target="_blank" title="户籍办理" class="clearfloat"><span></span><em>户籍办理</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B103&deptid=" target="_blank" title="民族宗教" class="clearfloat"><span></span><em>民族宗教</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B104&deptid=" target="_blank" title="教育科研" class="clearfloat"><span></span><em>教育科研</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B105&deptid=" target="_blank" title="入伍服役" class="clearfloat"><span></span><em>入伍服役</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B106&deptid=" target="_blank" title="就业创业" class="clearfloat"><span></span><em>就业创业</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B107&deptid=" target="_blank" title="设立变更" class="clearfloat"><span></span><em>设立变更</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B108&deptid=" target="_blank" title="准营准办" class="clearfloat"><span></span><em>准营准办</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B109&deptid=" target="_blank" title="抵押质押" class="clearfloat"><span></span><em>抵押质押</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B110&deptid=" target="_blank" title="职业资格" class="clearfloat"><span></span><em>职业资格</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B111&deptid=" target="_blank" title="行政缴费" class="clearfloat"><span></span><em>行政缴费</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B112&deptid=" target="_blank" title="婚姻登记" class="clearfloat"><span></span><em>婚姻登记</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B113&deptid=" target="_blank" title="优待抚恤" class="clearfloat"><span></span><em>优待抚恤</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B131&deptid=" target="_blank" title="规划建设" class="clearfloat"><span></span><em>规划建设</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B114&deptid=" target="_blank" title="住房保障" class="clearfloat"><span></span><em>住房保障</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B115&deptid=" target="_blank" title="社会保障" class="clearfloat"><span></span><em>社会保障</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B116&deptid=" target="_blank" title="证件办理" class="clearfloat"><span></span><em>证件办理</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B117&deptid=" target="_blank" title="交通出行" class="clearfloat"><span></span><em>交通出行</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B118&deptid=" target="_blank" title="旅游观光" class="clearfloat"><span></span><em>旅游观光</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B119&deptid=" target="_blank" title="出境入境" class="clearfloat"><span></span><em>出境入境</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B120&deptid=" target="_blank" title="消费维权" class="clearfloat"><span></span><em>消费维权</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B121&deptid=" target="_blank" title="公共安全" class="clearfloat"><span></span><em>公共安全</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B122&deptid=" target="_blank" title="司法公证" class="clearfloat"><span></span><em>司法公证</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B123&deptid=" target="_blank" title="知识产权" class="clearfloat"><span></span><em>知识产权</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B124&deptid=" target="_blank" title="环保绿化" class="clearfloat"><span></span><em>环保绿化</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B125&deptid=" target="_blank" title="文化体育" class="clearfloat"><span></span><em>文化体育</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B126&deptid=" target="_blank" title="公用事业" class="clearfloat"><span></span><em>公用事业</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B127&deptid=" target="_blank" title="医疗卫生" class="clearfloat"><span></span><em>医疗卫生</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B128&deptid=" target="_blank" title="离职退休" class="clearfloat"><span></span><em>离职退休</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B129&deptid=" target="_blank" title="死亡殡葬" class="clearfloat"><span></span><em>死亡殡葬</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/gr_index.do?webId=137&themid=B130&deptid=" target="_blank" title="其他" class="clearfloat"><span></span><em>其他</em></a></li>
						</ul>
						<div class="main3_01_gr_more">查看全部</div>
					</div>
				</li>
				<li class="main3_01">
					<div class="main3_01_grfr">
						<div class="main3_01_grfr_tit">法人</div>
						<ul class="main3_01_fr_main">
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B201&deptid=" target="_blank" title="设立变更" class="clearfloat"><span></span><em>设立变更</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B202&deptid=" target="_blank" title="准营准办" class="clearfloat"><span></span><em>准营准办</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B203&deptid=" target="_blank" title="资质认证" class="clearfloat"><span></span><em>资质认证</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B204&deptid=" target="_blank" title="年检年审" class="clearfloat"><span></span><em>年检年审</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B205&deptid=" target="_blank" title="税收财务" class="clearfloat"><span></span><em>税收财务</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B206&deptid=" target="_blank" title="人力资源" class="clearfloat"><span></span><em>人力资源</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B207&deptid=" target="_blank" title="劳动保障" class="clearfloat"><span></span><em>劳动保障</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B208&deptid=" target="_blank" title="投资审批" class="clearfloat"><span></span><em>投资审批</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B209&deptid=" target="_blank" title="融资信贷" class="clearfloat"><span></span><em>融资信贷</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B210&deptid=" target="_blank" title="抵押质押" class="clearfloat"><span></span><em>抵押质押</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B211&deptid=" target="_blank" title="商务贸易" class="clearfloat"><span></span><em>商务贸易</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B212&deptid=" target="_blank" title="招标拍卖" class="clearfloat"><span></span><em>招标拍卖</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B213&deptid=" target="_blank" title="海关口岸" class="clearfloat"><span></span><em>海关口岸</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B214&deptid=" target="_blank" title="涉外服务" class="clearfloat"><span></span><em>涉外服务</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B215&deptid=" target="_blank" title="农林牧渔" class="clearfloat"><span></span><em>农林牧渔</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B216&deptid=" target="_blank" title="国土建设" class="clearfloat"><span></span><em>国土建设</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B217&deptid=" target="_blank" title="交通运输" class="clearfloat"><span></span><em>交通运输</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B218&deptid=" target="_blank" title="环保绿化" class="clearfloat"><span></span><em>环保绿化</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B234&deptid=" target="_blank" title="应对气候变化" class="clearfloat"><span></span><em>应对气候变化</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B219&deptid=" target="_blank" title="水务气象" class="clearfloat"><span></span><em>水务气象</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B220&deptid=" target="_blank" title="医疗卫生" class="clearfloat"><span></span><em>医疗卫生</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B221&deptid=" target="_blank" title="科技创新" class="clearfloat"><span></span><em>科技创新</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B222&deptid=" target="_blank" title="文体教育" class="clearfloat"><span></span><em>文体教育</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B223&deptid=" target="_blank" title="知识产权" class="clearfloat"><span></span><em>知识产权</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B224&deptid=" target="_blank" title="民族宗教" class="clearfloat"><span></span><em>民族宗教</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B225&deptid=" target="_blank" title="质量技术" class="clearfloat"><span></span><em>质量技术</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B226&deptid=" target="_blank" title="检验检疫" class="clearfloat"><span></span><em>检验检疫</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B227&deptid=" target="_blank" title="安全生产" class="clearfloat"><span></span><em>安全生产</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B228&deptid=" target="_blank" title="公安消防" class="clearfloat"><span></span><em>公安消防</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B229&deptid=" target="_blank" title="司法公证" class="clearfloat"><span></span><em>司法公证</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B230&deptid=" target="_blank" title="公用事业" class="clearfloat"><span></span><em>公用事业</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B231&deptid=" target="_blank" title="法人注销" class="clearfloat"><span></span><em>法人注销</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B232&deptid=" target="_blank" title="档案文物" class="clearfloat"><span></span><em>档案文物</em></a></li>
							<li><a href="http://nj.jszwfw.gov.cn/jszwfw/bscx/itemlist/fr_index.do?webId=137&themid=B233&deptid=" target="_blank" title="其他" class="clearfloat"><span></span><em>其他</em></a></li>
						</ul>
						<div class="main3_01_fr_more">查看全部</div>
					</div>
				</li>
			</ul>
			<ul class="main3_list clearfloat" style="display: none;">
				<li class="main3_list_tit">为网民提供百姓生活相关的各种服务性、提示性信息，包含政策发布、出行提示、医疗信息提示、教育信息、就业信息等内容</li>
				<li class="main3_bmfw">
					<div class="bmfw">
						<div class="bmfw_1200">
                            <ul class="bmfw_tab clearfloat">
                                <li class="bmfw_tab_li on"><div class="bmfw_tab_01"></div><span>婚育收养</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_06"></div><span>房屋租售</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_03"></div><span>劳动就业</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_05"></div><span>就医保健</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_02"></div><span>教育服务</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_10"></div><span>场馆设施</span></li>
                            </ul>
                        </div>
                         <ul class="bmfw_list clearfloat">
                        	<li class="bmfw_list_01 on">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col121994/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">婚姻</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>婚姻登记机关名录</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col121994/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">收养</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>儿童福利院名录</li>
									        <li>华侨、港澳台公民收养</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col121994/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">生育</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>生育相关证件</li>
									        <li>生育保险</li>
									    </ul>
									</a>
									</li>
                                </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">劳动关系</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>实行不定时工作制和综合计算工时工作制审批</li>
										        <li>劳务派遣行政许可</li>
										        <li>企业经济性裁减人员备案</li>
										        <li>集体合同审查</li>
										        <li>中央驻苏单位和省属单位集体合同审查生效情况查询</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">劳动合同备案</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>新签劳动合同备案</li>
										        <li>劳动合同续变备案</li>
										        <li>劳动合同终止（解除）备案</li>
										        <li>劳动合同备案信息查询</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">调解仲裁</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>开庭公告</li>
										        <li>劳动人事争议仲裁委员会专职仲裁员查询</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">就失业登记</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>用工备案</li>
										        <li>续订备案</li>
										        <li>退工备案</li>
										        <li>解聘备案</li>
										        <li>就业登记</li>
										        <li>失业登记</li>
										        <li>就失业信息查询</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">就业援助</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>零就业家庭申报</li>
										        <li>就业困难人员申报</li>
										        <li>补贴申请</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">职业指导</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>职业评测</li>
										    </ul>
										</a>
									</li>
                                </ul>
                                <a class="bmfw_list_more" href="http://njjbxq.jszwfw.gov.cn/col/col122481/index.html" target="_blank">查看更多</a>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                    
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122099/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">药店信息</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>医保定点药店信息</li>
										        <li>医保全省联网定点药店信息</li>
										        <li>全省各市零售药店信息</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122099/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">药品信息</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>医保药品信息查询</li>
										    </ul>
										</a>
									</li>
                                </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                    
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">幼儿园</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>幼儿入园指南</li>
										        <li>幼儿园机构信息</li>
										        <li>幼儿园入园政策</li>
										        <li>公办幼儿园收费</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">小学</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>入学指南</li>
										        <li>转学指南</li>
										        <li>休学指南</li>
										        <li>复学指南</li>
										        <li>小学学校信息</li>
										        <li>小学就读政策</li>
										        <li>公办学校住宿费</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">初中</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>小学升初中指南</li>
										        <li>转学指南</li>
										        <li>休学指南</li>
										        <li>复学指南</li>
										        <li>初中学校信息</li>
										        <li>初中就读政策</li>
										        <li>公办学校住宿费</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">普通高中</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>初中升高中考试</li>
										        <li>入学指南</li>
										        <li>转学指南</li>
										        <li>休学指南</li>
										        <li>复学指南</li>
										        <li>普通高中学业水平测试指南</li>
										        <li>普通高考政策</li>
										        <li>高中学校信息</li>
										        <li>高中就读政策</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">中等职业学校</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>入学指南</li>
										        <li>转学指南</li>
										        <li>休学指南</li>
										        <li>复学指南</li>
										        <li>中等职业学校信息</li>
										        <li>中等职业学校就读政策</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">特殊教育</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>入学指南</li>
										        <li>转学指南</li>
										        <li>休学指南</li>
										        <li>复学指南</li>
										        <li>特殊教育学校信息</li>
										        <li>特殊教育就读政策</li>
										    </ul>
										</a>
									</li>
                                </ul>
                                <a class="bmfw_list_more" href="http://njjbxq.jszwfw.gov.cn/col/col122116/index.html" target="_blank">查看更多</a>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122472/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">场馆设施</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>艺术馆</li>
										        <li>博物馆</li>
										        <li>展览馆</li>
										        <li>档案馆</li>
										        <li>体育场馆</li>
										        <li>文化馆</li>
										        <li>文物保护单位</li>
										        <li>图书馆</li>
										    </ul>
										</a>
									</li>
                                </ul>
                            </li>
                        </ul>
					</div>
					<div class="bmfw">
                        <div class="bmfw_1200">
                            <ul class="bmfw_tab clearfloat">
                                <li class="bmfw_tab_li"><div class="bmfw_tab_07"></div><span>交通出行</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_08"></div><span>社会保险</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_17"></div><span>福利救助</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_11"></div><span>公共安全</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_14"></div><span>司法公正</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_04"></div><span>纳税缴费</span></li>
                            </ul>
                        </div>
                        <ul class="bmfw_list clearfloat">
                        	<li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122222/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">事故处理</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>交通事故认定</li>
										        <li>交通事故救援</li>
										        <li>交通事故损害赔偿</li>
										        <li>交通违法信息查询</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122222/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">驾驶证服务</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>机动车驾驶证申领</li>
										        <li>机动车驾驶证审验</li>
										        <li>机动车驾驶证补证</li>
										        <li>异地驾驶证转入</li>
										        <li>机动车驾驶证定期换证</li>
										        <li>机动车驾驶证换证</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122222/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">交通违章</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>机动车驾驶证的信息变更、注销</li>
										        <li>机动车违章罚款查询</li>
										        <li>机动车违章罚款缴费信息</li>
										        <li>网上缴费服务</li>
										        <li>机动车违章罚款通知公告</li>
										        <li>缴费服务常见问题解答信息</li>
										        <li>机动车违章罚款政策规定</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122222/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">机动车服务</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>机动车注册登记</li>
										        <li>机动车网上自动选号</li>
										        <li>机动车定期检验</li>
										        <li>机动车检验（6年免检车辆检验合格标志申领）</li>
										        <li>机动车注销登记</li>
										        <li>机动车变更登记（车身颜色、更换发动机等）</li>
										        <li>机动车共同所有人变更</li>
										        <li>补领、换领机动车行驶证</li>
										        <li>补领、换领机动车号牌</li>
										    </ul>
										</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122222/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">车管所</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>车管所信息</li>
										    </ul>
										</a>
									</li>
	                                </ul>
		                            </li>
		                            <li class="bmfw_list_01">
		                            	<ul class="bmfw_list_11 clearfloat">
									                                    
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">五险合一</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>参保登记服务</li>
									        <li>参保变更服务</li>
									        <li>缴费服务</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">养老保险</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>养老待遇</li>
									        <li>退休人员社会化管理</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">医疗保险</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>医保参保状态查询（参保、停保）</li>
									        <li>医保待遇状态查询（门慢、门特、住院等）</li>
									        <li>医疗保险个人帐户查询</li>
									        <li>参保人员医疗费用明细查询</li>
									        <li>医疗保险定点医疗机构资格审查</li>
									        <li>基本医疗保险定点零售药店资格审查</li>
									        <li>定点医疗机构查询</li>
									        <li>定点零售药店查询</li>
									        <li>药品目录库品种维护</li>
									        
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">工伤保险</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>工伤事故申报</li>
									        <li>工伤认定</li>
									        <li>劳动能力初次鉴定申请</li>
									        <li>劳动能力复核鉴定申请</li>
									        <li>劳动能力再次鉴定申请</li>
									        <li>劳动能力复查鉴定申请</li>
									        <li>参加基本养老保险职工因病或非因工伤致残丧失劳动</li>
									        <li>工伤信息查询</li>
									        <li>工伤定期待遇查询</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">社会保障卡</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>社会保障卡申领</li>
									        <li>社会保障卡挂失</li>
									        <li>社会保障卡补换卡</li>
									        <li>社会保障卡非卡面信息修改</li>
									        <li>社会保障卡状态查询</li>
									        <li>社会保障卡基本信息查询</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">失业保险</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>失业待遇申领</li>
									        <li>失业信息查询</li>
									        <li>失业保险金发放查询</li>
									    </ul>
									</a>
									</li>


                                </ul>
                                <a class="bmfw_list_more" href="http://njjbxq.jszwfw.gov.cn/col/col122259/index.html" target="_blank">查看更多</a>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                    
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122017/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">社会救助</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>生活无着的流浪乞讨人员救助</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122017/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">老年人服务</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>养老机构名录</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122017/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">抚恤优待</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>伤残抚恤关系转移</li>
									        <li>带病回乡退伍军人认定</li>
									    </ul>
									</a>
									</li>

                                </ul>
                                
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                    
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122037/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">突发、灾害事件</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>自然灾害安全预警</li>
									        <li>防灾知识宣传</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122037/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">食品安全</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>食品安全抽检信息公示</li>
									        <li>食品安全科普宣传</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122037/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">应急救援</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>突发事件应急工作机制</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122037/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">避难场所</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>应急避难场所</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122037/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">政策文件</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>公共安全相关政策文件信息</li>
									        <li>社保救助相关政策法规及解读信息</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122037/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">报警</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>报警途径</li>
									        <li>区域警察联系方式</li>
									    </ul>
									</a>
									</li>
                                </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122716/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">法律职业资格</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>司法考试报名</li>
									        <li>法律职业资格申领</li>
									        <li>法律职业资格调档</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122716/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">公共法律服务中心</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>法律咨询</li>
									        <li>热线服务</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122716/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">法律援助</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>法律援助申请指南</li>
									        <li>全省法律援助机构信息</li>
									        <li>法律援助条例</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122716/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">基层工作</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>基层法律服务工作者执业核准</li>
									        <li>政策文件</li>
									        <li>司法所机构名录</li>
									        <li>人民调解委员会</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122716/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">公证服务</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>公证事项办理</li>
									        <li>公证机构、公证员名录</li>
									        <li>政策文件</li>
									    </ul>
									</a>
									</li>
                                </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122180/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">国税服务</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>国家税务机关名录</li>
									        <li>国家税务机关办税服务场所名录</li>
									        <li>税务登记</li>
									        <li>税收资格、身份办理</li>
									        <li>税收优惠及特定事项办理</li>
									        <li>发票办理</li>
									        <li>申报纳税</li>
									        <li>税收证明出具</li>
									        <li>涉税表单下载</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122180/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">地税服务</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>地方税务机关名录</li>
									        <li>地方税务办税服务场所名录</li>
									        <li>税务登记</li>
									        <li>发票办理</li>
									        <li>申报纳税</li>
									        <li>税务认定</li>
									        <li>增值税优惠办理</li>
									        <li>个人所得税优惠办理</li>
									        <li>房产税优惠办理</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122180/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">缴费</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>水</li>
									        <li>国家税务机关办税服务场所名录</li>
									        <li>气</li>
									        <li>广播电视</li>
									        <li>垃圾</li>
									        <li>机动车违章网上缴费</li>
									    </ul>
									</a>
									</li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <div class="bmfw">
                        <div class="bmfw_1200">
                            <ul class="bmfw_tab clearfloat">
                                <li class="bmfw_tab_li"><div class="bmfw_tab_12"></div><span>创新就业</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_15"></div><span>气象环保</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_09"></div><span>证件办理</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_13"></div><span>三农服务</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_16"></div><span>机构名录</span></li>
                                <li class="bmfw_tab_li"><div class="bmfw_tab_18"></div><span>其他</span></li>
                            </ul>
                        </div>
                        <ul class="bmfw_list clearfloat">
                        	<li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122373/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">创业服务</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>创业培训报名</li>
									        <li>创业项目申报</li>
									        <li>创业培训基地申报</li>
									        <li>创业孵化基地空位申报</li>
									        <li>创业项目查询</li>
									        <li>创业指导专家查询</li>
									        <li>创业培训定点机构查询</li>
									        <li>创业培训基地审批</li>
									        <li>创业培训基地查询</li>
									    </ul>
									</a>
									</li>
                                </ul>
                            </li>
                        	<li class="bmfw_list_01 clearfloat">
                            	<ul class="bmfw_list_11">
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122401/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">气象</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>天气预报</li>
									        <li>天气实况</li>
									        <li>气象灾害预警</li>
									    </ul>
									</a>
									</li>
                                </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
										<li class="bmfw_list_11_01 clearfloat">
										<a href="http://njjbxq.jszwfw.gov.cn/col/col122063/index.html" target="_blank" class="clearfloat">
										    <span class="bmfw_list_11_11">身份证明类</span>
										    <ul class="bmfw_list_11_12 clearfloat">
										        <li>居民户口簿</li>
										        <li>居民身份证</li>
										        <li>出入境通行证</li>
										        <li>护照</li>
										        <li>港澳通行证</li>
										        <li>老年人优待证</li>
										        <li>违法犯罪记录查询证明</li>
										        <li>现役军人居民身份证</li>
										        <li>大陆居民往来台湾通行证</li>
										    </ul>
										</a>
										</li>
											<li class="bmfw_list_11_01 clearfloat">
											<a href="http://njjbxq.jszwfw.gov.cn/col/col122063/index.html" target="_blank" class="clearfloat">
											    <span class="bmfw_list_11_11">婚姻生育类</span>
											    <ul class="bmfw_list_11_12 clearfloat">
											        <li>结婚证</li>
											        <li>妊娠诊断证</li>
											        <li>准生证</li>
											        <li>出生医学证明</li>
											        <li>独生子女证</li>
											        <li>预防接种证</li>
											        <li>再育证</li>
											        <li>离婚证</li>
											        <li>婚前医学检查证明</li>
											    </ul>
											</a>
											</li>
                                   </ul>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                </ul>
                                <script>
								  $(function(){
								    $('.bmfw_tab_li').eq(15).css('display','none');
								  })
								</script>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">人防工程单位名录</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>民防局（人民防空办公室）</li>
									        <li>核应急办公室</li>
									        <li>人防工程质量监督站</li>
									        <li>人防工程标准定额站</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">婚育收养单位名录</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>预防接种单位名录</li>
									        <li>婚姻登记机关名录</li>
									        <li>计划生育管理机构名录</li>
									        <li>儿童福利院名录</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">司法公正机构名录</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>律师事务所和律师服务</li>
									        <li>公证机构、公证员名录</li>
									        <li>司法所机构名录</li>
									        <li>司法鉴定机构，及司法鉴定人员名单</li>
									        <li>全省法律援助机构信息</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">纳税缴费机构名录</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>国家税务机关名录</li>
									        <li>国家税务机关办税服务场所名录</li>
									        <li>地方税务机关名录</li>
									        <li>地方税务办税服务场所名录</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">公共安全机构名录</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>区域警察联系方式</li>
									    </ul>
									</a>
									</li>
									<li class="bmfw_list_11_01 clearfloat">
									<a href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank" class="clearfloat">
									    <span class="bmfw_list_11_11">福利救助机构名录</span>
									    <ul class="bmfw_list_11_12 clearfloat">
									        <li>儿童福利院名录</li>
									        <li>养老机构名录</li>
									    </ul>
									</a>
									</li>
                                </ul>
                                <a class="bmfw_list_more" href="http://njjbxq.jszwfw.gov.cn/col/col122752/index.html" target="_blank">查看更多</a>
                            </li>
                            <li class="bmfw_list_01">
                            	<ul class="bmfw_list_11 clearfloat">
                                </ul>
                            </li>
                        </ul>
                    </div>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
<html:js name="online_rep,online_rep_405,online_rep_common"/>
</html>