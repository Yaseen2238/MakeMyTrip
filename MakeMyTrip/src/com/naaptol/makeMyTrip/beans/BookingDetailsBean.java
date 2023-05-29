package com.naaptol.makeMyTrip.beans;

public class BookingDetailsBean {
long bookingId;
long userId;
public long getUserId() {
	return userId;
}
public void setUserId(long userId) {
	this.userId = userId;
}
String hotelName;
String city;
String state;
String roomType;
int pricePerNight;
int numberOfGuest;
String checkIn;
String checkOut;
int roomId;

public int getRoomId() {
	return roomId;
}
public void setRoomId(int roomId) {
	this.roomId = roomId;
}
public long getBookingId() {
	return bookingId;
}
public void setBookingId(long bookingId) {
	this.bookingId = bookingId;
}
public String getHotelName() {
	return hotelName;
}
public void setHotelName(String hotelName) {
	this.hotelName = hotelName;
}
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public String getRoomType() {
	return roomType;
}
public void setRoomType(String roomType) {
	this.roomType = roomType;
}
public int getPricePerNight() {
	return pricePerNight;
}
public void setPricePerNight(int pricePerNight) {
	this.pricePerNight = pricePerNight;
}
public int getNumberOfGuest() {
	return numberOfGuest;
}
public void setNumberOfGuest(int numberOfGuest) {
	this.numberOfGuest = numberOfGuest;
}
public String getCheckIn() {
	return checkIn;
}
public void setCheckIn(String checkIn) {
	this.checkIn = checkIn;
}
public String getCheckOut() {
	return checkOut;
}
public void setCheckOut(String checkOut) {
	this.checkOut = checkOut;
}

}
