package com.naaptol.makeMyTrip.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.naaptol.makeMyTrip.beans.GuestBean;
import com.naaptol.makeMyTrip.beans.HotelBean;
import com.naaptol.makeMyTrip.beans.HotelBookingBean;
import com.naaptol.makeMyTrip.beans.RoomBean;
import com.naaptol.makeMyTrip.beans.UserBean;
import com.naaptol.makeMyTrip.helper.HotelHelper;
import com.naaptol.makeMyTrip.helper.LoginHelper;
import com.naaptol.makeMyTrip.helper.RegisterHelper;
import com.sun.mail.iap.Response;

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String requestType=request.getParameter("requestType");
		System.out.println("request type when add rooms"+requestType);
		String hotelName = null,country=null,state=null,city=null,hotelStar=null,
				hotelAmenities=null,hotelImages=null;
		HotelBean hotelBean= new HotelBean();
		 Map<String,Object> hotelMap=new HashMap<String,Object>();
		
		try 
		{
			if (requestType.equals("login")) 
			{
			    String email = request.getParameter("loginEmail");
			    String password = request.getParameter("loginPassword");
			    LoginHelper db = new LoginHelper();
			    String username;
			    String fName = null;
			    System.out.println("request type in servlet" + requestType);
			    System.out.println("email and pass when typed" + email);
			    System.out.println(email + "" + password);
			    String arr[] = new String[3];
			    arr = db.checkdata(email, password);

			    if (arr != null) 
			    {
			        if (arr[0] != null) 
			        {
			            fName = arr[0];
			            int userId = Integer.parseInt(arr[2]);
			      
			            HttpSession session = request.getSession();
			            session.setAttribute("uname", fName);
			            session.setAttribute("userId", userId);
			            session.setAttribute("userType", arr[1]);
			            
				        response.addHeader("Pragma", "no-cache");
				        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
				        response.setDateHeader("Expires", 0);
			            
			            String referringPage = request.getHeader("referer");
			            System.out.println("user name when login" + fName);

			            if (referringPage != null && !referringPage.isEmpty()) 
			            {   
//			            	RequestDispatcher rd1=request.getRequestDispatcher(referringPage);
//			            	rd1.forward(request, response);
			                response.sendRedirect(referringPage);
			            } 
			            else 
			            {    
			            	RequestDispatcher rd=request.getRequestDispatcher("jsp/index.jsp");
					            	rd.forward(request, response);
//			                response.sendRedirect("jsp/index.jsp");
			            }
			        }
			    } 
			    else 
			    {
			        response.getWriter().print("Enter correct credentials");
			    }
			}

			else if(requestType.equals("logout"))
			{
				System.out.println("destroy session called");
				HttpSession session=request.getSession();
				session.invalidate();
				System.out.println("This is Context Path "+  request.getContextPath());
//				RequestDispatcher req=request.getRequestDispatcher("jsp/index.jsp");
//				req.forward(request, response);	
				response.sendRedirect("jsp/index.jsp");
			}
			else if(requestType.equals("register"))
{
	       String userType=request.getParameter("userType");	
			String fname=request.getParameter("fname");	
			String lname=request.getParameter("lname");
			String phoneNumber=request.getParameter("phoneNumber");
			String email=request.getParameter("email");
      		String password=request.getParameter("password");			
	
			Map<String,Object> map=new HashMap<String,Object>();
			map.put("fname", fname);
			map.put("lname", lname);
			map.put("phoneNumber", phoneNumber);
			map.put("email", email);
		    map.put("userType", userType);
			map.put("password", password);
			
//			UserBean usb=new UserBean();
//			usb.setEmail(email);
//			usb.setFname(fname);
//			usb.setLname(lname);
//			usb.setPassword(password);
//			usb.setPhoneNumber(phoneNumber);
//			usb.setUserType(userType);
			
	     RegisterHelper db=new RegisterHelper();
	     System.out.println(fname);
			boolean flag=db.insertData(map);
			if(flag==false)
			{
			response.getWriter().print("Registration successfull");
			}
			else{
				response.getWriter().print("Registration Unsuccessfull");
			       }
		
		}
 else if(requestType.equals("addHotel"))
 {
	 
      hotelName=request.getParameter("hotelName");	
      country=request.getParameter("countryDropDown");
      state=request.getParameter("stateDropDown");	
      city=request.getParameter("cityDropDown");	
      hotelStar=request.getParameter("starDropDown");	
      hotelAmenities=request.getParameter("hotelAmenities");	
      hotelImages=request.getParameter("hotelImages");
     System.out.println(hotelName);
     System.out.println(country);
     System.out.println(state);
     System.out.println(city);
     System.out.println(hotelStar);
     System.out.println(hotelAmenities);
     if(hotelName!=null&&hotelName!=""&&country!=null&&state!=null&&city!=null&&
    		 hotelStar!=null&&hotelAmenities!=null&&hotelAmenities!="")
     {
    	 System.out.println("in add hotel");
    	 
//	     hotelBean.setHotelname(hotelName);
//	     hotelBean.setCountry(country);
//	     hotelBean.setState(state);
//	     hotelBean.setCity(city);
//	     hotelBean.setHotelStar(hotelStar);
//	     hotelBean.setHotelAmenities(hotelAmenities);
//	     System.out.println("bean befor set"+hotelBean);
//	     System.out.println("beans values before set"+hotelBean.getCity());
//		 	RequestDispatcher rd=request.getRequestDispatcher("jsp/addRoom.jsp");
//			rd.forward(request, response);
    	 response.sendRedirect("jsp/addRoom.jsp");
 	
			hotelMap.put("hotelName", hotelName);
			hotelMap.put("country", country);
			hotelMap.put("state", state);
			hotelMap.put("city", city);
			hotelMap.put("hotelStar", hotelStar);
			hotelMap.put("hotelAmenities", hotelAmenities);
			hotelMap.put("hotelImages", hotelImages);

		     System.out.println("hotel city in city"+hotelMap.get("city"));
		     
//		     HttpSession session = request.getSession();
//		     session.setAttribute("hotelMap", hotelMap);
		     HotelHelper hp= new HotelHelper();
		    hp .insertHotel(hotelMap);     
	     
		   
//		     request.setAttribute("map", hotelMap);


     }

 }
else if(requestType.equals("addRoom"))
{
	     HotelHelper hp= new HotelHelper();
	String roomType=request.getParameter("roomTypeDropDown");
	
	     int roomPrice=Integer.parseInt(request.getParameter("roomPrice"));
	     String roomDescription =request.getParameter("roomDescription");

	     System.out.println("room type in servlet"+roomType);
	     System.out.println("room price in servlet"+roomPrice);
	     
	     RoomBean roomBean= new RoomBean();
	     roomBean.setRoomType(roomType);
	     
	     roomBean.setRoomPrice(roomPrice);
	     roomBean.setRoomDescription(roomDescription);
	     hp.insertRoom(roomBean);

 }
			
			
else if(requestType.equals("deleteHotel")){
	int hotelId=Integer.parseInt(request.getParameter("hotelNamesDropDown"));
	String room=request.getParameter("roomTypesDropDown");
HotelHelper hp=new HotelHelper();
int result=hp.deleteHotel(hotelId, room);
if(result==1){
	response.getWriter().print("1 room successfully deleted");
}
else if(result>1){
	response.getWriter().print("1 hotel successfully deleted");

}
else{
	response.getWriter().print("can't delete hotel");

}
	
}
			
else if(requestType.equals("hotelBooking"))
{
	ArrayList beanList=new ArrayList();

	int roomId=Integer.parseInt(request.getParameter("roomId"));
	int userId=Integer.parseInt(request.getParameter("userId"));
	beanList.add(roomId);
	beanList.add(userId);
	HotelBookingBean hotelBookBean=new HotelBookingBean();
	hotelBookBean.setUser_id(userId);
	
	hotelBookBean.setNumberOfGuests(Integer.parseInt(request.getParameter("numOfGuests")));
	hotelBookBean.setCheckInDate(String.valueOf(request.getParameter("checkInDate")));
	System.out.println("check in date in servlet"+request.getParameter("checkInDate"));
	System.out.println("check in date in servlet 2"+hotelBookBean.getCheckInDate());

	hotelBookBean.setCheckOutDate(request.getParameter("checkOutDate"));
	beanList.add(hotelBookBean);
	//loop for setting values to as many guest as guest numbers
	for(int i=1;i<=hotelBookBean.getNumberOfGuests();i++){
	GuestBean gb=new GuestBean();
	gb.setUserId(userId);
	gb.setGuestName(request.getParameter("guestName"+i));
	gb.setGuestEmail(request.getParameter("guestEmail"+i));
	gb.setGuestAge(Integer.parseInt(request.getParameter("guestAge"+i)));
	beanList.add(gb);

	}
	
	System.out.println("room id after hotel booking"+request.getParameter("roomId"));
	HotelHelper hp= new HotelHelper();
	ArrayList bookingList=(ArrayList) hp.bookHotel(beanList);
    HttpSession session = request.getSession();
    session.setAttribute("userId", userId);
    request.setAttribute("roomId", roomId);
    session.setAttribute("bookingList", bookingList);
    if(bookingList!=null)
    {
    	RequestDispatcher rd=request.getRequestDispatcher("jsp/MyTrips.jsp");
    	rd.forward(request, response);
//		response.sendRedirect("jsp/MyTrips.jsp");
//		response.getWriter().print("hotel book successfully");
    	
		System.out.println("hotel successfully booked");
	}
	else
	{
		response.getWriter().print("something went wrong, can't book hotel");
		System.out.println("cannot book hotel");
	}	
}
		}
		catch (Exception e)
		{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	}
}
