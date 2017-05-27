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
<body>



	<div class="container">

		<ul class="nav nav-pills" role="tablist">
			<c:forEach items="${categoryList}" var="category">
				<li class="dropdown">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				${category.name}
				<span class="caret"></span></a>


					<ul class="dropdown-menu" role="menu">
						<c:forEach items="${category.products}" var="product">
							<li><a href="manage_product/get/${product.name}">${product.name}</a></li><li><a>${product.file}</a></li>
						</c:forEach>
					</ul></li>
			</c:forEach>

		</ul>
	</div>
	<hr color="blue" width="100" >
	${category.products}


</body>
</html>s


 
<%--  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<title>Bootstrap Case</title>
<meta charset="utf-8">
<meta name="viewport" content="wIDth=device-wIDth, initial-scale=1">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top" ID="my-navbar">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a href="Home" class="navbar-brand"><img src="<c:url value="/resources/images/logo.png"/>"  style="max-height:50px; margin-top: -15px;" alt="logo" /></a>
			</div>
			<div class="collapse navbar-collapse" ID="navbar-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="RegistrationPage"> SignUp </a></li>
					<li><a href="LoginPage"> Login </a></li>
				</ul>



				<ul class="nav navbar-nav">

					<!-- Dropdown of category -->


					<c:forEach var="category" items="${categoryList}">
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">${category.name}
								<span class="caret"></span>
							</a>
							<ul class="dropdown-menu scrollable-menu" role="menu">
								<c:forEach var="product" items="${productList}">
									<c:if test="${product.category_id == category.id}">
										<li><a href="#">${product.name}</a></li>
									</c:if>

									<!-- <li><a href="#">${product.name}</a></li> -->
								</c:forEach>


							</ul></li>
					</c:forEach>

					Toggle Product
					<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">
							All Products <span class="caret"></span>
						</a>
						<ul class="dropdown-menu scrollable-menu">

							<c:forEach var="product" items="${productList}">
								<li><a href="#">${product.name}</a></li>

							</c:forEach>
						</ul></li>
					
					
					<!-- <li><a href="ContactUs"> Contact Us </a></li> -->

				</ul>
			</div>
		</div>
	</nav>




</body>
</html> --%>