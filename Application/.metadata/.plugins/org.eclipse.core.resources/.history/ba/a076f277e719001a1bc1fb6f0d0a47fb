package org.bandtracker.hibernate.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="Users")
@Table(name="Users")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="user_ID")
	private Integer userId;
	@Column(name="username")
	private String username;
	@Column(name="user_type")
	private String userType;
	@Column(name="is_admin")
	private Boolean isAdmin;
	@Column(name="public_name")
	private String publicName;
	@Column(name="first_name")
	private String firstName;
	@Column(name="last_name")
	private String lastName;
	@Column(name="street_address")
	private String streetAddress;
	@Column(name="town")
	private String town;
	@Column(name="zip_code")
	private String zipCode;
	@Column(name="email")
	private String email;
	@Column(name="phone")
	private Integer phone;
	@Column(name="website_URL")
	private String websiteURL;
	@Column(name="password")
	private String password;
	@Column(name="bio")
	private String bio;
	@Column(name="state")
	private String state;
	

	@OneToMany(fetch=FetchType.LAZY, mappedBy="mUser")
	private List<Booking> bookings;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mUser")
	private List<Show> shows;
	
	public User() {

	}
	
	public User(String username, String password) {
		this.username = username;
		this.password = password;
	}
	

	public User(String username, String password, String userType, String publicName, String firstName, String lastName,
			String streetAddress, String town, String zipCode, String email, int phone) {
		this.username = username;
		this.password = password;
		this.userType = userType;
		this.publicName = publicName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.streetAddress = streetAddress;
		this.town = town;
		this.zipCode = zipCode;
		this.email = email;
		this.phone = phone;
	}

	public User(int userId, String username, String userType, Boolean isAdmin, String publicName, String firstName,
			String lastName, String streetAddress, String town, String zipCode, String email, int phone,
			String websiteURL, String password, String bio) {
		super();
		this.userId = userId;
		this.username = username;
		this.userType = userType;
		this.isAdmin = isAdmin;
		this.publicName = publicName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.streetAddress = streetAddress;
		this.town = town;
		this.zipCode = zipCode;
		this.email = email;
		this.phone = phone;
		this.websiteURL = websiteURL;
		this.password = password;
		this.bio = bio;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Boolean getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(Boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	public String getPublicName() {
		return publicName;
	}

	public void setPublicName(String publicName) {
		this.publicName = publicName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getWebsiteURL() {
		return websiteURL;
	}

	public void setWebsiteURL(String websiteURL) {
		this.websiteURL = websiteURL;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}
	
	
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public Boolean isEmpty() {
		if (username.isEmpty()) {
			return true;
		}
		else {
			return false;
		}
	}
	
	@Override
	public String toString() {
		return "User [userId=" + userId + ", username=" + username + ", userType=" + userType + ", isAdmin=" + isAdmin
				+ ", publicName=" + publicName + ", firstName=" + firstName + ", lastName=" + lastName
				+ ", streetAddress=" + streetAddress + ", town=" + town + ", zipCode=" + zipCode + ", email=" + email
				+ ", phone=" + phone + ", websiteURL=" + websiteURL + ", password=" + password + ", bio=" + bio + "]";
	}

}
