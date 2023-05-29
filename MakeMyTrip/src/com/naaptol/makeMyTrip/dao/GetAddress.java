package com.naaptol.makeMyTrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.naaptol.makeMyTrip.beans.RoomBean;
import com.naaptol.makeMyTrip.utils.MyDbConnection;

public class GetAddress {

	public List getCountry()
	{
		Connection con = null;
		con = MyDbConnection.openConnection();
	   String sql="select distinct country_name from address";
	   ResultSet rs=null;
		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			rs=ps.executeQuery();			

			ArrayList list=new ArrayList();
			while(rs.next())
			{
				list.add(rs.getString("country_name"));
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
	
	public List getStates(String country){
		
		
		Connection con = null;
		con = MyDbConnection.openConnection();
	   String sql="select distinct state_name from address where country_name=?";
	   ResultSet rs=null;
		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, country);
			rs=ps.executeQuery();			

			ArrayList list=new ArrayList();
			while(rs.next())
			{
				list.add(rs.getString("state_name"));
			}
			System.out.println("state list in dao"+list);
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
	
	public List getCities(String state){
		Connection con = null;
		con = MyDbConnection.openConnection();
	   String sql="select distinct city_name from address where state_name=?";
	   ResultSet rs=null;
		try
		{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, state);
			rs=ps.executeQuery();			

			ArrayList list=new ArrayList();
			while(rs.next())
			{
				list.add(rs.getString("city_name"));
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
