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
	<form:form action="EndTY" method="post" commandName="orders">
		<table>
		
		<tr>
				<td>User_id<form:label path="User_id">
						<spring:message text="User_id" />
					</form:label></td>

				<td><form:input path="User_id" pattern="${CurrentUser}" required="true"
				        placeholder ="${CurrentUser} "
						title="id should contains 1 to 15 characters" /></td>
			</tr>
			<tr>
				<td>House_no<form:label path="house_no">
						<spring:message text="house_no" />
					</form:label></td>

				<td><form:input path="house_no" pattern=".{2,4}" required="true"
				        placeholder ="Enter House no"
						title="id should contains 2 to 4 characters" /></td>
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

				<td><form:input type="City" path="City" pattern=".{3,15}"
						required="true" placeholder="enter you City"
						title="password should contains 3 to 45 characters" /></td>
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
			
			<div class="panel-body">
							<div class="form-group">
								<div class="col-md-12">
									<strong>Card Type:</strong>
								</div>
								<div class="col-md-12">
									<select id="CreditCardType" name="CreditCardType"
										class="form-control">
										<option value="5">Visa</option>
										<option value="6">MasterCard</option>
										<option value="7">American Express</option>
										<option value="8">Discover</option>
									</select>
								</div>
							</div>
			<%-- <td>CardType<form:label path="Card_type">
						<spring:message text="Card_type" />
					</form:label></td>

				<td><form:input type="tel" path="Card_type" pattern="" required="true"
						title="Please enter valid contact number" /></td>
			</tr> --%>
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
			<div class="form-group">
								<div class="col-md-12">
									<strong>ExpiryDate</strong>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<select class="form-control" name="expirydate" id=" expirydate">
										<option value="">Month</option>
										<option value="01">01</option>
										<option value="02">02</option>
										<option value="03">03</option>
										<option value="04">04</option>
										<option value="05">05</option>
										<option value="06">06</option>
										<option value="07">07</option>
										<option value="08">08</option>
										<option value="09">09</option>
										<option value="10">10</option>
										<option value="11">11</option>
										<option value="12">12</option>
									</select>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<select class="form-control" name="">
										<option value="">Year</option>
										<option value="2015">2015</option>
										<option value="2016">2016</option>
										<option value="2017">2017</option>
										<option value="2018">2018</option>
										<option value="2019">2019</option>
										<option value="2020">2020</option>
										<option value="2021">2021</option>
										<option value="2022">2022</option>
										<option value="2023">2023</option>
										<option value="2024">2024</option>
										<option value="2025">2025</option>
									</select>
								</div>
							</div>
			<%-- <td>ExpiryDate<form:label path="expirydate">
						<spring:message text="expirydate" />
					</form:label></td>

				<td><form:input type="tel" path="expirydate" pattern="" required="true"
						title="Please enter ExpiryDate" /></td>
			</tr> --%>
		
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