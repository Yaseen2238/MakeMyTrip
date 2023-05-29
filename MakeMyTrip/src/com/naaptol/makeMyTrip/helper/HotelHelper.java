package com.naaptol.makeMyTrip.helper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.naaptol.makeMyTrip.beans.HotelBean;
import com.naaptol.makeMyTrip.beans.RoomBean;
import com.naaptol.makeMyTrip.dao.BookingDetailsDao;
import com.naaptol.makeMyTrip.dao.BookingQueries;
import com.naaptol.makeMyTrip.dao.DbQueries;
import com.naaptol.makeMyTrip.dao.DeleteDao;
import com.naaptol.makeMyTrip.dao.GetAddress;
import com.naaptol.makeMyTrip.dao.GetDetailsQueries;

public class HotelHelper {
public int insertHotel(Map hotelMap)
{
	 boolean flag = true;
     try 
     {
DbQueries dq= new DbQueries();
System.out.println("city in helper"+hotelMap.get("city"));

         return dq.insertHotel(hotelMap);

     } 
     catch (Exception e) 
     {
         // TODO Auto-generated catch block
         e.printStackTrace();

     }

     return 0;
}
public int insertRoom(RoomBean roomBean)
{
	 boolean flag = true;
    try 
    {
DbQueries dq= new DbQueries();

        return dq.insertRoom(roomBean);

    } 
    catch (Exception e) 
    {
        // TODO Auto-generated catch block
        e.printStackTrace();

    }

    return 0;
}

public List getHotelDetails()
{
	GetDetailsQueries gd=new GetDetailsQueries();

	return gd.getHotelDetails();
}


public List getRoomDetails( int hotel_id)
{
	GetDetailsQueries gd=new GetDetailsQueries();

	return gd.getDetails(hotel_id);
}

public List bookHotel(List beanList)
{
	BookingQueries bq= new BookingQueries();
//	int bookingId=bq.bookHotel(beanList);
////	userBookingHistory(bookingId);
//	return bookingId;
	return bq.bookHotel(beanList);
	 	
}
public List userBookingHistory(int userId){
	BookingDetailsDao bookingDao = new BookingDetailsDao();
	BookingDetailsDao bd=new BookingDetailsDao();
	return bd.getHotelsBookingDetails(userId);
}
public int deleteHotel(int hotelId, String room){
	int result=0;
DeleteDao dd=new DeleteDao();
	 result=dd.deleteHotel(hotelId, room);
	 System.out.println("result in delete query"+result);

	return result;
}

public List getCountry(){
	GetAddress ga=new GetAddress();
	
	return ga.getCountry();
}
public List getStates(String country){
	GetAddress ga=new GetAddress();
	
	return ga.getStates(country);
}
public List getCities(String state){
	GetAddress ga=new GetAddress();
	
	return ga.getCities(state);
}

public List getLocation(){
	
	ArrayList list= new ArrayList();
	return null;
}

}
