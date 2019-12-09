package org.bandtracker.hibernate.entity;

public class Review {

	int reviewId;
	int rating;
	String reviewText;
	String reviewDatetime;
	
	public Review() {
		
	}
	
	public Review(int reviewId, int rating, String reviewText, String reviewDatetime) {
		super();
		this.reviewId = reviewId;
		this.rating = rating;
		this.reviewText = reviewText;
		this.reviewDatetime = reviewDatetime;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public String getReviewDatetime() {
		return reviewDatetime;
	}
	public void setReviewDatetime(String reviewDatetime) {
		this.reviewDatetime = reviewDatetime;
	}
	
	
	
}
