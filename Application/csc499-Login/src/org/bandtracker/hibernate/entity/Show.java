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

@Entity(name="Shows")
@Table(name="Shows")
public class Show {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="show_ID")
	int showId;
	@Column(name="start_datetime")
	String startDatetime;
	@Column(name="end_datetime")
	String endDatetime;
	@Column(name="show_name")
	String showName;
	@Column(name="show_description")
	String showDescription;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinTable(name="ShowVenues",
	joinColumns=@JoinColumn(name="show_id", referencedColumnName="show_id"),
	inverseJoinColumns=@JoinColumn(name="bar_id", referencedColumnName="user_id"))
	private User mUser;
	
	@ManyToMany(mappedBy="mShows")
	private List<Tour> tours;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mShow")
	private List<Booking> bookings;
	
	public Show() {
		
	}
	
	public Show(String startDatetime, String endDatetime) {
		this.startDatetime = startDatetime;
		this.endDatetime = endDatetime;
	}
	
	public Show(String startDatetime, String endDatetime, String showName, String showDescription) {
		this.startDatetime = startDatetime;
		this.endDatetime = endDatetime;
		this.showName = showName;
		this.showDescription = showDescription;
	}
	
	public int getShowId() {
		return showId;
	}
	public void setShowId(int showId) {
		this.showId = showId;
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
	

	public String getShowName() {
		return showName;
	}

	public void setShowName(String showName) {
		this.showName = showName;
	}

	public String getShowDescription() {
		return showDescription;
	}

	public void setShowDescription(String showDescription) {
		this.showDescription = showDescription;
	}

	public User getmUser() {
		return mUser;
	}

	public void setmUser(User mUser) {
		this.mUser = mUser;
	}

	@Override
	public String toString() {
		return "Show [showId=" + showId + ", startDatetime=" + startDatetime + ", endDatetime=" + endDatetime + "]";
	}
	
	
}
