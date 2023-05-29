package com.naaptol.makeMyTrip.beans;

public class HotelBookingBean {
private int user_id;
private int numberOfGuests;
private String checkInDate;
private String checkOutDate;
private int bookingId;
private int hotel_id;
public int getHotel_id() {
	return hotel_id;
}
public void setHotel_id(int hotel_id) {
	this.hotel_id = hotel_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public int getNumberOfGuests() {
	return numberOfGuests;
}
public void setNumberOfGuests(int numberOfGuests) {
	this.numberOfGuests = numberOfGuests;
}
public String getCheckInDate() {
	return checkInDate;
}
public void setCheckInDate(String checkInDate) {
	this.checkInDate = checkInDate;
}
public String getCheckOutDate() {
	return checkOutDate;
}
public void setCheckOutDate(String checkOutDate) {
	this.checkOutDate = checkOutDate;
}
public int getBookingId() {
	return bookingId;
}
public void setBookingId(int bookingId) {
	this.bookingId = bookingId;
}

}
