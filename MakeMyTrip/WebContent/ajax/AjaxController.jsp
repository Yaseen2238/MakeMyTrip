<%@page import="com.google.gson.Gson"%>
<%@page import="com.naaptol.makeMyTrip.beans.RoomBean"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.naaptol.makeMyTrip.helper.*" %>
<%! private static String checkAvailibilty(HttpServletRequest req, HttpServletResponse res)
{
	String checkType=req.getParameter("checkType");
	System.out.println("in ajax"+checkType);
	
	
	if(checkType.equals("getRooms")){
		int hotelId=Integer.parseInt(req.getParameter("hotel_id"));
		HotelHelper hp=new HotelHelper();
        ArrayList roomList=(ArrayList)hp.getRoomDetails(hotelId);
	//if( RegisterHelper.checkNumber(number))
		ArrayList typeList =new ArrayList();
	for(int i=0;i<=roomList.size()-1;i++){
		RoomBean roomBean=(RoomBean)roomList.get(i);
		typeList.add(roomBean.getRoomType());
	}
	Gson gson = new Gson();
    String json = gson.toJson(typeList);
	return json;
	}
	
	else if(checkType.equals("getStates")){
		String country=req.getParameter("country");
		HotelHelper hp=new HotelHelper();
        ArrayList stateList=(ArrayList)hp.getStates(country);
        System.out.println("state list in ajax"+stateList);

	Gson gson = new Gson();
    String json = gson.toJson(stateList);
	return json;
	}
	
	else if(checkType.equals("getCities")){
		String state=req.getParameter("state");
		HotelHelper hp=new HotelHelper();
        ArrayList cityList=(ArrayList)hp.getCities(state);
        System.out.println("city list in ajax"+cityList);

	Gson gson = new Gson();
    String json = gson.toJson(cityList);
	return json;
	}
	
return null;
}

%>
<%=checkAvailibilty(request, response)%>