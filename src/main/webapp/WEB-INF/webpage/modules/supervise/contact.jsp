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
                    <h3 class="search-header">有什么新的问题吗？</h3>
                    <p class="search-tag-line">如果你有任何问题 可以在下发填写并且发布给我</p>

          <!--           <form id="search-form" class="search-form clearfix" method="get" action="#" autocomplete="off">
                            <input class="search-term required" type="text" id="s" name="s" placeholder="Type your search terms here" title="* Please enter a search term!" />
                            <input class="search-btn" type="submit" value="Search" />
                            <div id="search-error-container"></div>
                    </form> -->
            </div>
     </div>
     <!-- End of Search Wrapper -->
     <!-- Start of Page Container -->
     <div class="page-container">
           <div class="container">
                 <div class="row">
                      <!-- start of page content -->
                          <div class="span8 page-content">
                                  <article class="type-page hentry clearfix">
                                          <h1 class="post-title">
                                                  <a href="#">发布问题</a>
                                          </h1>
                                          <hr>
                                          <p>填写对应的内容，把问题描述清楚！</p>
                                  </article>
                                  <form id="contact-form" class="row" action="" method="post">

                                          <div class="span2">
                                                  <label for="name">名称<span>*</span> </label>
                                          </div>
                                          <div class="span6">
                                                  <input type="text" name="name" id="name" class="required input-xlarge" value="" title="* 请输入姓名">
                                          </div>

                                          <div class="span2">
                                                  <label for="email">标题<span>*</span></label>
                                          </div>
                                          <div class="span6">
                                                  <input type="text" name="email" id="email" class="email required input-xlarge" value="" title="* 请输入标题">
                                          </div>

                                          <div class="span2">
                                                  <label for="reason">类型</label>
                                          </div>
                                          <div class="span6">
                                                  <input type="text" name="reason" id="reason" class="input-xlarge" value="">
                                          </div>

                                          <div class="span2">
                                                  <label for="message">内容描述<span>*</span> </label>
                                          </div>
                                          <div class="span6">
                                                  <textarea name="message" id="message" class="required span6" rows="6" title="* 请输入内容描述"></textarea>
                                          </div>

                                          <div class="span6 offset2 bm30">
                                                  <input type="submit" name="submit" value="Send Message" class="btn btn-inverse">
                                                  <img src="images/loading.gif" id="contact-loader" alt="Loading...">
                                          </div>

                                          <div class="span6 offset2 error-container"></div>
                                          <div class="span8 offset2" id="message-sent"></div>

                                  </form>
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
                                                        <h3 class="title">最新问题</h3>
                                                        <ul class="articles">
                                                                <li class="article-entry standard">
                                                                        <h4><a href="#">如何在短期内办理好许可证？</a></h4>
                                                                        <span class="article-meta">2018-08-12</span>
                                                                        <span class="like-count">66</span>
                                                                </li>
                                                                <li class="article-entry standard">
                                                                        <h4><a href="#">办理过程中出现材料不全怎么办？</a></h4>
                                                                        <span class="article-meta">2018-08-01</span>
                                                                        <span class="like-count">15</span>
                                                                </li>
                                                                <li class="article-entry video">
                                                                        <h4><a href="#">大厅中应该设置更多位置给来办事的人员休息</a></h4>
                                                                        <span class="article-meta">2018-01-09</span>
                                                                        <span class="like-count">8</span>
                                                                </li>
                                                        </ul>
                                                </section>
                                        </aside>
                                        <!-- end of sidebar -->
                                </div>
                        </div>
                </div>
                <!-- End of Page Container -->
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
                                                                Copyright &copy; 2018.Company name All rights reserved.
                                                        </p>
                                                </div>
                                                <div class="span6">
                                                         
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