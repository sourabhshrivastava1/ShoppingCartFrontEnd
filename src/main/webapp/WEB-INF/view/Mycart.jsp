<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<div class="text-danger">
<h1>Welcome, MyCart</h1> <center> ${loginMeassage}</center></div>

<div class ="container-fluid  second_bar" style="background:#808080; solid; padding:20px;" >
<div class="container">

<div class="row">
 <div class="col-sm-12">
 <nav class="navbar-default">
 


<section>
		<div class="jumbotron">
			<div class="container">
				<h1>Cart</h1>
				<p>All the selected products in your cart</p>
			</div>
		</div>
	</section>

	<section class="container" ng-app="cartApp">
		<div ng-controller="cartController" ng-init="initCartId('${cartId}')">
			<div>
				<a class="btn btn-danger pull-left" ng-click="clearCart()"> <span
					class="glyphicon glyphicon-remove-sign"></span> Clear Cart
				</a> <a href="#" class="btn btn-success pull-right"> <span
					class="glyphicon-shopping-cart glyphicon"></span> Check out
				</a>
			</div>
			<table class="table table-hover">
				<tr>
					<th>Product</th>
					<th>Quantity</th>
					<th>Unit price</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
				<tr ng-repeat="item in cart.cartItems">
					<td>{{item.product.productId}}-{{item.product.name}}</td>
					<td>{{item.quantity}}</td>
					<td>{{item.product.unitPrice}}</td>
					<td>{{item.totalPrice}}</td>
					<td><a href="#" class="label label-danger" ng-click="removeFromCart(item.product.productId)"> <span
							class="glyphicon glyphicon-remove" /></span> Remove
					</a></td>
				</tr>
				<tr>
					<th></th>
					<th></th>
					<th>Grand Total</th>
					<th>{{cart.grandTotal}}</th>
					<th></th>
				</tr>

			</table>
			<a href="<spring:url value="/products" />" class="btn btn-success">
					<span class="glyphicon-circle-arrow-left glyphicon"></span> continue shopping
			</a>
		</div>
	</section>
 
 
 
 
 
 
 
 
</nav></div></div></div></div>















 
</body>
</html> --%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<br>
<br>
<head>
<style type="text/css">
.txt {
	color: #673AB7;
	text-decoration: none;
}
.table {
    width: 100%;
    max-width: 100%;
    margin-bottom: 20px;
    border: solid;
    border-color: burlywood;
}
#anchor {
    background-color: #8BC34A;
    
}
</style>

</head>
<section>
<div class="col-sm-12 col-md-10 col-md-offset-1">



	<table class="table table-hover">
		<thead>
			<tr>
				<th>Product</th>
				<th>Quantity</th>
				<th class="text-center">Price</th>
				<th class="text-center">Total</th>
				<th> </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach  items="${mycartList}" var="myCart">
				<tr>
					<td class="col-sm-8 col-md-6">
						<div class="media">
							<div class="media-body">
								
								<h3 class="media-heading">
								<a id="anchor" href="#" style="height:5px;width:5px">${myCart.product_name}</a>
								</h3>
								<span>Status:${myCart.status} </span>
								
							</div>
						</div>
					</td>
					<td class="col-sm-1 col-md-1" style="text-align: center"><input
						type="email" class="form-control" id="exampleInputEmail1"
						value="${myCart.quantity}"></td>
					 <td class="col-sm-1 col-md-1 text-center"><strong>${myCart.price}</strong></td> 
					<td class="col-sm-1 col-md-1 text-center"><strong>${myCart.price}</strong></td>
					<td class="col-sm-1 col-md-1"><a href="remove/${myCart.id}">
						<button type="button" class="btn btn-danger">
							<span class="glyphicon glyphicon-remove"></span> Remove
						</button>
						</a>
					</td>
				</tr>

			</c:forEach>
		
		</tbody>
		<tfoot>
			<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				<td><h5>
						Subtotal<br>Estimated shipping
					</h5>
					<h3>Total</h3></td>
				<td class="text-right">
					<h3>Rs:${totalAmount}</h3></td>
			</tr>
			<tr>
				<td> </td>
				<td> </td>
				<td> </td>
				<td><a href="<c:url value= '/'/>">
						<button type="button" class="btn btn-default">
							<span class="glyphicon glyphicon-shopping-cart"></span> Continue
							Shopping
						</button>
				</a></td>
				<td><a href="<c:url value= '/CheckoutPage'/>"><button type="button"
							class="btn btn-success">
							Checkout <span class="glyphicon glyphicon-play"></span>
						</button></a></td>
			</tr>
		</tfoot>
	</table>
</div>
</section>