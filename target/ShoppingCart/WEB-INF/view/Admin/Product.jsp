<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h2> <center>Manage Products</center> </h2>
<hr>

<form action="manage_products_add" method="POST">
<input type="text" name="id"> <br>
<input type="text" name="name"><br>
<input type="text" name="Price"><br>
<input type="text" name="category_id"><br>
<input type="text" name="supplier_id"><br>
<input type="text" name="image"><br>
 <input type="text" name="description"><br>
<input type="submit" value="Add">
<input type="submit" value="Edit">
<input type="submit" value="Remove">


<form action="UploadServlet" method="POST" enctype="multipart/form-data">
<input type="file" name="file" size="50" />
<br />
<input type="submit" value="Upload File" />
</form>
</form>
	<table border="2">

		<thead>
			<tr>
				<td>ID</td>  	<td>Name</td>	<td>Price</td>   <td>Category_id</td> <td>Supplier_id</td>
				<td>Image</td> <td>Description</td> <td>Action</td>
		</tr>
		</thead>

		<c:forEach var="product" items="${productList}">
			<tr>

				<td>${product.id}</td>
				<td>${product.name}</td>
				<td>${product.price}</td>
				<td>${product.category_id}</td>
				<td>${product.supplier_id}</td>
				<td>${product.image}</td>
				<td>${product.description}</td>
				<td><a href="<c:url value='/manage_product_edit/${product.id}' />">Edit</a></td>
					
					<td><a href="<c:url value='/manage_product_delete/${product.id}' />">Delete</a></td>

			</tr>
		</c:forEach>

	</table>





</body>
</html>