<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
#con{
	font-family: font-family: cursive;
	padding-top: 11px;
	width: 100%;
	width: 100vw;
	 height: 346px;
	background: #3a6186;
	background: -webkit-linear-gradient(to left, #3a6186, #89253e);
	background: linear-gradient(to left, #3a6186, #89253e);
	color: #fff;
}

#contain{
	width: 88%;
    margin-left: 128px;

}

</style>
</head>
<body>
<a href="index"> Back </a>
	<section id ="con">
	<div id="contain">
		<div id="row">
			<div id="about_our_company" style="margin-bottom: 20px;">
				<h1 style="color: #fff;">CONTACT US</h1>
				<div class="titleline-icon"></div>
				<p style="color: #fff;"></p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<form name="sentMessage" id="contactForm" novalidate="">
					<div class="row">
						<div class="col-md-6">
							<div class="form-group">
								<input type="text" class="form-control"
									placeholder=" Name " id="name" required=""
									data-validation-required-message="Please enter your name.">
								<p class="help-block text-danger"></p>
							</div>
							<div class="form-group">
								<input type="email" class="form-control"
									placeholder="Email " id="email" required=""
									data-validation-required-message="Please enter your email address.">
								<p class="help-block text-danger"></p>
							</div>
							<div class="form-group">
								<input type="tel" class="form-control"
									placeholder="Phone " id="phone" required=""
									data-validation-required-message="Please enter your phone number.">
								<p class="help-block text-danger"></p>
							</div>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<textarea class="form-control" placeholder=" Message "
									id="message" required=""
									data-validation-required-message="Please enter a message."></textarea>
								<p class="help-block text-danger"></p>
							</div>
						</div>

					</div>
				</form>
			</div>
			<div class="col-md-4">
				<p style="color: #fff;">
					<strong><i class="fa fa-map-marker"></i> Address</strong><br>
					BittanMarket,Bhopal, MadhyaPradesh 462021
				</p>
				<p style="color: #fff;">
					<strong><i class="fa fa-phone"></i> Phone Number</strong><br>
					+91-7389616986
				</p>
				<p style="color: #fff;">
					<strong><i class="fa fa-envelope"></i> Email Address</strong><br>
					Sourabh.shrivastava545@gmail.com
				</p>
				<p></p>
				<div class="clearfix"></div>
				<div class="col-lg-12 text-center">
					<div id="success"></div>
					<button type="submit" class="btn btn-xl get">Send Message</button>
				</div>

			</div>
		</div>
	</div>
	</section>


</body>
</html>