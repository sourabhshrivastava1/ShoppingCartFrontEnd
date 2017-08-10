<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/mystyle.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body  style="background-color:	#F0FFFF">


<div class="container">

        <div class="text-Center">
        <h3> Welcome To Admin page</h3>
        <a href="index"> HOME </a>

	<!--   Add 3 links -->
	

	<a href="manage_categories"> Manage Categories </a>

	<a href="manage_supplier"> Manage Supplier </a>

	<a href="manage_products"> Manage Products </a>
	
	<br>
<br>
<br>
	<c:if test="${isUserClickedCategories==true}">

		<jsp:include page="Category.jsp"></jsp:include>

	</c:if>
	
	<c:if test="${isUserClickedProducts==true}">

		<jsp:include page="Product.jsp"></jsp:include>

	</c:if>
	
	
	<c:if test="${isUserClickedSupplier==true}">

		<jsp:include page="Supplier.jsp"></jsp:include>

	</c:if>





</body>
</html>