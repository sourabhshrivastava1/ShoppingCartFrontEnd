

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss"></spring:url>
<link href="${bootstrapCss}" rel="stylesheet">

<!-- Jquery Js File -->
<spring:url value="/resources/core/js/jquery.js" var="JqueryJs"></spring:url>

<script src="${JqueryJs}"></script>

<!-- BootStrap Min.Js file -->
<spring:url value="/resources/core/js/bootstrap.min.js"
	var="bootstrapJs"></spring:url>
<script src="${bootstrapJs}"></script>



</head>
</html>