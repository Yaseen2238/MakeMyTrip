package com.naaptol.makeMyTrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.naaptol.makeMyTrip.beans.BookingDetailsBean;
import com.naaptol.makeMyTrip.beans.RoomBean;
import com.naaptol.makeMyTrip.utils.MyDbConnection;

public class BookingDetailsDao {
	
	public List getHotelsBookingDetails(int userId,int bookingId){
		
		Connection con = null;
		con = MyDbConnection.openConnection();
		ArrayList bookingDetailList=new ArrayList();
		String  queryOne=	"SELECT hotel_booking.*,hotel_booking_details.room_id,rooms.room_type,rooms.price_per_night,hotel_details.hotel_name,"
				+"address.city_name,address.state_name "
				+"FROM hotel_booking "
				+"INNER JOIN hotel_booking_details ON hotel_booking.booking_id=hotel_booking_details.booking_id "
			+"INNER JOIN rooms ON hotel_booking_details.room_id=rooms.room_id "
				+"INNER JOIN hotel_details ON rooms.hotel_id=hotel_details.hotel_id "
				+"INNER JOIN address ON hotel_details.address_id=address.address_id "
				+"WHERE hotel_booking.booking_id="+bookingId;
		
		String  queryTwo=	"SELECT hotel_booking.*,hotel_booking_details.room_id,rooms.room_type,rooms.price_per_night,hotel_details.hotel_name,"
				+"address.city_name,address.state_name "
				+"FROM hotel_booking "
				+"INNER JOIN hotel_booking_details ON hotel_booking.booking_id=hotel_booking_details.booking_id "
			+"INNER JOIN rooms ON hotel_booking_details.room_id=rooms.room_id "
				+"INNER JOIN hotel_details ON rooms.hotel_id=hotel_details.hotel_id "
				+"INNER JOIN address ON hotel_details.address_id=address.address_id "
				+"WHERE hotel_booking.user_id="+userId;
		

		ResultSet rs=null;
		ResultSet rs2=null;
		try
		{
			PreparedStatement ps = con.prepareStatement(queryOne);
			rs=ps.executeQuery();
			rs.next();
		BookingDetailsBean bookingDetailsBean=new BookingDetailsBean();
		bookingDetailsBean.setBookingId(rs.getInt("booking_id"));
		bookingDetailsBean.setUserId(rs.getInt("user_id"));
		bookingDetailsBean.setNumberOfGuest(rs.getInt("number_of_guests"));
		bookingDetailsBean.setPricePerNight(rs.getInt("price_per_night"));
		bookingDetailsBean.setRoomId(rs.getInt("room_id"));
		bookingDetailsBean.setCheckIn(rs.getString("check_in_date"));
		bookingDetailsBean.setCheckOut(rs.getString("check_out_date"));
		bookingDetailsBean.setRoomType(rs.getString("room_type"));
		bookingDetailsBean.setHotelName(rs.getString("hotel_name"));
		bookingDetailsBean.setCity(rs.getString("city_name"));
		bookingDetailsBean.setState(rs.getString("state_name"));
		bookingDetailList.add(bookingDetailsBean);		 

		PreparedStatement ps2= con.prepareStatement(queryTwo);
		rs2=ps2.executeQuery();
	
		

			ArrayList userBookingHistory=new ArrayList();
			while(rs2.next())
			{
				BookingDetailsBean userHistory=new BookingDetailsBean();
				userHistory.setBookingId(rs2.getInt("booking_id"));
				userHistory.setUserId(rs2.getInt("user_id"));
				userHistory.setNumberOfGuest(rs2.getInt("number_of_guests"));
				userHistory.setPricePerNight(rs2.getInt("price_per_night"));
				userHistory.setRoomId(rs2.getInt("room_id"));
				userHistory.setCheckIn(rs2.getString("check_in_date"));
				userHistory.setCheckOut(rs2.getString("check_out_date"));
				userHistory.setRoomType(rs2.getString("room_type"));
				userHistory.setHotelName(rs2.getString("hotel_name"));
				userHistory.setCity(rs2.getString("city_name"));
				userHistory.setState(rs2.getString("state_name"));

				System.out.println("booking id in user history query in query"+rs2.getInt("booking_id"));
				System.out.println("check in checkout dates in user history query in query"+rs2.getString("check_in_date")+rs2.getString("check_out_date"));
				userBookingHistory.add(userHistory);
			}
			bookingDetailList.add(userBookingHistory);
			
			return bookingDetailList;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after fetching room details");
		}
		return null;
		
	}
	
	public List getHotelsBookingDetails(int userId){
		
		Connection con = null;
		con = MyDbConnection.openConnection();
		ArrayList bookingDetailList=new ArrayList();

		
		String  query=	"SELECT hotel_booking.*,hotel_booking_details.room_id,rooms.room_type,rooms.price_per_night,hotel_details.hotel_name,"
				+"address.city_name,address.state_name "
				+"FROM hotel_booking "
				+"INNER JOIN hotel_booking_details ON hotel_booking.booking_id=hotel_booking_details.booking_id "
			+"INNER JOIN rooms ON hotel_booking_details.room_id=rooms.room_id "
				+"INNER JOIN hotel_details ON rooms.hotel_id=hotel_details.hotel_id "
				+"INNER JOIN address ON hotel_details.address_id=address.address_id "
				+"WHERE hotel_booking.is_active='y' and hotel_booking.user_id="+userId;
		

		ResultSet rs=null;

		try
		{
		PreparedStatement ps= con.prepareStatement(query);
		rs=ps.executeQuery();
			ArrayList userBookingHistory=new ArrayList();
			while(rs.next())
			{
				BookingDetailsBean userHistory=new BookingDetailsBean();
				userHistory.setBookingId(rs.getInt("booking_id"));
				userHistory.setUserId(rs.getInt("user_id"));
				userHistory.setNumberOfGuest(rs.getInt("number_of_guests"));
				userHistory.setPricePerNight(rs.getInt("price_per_night"));
				userHistory.setRoomId(rs.getInt("room_id"));
				userHistory.setCheckIn(rs.getString("check_in_date"));
				userHistory.setCheckOut(rs.getString("check_out_date"));
				userHistory.setRoomType(rs.getString("room_type"));
				userHistory.setHotelName(rs.getString("hotel_name"));
				userHistory.setCity(rs.getString("city_name"));
				userHistory.setState(rs.getString("state_name"));

				System.out.println("booking id in user history query in query by userId"+rs.getInt("booking_id"));
				System.out.println("check in checkout dates in user history query in query by userId"+rs.getString("check_in_date")+rs.getString("check_out_date"));
				userBookingHistory.add(userHistory);
			}
			bookingDetailList.add(userBookingHistory);
			
			return bookingDetailList;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after fetching room details");
		}
		return null;
		
	}

}
