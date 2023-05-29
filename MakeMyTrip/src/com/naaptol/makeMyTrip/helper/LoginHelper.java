package com.naaptol.makeMyTrip.helper;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import com.naaptol.makeMyTrip.dao.DbQueries;

public class LoginHelper {
    public String[] checkdata(String email, String password) throws SQLException 
    {
        String enteredEmail = email;
        String enteredPassword = password;
        String dbPassword = null;
        String dbEmail = "";
        String dbFname = null;
        String userType=null;
        int userId=0;
        String arr[]=new String[3];
        Connection con = null;
        ArrayList<String> al = new ArrayList();

        try 
        {

            System.out.println("entered pss" + enteredPassword);
            al.addAll(DbQueries.loginCheck(enteredEmail, enteredPassword));
            if(al!=null)
            {
            dbFname = al.get(0);
            dbEmail = al.get(1);
            dbPassword = al.get(2);
            userType=al.get(3);
            userId=Integer.parseInt(al.get(4));
            al.trimToSize();
            System.out.println("db pass after .next()" + dbPassword);
            System.out.println("entered pss before checking" + enteredPassword);
            System.out.println("db pss before checking" + dbPassword);
            if (enteredPassword.equals(dbPassword)) 
            {
            
            		
            		arr[0]=dbFname;
            		arr[1]=userType;
            		arr[2]=String.valueOf(userId);
            
            		
        
                System.out.println("entered pss" + enteredPassword);
                System.out.println("db mail" + dbEmail);
                System.out.println("db fname when true " + dbFname);
        		return arr;    
              
            }
            System.out.println("entered mai" + email);
            System.out.println("entered password" + password);

        }
        
        }
        catch (Exception e)
         {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }
}
