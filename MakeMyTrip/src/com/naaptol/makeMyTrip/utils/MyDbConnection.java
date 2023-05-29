package com.naaptol.makeMyTrip.utils;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyDbConnection 
{
public static Connection openConnection()
{
	Connection con=null;
	String driver ="com.mysql.jdbc.Driver";
	try
    {
	Class.forName(driver);
	  con=DriverManager.getConnection("jdbc:mysql://192.168.57.5:3306/NT007","syed.yaseen","JrKg5*IN");
	  
	}
	catch(Exception e)
    {
		e.printStackTrace();
	}
	return con;
}
public static void closeConnection(Connection con)
{
if(con!=null)
{
	try 
    {
		con.close();
	} 
    catch (SQLException e) 
    {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
}
}
