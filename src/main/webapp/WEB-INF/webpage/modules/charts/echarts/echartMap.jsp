<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${charttitle}</title>
    <meta name="decorator" content="single"/>
</head>

<body class="gray-bg">
    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
            <div class="col-sm-12">
                <div class="portlet box  portlet-grey">
					 <div class="portlet-header">
						<div class="caption">${charttitle}</div>
						<div class="tools">
	                        <i class="fa fa-chevron-up"></i>
	                        <i class="fa fa-refresh"></i><i class="fa fa-times"></i>
	                     </div>
					</div>	
					<div class="portlet-body">
                        <div id="allmap"></div>
                    </div>
                </div>
            </div>
         </div> 
    </div>
    <script type="text/javascript">
		// 百度地图API功能
		var map = new BMap.Map("allmap");  // 创建Map实例
		map.centerAndZoom("南京市丽景路2号",15);      // 初始化地图,用城市名设置地图中心点
	</script>
	<!-- 全局js -->
	<html:js name="echarts" />
	<%-- <script src="${staticPath}/modules/charts/js/echarts/${charttype}.js"></script> --%>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=A5KDCk9IQZULG0LNauvyUMbwKLveDF3D"></script>
</body>

</html>