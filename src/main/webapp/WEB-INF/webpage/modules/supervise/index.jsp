<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
      <!-- META TAGS -->
     <meta charset="UTF-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>江北新区舆情管理平台</title>
     <html:css  name="supervise_5152,supervise_responsive_5152,supervise_main_5152,supervise_prettyphoto,supervise_custom_5152"/>
</head>
<body>
 <!-- Start of Header -->
<div class="header-wrapper">
	 <header>
	 	 <div class="container">
	 	 	<div class="logo-container">
                  <!-- Website Logo -->
                  <a href="#"  title="Knowledge Base Theme">
                           <img src="http://221.226.86.27:8080/cas/images/logo.png" style="width:51px;height:40px;" alt="Knowledge Base Theme">
                  </a>
                  <span class="tag-line">江北新区舆情管理平台</span>
             </div>
	 	 	     <!-- Start of Main Navigation -->
                 <nav class="main-nav">
                         <div class="menu-top-menu-container">
                                 <ul id="menu-top-menu" class="clearfix">
                                  		   <li><a href="${appPath}/admin/supervise/index">交流中心</a></li>
                                           <li><a href="${appPath}/admin/supervise/contact">提问</a></li>
                                 </ul>
                         </div>
                 </nav>
                 <!-- End of Main Navigation -->
	 	 </div>
	 </header>
</div>
 <!-- End of Header -->
 <!-- Start of Search Wrapper -->
    <div class="search-area-wrapper">
            <div class="search-area container">
                    <h3 class="search-header">有什么问题吗?</h3>
                    <p class="search-tag-line">如果你有任何问题 你可以在以下输入框填写问题搜索</p>

                    <form id="search-form" class="search-form clearfix" method="get" action="#" autocomplete="off">
                            <input class="search-term required" type="text" id="s" name="s" placeholder="在这里输入你想要查询的问题" title="请进入搜索项目" />
                            <input class="search-btn" type="submit" value="Search" />
                            <div id="search-error-container"></div>
                    </form>
            </div>
    </div>
 <!-- End of Search Wrapper -->
 <!-- Start of Page Container -->
     <div class="page-container">
     	<div class="container">
            <div class="row">
            	 <!-- start of page content -->
                 <div class="span8 main-listing">
                         <article class="format-standard type-post hentry clearfix">
                                 <header class="clearfix">
                                         <h3 class="post-title">
                                                 <a href="${appPath}/admin/supervise/view">XXX意见</a>
                                         </h3>
                                         <div class="post-meta clearfix">
                                                 <span class="date">25 Feb, 2018</span>
                                                 <span class="category"><a href="#" title="View all posts in Server &amp; Database">意见</a></span>
                                                 <span class="comments"><a href="#" title="Comment on Integrating WordPress with Your Website">1 回复</a></span>
                                                 <span class="like-count">66</span>
                                         </div><!-- end of post meta -->
                                 </header>
                                 <p>江苏省涉外婚姻和涉外收养登记服务中心于2004年9月由省编办批复成立（苏编办[2004]195号），隶属于江苏省民政厅，为正处级自收自支事业单位，编制10人。其主要职责是为涉外婚姻和涉外收养提供登记服务，承担全省涉外婚姻和涉外收养的档案整理归档、弃婴公告、涉外送养材料审核和报送、涉外送养业务指导和培训等行政职能，分担全省社会福利机构儿童养育和国内收养部分具体工作...</p>
                         </article>
                         <article class="format-standard type-post hentry clearfix">
                                 <header class="clearfix">
                                         <h3 class="post-title">
                                                 <a href="#">XXX投诉</a>
                                         </h3>
                                         <div class="post-meta clearfix">
                                                 <span class="date">2018-8-10</span>
                                                 <span class="category"><a href="#" title="View all posts in Advanced Techniques">投诉</a></span>
                                                 <span class="comments"><a href="#" title="Comment on Using Javascript">0 回复</a></span>
                                                 <span class="like-count">18</span>
                                         </div><!-- end of post meta -->
                                 </header>
                                 <p>窗口人员办事效率过低。。。</p>
                         </article>
                         <article class=" type-post format-image hentry clearfix">
                                 <header class="clearfix">
                                         <h3 class="post-title">
                                                 <a href="single.html">XXX图文信息</a>
                                         </h3>
                                         <div class="post-meta clearfix">
                                                 <span class="date">25 Feb, 2013</span>
                                                 <span class="category"><a href="#" title="View all posts in Designing in WordPress">图文内容</a></span>
                                                 <span class="comments"><a href="#" title="Comment on Using Images">0 回复</a></span>
                                                 <span class="like-count">7</span>
                                         </div><!-- end of post meta -->
                                 </header>
                                 <a href="#" title="Using Images"><img width="770" height="501" src="${appPath}/static/vendors/supervise/images/temp/living-room-770x501.jpg" class="attachment-std-thumbnail wp-post-image" alt="Living room"></a>
                                 <p>宜家家居是来自瑞典的全球知名家具和家居零售商,互为和谐的产品系列在功能和风格上可谓种类繁多。无论你喜爱哪一种风格,都有为所有人提供的家居产品和解决方案,并以为大众创造更美好的日常生活为理念.欢迎来到宜家的创意家居世界,为您带来更多更低价格的产品。</p>
                         </article>
                 </div>
                 <!-- end of page content -->
                  <!-- start of sidebar -->
                   <aside class="span4 page-sidebar">
                           <section class="widget">
                                   <div class="support-widget">
                                           <h3 class="title">帮助</h3>
                                           <p class="intro">需要更多的支持吗？如果您没有找到答案，请与我们联系以获得进一步的帮助。</p>
                                   </div>
                           </section>
                           <section class="widget">
                                   <h3 class="title">top10</h3>
                                   <ul class="articles">
                                           <li class="article-entry standard">
                                                   <h4><a href="#">如何最快办理营业许可证？</a></h4>
                                                   <span class="article-meta">2014-09-10<a href="#" title=""></a></span>
                                                   <span class="like-count">66</span>
                                           </li>
                                           <li class="article-entry standard">
                                                   <h4><a href="#">2015法人申请流程是怎么样的？</a></h4>
                                                   <span class="article-meta">2015-10-11</span>
                                                   <span class="like-count">15</span>
                                           </li>
                                           <li class="article-entry video">
                                                   <h4><a href="#">2018法人申请流程是怎么样的？</a></h4>
                                                   <span class="article-meta">2018-01-02</span>
                                                   <span class="like-count">8</span>
                                           </li>
                                           <li class="article-entry image">
                                                   <h4><a href="#">外国人可以办理许可证吗？</a></h4>
                                                   <span class="article-meta">2018-09-10</span>
                                                   <span class="like-count">6</span>
                                           </li>
                                   </ul>
                           </section>
                           <section class="widget"><h3 class="title">类别</h3>
                                   <ul>
                                           <li><a href="#" title="Lorem ipsum dolor sit amet,">反馈</a> </li>
                                           <li><a href="#" title="Lorem ipsum dolor sit amet,">意见</a></li>
                                           <li><a href="#" title="Lorem ipsum dolor sit amet,">投诉</a></li>
                                           <li><a href="#" title="Lorem ipsum dolor sit amet, ">表扬</a></li>
                                   </ul>
                           </section>
                            <section class="widget">
                                   <div class="quick-links-widget">
                                           <h3 class="title">快速连接</h3>
                                           <ul id="menu-quick-links" class="menu clearfix">
                                                   <li><a href="#">江苏政务服务网</a></li>
                                                   <li><a href="#">江苏人民政务</a></li>
                                                   <li><a href="#">我为政府网站找错</a></li>
                                                   <li><a href="#">党政机关</a></li>
                                           </ul>
                                   </div>
                           </section>
                   </aside>
                   <!-- end of sidebar -->
            </div>
         </div>
     </div>
     
      <!-- Start of Footer -->
                <footer id="footer-wrapper">
                        <div id="footer" class="container">
                                <div class="row">
                                        <div class="span3">
                                                <section class="widget">
                                                        <h3 class="title">江北新区是如何工作的</h3>
                                                        <div class="textwidget">
                                                                <p>行政审批局，“行政审批服务中心（局——编者 段 加注）为市政府派出机构，履行对市级（县级——编者 段 加注）职能部门进驻中心、开展事项集中审批的组织协调、管理监督和指导服务职能，集信息与咨询、审批与收费、管理与协调、投诉与监察等为一体。”</p>
                                                                <p>“行政审批服务中心（局——编者 段 加注）为市政府派出机构，履行对市级（县级——编者 段 加注）职能部门进驻中心、开展事项集中审批的组织协调、管理监督和指导服务职能，集信息与咨询、审批与收费、管理与协调、投诉与监察等为一体。”</p>
                                                        </div>
                                                </section>
                                        </div>

                                        <div class="span3">
                                                <section class="widget"><h3 class="title">类别</h3>
                                                        <ul>
                                                               <li><a href="#" title="Lorem ipsum dolor sit amet,">反馈</a> </li>
					                                           <li><a href="#" title="Lorem ipsum dolor sit amet,">意见</a></li>
					                                           <li><a href="#" title="Lorem ipsum dolor sit amet,">投诉</a></li>
					                                           <li><a href="#" title="Lorem ipsum dolor sit amet, ">表扬</a></li>
                                                        </ul>
                                                </section>
                                        </div>

                                        <div class="span3">
                                                <section class="widget">
                                                        <h3 class="title">最新 推特</h3>
                                                        <div id="twitter_update_list">
                                                                <ul>
                                                                        <li>No Tweets loaded !</li>
                                                                </ul>
                                                        </div>
                                                       
                                                </section>
                                        </div>

                                </div>
                        </div>
                        <!-- end of #footer -->

                        <!-- Footer Bottom -->
                        <div id="footer-bottom-wrapper">
                                <div id="footer-bottom" class="container">
                                        <div class="row">
                                                <div class="span6">
                                                        <p class="copyright">
                                                                Copyright &copy; 2018.Company name All rights reserved.&#x7F51;&#x9875;&#x6A21;&#x677F;
                                                        </p>
                                                </div>
                                                <div class="span6">
                                                        <!-- Social Navigation -->
                                                        <ul class="social-nav clearfix">
                                                        </ul>
                                                </div>
                                        </div>
                                </div>
                        </div>
                        <!-- End of Footer Bottom -->

                </footer>
                <!-- End of Footer -->
                
                <a href="#top" id="scroll-top"></a>
</body>
<!-- 全局js -->
<html:js name="supervis_jq,supervis_jq_easing,supervis_jq_prettyPhoto,supervis_jflickrfeed,supervis_jq_liveSearch,supervis_jq_form,supervis_jq_validate,supervis_custom,supervis_stat" />
</html>