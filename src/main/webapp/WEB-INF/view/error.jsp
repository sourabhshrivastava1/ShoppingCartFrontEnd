<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
  <link rel="stylesheet" href="<c:url value='/resources/bootstrap/css/bootstrap.min.css'/>" ">
 <script src="<c:url value='/resources/jquery/jquery.min.js'/>" ></script>
 <script src="<c:url value='/resources/bootstrap/js/bootstrap.min.js'/>" ></script>
 <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
  
  
   <style>
         .Search {
     position: absolute;
     top: 355px;
     left: 575px;
}

.Search input {
     height: 50px;
     width: 180pt;
}

        </style>
        
  </head>
  
<body>




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
  <br/><br/>
  <div>
 <form method="get" action="viewproduct" class="navbar-form navbar-left">
      <div class="form-group">
        <input type="text"  name="name" class="form-control" placeholder="Search">
        
     <!--   <div ng-repeat="x in products">
         <%for(int i=0;i<50;i++){ %>
          <li><a href="viewproduct?name={{x.products[<%=i%>].name }}">{{ x.products[<% out.println(i); %>].name }}</a></li>
          <%
         }
          %> </div> --> 
           
      </div>
    </form>
 </div>
 <br/>
 <br/>
<nav class="navbar navbar-inverse">
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
         
         
         
          <%
 }
          %>
        </ul>
      </li></ul></td> </tr>
 </table>
</div>
</a>
    </div>
  </div>
</nav>

<%
String name=(String)session.getAttribute("user");
if(name!=null)
{
out.println("<h2>Hello "+name+"</h2>");
}
%>

<br>
<div class="alert alert-danger">
<strong>The requested server is down please contact administrator</strong>
</div>
<div class="alter alter-info">${message} ${exception}</div>
</body>
</html>