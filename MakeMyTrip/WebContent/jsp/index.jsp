<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="com.naaptol.makeMyTrip.beans.HotelBean"%>
<%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MakeMyTrip</title>
</head>
<body>
<div class="wrapper">
  <jsp:include page="component/header.jsp"/>	
  
 <section>
   <div class="adminDashboard" id="adminDashboard">
 <div class="addHotels addDiv" id="addHotels">
 <div class="hotelImage">
 <img alt="hotel image" src="<%=request.getContextPath() %>/images/hotelImage.avif">
 <a class="addButton addHotelButton" href="<%=request.getContextPath() %>/jsp/AddHotels.jsp"> Add Hotel</a>
  <a class="deleteButton deleteHotelButton" href="<%=request.getContextPath() %>/jsp/deleteHotel.jsp"> Delete Hotel/Rooms</a>
 
 
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
 
   
   <!-- below code is for div on home page -->
<%
HotelHelper helper = new HotelHelper();
ArrayList hotelDetails = (ArrayList) helper.getHotelDetails();
for (int i = 0; i < 3; i++)
{
    HotelBean hotelBean = (HotelBean)hotelDetails.get(i);
%>
<a href="<%=request.getContextPath() %>/jsp/HotelDetails.jsp?hotelId=<%= hotelBean.getHotel_id() %>" class=" showAnchor">
     <div class="hotelInfoDIv hotelInfoDIv<%=i%>">
      <div class="hotelNameAndImage">
        <div class="hotelImages  ">
         <img src="<%=request.getContextPath()%>/images/<%=hotelBean.getImage()%>">
                <div class="clr"></div>
        
        </div> 
               
        
        <div class="hotelNameAndAddress">
        <p class="hotelName"> <%=hotelBean.getHotelname()+","+hotelBean.getCity()%></p>
        <p class="amenities">&#x2713;Common Facilities: <br> <%=hotelBean.getHotelAmenities()%> </p>
        <p class="hoterlStar"><%=Integer.parseInt(hotelBean.getHotelStar())%> Star Hotel</p>
       <p class="hotelState"><%=hotelBean.getState()+"  "+hotelBean.getCountry()%> </p> 
              <%request.setAttribute("hotelName", hotelBean.getHotelname()); %>
              <div class="clr"></div>
      
        </div>
        
      </div>
      <div class="hotelPrice">
      <p class="hotelPrice"><span class="startingFrom">Starting from</span><br>
      <span class="price"> &#8377;<%=Integer.parseInt(hotelBean.getMinPrice())%></span></p>
<a href="HotelDetails.jsp?hotelId=<%= hotelBean.getHotel_id() %>" class="bookButton showAnchor">Book Now</a>
              <div class="clr"></div>
      
      </div>
        <div class="clr"></div>
     
    </div>
</a>
<%
}
%>
 
 </section>

            <jsp:include page="component/footer.jsp"/>	
        
 
    </div>
</body>

<%
	
	if("admin".equals(session.getAttribute("userType"))) {%>
<script>
$(".adminDashboard").show();
</script>

<%} %><%if(!"admin".equals(session.getAttribute("userType"))) {%>
<script>
$(".adminDashboard").hide();

</script>
<%} %>

</html>