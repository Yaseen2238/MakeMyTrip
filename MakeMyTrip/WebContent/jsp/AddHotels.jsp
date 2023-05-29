<%@page import="java.util.ArrayList"%>
<%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>
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
  <!-- add hotel details page -->
<div id="addHotelsPage">

    <p class="hotelDetails">Hotel details</p>
    <hr class="hotelHeadHorizontalLine">
    
    <form action="<%=request.getContextPath()%>/MainServlet" id="addHotelDetailsForm" class="addHotelDetailsForm"
         method="post">
        <div class="hotelNameDiv hotelDetailDiv">
            <label for="hotelName">Hotel Name</label> 
            <input type="text"  name="hotelName" class=" hotelValue" id="hotelName"  placeholder="Enter your hotel name here...">
        </div>
               
        <div class=" countryDropDown hotelDetailDIv">
            Country <br>
           <select name="countryDropDown" id="countryDropDown" onchange="getStates(this.value)">
             <option value="">Select country</option>
                        <% HotelHelper hp = new HotelHelper();
                        ArrayList countryList = (ArrayList) hp.getCountry();
                        for (int i = 0; i < countryList.size(); i++) {
                        System.out.println("country list in loop"+countryList.get(i));
                        %>   
                            <option value="<%=countryList.get(i)%>" id="<%=countryList.get(i)%>"
                                ><%=countryList.get(i)%></option>            
                        <% } %>        
           </select>
        </div>
        
        <div class=" stateDropDown hotelDetailDIv">
            State <br>
           <select name="stateDropDown" id="stateDropDown" onchange="getCities(this.value)">  </select>
        </div>
        
          <div class=" cityDropDown hotelDetailDIv">
            City <br>
           <select name="cityDropDown" id="cityDropDown"> </select>
        </div>
        
        <div class=" starDropDown hotelDetailDIv">
            Stars <br>
           <select name="starDropDown" id="starDropDown">
            <option value="1">1</option>      
            <option value="2">2</option>    
             <option value="3">3</option>  
             <option value="4">4</option> 
             <option value="5">5</option>    
           </select>
        </div>
        
        <div class="hotelAmenitiesDiv hotelDetailDiv">
            <label for="hotelAmenities">Amenities</label> 
            <input type="text"  name="hotelAmenities" class=" hotelAmenities" id="hotelAmenities"  placeholder="Enter your hotel amenities here...">
        </div>
          <div class="hotelImagesDiv hotelDetailDiv">
            <label for="hotelImages">Image</label> 
            <input type="file"   name="hotelImages" class=" hotelImages" id="hotelImage"  multiple placeholder="Enter your hotel imagess here...">
        </div>
				<input type="hidden" value="addHotel" name="requestType">

 								<p id="invalidHotelDetails" class="errorMessage">Please fill all the details</p>
        <button type="button" id="addRoomsButton" class="addRoomsButton"   onclick="validateHotel()">Next</button>
        <button type="reset" id="resetButton" onclick="">RESET</button>
        <a href="<%= request.getContextPath()%>"  class="cancelButton"onclick="">Cancel</a>
    </form>

</div>
<!----------hotel details page Closed---------->


</div>

</body>
<script>
$("#headBanner").hide();
$(".myTrips").hide();
$(".loginOrCreate").hide();
$(".userName").show();
$(".part1").hide();
$(".part2").hide();
document.getElementById("logoAnchor").href="<%= request.getContextPath()%>"


this.validateHotel=validateHotel
function validateHotel() {
	  if ($("#hotelName").val() == ""||$("#hotelName").val() == null) 
	  {
		  $("#invalidHotelDetails").text("Hotel name canot be empty");
	    $("#invalidHotelDetails").show();
	  } 
	  else if ($("#countryDropDown").val() == "")
	  {		  
		  $("#invalidHotelDetails").text("Select a country");
	    $("#invalidHotelDetails").show();
	  } 
	  else if ($("#stateDropDown").val() == "")
	  {
		  $("#invalidHotelDetails").text("Select a state");		  
	    $("#invalidHotelDetails").show();
	  }
	  else if ($("#cityDropDown").val() == "") 
	  {
		  $("#invalidHotelDetails").text("Select a city");		  		  
	    $("#invalidHotelDetails").show();
	  } 
	  else if ($("#starDropDown").val() == "") 
	  {
		  $("#invalidHotelDetails").text("Select hotel star");		  		  
	    $("#invalidHotelDetails").show();
	  }
	  else if ($("#hotelAmenities").val() == ""||$("#hotelAmenities").val() == null)
	  {
		  $("#invalidHotelDetails").text("Enter some room amenities");		  		  
	    $("#invalidHotelDetails").show();
	  }
	  else
	  {
	    $("#invalidHotelDetails").hide();
	    $("#addHotelDetailsForm").submit();
	  }
	}


    function getStates(country) {
    var country = country;
    var url = "<%= request.getContextPath()%>/ajax/AjaxController.jsp";
    $.post(url, {
        checkType: "getStates",
        country: country
    }, function(data) {
        if (data != null) {
            var obj = JSON.parse(data);
            var stateDropDown = $("#stateDropDown");
            stateDropDown.empty();
            var option = $("<option>").val("").text("Select State");
            stateDropDown.append(option);
            
            for (var i = 0; i < obj.length; i++) {
                var State = obj[i];
                option = $("<option>").val(State).text(State);
                stateDropDown.append(option);
            }

        }
    });
}
function getCities(state) {
    var state = state;
    var url = "<%= request.getContextPath()%>/ajax/AjaxController.jsp";
    $.post(url, {
        checkType: "getCities",
        state: state
    }, function(data) {
        if (data != null) {
            var obj = JSON.parse(data);
            var cityDropDown = $("#cityDropDown");
            cityDropDown.empty();
            var option = $("<option>").val("").text("Select City");
            cityDropDown.append(option);
            
            for (var i = 0; i < obj.length; i++) {
                var city = obj[i];
                option = $("<option>").val(city).text(city);
                cityDropDown.append(option);
            }

        }
    });
}


</script>
</html>