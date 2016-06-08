<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<link
	href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><tiles:insertAttribute name="title"></tiles:insertAttribute></title>
</head>
<body>
<div style="position:relative">

	<div style="height:30px">
		<tiles:insertAttribute name="header"></tiles:insertAttribute>
		
	</div>
	<hr>

	<div style="min-height:90vh">
		<tiles:insertAttribute name="content"></tiles:insertAttribute>
	</div>

	 <footer class="footer">
	
		<tiles:insertAttribute name="footer"></tiles:insertAttribute>
	</footer>
	
	
</div>

	
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
</body>
</html>