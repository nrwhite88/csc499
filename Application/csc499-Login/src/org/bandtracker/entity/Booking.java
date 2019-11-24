package org.bandtracker.entity;

import java.time.LocalDateTime;

public class Booking {

	int bookingId;
	Boolean confirmed;
	String datetimeOfRequest;
	int duration;
	String requestedDatetime;
	
	public Booking() {
		
	}
	
	public Booking(String datetimeOfRequest, int duration, String requestedDatetime) {
		super();
		this.datetimeOfRequest = datetimeOfRequest;
		this.duration = duration;
		this.requestedDatetime = requestedDatetime;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}

	public Boolean getConfirmed() {
		return confirmed;
	}

	public void setConfirmed(Boolean confirmed) {
		this.confirmed = confirmed;
	}

	public String getDatetimeOfRequest() {
		return datetimeOfRequest;
	}

	public void setDatetimeOfRequest(String datetimeOfRequest) {
		this.datetimeOfRequest = datetimeOfRequest;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public String getRequestedDatetime() {
		return requestedDatetime;
	}

	public void setRequestedDatetime(String requestedDatetime) {
		this.requestedDatetime = requestedDatetime;
	}
	

	
}
