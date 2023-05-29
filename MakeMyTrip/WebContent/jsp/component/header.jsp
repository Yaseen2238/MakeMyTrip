<%@page import="com.naaptol.makeMyTrip.beans.HotelBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/style.css">
<script src="<%=request.getContextPath()%>/js/jquery-3.6.4.js"></script>
<script src="<%=request.getContextPath()%>/js/script.js"></script>
</head>
<body>
	<!--header starts-->
	<header>
		<!--top nav starts-->
		<div class="header" id="header1">
			<ul class="logoList">
			<li><a id="logoAnchor" href="<%=request.getContextPath()%>" class="logo"><img
				src="<%=request.getContextPath()%>/images/logo.png" alt=""></a>
				</li>
				</ul>
			
			<ul class="topNav1">
			
				<li class="myTrips"><a id="myTripsAnchor" href="#"> <span> My trips</span> <br>
						<span class="manageBookingSpan">manage your Bookings</span></a></li>
			     
			<li>
<form action="<%=request.getContextPath()%>/MainServlet" id="logoutForm" method="post">
        <a href="#" onclick="logout()">Logout</a>
        <input type="hidden" class="logoutForm" value="logout" name="requestType" method="post">
    </form>
</li>
	
								
								<li class="userName" >
			         	<div>
				<span class="loggedInUserName">Hi Guest</span>
						</div>
						</li>
				<li class="loginOrCreate" onclick="regLog.on()">
				<div>
							<span class="myIcon"></span> 
							<span class="logOrCreateSpan">Login or Create Account</span>
						</div>
						</li>
			
			</ul>



			<div class="clr"></div>
		</div>
		<!--top nav stops-->
		<div class="headBanner" id="headBanner">
			<div class="navInBanner">
				<ul class="navUlInBanner">
					<li><a  class="hotel" href="<%=request.getContextPath()%>/jsp/ShowHotels.jsp">
					<span class="navIcon hotelIconInNav"></span>

							Hotels </a></li>
					<li ><a class="flights" href="#"> <span class="navIcon flightIconInNav"></span>

							Flights
					</a></li>

					<li><a href="#"> <span class="navIcon HomeIconInNav"></span>

							Homestays
					</a></li>
					<li><a href="#"><span class="navIcon holidayIconInNav"></span>

							Holiday Packages </a></li>
					<li><a href="#"> <span class="navIcon trainIconInNav"></span>

							Trains
					</a></li>
					<li><a href="#"><span class="navIcon busIconInNav"></span>

							Buses </a></li>
					<li><a href="#"> <span class="navIcon cabIconInNav"></span>

							Cabs
					</a></li>
					<li><a href="#"><span class="navIcon forexIconInNav"></span>

							Forex </a></li>
					<li><a href="#"><span class="navIcon charterIconInNav"></span>

							Charter flights </a></li>
					<li><a href="#"><span class="navIcon activitiesIconInNav"></span>

							activities </a></li>
					<div class="clr"></div>
				</ul>
				<div class="clr"></div>
			</div>
			<div class="infoOfSelectedOption">
				<div class="searchPannerlForFlight">
					<div class="hotelLocation">
						<p id="cityPropertlocation">CITY,PROPERTY NAME OR LOCATION</p>
						        
					
			<P id="cityNameInSearchHotel">MUMBAI</P>
						<p id="countryNameInSearchHotel">India</p>	
						<div class="clr"></div>
					</div>

					<div class="checkInDiv">
						<p>
							CHECK-IN <span class="dropDownIcon"> </span>
						</p>
						<input type="date" name="chenInDate" id="checkInDate" onchange="validateCheckOutDate()">
						<div class="clr"></div>

					</div>

					<div class="checkOutDiv">
						<p>
							CHECK-OUT <span class="dropDownIcon"> </span>
						</p>
							<input type="date" name="chenInDate" id="checkInDate">					
						<div class="clr"></div>
					</div>

					<div class="roomsAndGuests">
						<p id="roomsGuest">ROOMS & GUESTS</p>
						<p>
							<span id="numberOfroom">1</span> Room <span id="numberOfGusts">2</span>
							Adults
						</p>

					</div>

					<div class="pricePerNight">
						<p>PRICE PER NIGHT</p>
						<p id="pricePerNight">&#8377;0-&#8377;1500</p>

					</div>
				</div>
				<div class="searchButton"></div>
			</div>
			<div class="searchIconInBanner" onclick="hideBanner()">
				<p ><a href="<%=request.getContextPath()%>/jsp/ShowHotels.jsp">SEARCH</a></p>
			</div>

		</div>
	</header>
	<!--header stops-->


	<!----------Login page start---------->
	<div id="overlay"
		onclick="regLog.off(),regLog.closeRegistration(),wiv.reset(),regLog.loginReset()">
	</div>


	<div id="loginPage">
		<span class="loginNow">Login to MakeMyTrip </span>
		<hr class="loginHeadHorizontalLine">

		<form action="<%=request.getContextPath()%>/MainServlet" id="loginForm" method="post">
			<div class="loginDetails">
				<label for="loginEmail">Username</label> <input type="text"
					id="loginEmail" name="loginEmail"
					onkeyup="wiv.loginEmailValidaton()"
					placeholder="Enter your Email...">
				<p id="invalidLoginEmail" class="errorMessage"></p>
			</div>

			<div class="loginDetails">
				<label for="password">Password</label>
				 <input type="password" id="password" name="loginPassword" placeholder="Enter password..." onkeyup="regLog. invalidLoginPassword()">
				<input type="hidden" value="login" name="requestType" >
								<p id="invalidLoginPassword" class="errorMessage"></p>
			</div>
			<!--  for login button onclick="regLog.validation()"  -->
			<button type="button" class="loginButton"
				onclick="regLog.validation()">Login</button>
			<p class="dontHaveAccount">
				Don't have an account?<a href="#"
					onclick="regLog.openRegistration(),regLog.loginReset()">Create
					now</a>
			</p>

			<button type="button" id="closeButton" onclick="regLog.off()">
				<span>X</span>
			</button>
			<span id="incorrectDetails"></span>


		</form>
	</div>
	<!----------Login page End---------->

	<!----------Registration page Start---------->

	<div id="registerPage">

		<p class="registerToA1Gym">Register To MakeMTrip</p>
		<hr class="registerHeadHorizontalLine">


		<form action="<%=request.getContextPath()%>/MainServlet" id="registrationForm" class="registerForm"
			method="post">
			<div class="fNameDiv regDetailDiv">
				<label for="FirstName">First Name</label> <input type="text"
					name="fname" class="name regValue" id="firstName"
					onkeyup=" wiv.fNameValidation()"
					oninput="wiv.wrongFnameValidation()"
					placeholder="Enter your first name here...">
				<p id="invalidFirstName" class="errorMessage"></p>
			</div>


			<div class="lNameDiv regDetailDiv">
				<label for="Last Name">Last Name</label> <input type="text"
					name="lname" class="name regValue" id="lastName" maxlength="20"
					onkeyup="wiv.lNameValidation()"
					oninput="wiv.wrongLnameValidation()"
					placeholder="Enter your last name here...">
				<p id="invalidLastName" class="errorMessage"></p>
			</div>


			<div class="pNumDiv regDetailDiv">
				<label for="PhoneNumber">Phone Number</label> <input type="text"
					name="phoneNumber" class="regValue" maxlength="10" id="phoneNumber"
					onkeyup="wiv.phoneNumberValidaton()"
					oninput="wiv.wrongPhoneNumberValidation()"
					placeholder="Enter your 10 digit Number here...">
				<p id="invalidPhoneNumber" class="errorMessage"></p>
			</div>

			<div class="emailDiv regDetailDiv">
				<label for="Email">Email</label> <input type="text" name="email"
					class="regValue" id="registerationEmail"
					onkeyup="wiv.emailValidaton()"
					placeholder="Enter your Email here...">
				<p id="invalidEmail" class="errorMessage"></p>
			</div>
			<div class="userType regDetailDiv">
				User Type <br> <select name="userType" id="selectUserType">
					<option value="admin">Admin</option>
					<option value="user" selected>User</option>

				</select>
			</div>
			<!-- 
        <div class="gender regDetailDiv">
            Gender <br>
           <select name="gender" id="selectGender">
            <option value="male">Male</option>
            <option value="female" >Female</option>
           </select>
        </div>


        <div class="dobDiv regDetailDiv">
            <label for="dateOfBirth">DOB</label> <input type="text" name="dob"
                class="regValue" id="registerationDOB"
                onkeyup="wiv.dateOfBirthValidaton()"
                oninput="wiv.wrongDOBValidation()" placeholder="dd-mm-yyyy">
            <p id="invalidDOB" class="errorMessage"></p>
        </div>

       
        <div class="dojDiv regDetailDiv">
            <label for="dateOfJoining">DOJ</label>
            <input type="text" class="regValue" id="registerationDOJ" onkeyup="wiv.dateOfJoiningValidaton()"
                oninput="wiv.wrongDOJValidation()" placeholder="dd-mm-yyyy">
            <p id="invalidDOJ" class="errorMessage"></p>
        </div>
         -->
			<!--
<div class="addressDiv regDetailDiv">
<label for="address">Address</label>
<input type="text" placeholder="Enter your Address here...">
</div>
-->
			<div class="passwordDiv regDetailDiv">
				<label for="password">Password</label> <input type="password"
					name="password" class="regValue" id="registerationPassword"
					onkeyup="wiv.passwordValidaton()"
					placeholder="Enter your Password here...">
				<p id="WeakPassword" class="errorMessage"></p>
				<input type="hidden" value="register" name="requestType">


			</div>

			<p id="successful"></p>
			<button type="button" id="submitButton" class="registerButton"
				onclick="wiv.submitValidation()">SUBMIT</button>
			<button type="reset" id="resetButton" onclick="wiv.reset()">RESET</button>
			<button type="button" class="cancelButton"
				onclick="regLog.closeRegistration(),wiv.reset(),regLog.off()">Cancel</button>
			<p class="haveAccount">
				Already have an account?<a href="#"
					onclick="regLog.closeRegistration(),regLog.on(),wiv.reset()">Login
					here</a>
			</p>

		</form>

	</div>
	<!----------Registration page Closed---------->
	
	    
       <% String name;
       if(session.getAttribute("uname")!=null&& session.getAttribute("uname")!=" "){
    	   name =(String)session.getAttribute("uname");
       }
       else{
    	   name=null;
    	   
       }
    if(name!=null)
    	  {%>
    	  <script >
    	   	$(".loggedInUserName").text("Hi <%=name%>");
    	   	$(".loginOrCreate").hide();
    	   	$("#logoutForm").show();
    	   	document.getElementById("myTripsAnchor").href="<%=request.getContextPath()%>/jsp/MyTrips.jsp";
    	   	$(".bookSuccess").hide();


    	    </script>
    	<%  }%>
        
</body>
<script>

</script>
</html>