<%@page import="java.util.ArrayList"%>
<%@page import="com.naaptol.makeMyTrip.beans.HotelBean"%>
<%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Book Hotels</title>
</head>
<body>
<div class="wrapper">
  
  <jsp:include page="component/header.jsp"/>	
  
<%
HotelHelper helper = new HotelHelper();
ArrayList hotelDetails = (ArrayList) helper.getHotelDetails();
for (int i = 0; i < hotelDetails.size(); i++)
{
    HotelBean hotelBean = (HotelBean)hotelDetails.get(i);
%>
<a href="HotelDetails.jsp?hotelId=<%= hotelBean.getHotel_id() %>" class=" showAnchor">
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


<script>
$(".infoOfSelectedOption").hide();
$(".searchIconInBanner").hide();
document.body.style.backgroundSize="100% 180px";
$(".hotel").css("color", "rgb(0, 139, 245)");
</script>
      <jsp:include page="component/footer.jsp"/>	
</div>

</body>
 

</html>
