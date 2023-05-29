package com.naaptol.makeMyTrip.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException; // Add import for SQLException
import java.util.ArrayList;

import com.naaptol.makeMyTrip.beans.HotelBean;
import com.naaptol.makeMyTrip.utils.MyDbConnection;

public class DeleteDao {

	public int deleteHotel(int hotelId, String room) {
		Connection con = null;
		con = MyDbConnection.openConnection();
		String deleteQuery;
		if ("All".equals(room)) {
			deleteQuery = "UPDATE hotel_details SET is_active='n' WHERE hotel_id=?";
			System.out.println("in delete room query: " + hotelId);
		} else {
			deleteQuery = "UPDATE rooms SET is_active='n' WHERE room_type=? AND hotel_id=?";
			System.out.println("in delete hotel query: " + hotelId + " " + room);
		}

		try {
			PreparedStatement ps = con.prepareStatement(deleteQuery);
			if ("All".equals(room)) {
				ps.setInt(1, hotelId);
			} else {
				ps.setString(1, room);
				ps.setInt(2, hotelId);
			}
			return ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			MyDbConnection.closeConnection(con);
			System.out.println("connection closed after deleting hotel ");
		}
		return 0;
	}
}
