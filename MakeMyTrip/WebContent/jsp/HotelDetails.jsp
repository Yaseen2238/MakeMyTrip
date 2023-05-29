<%@page import="com.naaptol.makeMyTrip.beans.RoomBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>
<%@page import="com.naaptol.makeMyTrip.beans.HotelBean"%>
<%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<div class="wrapper">
  <jsp:include page="component/header.jsp"/>	

<div class="roomContainer">
<% HotelHelper hp=new HotelHelper();
ArrayList list=(ArrayList)(hp.getRoomDetails(Integer.parseInt( request.getParameter("hotelId"))));
   
boolean flag=false;
for (int i = 0; i < list.size(); i++)
{
   RoomBean roomBean = (RoomBean)list.get(i);
    if(flag!=true) {%>
        <div class="roomHotelNameDiv">
        <p class="hotelName roomHotelName"><%=roomBean.getHotel_name()%></p>
        <hr>
           <div class="clr"></div>
          </div>
          <% flag=true;
          } %>
          <div class="roomInfo roomInfo<%=i%>">
        <div class="roomTypeDiv roomTypeDiv<%=i%>">
        <p class="roomType"><span class="roomTypeSpan">&#x2713;Room Type</span>: <%=roomBean.getRoomType()%> </p>
        <p class="description"><span class="descriptionSpan">&#x2713;Room Facilities</span>: <%=roomBean.getRoomDescription()%></p>
        <p class="roomPrice"><span class="priceSpan">&#x2713;Price per night</span>: &#8377;<%=roomBean.getRoomPrice()%></p>
        </div>
        <div class="clr"></div>
        <%
      
        System.out.println("room in id in book room"+roomBean.getRoomId());
        if(session.getAttribute("uname")!=null){%>
     <a href="BookRoom.jsp?roomId=<%= roomBean.getRoomId() %>" class="bookThis">Book this</a>
  <%} %>
          <%if(session.getAttribute("uname")==null){%>
     <a class="bookThis" onclick="regLog.on()">Login to continue</a>
  <%} %>
  
</div>
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