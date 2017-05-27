<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/mystyle.css">
<link rel="stylesheet" href="resource/img/im.jpg">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body style="background-color:	#F0FFFF">
<h2> <center>	Manage Supplier </center> </h2>
<hr>

<form action="manage_supplier_add" method="GET">
<table>
<tr><td>ID:</td><td><input type="text" name="id" placeholder="id"> </td></tr>
<tr><td>NAME:</td><td><input type="text" name="name"> </td></tr>
<tr><td>ADDRESS:</td><td><input type="text" name="address"> </td></tr>
<tr><td><input type="submit" value="Add">
<input type="submit" value="Edit">
<input type="submit" value="Remove"></td></tr></table>
</form><br>
<br>
	<table border="2">

		
			<tr>
				<th width="80">ID</th>  	<th width="80">Name</th>	<th width="100">Address</th> <th width="120" colspan="2">Action</th>
		</tr>
	

		<c:forEach var="supplier" items="${supplierList}">
			<tr>

				<td>${supplier.id}</td>
				<td>${supplier.name}</td>
				<td>${supplier.address}</td>
				<td><a href="<c:url value='/manage_supplier_edit/${supplier.id}' />">Edit</a></td>
					
					<td><a href="<c:url value='/manage_supplier_remove/${supplier.id}' />">Remove</a></td>

			</tr>
		</c:forEach>

	</table>


</body>
</html>