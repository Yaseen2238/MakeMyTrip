<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Delete Hotel/Room</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/css/style.css">
</head>
<body>
    <div class="wrapper">
        <%@page import="com.naaptol.makeMyTrip.beans.RoomBean"%>
        <%@page import="com.naaptol.makeMyTrip.beans.HotelBean"%>
        <%@page import="java.util.ArrayList"%>
        <%@page import="com.naaptol.makeMyTrip.helper.HotelHelper"%>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
            pageEncoding="ISO-8859-1"%>
        
        <jsp:include page="component/header.jsp"/>	
        
        <div id="deleteHotel">
            <p class="hotelDetails">Delete Hotel</p>
            <hr class="hotelHeadHorizontalLine">
            <form action="<%=request.getContextPath()%>/MainServlet" id="deleteHotelForm" class="deleteHotelForm" method="post">
                <div class="hotelNamesDropDownDiv hotelDetailDIv">
                    Hotel <br>
                    <select name="hotelNamesDropDown" id="hotelNamesDropDown" onchange="getRoomTypes(this.value)">
                        <option value="">Select Hotel</option>
                        <% HotelHelper hp = new HotelHelper();
                        ArrayList hotelList = (ArrayList) hp.getHotelDetails();
                        for (int i = 0; i < hotelList.size(); i++) {
                            HotelBean hotelBean = (HotelBean) hotelList.get(i);
                        %>   
                            <option value="<%=hotelBean.getHotel_id()%>" id="<%=hotelBean.getHotel_id()%>"
                                ><%=hotelBean.getHotelname()%></option>            
                        <% } %>
                    </select>
                         <p id="invalidHotel" class="hotelErrorMessage"></p>
                    
                </div>
                <input type="hidden" value="deleteHotel" name="requestType">
                
                <div class="roomTypesDropDownDiv hotelDetailDIv">
                    Rooms <br>
                    <select name="roomTypesDropDown" id="roomTypesDropDown">
                        <option value="">Select Room</option>        
                    </select>
                                <p id="invalidRoom" class="roomErrorMessage"></p>
                    
                </div>
                        <button type="button" id="deleteRoomsButton" class="deleteRoomsButton addRoomsButton"  onclick="validateDeleteForm()"  >Delete</button>
                        <a href="<%= request.getContextPath()%>"  class="cancelButton"onclick="">Cancel</a>
                
            </form>
        </div>

        <script>
           
                $("#headBanner").hide();
                $(".myTrips").hide();
                $(".loginOrCreate").hide();
                $(".userName").show();
                $(".part1").hide();
                $(".part2").hide();
                document.getElementById("logoAnchor").href="<%= request.getContextPath()%>"


            function getRoomTypes(value) {
                var hotelId = value;
                var url = "<%= request.getContextPath()%>/ajax/AjaxController.jsp";
                $.post(url, {
                    checkType: "getRooms",
                    hotel_id: hotelId
                }, function(data) {
                    if (data != null) {
                        var obj = JSON.parse(data);
                        var roomTypesDropdown = $("#roomTypesDropDown");
                        roomTypesDropdown.empty();
                        var option = $("<option>").val("").text("Select Room");
                        roomTypesDropdown.append(option);
                        
                        for (var i = 0; i < obj.length; i++) {
                            var roomType = obj[i];
                            option = $("<option>").val(roomType).text(roomType);
                            roomTypesDropdown.append(option);
                        }
                        
                        option = $("<option>").val("All").text("All Rooms");
                        roomTypesDropdown.append(option);
                    }
                });
            }
        </script>
    </div>
</body>
</html>
