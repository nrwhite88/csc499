package org.bandtracker.entity;

public class Show {

	int showId;
	String startDatetime;
	String endDatetime;
	
	public Show() {
		
	}
	
	public Show(int showId, String startDatetime, String endDatetime) {
		this.showId = showId;
		this.startDatetime = startDatetime;
		this.endDatetime = endDatetime;
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
	
	
	
}
