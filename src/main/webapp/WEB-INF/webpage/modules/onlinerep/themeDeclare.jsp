<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><spring:message code="sys.onlinerep.declare.title"/></title>
<html:css name="online_rep_reset,online_rep_bs_banli,online_rep_address,online_rep_icon,bootstrap"/>
<html:js name="online_rep_jquery,online_rep_layer,online_rep_address,online_rep_main,bootstrap"/>
</head>
<body>
<div class="top">
    <div class="top_12">
        <a href="${adminPath}/onlinerep/index" class="logo">
            <img src="${staticPath}/vendors/online-rep/images/logo.png" alt="">
        </a>
        <div class="user_info">
            <a href="${adminPath}/onlinerep/tolineLogin?url=zx_banli.html" id="js_denglu">登录</a>
            <button id="exit" onclick="ExitUser()" style="display:none;">退出</button>
        </div>
    </div>
</div>
<div class="path_nav">
    当前位置： <a href="${adminPath}/onlinerep/index">首页 > </a>
    		 <c:if test="${type == 0}">
    		 	 <a href="${adminPath}/onlinerep/matter">网上办事 > </a>
    		 </c:if>
    		 <c:if test="${type == 1}">
    		 	 <a href="${adminPath}/onlinerep/themeMatter">主题办事 > </a>
    		 </c:if>
    		 <a href="#" class="on"><c:if test="${type == 0}">事项在线办理</c:if><c:if test="${type == 1}">主题事项在线办理</c:if></a>
</div>
<div class="content">
    <div class="bl_path">
        <ul>
            <li class="on">
                <div class="path_icon">
                    <i>1</i>
                    <p>申请须知</p>
                </div>

            </li>
            <li>
                <hr class="line">
                <div class="path_icon">
                    <i>2</i>
                    <p>表单填写</p>
                </div>
            </li>
            <li>
                <hr class="line">
                <div class="path_icon">
                    <i>3</i>
                    <p>材料上传</p>
                </div>
            </li>
            <li>
                <hr class="line">
                <div class="path_icon">
                    <i>4</i>
                    <p>结果获取</p>
                </div>
            </li>
            <li>
                <hr class="line">
                <div class="path_icon">
                    <i>5</i>
                    <p>申请成功</p>
                </div>
            </li>
        </ul>
    </div>
    <!--在线办理第一步-->
    <div class="bl_box1">
        <h2>请认真阅读以下信息</h2>
        <p>欢迎您使用南京市江北新区管理委员会行政审批局网站，为使您能够顺利使用办理行政审批事项，请您仔细阅读以下内容。</p>
        <p>1、本网站所提供的网上申报功能是指通过国际互联网（Internet）使用本网站，向南京市江北新区管理委员会行政审批局进行行政审批事项的申报、补正和查看办理反馈信息。</p>
        <p>2、通过本网站进行网上办理的事项，是目前适合网上办理的事项，不是进驻行政审批服务局的全部事项，只有事项指南中所列事项才能使用该功能进行办理。</p>
        <p>3、本网站"网上办事"功能为用户网上申报办理的主要入口，用户在本网站注册后可查看申办事项的办事指南信息，在实名认证之后方可在网上进行事项申报。</p>
        <p>4、如果您想使用网上办理功能办理事项，请您熟读办理流程，依办理流程进行操作。</p>
        <p>5、请您如实进行用户登记和事项申报信息填写，以免耽误您的登记和事项申报。</p>
        <p>6、在进行事项申报前，请您准备好全部材料。事项申报后，请您及时查看办理反馈信息，进行互动。</p>
        <p>7、在使用本网站网上办理功能时，请您自觉遵守国家有关互联网管理的法律、法规，不得通过该功能提交与办理事项无关的任何信息。如有违反，我们将不予办理，所提交的内容违反法律法规的，将移交有关部门追究责任。</p>
        <a href="${adminPath}/onlinerep/themeMatter"><button type="button">取消办理</button></a>
        <button type="button" style="border: none; background-color: #0077c9; color: white" class="btn1" id="btn1">下一步</button>
    </div>
    <form id="application_form" target="application_iframe">
    <!--在线办理第二步-->
    <div class="bl_box2" style="display: none">
        <div class="sx_info">
            <h2><i></i>主题事项信息</h2>
            <input type="hidden" name="trans.id" id="trans_id"/>
            <input type="hidden" name="applySource" value="1"/>
            <input type="hidden" name="trans_name" id="trans_name"/>
            <table cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 160px;">申报主题事项</td>
                    <td style="width: 720px;" id="themeName"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">事项列表</td>
                    <td style="width: 720px;" id="transNames"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">申报类型</td>
                    <td style="width: 720px;">
                        <ul>
                            <li class="user_type on">
                                <i></i>个人
                            </li>
                            <li class="company_type">
                                <i></i>法人
                            </li>
                        </ul>
                    </td>
                </tr>
            </table>
        </div>
        <div class="sqr_info">
            <h2><i></i>申请人信息</h2>
            <div class="user_info">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 160px;"> <i>*</i> 申请人</td>
                        <td style="width: 290px;"><input type="text" id="user_name" class="tab-user-style"/></td>
                        <td style="width: 160px;"><i>*</i> 手机号码</td>
                        <td><input type="text" id="user_telephone" class="tab-user-style"/></td>
                    </tr>
                    <tr>
                        <td><i>*</i> 身份证号码</td>
                        <td><input type="text" id="user_idcard" class="tab-user-style" /></td>
                        <td>邮政编码</td>
                        <td><input type="text" id="user_postcode" maxlength="6"/></td>
                    </tr>
                    <tr>
                        <td><i>*</i> 联系地址</td>
                        <td colspan="3"><input type="text" id="user_address" class="tab-user-style"/></td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 160px;">代理人</td>
                        <td style="width: 290px;"><input type="text" id="user_agent" /></td>
                        <td style="width: 160px;">手机号码</td>
                        <td><input type="text" id="user_agent_telephone"/></td>
                    </tr>
                    <tr>
                        <td>身份证号码</td>
                        <td colspan="3"><input type="text" id="user_agent_card"/></td>
                    </tr>
                </table>
            </div>
            <div class="company_info">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td> <i>*</i> 社会统一信用代码</td>
                        <td colspan="3"><input type="text" id="company_idcard" class="tab-company-style"/></td>
                    </tr>
                    <tr>
                        <td> <i>*</i> 单位名称</td>
                        <td colspan="3"><input type="text" id="company_name" class="tab-company-style"/></td>
                    </tr>
                    <tr>
                        <td style="width: 160px;"> <i>*</i> 法定代表人</td>
                        <td style="width: 290px;"><input type="text" id="legal_representative" class="tab-company-style"/></td>
                        <td style="width: 160px;"> <i>*</i> 手机号码</td>
                        <td><input type="text" id="company_telephone" class="tab-company-style"/></td>
                    </tr>
                    <tr>
                        <td><i>*</i> 联系地址</td>
                        <td colspan="3"><input type="text" id="company_address" class="tab-company-style"/></td>
                    </tr>
                    <tr>
                        <td>邮政编码</td>
                        <td colspan="3"><input type="text" id="company_postcode" maxlength="6"/></td>
                    </tr>
                </table>
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <td style="width: 160px;">代理人</td>
                        <td style="width: 290px;"><input type="text" id="company_agent_name" /></td>
                        <td style="width: 160px;">手机号码</td>
                        <td><input type="text" id="company_agent_telephone" /></td>
                    </tr>
                    <tr>
                        <td>身份证号码</td>
                        <td colspan="3"><input type="text" id="company_agent_card" /></td>
                    </tr>
                </table>
            </div>
        </div>
        <!-- 表单布局 主题-->
        <c:choose>
        	<c:when test="${type == 1}">
        		<div class="sqr_info">
	          	  <h2><i></i>自定义表单</h2>
	          	  <div class="panel panel-info " style="width:85%">
				        <div class="panel-heading">
				            <h4 class="panel-title">
				                <a data-toggle="collapse" data-parent="#accordion" 
				                href="#collapseTwo">
				                 成品油资格证表单_1
				            </a>
				            </h4>
				        </div>
				        <div id="collapseTwo" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<iframe src="http://www.baidu.com" id="myiframe" scrolling="no" frameborder="0" width="100%" height="500px;"></iframe>
				        </div>
				        </div>
			    	</div>
			      <div class="panel panel-info" style="width:85%">
				        <div class="panel-heading">
				            <h4 class="panel-title">
				                <a data-toggle="collapse" data-parent="#accordion" 
				                href="#collapseThere">
				                 成品油资格证表单_2
				            </a>
				            </h4>
				        </div>
				        <div id="collapseThere" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<iframe src="http://news.baidu.com" id="myiframe" scrolling="no" frameborder="0" width="100%" height="500px;"></iframe>
				        </div>
				        </div>
			       </div>
			       <div class="panel panel-info" style="width:85%">
				        <div class="panel-heading">
				            <h4 class="panel-title">
				                <a data-toggle="collapse" data-parent="#accordion" 
				                href="#collapsefour">
				                 成品油资格证表单_3
				            </a>
				            </h4>
				        </div>
				        <div id="collapsefour" class="panel-collapse collapse">
				        <div class="panel-body">
				        	<iframe src="http://news.baidu.com" id="myiframe" scrolling="no" frameborder="0" width="100%" height="500px;"></iframe>
				        </div>
				        </div>
			    	</div>
	             </div>
        	</c:when>
        	<c:otherwise>
        		<div class="sqr_info">
        			<h2><i></i>自定义表单</h2>
        			<div class="panel panel-info" style="width:85%">
				        <div class="panel-heading">
				            <h4 class="panel-title">
				                <a data-toggle="collapse" data-parent="#accordion" 
				                href="#collapseOne">
				                	事项自定义表单-1
				                </a>
				            </h4>
				        </div>
				        <div id="collapseOne" class="panel-collapse collapse in">
				            <div class="panel-body">
				                 <iframe src="http://news.baidu.com" id="myiframe" scrolling="no" frameborder="0" width="100%" height="500px;"></iframe>
				            </div>
				        </div>
				    </div>
        		</div>
        	</c:otherwise>
        </c:choose>
        <div class="sq_info" id="sq_info_1"  style="display:none;">
            <h2><i></i> 申请信息 <span style="color:red; font-size:15px; text-indent:15px;">（ * 以下均为必填项）</span> </h2> 
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 160px;">工程名称</td>
                    <td><input type="text" name="gongchengName" /></td>
                </tr>
                <tr>
                    <td style="width: 160px;">工程建设地点</td>
                    <td><input type="text" name="gongchengAddress"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">建设内容</td>
                    <td><input type="text" name="gongchengCotent"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">建设规模</td>
                    <td><input type="text" name="gongchengGuiMo"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">申报建筑面积（㎡）</td>
                    <td><input type="text" name="gongchengMianJi"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">工程合同造价（万元）</td>
                    <td><input type="text" name="gongchengZaoJia"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">开工日期</td>
                    <td><input type="text" name="gongchengKaiGong"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">竣工日期</td>
                    <td><input type="text" name="gongchengJunGong"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">备注</td>
                    <td><input type="text" name="gongchengBeiZhu"></td>
                </tr>
            </table>
        </div>
        <div class="sq_info" id="sq_info_2" style="display:none;">
           <h2><i></i> 申请信息 <span style="color:red; font-size:15px; text-indent:15px;">（ * 以下均为必填项）</span> </h2> 
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 160px;">采伐地点</td>
                    <td><input type="text" name="forestAddress" /></td>
                </tr>
                <tr>
                    <td style="width: 160px;">采伐树种</td>
                    <td><input type="text" name="forestType"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">采伐面积（㎡）</td>
                    <td><input type="text" name="forestArea"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">采伐储积（m³）</td>
                    <td><input type="text" name="forestAccumulation"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">采伐事由</td>
                    <td><input type="text" name="forestReason"></td>
                </tr>
               
            </table>
        </div>
        <div class="sq_info" id="sq_info_3" style="display:none;">
           <h2><i></i> 申请信息 <span style="color:red; font-size:15px; text-indent:15px;">（ * 以下均为必填项）</span> </h2> 
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 160px;">绿地占用面积（㎡）</td>
                    <td><input type="text" name="greenLandArea" /></td>
                </tr>
                <tr>
                    <td style="width: 160px;">绿地所在地</td>
                    <td><input type="text" name="greenLandAddress"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">绿地占用期限</td>
                    <td><input type="text" name="greenLandOccupyTerm"></td>
                </tr>
            </table>
        </div>
        <div class="sq_info" id="sq_info_4" style="display:none;">
           <h2><i></i> 申请信息 <span style="color:red; font-size:15px; text-indent:15px;">（ * 以下均为必填项）</span> </h2> 
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 160px;">树木名称</td>
                    <td><input type="text" name="treeName" /></td>
                </tr>
                <tr>
                    <td style="width: 160px;">树木所在地</td>
                    <td><input type="text" name="treeAddress"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">树木数量</td>
                    <td><input type="text" name="treeNumber"></td>
                </tr>
            </table>
        </div>
        <div class="sq_info" id="sq_info_5" style="display:none;">
           <h2><i></i> 申请信息 <span style="color:red; font-size:15px; text-indent:15px;">（ * 以下均为必填项）</span> </h2> 
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td style="width: 160px;">挖掘占用地点和范围</td>
                    <td><input type="text" name="roadAddress" /></td>
                </tr>
                <tr>
                    <td style="width: 160px;">挖掘占用期限</td>
                    <td><input type="text" name="roadOccupyTerm"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">车行道长</td>
                    <td><input type="text" name="roadwayLong"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">车行道宽</td>
                    <td><input type="text" name="roadwayWide"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">车行道占用面积</td>
                    <td><input type="text" name="roadwayArea"></td>
                </tr>
               <tr>
                    <td style="width: 160px;">人行道长</td>
                    <td><input type="text" name="footwayLong"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">人行道宽</td>
                    <td><input type="text" name="footwayWide"></td>
                </tr>
                <tr>
                    <td style="width: 160px;">人行道占用面积</td>
                    <td><input type="text" name="footwayArea"></td>
                </tr>
            </table>
        </div>
        <button type="button"><a href="${adminPath}/onlinerep/themeMatter">取消办理</a></button>
        <button type="button" style="border: none; background-color: #0077c9; color: white" class="btn2" id="btn2">下一步</button>
    </div>
    <!--在线办理第三步-->
    <div class="bl_box3" style="display: none">
        <h2><i></i>申请材料</h2>
        <table cellpadding="0" cellspacing="0">
            <thead>
            	<tr>
                <td style="width: 70px;">序号</td>
                <td>材料名称</td>
                <td style="width: 97px;">操作</td>
            </tr>
            </thead>
            <tbody id="material_list">
            <!-- <tr>
                <td style="width: 70px;">01</td>
                <td>建设工程竣工验收消防备案申报表</td>
                <td style="width: 97px;">
                    <a class="upload_btn"></a>
                </td>
            </tr> -->
            </tbody>
        </table>
        <button type="button"><a href="${adminPath}/onlinerep/themeMatter">取消办理</a></button>
        <button type="button" style="border: none; background-color: #0077c9; color: white" class="btn3">下一步</button>
    </div>
    </form>
    <iframe id="application_iframe" name="application_iframe" style="display:none"></iframe>
    <!--在线办理第四步-->
    <div class="bl_box4" style="display: none">
        <h2><i></i>结果领取</h2>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td style="width: 160px;">取件方式</td>
                <td>
                    <ul>
                        <li class="zi_qu on">
                            <i></i>线下取件
                        </li>
                        <li class="you_ji">
                            <i></i>在线邮寄(邮政EMS)
                        </li>
                    </ul>
                </td>
            </tr>
        </table>
        <table cellpadding="0" cellspacing="0" style="border-top: none" class="tab_address">
            <tr>
                <td style="width: 160px;">收件人姓名</td>
                <td><input type="text" id="address_username">
                <input type="hidden" id="address_id"/>
                </td>
            </tr>
            <tr>
                <td style="width: 160px;">联系电话</td>
                <td><input type="text" id="address_telphone"></td>
            </tr>
            <tr>
                <td style="width: 160px;">收件人地址</td>
                <td>
                <div id="distpicker" style="width: 600px;margin-left: 12px;">
		           <div class="form-group" style="margin-bottom:0;">
		             <div style="position: relative;">
		                <input id="city-picker3" class="form-control" type="text" data-toggle="city-picker"/>
		             </div>
		         </div>
		        </div>
                </td>
            </tr>
            <tr>
                <td style="width: 160px;">详细地址</td>
                <td><input type="text" id="address_street" placeholder="例：陕西省西安市雁塔区高新技术开发区锦业路绿地蓝海大厦A-1301室"></td>
            </tr>
            <tr>
                <td style="width: 160px;">邮政编码</td>
                <td><input type="text" id="address_postcode" class="postal-code" placeholder="730719"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button class="new_btn" onclick="addAddress()">新增</button>
                    <button style="background-color: #ff921e; display: none;" class="save_btn" onclick="addAddress()">保存</button>
                </td>
            </tr>
        </table>
        <div class="adress_show">
            <ul id="address_list">
               <!--  <li>
                    <input type="radio" name="rad">
                    <span>张三</span>
                    <span>18524789525</span>
                    <span class="adress">陕西省西安市雁塔区高新技术开发区锦业路绿地蓝海大厦A-1301室</span>
                    <button class="clean">删除</button>
                    <button class="edit">编辑</button>
                </li> -->
            </ul>
        </div>
        <button type="button"><a href="${adminPath}/onlinerep/themeMatter">取消办理</a></button>
        <button type="button" style="border:none; background-color: #0077c9; color: white" class="btn4" onclick="submitApplication()">下一步</button>
    </div>
    <!--在线办理第五步-->
    <div class="bl_box5" style="display: none">
        <i></i>
        <p>恭喜您在线申报成功！</p>
        <p>请牢记办件编号：<span class="succ_code" id="office_number"></span></p>
        <p>或到个人中心“我的办件”查看进度</p>
        <button><a href="${adminPath}/onlinerep/index">返回首页</a></button>
        <button style="border: none; background-color: #0077c9; color: white"><a href="gr_zhongxin.html">个人中心</a></button>
    </div>
</div>
<div class="file_pop">
    <div class="file">
        <h2>材料上传</h2>
        <div class="file_box">
          <button class="inp_btn">点击上传文件
                <form id='material-file' enctype='multipart/form-data' target='material_hidden_frame'>
                <input type="file" name='file'  id="file_load">
                <input type='hidden' name='id' id='usermaterialid'>
				<input type='hidden' name='userIdCard' id='userIdCard'>
				<input type='hidden' name='materialId' id='materialId'>
				<input type="hidden" name='userType' id='userType'>
				<input type="hidden" name="comeType" value="1">
                <label for="file_load"></label>
                </form>
		        <iframe id='material_hidden_frame' name='material_hidden_frame' style='display:none'></iframe> 
           
            </button>
            <div class="show_fileName1 file_Name"></div>
            <div class="show_fileName2 file_Name"></div>
        </div>
        <button onclick="saveMaterial()">提交</button>
        <button style="background-color: #c2c2c2" onclick="HideFileBox();">关闭</button>
    </div>
</div>
<html:js name="online_rep_405,online_rep_common,online_rep_theme_banli,online_rep_bs_filedownloadView"/>
<script type="text/javascript">
/*结果领取*/
$(".tab_address").hide();
$(".adress_show").hide()
$(".zi_qu").click(function () {
    $(this).addClass("on").siblings("li").removeClass("on");
    $(".tab_address").hide();
    $(".adress_show").hide()
});
$(".you_ji").click(function () {
	alert("暂未开通在线邮寄，请尽情等待...");
   /*  $(this).addClass("on").siblings("li").removeClass("on");
    $(".tab_address").show();
    $(".adress_show").show() */
});
$(".edit").click(function () {
    $(".new_btn").hide();
    $(".save_btn").show();
});
$(".save_btn").click(function () {
    $(this).hide();
    $(".new_btn").show();
});

$(".btn3").click(function () {
    $(".bl_box1").hide();
    $(".bl_box2").hide();
    $(".bl_box3").hide();
    $(".bl_box4").show();
    $(".bl_box5").hide();
    $(".bl_path ul li:nth-child(4)").addClass("on")
})
$(".btn4").click(function () {
    $(".bl_box1").hide();
    $(".bl_box2").hide();
    $(".bl_box3").hide();
    $(".bl_box4").hide();
    $(".bl_box5").show();
    $(".bl_path ul li:nth-child(5)").addClass("on")
})
$(function(){
        $(".inp_btn").on("change","input[type='file']",function(){
            var filePath=$(this).val();
            var file_format = "JPG,PNG,JPEG,BMP,GIF,DOC,DOCX,XLS,XLSX,PDF,OFD,ZIP,RAR";
            var ext = filePath.substring(filePath.lastIndexOf(".")+1).toUpperCase();//取出上传文件的后缀	
            if(file_format.match(ext)){
                $(".show_fileName1").html("").hide();
                var arr=filePath.split('\\');
                var fileName=arr[arr.length-1];
                $(".show_fileName2").html(fileName);
            }else{
                $(".show_fileName2").html("");
                $(".show_fileName1").html("您未上传文件，或者您上传文件类型有误！").show();
                return false
            }
        });
      //选择地区则加载邮政编码方法
    	$("#distpicker").click(function() {
    	    var _address = $('#city-picker3').val();
    	    if (_address && _address.length) {
    	        var _addressArry = [],
    	            ChinesecontactPostalCode;
    	        if (_address.indexOf('/') < 0) { //如果用户只选择了省
    	            ChinesecontactPostalCode = findPostCode(_address, '', '');
    	        } else {
    	            _addressArry = _address.split('/'); //根据通讯地址中的省/市/区截取省市区名称
    	            if (_addressArry.length == 2) { //如果用户只选择了省/市
    	                ChinesecontactPostalCode = findPostCode(_addressArry[0], _addressArry[1], '');
    	            }
    	            if (_addressArry.length == 3) { //如果用户只选择了省/市/区
    	                ChinesecontactPostalCode =findPostCode(_addressArry[0], _addressArry[1], _addressArry[2]);
    	            }
    	        }
    	        $('.postal-code').val(ChinesecontactPostalCode);
    	    }
    	});
    });
    function HideFileBox() {
        $(".file_pop").hide();
        $("body").css({"overflow":"auto"});
    }
</script>
</body>
</html>