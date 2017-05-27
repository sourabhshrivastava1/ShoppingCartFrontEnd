<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="resource/css/mystyle.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<jsp:include page="Linking.jsp"></jsp:include>
<style type="text/css">
#Address
{
    width: 80%;
    margin-left: 102px;

}

.panel-info>.panel-heading {
    color: #3F51B5;
    background-color: #FFEB3B;
    border-color: #FFEB3B;
}



.panel-body {
    padding: 15px;
    width: 84%;
    margin-left: 71px;
}

.form-group {
    margin-bottom: 15px;
    color: brown;
}
#ad{

    font-weight: 700;
   font-size: 28px;
}

</style>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="container">
<section id="Address">
					<div class="panel panel-info">
						<div class="panel-heading">
							<span><i class="fa fa-taxi" style="font-size:48px;color:red"></i></span><strong id="ad"> ADDRESS</strong>
						</div>
						<section id="shipping">
						<div class="panel-body">
						
							<!-- <div class="form-group">
								<div class="col-md-12">
									<h4>Shipping Address</h4>
								</div>
							</div>
							<<!-- div class="form-group">
								<div class="col-md-12">
									<strong>Country:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" class="form-control" name="country" value="" />
								</div>
							</div> -->
							<div class="form-group">
								<div class="col-md-6 col-xs-12">
									<strong>HouseNo:</strong> <input type="text"
										name="house_no" id="house_no" class="form-control" value="" />
								</div>
								<!-- <div class="form-group"></div>
								<div class="col-md-6 col-xs-12">
									<strong>houseNo:</strong> <input type="text" name="House_no"
										class="form-control" value="" />
								</div> -->
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>Street:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="Street" id="Street" class="form-control" value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>City:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="city" id="City" class="form-control" value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>State:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="state" id="State" class="form-control" value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>Zip / Pincode</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="pincode" id="Pincode" class="form-control"
										value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>Country:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="country" id="Country" class="form-control"
										value="" />
								</div>
							</div>
							<!-- <div class="form-group">
								<div class="col-md-12">
									<strong>Email Address:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" name="email_address" class="form-control"
										value="" />
								</div> -->
							</div>
						</div>
						</section>
					</div>
					
</section>
<section>					
					<!--SHIPPING METHOD END-->
					<!--CREDIT CART PAYMENT-->
					<div class="panel panel-info">
						<div class="panel-heading">
							<span><i class="glyphicon glyphicon-lock"></i></span><strong id="ad"> Secure
							Payment</strong>
							
						</div>
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
							<div class="form-group">
								<div class="col-md-12">
									<strong>Credit Card Number:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" class="form-control" name="Card_no" id="Card_no"
										value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>Card CVV:</strong>
								</div>
								<div class="col-md-12">
									<input type="text" class="form-control" name="card_cvv" id="Card_cvv"
										value="" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-12">
									<strong>ExpiryDate</strong>
								</div>
								<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
									<select class="form-control" name="" id=" expirydate">
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
							<div class="form-group">
								<div class="col-md-12">
									<span>Pay secure using your credit card.</span>
								</div>
								<div class="col-md-12">
									<ul class="cards">
										<li class="visa hand">Visa</li>
										<li class="mastercard hand">MasterCard</li>
										<li class="amex hand">Amex</li>
									</ul>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-md-6 col-sm-6 col-xs-12">
								<a href="<c:url value= 'Confirm'/>">
									<button  class="btn btn-primary btn-submit-fix">Place
										Order
									</button>
								</a>	
								</div>
							</div>
						</div>
					</div>
					<!--CREDIT CART PAYMENT END-->
				
				
				

			</form>
		</div>
		
</section>

		<div class="row cart-footer"></div>
	</div>

</body>
</html>