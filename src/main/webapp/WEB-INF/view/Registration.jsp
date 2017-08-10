
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
<h2>Please fill the details</h2>
     <!--  Before comming to this page, you have to add  userDetails in ModelAndView object-->
	<form:form action="Registration" method="post" commandName="user">
		<table>
			<tr>
				<td>UserID<form:label path="id">
						<spring:message text="ID" />
					</form:label></td>

				<td><form:input path="id" pattern=".{4,15}" required="true"
				        placeholder ="enter your id"
						title="id should contains 4 to 15 characters" /></td>
			</tr>
			<tr>
				<td>Name<form:label path="name">
						<spring:message text="User Name" />
					</form:label></td>

				<td><form:input path="name" required="true"
				placeholder ="enter your id" minlength="5" maxlenth="15"
						title="name should not be empty" /></td>
			</tr>
			<tr>
				<td>password<form:label path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input type="password" path="password" pattern=".{4,15}"
						required="true" placeholder="enter you password"
						title="password should contains 4 to 15 characters" /></td>
			</tr>
			<tr>
				<td>Contact<form:label path="contact">
						<spring:message text="contact" />
					</form:label></td>

				<td><form:input type="tel" path="contact" pattern="^\d{10}$" required="true"
						title="Please enter valid contact number" /></td>
			</tr>

			<tr>
				<td> EMail :

				<td><form:input type="email" path="Email" /></td>
			</tr>

		
			<tr>

				<td><input type="submit"
					value="Submit"Register"/></td>
				<td><input type="reset" value="RESET"Reset"/>
				</td>
			</tr>

		</table>

	</form:form>

 
 
 
 
 




</body>
</html>