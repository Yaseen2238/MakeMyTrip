package com.naaptol.makeMyTrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.naaptol.makeMyTrip.beans.HotelBean;
import com.naaptol.makeMyTrip.beans.RoomBean;
import com.naaptol.makeMyTrip.utils.MyDbConnection;

public class GetDetailsQueries {

	public List getHotelDetails(){
		Connection con = null;
		con = MyDbConnection.openConnection();
		String sql = "SELECT hotel_details.*, address.country_name, address.state_name, address.city_name FROM hotel_details JOIN address ON hotel_details.address_id = address.address_id WHERE hotel_details.is_active='y' and hotel_id is not NULL";



		String priceQuery="SELECT MIN(price_per_night) AS lowest"
				+ "_price FROM rooms WHERE is_active='y' and hotel_id = ?";
				
		ResultSet rs=null;
		ResultSet rs2=null;
		
		try
		{
			PreparedStatement pst=con.prepareStatement(priceQuery);
			PreparedStatement ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList list=new ArrayList();
			while(rs.next())
			{
				HotelBean hotelBean=new HotelBean();
				
				hotelBean.setHotelname(rs.getString("hotel_name"));
				hotelBean.setState(rs.getString("state_name"));
				hotelBean.setCountry(rs.getString("country_name"));
				hotelBean.setCity(rs.getString("city_name"));
				hotelBean.setHotelStar(rs.getString("hotel_star"));
				hotelBean.setHotelAmenities(rs.getString("amenities"));
				hotelBean.setImage(rs.getString("images"));
				hotelBean.setHotel_id(rs.getInt("hotel_id"));
				pst.setString(1, rs.getString("hotel_id"));
				rs2=pst.executeQuery();
				rs2.next();
				hotelBean.setMinPrice(rs2.getString("lowest_price"));
				System.out.println("min price in loop"+rs2.getString("lowest_price"));
				list.add(hotelBean);
			}
//			System.out.println("list in getdetails"+list);
			return list;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after fetching hotel details");
		}
		return null;
		
	}
	
//get room details
	public List getDetails(int hotel_id)
	{
		Connection con = null;
		con = MyDbConnection.openConnection();
		String sql = "SELECT hotel_name FROM hotel_details WHERE is_active='y' and hotel_id ="+hotel_id;
		String roomDetails="Select * from rooms where is_active='y' and hotel_id="+hotel_id;
		ResultSet rs=null;
		ResultSet rs2=null;
		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			PreparedStatement pst=con.prepareStatement(roomDetails);
			rs=ps.executeQuery();
			rs2=pst.executeQuery();
			
			rs.next();
			
			String hotelName=rs.getString("hotel_name");
			ArrayList list=new ArrayList();
			while(rs2.next())
			{
				RoomBean roomBean=new RoomBean();
				roomBean.setHotel_name(hotelName);			
				roomBean.setRoomType(rs2.getString("room_type"));
				roomBean.setRoomPrice(rs2.getInt("price_per_night"));
				roomBean.setRoomDescription(rs2.getString("description"));
				roomBean.setHotelId(rs2.getInt("hotel_id"));
				roomBean.setRoomId(rs2.getInt("room_id"));

				System.out.println("hotel name in query"+rs.getString("hotel_name"));
				System.out.println("room type in query"+rs2.getString("room_type"));
				list.add(roomBean);
			}
			return list;
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
