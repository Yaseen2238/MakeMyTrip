<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Expires" content="0">

<title>Book your Hotel</title>
</head>
<body>
<div class="wrapper">
  <jsp:include page="component/header.jsp"/>	
<div class="detailsDiv">
  <h1>Details Required</h1>
  <hr>
    <form action="<%=request.getContextPath()%>/MainServlet"  id="guestForm" method="post">
        <label for="checkInField">Check-in:</label>
        <input type="date" id="checkInDate" name="checkInDate" ><br>

        <label for="checkOutField">Check-out:</label>
        <input type="date" id="checkOutDate" name="checkOutDate" ><br>

        <label for="numOfGuests">Number of Guests:</label>
        <input type="text" id="numOfGuests" name="numOfGuests" onkeyup="createGuest()" >
        <input type="hidden" name="requestType" value="hotelBooking">
        <input type="hidden" name="roomId" value="<%=request.getParameter("roomId")%>">
        <input type="hidden" name="userId" value="<%=session.getAttribute("userId")%>">
        
        <br><br>

        <div id="guestDetailsDIv"></div>

        <button class="submitGuest">Submit</button>
    </form>
    <%System.out.println("room id in room book page"+request.getParameter("roomId")); %>
        <%System.out.println("user id in room book page"+session.getAttribute("userId")); %>
    
</div>
      <jsp:include page="component/footer.jsp"/>	
</div>
</body>

<script>

    // Function to generate guest detail fields
    function createGuest()
    {
    	 var numOfGuests = document.getElementById("numOfGuests").value;
         var container = document.getElementById("guestDetailsDIv");
        container.innerHTML = ""; 

        for (var i = 1; i <= numOfGuests; i++) 
        {
            var guestFields = 
                '<p>Guest ' + i + ' Details</p>' +
                '<label for="guestName' + i + '">Guest Name:</label>' +
                '<input type="text" id="guestName' + i + '" name="guestName' + i + '" ><br>' +
                '<label for="guestEmail' + i + '">Guest Email:</label>' +
                '<input type="text" id="guestEmail' + i + '" name="guestEmail' + i + '" ><br>' +
                '<label for="guestAge' + i + '">Guest Age:</label>' +
                '<input type="number" id="guestAge' + i + '" name="guestAge' + i + '" >' +
                '<br><br>';

            container.innerHTML += guestFields;
        }
    }

    $(".infoOfSelectedOption").hide();
    $(".searchIconInBanner").hide();
    document.body.style.backgroundSize="100% 180px";
    $(".hotel").css("color", "rgb(0, 139, 245)");
</script>
</html>
