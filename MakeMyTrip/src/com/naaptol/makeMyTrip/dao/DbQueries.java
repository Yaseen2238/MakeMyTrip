package com.naaptol.makeMyTrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.mysql.jdbc.Statement;
import com.naaptol.makeMyTrip.beans.HotelBean;
import com.naaptol.makeMyTrip.beans.RoomBean;
import com.naaptol.makeMyTrip.beans.UserBean;
import com.naaptol.makeMyTrip.utils.MyDbConnection;


public class DbQueries 
{
	public static boolean insertData(Map map)
	{
		Connection con = null;
		boolean flag = false;
		con = MyDbConnection.openConnection();
	
		String sql = "INSERT INTO user_details (user_type,fname,lname"
				+ ",phone_number,email,password,created_by,is_active) VALUES(?,?,?,?,?,?,?,?) ";
		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, (String) map.get("userType"));
			ps.setString(2, (String) map.get("fname"));
			ps.setString(3, (String) map.get("lname"));
			ps.setString(4, (String) map.get("phoneNumber"));
			ps.setString(5, (String) map.get("email"));
			ps.setString(6, (String) map.get("password"));
			ps.setString(7, (String) map.get("fname"));
			ps.setString(8, "y");
			 ps.execute();// since the execute method will return true if the method is executed successfully
			return true;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after Registeration");
		}
		return flag;
	}

	public static List loginCheck(String email, String password) 
	{
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		ArrayList<String> al = new ArrayList();
		con = MyDbConnection.openConnection();
		System.out.println("email in query "+email);
		String sql = "Select * from user_details where is_active='y' and email=?";
		try 
		{
			ps = con.prepareStatement(sql);	
    		ps.setString(1, email);
			rs = ps.executeQuery();
			rs.next();
	    if(rs!=null)
	    {
			al.add(rs.getString("fname"));
			al.add(rs.getString("email"));
			al.add(rs.getString("password"));
			al.add(rs.getString("user_type"));
			//edited after submitting
			al.add(rs.getString("user_id"));
			System.out.println(al);

			return al;
		} 
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after login");
		}
		return al;
	}


	

	// method for inserting hotel details
	public int insertHotel(Map hotelMap) 
	{
	    Connection con = null;
	    int flag = 0;
	    ResultSet rs = null;
	    con = MyDbConnection.openConnection();
	    String address = "SELECT address_id FROM address WHERE is_active='y' AND country_name=? AND state_name=? AND city_name=?";
	    String sql = null;
	    try 
	    {
	        PreparedStatement ad = con.prepareStatement(address);
	        ad.setString(1, (String) hotelMap.get("country"));
	        ad.setString(2, (String) hotelMap.get("state"));
	        ad.setString(3, (String) hotelMap.get("city"));
	        rs = ad.executeQuery();
	        System.out.println(hotelMap.get("city") + " city in queries");
	        rs.next();
	        int addressId = Integer.parseInt(rs.getString("address_id"));
	        System.out.println("address id is " + addressId);
	        PreparedStatement ps = con.prepareStatement("INSERT INTO hotel_details (hotel_name, address_id, hotel_star, amenities, images, is_active) VALUES (?, ?, ?, ?, ?, ?)",
	                Statement.RETURN_GENERATED_KEYS);

	        ps.setString(1, (String) hotelMap.get("hotelName"));
	        ps.setInt(2, addressId);
	        ps.setString(3, (String) hotelMap.get("hotelStar"));
	        ps.setString(4, (String) hotelMap.get("hotelAmenities"));
	        ps.setString(5, (String) hotelMap.get("hotelImages"));
	        ps.setString(6, "y");
	        int hd = 0;

	        if (!ps.execute()) 
	        {
	            ResultSet generatedKeys = ps.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                int hotelId = generatedKeys.getInt(1);  // Retrieve the generated hotel_id
	                HotelBean hb = new HotelBean();
	                hb.setHotel_id(hotelId);
	                hb.setHotelname((String) hotelMap.get("hotelName"));
	                hb.setCountry((String) hotelMap.get("country"));
	                hb.setState((String) hotelMap.get("state"));
	                hb.setCity((String) hotelMap.get("city"));
	                hb.setHotelStar((String) hotelMap.get("hotelStar"));
	                hb.setHotelAmenities((String) hotelMap.get("hotelAmenities"));
	                hb.setImage((String) hotelMap.get("hotelImages"));
	                hb.setMinPrice((String) hotelMap.get("minPrice"));
	                hd = hotelId;
	            }
	        }
	        System.out.println("Generated hotel id: " + hd);

	        return addressId;
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        MyDbConnection.closeConnection(con);
	        System.out.println("Connection closed after inserting hotel");
	    }
	    return 0;
	}

	

	// method for inserting Room details
	public  int insertRoom(RoomBean roomBean)
	{
		Connection con = null;
		int flag = 0;
		ResultSet rs=null;
		con = MyDbConnection.openConnection();
	String idQuery="SELECT hotel_id FROM hotel_details ORDER BY hotel_id DESC LIMIT 1;";
		String sql = "INSERT INTO rooms (hotel_id,room_type,price_per_night,description,is_active) VALUES(?,?,?,?,?) ";
		try
		{
			PreparedStatement hs= con.prepareStatement(idQuery);
			rs=hs.executeQuery();
			   rs.next();
           int hotelId=Integer.parseInt(rs.getString("hotel_id"));
        		hs.close();
			PreparedStatement ad=con.prepareStatement(sql);
			ad.setInt(1,hotelId );			
			ad.setString(2,roomBean.getRoomType());
	   System.out.println("room type in room query"+roomBean.getRoomType());
			ad.setInt(3, roomBean.getRoomPrice());
			ad.setString(4, roomBean.getRoomDescription());
			ad.setString(5,"y");
			ad.execute();
//			System.out.println(hotelMap.get("city")+"city in queries");
//			rs.next();
//			int addressId= Integer.parseInt(rs.getString("address_id"));
//			System.out.println("address id is"+addressId);
//			PreparedStatement ps = con.prepareStatement(sql);
//			
//			ps.setString(1, (String) hotelMap.get("hotelName") );
//			ps.setInt(2, addressId);
//			ps.setString(3, (String) hotelMap.get("hotelStar"));
//			ps.setString(4, (String) hotelMap.get("hotelAmenities"));
//			ps.setString(5, "y");
//			ps.execute();
			
		//	flag = ps.execute();// since the execute method will return true if the method is executed successfully
			return hotelId;
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		finally 
		{
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after inserting rooms");
		}
		return 0;
	}
}
