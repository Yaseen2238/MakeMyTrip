package com.naaptol.makeMyTrip.helper;

import java.sql.SQLException;
import java.util.Map;

import com.naaptol.makeMyTrip.dao.DbQueries;

public class RegisterHelper {
	 public boolean insertData(Map<String, Object> map) throws SQLException 
	    {
	        boolean flag = true;
	        try 
	        {

	            System.out.println("connection Stablished");
	            flag = DbQueries.insertData(map);
	            return flag;

	        } 
	        catch (Exception e) 
	        {
	            // TODO Auto-generated catch block
	            e.printStackTrace();

	        }

	        return flag;
	    }
}
