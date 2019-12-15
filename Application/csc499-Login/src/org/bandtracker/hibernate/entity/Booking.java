package org.bandtracker.hibernate.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name="Bookings")
@Table(name="Bookings")
public class Booking {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="booking_ID")
	Integer bookingId;
	@Column(name="datetime_of_request")
	String datetimeOfRequest;
	@Column(name="duration_hrs")
	Integer duration;
	@Column(name="requested_datetime")
	String requestedDatetime;
	@Column(name="bar_confirmed")
	Boolean barConfirmed;
	@Column(name="band_confirmed")
	Boolean bandConfirmed;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinTable(name="BandBookings",
	joinColumns=@JoinColumn(name="booking_id", referencedColumnName="booking_id"),
	inverseJoinColumns=@JoinColumn(name="band_id", referencedColumnName="user_id"))
	private User mUser;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinTable(name="ShowBookings",
	joinColumns=@JoinColumn(name="booking_id", referencedColumnName="booking_id"),
	inverseJoinColumns=@JoinColumn(name="show_id", referencedColumnName="show_id"))
	private Show mShow;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinTable(name="TourStops",
	joinColumns=@JoinColumn(name="booking_id", referencedColumnName="booking_id"),
	inverseJoinColumns=@JoinColumn(name="tour_id", referencedColumnName="tour_id"))
	private Tour mTour;
	
	public Booking() {
		
	}
	
	public Booking(String datetimeOfRequest, int duration, String requestedDatetime) {
		super();
		this.datetimeOfRequest = datetimeOfRequest;
		this.duration = duration;
		this.requestedDatetime = requestedDatetime;
		this.barConfirmed = null;
		this.bandConfirmed = null;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
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

	public Boolean getBarConfirmed() {
		return barConfirmed;
	}

	public void setBarConfirmed(Boolean barConfirmed) {
		this.barConfirmed = barConfirmed;
	}

	public Boolean getBandConfirmed() {
		return bandConfirmed;
	}

	public void setBandConfirmed(Boolean bandConfirmed) {
		this.bandConfirmed = bandConfirmed;
	}

	public User getmUser() {
		return mUser;
	}

	public void setmUser(User mUser) {
		this.mUser = mUser;
	}

	public Show getmShow() {
		return mShow;
	}

	public void setmShow(Show mShow) {
		this.mShow = mShow;
	}

	public Tour getmTour() {
		return mTour;
	}

	public void setmTour(Tour mTour) {
		this.mTour = mTour;
	}
	
	
	
}
