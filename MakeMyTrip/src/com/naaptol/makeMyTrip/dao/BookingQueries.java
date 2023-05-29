package com.naaptol.makeMyTrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import com.mysql.jdbc.Statement;
import com.naaptol.makeMyTrip.beans.GuestBean;
import com.naaptol.makeMyTrip.beans.HotelBookingBean;
import com.naaptol.makeMyTrip.utils.MyDbConnection;

public class BookingQueries {

	public List bookHotel(List beanList)	{
		Connection con = null;
		ResultSet rs=null;
		con = MyDbConnection.openConnection();
		int hotelId=0;
		int roomId=(int) beanList.get(0);
		int userId=(int) beanList.get(1);
		int bookingId=0;
		ArrayList al=new ArrayList();
		String getHotelId="select hotel_id from rooms where is_active='y' and room_id="+roomId;
		
		String hotelBooking = "INSERT INTO hotel_booking (user_id, hotel_id,number_of_guests,check_in_date,check_out_date,is_active) "
				+ "values(?,?,?,?,?,?)" ;
		String Guest = "INSERT INTO guest_details  (user_id,guest_name,guest_email,guest_age,is_active) VALUES(?,?,?,?,?) ";
		String bookingDetails="INSERT INTO hotel_booking_details(booking_id,room_id,is_active)"
				+ "values(?,?,?)";
		try
		{
			//to get hotel id
			PreparedStatement gh=con.prepareStatement(getHotelId);
			rs=gh.executeQuery();
			if(rs.next())
				hotelId=rs.getInt(1);
			//to insert values in hotel booking table
			HotelBookingBean hotelBookingBean=(HotelBookingBean) beanList.get(2);
			hotelBookingBean.setHotel_id(hotelId);
			
			PreparedStatement hb=con.prepareStatement(hotelBooking,Statement.RETURN_GENERATED_KEYS);
			hb.setInt(1,userId);		
			hb.setInt(2, hotelId);
			hb.setInt(3, hotelBookingBean.getNumberOfGuests());
			
			//casting from string to date
			String checkInDate = hotelBookingBean.getCheckInDate();
			String checkOutDate=hotelBookingBean.getCheckOutDate();
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			System.out.println("check in date in queries"+checkInDate);
			System.out.println("check out date in queries"+checkOutDate);

              java.sql.Date sqlCheckInDate = java.sql.Date.valueOf(checkInDate);
                java.sql.Date sqlCheckOutDate = java.sql.Date.valueOf(checkOutDate);

              hb.setDate(4, sqlCheckInDate);
              hb.setDate(5, sqlCheckOutDate);
			hb.setString(6, "y");
			boolean flag=true;
			boolean flag2=true;
			 flag=hb.execute();
			 
			if(flag!=true)//since execute()returns false when successfull
			{
				ResultSet generatedKeys = hb.getGeneratedKeys();
            if (generatedKeys.next()) 
            {
                bookingId = generatedKeys.getInt(1);
            }
				PreparedStatement gs=con.prepareStatement(Guest);
				
				for(int i=1;i<=hotelBookingBean.getNumberOfGuests();i++){
					GuestBean gb=(GuestBean) beanList.get(i+2);

				gs.setInt(1, userId);
				gs.setString(2,gb.getGuestName() );
				gs.setString(3, gb.getGuestEmail());
				gs.setInt(4, gb.getGuestAge());
				gs.setString(5, "y");
				flag2=gs.execute();
				}
			}
			if(flag!=true&&flag2!=true)
			{
				PreparedStatement bd=con.prepareStatement(bookingDetails);
				bd.setInt(1,bookingId);
				bd.setInt(2, roomId);
				bd.setString(3, "y");
				bd.execute();
//				return true;
				
				//update for fetching current booking details and user's all boking details
				BookingDetailsDao bookingDetailsDao=new BookingDetailsDao();
				return bookingDetailsDao.getHotelsBookingDetails(userId,bookingId);
			}
			return null;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after inserting booking details and guests");
		}
		return null;
	}
}
