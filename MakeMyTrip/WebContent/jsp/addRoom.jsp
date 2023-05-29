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

<!-- -add Room details -->
<div id="addRoomsPage" style="display: block">

<div id="addRoomTopContent"> 
    <p class="roomDetails " >Room details</p>
    <hr class="hotelHeadHorizontalLine">
    </div>
    
    <form action="<%=request.getContextPath()%>/MainServlet" id="addRoomForm" class="addRoomForm"
         method="post">          
        <div class=" roomTypeDropDown hotelDetailDIv">
            Room Type <br>
           <select name="roomTypeDropDown" id="roomTypeDropDown">
            <option value="" selected>Select a room type</option>
            <option value="singleBedAc">Single bed Ac</option>
            <option value="singleBedNonAc">Single bed Non Ac</option> 
            <option value="DoubleBedAc">Double bed  Ac</option>
            <option value="DoubleBedNonAc">Double bed  Non Ac</option> 
            <option value="familyRoom">Family Room</option> 
            <option value="guest Room">guest Room</option>                
           </select>
        </div>
        
         <div class="roomPriceDIv hotelDetailDiv">
            <label for="roomPrice">Price per night</label> 
            <input type="text"  name="roomPrice" class=" roomPrice" id="roomPrice"  placeholder="Enter price per night for this room here...">
        </div>
  
        <div class="descriptionDiv hotelDetailDiv">
            <label for="roomDescription">Description</label> 
            <input type="text"  name="roomDescription" class=" roomDescription" id="roomDescription"  placeholder="Enter description here...">
        </div>
				<input type="hidden" value="addRoom" name="requestType">
 								<p id="invalidRoomDetails" class="errorMessage">Please fill all the details</p>				

        <button type="button" id="addButton " class="addRoomsButton roomButton "  onclick=" validateRoom()" >Add</button>
        <button type="reset" id="resetButton"  class="roomButtonon" click="">RESET</button>
 
    </form>
         <button type="button" id="addMoreButton " class="addMoreRoomsButton  roomButton"  onclick=" addMoreRooms()" >+Add More</button>
         <a href="AdminPage.jsp" id="backHome " class="backHome  roomButton"   > Back to Home</a>
<div class="clr"></div>
</div>


</div>

</body>
<script>

$("#headBanner").hide();
$(".myTrips").hide();
$(".loginOrCreate").hide();
$(".userName").show();
$(".part1").hide();
$(".part2").hide();
this.addRoom=addRoom;
function addRoom(){
}

function validateRoom(){
	if($("#roomTypeDropDown").val()==""){
		$("#invalidRoomDetails").text("Please select a room type");
		$("#invalidRoomDetails").show();
		
	}
	else if($("#roomPrice").val()==""||$("#roomPrice").val()==null){
		$("#invalidRoomDetails").show();
		$("#invalidRoomDetails").text("Please enter the room price");

	}
	else if($("#roomDescription").val()==""||$("#roomDescription").val()==null)
		{
		$("#invalidRoomDetails").text("Please enter some room description");
		$("#invalidRoomDetails").show();
		}
	else{
		$("#invalidRoomDetails").hide();
	$("#addRoomForm").submit();
	$("#addHotelDetailsForm").hide();
	$("#addMoreButton").show();
	}
}
this.addMoreRooms=addMoreRooms;
function addMoreRooms(){
	$("#addRoomForm").reset();
	$(".roomButton").hide();
	$(".hotelDetailDIv").show();
	$("#addRoomTopContent").show();
	$(".addRoomsButton").show();
	$("#resetButton").show();
		$("#addRoomForm").show()
		document.getElementById("logoAnchor").href="<%= request.getContextPath()%>/jsp/AdminPage.jsp"
}

</script>
</html>