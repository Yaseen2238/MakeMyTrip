<%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>
<%@page import="com.naaptol.makeMyTrip.beans.BookingDetailsBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>My Trips</title>
</head>
<body>
<div class="wrapper">
  <jsp:include page="component/header.jsp"/>	
  <section>
  <%if(request.getAttribute("roomId")!=null&&session.getAttribute("userId")!=null){ %>
  <script>
  $(".beforeBook").hide();
  $(".afterBook").show();
  $("body").css("background-image", "linear-gradient(to bottom,black,#15457c)");
  
  </script>
  <div class="afterBook"> 
  <%ArrayList al=(ArrayList)session.getAttribute("bookingList"); 
  BookingDetailsBean currentBooking=(BookingDetailsBean)al.get(0);
  ArrayList bookingHistory=(ArrayList)al.get(1);
  %>
  <p class="yourTrips">Happy journy </p>
   <h1 class="bookSuccess" > You have successfully booked the hotel</h1>
   <div class="bookingDetailsTable currentBooking">
   
   <table border="1">
		<tr>
			<th>Booking ID</th>
			<th>Hotel Name</th>
			<th>City</th>
			<th>State</th>
			<th>Room Type</th>
			<th>Price per night</th>
			<th>Number Of Guests</th>
			<th>Check In</th>
			<th>Check Out</th>
			<th>Status</th>
		</tr>
		
		<tr class="currentBookingRow">
		<td><%=currentBooking.getBookingId()%></td>
		<td><%=currentBooking.getHotelName()%></td>
		<td><%=currentBooking.getCity()%></td>
		<td><%=currentBooking.getState()%></td>
		<td><%=currentBooking.getRoomType()%></td>
		<td><%=currentBooking.getPricePerNight()%></td>
		<td><%=currentBooking.getNumberOfGuest()%></td>
		<td><%=currentBooking.getCheckIn()%></td>
		<td><%=currentBooking.getCheckOut()%></td>
		<td>Successfull</td>
		</tr>
		
		</table>
		<a href="<%=request.getContextPath()%>" class="viewAllTripsButton">Plan More Trips</a>
		</div>
  </div>
  <%} %>
 
   
   <% 
  System.out.println("user id before loop in jsp"+session.getAttribute("userId"));
   System.out.println("room id before loop in jsp"+session.getAttribute("roomId"));
   
   if(session.getAttribute("userId")!=null&& request.getAttribute("roomId")==null){
   HotelHelper hp=new HotelHelper();
   int userId=Integer.parseInt(session.getAttribute("userId").toString());
   System.out.println("id when in second condition jsp"+userId);
   
   ArrayList tripsHistory=(ArrayList)hp.userBookingHistory(userId);
   System.out.println("list when in second condition jsp"+tripsHistory);

 %>  <script>
  $(".afterBook").hide();
  $(".beforeBook").show();
  $("body").css("background-image", "linear-gradient(to bottom,black,#15457c)");


  </script>
  
    <div class="beforeBook">
  <p class="yourTrips">Your Happy Trips With Us</p>
   <table border="1">
		<tr>
			<th>Booking ID</th>
			<th>Hotel Name</th>
			<th>City</th>
			<th>State</th>
			<th>Room Type</th>
			<th>Price per night</th>
			<th>Number Of Guests</th>
			<th>Check In</th>
			<th>Check Out</th>
			<th>Status</th>
		</tr>
				<%for(int i=0;i<=tripsHistory.size()-1;i++)
		{
					ArrayList tripHistory2=(ArrayList)tripsHistory.get(i);
					for(int j=0;j<=tripHistory2.size()-1;j++){
		  BookingDetailsBean tripsHistoryDetails=(BookingDetailsBean)tripHistory2.get(j);
		
		%>
			<tr class="userHistory">
		<td><%=tripsHistoryDetails.getBookingId()%></td>
		<td><%=tripsHistoryDetails.getHotelName()%></td>
		<td><%=tripsHistoryDetails.getCity()%></td>
		<td><%=tripsHistoryDetails.getState()%></td>
		<td><%=tripsHistoryDetails.getRoomType()%></td>
		<td><%=tripsHistoryDetails.getPricePerNight()%></td>
		<td><%=tripsHistoryDetails.getNumberOfGuest()%></td>
		<td><%=tripsHistoryDetails.getCheckIn()%></td>
		<td><%=tripsHistoryDetails.getCheckOut()%></td>
		<td>Successfull</td>
		</tr>
		<%} %>
		</table>
		<%}} %>
  </div>
  </section>
    <jsp:include page="component/footer.jsp"/>	
  </div>
 
</body>
<script >
$(".infoOfSelectedOption").hide();
$(".searchIconInBanner").hide();
document.body.style.backgroundSize="100% 180px";
$(".myTrips").hide();

</script>
</html>