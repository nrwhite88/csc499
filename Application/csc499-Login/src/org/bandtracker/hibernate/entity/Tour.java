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
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="Tours")
@Table(name="Tours")
public class Tour {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="tour_ID")
	int tourId;
	@Column(name="start_datetime")
	String startDatetime;
	@Column(name="end_datetime")
	String endDatetime;
	@Column(name="tour_name")
	String tourName;
	@Column(name="tour_description")
	String tourDescription;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinTable(name="BandTours",
	joinColumns=@JoinColumn(name="tour_id", referencedColumnName="tour_id"),
	inverseJoinColumns=@JoinColumn(name="band_id", referencedColumnName="user_id"))
	private User mUser;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mTour")
	private List<Booking> bookings;
	
	public Tour() {
		
	}

	public Tour(String startDatetime, String endDatetime, String tourName, String tourDescription) {
		this.startDatetime = startDatetime;
		this.endDatetime = endDatetime;
		this.tourName = tourName;
		this.tourDescription = tourDescription;
	}

	public int getTourId() {
		return tourId;
	}

	public void setTourId(int tourId) {
		this.tourId = tourId;
	}

	public String getStartDatetime() {
		return startDatetime;
	}

	public void setStartDatetime(String startDatetime) {
		this.startDatetime = startDatetime;
	}

	public String getEndDatetime() {
		return endDatetime;
	}

	public void setEndDatetime(String endDatetime) {
		this.endDatetime = endDatetime;
	}

	public String getTourName() {
		return tourName;
	}

	public void setTourName(String tourName) {
		this.tourName = tourName;
	}

	public String getTourDescription() {
		return tourDescription;
	}

	public void setTourDescription(String tourDescription) {
		this.tourDescription = tourDescription;
	}

	public User getmUser() {
		return mUser;
	}

	public void setmUser(User mUser) {
		this.mUser = mUser;
	}

	public List<Booking> getBookings() {
		return bookings;
	}

	public void setBookings(List<Booking> bookings) {
		this.bookings = bookings;
	}

	
	
}
