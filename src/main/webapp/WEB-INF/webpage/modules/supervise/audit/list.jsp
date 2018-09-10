<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/WEB-INF/webpage/common/taglibs.jspf"%>
<!DOCTYPE html>
<html>
<head>
   <title><spring:message code="sys.supervise.title" /></title>
   <meta name="decorator" content="list"/>
</head>

<body class="gray-bg" title="<spring:message code="sys.supervise.title" />">
<grid:grid id="superGridId" url="${adminPath}/supervise/ajaxList">
<grid:column label="标题"  name="title"  query="title" />
<grid:column label="发布人"  name="publisher"  query="publisher" />
</grid:grid>
</body>
</html>
