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

<!-- <div class="container">
	<div class="row">
		<h2>Create Acount</h2> 
        
        
        
        <form class="form-horizontal"  action="Registration" method="POST" commandName="user" >
<fieldset>
 
 
<legend>Register Here</legend>
 
 
<div class="form-group">
  <label class="col-md-4 control-label" path="name"> Name:</label>  
  <div class="col-md-4">
  <input path="name" name="name" placeholder="Insert your  Name" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>
 
 
<div class="form-group">
  <label class="col-md-4 control-label" path="id">User-ID:</label>  
  <div class="col-md-4">
  <input path="id" name="id" placeholder="Insert your Id Name" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>
 
 
<div class="form-group">
  <label class="col-md-4 control-label" path="password">Password:</label>  
  <div class="col-md-4">
  <input path="password" name="password" placeholder="Insert your Password" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>
 
 
 
<div class="form-group">
  <label class="col-md-4 control-label" path="mail">Email:</label>  
  <div class="col-md-4">
  <input path="Email" name="Email" placeholder="Insert your Email" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>
 
 
 
<div class="form-group">
  <label class="col-md-4 control-label" path="contact">Phone No:</label>  
  <div class="col-md-4">
  <input path="contact" name="contact" placeholder="Insert your Contact" class="form-control input-md" required="" type="text">
  <span class="help-block"> </span>  
  </div>
</div>
 
<div class="form-group">
  <label class="col-md-4 control-label" for="singlebutton"> </label>
  <div class="col-md-4">
    <button id="singlebutton" name="singlebutton" class="btn btn-primary">Submit</button>
  </div>
</div>
 
</fieldset>
</form>
 
	</div>
</div> -->
 

 
<h2>Please fill the details</h2>
     <!--  Before comming to this page, you have to add  userDetails in ModelAndView object-->
	<form:form action="Submit" method="get" commandName="orders">
		<table>
		
		<tr>
				<td>User_id<form:label path="User_id">
						<spring:message text="User_id" />
					</form:label></td>

				<td><form:input path="User_id" pattern="${CurrentUser}" required="true"
				        placeholder ="${CurrentUser} "
						title="id should contains 4 to 15 characters" /></td>
			</tr>
			<tr>
				<td>House_no<form:label path="house_no">
						<spring:message text="house_no" />
					</form:label></td>

				<td><form:input path="house_no" pattern=".{4,15}" required="true"
				        placeholder ="Enter House no"
						title="id should contains 4 to 15 characters" /></td>
			</tr>
			<tr>
				<td>Street<form:label path="Street">
						<spring:message text="Street" />
					</form:label></td>

				<td><form:input path="Street" required="true"
				placeholder ="enter your Street" minlength="5" maxlenth="100"
						title="Street should not be empty" /></td>
			</tr>
			<tr>
				<td>city<form:label path="City">
						<spring:message text="City" />
					</form:label></td>

				<td><form:input type="City" path="City" pattern=".{4,15}"
						required="true" placeholder="enter you City"
						title="password should contains 1 to 45 characters" /></td>
			</tr>
			<tr>
				<td>State<form:label path="State">
						<spring:message text="State" />
					</form:label></td>

				<td><form:input type="tel" path="State" pattern="" required="true"
						title="Please enter State" /></td>
			</tr>

			<tr>
				<td> ZIP-PIncode :

				<td><form:input type="pincode" path="pincode" /></td>
			</tr>
			<td>Country<form:label path="Country">
						<spring:message text="Country" />
					</form:label></td>

				<td><form:input type="tel" path="Country" pattern="" required="true"
						title="Please enter country name" /></td>
			</tr>
			
			<td>CardType<form:label path="Card_type">
						<spring:message text="Card_type" />
					</form:label></td>

				<td><form:input type="tel" path="Card_type" pattern="" required="true"
						title="Please enter valid contact number" /></td>
			</tr>
           <td>CardNumber<form:label path="Card_no">
						<spring:message text="Card_no" />
					</form:label></td>

				<td><form:input type="tel" path="Card_no" pattern="" required="true"
						title="Please enter valid Card number" /></td>
			</tr>
			 <td>CardCvv<form:label path="Card_cvv">
						<spring:message text="Card_cvv" />
					</form:label></td>

				<td><form:input type="tel" path="Card_cvv" pattern="" required="true"
						title="Please enter valid Cvv number" /></td>
			</tr>
			
			<td>ExpiryDate<form:label path="expirydate">
						<spring:message text="expirydate" />
					</form:label></td>

				<td><form:input type="tel" path="expirydate" pattern="" required="true"
						title="Please enter ExpiryDate" /></td>
			</tr>
		
			<tr>

				<td><input type="submit"
					value="Submit"Confirm"/></td>
				<td><input type="reset" value="RESET"Reset"/>
				</td>
			
			</tr>

		</table>

	</form:form>

 
 
 
 
 




</body>
</html>