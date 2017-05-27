<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
 
</head>
<style>
 {
 
    background-color:#DAA520;
}

h1 {
    color: white;
    text-align: center;
}

p {
    font-family: verdana;
    font-size: 20px;
}
</style>
</head>
<body > 
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
<script>
var app = angular.module('myApp', []);
app.controller('myCtrl', function($scope, $http) {
  $http.post("cat")
  .then(function(response) {
      $scope.category = response.data;
  });
});
</script>

   
    <h2> <center> Shopping Cart  </center></h2>
 <center> ${msg}</center>
 
  <center> ${role}</center>
 
  <center> ${successMessage}</center>
  
  <center> ${error}</center>
  
  
 ${loginMessage}
<hr>










  <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">MY SHOPPING</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"  style="background:none border:none; ">
     <li> <a href="index">HOME</a></li>
      <li><a href="AboutUs">ABOUTUS</a></li>
       <li><a href="Contact">CONTACTUS</a></li>
       <c:if test="${empty loginmessage}">
         <li><a href="Login">LOGIN</a></li>
         <li><a href="Registration">REGISTER</a></li></c:if>
        <li> <c:if test="${not empty loginmessage}">
<a href="logout">LOGOUT</a> <br></li>


</c:if>
         
       
      
      <li>  <c:if test="${isAdmin==false }">
<a href="Mycart"> MyCART</a>
</c:if></li>
         </li>
    </li>
 </nav>
 
      
 
<c:if test="${isAdmin==true }">
<jsp:include page="Admin/AdminHome.jsp"></jsp:include>



</c:if>




<c:if test="${loginmsg==true }">
<a href="logout"> Logout</a>
</c:if>


<br>

<c:if test="${isUserClickedLogin==true}">
	<jsp:include page="Login.jsp"></jsp:include>  
</c:if>

<!--<c:if test="${not empty errorMessage}">
	<jsp:include page="Login.jsp"></jsp:include>  
</c:if>-->


<c:if test="${isUserClickedHome==true}">
	<jsp:include page="index.jsp"></jsp:include>  
</c:if>

<!--<c:if test="${isUserClickedR==true}">
<jsp:include page="Registration.jsp"></jsp:include> 
</c:if>-->
<c:if test="${isUserClickedMycart==true}"><jsp:include page="Mycart.jsp"></jsp:include>   </c:if>



<c:if test="${isUserClickedRegistration==true}"><jsp:include page="Registration.jsp"></jsp:include></c:if>


<c:if test="${isUserClickedContactUs==true}">
<jsp:include page="Contact.jsp"></jsp:include> 
</c:if>

<c:if test="${isUserClickedAboutUs==true}">
<jsp:include page="AboutUs.jsp"></jsp:include> 
</c:if>

<%-- <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">
      <div ng-app="myApp" ng-controller="myCtrl"> 
 <table> 
 <tr><td ng-repeat="x in category">
 <ul><li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="viewproduct?name={{ x.id }}">{{ x.name }} <span class="caret">
 </span>  </a>
 <ul class="dropdown-menu">
 <%for(int i=0;i<50;i++){ %>
 <li><a href="viewproduct?name={{x.products[<%=i%>].name }}">{{ x.products[<% out.println(i); %>].name }}</a></li>
    --%>
         
     
          <%
 
          %>
        </ul>
      </li></ul></td> </tr>
 </table>
</div>
</a>
    </div>
  </div>
</nav>
<jsp:include page="menu/Product_menu.jsp"></jsp:include>

<jsp:include page="menu/courosel.jsp"></jsp:include>
<jsp:include page="viewAllproduct.jsp"></jsp:include>
</body>
</html>








