<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Hotels</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">

</head>
<body>
<div class="wrapper">
  <jsp:include page="component/header.jsp"/>	
<section><div class="adminDashboard" id="adminDashboard">
 <div class="addHotels addDiv" id="addHotels">
 <div class="hotelImage">
 <img alt="hotel image" src="<%=request.getContextPath() %>/images/hotelImage.avif">
 <a href="<%=request.getContextPath() %>/jsp/AddHotels.jsp">
 <button class="addButton addHotelButton"> Add Hotels</button></a>
 
 </div>
 
 </div>
 <div class="addFlights addDiv" id="addFlights">
 <div class="flightImage">
  <img alt="flight image" src="<%=request.getContextPath() %>/images/flightimage.avif">
 <button class="addButton addFlightButton"> Add Flights</button>
 </div>
 </div>
 <div class="clr"></div>
 </div>
 
 </section>
             <jsp:include page="component/footer.jsp"/>	
</div>
</body>
<script>
$(".myTrips").hide();
$(".userName").show();
document.header.style.display="none";


</script>
</html>